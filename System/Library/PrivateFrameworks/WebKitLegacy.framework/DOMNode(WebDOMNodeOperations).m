@interface DOMNode(WebDOMNodeOperations)
- (uint64_t)webArchiveByFilteringSubframes:()WebDOMNodeOperations;
@end

@implementation DOMNode(WebDOMNodeOperations)

- (uint64_t)webArchiveByFilteringSubframes:()WebDOMNodeOperations
{
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = *(void **)(*(void *)(a2 + 280) + 16);
  if ((*(uint64_t (**)(void *))(*v3 + 1072))(v3)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3[2];
  }
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v4);
}

@end