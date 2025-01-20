@interface SKUIMenuViewElement
- (BOOL)isEnabled;
- (NSArray)menuItemTitles;
- (SKUIItemViewElement)titleItem;
- (SKUILabelViewElement)menuLabel;
- (SKUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)selectedItemIndex;
- (void)_enumerateItemElementsUsingBlock:(id)a3;
- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4;
@end

@implementation SKUIMenuViewElement

- (SKUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMenuViewElement;
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

- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SKUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e36_v32__0__SKUIItemViewElement_8Q16_B24l;
  v4[4] = a4;
  v4[5] = a3;
  [(SKUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
}

uint64_t __58__SKUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
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
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SKUIMenuViewElement_menuItemTitles__block_invoke;
  v6[3] = &unk_1E6426B48;
  id v4 = v3;
  id v7 = v4;
  [(SKUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v6];

  return (NSArray *)v4;
}

void __37__SKUIMenuViewElement_menuItemTitles__block_invoke(uint64_t a1, void *a2)
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
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SKUIMenuViewElement_selectedItemIndex__block_invoke;
  v4[3] = &unk_1E6426B20;
  v4[4] = &v5;
  [(SKUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__SKUIMenuViewElement_selectedItemIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isSelected];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (SKUIItemViewElement)titleItem
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__88;
  id v9 = __Block_byref_object_dispose__88;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__SKUIMenuViewElement_titleItem__block_invoke;
  v4[3] = &unk_1E6426B20;
  v4[4] = &v5;
  [(SKUIMenuViewElement *)self _enumerateItemElementsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUIItemViewElement *)v2;
}

void __32__SKUIMenuViewElement_titleItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  id v4 = (SKUIMenuViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMenuViewElement;
  uint64_t v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
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
  v4.super_class = (Class)SKUIMenuViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (void)_enumerateItemElementsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SKUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke;
  v6[3] = &unk_1E6426440;
  id v5 = v4;
  id v7 = v5;
  objc_super v8 = v9;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __56__SKUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
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

- (SKUILabelViewElement)menuLabel
{
  return self->_menuLabel;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuViewElement initWithDOMElement:parent:elementFactory:]";
}

@end