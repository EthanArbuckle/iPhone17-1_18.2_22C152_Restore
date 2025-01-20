@interface UIView
@end

@implementation UIView

void __71__UIView_PLScrollViewDelegateAdditions__pl_isScrollViewDelegateMethod___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unsigned int outCount = 0;
  v1 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F336BA00, 1, 1, &outCount);
  unsigned int v8 = 0;
  v2 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F336BA00, 0, 1, &v8);
  unsigned int v3 = outCount;
  if (v8 + outCount)
  {
    unsigned int v4 = 0;
    do
    {
      if (v4 >= v3)
      {
        v5 = v2;
      }
      else
      {
        unsigned int v3 = 0;
        v5 = v1;
      }
      v6 = NSStringFromSelector(v5[v4 - v3].name);
      [v0 addObject:v6];

      ++v4;
      unsigned int v3 = outCount;
    }
    while (v4 < v8 + outCount);
  }
  free(v1);
  free(v2);
  v7 = (void *)pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors;
  pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors = (uint64_t)v0;
}

@end