# Stage 1 — Builder
FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --production=false

COPY . .
RUN npm run build

# Stage 2 — Runtime
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --production=true

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
#COPY --from=builder /app/next.config.js ./next.config.js
COPY --from=builder /app/node_modules ./node_modules

RUN addgroup -S app && adduser -S -G app app
USER app

EXPOSE 3000
ENV PORT=3000
CMD ["npm", "run", "start"]

