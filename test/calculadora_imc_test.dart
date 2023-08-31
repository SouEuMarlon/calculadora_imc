import 'package:calculadora_imc/class/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Pessoa', () {
    test('Cálculo de IMC com altura válida', () {
      final pessoa = Pessoa('Person', 70, 1.75);
      expect(pessoa.calcImcExpression(), closeTo(22.86, 0.01));
    });

    test('Cálculo de IMC com altura zero', () {
      final pessoa = Pessoa('Person', 70, 0);
      expect(() => pessoa.calcImcExpression(), throwsException);
    });

    test('Status corporal Saudável', () {
      final pessoa = Pessoa('Person', 70, 1.75);
      expect(pessoa.getStatusCorporal(22.86), equals('Saudável'));
    });

    test('Status corporal Obesidade grau 2', () {
      final pessoa = Pessoa('Person', 100, 1.65);
      expect(
          pessoa.getStatusCorporal(36.73), equals('Obesidade grau 2 (Severa)'));
    });
  });
}
