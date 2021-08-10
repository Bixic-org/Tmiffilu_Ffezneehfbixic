import "dart:io";
import "dart:svg";

import "package:archive/archive.dart";
import "package:archive/archive_io.dart";

//load zip file -> decode zip -> decode svg -> get glyph data
class TmiGlyphSet{
  TmiGlyphSet.loadDefault(){
    Strng filePath = "/zakkeruyar.iccf";
    String baseDir = Directory.current.path;
    FontLoader fontLoader = FontLoader();
    TmiFont font = fontLoader.loadFromLocal(baseDir + filePath);
  }
  TmiGlyphSet.loadFromFonts(TmiFont ft){}
}
class TmiFont{
  String fontName;
  String fileName;
  String langname;
  String scriptName;
  File fontFile;
  List<FontCateg> categories;
  TmiFont(String fontName, String fileName, String langname, String scriptName, File fontFile){
    this.fontName = fontName;
    this.fileName = fileName;
    this.langname = langname;
    this.scriptName = scriptName;
    this.fontFile = fontFile;
  }
  void addCateg(FontCateg categ){
    categories.add(categ);
  }
}
class FontCateg{
  String categName;
  String dirName;
  List<TmiGlyph> glyphs;
  FontCateg(String categName, String dirName){
    this.categName = categName;
    this.dirName = dirName;
    this.glyphs = List<TmiGlyph>();
  }
  void addGlyph(TmiGlyph glyph){
    glyphs.add(glyph);
  }
}
class TmiGlyph{
}
class FontLoader{
  bool isLoaderLauched;
  bool isFileLoaded;
  bool isGotArchive;
  bool hasSpecFile;
  FontLoader(){
    isLoaderLauched = true;
    isFileLoaded = false;
    isGotArchive = false;
    hasSpecFile = false;
  }
  TmiFont loadFromFile(File file){
    Uint8List bytes = file.readAsBytesSync();
    InputStream stream = InputStream(bytes);
    ZipDecoder zip = ZipDecoder();
    Archive archive = zip.decodeBuffer(stream);
    TmiFont font;
    archive.forEach((ArchiveFile file){
      if(file.isFile){
        if(file.name == "fontspec.csdd"){
          font = this._loadSpec(file);
        }
      }
    });
    archive.forEach((ArchiveFile file){
    });
  }
  TmiFont loadFromLocal(String path){
    File file = File(path);
    return this.loadFromFile(file);
  }
  TmiFont loadFromURI(String url){}
  TmiFont _loadSpec(ArchiveFile file){
  }
}
class TmiSVG{
  CanvasPointer basePoint;
  bool _isRoot;
  bool _isEndChild;
  bool _haveChildren;
  bool _isLoaded;
  List<TmiSVG> children;
  TmiSVG(){}
  TmiSvg.create(){}
  void setStateRoot(){
    this._isRoot = true;
  }
  void addChild(TmiSVG child, CanvasPointer offset){
    child.basePoint.offset(offset);
    children.add(child);
    this._haveChildren = true;
    this._isEndChild = false;
  }
  String bake(){}
}
class CanvasPointer{
  int _x;
  int _y;
  CanvasPointer(int x, int y){
    this._x = x;
    this._y = y;
  }
  void offset(CanvasPointer offset){
    this._x += offset.getX();
    this._y += offset.getY();
  }
  int getX(){
    return this._x;
  }
  int getY(){
    return this._y;
  }
}

class PageAkl extends TmiSVG{
  PageConf _conf;
  PageAkl(PageConf conf){
    super.create();
    super.setStateRoot();
    this._conf = conf;

  }
}

class PageConf{
  double _width;
  double _height;
  double _margin_left;
  double _margin_right;
  double _margin_top;
  double _margin_bottom;
  double _line_height;
  double _line_spacing;
  PageConf(double width, double height, double margin_left, double margin_right, double margin_top, double margin_bottom, double line_height, double line_spacing){
    this._width = width;
    this._height = height;
    this._margin_left = margin_left;
    this._margin_right = margin_right;
    this._margin_top = margin_top;
    this._margin_bottom = margin_bottom;
    this._line_height = line_height;
    this._line_spacing = line_spacing;
  }
}