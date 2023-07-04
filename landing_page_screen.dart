import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filesundefined/index.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({
    required LandingPageBloc landingPageBloc,
    Key? key,
  })  : _landingPageBloc = landingPageBloc,
        super(key: key);

  final LandingPageBloc _landingPageBloc;

  @override
  LandingPageScreenState createState() {
    return LandingPageScreenState();
  }
}

class LandingPageScreenState extends State<LandingPageScreen> {
  LandingPageScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageBloc, LandingPageState>(
        bloc: widget._landingPageBloc,
        builder: (
          BuildContext context,
          LandingPageState currentState,
        ) {
          if (currentState is UnLandingPageState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorLandingPageState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is InLandingPageState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._landingPageBloc.add(LoadLandingPageEvent());
  }
}
