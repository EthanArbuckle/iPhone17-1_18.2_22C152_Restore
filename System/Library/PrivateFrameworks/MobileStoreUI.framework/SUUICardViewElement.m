@interface SUUICardViewElement
- (BOOL)isAdCard;
- (BOOL)isEnabled;
- (SUUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)cardType;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUICardViewElement

- (SUUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUICardViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"disabled"];
    if ([v10 length]) {
      char v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      char v11 = -1;
    }
    v9->_enabled = v11;
  }
  return v9;
}

- (int64_t)cardType
{
  v2 = [(SUUICardViewElement *)self style];
  v3 = [v2 cardType];
  int64_t v4 = SUUICardElementTypeForString(v3);

  return v4;
}

- (BOOL)isAdCard
{
  v2 = [(SUUICardViewElement *)self attributes];
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
  char v4 = (SUUICardViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUICardViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType]) {
    self->_enabled = v4->_enabled;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUUICardViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUICardViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __51__SUUICardViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
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
  v4.super_class = (Class)SUUICardViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
}

@end