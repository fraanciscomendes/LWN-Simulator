# 1. Use a full Go environment (no 'alpine' or 'slim' variants)
FROM golang:1.21

# 2. Install the 'statik' tool needed by this specific project
RUN go install github.com/rakyll/statik@latest

# 3. Set the working directory
WORKDIR /app

# 4. Copy everything from your computer into the container
COPY . .

# 5. Download dependencies and build the app directly in this folder
RUN make install-dep
RUN make build

# 6. Open the ports for the Web UI
EXPOSE 8000 8001

# 7. Run the binary (pointing to its location in the bin folder)
CMD ["./bin/lwnsimulator"]