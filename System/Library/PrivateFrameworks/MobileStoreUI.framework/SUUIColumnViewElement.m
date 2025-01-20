@interface SUUIColumnViewElement
- (SUUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIHeaderViewElement)headerElement;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)columnSpan;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUIColumnViewElement

- (SUUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIColumnViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"span"];
    if ([v10 length])
    {
      uint64_t v11 = [v10 integerValue];
      if (v11 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v11;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
    v9->_columnSpan = v12;
  }
  return v9;
}

- (SUUIHeaderViewElement)headerElement
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SUUIColumnViewElement_headerElement__block_invoke;
  v5[3] = &unk_265400D50;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SUUIColumnViewElement;
  [(SUUIViewElement *)&v4 enumerateChildrenUsingBlock:v5];
  id v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIHeaderViewElement *)v2;
}

void __38__SUUIColumnViewElement_headerElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  v7.super_class = (Class)SUUIColumnViewElement;
  v5 = [(SUUIViewElement *)&v7 applyUpdatesWithElement:v4];
  if (v5 == self) {
    self->_columnSpan = [v4 columnSpan];
  }

  return v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(SUUIViewElement *)self descendsFromElementWithType:17])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__SUUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke;
    v6[3] = &unk_265400DA0;
    id v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)SUUIColumnViewElement;
    [(SUUIViewElement *)&v5 enumerateChildrenUsingBlock:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIColumnViewElement;
    [(SUUIViewElement *)&v8 enumerateChildrenUsingBlock:v4];
  }
}

void __53__SUUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
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

@end