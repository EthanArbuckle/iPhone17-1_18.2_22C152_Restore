@interface DOMHTMLSelectElement(UIWebInteraction)
- (uint64_t)nodeCanBecomeFirstResponder;
@end

@implementation DOMHTMLSelectElement(UIWebInteraction)

- (uint64_t)nodeCanBecomeFirstResponder
{
  return 1;
}

@end