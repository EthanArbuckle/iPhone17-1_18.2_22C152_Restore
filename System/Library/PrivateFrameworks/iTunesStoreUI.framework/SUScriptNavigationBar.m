@interface SUScriptNavigationBar
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSArray)navigationItems;
- (NSString)prompt;
- (SUScriptNavigationBar)init;
- (SUScriptNavigationBar)initWithNativeNavigationBar:(id)a3;
- (SUScriptNavigationItem)backNavigationItem;
- (SUScriptNavigationItem)leftItem;
- (SUScriptNavigationItem)rightItem;
- (SUScriptNavigationItem)topNavigationItem;
- (id)_className;
- (id)_copyTopNavigationItem;
- (id)_nativeNavigationBar;
- (id)_topNavigationItem;
- (id)buttonWithTitle:(id)a3 style:(id)a4 target:(id)a5 action:(id)a6;
- (id)scriptAttributeKeys;
- (id)translucent;
- (int64_t)barStyle;
- (int64_t)barStyleBlack;
- (int64_t)barStyleDefault;
- (void)setBackNavigationItem:(id)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setLeftButton:(id)a3;
- (void)setLeftItem:(id)a3;
- (void)setLeftItem:(id)a3 animated:(BOOL)a4;
- (void)setNavigationItems:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setRightItem:(id)a3;
- (void)setRightItem:(id)a3 animated:(BOOL)a4;
- (void)setTopNavigationItem:(id)a3;
- (void)setTranslucent:(id)a3;
- (void)tearDownUserInterface;
@end

@implementation SUScriptNavigationBar

- (SUScriptNavigationBar)init
{
  return [(SUScriptNavigationBar *)self initWithNativeNavigationBar:0];
}

- (SUScriptNavigationBar)initWithNativeNavigationBar:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUScriptNavigationBar;
  v4 = [(SUScriptObject *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    [(SUScriptObject *)v4 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:a3]];
  }
  return v5;
}

- (void)tearDownUserInterface
{
  +[SUScriptNavigationItem disconnectNavigationItem:forScriptObject:](SUScriptNavigationItem, "disconnectNavigationItem:forScriptObject:", objc_msgSend(-[SUScriptNavigationBar _nativeNavigationBar](self, "_nativeNavigationBar"), "topItem"), self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationBar;
  [(SUScriptObject *)&v3 tearDownUserInterface];
}

- (SUScriptNavigationItem)backNavigationItem
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __43__SUScriptNavigationBar_backNavigationItem__block_invoke;
  v10 = &unk_264812E48;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __43__SUScriptNavigationBar_backNavigationItem__block_invoke, &unk_264812E48, v11, &v13), (objc_super v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

SUScriptNavigationItem *__43__SUScriptNavigationBar_backNavigationItem__block_invoke(uint64_t a1)
{
  result = (SUScriptNavigationItem *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "backItem");
  if (result)
  {
    result = [[SUScriptNavigationItem alloc] initWithNativeNavigationItem:result];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (int64_t)barStyle
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __33__SUScriptNavigationBar_barStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "barStyle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return @"iTunesNavigationBar";
}

- (SUScriptNavigationItem)leftItem
{
  id v2 = [(SUScriptNavigationBar *)self _topNavigationItem];

  return (SUScriptNavigationItem *)[v2 leftItem];
}

- (NSArray)navigationItems
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __40__SUScriptNavigationBar_navigationItems__block_invoke;
  v10 = &unk_264812E48;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v7, 3221225472, __40__SUScriptNavigationBar_navigationItems__block_invoke, &unk_264812E48, v11, &v13), (objc_super v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (NSArray *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __40__SUScriptNavigationBar_navigationItems__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "items");
  uint64_t result = [v2 count];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = [[SUScriptNavigationItem alloc] initWithNativeNavigationItem:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];

          ++v6;
        }
        while (v4 != v6);
        uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSString)prompt
{
  id v2 = [(SUScriptNavigationBar *)self _topNavigationItem];

  return (NSString *)[v2 prompt];
}

- (SUScriptNavigationItem)rightItem
{
  id v2 = [(SUScriptNavigationBar *)self _topNavigationItem];

  return (SUScriptNavigationItem *)[v2 rightItem];
}

- (void)setBackNavigationItem:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"topNavigationItem"];

  [v3 throwException:v4];
}

- (void)setBarStyle:(int64_t)a3
{
}

uint64_t __37__SUScriptNavigationBar_setBarStyle___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _nativeNavigationBar];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setBarStyle:v3];
}

- (void)setLeftItem:(id)a3
{
}

- (void)setLeftItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SUScriptNavigationBar *)self _topNavigationItem];

  [v6 setLeftItem:a3 animated:v4];
}

- (void)setNavigationItems:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"navigationItems"];

  [v3 throwException:v4];
}

- (void)setPrompt:(id)a3
{
  id v4 = [(SUScriptNavigationBar *)self _topNavigationItem];

  [v4 setPrompt:a3];
}

- (void)setRightItem:(id)a3
{
}

- (void)setRightItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SUScriptNavigationBar *)self _topNavigationItem];

  [v6 setRightItem:a3 animated:v4];
}

- (void)setTopNavigationItem:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"topNavigationItem"];

  [v3 throwException:v4];
}

- (void)setTranslucent:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __40__SUScriptNavigationBar_setTranslucent___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _nativeNavigationBar];
  uint64_t v3 = [*(id *)(a1 + 40) BOOLValue];

  return [v2 setTranslucent:v3];
}

- (SUScriptNavigationItem)topNavigationItem
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __42__SUScriptNavigationBar_topNavigationItem__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __42__SUScriptNavigationBar_topNavigationItem__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyTopNavigationItem];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)translucent
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __36__SUScriptNavigationBar_translucent__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "isTranslucent");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)barStyleBlack
{
  return 1;
}

- (int64_t)barStyleDefault
{
  return 0;
}

- (id)buttonWithTitle:(id)a3 style:(id)a4 target:(id)a5 action:(id)a6
{
  long long v11 = objc_alloc_init(SUScriptButton);
  [(SUScriptObject *)self checkInScriptObject:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(SUScriptButton *)v11 setAction:a6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUScriptButton *)v11 setStyle:a4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUScriptButton *)v11 setTarget:a5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUScriptButton *)v11 setTitle:a3];
  }

  return v11;
}

- (void)setLeftButton:(id)a3
{
}

- (void)setRightButton:(id)a3
{
}

- (id)_copyTopNavigationItem
{
  id v3 = [(SUScriptNavigationBar *)self _nativeNavigationBar];
  uint64_t v4 = (SUScriptNavigationItem *)[v3 topItem];
  id v5 = [(SUScriptObject *)self parentViewController];
  uint64_t v6 = (void *)[v5 navigationController];
  if (v3 == (id)[v6 navigationBar]
    && objc_msgSend(v5, "isDescendantOfViewController:", objc_msgSend(v6, "topViewController")))
  {
    uint64_t v4 = (SUScriptNavigationItem *)[v5 navigationItemForScriptInterface];
  }
  if (v4)
  {
    uint64_t v4 = [[SUScriptNavigationItem alloc] initWithNativeNavigationItem:v4];
    [(SUScriptObject *)self checkInScriptObject:v4];
  }
  return v4;
}

- (id)_nativeNavigationBar
{
  id v3 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "navigationController");

  return (id)[v5 navigationBar];
}

- (id)_topNavigationItem
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__3;
  char v8 = __Block_byref_object_dispose__3;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __43__SUScriptNavigationBar__topNavigationItem__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyTopNavigationItem];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_5, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationBar;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_3, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationBar;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNavigationBar;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_5 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_3 = (uint64_t)sel_setLeftItem_animated_;
    unk_2681B4760 = @"setLeftItem";
    qword_2681B4768 = (uint64_t)sel_setRightItem_animated_;
    unk_2681B4770 = @"setRightItem";
    qword_2681B4778 = (uint64_t)sel_buttonWithTitle_style_target_action_;
    unk_2681B4780 = @"createButton";
    qword_2681B4788 = (uint64_t)sel_setLeftButton_animated_;
    unk_2681B4790 = @"setLeftButton";
    qword_2681B4798 = (uint64_t)sel_setRightButton_animated_;
    unk_2681B47A0 = @"setRightButton";
    __KeyMapping_5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backNavigationItem", @"barStyle", @"barStyle", @"leftItem", @"leftItem", @"navigationItems", @"navigationItems", @"prompt", @"prompt", @"rightItem", @"rightItem", @"topNavigationItem", @"topNavigationItem", @"translucent", @"translucent", @"BAR_STYLE_DEFAULT", @"barStyleDefault",
                       @"BAR_STYLE_BLACK",
                       @"barStyleBlack",
                       @"leftButton",
                       @"leftButton",
                       @"rightButton",
                       @"rightButton",
                       0);
  }
}

@end