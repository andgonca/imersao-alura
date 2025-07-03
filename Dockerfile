
# Use uma imagem oficial do Python como imagem pai. A tag 'slim' é uma boa escolha para produção.
FROM python:3.11-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala os pacotes necessários definidos em requirements.txt
# --no-cache-dir: Desativa o cache, o que reduz o tamanho da imagem.
# -r requirements.txt: Instala os pacotes a partir do arquivo de requisitos.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Disponibiliza a porta 8000 para o mundo fora deste contêiner
EXPOSE 8000

# Executa app.py quando o contêiner for iniciado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# --reload: Habilita o recarregamento automático do servidor quando mudanças são detectadas.