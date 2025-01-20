@interface SUUINavigationDocumentController
- (BOOL)isStopPageBagValueOverrideEnabledForTab:(id)a3;
- (BOOL)isStopPageEnabledForTab:(id)a3;
- (NSArray)documentStackItems;
- (SUUIClientContext)clientContext;
- (SUUINavigationDocumentController)initWithNavigationController:(id)a3;
- (SUUINavigationDocumentDelegate)delegate;
- (UINavigationController)moreNavigationController;
- (UINavigationController)navigationController;
- (UINavigationController)overrideNavigationController;
- (id)_activeNavigationController;
- (id)asNilStringIfUndefined:(id)a3;
- (id)documents;
- (void)_applyDocumentReplacementForOldStackItem:(id)a3 atOldIndex:(int64_t)a4 withStackItem:(id)a5;
- (void)_ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (void)_handleStackDidChange;
- (void)_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:(id)a3;
- (void)_unloadAllStackItems;
- (void)ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)popAllDocuments;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreNavigationController:(id)a3;
- (void)setOverrideNavigationController:(id)a3;
- (void)setStackItems:(id)a3 animated:(BOOL)a4;
- (void)showStopPageForTab:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artwork:(id)a7 deeplinkUrl:(id)a8 force:(BOOL)a9 purchasesUrl:(id)a10 wishlistButtonTitle:(id)a11 showWishlistButton:(BOOL)a12;
@end

@implementation SUUINavigationDocumentController

- (void)setDelegate:(id)a3
{
}

- (void)setClientContext:(id)a3
{
}

- (void)ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests count])
  {
    v11 = [[SUUINavigationStackEnsureConsistencyRequest alloc] initWithNavigationControllerOperation:a3 operationDidComplete:v4];
    [(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests addObject:v11];
LABEL_5:

    return;
  }
  uint64_t v7 = [(UINavigationController *)self->_navigationController transitionCoordinator];
  if (v7)
  {
    v11 = (SUUINavigationStackEnsureConsistencyRequest *)v7;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingNavigationStackEnsureConsistencyRequests = self->_pendingNavigationStackEnsureConsistencyRequests;
    self->_pendingNavigationStackEnsureConsistencyRequests = v8;

    v10 = [[SUUINavigationStackEnsureConsistencyRequest alloc] initWithNavigationControllerOperation:a3 operationDidComplete:v4];
    [(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests addObject:v10];
    [(SUUINavigationDocumentController *)self _scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:v11];

    goto LABEL_5;
  }
  [(SUUINavigationDocumentController *)self _ensureStackConsistencyForNavigationControllerOperation:a3 operationDidComplete:v4];
}

- (void)_ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  v35[2] = *MEMORY[0x263EF8340];
  BOOL v4 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && !a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4)
  {
    BOOL v6 = a4;
    v8 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    v9 = [v8 viewControllers];

    BOOL v28 = v6;
    if (v6)
    {
      uint64_t v10 = [(NSMutableArray *)self->_stackItems count];
      if (v10)
      {
        uint64_t v11 = v10 - 1;
        do
        {
          v12 = [(NSMutableArray *)self->_stackItems objectAtIndex:v11];
          v13 = [v12 viewController];
          uint64_t v14 = [v9 indexOfObjectIdenticalTo:v13];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = [v12 document];
            [v15 onUnload];

            [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v11];
          }

          --v11;
        }
        while (v11 != -1);
      }
    }
    if (v4)
    {
      v16 = [(SUUINavigationDocumentController *)self delegate];
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        v27 = v16;
        uint64_t v29 = [v9 count];
        if (v29)
        {
          unint64_t v17 = 0;
          id v18 = 0;
          do
          {
            v19 = [v9 objectAtIndex:v17];
            if (v17 >= [(NSMutableArray *)self->_stackItems count])
            {
              v20 = 0;
            }
            else
            {
              v20 = [(NSMutableArray *)self->_stackItems objectAtIndex:v17];
            }
            v21 = [v20 viewController];

            if (v19 != v21)
            {
              v22 = [[SUUIDocumentStackItem alloc] initWithDocument:0 presentationOptions:0];
              [(SUUIDocumentStackItem *)v22 setViewController:v19];
              [(NSMutableArray *)self->_stackItems insertObject:v22 atIndex:v17];
              if (!v18) {
                id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              v34[0] = @"stackItem";
              v34[1] = @"viewControllerClass";
              v35[0] = v22;
              v23 = (objc_class *)objc_opt_class();
              v24 = NSStringFromClass(v23);
              v35[1] = v24;
              v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
              v26 = (void *)[v25 mutableCopy];
              [v18 addObject:v26];
            }
            ++v17;
          }
          while (v29 != v17);
        }
        else
        {
          id v18 = 0;
        }
        v16 = v27;
        if ([v18 count])
        {
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke;
          v30[3] = &unk_2654055A8;
          id v31 = v27;
          v32 = self;
          id v33 = v18;
          [v31 navigationDocumentController:self requestsAccessToAppContextUsingBlock:v30];
        }
      }
    }
    if (v28) {
      [(SUUINavigationDocumentController *)self _handleStackDidChange];
    }
  }
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (SUUINavigationDocumentController)initWithNavigationController:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUINavigationDocumentController;
  BOOL v6 = [(SUUINavigationDocumentController *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationController, a3);
    uint64_t v8 = storeSemanticContentAttribute();
    v9 = [(UINavigationController *)v7->_navigationController view];
    [v9 setSemanticContentAttribute:v8];

    uint64_t v10 = [(UINavigationController *)v7->_navigationController navigationBar];
    [v10 setSemanticContentAttribute:v8];

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stackItems = v7->_stackItems;
    v7->_stackItems = v11;
  }
  return v7;
}

- (SUUINavigationDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUINavigationDocumentDelegate *)WeakRetained;
}

- (id)_activeNavigationController
{
  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController) {
    return moreNavigationController;
  }
  moreNavigationController = self->_overrideNavigationController;
  if (moreNavigationController) {
    return moreNavigationController;
  }
  else {
    return self->_navigationController;
  }
}

- (void)popAllDocuments
{
  [(SUUINavigationDocumentController *)self _unloadAllStackItems];
  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0) {
    id v4 = [(UINavigationController *)moreNavigationController popToRootViewControllerAnimated:0];
  }
  else {
    [(UINavigationController *)self->_navigationController setViewControllers:MEMORY[0x263EFFA68] animated:0];
  }
  [(SUUINavigationDocumentController *)self _handleStackDidChange];
}

- (void)setStackItems:(id)a3 animated:(BOOL)a4
{
  BOOL v23 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(SUUINavigationDocumentController *)self _unloadAllStackItems];
  v24 = [(SUUINavigationDocumentController *)self clientContext];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = [v12 viewController];
        if (v13) {
          goto LABEL_8;
        }
        objc_super v14 = [SUUIDocumentContainerViewController alloc];
        v15 = [v12 document];
        v16 = [v12 presentationOptions];
        v13 = [(SUUIDocumentContainerViewController *)v14 initWithDocument:v15 options:v16 clientContext:v24];

        [v12 setViewController:v13];
        if (v13)
        {
LABEL_8:
          [(NSMutableArray *)self->_stackItems addObject:v12];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0)
  {
    id v18 = [(UINavigationController *)moreNavigationController viewControllers];
    v19 = [v18 firstObject];

    if (v19) {
      [v6 insertObject:v19 atIndex:0];
    }
  }
  v20 = [(SUUINavigationDocumentController *)self _activeNavigationController];
  v21 = [v6 firstObject];
  if ([v21 conformsToProtocol:&unk_2706244A0]) {
    [v20 setTransitioningDelegate:v21];
  }
  v22 = [(SUUINavigationDocumentController *)self _activeNavigationController];
  [v22 setViewControllers:v6 animated:v23];

  [(SUUINavigationDocumentController *)self _handleStackDidChange];
}

- (id)documents
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_stackItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "document", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    goto LABEL_3;
  }
  stackItems = self->_stackItems;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__SUUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke;
  v25[3] = &unk_265400F78;
  id v26 = v9;
  uint64_t v12 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v25];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = [SUUIDocumentContainerViewController alloc];
    long long v14 = [(SUUINavigationDocumentController *)self clientContext];
    v15 = [(SUUIDocumentContainerViewController *)v13 initWithDocument:v8 options:v10 clientContext:v14];

    if (v15)
    {
      uint64_t v16 = [[SUUIDocumentStackItem alloc] initWithDocument:v8 presentationOptions:v10];
      [(SUUIDocumentStackItem *)v16 setViewController:v15];
      v24 = [(SUUINavigationDocumentController *)self _activeNavigationController];
      unint64_t v17 = [v24 viewControllers];
      id v18 = (void *)[v17 mutableCopy];

      BOOL v23 = [(NSMutableArray *)self->_stackItems objectAtIndex:v12];
      v19 = [v23 viewController];
      uint64_t v20 = [v18 indexOfObjectIdenticalTo:v19];

      v21 = self->_stackItems;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)v21 addObject:v16];
        v22 = v24;
        objc_msgSend(v24, "pushViewController:animated:", v15, -[SUUIDocumentStackItem isAnimated](v16, "isAnimated"));
      }
      else
      {
        [(NSMutableArray *)v21 insertObject:v16 atIndex:v12];
        [v18 insertObject:v15 atIndex:v20];
        v22 = v24;
        objc_msgSend(v24, "setViewControllers:animated:", v18, -[SUUIDocumentStackItem isAnimated](v16, "isAnimated"));
      }
      [(SUUINavigationDocumentController *)self _handleStackDidChange];
    }
    else
    {
      NSLog(&cfstr_NoViewControll_0.isa, v8, v10);
    }
  }
  else
  {
LABEL_3:
    [(SUUINavigationDocumentController *)self pushDocument:v8 options:v10];
  }
}

BOOL __74__SUUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popDocument
{
  if ([(NSMutableArray *)self->_stackItems count])
  {
    id v7 = [(NSMutableArray *)self->_stackItems lastObject];
    uint64_t v3 = [v7 isAnimated];
    BOOL v4 = [v7 document];
    [v4 onUnload];

    [(NSMutableArray *)self->_stackItems removeLastObject];
    uint64_t v5 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    id v6 = (id)[v5 popViewControllerAnimated:v3];

    [(SUUINavigationDocumentController *)self _handleStackDidChange];
  }
}

- (void)popToRootDocument
{
  uint64_t v3 = [(NSMutableArray *)self->_stackItems count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_stackItems objectAtIndex:v4 - 2];
      id v6 = [v5 document];
      [v6 onUnload];

      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v4 - 2];
      --v4;
    }
    while (v4 > 2);
  }
  if ([(NSMutableArray *)self->_stackItems count])
  {
    id v7 = [(NSMutableArray *)self->_stackItems firstObject];
    id v8 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    id v9 = [v7 viewController];
    id v10 = (id)[v8 popToViewController:v9 animated:1];
  }
  [(SUUINavigationDocumentController *)self _handleStackDidChange];
}

- (void)showStopPageForTab:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artwork:(id)a7 deeplinkUrl:(id)a8 force:(BOOL)a9 purchasesUrl:(id)a10 wishlistButtonTitle:(id)a11 showWishlistButton:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a10;
  id v25 = a11;
  objc_initWeak(location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __169__SUUINavigationDocumentController_showStopPageForTab_replacementAppAdamId_title_subtitle_artwork_deeplinkUrl_force_purchasesUrl_wishlistButtonTitle_showWishlistButton___block_invoke;
  block[3] = &unk_2654054E0;
  block[4] = self;
  BOOL v44 = a9;
  objc_copyWeak(&v43, location);
  id v35 = v23;
  id v36 = v24;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  id v41 = v22;
  id v42 = v25;
  BOOL v45 = a12;
  id v26 = v25;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  id v32 = v24;
  id v33 = v23;
  dispatch_sync(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);
}

void __169__SUUINavigationDocumentController_showStopPageForTab_replacementAppAdamId_title_subtitle_artwork_deeplinkUrl_force_purchasesUrl_wishlistButtonTitle_showWishlistButton___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _activeNavigationController];
  uint64_t v3 = [v2 viewControllers];

  if (!*(unsigned char *)(a1 + 112)
    && [v3 count]
    && ([v3 objectAtIndexedSubscript:0],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    id v8 = [*(id *)(a1 + 32) _activeNavigationController];
    id v9 = (id)[v8 popToRootViewControllerAnimated:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v5 = [WeakRetained asNilStringIfUndefined:*(void *)(a1 + 40)];

    if (v5) {
      v34 = (void *)[objc_alloc(NSURL) initWithString:v5];
    }
    else {
      v34 = 0;
    }
    id v10 = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v11 = [v10 asNilStringIfUndefined:*(void *)(a1 + 48)];

    id v31 = (void *)v5;
    id v32 = v3;
    id v30 = (void *)v11;
    if (v11) {
      id v33 = (void *)[objc_alloc(NSURL) initWithString:v11];
    }
    else {
      id v33 = 0;
    }
    uint64_t v12 = [_TtC13MobileStoreUI26SUUIStopPageViewController alloc];
    uint64_t v27 = *(void *)(a1 + 56);
    id v28 = v12;
    id v29 = objc_loadWeakRetained((id *)(a1 + 104));
    long long v13 = [v29 asNilStringIfUndefined:*(void *)(a1 + 64)];
    id v14 = objc_loadWeakRetained((id *)(a1 + 104));
    v15 = [v14 asNilStringIfUndefined:*(void *)(a1 + 72)];
    id v16 = objc_loadWeakRetained((id *)(a1 + 104));
    unint64_t v17 = [v16 asNilStringIfUndefined:*(void *)(a1 + 80)];
    uint64_t v18 = *(void *)(a1 + 88);
    id v19 = objc_loadWeakRetained((id *)(a1 + 104));
    id v20 = [v19 asNilStringIfUndefined:*(void *)(a1 + 96)];
    LOBYTE(v26) = *(unsigned char *)(a1 + 113);
    id v21 = [(SUUIStopPageViewController *)v28 initForTabIdentifier:v27 replacementAppAdamId:v13 title:v15 subtitle:v17 artworkDictionary:v18 deeplinkUrl:v34 purchasesUrl:v33 wishlistButtonTitle:v20 showWishlistButton:v26 clientContext:*(void *)(*(void *)(a1 + 32) + 32)];

    id v22 = [*(id *)(a1 + 32) _activeNavigationController];
    id v23 = [v22 tabBarItem];
    [v21 setTabBarItem:v23];

    id v24 = [*(id *)(a1 + 32) _activeNavigationController];
    v35[0] = v21;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    [v24 setViewControllers:v25];

    uint64_t v3 = v32;
  }
}

- (id)asNilStringIfUndefined:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && ([v3 isEqualToString:@"undefined"] & 1) != 0) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

- (BOOL)isStopPageEnabledForTab:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() isStopPageEnabledForTabIdentifier:v3];

  return v4;
}

- (BOOL)isStopPageBagValueOverrideEnabledForTab:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() isStopPageBagValueOverrideEnabledForTabIdentifier:v3];

  return v4;
}

- (void)popToDocument:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SUUINavigationDocumentController_popToDocument___block_invoke;
  v16[3] = &unk_265400F78;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v16];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    for (uint64_t i = [(NSMutableArray *)self->_stackItems count] - 1; i > v8; --i)
    {
      id v10 = [(NSMutableArray *)self->_stackItems objectAtIndex:i];
      uint64_t v11 = [v10 document];
      [v11 onUnload];

      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:i];
    }
    uint64_t v12 = [(NSMutableArray *)self->_stackItems objectAtIndex:v8];
    long long v13 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    id v14 = [v12 viewController];
    id v15 = (id)objc_msgSend(v13, "popToViewController:animated:", v14, objc_msgSend(v12, "isAnimated"));

    [(SUUINavigationDocumentController *)self _handleStackDidChange];
  }
}

BOOL __50__SUUINavigationDocumentController_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [SUUIDocumentContainerViewController alloc];
  id v9 = [(SUUINavigationDocumentController *)self clientContext];
  id v10 = [(SUUIDocumentContainerViewController *)v8 initWithDocument:v6 options:v7 clientContext:v9];

  if (v10)
  {
    uint64_t v11 = [[SUUIDocumentStackItem alloc] initWithDocument:v6 presentationOptions:v7];
    [(SUUIDocumentStackItem *)v11 setViewController:v10];
    [(NSMutableArray *)self->_stackItems addObject:v11];
    uint64_t v12 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    [(SUUIDocumentContainerViewController *)v10 preferredContentSize];
    if (*MEMORY[0x263F001B0] == v14 && *(double *)(MEMORY[0x263F001B0] + 8) == v13)
    {
      [v12 preferredContentSize];
      -[SUUIDocumentContainerViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
    }
    id v16 = [v12 viewControllers];
    uint64_t v17 = [v16 count];

    uint64_t v18 = [v12 transitionCoordinator];
    objc_msgSend(v12, "pushViewController:animated:", v10, -[SUUIDocumentStackItem isAnimated](v11, "isAnimated"));
    if (!v17)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__SUUINavigationDocumentController_pushDocument_options___block_invoke;
      aBlock[3] = &unk_265400890;
      id v24 = v12;
      id v25 = v10;
      id v19 = (void (**)(void))_Block_copy(aBlock);
      id v20 = v19;
      if (v18)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_4;
        v21[3] = &unk_265405508;
        id v22 = v19;
        [v18 animateAlongsideTransition:0 completion:v21];
      }
      else
      {
        v19[2](v19);
      }
    }
    [(SUUINavigationDocumentController *)self _handleStackDidChange];
  }
  else
  {
    NSLog(&cfstr_NoViewControll_0.isa, v6, v7);
  }
}

void __57__SUUINavigationDocumentController_pushDocument_options___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_2;
  v3[3] = &unk_265400890;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 _performBlockAfterCATransactionCommits:v3];
}

void __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_3;
  v3[3] = &unk_265400890;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 performWithoutAnimation:v3];
}

uint64_t __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutSubviews];

  id v3 = *(void **)(a1 + 40);
  return [v3 reloadData];
}

uint64_t __57__SUUINavigationDocumentController_pushDocument_options___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__SUUINavigationDocumentController_removeDocument___block_invoke;
  v15[3] = &unk_265400F78;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v15];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    id v9 = [(NSMutableArray *)self->_stackItems objectAtIndex:v7];
    id v10 = [(SUUINavigationDocumentController *)self _activeNavigationController];
    uint64_t v11 = [v10 viewControllers];
    uint64_t v12 = (void *)[v11 mutableCopy];

    double v13 = [v9 viewController];
    [v12 removeObjectIdenticalTo:v13];

    double v14 = [v9 document];
    [v14 onUnload];

    [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v8];
    [v10 setViewControllers:v12 animated:0];
    [(SUUINavigationDocumentController *)self _handleStackDidChange];
  }
}

BOOL __51__SUUINavigationDocumentController_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_3;
  }
  stackItems = self->_stackItems;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __73__SUUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke;
  v31[3] = &unk_265400F78;
  id v32 = v8;
  uint64_t v12 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v31];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [SUUIDocumentContainerViewController alloc];
    double v14 = [(SUUINavigationDocumentController *)self clientContext];
    id v15 = [(SUUIDocumentContainerViewController *)v13 initWithDocument:v9 options:v10 clientContext:v14];

    if (v15)
    {
      uint64_t v26 = [[SUUIDocumentStackItem alloc] initWithDocument:v9 presentationOptions:v10];
      [(SUUIDocumentStackItem *)v26 setViewController:v15];
      id v16 = [(NSMutableArray *)self->_stackItems objectAtIndex:v12];
      uint64_t v17 = [(SUUINavigationDocumentController *)self _activeNavigationController];
      uint64_t v18 = [v17 viewControllers];
      id v19 = [v16 viewController];
      id v25 = v18;
      uint64_t v20 = [v18 indexOfObjectIdenticalTo:v19];

      id v21 = v17;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL
        && ([v17 transitionCoordinator], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v23 = (void *)v22;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __73__SUUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2;
        v27[3] = &unk_265405530;
        v27[4] = self;
        id v28 = v16;
        uint64_t v30 = v12;
        id v24 = v26;
        id v29 = v26;
        [v23 animateAlongsideTransition:0 completion:v27];
      }
      else
      {
        id v24 = v26;
        [(SUUINavigationDocumentController *)self _applyDocumentReplacementForOldStackItem:v16 atOldIndex:v12 withStackItem:v26];
      }
    }
    else
    {
      NSLog(&cfstr_NoViewControll_0.isa, v9, v10);
    }
  }
  else
  {
LABEL_3:
    [(SUUINavigationDocumentController *)self pushDocument:v9 options:v10];
  }
}

BOOL __73__SUUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __73__SUUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyDocumentReplacementForOldStackItem:*(void *)(a1 + 40) atOldIndex:*(void *)(a1 + 56) withStackItem:*(void *)(a1 + 48)];
}

- (void)_applyDocumentReplacementForOldStackItem:(id)a3 atOldIndex:(int64_t)a4 withStackItem:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = [(SUUINavigationDocumentController *)self _activeNavigationController];
  id v10 = [v9 viewControllers];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v16 viewController];
  uint64_t v13 = [v11 indexOfObjectIdenticalTo:v12];

  double v14 = [v8 viewController];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_stackItems addObject:v8];
    objc_msgSend(v9, "pushViewController:animated:", v14, objc_msgSend(v8, "isAnimated"));
  }
  else
  {
    id v15 = [v16 document];
    [v15 onUnload];

    [(NSMutableArray *)self->_stackItems replaceObjectAtIndex:a4 withObject:v8];
    [v11 replaceObjectAtIndex:v13 withObject:v14];
    objc_msgSend(v9, "setViewControllers:animated:", v11, objc_msgSend(v8, "isAnimated"));
  }
  [(SUUINavigationDocumentController *)self _handleStackDidChange];
}

void __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2;
  v8[3] = &unk_265405580;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  [v7 evaluate:v8 completionBlock:0];
}

void __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 32) jsNavigationDocumentForNavigationDocumentController:*(void *)(a1 + 40) inContext:a2];
  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [v8 objectForKey:@"viewControllerClass"];
          uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"<document><nativeViewPlaceholderTemplate viewControllerClass=\"%@\"></nativeViewPlaceholderTemplate></document>", v9];
          id v11 = (void *)[objc_alloc(MEMORY[0x263F4B420]) initWithAppContext:*(void *)(a1 + 56) xmlStr:v10 error:0];
          [v11 setNavigationDocument:v3];
          id v12 = (void *)[objc_alloc(MEMORY[0x263F4B3D8]) initWithAppContext:*(void *)(a1 + 56) document:v11 owner:v3];
          [v8 setObject:v12 forKey:@"placeholderTemplateDocument"];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3;
    v15[3] = &unk_265405558;
    uint64_t v13 = *(void **)(a1 + 56);
    id v16 = *(id *)(a1 + 48);
    [v13 evaluateDelegateBlockSync:v15];
  }
}

void __113__SUUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "objectForKey:", @"stackItem", (void)v9);
        id v8 = [v6 objectForKey:@"placeholderTemplateDocument"];
        [v7 _setDocument:v8];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)_handleStackDidChange
{
  id v6 = [(NSMutableArray *)self->_stackItems firstObject];
  uint64_t v3 = [v6 viewController];
  uint64_t v4 = [(UINavigationController *)self->_navigationController tabBarItem];
  [v3 setTabBarItem:v4];

  uint64_t v5 = [(SUUINavigationDocumentController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 navigationDocumentStackDidChange:self];
  }
}

- (void)_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __126__SUUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke;
  v3[3] = &unk_265400820;
  void v3[4] = self;
  [a3 animateAlongsideTransition:0 completion:v3];
}

void __126__SUUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __126__SUUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_265400980;
  void v3[4] = *(void *)(a1 + 32);
  [v2 _performBlockAfterCATransactionCommits:v3];
}

void __126__SUUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) transitionCoordinator];
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = (id)v2;
  if (v2)
  {
    [v3 _scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:v2];
  }
  else
  {
    for (uint64_t i = (void *)v3[1]; [i count]; uint64_t i = *(void **)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:0];
      [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
      objc_msgSend(*(id *)(a1 + 32), "_ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", objc_msgSend(v5, "navigationControllerOperation"), objc_msgSend(v5, "operationDidComplete"));
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = 0;
  }
}

- (void)_unloadAllStackItems
{
  uint64_t v3 = [(NSMutableArray *)self->_stackItems count];
  if (v3 >= 1)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_stackItems objectAtIndex:v4 - 2];
      uint64_t v6 = [v5 document];
      [v6 onUnload];

      --v4;
    }
    while (v4 > 1);
  }
  stackItems = self->_stackItems;
  [(NSMutableArray *)stackItems removeAllObjects];
}

- (NSArray)documentStackItems
{
  return &self->_stackItems->super;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (UINavigationController)overrideNavigationController
{
  return self->_overrideNavigationController;
}

- (void)setOverrideNavigationController:(id)a3
{
}

- (UINavigationController)moreNavigationController
{
  return self->_moreNavigationController;
}

- (void)setMoreNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreNavigationController, 0);
  objc_storeStrong((id *)&self->_overrideNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_pendingNavigationStackEnsureConsistencyRequests, 0);
}

@end