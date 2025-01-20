@interface SKUIColumnViewElement
- (SKUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIHeaderViewElement)headerElement;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)columnSpan;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUIColumnViewElement

- (SKUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIColumnViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIColumnViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"span"];
    if ([v12 length])
    {
      uint64_t v13 = [v12 integerValue];
      if (v13 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
    v11->_columnSpan = v14;
  }
  return v11;
}

- (SKUIHeaderViewElement)headerElement
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__64;
  id v10 = __Block_byref_object_dispose__64;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SKUIColumnViewElement_headerElement__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SKUIColumnViewElement;
  [(SKUIViewElement *)&v4 enumerateChildrenUsingBlock:v5];
  id v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIHeaderViewElement *)v2;
}

void __38__SKUIColumnViewElement_headerElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 48)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKUIColumnViewElement;
  v5 = [(SKUIViewElement *)&v7 applyUpdatesWithElement:v4];
  if (v5 == self) {
    self->_columnSpan = [v4 columnSpan];
  }

  return v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(SKUIViewElement *)self descendsFromElementWithType:17])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__SKUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke;
    v6[3] = &unk_1E64241C8;
    id v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)SKUIColumnViewElement;
    [(SKUIViewElement *)&v5 enumerateChildrenUsingBlock:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUIColumnViewElement;
    [(SKUIViewElement *)&v8 enumerateChildrenUsingBlock:v4];
  }
}

void __53__SKUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] != 48) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  return 8;
}

- (int64_t)columnSpan
{
  return self->_columnSpan;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIColumnViewElement initWithDOMElement:parent:elementFactory:]";
}

@end