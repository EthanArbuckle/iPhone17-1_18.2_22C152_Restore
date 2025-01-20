@interface TSTTableStyle
+ (id)nonEmphasisTableProperties;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (id)styleIDForPreset:(unint64_t)a3;
+ (void)initDefaultPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (void)initDefaultStrokePresetListInPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5;
+ (void)p_populateParagraphStyle:(id)a3;
- (SEL)mapThemePropertyMapSelector;
- (TSTTableStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6;
- (id)exteriorStrokeForStrokePreset:(unint64_t)a3;
- (id)horizontalStrokeForStrokePreset:(unint64_t)a3;
- (id)strokeForStrokePreset:(unint64_t)a3;
- (id)verticalStrokeForStrokePreset:(unint64_t)a3;
- (unsigned)maskForStrokePreset:(unint64_t)a3;
- (void)dealloc;
- (void)validate;
@end

@implementation TSTTableStyle

+ (id)properties
{
  id result = (id)+[TSTTableStyle properties]::sProperties;
  if (!+[TSTTableStyle properties]::sProperties)
  {
    id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784,
               785,
               786,
               787,
               799,
               800,
               801,
               802,
               803,
               804,
               805,
               806,
               788,
               789,
               790,
               791,
               792,
               793,
               794,
               795,
               796,
               797,
               798,
               0);
    +[TSTTableStyle properties]::sProperties = (uint64_t)result;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result = (id)+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties;
  if (!+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 0);
      __dmb(0xBu);
      +[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSTTableStyle propertiesAllowingNSNull]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 164, @"Couldn't initialize lazy variable %s", "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTTableStyle propertiesAllowingNSNull]::s_nullProperties;
  }
  return result;
}

+ (id)nonEmphasisTableProperties
{
  id result = (id)+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties;
  if (!+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784,
             785,
             786,
             787,
             788,
             789,
             790,
             791,
             792,
             793,
             794,
             795,
             796,
             797,
             798,
             799,
             800,
             801,
             802,
             803,
             804,
             805,
             806,
             0);
      __dmb(0xBu);
      +[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSTTableStyle nonEmphasisTableProperties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 232, @"Couldn't initialize lazy variable %s", "s_nonEmphasisProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTTableStyle nonEmphasisTableProperties]::s_nonEmphasisProperties;
  }
  return result;
}

+ (id)styleIDForPreset:(unint64_t)a3
{
  return (id)String(@"table", a3, @"tableStyle");
}

+ (void)initDefaultStrokePresetListInPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5
{
  id v6 = +[TSTTableStrokePresetList strokePresetListForDefaultPropertyMapForTablePresetIndex:a4 colors:a5];

  [a3 setObject:v6 forProperty:787];
}

+ (void)initDefaultPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  p_setStrokeColors((TSSPropertyMap *)a3, a4, (NSArray *)a5);
  [a3 setIntValue:1 forProperty:799];
  [a3 setIntValue:0 forProperty:768];
  [a3 setIntValue:0 forProperty:769];
  [a3 setIntValue:0 forProperty:798];
  id v9 = +[TSTTableStrokePresetList strokePresetListForDefaultPropertyMapForTablePresetIndex:a4 colors:a5];

  [a3 setObject:v9 forProperty:787];
}

+ (void)p_populateParagraphStyle:(id)a3
{
  id v4 = +[TSWPParagraphStyle properties];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__TSTTableStyle_p_populateParagraphStyle___block_invoke;
  v5[3] = &unk_2646B0F30;
  v5[4] = a3;
  [v4 enumeratePropertiesUsingBlock:v5];
}

uint64_t __42__TSTTableStyle_p_populateParagraphStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) definesProperty:a2];
  if ((result & 1) == 0)
  {
    id v5 = +[TSSStyle boxedDefaultValueForProperty:a2];
    id v6 = *(void **)(a1 + 32);
    return [v6 setBoxedValue:v5 forProperty:a2];
  }
  return result;
}

- (TSTTableStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TSTTableStyle;
  return [(TSSStyle *)&v7 initWithContext:a3 name:a4 overridePropertyMap:a5 isVariation:a6];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSTTableStyle;
  [(TSSStyle *)&v2 dealloc];
}

- (id)strokeForStrokePreset:(unint64_t)a3
{
  id v4 = [(TSSStyle *)self valueForProperty:787];

  return (id)[v4 horizontalStrokeForStrokePreset:a3];
}

- (id)horizontalStrokeForStrokePreset:(unint64_t)a3
{
  id v4 = [(TSSStyle *)self valueForProperty:787];

  return (id)[v4 horizontalStrokeForStrokePreset:a3];
}

- (id)verticalStrokeForStrokePreset:(unint64_t)a3
{
  id v4 = [(TSSStyle *)self valueForProperty:787];

  return (id)[v4 verticalStrokeForStrokePreset:a3];
}

- (id)exteriorStrokeForStrokePreset:(unint64_t)a3
{
  id v4 = [(TSSStyle *)self valueForProperty:787];

  return (id)[v4 exteriorStrokeForStrokePreset:a3];
}

- (unsigned)maskForStrokePreset:(unint64_t)a3
{
  id v4 = [(TSSStyle *)self valueForProperty:787];

  return [v4 maskForStrokePreset:a3];
}

- (void)validate
{
  if (![(TSSStyle *)self stylesheet])
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSTTableStyle validate]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"), 571, @"orphaned table style %@", self file lineNumber description];
  }
  if (![(TSSStylesheet *)[(TSSStyle *)self stylesheet] containsStyle:self]
    || (id v5 = [(TSSStyle *)self stylesheet], v5 != [(TSSStyle *)self stylesheet]))
  {
    id v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTTableStyle validate]"];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyle.mm"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:574 description:@"Table style not in its stylesheet"];
  }
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tstMapTableStylePropertyMap_;
}

@end