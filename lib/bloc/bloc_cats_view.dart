import 'package:bloc_flutter/bloc/bloc_cubit.dart';
import 'package:bloc_flutter/bloc/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockCatsView extends StatefulWidget {
  const BlockCatsView({super.key});

  @override
  State<BlockCatsView> createState() => _BlockCatsViewState();
}

class _BlockCatsViewState extends State<BlockCatsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CatsCubit>().getCats(); //**** */
          },
          child: const Icon(Icons.install_desktop),
        ),
        appBar: AppBar(title: const Text("Hello")),
        body: BlocConsumer<CatsCubit, CatsState>(
          listener: (context, state) {
            if (state is CatsError) {
              //state çalışırken herhangibir and error gelirse
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 3),
              ));
            }
          },
          builder: (context, state) {
            if (state is CatsInitial) {
              return const Center(child: Text("hello again"));
            } else if (state is CatsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CatsCompleted) {
              ListView.builder(
                itemBuilder: (context, index) => Text(
                  state.response[index],
                ),
                itemCount: state.response.length,
              );
            } else {
              final error = state as CatsError;
              return Text(error.message);
            }
            return const Text("Default condition");
          },
        ),
      );
}
