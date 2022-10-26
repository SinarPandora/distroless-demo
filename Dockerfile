FROM gradle:7.5.1-jdk17 as build

WORKDIR /workspace

COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY src src

RUN gradle build bootJar

FROM gcr.io/distroless/java17:latest as runtime

USER nonroot:nonroot

COPY --from=build --chown=nonroot:nonroot /workspace/build/libs/demo-0.0.1.jar /app/demo-0.0.1.jar

EXPOSE 8080

ENV _JAVA_OPTIONS "-Dfile.encoding=UTF-8 \
-Dspring.output.ansi.enabled=ALWAYS \
-Dspring.profiles.active=default"

ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1.jar"]
