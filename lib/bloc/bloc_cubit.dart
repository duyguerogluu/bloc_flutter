import 'package:bloc_flutter/bloc/cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(const CatsInitial());

  Future<void> getCats() async {
    try {
      emit(const CatsLoading()); //şuan Loadingte olduğunu emit ediyorum
      await Future.delayed(const Duration(
          milliseconds:
              500)); //burda 500 milisaniye bekliyor ve sonra cevabı alıyor
      final response = await Future.value(
          ["a", "b"]); //cevabı aldığı yer burası bir string list
      emit(CatsCompleted(response)); // artık cevabın geldiğini haber veriyorum.
    } catch (e) {
      emit(const CatsError("Failed to get fetch response"));
    }
  }
}
