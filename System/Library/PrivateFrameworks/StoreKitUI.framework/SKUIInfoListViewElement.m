@interface SKUIInfoListViewElement
- (SKUIInfoListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)infoListType;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUIInfoListViewElement

- (SKUIInfoListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIInfoListViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIInfoListViewElement;
  v11 = [(SKUIViewElement *)&v14 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"type"];
    v11->_infoListType = [v12 isEqualToString:@"titleAbove"];
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIInfoListViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIInfoListViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType]) {
    self->_infoListType = [(SKUIInfoListViewElement *)v4 infoListType];
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SKUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E64241C8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUIInfoListViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __55__SKUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 56) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  if (self->_infoListType == 1) {
    return 27;
  }
  else {
    return 26;
  }
}

- (int64_t)infoListType
{
  return self->_infoListType;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInfoListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end