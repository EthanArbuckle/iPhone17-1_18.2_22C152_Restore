@interface DOMHTMLImageElement(UIWebInteraction)
- (BOOL)showsTapHighlight;
- (uint64_t)alwaysAttemptToShowTapHighlight;
@end

@implementation DOMHTMLImageElement(UIWebInteraction)

- (BOOL)showsTapHighlight
{
  v1 = [a1 hrefURL];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)alwaysAttemptToShowTapHighlight
{
  return 1;
}

@end