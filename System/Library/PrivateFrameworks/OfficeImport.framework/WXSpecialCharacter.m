@interface WXSpecialCharacter
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXSpecialCharacter

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  v8 = [v7 WXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "separator");

  if (v9)
  {
    uint64_t v10 = 3;
  }
  else
  {
    v11 = [v7 WXMainNamespace];
    uint64_t v12 = OCXFindChild(a3, v11, "continuationSeparator");

    if (v12) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 0xFFFFLL;
    }
  }
  [v13 setCharacterType:v10];
}

@end