import 'package:flutter/foundation.dart';

abstract class CatsState {
  const CatsState();
}

class CatsInitial extends CatsState {
  const CatsInitial();
}

class CatsLoading extends CatsState {
  const CatsLoading(); //sadece ekranın loading olduğunu haber vermek için kullanıyorum
}

class CatsCompleted extends CatsState {
  //istek başarılı olduğu durumu
  final List<String> response;

  const CatsCompleted(this.response); //responsun verilmiş olmasını bekliyorum

}

class CatsError extends CatsState {
  final String message;

  const CatsError(this.message);
}
