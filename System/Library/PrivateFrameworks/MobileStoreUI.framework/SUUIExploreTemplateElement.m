@interface SUUIExploreTemplateElement
- (BOOL)usesSplits;
- (NSArray)childViewElements;
- (SUUIExploreTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUINavigationBarViewElement)navigationBarElement;
- (SUUIViewElement)leftSplit;
- (SUUIViewElement)rightSplit;
- (void)_getLeftSplit:(id *)a3 rightSplit:(id *)a4;
@end

@implementation SUUIExploreTemplateElement

- (SUUIExploreTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIExploreTemplateElement;
  v9 = [(SUUIViewElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 childElementsByTagName:@"split"];
    v9->_usesSplits = [v10 count] == 2;
  }
  return v9;
}

- (NSArray)childViewElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = self;
  v5 = v4;
  if (v4->_usesSplits)
  {
    uint64_t v6 = [(SUUIExploreTemplateElement *)v4 leftSplit];

    v5 = (void *)v6;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIExploreTemplateElement_childViewElements__block_invoke;
  v9[3] = &unk_2654008B8;
  id v7 = v3;
  id v10 = v7;
  [v5 enumerateChildrenUsingBlock:v9];

  return (NSArray *)v7;
}

void __47__SUUIExploreTemplateElement_childViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUIViewElement)leftSplit
{
  if (self->_usesSplits)
  {
    id v4 = 0;
    [(SUUIExploreTemplateElement *)self _getLeftSplit:&v4 rightSplit:0];
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }
  return (SUUIViewElement *)v2;
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)[(SUUIViewElement *)self firstChildForElementType:74];
}

- (SUUIViewElement)rightSplit
{
  if (self->_usesSplits)
  {
    id v4 = 0;
    [(SUUIExploreTemplateElement *)self _getLeftSplit:0 rightSplit:&v4];
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }
  return (SUUIViewElement *)v2;
}

- (void)_getLeftSplit:(id *)a3 rightSplit:(id *)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  objc_super v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  uint64_t v6 = [(SUUIExploreTemplateElement *)self children];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke;
  v7[3] = &unk_265401AF0;
  v7[4] = &v14;
  v7[5] = &v8;
  [v6 enumerateObjectsUsingBlock:v7];

  if (a3) {
    *a3 = (id) v15[5];
  }
  if (a4) {
    *a4 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __55__SUUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 elementType] == 128)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    uint64_t v8 = (id *)(v7 + 40);
    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }
}

- (BOOL)usesSplits
{
  return self->_usesSplits;
}

@end