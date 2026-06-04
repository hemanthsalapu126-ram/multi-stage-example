# Build Stage
FROM eclipse-temurin:8-jdk AS builder

WORKDIR /app/source

COPY . .

RUN javac HelloWorld.java

# Runtime Stage
FROM eclipse-temurin:8-jre

WORKDIR /app

COPY --from=builder /app/source/HelloWorld.class .

CMD ["java", "HelloWorld"]
