@interface WebFrame(UIWebDocumentViewTextSelecting)
- (BOOL)hasBodyElement;
@end

@implementation WebFrame(UIWebDocumentViewTextSelecting)

- (BOOL)hasBodyElement
{
  v1 = (void *)[a1 DOMDocument];
  uint64_t v2 = [v1 documentElement];
  return !v1 || v2 == 0;
}

@end