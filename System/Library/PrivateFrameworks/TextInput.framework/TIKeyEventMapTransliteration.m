@interface TIKeyEventMapTransliteration
+ (BOOL)supportsSecureCoding;
- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6;
@end

@implementation TIKeyEventMapTransliteration

- (id)remapKeyWithString:(id)a3 stringWithoutModifiers:(id)a4 modifierFlags:(unint64_t)a5 keyboardState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (![v10 isEqualToString:@"¤"]
    || ([MEMORY[0x1E4F1CA20] currentLocale],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 currencySymbol],
        v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyEventMapTransliteration;
    v14 = [(TIKeyEventMap *)&v16 remapKeyWithString:v10 stringWithoutModifiers:v11 modifierFlags:a5 keyboardState:v12];
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end