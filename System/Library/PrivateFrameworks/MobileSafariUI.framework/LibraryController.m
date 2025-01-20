@interface LibraryController
- (BOOL)isSelectingItem;
- (BOOL)libraryViewController:(id)a3 shouldPersistSelectionForItem:(id)a4;
- (LibraryConfiguration)configuration;
- (LibraryController)initWithConfiguration:(id)a3;
- (LibraryViewController)sidebarViewController;
- (NSString)currentCollection;
- (SidebarUIProxy)sidebarUIProxy;
- (void)_reportSelectedItemForAnalytics:(id)a3;
- (void)_updateSidebarButton;
- (void)libraryViewController:(id)a3 didSelectItem:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)registerItem:(id)a3 forCollectionType:(id)a4;
- (void)reloadExpansionStateForTabGroup:(id)a3;
- (void)setCurrentCollection:(id)a3;
- (void)setSidebarUIProxy:(id)a3;
- (void)setSidebarViewController:(id)a3;
@end

@implementation LibraryController

- (LibraryViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (void)setSidebarUIProxy:(id)a3
{
}

- (LibraryController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LibraryController;
  v6 = [(LibraryController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)reloadExpansionStateForTabGroup:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(LibraryViewController *)self->_sidebarViewController sectionControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    v22 = self;
    v24 = v5;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      uint64_t v21 = v7;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v23 = v10;
          v11 = [v10 filteredItemControllers];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v26;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v17 = [v16 tab];
                  if (v17)
                  {
                  }
                  else
                  {
                    v18 = [v16 tabGroup];
                    char v19 = [v4 isEqual:v18];

                    if (v19)
                    {
                      [(LibraryViewController *)v22->_sidebarViewController reloadExpansionStateForItem:v16 inSection:v23];

                      id v5 = v24;
                      goto LABEL_23;
                    }
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          id v5 = v24;
          uint64_t v8 = v20;
          uint64_t v7 = v21;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }
LABEL_23:
}

- (void)_updateSidebarButton
{
  id v9 = [(SidebarUIProxy *)self->_sidebarUIProxy leadingSidebarButtonItem];
  v3 = [(LibraryViewController *)self->_sidebarViewController navigationItem];
  [v3 setLeftBarButtonItem:v9];

  id v4 = [(SidebarUIProxy *)self->_sidebarUIProxy trailingSidebarButtonItem];
  id v5 = [(LibraryViewController *)self->_sidebarViewController navigationItem];
  [v5 setRightBarButtonItem:v4];

  uint64_t v6 = [(LibraryViewController *)self->_sidebarViewController navigationController];
  uint64_t v7 = [v6 topViewController];

  if (v7 != self->_sidebarViewController)
  {
    uint64_t v8 = [(LibraryViewController *)v7 navigationItem];
    [v8 setRightBarButtonItem:v9];
  }
}

- (void)setSidebarViewController:(id)a3
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v5 = (LibraryViewController *)a3;
  sidebarViewController = self->_sidebarViewController;
  if (sidebarViewController != v5)
  {
    uint64_t v7 = [(LibraryViewController *)sidebarViewController navigationController];
    [v7 setDelegate:0];

    [(LibraryViewController *)self->_sidebarViewController setDelegate:0];
    objc_storeStrong((id *)&self->_sidebarViewController, a3);
    uint64_t v8 = [(LibraryController *)self configuration];
    [(LibraryViewController *)self->_sidebarViewController setConfiguration:v8];

    [(LibraryViewController *)self->_sidebarViewController setDelegate:self];
    id v9 = [(LibraryViewController *)self->_sidebarViewController navigationController];
    [v9 setDelegate:self];

    objc_super v10 = [(LibraryViewController *)self->_sidebarViewController navigationController];
    v11 = [v10 navigationBar];
    [v11 setPrefersLargeTitles:1];

    uint64_t v12 = [[MainLibrarySectionController alloc] initWithConfiguration:self->_configuration];
    objc_storeWeak((id *)&self->_mainLibrarySectionController, v12);
    uint64_t v13 = [[TabGroupLibrarySectionController alloc] initWithConfiguration:self->_configuration forNamedGroups:0];
    v30[0] = v13;
    uint64_t v14 = [[TabGroupLibrarySectionController alloc] initWithConfiguration:self->_configuration forNamedGroups:1];
    v30[1] = v14;
    v30[2] = v12;
    v15 = [[SharedWithYouSectionController alloc] initWithConfiguration:self->_configuration];
    v30[3] = v15;
    v16 = [[ProfilesSectionController alloc] initWithConfiguration:self->_configuration];
    v30[4] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    [(LibraryViewController *)self->_sidebarViewController setSectionControllers:v17];

    v18 = [MEMORY[0x1E4F1CA60] dictionary];
    itemsByCollection = self->_itemsByCollection;
    self->_itemsByCollection = v18;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v20 = [(LibraryViewController *)self->_sidebarViewController sectionControllers];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v24++) registerItemsWithRegistration:self];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v22);
    }

    [(LibraryController *)self _updateSidebarButton];
  }
}

- (NSString)currentCollection
{
  v3 = [(LibraryViewController *)self->_sidebarViewController presentedItemController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(LibraryViewController *)self->_sidebarViewController selectedItemController];
  }
  id v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForLastSelectedItemController);
  id v8 = objc_loadWeakRetained((id *)&self->_lastSelectedItemController);
  id v9 = v8;
  if (v6) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10 && WeakRetained != 0)
  {
    uint64_t v12 = [(LibraryViewController *)self->_sidebarViewController navigationController];
    uint64_t v13 = [v12 viewControllers];
    int v14 = [v13 containsObject:WeakRetained];

    if (v14) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  itemsByCollection = self->_itemsByCollection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__LibraryController_currentCollection__block_invoke;
  v20[3] = &unk_1E6D7B778;
  id v21 = v6;
  id v16 = v6;
  v17 = [(NSMutableDictionary *)itemsByCollection keysOfEntriesPassingTest:v20];
  v18 = [v17 anyObject];

  return (NSString *)v18;
}

uint64_t __38__LibraryController_currentCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqual:*(void *)(a1 + 32)];
}

- (void)setCurrentCollection:(id)a3
{
  id v7 = a3;
  id v4 = [(LibraryController *)self currentCollection];
  char v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = [(NSMutableDictionary *)self->_itemsByCollection objectForKeyedSubscript:v7];
    [(LibraryViewController *)self->_sidebarViewController setSelectedItemController:v6];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v13 = (LibraryViewController *)a4;
  id v7 = a3;
  id v8 = [v7 viewControllers];
  id v9 = [v8 firstObject];
  BOOL v10 = v9 == v13;

  [v7 setToolbarHidden:v10 animated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mainLibrarySectionController);
    [WeakRetained updateToolbarIfNeeded];
  }
  [(LibraryController *)self _updateSidebarButton];
  uint64_t v12 = v13;
  if (self->_sidebarViewController == v13)
  {
    [(LibraryViewController *)v13 setPresentedItemController:0];
    uint64_t v12 = v13;
  }
}

- (void)registerItem:(id)a3 forCollectionType:(id)a4
{
}

- (void)libraryViewController:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  BOOL isSelectingItem = self->_isSelectingItem;
  self->_BOOL isSelectingItem = 1;
  id obj = v5;
  id v7 = [v5 viewController];
  if (v7)
  {
    objc_storeWeak((id *)&self->_lastSelectedItemController, obj);
    objc_storeWeak((id *)&self->_viewControllerForLastSelectedItemController, v7);
    id v8 = [(LibraryViewController *)self->_sidebarViewController navigationController];
    id v9 = [v8 topViewController];

    if (v9 == v7)
    {
      id v13 = (id)[v8 popToRootViewControllerAnimated:1];
    }
    else
    {
      BOOL v10 = [v8 viewControllers];
      int v11 = [v10 containsObject:v7];

      if (v11)
      {
        id v12 = (id)[v8 popToViewController:v7 animated:0];
      }
      else
      {
        int v14 = [v8 viewControllers];
        BOOL v15 = [v14 count] == 1;

        id v16 = (id)[v8 popToRootViewControllerAnimated:0];
        [v8 pushViewController:v7 animated:v15];
      }
    }
    [(LibraryController *)self _reportSelectedItemForAnalytics:obj];
  }
  else
  {
    [obj didSelectItem];
  }
  self->_BOOL isSelectingItem = isSelectingItem;
}

- (void)_reportSelectedItemForAnalytics:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v4 = v3;
    uint64_t v5 = 6;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = [MEMORY[0x1E4F97E48] sharedLogger];
      id v4 = v3;
      uint64_t v5 = 7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      v3 = [MEMORY[0x1E4F97E48] sharedLogger];
      id v4 = v3;
      uint64_t v5 = 10;
    }
  }
  [v3 didUseSidebarAction:v5];

LABEL_8:
}

- (BOOL)libraryViewController:(id)a3 shouldPersistSelectionForItem:(id)a4
{
  return objc_msgSend(a4, "shouldPersistSelection", a3);
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isSelectingItem
{
  return self->_isSelectingItem;
}

- (SidebarUIProxy)sidebarUIProxy
{
  return self->_sidebarUIProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_sidebarUIProxy, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_mainLibrarySectionController);
  objc_destroyWeak((id *)&self->_viewControllerForLastSelectedItemController);
  objc_destroyWeak((id *)&self->_lastSelectedItemController);
  objc_storeStrong((id *)&self->_itemsByCollection, 0);
}

@end