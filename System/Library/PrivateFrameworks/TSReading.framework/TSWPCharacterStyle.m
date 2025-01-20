@interface TSWPCharacterStyle
+ (id)emphasisProperties;
+ (id)nonEmphasisCharacterProperties;
+ (id)nullStyleName;
+ (id)nullStyleWithContext:(id)a3;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
- (BOOL)transformsFontSizes;
- (NSString)presetKind;
- (int)writingDirection;
@end

@implementation TSWPCharacterStyle

- (int)writingDirection
{
  int result = [(TSSStyle *)self intValueForProperty:44];
  if (result == 0x80000000)
  {
    objc_opt_class();
    [(TSSStyle *)self valueForProperty:39];
    uint64_t v4 = TSUDynamicCast();
    if (v4) {
      return [MEMORY[0x263EFF960] characterDirectionForLanguage:v4] == 2;
    }
    else {
      return -1;
    }
  }
  return result;
}

+ (id)properties
{
  if (+[TSWPCharacterStyle properties]::s_onceToken != -1) {
    dispatch_once(&+[TSWPCharacterStyle properties]::s_onceToken, &__block_literal_global_62);
  }
  return (id)+[TSWPCharacterStyle properties]::s_properties;
}

TSSPropertySet *__32__TSWPCharacterStyle_properties__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 33, 21, 19, 18, 20, 16, 17, 34, 39, 41, 32, 31, 40, 28, 26, 27, 36,
             37,
             35,
             24,
             22,
             23,
             29,
             25,
             43,
             53,
             54,
             55,
             56,
             44,
             45,
             46,
             47,
             48,
             49,
             50,
             0);
  +[TSWPCharacterStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)emphasisProperties
{
  if (+[TSWPCharacterStyle emphasisProperties]::s_onceToken != -1) {
    dispatch_once(&+[TSWPCharacterStyle emphasisProperties]::s_onceToken, &__block_literal_global_2_2);
  }
  return (id)+[TSWPCharacterStyle emphasisProperties]::s_emphasisProperties;
}

TSSPropertySet *__40__TSWPCharacterStyle_emphasisProperties__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 19, 20, 22, 26, 0);
  +[TSWPCharacterStyle emphasisProperties]::s_emphasisProperties = (uint64_t)result;
  return result;
}

+ (id)nonEmphasisCharacterProperties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__TSWPCharacterStyle_nonEmphasisCharacterProperties__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_onceToken != -1) {
    dispatch_once(&+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_onceToken, block);
  }
  return (id)+[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_nonEmphasisCharacterProperties;
}

void __52__TSWPCharacterStyle_nonEmphasisCharacterProperties__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "mutableCopy");
  objc_msgSend(v2, "removeProperties:", objc_msgSend(*(id *)(a1 + 32), "emphasisProperties"));
  +[TSWPCharacterStyle nonEmphasisCharacterProperties]::s_nonEmphasisCharacterProperties = [v2 copy];
}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPCharacterStyle propertiesAllowingNSNull]::s_onceToken != -1) {
    dispatch_once(&+[TSWPCharacterStyle propertiesAllowingNSNull]::s_onceToken, &__block_literal_global_4_1);
  }
  return (id)+[TSWPCharacterStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__46__TSWPCharacterStyle_propertiesAllowingNSNull__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 39, 32, 40, 28, 37, 24, 43, 53, 54, 55, 45, 46, 47, 0);
  +[TSWPCharacterStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)nullStyleName
{
  id v2 = (void *)TSWPBundle();

  return (id)[v2 localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSText"];
}

+ (id)nullStyleWithContext:(id)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a3, objc_msgSend(a1, "nullStyleName"), 0, 0);

  return v3;
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (BOOL)transformsFontSizes
{
  return 1;
}

@end