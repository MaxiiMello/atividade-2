class Dados {
  double _distancia = 0.0;
  double _preco = 0.0;
  double _consumo = 0.0;
  double _velocidade = 0.0;
  

  double get distancia => _distancia;
  double get preco => _preco;
  double get consumo => _consumo;
  double get velocidade => _velocidade;

  set distancia(double valor) {
    if (valor >= 0) {
      _distancia = valor;
    }
  }
  set preco(double valor) {
    if (valor >= 0) {
      _preco = valor;
    }
  }
  set consumo(double valor) {
    if (valor > 0) {
      _consumo = valor;
    }
  }
  set velocidade(double valor) {
    if (valor > 0) {
      _velocidade = valor;
    }
  }

  double get custo => (consumo != 0) ? (distancia / consumo) * preco : 0.0;
  double get tempo_horas => (velocidade != 0) ? distancia / velocidade : 0.0;

}
