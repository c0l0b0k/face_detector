# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Python-библиотеки
RUN pip install opencv-python-headless

# Копируем файл с кодом в контейнер
COPY . /app

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем модель каскада для распознавания лиц
COPY haarcascade_frontalface_default.xml /app/haarcascade_frontalface_default.xml

# Команда для запуска скрипта
CMD ["python", "face_detector.py"]
