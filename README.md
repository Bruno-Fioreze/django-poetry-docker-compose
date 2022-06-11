# Exemplo de como rodar uma aplicação django utilizando poetry e um container docker.

# Comandos úteis Poetry

```python
  
  # como exportar um arquivo com as dependências
  poetry export -f requirements.txt --output requirements.txt
  
  # como instalar as dependências usando um arquivo
  poetry add $( cat requirements.txt )
  
  #como adicionar uma dependência
  poetry add django
  
  #como criar um projeto django com o poetry
  poetry run django-admin startproject project .
  
  #como criar um app django com o poetry
  poetry run python manage.py startapp example
```

