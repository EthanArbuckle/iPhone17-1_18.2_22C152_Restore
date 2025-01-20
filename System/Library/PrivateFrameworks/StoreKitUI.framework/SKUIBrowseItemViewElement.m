@interface SKUIBrowseItemViewElement
- (BOOL)expands;
- (NSArray)metadata;
- (SKUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIImageViewElement)decorationImage;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
@end

@implementation SKUIBrowseItemViewElement

- (SKUIBrowseItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseItemViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIBrowseItemViewElement;
  v11 = [(SKUIItemViewElement *)&v14 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"expands"];
    *(&v11->super._selected + 1) = [v12 BOOLValue];
  }
  return v11;
}

- (SKUIImageViewElement)decorationImage
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:29];
}

- (NSArray)metadata
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SKUIBrowseItemViewElement_metadata__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __37__SKUIBrowseItemViewElement_metadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SKUIBrowseItemViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIBrowseItemViewElement;
  v5 = [(SKUIItemViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType]) {
    *(&self->super._selected + 1) = [(SKUIBrowseItemViewElement *)v4 expands];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrowseItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end