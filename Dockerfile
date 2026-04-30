# ============================================================
# Dockerfile
# App Type: Docker Compose → nginx serving static HTML
#
# What this file does:
#   - Pulls the official nginx image (lightweight, secure)
#   - Copies your app files into nginx's web root
#   - Copies a custom nginx config for proper routing
#   - Opens port 80 for traffic
# ============================================================

FROM nginx:1.25-alpine
# Using 'alpine' variant: much smaller image (~23MB vs ~187MB)
# Using a pinned minor version (1.25) instead of 'latest'
# so your builds are reproducible and predictable.

# Copy app source files into nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Copy custom nginx config (handles health check route + gzip)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (nginx default)
EXPOSE 80

# nginx starts automatically — no CMD needed when using official image
