@interface TIKeyEventMap_zh
+ (BOOL)supportsSecureCoding;
+ (id)punctuationMap_zh_Hans;
+ (id)punctuationMap_zh_Hant;
+ (id)sharedInstance;
- (BOOL)isURLOrEmailKeyboardInKeyboardState:(id)a3;
- (id)punctuationMap;
- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
@end

@implementation TIKeyEventMap_zh

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (![v12 hardwareKeyboardMode]
    || [(TIKeyEventMap_zh *)self isURLOrEmailKeyboardInKeyboardState:v12]
    || ([(TIKeyEventMap_zh *)self punctuationMap],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 objectForKey:v10],
        v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyEventMap_zh;
    v14 = [(TIKeyEventMap *)&v16 remapKeyWithString:v10 stringWithoutModifiers:v11 modifierFlags:a5 keyboardState:v12];
  }

  return v14;
}

- (BOOL)isURLOrEmailKeyboardInKeyboardState:(id)a3
{
  unint64_t v3 = [a3 keyboardType];
  return (v3 < 0x13) & (0x40488u >> v3);
}

- (id)punctuationMap
{
  return 0;
}

+ (id)punctuationMap_zh_Hant
{
  if (punctuationMap_zh_Hant___onceToken != -1) {
    dispatch_once(&punctuationMap_zh_Hant___onceToken, &__block_literal_global_162);
  }
  v2 = (void *)punctuationMap_zh_Hant___punctuationMap;

  return v2;
}

+ (id)punctuationMap_zh_Hans
{
  if (punctuationMap_zh_Hans___onceToken != -1) {
    dispatch_once(&punctuationMap_zh_Hans___onceToken, &__block_literal_global_2543);
  }
  v2 = (void *)punctuationMap_zh_Hans___punctuationMap;

  return v2;
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