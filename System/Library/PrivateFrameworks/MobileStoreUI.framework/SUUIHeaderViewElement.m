@interface SUUIHeaderViewElement
- (NSArray)titleLabels;
- (SUUIButtonViewElement)button;
- (SUUIHeaderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (int64_t)pageComponentType;
@end

@implementation SUUIHeaderViewElement

- (SUUIHeaderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class()
    && ([v8 getAttribute:@"type"],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"browse"],
        v12,
        v13))
  {
    id v14 = v9;
    id v15 = v14;
    if (v14)
    {
      v16 = v14;
      do
      {
        uint64_t v17 = [v16 parent];

        v16 = (void *)v17;
      }
      while (v17);
    }
    v18 = [(SUUIHeaderViewElement *)[SUUIBrowseHeaderViewElement alloc] initWithDOMElement:v8 parent:v15 elementFactory:v10];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SUUIHeaderViewElement;
    v18 = [(SUUIViewElement *)&v21 initWithDOMElement:v8 parent:v9 elementFactory:v10];
    self = &v18->super;
  }
  p_super = &v18->super;

  return p_super;
}

- (SUUIButtonViewElement)button
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__99;
  id v9 = __Block_byref_object_dispose__99;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SUUIHeaderViewElement_button__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIButtonViewElement *)v2;
}

void __31__SUUIHeaderViewElement_button__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  v6[2] = __36__SUUIHeaderViewElement_titleLabels__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __36__SUUIHeaderViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)pageComponentType
{
  return 24;
}

@end