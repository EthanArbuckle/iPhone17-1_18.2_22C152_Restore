@interface SUUILimitListViewElement
- (NSArray)limitViewElements;
@end

@implementation SUUILimitListViewElement

- (NSArray)limitViewElements
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SUUILimitListViewElement_limitViewElements__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __45__SUUILimitListViewElement_limitViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 elementType] == 60)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

@end