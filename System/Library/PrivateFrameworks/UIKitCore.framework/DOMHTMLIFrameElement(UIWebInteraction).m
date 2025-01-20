@interface DOMHTMLIFrameElement(UIWebInteraction)
- (uint64_t)nodeCanBecomeFirstResponder;
@end

@implementation DOMHTMLIFrameElement(UIWebInteraction)

- (uint64_t)nodeCanBecomeFirstResponder
{
  return 0;
}

@end