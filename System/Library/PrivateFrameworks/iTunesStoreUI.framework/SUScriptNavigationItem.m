@interface SUScriptNavigationItem
+ (id)_rootScriptObjectForObject:(id)a3;
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)_disconnectNavigationItem:(id)a3 scriptObject:(id)a4;
+ (void)initialize;
- (NSString)backButtonTitle;
- (NSString)prompt;
- (NSString)title;
- (SUScriptNavigationItem)init;
- (SUScriptNavigationItem)initWithNativeNavigationItem:(id)a3;
- (SUScriptNavigationItem)leftItem;
- (SUScriptNavigationItem)leftMostItem;
- (SUScriptNavigationItem)rightItem;
- (UINavigationItem)nativeNavigationItem;
- (id)_className;
- (id)_copyScriptButtonForButtonItem:(id)a3;
- (id)_copyScriptObjectForButtonItem:(id)a3;
- (id)hidesBackButton;
- (id)leftItems;
- (id)leftItemsSupplementBackButton;
- (id)rightItems;
- (id)scriptAttributeKeys;
- (id)titleView;
- (void)setBackButtonTitle:(id)a3;
- (void)setHidesBackButton:(id)a3;
- (void)setLeftItem:(id)a3;
- (void)setLeftItem:(id)a3 animated:(BOOL)a4;
- (void)setLeftItems:(id)a3;
- (void)setLeftItems:(id)a3 animated:(BOOL)a4;
- (void)setLeftItemsSupplementBackButton:(id)a3;
- (void)setLeftMostItem:(id)a3;
- (void)setLeftMostItem:(id)a3 animated:(BOOL)a4;
- (void)setPrompt:(id)a3;
- (void)setRightItem:(id)a3;
- (void)setRightItem:(id)a3 animated:(BOOL)a4;
- (void)setRightItems:(id)a3;
- (void)setRightItems:(id)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleView:(id)a3 animated:(BOOL)a4;
- (void)tearDownUserInterface;
@end

@implementation SUScriptNavigationItem

- (SUScriptNavigationItem)init
{
  return [(SUScriptNavigationItem *)self initWithNativeNavigationItem:0];
}

- (SUScriptNavigationItem)initWithNativeNavigationItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptNavigationItem;
  v5 = [(SUScriptObject *)&v9 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = +[SUScriptNativeObject objectWithNativeObject:v4];
    [(SUScriptObject *)v6 setNativeObject:v7];
  }
  return v6;
}

- (UINavigationItem)nativeNavigationItem
{
  v3 = [(SUScriptObject *)self nativeObject];
  id v4 = [v3 object];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [(SUScriptObject *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];

    v6 = +[SUScriptNativeObject objectWithNativeObject:v5];
    [(SUScriptObject *)self setNativeObject:v6];

    id v4 = v5;
  }

  return (UINavigationItem *)v4;
}

- (void)tearDownUserInterface
{
  v3 = [(SUScriptObject *)self nativeObject];
  id v4 = [v3 object];

  [(id)objc_opt_class() _disconnectNavigationItem:v4 scriptObject:self];
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationItem;
  [(SUScriptObject *)&v5 tearDownUserInterface];
}

- (NSString)backButtonTitle
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__19;
  v8 = __Block_byref_object_dispose__19;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __41__SUScriptNavigationItem_backButtonTitle__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nativeNavigationItem];
  uint64_t v2 = [v5 backButtonTitle];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_className
{
  return @"iTunesNavigationItem";
}

- (id)hidesBackButton
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    uint64_t v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __41__SUScriptNavigationItem_hidesBackButton__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 hidesBackButton];
}

- (SUScriptNavigationItem)leftItem
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __34__SUScriptNavigationItem_leftItem__block_invoke;
  v10 = &unk_2648125D8;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __34__SUScriptNavigationItem_leftItem__block_invoke, &unk_2648125D8, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __34__SUScriptNavigationItem_leftItem__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v7 leftBarButtonItem];
  uint64_t v4 = [v2 _copyScriptObjectForButtonItem:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)leftItems
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v6, 3221225472, __35__SUScriptNavigationItem_leftItems__block_invoke, &unk_2648125D8, self, &v8);
    id v3 = (void *)v9[5];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__SUScriptNavigationItem_leftItems__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v3 = [v2 leftBarButtonItems];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(a1 + 32), "_copyScriptObjectForButtonItem:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        if (v12) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)leftItemsSupplementBackButton
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __55__SUScriptNavigationItem_leftItemsSupplementBackButton__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 leftItemsSupplementBackButton];
}

- (SUScriptNavigationItem)leftMostItem
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __38__SUScriptNavigationItem_leftMostItem__block_invoke;
  uint64_t v10 = &unk_2648125D8;
  uint64_t v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __38__SUScriptNavigationItem_leftMostItem__block_invoke, &unk_2648125D8, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __38__SUScriptNavigationItem_leftMostItem__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v7 leftBarButtonItem];
  uint64_t v4 = [v2 _copyScriptObjectForButtonItem:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSString)prompt
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __32__SUScriptNavigationItem_prompt__block_invoke, &unk_2648125B0, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSString *)v4;
}

void __32__SUScriptNavigationItem_prompt__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nativeNavigationItem];
  uint64_t v2 = [v5 prompt];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SUScriptNavigationItem)rightItem
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __35__SUScriptNavigationItem_rightItem__block_invoke;
  uint64_t v10 = &unk_2648125B0;
  uint64_t v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __35__SUScriptNavigationItem_rightItem__block_invoke, &unk_2648125B0, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __35__SUScriptNavigationItem_rightItem__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [v2 nativeNavigationItem];
  uint64_t v3 = [v7 rightBarButtonItem];
  uint64_t v4 = [v2 _copyScriptObjectForButtonItem:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)rightItems
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v6, 3221225472, __36__SUScriptNavigationItem_rightItems__block_invoke, &unk_2648125D8, self, &v8);
    uint64_t v3 = (void *)v9[5];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __36__SUScriptNavigationItem_rightItems__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  uint64_t v3 = [v2 rightBarButtonItems];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(a1 + 32), "_copyScriptObjectForButtonItem:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        if (v12) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setBackButtonTitle:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_5;
    }
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __45__SUScriptNavigationItem_setBackButtonTitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  [v2 setBackButtonTitle:*(void *)(a1 + 40)];
}

- (void)setHidesBackButton:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_5;
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __45__SUScriptNavigationItem_setHidesBackButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  objc_msgSend(v2, "setHidesBackButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (void)setLeftItem:(id)a3
{
}

- (void)setLeftItems:(id)a3
{
}

- (void)setLeftItemsSupplementBackButton:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_5;
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __59__SUScriptNavigationItem_setLeftItemsSupplementBackButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  objc_msgSend(v2, "setLeftItemsSupplementBackButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (void)setLeftMostItem:(id)a3
{
}

- (void)setPrompt:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_5;
    }
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __36__SUScriptNavigationItem_setPrompt___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  [v2 setPrompt:*(void *)(a1 + 40)];
}

- (void)setRightItem:(id)a3
{
}

- (void)setRightItems:(id)a3
{
}

- (void)setTitle:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_5;
    }
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __35__SUScriptNavigationItem_setTitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  [v2 setTitle:*(void *)(a1 + 40)];
}

- (void)setTitleView:(id)a3
{
}

- (NSString)title
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __31__SUScriptNavigationItem_title__block_invoke, &unk_2648125B0, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSString *)v4;
}

void __31__SUScriptNavigationItem_title__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nativeNavigationItem];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)titleView
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__19;
  uint64_t v8 = __Block_byref_object_dispose__19;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __35__SUScriptNavigationItem_titleView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v6 = [v2 titleView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = objc_alloc_init(SUScriptSegmentedControl);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setNativeSegmentedControl:v6];
  }
}

- (void)setLeftItem:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v5 = 0;
LABEL_4:
    char v6 = 1;
    goto LABEL_5;
  }
  if (!v5) {
    goto LABEL_4;
  }
  if (([v5 conformsToProtocol:&unk_26DC1CF28] & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_8;
  }
  char v6 = 0;
LABEL_5:
  id v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0) {
    [(SUScriptObject *)self checkInScriptObject:v5];
  }

LABEL_8:
}

void __47__SUScriptNavigationItem_setLeftItem_animated___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v2 = [v8 leftBarButtonItem];
  if ([v2 tag] != 424242)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v2) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      if (!SUScriptNavigationItemIsFlagged(v2))
      {
        char v6 = [v8 leftBarButtonItems];
        id v5 = (void *)[v6 mutableCopy];

        id v7 = [*(id *)(a1 + 40) buttonItem];
        [v5 addObject:v7];

        [v8 setLeftBarButtonItems:v5 animated:*(unsigned __int8 *)(a1 + 48)];
        goto LABEL_10;
      }
      uint64_t v3 = *(void **)(a1 + 40);
    }
    id v5 = [v3 buttonItem];
    [v8 setLeftBarButtonItem:v5 animated:*(unsigned __int8 *)(a1 + 48)];
LABEL_10:
  }
}

- (void)setLeftItems:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    int v6 = 0;
    id v5 = 0;
  }
  else if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_11;
    }
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = [v5 copyArrayValueWithValidator:SUConformsValidator context:&unk_26DC1CF28];
  id v8 = (void *)v7;
  if (!v6 || v7)
  {
    if (v7) {
      [(SUScriptObject *)self checkInScriptObjects:v7];
    }
    id v9 = v8;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }

LABEL_11:
}

void __48__SUScriptNavigationItem_setLeftItems_animated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "buttonItem", (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 40) nativeNavigationItem];
  [v9 setLeftBarButtonItems:v2 animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setLeftMostItem:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v5 = 0;
LABEL_4:
    char v6 = 1;
    goto LABEL_5;
  }
  if (!v5) {
    goto LABEL_4;
  }
  if (([v5 conformsToProtocol:&unk_26DC1CF28] & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_8;
  }
  char v6 = 0;
LABEL_5:
  id v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0) {
    [(SUScriptObject *)self checkInScriptObject:v5];
  }

LABEL_8:
}

void __51__SUScriptNavigationItem_setLeftMostItem_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v2 = [*(id *)(a1 + 40) buttonItem];
  [v3 setLeftBarButtonItem:v2 animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setRightItem:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v5 = 0;
LABEL_4:
    char v6 = 1;
    goto LABEL_5;
  }
  if (!v5) {
    goto LABEL_4;
  }
  if (([v5 conformsToProtocol:&unk_26DC1CF28] & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_8;
  }
  char v6 = 0;
LABEL_5:
  id v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0) {
    [(SUScriptObject *)self checkInScriptObject:v5];
  }

LABEL_8:
}

void __48__SUScriptNavigationItem_setRightItem_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nativeNavigationItem];
  id v2 = [*(id *)(a1 + 40) buttonItem];
  [v3 setRightBarButtonItem:v2 animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setRightItems:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    int v6 = 0;
    id v5 = 0;
  }
  else if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_11;
    }
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = [v5 copyArrayValueWithValidator:SUConformsValidator context:&unk_26DC1CF28];
  id v8 = (void *)v7;
  if (!v6 || v7)
  {
    if (v7) {
      [(SUScriptObject *)self checkInScriptObjects:v7];
    }
    id v9 = v8;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }

LABEL_11:
}

void __49__SUScriptNavigationItem_setRightItems_animated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "buttonItem", (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 40) nativeNavigationItem];
  [v9 setRightBarButtonItems:v2 animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  id v5 = v4;
  WebThreadRunOnMainThread();
}

void __48__SUScriptNavigationItem_setTitleView_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) nativeSegmentedControl];
    if (_UIApplicationUsesLegacyUI()) {
      [v3 setSegmentedControlStyle:2];
    }
    [v3 sizeToFitUserInterfaceIdiom];
    id v2 = [*(id *)(a1 + 40) nativeNavigationItem];
    [v2 setTitleView:v3 animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) nativeNavigationItem];
    [v3 setTitleView:0 animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

+ (void)_disconnectNavigationItem:(id)a3 scriptObject:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v29 = a1;
  v30 = [a1 _rootScriptObjectForObject:a4];
  uint64_t v7 = [v6 leftBarButtonItems];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (SUScriptNavigationItemIsFlagged(v14))
        {
          uint64_t v15 = [v14 target];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v15 scriptObject],
                long long v16 = objc_claimAutoreleasedReturnValue(),
                [v29 _rootScriptObjectForObject:v16],
                v17 = objc_claimAutoreleasedReturnValue(),
                v17,
                v16,
                v30 != v17))
          {
            [v8 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  [v6 setLeftBarButtonItems:v8];
  uint64_t v18 = [v6 rightBarButtonItems];

  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if (SUScriptNavigationItemIsFlagged(v25))
        {
          v26 = [v25 target];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v26 scriptObject],
                v27 = objc_claimAutoreleasedReturnValue(),
                [v29 _rootScriptObjectForObject:v27],
                v28 = objc_claimAutoreleasedReturnValue(),
                v28,
                v27,
                v30 != v28))
          {
            [v19 addObject:v25];
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  [v6 setRightBarButtonItems:v19];
}

+ (id)_rootScriptObjectForObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parentScriptObject];

  id v5 = v3;
  if (v4)
  {
    id v6 = v3;
    do
    {
      id v5 = [v6 parentScriptObject];

      uint64_t v7 = [v5 parentScriptObject];

      id v6 = v5;
    }
    while (v7);
  }

  return v5;
}

- (id)_copyScriptButtonForButtonItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 target];
  if (!SUScriptNavigationItemIsFlagged(v3)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v4 scriptObject], (id v5 = (SUScriptButton *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = objc_alloc_init(SUScriptButton);
    [(SUScriptButton *)v5 setNativeButton:v3];
  }

  return v5;
}

- (id)_copyScriptObjectForButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 customView];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc_init(SUScriptTextField);
      [(SUScriptTextField *)v6 setNativeObjectWithTextField:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [[SUScriptTextField alloc] initWithTextFieldStyle:@"search"];
        [(SUScriptTextField *)v6 setNativeObjectWithSearchBar:v5];
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = [(SUScriptNavigationItem *)self _copyScriptButtonForButtonItem:v4];
  }

  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_33 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationItem;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_27, 7);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationItem;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationItem;
  id v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping_33 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_27 = (uint64_t)sel_setHidesBackButton_;
    *(void *)algn_2681B4EB8 = @"setHidesBackButton";
    qword_2681B4EC0 = (uint64_t)sel_setLeftItem_animated_;
    unk_2681B4EC8 = @"setLeftItem";
    qword_2681B4ED0 = (uint64_t)sel_setLeftItems_animated_;
    unk_2681B4ED8 = @"setLeftItems";
    qword_2681B4EE0 = (uint64_t)sel_setLeftMostItem_animated_;
    unk_2681B4EE8 = @"setLeftMostItem";
    qword_2681B4EF0 = (uint64_t)sel_setRightItem_animated_;
    unk_2681B4EF8 = @"setRightItem";
    qword_2681B4F00 = (uint64_t)sel_setRightItems_animated_;
    unk_2681B4F08 = @"setRightItems";
    qword_2681B4F10 = (uint64_t)sel_setTitleView_animated_;
    unk_2681B4F18 = @"setTitleView";
    __KeyMapping_33 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backButtonTitle", @"hidesBackButton", @"hidesBackButton", @"leftItem", @"leftItem", @"leftItems", @"leftItems", @"leftItemsSupplementBackButton", @"leftItemsSupplementBackButton", @"leftMostItem", @"leftMostItem", @"prompt", @"prompt", @"rightItem", @"rightItem", @"rightItems", @"rightItems",
                        @"title",
                        @"title",
                        @"titleView",
                        @"titleView",
                        0);
    MEMORY[0x270F9A758]();
  }
}

@end