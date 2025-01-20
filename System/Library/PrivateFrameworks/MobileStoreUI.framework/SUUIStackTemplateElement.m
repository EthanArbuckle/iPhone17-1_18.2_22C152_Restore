@interface SUUIStackTemplateElement
- (BOOL)needsStateReset;
- (NSArray)collectionElements;
- (SUUIIndexBarViewElement)indexBarViewElement;
- (SUUINavigationBarViewElement)navigationBarElement;
- (SUUIStackTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIToolbarViewElement)toolbarElement;
- (SUUIViewElement)collectionHeaderViewElement;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)numberOfSplits;
@end

@implementation SUUIStackTemplateElement

- (SUUIStackTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIStackTemplateElement;
  v9 = [(SUUIViewElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"resetState"];
    v9->_needsStateReset = [v10 BOOLValue];
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIStackTemplateElement;
  v4 = (SUUIStackTemplateElement *)a3;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];

  if (v4 != self || objc_msgSend(v5, "updateType", v8.receiver, v8.super_class))
  {
    collectionElements = self->_collectionElements;
    self->_collectionElements = 0;
  }
  return v5;
}

- (NSArray)collectionElements
{
  collectionElements = self->_collectionElements;
  if (!collectionElements)
  {
    v4 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    v5 = self->_collectionElements;
    self->_collectionElements = v4;

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SUUIStackTemplateElement_collectionElements__block_invoke;
    v7[3] = &unk_2654008B8;
    v7[4] = self;
    [(SUUIViewElement *)self enumerateChildrenUsingBlock:v7];
    collectionElements = self->_collectionElements;
  }
  return (NSArray *)collectionElements;
}

void __46__SUUIStackTemplateElement_collectionElements__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 elementType];
  v7 = *(void **)(*(void *)(a1 + 32) + 280);
  if (v6 == 20)
  {
    [v7 removeAllObjects];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__SUUIStackTemplateElement_collectionElements__block_invoke_2;
    v8[3] = &unk_2654008B8;
    v8[4] = *(void *)(a1 + 32);
    [v5 enumerateChildrenUsingBlock:v8];
    *a3 = 1;
  }
  else
  {
    [v7 addObject:v5];
  }
}

uint64_t __46__SUUIStackTemplateElement_collectionElements__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 280) addObject:a2];
}

- (SUUIViewElement)collectionHeaderViewElement
{
  collectionHeaderViewElement = self->_collectionHeaderViewElement;
  if (!collectionHeaderViewElement)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__SUUIStackTemplateElement_collectionHeaderViewElement__block_invoke;
    v5[3] = &unk_2654008B8;
    v5[4] = self;
    [(SUUIViewElement *)self enumerateChildrenUsingBlock:v5];
    collectionHeaderViewElement = self->_collectionHeaderViewElement;
  }
  return collectionHeaderViewElement;
}

void __55__SUUIStackTemplateElement_collectionHeaderViewElement__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 elementType] == 107) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 288), a2);
  }
}

- (SUUIIndexBarViewElement)indexBarViewElement
{
  return (SUUIIndexBarViewElement *)[(SUUIViewElement *)self firstChildForElementType:53];
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)[(SUUIViewElement *)self firstChildForElementType:74];
}

- (SUUIToolbarViewElement)toolbarElement
{
  return (SUUIToolbarViewElement *)[(SUUIViewElement *)self firstChildForElementType:145];
}

- (int64_t)numberOfSplits
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIStackTemplateElement_numberOfSplits__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__SUUIStackTemplateElement_numberOfSplits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 elementType];
  if (result == 128) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (BOOL)needsStateReset
{
  return self->_needsStateReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionHeaderViewElement, 0);
  objc_storeStrong((id *)&self->_collectionElements, 0);
}

@end