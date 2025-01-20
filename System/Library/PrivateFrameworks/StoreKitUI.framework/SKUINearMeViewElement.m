@interface SKUINearMeViewElement
- (SKUINearMeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (void)_itemsDidChange:(id)a3;
- (void)dealloc;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUINearMeViewElement

- (SKUINearMeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUINearMeViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUINearMeViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v12 = v11;
  if (v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__SKUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
    block[3] = &unk_1E6422020;
    v15 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v12;
}

void __66__SKUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1)
{
  id v3 = +[SKUINearMeController sharedController];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__itemsDidChange_ name:@"SKUINearMeItemsDidChangeNotification" object:v3];

  if ([v3 status]) {
    [*(id *)(a1 + 32) _itemsDidChange:0];
  }
  else {
    [v3 getItems];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SKUINearMeViewElement;
  [(SKUIViewElement *)&v4 dealloc];
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SKUICoreLocationFramework();
  int v6 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v5), "authorizationStatus");
  if (SKUINearMeIsEnabledForAuthorizationStatus(v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUINearMeViewElement;
    [(SKUIViewElement *)&v7 enumerateChildrenUsingBlock:v4];
  }
}

- (void)_itemsDidChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = +[SKUINearMeController sharedController];
  uint64_t v5 = [v4 items];

  int v6 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "itemIdentifier"));
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v13 = +[SKUINearMeController sharedController];
  v14 = [v13 responseDictionary];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v14 options:0 error:0];
    objc_super v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__SKUINearMeViewElement__itemsDidChange___block_invoke;
    v18[3] = &unk_1E6421FF8;
    v18[4] = self;
    id v19 = v16;
    id v17 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
}

void __41__SKUINearMeViewElement__itemsDidChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = @"nearMe";
  v5[0] = v1;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 dispatchEventOfType:13 canBubble:0 isCancelable:1 extraInfo:v3 completionBlock:0];
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUINearMeViewElement initWithDOMElement:parent:elementFactory:]";
}

@end