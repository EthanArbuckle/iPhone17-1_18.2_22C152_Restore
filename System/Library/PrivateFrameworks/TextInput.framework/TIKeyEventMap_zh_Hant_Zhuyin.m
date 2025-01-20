@interface TIKeyEventMap_zh_Hant_Zhuyin
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isZhuyinCharacterBeforeInsertionPointOfKeyboardState:(id)a3;
- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3;
- (id)punctuationMap;
- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
@end

@implementation TIKeyEventMap_zh_Hant_Zhuyin

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5
    && [v10 isEqualToString:@" "]
    && [(TIKeyEventMap_zh_Hant_Zhuyin *)self isZhuyinCharacterBeforeInsertionPointOfKeyboardState:v12])
  {
    v13 = @"ˉ";
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TIKeyEventMap_zh_Hant_Zhuyin;
    v13 = [(TIKeyEventMap_zh *)&v15 remapKeyWithString:v10 stringWithoutModifiers:v11 modifierFlags:a5 keyboardState:v12];
  }

  return v13;
}

- (BOOL)isZhuyinCharacterBeforeInsertionPointOfKeyboardState:(id)a3
{
  id v4 = a3;
  v5 = [v4 documentState];
  v6 = [v5 markedText];

  if (v6
    && ([v4 documentState],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 selectedRangeInMarkedText],
        v7,
        v8))
  {
    v9 = [v4 documentState];
    id v10 = [v9 markedText];
    id v11 = [v4 documentState];
    id v12 = objc_msgSend(v10, "substringWithRange:", objc_msgSend(v11, "selectedRangeInMarkedText") - 1, 1);

    BOOL v13 = [(TIKeyEventMap_zh_Hant_Zhuyin *)self shouldInsertZhuyinCharacterAfter:v12];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3
{
  return [a3 _containsBopomofoWithoutToneOnly];
}

- (id)punctuationMap
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "punctuationMap_zh_Hant");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TIKeyEventMap_zh_Hant_Zhuyin_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_201 != -1) {
    dispatch_once(&sharedInstance___onceToken_201, block);
  }
  v2 = (void *)sharedInstance___keyEventMap_200;

  return v2;
}

@end