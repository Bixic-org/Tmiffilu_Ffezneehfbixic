class Tmiffilu{
  Tmiffilu(String str){}
  void toSVG(){}
  bool isEmpty(){
    return true;
  }
  bool isLuxore(){
    return false;
  }
}
class Tmiffilu_Aku extends Tmiffilu{
  Tmiffilu_Aku(String str){}
  @Override
  void toSVG(){}
  @Override
  bool isEmpty(){
    return false;
  }
  @Override
  bool isLuxore(){
    return false;
  }
}
class Luxore extends Tmiffilu{
  int _luxoreKind;//2 or 3
  Luxore(String str){
  }
  @Override
  void toSVG(){}
  @Override
  bool isEmpty(){
    return false;
  }
  @Override
  bool isLuxore(){
    return true;
  }
}
class Tmiffilu_Luux{
  List<Tmiffilu> _tmiffilu;
  Tmiffilu_Akeril(String init){
    List<String> eril;
    this._tmiffilu = eril.map((String str)=>Tmiffilu(str)).toList();
  }
  Tmiffilu_Akeril.withList(List<String> akl){
    this._tmiffilu = akl.map((String str)=>Tmiffilu(str)).toList();
  }
}
class Tmiffilu_Akeril{
  List<Tmiffilu_Luux> _tmLuux;
  Tmiffilu_Akeril(String init){
  }
}