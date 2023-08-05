import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/internet_bloc/internet_bloc.dart';
import 'package:state_management/bloc/internet_bloc/internet_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("STATE MANAGEMENT"),
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Disconnected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text("CONNECTED");
              } else if (state is InternetLostState) {
                return const Text("NOT CONNECTED");
              } else {
                return const Text("...Loading!!");
              }
            },
          ),

          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetGainedState) {
          //       return const Text("CONNECTED");
          //     } else if (state is InternetLostState) {
          //       return const Text("NOT CONNECTED");
          //     } else {
          //       return const Text("...Loading!!");
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
