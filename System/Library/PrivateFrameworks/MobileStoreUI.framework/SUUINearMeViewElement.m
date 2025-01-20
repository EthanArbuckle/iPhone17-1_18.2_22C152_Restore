@interface SUUINearMeViewElement
- (SUUINearMeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (void)_itemsDidChange:(id)a3;
- (void)dealloc;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUINearMeViewElement

- (SUUINearMeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SUUINearMeViewElement;
  v5 = [(SUUIViewElement *)&v10 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SUUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
    block[3] = &unk_265400980;
    v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v6;
}

void __66__SUUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1)
{
  id v3 = +[SUUINearMeController sharedController];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__itemsDidChange_ name:@"SUUINearMeItemsDidChangeNotification" object:v3];

  if ([v3 status]) {
    [*(id *)(a1 + 32) _itemsDidChange:0];
  }
  else {
    [v3 getItems];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUUINearMeViewElement;
  [(SUUIViewElement *)&v4 dealloc];
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SUUICoreLocationFramework();
  int v6 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v5), "authorizationStatus");
  if (SUUINearMeIsEnabledForAuthorizationStatus(v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUINearMeViewElement;
    [(SUUIViewElement *)&v7 enumerateChildrenUsingBlock:v4];
  }
}

- (void)_itemsDidChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = +[SUUINearMeController sharedController];
  uint64_t v5 = [v4 items];

  int v6 = [MEMORY[0x263EFF980] array];
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

  v13 = +[SUUINearMeController sharedController];
  v14 = [v13 responseDictionary];

  if (v14)
  {
    v15 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:0 error:0];
    v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__SUUINearMeViewElement__itemsDidChange___block_invoke;
    v18[3] = &unk_265400890;
    v18[4] = self;
    id v19 = v16;
    id v17 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
}

void __41__SUUINearMeViewElement__itemsDidChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = @"nearMe";
  v5[0] = v1;
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 dispatchEventOfType:13 canBubble:0 isCancelable:1 extraInfo:v3 completionBlock:0];
}

@end