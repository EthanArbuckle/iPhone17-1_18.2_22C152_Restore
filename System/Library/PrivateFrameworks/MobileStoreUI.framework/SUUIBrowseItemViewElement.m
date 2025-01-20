@interface SUUIBrowseItemViewElement
- (BOOL)expands;
- (NSArray)metadata;
- (SUUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIImageViewElement)decorationImage;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
@end

@implementation SUUIBrowseItemViewElement

- (SUUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIBrowseItemViewElement;
  v9 = [(SUUIItemViewElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"expands"];
    *(&v9->super._selected + 1) = [v10 BOOLValue];
  }
  return v9;
}

- (SUUIImageViewElement)decorationImage
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:29];
}

- (NSArray)metadata
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SUUIBrowseItemViewElement_metadata__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __37__SUUIBrowseItemViewElement_metadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SUUIBrowseItemViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBrowseItemViewElement;
  v5 = [(SUUIItemViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType]) {
    *(&self->super._selected + 1) = [(SUUIBrowseItemViewElement *)v4 expands];
  }

  return v6;
}

- (int64_t)pageComponentType
{
  return 16;
}

- (BOOL)expands
{
  return *(&self->super._selected + 1);
}

@end