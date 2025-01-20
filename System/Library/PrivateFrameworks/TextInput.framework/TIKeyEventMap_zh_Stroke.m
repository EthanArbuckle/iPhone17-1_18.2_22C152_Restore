@interface TIKeyEventMap_zh_Stroke
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isNumericWubi:(id)a3;
- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
- (id)wubiFromASCII:(id)a3;
@end

@implementation TIKeyEventMap_zh_Stroke

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 hardwareKeyboardMode])
  {
    if ([(TIKeyEventMap_zh_Stroke *)self isNumericWubi:v11] && (a5 == 0x400000 || a5 == 0x80000))
    {
      id v13 = v11;
      goto LABEL_10;
    }
    if ([(TIKeyEventMap_zh_Stroke *)self isNumericWubi:v10])
    {
      if (![v10 isEqualToString:@"="]
        || ([v12 documentState],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v14 markedText],
            v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 length],
            v15,
            v14,
            v16))
      {
        id v13 = [(TIKeyEventMap_zh_Stroke *)self wubiFromASCII:v10];
LABEL_10:
        v17 = v13;
        if (v13) {
          goto LABEL_12;
        }
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)TIKeyEventMap_zh_Stroke;
  v17 = [(TIKeyEventMap_zh *)&v19 remapKeyWithString:v10 stringWithoutModifiers:v11 modifierFlags:a5 keyboardState:v12];
LABEL_12:

  return v17;
}

- (BOOL)isNumericWubi:(id)a3
{
  v3 = [(TIKeyEventMap_zh_Stroke *)self wubiFromASCII:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)wubiFromASCII:(id)a3
{
  uint64_t v3 = wubiFromASCII__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&wubiFromASCII__onceToken, &__block_literal_global_248);
  }
  v5 = [(id)wubiFromASCII__asciiToWubiMap objectForKey:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  return 0;
}

@end