@interface SKUICardViewElement
- (BOOL)isAdCard;
- (BOOL)isEnabled;
- (SKUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)cardType;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUICardViewElement

- (SKUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICardViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUICardViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"disabled"];
    if ([v12 length]) {
      char v13 = [v12 BOOLValue] ^ 1;
    }
    else {
      char v13 = -1;
    }
    v11->_enabled = v13;
  }
  return v11;
}

- (int64_t)cardType
{
  v2 = [(SKUICardViewElement *)self style];
  v3 = [v2 cardType];
  int64_t v4 = SKUICardElementTypeForString(v3);

  return v4;
}

- (BOOL)isAdCard
{
  v2 = [(SKUICardViewElement *)self attributes];
  v3 = [v2 objectForKey:@"isAdCard"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  char v4 = (SKUICardViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUICardViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType]) {
    self->_enabled = v4->_enabled;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SKUICardViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E64241C8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUICardViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __51__SKUICardViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 elementType];
  BOOL v4 = (unint64_t)(v3 - 7) > 0x3B || ((1 << (v3 - 7)) & 0x8801E0002000023) == 0;
  if (!v4 || (unint64_t)(v3 - 108) <= 0x2C && ((1 << (v3 - 108)) & 0x100040800001) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUICardViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICardViewElement initWithDOMElement:parent:elementFactory:]";
}

@end