
# agencia_de_viagens

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Agência de Viagens

Aplicativo Flutter simples para gerenciar destinos de viagem. Permite listar, cadastrar, editar e excluir destinos, cada um com país e tipo de passeio.

## Funcionalidades

- **Listar** os destinos cadastrados
- **Cadastrar** um novo destino pelo botão `+`
- **Editar** um destino tocando nele na lista
- **Excluir** um destino pelo ícone de lixeira, com diálogo de confirmação
- **Validação** dos campos: não permite salvar com algum campo vazio

## Campos de um destino

| Campo | Exemplo |
|-------|---------|
| Destino | Xique-Xique |
| País | Brasil |
| Tipo de passeio | City Tour |

## Estrutura do projeto

```
lib/
├── main.dart                    # App, tela de listagem e dados iniciais
└── cadastro_destino_page.dart   # Tela de cadastro e edição
```

## Como executar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Um emulador, dispositivo físico ou navegador configurado

### Passos

```bash
# clone o repositório
git clone https://github.com/seu-usuario/seu-repo.git

# entre na pasta do projeto
cd seu-repo

# instale as dependências
flutter pub get

# execute o app
flutter run
```

## Observações

- Os dados ficam apenas **em memória**: ao fechar o app, as alterações são perdidas.
- O projeto usa `Map<String, String>` para representar cada destino. Uma evolução natural seria criar uma classe `Destino` e salvar os dados com `shared_preferences`, SQLite ou Firebase.

## Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- Material Design

## Licença

Projeto de estudo, sem licença definida.
>>>>>>> 35ba13cdcddb065bb518008c6d53f2a55a515d8b
