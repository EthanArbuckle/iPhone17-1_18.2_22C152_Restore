@interface _UIBarButtonItemDataBaseFallback
+ (id)fallback;
- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4;
- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4;
- (id)backIndicatorTextStyleForSymbolConfiguration;
- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4;
- (id)colorForState:(int64_t)a3 style:(int64_t)a4;
- (id)fontForState:(int64_t)a3 style:(int64_t)a4;
- (id)textStyleForSymbolConfiguration;
@end

@implementation _UIBarButtonItemDataBaseFallback

- (id)backgroundImageForState:(int64_t)a3 style:(int64_t)a4
{
  return 0;
}

- (id)fontForState:(int64_t)a3 style:(int64_t)a4
{
  if (a4 == 2)
  {
    int v8 = _UIBarsUseDynamicType();
    v6 = off_1E52D39B8;
    if (v8)
    {
      v7 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedBody;
      goto LABEL_7;
    }
    v9 = [off_1E52D39B8 boldSystemFontOfSize:17.0];
  }
  else if (a4)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIBarButtonItemData.m", 50, @"Unsupported style %li", a4);

    v9 = 0;
  }
  else
  {
    char v5 = _UIBarsUseDynamicType();
    v6 = off_1E52D39B8;
    if (v5)
    {
      v7 = &UIFontTextStyleBody;
LABEL_7:
      v9 = [v6 preferredFontForTextStyle:*v7];
      goto LABEL_11;
    }
    v9 = [off_1E52D39B8 systemFontOfSize:17.0];
  }
LABEL_11:
  return v9;
}

- (id)colorForState:(int64_t)a3 style:(int64_t)a4
{
  return 0;
}

- (id)textStyleForSymbolConfiguration
{
  return @"UICTFontTextStyleBody";
}

- (UIOffset)backgroundImagePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

- (id)backIndicatorTextStyleForSymbolConfiguration
{
  return @"UICTFontTextStyleEmphasizedBody";
}

+ (id)fallback
{
  v2 = (void *)fallback_fallback;
  if (!fallback_fallback)
  {
    uint64_t v3 = objc_opt_new();
    double v4 = (void *)fallback_fallback;
    fallback_fallback = v3;

    v2 = (void *)fallback_fallback;
  }
  return v2;
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3 style:(int64_t)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

@end