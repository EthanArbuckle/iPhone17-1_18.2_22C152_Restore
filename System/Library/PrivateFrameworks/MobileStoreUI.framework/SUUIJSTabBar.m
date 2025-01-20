@interface SUUIJSTabBar
- (NSArray)tabs;
- (SUUIJSTabBar)initWithAppContext:(id)a3 controller:(id)a4;
- (SUUIJSTabBarItem)selectedTab;
- (SUUIJSTabBarItem)transientTab;
- (id)_selectedTabBarItemForIndex:(int64_t)a3;
- (void)_reloadTabBarItemsWithPreludeMainThreadWork:(id)a3;
- (void)sendOnNeedsContentForTabBarItem:(id)a3;
- (void)sendOnUpdate;
- (void)sendOnUpdateWithCompletion:(id)a3;
- (void)setSelectedTab:(id)a3;
@end

@implementation SUUIJSTabBar

- (SUUIJSTabBar)initWithAppContext:(id)a3 controller:(id)a4
{
  id v6 = a3;
  objc_initWeak(&location, a4);
  v10.receiver = self;
  v10.super_class = (Class)SUUIJSTabBar;
  v7 = [(IKJSObject *)&v10 initWithAppContext:v6];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_applicationController, v8);

    [(SUUIJSTabBar *)v7 _reloadTabBarItemsWithPreludeMainThreadWork:0];
  }
  objc_destroyWeak(&location);

  return v7;
}

- (void)sendOnNeedsContentForTabBarItem:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSObject *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUUIJSTabBar_sendOnNeedsContentForTabBarItem___block_invoke;
  v7[3] = &unk_265405AA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluate:v7 completionBlock:0];
}

void __48__SUUIJSTabBar_sendOnNeedsContentForTabBarItem___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
      id v8 = objc_msgSend(v7, "tabBarItem", (void)v16);
      v9 = *(void **)(a1 + 40);

      if (v8 == v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v25 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    id v22 = v10;
    v23[0] = @"type";
    v23[1] = @"detail";
    v24[0] = @"needscontent";
    v21 = @"tab";
    v11 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    v13 = *(void **)(a1 + 32);
    v20 = v12;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id v15 = (id)[v13 invokeMethod:@"onNeedsContent" withArguments:v14];

    id v2 = v10;
  }
LABEL_12:
}

- (void)sendOnUpdate
{
  uint64_t v3 = [(IKJSObject *)self appContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__SUUIJSTabBar_sendOnUpdate__block_invoke;
  v4[3] = &unk_2654022D0;
  v4[4] = self;
  [v3 evaluate:v4 completionBlock:0];
}

id __28__SUUIJSTabBar_sendOnUpdate__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) invokeMethod:@"onUpdate" withArguments:0];
}

- (void)sendOnUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke;
  v9[3] = &unk_2654022D0;
  v9[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_2;
  v7[3] = &unk_265400B68;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluate:v9 completionBlock:v7];
}

id __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) invokeMethod:@"onUpdate" withArguments:0];
}

void __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_3;
    block[3] = &unk_265403930;
    id v2 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __43__SUUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SUUIJSTabBarItem)selectedTab
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__SUUIJSTabBar_selectedTab__block_invoke;
  v6[3] = &unk_265406408;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = [(SUUIJSTabBar *)self _selectedTabBarItemForIndex:v8[3]];
  _Block_object_dispose(&v7, 8);
  return (SUUIJSTabBarItem *)v4;
}

void __27__SUUIJSTabBar_selectedTab__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _selectedTabBarIndex];
}

- (void)setSelectedTab:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SUUIJSTabBar_setSelectedTab___block_invoke;
  v7[3] = &unk_265406430;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 evaluateDelegateBlockSync:v7];
}

void __31__SUUIJSTabBar_setSelectedTab___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) tabBarItem];
  id v2 = [v9 tabIdentifier];
  int v3 = [v2 isEqualToString:@"transient"];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = [WeakRetained tabBarItems];
    uint64_t v8 = [v7 indexOfObject:v9];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
    uint64_t v5 = WeakRetained;
    uint64_t v6 = v8;
  }
  [WeakRetained _setSelectedTabBarIndex:v6];

LABEL_6:
}

- (void)_reloadTabBarItemsWithPreludeMainThreadWork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSObject *)self appContext];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__59;
  v39[4] = __Block_byref_object_dispose__59;
  id v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__59;
  v37 = __Block_byref_object_dispose__59;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__59;
  v31 = __Block_byref_object_dispose__59;
  id v32 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__SUUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke;
  v22[3] = &unk_265406458;
  id v6 = v4;
  v22[4] = self;
  id v23 = v6;
  v24 = v39;
  v25 = &v33;
  uint64_t v26 = &v27;
  [v5 evaluateDelegateBlockSync:v22];
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)v34[5], "count"));
  id v9 = (void *)v34[5];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__SUUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke_2;
  v18[3] = &unk_265406480;
  v21 = v39;
  v18[4] = self;
  id v10 = v5;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  [v9 enumerateObjectsUsingBlock:v18];
  v12 = (NSArray *)[v11 copy];
  tabs = self->_tabs;
  self->_tabs = v12;

  v14 = [[SUUITabBarItem alloc] initWithTabIdentifier:@"transient"];
  id v15 = [SUUIJSTabBarItem alloc];
  long long v16 = [(SUUIJSTabBarItem *)v15 initWithAppContext:v10 navigationController:v28[5] tabBarItem:v14 owner:self];
  transientTab = self->_transientTab;
  self->_transientTab = v16;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
}

void __60__SUUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  id v4 = [WeakRetained _navigationControllers];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
  id v9 = [v8 tabBarItems];
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v16 = objc_loadWeakRetained((id *)(a1[4] + 24));
  uint64_t v13 = [v16 _transientNavigationController];
  uint64_t v14 = *(void *)(a1[8] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __60__SUUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a3];
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];

  if (v5 == v6)
  {

    uint64_t v5 = 0;
  }
  id v7 = [v13 customRootViewController];
  id v8 = v7;
  if (!v5)
  {
    if ([v7 conformsToProtocol:&unk_2706A7860])
    {
      uint64_t v5 = [v8 appNavigationController];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v5 clientContext];

    if (!v9)
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      NSLog(&cfstr_NilClientConte.isa, v11, v13);
    }
  }
  v12 = [[SUUIJSTabBarItem alloc] initWithAppContext:*(void *)(a1 + 40) navigationController:v5 tabBarItem:v13 owner:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) addObject:v12];
}

- (id)_selectedTabBarItemForIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = self->_transientTab;
  }
  else if (a3 < 0 || [(NSArray *)self->_tabs count] <= a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSArray *)self->_tabs objectAtIndexedSubscript:a3];
  }
  return v4;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (SUUIJSTabBarItem)transientTab
{
  return self->_transientTab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientTab, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_destroyWeak((id *)&self->_applicationController);
}

@end