import "package:Tmiffilu_Zakker/Tmiffilu_Zakker.dart";

class Tmiffilu{
  Tmiffilu(String str){}
  TmiSVG toSVG(){}
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
  TmiSVG toSVG(){}
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
  TmiSVG toSVG(){}
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
  int length;
  Tmiffilu_Akeril(String init){
    List<String> eril;
    this._tmiffilu = eril.map((String str)=>Tmiffilu(str)).toList();
    this.length = this._tmiffilu.length;
  }
  Tmiffilu_Akeril.withList(List<String> akl){
    this._tmiffilu = akl.map((String str)=>Tmiffilu(str)).toList();
    this.length = this._tmiffilu.length;
  }
  void addTmiffilu(Tmiffilu tmi){
    this._tmiffilu.add(tmi);
  }
}
class Tmiffilu_Akeril{
  List<Tmiffilu_Luux> _tmLuux;
  Tmiffilu_Akeril(String init){
  }
}
