@interface SUUIFooterViewElement
- (NSArray)titleLabels;
- (SUUIButtonViewElement)button;
@end

@implementation SUUIFooterViewElement

- (SUUIButtonViewElement)button
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__56;
  v9 = __Block_byref_object_dispose__56;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SUUIFooterViewElement_button__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIButtonViewElement *)v2;
}

void __31__SUUIFooterViewElement_button__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (SUUIIKViewElementTypeIsButton([v6 elementType]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)titleLabels
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SUUIFooterViewElement_titleLabels__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __36__SUUIFooterViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end