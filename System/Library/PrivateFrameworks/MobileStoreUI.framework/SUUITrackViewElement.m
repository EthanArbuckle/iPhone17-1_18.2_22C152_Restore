@interface SUUITrackViewElement
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (SUUIActionsViewElement)swipeActions;
- (SUUITrackViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUITrackViewElement

- (SUUITrackViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUITrackViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"disabled"];
    if ([v10 length]) {
      int v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v11) = -1;
    }
    v9->_enabled = v11;
    v12 = [v8 getAttribute:@"selected"];
    if ([v12 length]) {
      v9->_selected = [v12 BOOLValue];
    }
  }
  return v9;
}

- (SUUIActionsViewElement)swipeActions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__80;
  v10 = __Block_byref_object_dispose__80;
  id v11 = 0;
  v2 = [(SUUITrackViewElement *)self children];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SUUITrackViewElement_swipeActions__block_invoke;
  v5[3] = &unk_265407880;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIActionsViewElement *)v3;
}

void __36__SUUITrackViewElement_swipeActions__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 elementType] == 3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUITrackViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUITrackViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  uint64_t v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_selected = v4->_selected;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SUUITrackViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUITrackViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __52__SUUITrackViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] != 3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUITrackViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
}

- (BOOL)isSelected
{
  return self->_selected;
}

@end