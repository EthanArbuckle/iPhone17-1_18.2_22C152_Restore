@interface UIFont(WFDynamicType)
- (double)wf_bodyLeading;
- (double)wf_scaledValueForValue:()WFDynamicType baseFont:;
@end

@implementation UIFont(WFDynamicType)

- (double)wf_scaledValueForValue:()WFDynamicType baseFont:
{
  id v6 = a4;
  objc_msgSend(a1, "wf_bodyLeading");
  double v8 = v7 * a2;
  objc_msgSend(v6, "wf_bodyLeading");
  double v10 = v9;

  return round(v8 / v10);
}

- (double)wf_bodyLeading
{
  [a1 leading];
  double v3 = v2;
  [a1 lineHeight];
  return v3 + v4;
}

@end