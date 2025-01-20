@interface DOMHTMLAnchorElement(UIWebInteraction)
- (uint64_t)alwaysAttemptToShowTapHighlight;
@end

@implementation DOMHTMLAnchorElement(UIWebInteraction)

- (uint64_t)alwaysAttemptToShowTapHighlight
{
  return 1;
}

@end