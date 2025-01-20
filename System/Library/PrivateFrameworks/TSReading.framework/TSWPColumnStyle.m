@interface TSWPColumnStyle
+ (float)defaultFloatValueForProperty:(int)a3;
+ (id)defaultStyleWithContext:(id)a3;
+ (id)defaultValueForProperty:(int)a3;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (int)defaultIntValueForProperty:(int)a3;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)equalWidth;
- (BOOL)shrinkTextToFit;
- (CGSize)adjustedInsets;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (unint64_t)columnCount;
@end

@implementation TSWPColumnStyle

- (CGSize)adjustedInsets
{
  id v3 = [(TSSStyle *)self valueForProperty:146];
  [v3 leftInset];
  double v5 = v4;
  [(TSSStyle *)self floatValueForProperty:147];
  double v7 = v6;
  if (v5 < v7) {
    double v5 = v7;
  }
  [v3 topInset];
  double v9 = v8;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

+ (id)defaultValueForProperty:(int)a3
{
  if (a3 == 145 || a3 == 146)
  {
    return +[TSWPPadding padding];
  }
  else if (a3 == 148)
  {
    return +[TSWPColumns columns];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___TSWPColumnStyle;
    return objc_msgSendSuper2(&v4, sel_defaultValueForProperty_);
  }
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result = INFINITY;
  if (a3 == 147) {
    return 0.0;
  }
  return result;
}

- (unint64_t)columnCount
{
  unint64_t result = objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 148), "columnCount");
  if (result >= 0xA) {
    return 10;
  }
  return result;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  id v10 = [(TSSStyle *)self valueForProperty:148];
  [v10 positionForColumnIndex:a3 bodyWidth:a5 outWidth:a6 outGap:a4];
  return result;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  int result = 0x80000000;
  switch(a3)
  {
    case 149:
    case 152:
    case 153:
      int result = 0;
      break;
    case 150:
      return result;
    case 151:
      int result = 1;
      break;
    default:
      if (a3 == 44) {
        int result = 0;
      }
      else {
        int result = 0x80000000;
      }
      break;
  }
  return result;
}

TSSPropertySet *__29__TSWPColumnStyle_properties__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 151, 145, 147, 146, 152, 149, 153, 44, 0);
  +[TSWPColumnStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)properties
{
  if (+[TSWPColumnStyle properties]::s_onceToken != -1) {
    dispatch_once(&+[TSWPColumnStyle properties]::s_onceToken, &__block_literal_global_64);
  }
  return (id)+[TSWPColumnStyle properties]::s_properties;
}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPColumnStyle propertiesAllowingNSNull]::s_onceToken != -1) {
    dispatch_once(&+[TSWPColumnStyle propertiesAllowingNSNull]::s_onceToken, &__block_literal_global_2_3);
  }
  return (id)+[TSWPColumnStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__43__TSWPColumnStyle_propertiesAllowingNSNull__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 145, 146, 0);
  +[TSWPColumnStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)defaultStyleWithContext:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = objc_msgSend(v4, "initWithContext:name:overridePropertyMap:isVariation:", a3, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"None", &stru_26D688A48, @"TSText"), 0, 0);
  return v5;
}

- (TSWPPadding)layoutMargins
{
  objc_opt_class();
  [(TSSStyle *)self valueForProperty:145];
  return (TSWPPadding *)TSUDynamicCast();
}

- (BOOL)equalWidth
{
  id v2 = [(TSSStyle *)self valueForProperty:148];
  if (!v2) {
    return 1;
  }
  return [v2 equalWidth];
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  id v6 = [(TSSStyle *)self valueForProperty:148];
  [v6 widthForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  id v6 = [(TSSStyle *)self valueForProperty:148];
  [v6 gapForColumnIndex:a3 bodyWidth:a4];
  return result;
}

- (BOOL)alwaysStartsNewTarget
{
  return [(TSSStyle *)self intValueForProperty:151] == 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return [(TSSStyle *)self intValueForProperty:44] != 1;
}

@end