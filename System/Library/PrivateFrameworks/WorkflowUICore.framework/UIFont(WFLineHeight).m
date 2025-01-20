@interface UIFont(WFLineHeight)
- (double)wf_lineHeight;
@end

@implementation UIFont(WFLineHeight)

- (double)wf_lineHeight
{
  double Ascent = CTFontGetAscent(a1);
  double v3 = Ascent + CTFontGetDescent(a1);
  return v3 + CTFontGetLeading(a1);
}

@end