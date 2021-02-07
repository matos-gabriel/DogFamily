import 'package:dogfamily/data/data.dart';
import 'package:dogfamily/models/anuncio.dart';
import 'package:dogfamily/models/usuario.dart';
import 'package:dogfamily/widgets/anuncios_caes.dart';
import 'package:dogfamily/widgets/barra_filtro_raca.dart';
import 'package:flutter/material.dart';
import 'package:dogfamily/widgets/drawer_customizado.dart';
import 'package:dogfamily/widgets/botao_anunciar_cao.dart';

class TelaFeed extends StatefulWidget {
  //Dados mockados
  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  List<Anuncio> anuncios = ANUNCIOS_DETALHES;

  void addAnuncio(Anuncio anuncio) {
    setState(() {
      anuncios.add(anuncio);
    });
  }

  void salvarContaUsuario() {
    print("coisou");
  }

  @override
  Widget build(BuildContext context) {
    print("${anuncios.length} inicial");
    return Scaffold(
      drawer: CustomDrawerWidget(salvarContaUsuario),
      appBar: AppBar(
        title: Text("Dog Family"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            _buildFirstLayer(context),
            BotaoAnunciarCao(addAnuncio)
          ],
        ),
      ),
    );
  }

  Widget _buildFirstLayer(BuildContext context) {
    return Column(
      children: <Widget>[BarraFiltroRaca(), AnunciosCaes(anuncios)],
    );
  }
}
