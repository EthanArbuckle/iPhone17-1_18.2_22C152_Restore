@interface DOMNode(UIWebInteraction)
- (UIColor)tapHighlightColor;
- (uint64_t)isLikelyToBeginPageLoad;
- (uint64_t)showsTapHighlight;
- (uint64_t)touchCalloutEnabled;
@end

@implementation DOMNode(UIWebInteraction)

- (uint64_t)showsTapHighlight
{
  return 1;
}

- (UIColor)tapHighlightColor
{
  return +[UIColor colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.3];
}

- (uint64_t)touchCalloutEnabled
{
  return 1;
}

- (uint64_t)isLikelyToBeginPageLoad
{
  return 1;
}

@end