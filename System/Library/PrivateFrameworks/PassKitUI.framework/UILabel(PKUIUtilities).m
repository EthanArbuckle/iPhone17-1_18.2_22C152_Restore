@interface UILabel(PKUIUtilities)
- (double)pkui_sizeThatFits:()PKUIUtilities forceWordWrap:;
- (uint64_t)pkui_sizeThatFits:()PKUIUtilities;
@end

@implementation UILabel(PKUIUtilities)

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_sizeThatFits:forceWordWrap:", 0);
}

- (double)pkui_sizeThatFits:()PKUIUtilities forceWordWrap:
{
  v9 = [a1 attributedText];
  objc_msgSend(v9, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", objc_msgSend(a1, "numberOfLines"), a5, a2, a3);
  double v11 = v10;

  return v11;
}

@end