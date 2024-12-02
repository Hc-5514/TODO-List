# todo_list_config/DDockerfile

# OpenJDK 17 슬림 버전 사용
FROM openjdk:17-jdk-slim

# 작업 디렉토리 설정
WORKDIR /app

# 시간대 설정
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && echo "Asia/Seoul" > /etc/timezone

# 애플리케이션 JAR 파일 복사
ARG JAR_FILE=build/libs/todo_list-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} todo_list.jar

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "todo_list.jar"]