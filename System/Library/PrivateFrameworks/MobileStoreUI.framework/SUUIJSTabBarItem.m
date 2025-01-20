@interface SUUIJSTabBarItem
- (IKJSNavigationDocument)navigationDocument;
- (NSString)badgeValue;
- (NSString)identifier;
- (NSString)rootURL;
- (NSString)title;
- (SUUIJSTabBarItem)initWithAppContext:(id)a3 navigationController:(id)a4 tabBarItem:(id)a5 owner:(id)a6;
- (SUUITabBarItem)tabBarItem;
- (void)dealloc;
- (void)setBadgeValue:(id)a3;
@end

@implementation SUUIJSTabBarItem

- (SUUIJSTabBarItem)initWithAppContext:(id)a3 navigationController:(id)a4 tabBarItem:(id)a5 owner:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, a6);
  v26.receiver = self;
  v26.super_class = (Class)SUUIJSTabBarItem;
  v13 = [(IKJSObject *)&v26 initWithAppContext:v10];
  if (v13)
  {
    id v14 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v13->_owner, v14);

    objc_storeStrong((id *)&v13->_tabBarItem, a5);
    if (v11)
    {
      v15 = [(IKJSNavigationDocument *)[SUUIJSNavigationDocument alloc] initWithAppContext:v10 navigationController:v11];
      navigationDocument = v13->_navigationDocument;
      v13->_navigationDocument = v15;

      v17 = [v10 jsContext];
      v18 = (void *)MEMORY[0x263F10388];
      v19 = [MEMORY[0x263F10390] valueWithObject:v13->_navigationDocument inContext:v17];
      uint64_t v20 = [v18 managedValueWithValue:v19];
      managedNavigationDocument = v13->_managedNavigationDocument;
      v13->_managedNavigationDocument = (JSManagedValue *)v20;

      v22 = [v17 virtualMachine];
      v23 = v13->_managedNavigationDocument;
      id v24 = objc_loadWeakRetained(&location);
      [v22 addManagedReference:v23 withOwner:v24];
    }
  }
  objc_destroyWeak(&location);

  return v13;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v4 = self->_managedNavigationDocument;
  v5 = v4;
  if (WeakRetained) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = [(IKJSObject *)self appContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __27__SUUIJSTabBarItem_dealloc__block_invoke;
    v9[3] = &unk_265405AA8;
    id v10 = v5;
    id v11 = WeakRetained;
    [v7 evaluate:v9 completionBlock:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIJSTabBarItem;
  [(SUUIJSTabBarItem *)&v8 dealloc];
}

void __27__SUUIJSTabBarItem_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 virtualMachine];
  [v3 removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 40)];
}

- (NSString)badgeValue
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__47;
  v9 = __Block_byref_object_dispose__47;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SUUIJSTabBarItem_badgeValue__block_invoke;
  v4[3] = &unk_2654008E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(MEMORY[0x263EF83A0], v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __30__SUUIJSTabBarItem_badgeValue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) underlyingTabBarItem];
  uint64_t v2 = [v5 badgeValue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)identifier
{
  return [(SUUITabBarItem *)self->_tabBarItem tabIdentifier];
}

- (IKJSNavigationDocument)navigationDocument
{
  return (IKJSNavigationDocument *)self->_navigationDocument;
}

- (NSString)rootURL
{
  uint64_t v2 = [(SUUITabBarItem *)self->_tabBarItem rootURL];
  uint64_t v3 = [v2 absoluteString];

  return (NSString *)v3;
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUUIJSTabBarItem_setBadgeValue___block_invoke;
  v6[3] = &unk_265400890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __34__SUUIJSTabBarItem_setBadgeValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) underlyingTabBarItem];
  [v2 setBadgeValue:*(void *)(a1 + 40)];
}

- (NSString)title
{
  id v2 = [(SUUITabBarItem *)self->_tabBarItem underlyingTabBarItem];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (SUUITabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_navigationDocument, 0);

  objc_storeStrong((id *)&self->_managedNavigationDocument, 0);
}

@end