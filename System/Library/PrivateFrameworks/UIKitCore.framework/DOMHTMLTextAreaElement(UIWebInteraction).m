@interface DOMHTMLTextAreaElement(UIWebInteraction)
- (uint64_t)nodeCanBecomeFirstResponder;
@end

@implementation DOMHTMLTextAreaElement(UIWebInteraction)

- (uint64_t)nodeCanBecomeFirstResponder
{
  return [a1 readOnly] ^ 1;
}

@end