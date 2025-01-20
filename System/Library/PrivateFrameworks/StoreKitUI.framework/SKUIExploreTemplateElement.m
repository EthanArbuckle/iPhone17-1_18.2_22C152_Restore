@interface SKUIExploreTemplateElement
- (BOOL)usesSplits;
- (NSArray)childViewElements;
- (SKUIExploreTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUINavigationBarViewElement)navigationBarElement;
- (SKUIViewElement)leftSplit;
- (SKUIViewElement)rightSplit;
- (void)_getLeftSplit:(id *)a3 rightSplit:(id *)a4;
@end

@implementation SKUIExploreTemplateElement

- (SKUIExploreTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIExploreTemplateElement initWithDOMElement:parent:elementFactory:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIExploreTemplateElement;
  v11 = [(SKUIViewElement *)&v14 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 childElementsByTagName:@"split"];
    v11->_usesSplits = [v12 count] == 2;
  }
  return v11;
}

- (NSArray)childViewElements
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = self;
  v5 = v4;
  if (v4->_usesSplits)
  {
    uint64_t v6 = [(SKUIExploreTemplateElement *)v4 leftSplit];

    v5 = (void *)v6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIExploreTemplateElement_childViewElements__block_invoke;
  v9[3] = &unk_1E6423570;
  id v7 = v3;
  id v10 = v7;
  [v5 enumerateChildrenUsingBlock:v9];

  return (NSArray *)v7;
}

void __47__SKUIExploreTemplateElement_childViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SKUIViewElement)leftSplit
{
  if (self->_usesSplits)
  {
    id v4 = 0;
    [(SKUIExploreTemplateElement *)self _getLeftSplit:&v4 rightSplit:0];
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }

  return (SKUIViewElement *)v2;
}

- (SKUINavigationBarViewElement)navigationBarElement
{
  return (SKUINavigationBarViewElement *)[(SKUIViewElement *)self firstChildForElementType:74];
}

- (SKUIViewElement)rightSplit
{
  if (self->_usesSplits)
  {
    id v4 = 0;
    [(SKUIExploreTemplateElement *)self _getLeftSplit:0 rightSplit:&v4];
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }

  return (SKUIViewElement *)v2;
}

- (void)_getLeftSplit:(id *)a3 rightSplit:(id *)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__56;
  v18 = __Block_byref_object_dispose__56;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__56;
  v12 = __Block_byref_object_dispose__56;
  id v13 = 0;
  uint64_t v6 = [(SKUIExploreTemplateElement *)self children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SKUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke;
  v7[3] = &unk_1E6427E78;
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

void __55__SKUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIExploreTemplateElement initWithDOMElement:parent:elementFactory:]";
}

@end