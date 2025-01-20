@interface UIImageView(PKUIUtilities)
- (double)pkui_alignmentSize;
- (uint64_t)pkui_alignmentRect;
- (uint64_t)pkui_setAlignmentRect:()PKUIUtilities;
@end

@implementation UIImageView(PKUIUtilities)

- (uint64_t)pkui_alignmentRect
{
  [a1 frame];

  return objc_msgSend(a1, "alignmentRectForFrame:");
}

- (uint64_t)pkui_setAlignmentRect:()PKUIUtilities
{
  objc_msgSend(a1, "frameForAlignmentRect:");

  return objc_msgSend(a1, "setFrame:");
}

- (double)pkui_alignmentSize
{
  [a1 frame];
  double v3 = v2;
  [a1 alignmentRectInsets];
  return v3 - (v4 + v5);
}

@end