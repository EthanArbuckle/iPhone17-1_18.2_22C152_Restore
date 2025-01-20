@interface UIImageView(PGVibrancyEffects)
- (id)PG_updateVibrancyEffectForTintColor;
@end

@implementation UIImageView(PGVibrancyEffects)

- (id)PG_updateVibrancyEffectForTintColor
{
  v2 = [a1 image];
  int v3 = objc_msgSend(v2, "PG_wantsVibrancyEffect");

  if (v3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&off_1F0E83DE8;
    return objc_msgSendSuper2(&v5, sel_PG_updateVibrancyEffectForTintColor);
  }
  else
  {
    return (id)objc_msgSend(a1, "PG_removeVibrancyEffect");
  }
}

@end