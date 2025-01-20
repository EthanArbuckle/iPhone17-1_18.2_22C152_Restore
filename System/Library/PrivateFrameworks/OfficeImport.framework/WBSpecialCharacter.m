@interface WBSpecialCharacter
+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 specialCharacter:(id)a7;
@end

@implementation WBSpecialCharacter

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 specialCharacter:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v18 = a3;
  id v11 = a6;
  id v12 = a7;
  var4 = a5->var4;
  var5 = a5->var5;
  v15 = [v11 document];
  v16 = [v12 properties];
  +[WBCharacterProperties readFrom:v18 wrdProperties:var4 tracked:var5 document:v15 properties:v16];

  v17 = objc_msgSend(v18, "readCharactersFrom:to:textType:", v10, (v10 + 1), objc_msgSend(v11, "textType"));
  objc_msgSend(v12, "setCharacterType:", objc_msgSend(v17, "characterAtIndex:", 0));
}

@end