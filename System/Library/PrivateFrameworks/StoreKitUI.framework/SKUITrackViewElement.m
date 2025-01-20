@interface SKUITrackViewElement
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (SKUIActionsViewElement)swipeActions;
- (SKUITrackViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUITrackViewElement

- (SKUITrackViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrackViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUITrackViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"disabled"];
    if ([v12 length]) {
      int v13 = [v12 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v13) = -1;
    }
    v11->_enabled = v13;
    v14 = [v8 getAttribute:@"selected"];
    if ([v14 length]) {
      v11->_selected = [v14 BOOLValue];
    }
  }
  return v11;
}

- (SKUIActionsViewElement)swipeActions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__68;
  id v10 = __Block_byref_object_dispose__68;
  id v11 = 0;
  v2 = [(SKUITrackViewElement *)self children];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SKUITrackViewElement_swipeActions__block_invoke;
  v5[3] = &unk_1E6428890;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIActionsViewElement *)v3;
}

void __36__SKUITrackViewElement_swipeActions__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  v4 = (SKUITrackViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUITrackViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SKUITrackViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E64241C8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUITrackViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __52__SKUITrackViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
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
  v4.super_class = (Class)SKUITrackViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITrackViewElement initWithDOMElement:parent:elementFactory:]";
}

@end