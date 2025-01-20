@interface SUScriptMenuViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)selectedIndex;
- (NSString)title;
- (WebScriptObject)action;
- (id)_className;
- (id)_viewController;
- (id)itemWithTitle:(id)a3 userInfo:(id)a4;
- (id)items;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setItems:(id)a3;
- (void)setSelectedIndex:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUScriptMenuViewController

- (void)dealloc
{
  [(SUScriptFunction *)self->_action setScriptObject:0];
  [(SUScriptFunction *)self->_action setThisObject:0];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuViewController;
  [(SUScriptViewController *)&v3 dealloc];
}

- (id)newNativeViewController
{
  objc_super v3 = objc_alloc_init(SUNativeScriptMenuViewController);
  [(SUViewController *)v3 setClientInterface:[(SUScriptObject *)self clientInterface]];
  return v3;
}

- (id)itemWithTitle:(id)a3 userInfo:(id)a4
{
  v6 = objc_alloc_init(SUScriptMenuItem);
  [(SUScriptMenuItem *)v6 setTitle:a3];
  [(SUScriptMenuItem *)v6 setUserInfo:a4];

  return v6;
}

- (WebScriptObject)action
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __36__SUScriptMenuViewController_action__block_invoke, &unk_264812E70, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptMenuViewController_action__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "action"), "scriptObject");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesMenuViewController";
}

- (id)items
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __35__SUScriptMenuViewController_items__block_invoke, &unk_264812E70, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __35__SUScriptMenuViewController_items__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "menuItems");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)selectedIndex
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  uint64_t v4 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)objc_msgSend(NSNumber, "numberWithInteger:", v7[3], v4, 3221225472, __43__SUScriptMenuViewController_selectedIndex__block_invoke, &unk_264812E70, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __43__SUScriptMenuViewController_selectedIndex__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "selectedIndex");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __40__SUScriptMenuViewController_setAction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setThisObject:");
    v2 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  [v2 setScriptObject:*(void *)(a1 + 40)];
  id v3 = (void *)[*(id *)(a1 + 32) _viewController];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);

  return [v3 setAction:v4];
}

- (void)setItems:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      id v3 = 0;
      goto LABEL_11;
    }
    id v3 = (id)[v3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    if (!v3)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_11;
    }
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__18;
  uint64_t v9 = __Block_byref_object_dispose__18;
  uint64_t v10 = 0;
  WebThreadRunOnMainThread();
  if (v6[5])
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
  }
  if (v3) {
    [(SUScriptObject *)self checkInScriptObjects:v3];
  }
  WebThreadRunOnMainThread();
  _Block_object_dispose(&v5, 8);
LABEL_11:
}

id __39__SUScriptMenuViewController_setItems___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "menuItems");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __39__SUScriptMenuViewController_setItems___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _viewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setMenuItems:v3];
}

- (void)setSelectedIndex:(id)a3
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

uint64_t __47__SUScriptMenuViewController_setSelectedIndex___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _viewController];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return [v2 setSelectedIndex:v4];
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __39__SUScriptMenuViewController_setTitle___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _viewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setTitle:v3];
}

- (NSString)title
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __35__SUScriptMenuViewController_title__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __35__SUScriptMenuViewController_title__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "title");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_viewController
{
  v2 = [(SUScriptViewController *)self nativeViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_29, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_23, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMenuViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_29, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_23 = (uint64_t)sel_itemWithTitle_userInfo_;
    *(void *)algn_2681B4CB8 = @"createItem";
    __KeyMapping_29 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"action", @"items", @"items", @"selectedIndex", @"selectedIndex", @"title", @"title", 0);
  }
}

@end