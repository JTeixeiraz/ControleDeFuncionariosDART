import 'dart:io';

void main(List<String> arguments) {
  print('Seja bem vinda empresa!');
  bool sair = false;
  Empresa emp = Empresa();
  try {
    while (!sair) {
    print("Oque deseja fazer? \n1-Adicionar funcionario \n2-Exibir todos os funcionarios \n3-Exibir funcionario expecifico \n4-Remover funcionario \n5-Verificar id \n6-sair");
    String? escolha = stdin.readLineSync()??"";
    switch (escolha) {
      case "1":
        emp.adicionarFuncionario();
        break;
      case '2':
      emp.exibirFuncionariosGerais();
        break;
        case '3':
      emp.exibirFuncionarioExpecifico();
        break;
        case '4':
      emp.removerFuncionario();
        break;
        case '5':
      emp.verificarIdDoUsuario();
        break;
        case '6':
        sair = true;
        break;
      default:
      print('Valor invalido');
      break;
    }
  }
  } catch (e) {
    rethrow;
  }
}

class Empresa {
  List<String> lista = [];
  void adicionarFuncionario() {
    Funcionario f = Funcionario();
    print('Nome do funcionario:');
    String? name = stdin.readLineSync()?.toUpperCase() ?? "";
    f.setNome = name;
    lista.add(name);
    print('Usuario adicionado com o id: ${lista.length - 1}');
    print('Cargo do funcionario:');
    String? cargo = stdin.readLineSync() ?? "";
    f.setCargo = cargo;
    print('Adicione o salario:');
    String? salario = stdin.readLineSync() ?? "";
    double valsalario = double.parse(salario);
    f.setSalario = valsalario;
    print('Salario adicionado');
  }

  void exibirFuncionariosGerais() {
    print('Id: - Nome:');
    for (var i = 0; i < lista.length; i++) {
      print('$i - ${lista[i]}');
    }
  }

  void verificarIdDoUsuario(){
    print('Digite o nome do usuario que você deseja procurar: ');
    String? nameFuncio = stdin.readLineSync()?.toUpperCase() ??"";
    for (var i = 0; i < lista.length-1; i++) {
      lista[i];
      if (lista[i]==nameFuncio) {
        print('O id do funcionario $nameFuncio é: $i');
      }
    }
  }

  void exibirFuncionarioExpecifico() {
    print('Qual o id do usuario que quer adicionar?');
    String? position = stdin.readLineSync() ??"";
    int valPo = int.parse(position);
    print('O usuario correspondente ao id $valPo ${lista[valPo]}');
  }

  void removerFuncionario(){
    print('Qual o id do funcionario que deseja remover?');
    String? position = stdin.readLineSync() ??"";
    int valPo = int.parse(position);
    String valorLista = lista[valPo];
    print('O funcionario ${lista[valPo]} foi removido da empresa.');
    print('Atenção! verificiar o id dos usuarios novamente pois com a remoção de um usuario o id de todos os outros funcionarios são alterados!');
    lista.remove(valorLista);
  }
}

class Funcionario {
  late final int _id;
  late final String _nome;
  late final String _cargo;
  late final double _salario;

  get getSalario => _salario;
  get getId => _id;
  get getNome => _nome;
  get getCargo => _cargo;

  set setNome(String nome) {
    _nome = nome;
  }

  set setCargo(String cargo) {
    _cargo = cargo;
  }

  set setSalario(double salario) {
    _salario = salario;
  }

  void aumentarSalario(double aumento) {
    _salario = _salario * aumento;
  }

  void exibirInfo() {
    print("Id: $getId \nNome: $getNome \nCargo: $getCargo \nSalario: $getSalario");
  }
}
