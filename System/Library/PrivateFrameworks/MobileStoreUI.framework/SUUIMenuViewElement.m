@interface SUUIMenuViewElement
- (BOOL)isEnabled;
- (NSArray)menuItemTitles;
- (SUUIItemViewElement)titleItem;
- (SUUILabelViewElement)menuLabel;
- (SUUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)selectedItemIndex;
- (void)_enumerateItemElementsUsingBlock:(id)a3;
- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4;
@end

@implementation SUUIMenuViewElement

- (SUUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIMenuViewElement;
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

- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SUUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e36_v32__0__SUUIItemViewElement_8Q16_B24l;
  v4[4] = a4;
  v4[5] = a3;
  [(SUUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
}

uint64_t __58__SUUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    result = [a2 dispatchEventOfType:*(void *)(result + 40) canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    *a4 = 1;
  }
  return result;
}

- (NSArray)menuItemTitles
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SUUIMenuViewElement_menuItemTitles__block_invoke;
  v6[3] = &unk_265405990;
  id v4 = v3;
  id v7 = v4;
  [(SUUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v6];

  return (NSArray *)v4;
}

void __37__SUUIMenuViewElement_menuItemTitles__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 itemText];
  id v4 = [v3 string];

  [*(id *)(a1 + 32) addObject:v4];
}

- (int64_t)selectedItemIndex
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SUUIMenuViewElement_selectedItemIndex__block_invoke;
  v4[3] = &unk_265405968;
  v4[4] = &v5;
  [(SUUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__SUUIMenuViewElement_selectedItemIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isSelected];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (SUUIItemViewElement)titleItem
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__78;
  v9 = __Block_byref_object_dispose__78;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SUUIMenuViewElement_titleItem__block_invoke;
  v4[3] = &unk_265405968;
  v4[4] = &v5;
  [(SUUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIItemViewElement *)v2;
}

void __32__SUUIMenuViewElement_titleItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 isSelected])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  else if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SUUIMenuViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIMenuViewElement;
  uint64_t v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self) {
    self->_enabled = v4->_enabled;
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIMenuViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
}

- (void)_enumerateItemElementsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke;
  v6[3] = &unk_265403F40;
  id v5 = v4;
  id v7 = v5;
  objc_super v8 = v9;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __56__SUUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 elementType] == 59)
  {
    v3 = [v5 itemText];
    id v4 = [v3 string];

    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (SUUILabelViewElement)menuLabel
{
  return self->_menuLabel;
}

- (void).cxx_destruct
{
}

@end