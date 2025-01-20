@interface UIColor(WFDisabledColor)
- (id)wf_desaturatedColorWithMagnitude:()WFDisabledColor;
- (uint64_t)wf_disabledColor;
@end

@implementation UIColor(WFDisabledColor)

- (uint64_t)wf_disabledColor
{
  return objc_msgSend(a1, "wf_desaturatedColorWithMagnitude:", 0.8);
}

- (id)wf_desaturatedColorWithMagnitude:()WFDisabledColor
{
  double v9 = 0.0;
  double v10 = 0.0;
  uint64_t v7 = 0;
  double v8 = 0.0;
  if ([a1 getRed:&v10 green:&v9 blue:&v8 alpha:&v7])
  {
    double v4 = (v9 * 0.589999974 + v10 * 0.300000012 + v8 * 0.109999999) * 0.6;
    double v9 = (1.0 - a2) * v9 + v4 * a2;
    double v10 = (1.0 - a2) * v10 + v4 * a2;
    double v8 = (1.0 - a2) * v8 + v4 * a2;
    objc_msgSend(MEMORY[0x263F825C8], "colorWithRed:green:blue:alpha:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

@end