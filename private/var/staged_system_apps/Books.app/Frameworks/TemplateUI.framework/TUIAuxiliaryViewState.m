@interface TUIAuxiliaryViewState
- (BOOL)configureNavigationItem:(id)a3 scrollView:(id)a4 extraLeftItems:(id)a5 extraRightItems:(id)a6;
- (NSArray)leftItems;
- (NSArray)rightItems;
- (NSString)largeTitle;
- (NSString)title;
- (TUIAuxiliaryViewState)initWithSearchControllerDelegate:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5;
- (TUIHostingController)hostingController;
- (TUISearchController)searchController;
- (TUIViewVisibilityController)viewVisibilityController;
- (UIBarButtonItem)largeTitleAccessoryItem;
- (UISearchControllerDelegate)searchControllerDelegate;
- (UIView)largeTitleAccessoryView;
- (double)navigationBarBackgroundOpacity:(id)a3 anchors:(id)a4 scrollView:(id)a5;
- (id)_axBarButtonItemForLargeTitleAccessoryView:(id)a3;
- (id)_renderItemsForButtonTypeWithFactory:(id)a3 type:(unint64_t)a4 triggerManager:(id)a5;
- (id)_renderLargeNavigationBarTitle:(id)a3;
- (id)_renderLargeTitleAccessoryViewWithFactory:(id)a3;
- (id)_renderLeftNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4;
- (id)_renderNavigationBarTitle:(id)a3;
- (id)_renderRightNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4;
- (id)_renderSearchControllerWithFactory:(id)a3;
- (id)_renderTitleForType:(unint64_t)a3;
- (id)navigationBarItemMatchingQuery:(id)a3;
- (void)_setupHosting;
- (void)_updateSearchController:(id)a3;
- (void)configureSearchControllerIfNeededForNavigationItem:(id)a3;
- (void)setBarButtonItem:(id)a3 forHostingIdentifier:(id)a4;
- (void)setBarButtonItem:(id)a3 forIdentifier:(id)a4;
- (void)updateWithRenderModel:(id)a3 factory:(id)a4 triggerManager:(id)a5 promoteAccessory:(BOOL)a6;
@end

@implementation TUIAuxiliaryViewState

- (TUIAuxiliaryViewState)initWithSearchControllerDelegate:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIAuxiliaryViewState;
  v11 = [(TUIAuxiliaryViewState *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_searchControllerDelegate, v8);
    objc_storeStrong((id *)&v12->_hostingController, a4);
    objc_storeStrong((id *)&v12->_viewVisibilityController, a5);
    v13 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:5 capacity:3];
    barButtonItems = v12->_barButtonItems;
    v12->_barButtonItems = v13;
  }
  return v12;
}

- (void)updateWithRenderModel:(id)a3 factory:(id)a4 triggerManager:(id)a5 promoteAccessory:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_storeStrong((id *)&self->_renderModel, a3);
  v14 = [(TUIAuxiliaryViewState *)self _renderRightNavigationItemsWithFactory:v12 triggerManager:v13];
  rightItems = self->_rightItems;
  self->_rightItems = v14;

  objc_super v16 = [(TUIAuxiliaryViewState *)self _renderLeftNavigationItemsWithFactory:v12 triggerManager:v13];
  leftItems = self->_leftItems;
  self->_leftItems = v16;

  v18 = [(TUIAuxiliaryViewState *)self _renderNavigationBarTitle:v13];
  title = self->_title;
  self->_title = v18;

  v20 = [(TUIAuxiliaryViewState *)self _renderLargeNavigationBarTitle:v13];
  largeTitle = self->_largeTitle;
  self->_largeTitle = v20;

  v22 = [(TUIAuxiliaryViewState *)self _renderLargeTitleAccessoryViewWithFactory:v12];
  largeTitleAccessoryView = self->_largeTitleAccessoryView;
  self->_largeTitleAccessoryView = v22;

  if (self->_largeTitleAccessoryView && v6)
  {
    v24 = -[TUIAuxiliaryViewState _axBarButtonItemForLargeTitleAccessoryView:](self, "_axBarButtonItemForLargeTitleAccessoryView:");
    if (v24)
    {
      id v45 = v11;
      if (!self->_rightItems)
      {
        self->_rightItems = (NSArray *)&__NSArray0__struct;
      }
      v25 = [v24 accessibilityIdentifier];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v26 = self->_rightItems;
      id v27 = [(NSArray *)v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v51;
LABEL_8:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v50 + 1) + 8 * v30) accessibilityIdentifier];

          if (v31 == v25) {
            break;
          }
          if (v28 == (id)++v30)
          {
            id v28 = [(NSArray *)v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v28) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_14:

        v32 = [(NSArray *)self->_rightItems arrayByAddingObject:v24];
        v26 = self->_rightItems;
        self->_rightItems = v32;
      }

      v33 = [(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel hostingIdentifiers];

      if (v33)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v34 = [(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel hostingIdentifiers];
        id v35 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v47;
          do
          {
            v38 = 0;
            do
            {
              if (*(void *)v47 != v37) {
                objc_enumerationMutation(v34);
              }
              [(TUIAuxiliaryViewState *)self setBarButtonItem:v24 forHostingIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * (void)v38)];
              v38 = (char *)v38 + 1;
            }
            while (v36 != v38);
            id v36 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v36);
        }
      }
      id v11 = v45;
    }
    v39 = self->_largeTitleAccessoryView;
    self->_largeTitleAccessoryView = 0;
  }
  else
  {
    largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    self->_largeTitleAccessoryItem = 0;
  }
  v41 = [(TUIAuxiliaryViewState *)self searchController];

  if (v41)
  {
    [(TUIAuxiliaryViewState *)self _updateSearchController:self->_searchController];
  }
  else
  {
    v42 = [(TUIAuxiliaryViewState *)self _renderSearchControllerWithFactory:v12];
    if (v42)
    {
      objc_storeStrong((id *)&self->_searchController, v42);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_searchControllerDelegate);
      v44 = [(TUISearchController *)self->_searchController searchController];
      [v44 setDelegate:WeakRetained];
    }
  }
  [(TUIAuxiliaryViewState *)self _setupHosting];
}

- (void)_setupHosting
{
  if (self->_largeTitleAccessoryView
    && ([(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel hostingIdentifiers],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    if (!self->_largeTitleViewHostMap)
    {
      v4 = (NSMutableDictionary *)objc_opt_new();
      largeTitleViewHostMap = self->_largeTitleViewHostMap;
      self->_largeTitleViewHostMap = v4;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v6 = [(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel hostingIdentifiers];
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [(NSMutableDictionary *)self->_largeTitleViewHostMap objectForKeyedSubscript:v11];
          id v13 = v12;
          if (!v12
            || ([(_TUIAuxiliaryViewHost *)v12 view],
                v14 = (UIView *)objc_claimAutoreleasedReturnValue(),
                largeTitleAccessoryView = self->_largeTitleAccessoryView,
                v14,
                v14 != largeTitleAccessoryView))
          {
            objc_super v16 = [[_TUIAuxiliaryViewHost alloc] initWithIdentifier:v11 hostingController:self->_hostingController viewVisibilityController:self->_viewVisibilityController view:self->_largeTitleAccessoryView];

            [(NSMutableDictionary *)self->_largeTitleViewHostMap setObject:v16 forKeyedSubscript:v11];
            id v13 = v16;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v17 = self->_largeTitleViewHostMap;
    self->_largeTitleViewHostMap = 0;
  }
}

- (id)navigationBarItemMatchingQuery:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  objc_super v16 = sub_126230;
  v17 = sub_126240;
  id v18 = 0;
  v5 = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_126248;
  v9[3] = &unk_255C08;
  id v6 = v4;
  uint64_t v11 = self;
  id v12 = &v13;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)setBarButtonItem:(id)a3 forIdentifier:(id)a4
{
}

- (void)setBarButtonItem:(id)a3 forHostingIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  itemHostMap = self->_itemHostMap;
  if (!itemHostMap)
  {
    id v8 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v9 = self->_itemHostMap;
    self->_itemHostMap = v8;

    itemHostMap = self->_itemHostMap;
  }
  id v10 = [(NSMutableDictionary *)itemHostMap objectForKeyedSubscript:v6];
  uint64_t v11 = v10;
  if (!v10
    || ([(_TUIAuxiliaryItemHost *)v10 item],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v14))
  {
    uint64_t v13 = [[_TUIAuxiliaryItemHost alloc] initWithIdentifier:v6 hostingController:self->_hostingController item:v14];

    [(NSMutableDictionary *)self->_itemHostMap setObject:v13 forKeyedSubscript:v6];
    uint64_t v11 = v13;
  }
}

- (BOOL)configureNavigationItem:(id)a3 scrollView:(id)a4 extraLeftItems:(id)a5 extraRightItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self->_leftItems;
  uint64_t v15 = self->_rightItems;
  BOOL v16 = [(NSArray *)v15 count] || [(NSArray *)v14 count] || self->_largeTitleAccessoryView != 0;
  if ([v12 count])
  {
    if (v14) {
      v17 = v14;
    }
    else {
      v17 = (NSArray *)&__NSArray0__struct;
    }
    uint64_t v18 = [v12 arrayByAddingObjectsFromArray:v17];

    id v14 = (NSArray *)v18;
  }
  if ([v13 count])
  {
    if (v15) {
      long long v19 = v15;
    }
    else {
      long long v19 = (NSArray *)&__NSArray0__struct;
    }
    uint64_t v20 = [v13 arrayByAddingObjectsFromArray:v19];

    uint64_t v15 = (NSArray *)v20;
  }
  if (self->_title || self->_largeTitle) {
    [v10 setTitle:];
  }
  [v10 _setLargeTitleAccessoryView:self->_largeTitleAccessoryView alignToBaseline:0];
  [v10 setRightBarButtonItems:v15 animated:0];
  [v10 setLeftBarButtonItems:v14 animated:0];
  uint64_t v21 = [v11 window];
  if (v21)
  {
    v22 = (void *)v21;
    [v10 searchController];
    v32 = v14;
    id v23 = v13;
    id v24 = v12;
    id v25 = v11;
    id v27 = v26 = v16;
    id v28 = [(TUISearchController *)self->_searchController searchController];

    BOOL v29 = v27 == v28;
    BOOL v16 = v26;
    id v11 = v25;
    id v12 = v24;
    id v13 = v23;
    id v14 = v32;
    if (!v29)
    {
      uint64_t v30 = [(TUISearchController *)self->_searchController searchController];
      [v10 setSearchController:v30];

      [v11 scrollRectToVisible:0, 0.0, -1.0, 1.0, 1.0];
    }
  }
  [v10 setHidesSearchBarWhenScrolling:0];

  return v16;
}

- (id)_axBarButtonItemForLargeTitleAccessoryView:(id)a3
{
  id v4 = a3;
  v5 = [v4 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&stru_255C48];
  id v6 = [v5 firstObject];
  if (v6)
  {
    largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    if (!largeTitleAccessoryItem)
    {
      id v8 = (UIBarButtonItem *)objc_alloc_init((Class)UIBarButtonItem);
      uint64_t v9 = self->_largeTitleAccessoryItem;
      self->_largeTitleAccessoryItem = v8;

      largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    }
    [(UIBarButtonItem *)largeTitleAccessoryItem setCustomView:v4];
    id v10 = self->_largeTitleAccessoryItem;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)configureSearchControllerIfNeededForNavigationItem:(id)a3
{
  searchController = self->_searchController;
  id v4 = a3;
  id v5 = [(TUISearchController *)searchController searchController];
  [v4 setSearchController:v5];
}

- (id)_renderRightNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4
{
  return [(TUIAuxiliaryViewState *)self _renderItemsForButtonTypeWithFactory:a3 type:4 triggerManager:a4];
}

- (id)_renderLeftNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4
{
  return [(TUIAuxiliaryViewState *)self _renderItemsForButtonTypeWithFactory:a3 type:3 triggerManager:a4];
}

- (id)_renderItemsForButtonTypeWithFactory:(id)a3 type:(unint64_t)a4 triggerManager:(id)a5
{
  id v30 = a3;
  id v29 = a5;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v12 itemType] == (id)a4)
        {
          uint64_t v13 = [v12 observeTrigger];
          if (!v13
            || (id v14 = (void *)v13,
                [v12 observeTrigger],
                uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                id v16 = [v29 stateForTriggerWithName:v15],
                id v17 = [v12 observeTriggerValue],
                v15,
                v14,
                v16 == v17))
          {
            uint64_t v18 = [v12 renderItemWithFactory:v30];
            if (v18)
            {
              [v28 addObject:v18];
              long long v19 = [v12 identifier];
              [(TUIAuxiliaryViewState *)self setBarButtonItem:v18 forIdentifier:v19];

              uint64_t v20 = [v12 hostingIdentifiers];

              if (v20)
              {
                long long v34 = 0u;
                long long v35 = 0u;
                long long v32 = 0u;
                long long v33 = 0u;
                uint64_t v21 = [v12 hostingIdentifiers];
                id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v33;
                  do
                  {
                    for (j = 0; j != v23; j = (char *)j + 1)
                    {
                      if (*(void *)v33 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      [(TUIAuxiliaryViewState *)self setBarButtonItem:v18 forHostingIdentifier:*(void *)(*((void *)&v32 + 1) + 8 * (void)j)];
                    }
                    id v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
                  }
                  while (v23);
                }
              }
            }
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  id v26 = [v28 copy];

  return v26;
}

- (id)_renderNavigationBarTitle:(id)a3
{
  return [(TUIAuxiliaryViewState *)self _renderTitleForType:1];
}

- (id)_renderLargeNavigationBarTitle:(id)a3
{
  return [(TUIAuxiliaryViewState *)self _renderTitleForType:2];
}

- (id)_renderTitleForType:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 itemType] == (id)a3)
        {
          uint64_t v10 = [v9 title];
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (double)navigationBarBackgroundOpacity:(id)a3 anchors:(id)a4 scrollView:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    double v13 = NAN;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v15 navigationBarBackgroundOpacity];
        uint64_t v16 = [v15 observeTrigger];
        if (!v16
          || (id v17 = (void *)v16,
              [v15 observeTrigger],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              id v19 = [v37 stateForTriggerWithName:v18],
              id v20 = [v15 observeTriggerValue],
              v18,
              v17,
              v19 == v20))
        {
          [v15 navigationBarBackgroundOpacity];
          double v13 = v32;
          goto LABEL_19;
        }
        uint64_t v21 = [v15 observeTrigger];

        if (v8 && v21 && v9)
        {
          id v22 = [v15 observeTrigger];
          [v8 offsetForTriggerWithName:v22 inScrollView:v9];
          double v24 = v23;

          [v9 contentOffset];
          double v26 = v25;
          if ([v15 ignoreInsetsForOpacityTrigger])
          {
            [v9 safeAreaInsets];
            double v28 = v27;
            [v9 contentInset];
            double v30 = v28 + v29;
            double v26 = v26 + v30;
            double v24 = v24 + v30;
          }
          [v15 navigationBarBackgroundOpacity];
          double v13 = v26 / v24 * v31;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v13 = NAN;
  }
LABEL_19:

  double v33 = fmax(v13, 0.0);
  if (v33 > 1.0) {
    double v33 = 1.0;
  }
  double v34 = v33;

  return v34;
}

- (id)_renderLargeTitleAccessoryViewWithFactory:(id)a3
{
  id v4 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v45;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v10 itemType] == (char *)&dword_4 + 1)
        {
          objc_storeStrong((id *)&self->_largeTitleAccessoryModel, v10);
          uint64_t v12 = [v10 renderViewWithFactory:v4];
          largeTitleAccessoryContainer = self->_largeTitleAccessoryContainer;
          if (!largeTitleAccessoryContainer)
          {
            long long v14 = (UIView *)objc_alloc_init((Class)UIView);
            long long v15 = self->_largeTitleAccessoryContainer;
            self->_largeTitleAccessoryContainer = v14;

            largeTitleAccessoryContainer = self->_largeTitleAccessoryContainer;
          }
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          uint64_t v16 = [(UIView *)largeTitleAccessoryContainer subviews];
          id v17 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v41;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v40 + 1) + 8 * (void)j) removeFromSuperview];
              }
              id v18 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
            }
            while (v18);
          }

          [(UIView *)self->_largeTitleAccessoryContainer addSubview:v12];
          double y = CGPointZero.y;
          [v12 bounds];
          -[UIView setBounds:](self->_largeTitleAccessoryContainer, "setBounds:", CGPointZero.x, y);
          id v22 = [(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel axAttributes];
          double v23 = [v22 axLabel];

          if (v23)
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            double v24 = [(UIView *)self->_largeTitleAccessoryContainer interactions];
            id v25 = [v24 countByEnumeratingWithState:&v36 objects:v48 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v37;
              do
              {
                for (k = 0; k != v26; k = (char *)k + 1)
                {
                  if (*(void *)v37 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v36 + 1) + 8 * (void)k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(UIView *)self->_largeTitleAccessoryContainer removeInteraction:v29];
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v36 objects:v48 count:16];
              }
              while (v26);
            }

            double v30 = self->_largeTitleAccessoryContainer;
            id v31 = objc_alloc_init((Class)UILargeContentViewerInteraction);
            [(UIView *)v30 addInteraction:v31];

            [(UIView *)self->_largeTitleAccessoryContainer setShowsLargeContentViewer:1];
            double v32 = self->_largeTitleAccessoryContainer;
            double v33 = [(TUIRenderModelNavigationItem *)self->_largeTitleAccessoryModel axAttributes];
            double v34 = [v33 axLabel];
            [(UIView *)v32 setLargeContentTitle:v34];
          }
          id v11 = self->_largeTitleAccessoryContainer;

          goto LABEL_31;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_31:

  return v11;
}

- (id)_renderSearchControllerWithFactory:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 itemType] == (char *)&dword_4 + 2)
        {
          id v6 = [v9 renderSearchControllerWithFactory:v4];
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateSearchController:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TUIRenderModelAuxiliary *)self->_renderModel navigationItems];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 itemType] == (char *)&dword_4 + 2)
        {
          [v4 configureWithModel:v10];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (TUISearchController)searchController
{
  return self->_searchController;
}

- (UISearchControllerDelegate)searchControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchControllerDelegate);

  return (UISearchControllerDelegate *)WeakRetained;
}

- (TUIHostingController)hostingController
{
  return self->_hostingController;
}

- (TUIViewVisibilityController)viewVisibilityController
{
  return self->_viewVisibilityController;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)largeTitle
{
  return self->_largeTitle;
}

- (UIView)largeTitleAccessoryView
{
  return self->_largeTitleAccessoryView;
}

- (UIBarButtonItem)largeTitleAccessoryItem
{
  return self->_largeTitleAccessoryItem;
}

- (NSArray)leftItems
{
  return self->_leftItems;
}

- (NSArray)rightItems
{
  return self->_rightItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightItems, 0);
  objc_storeStrong((id *)&self->_leftItems, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryItem, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryView, 0);
  objc_storeStrong((id *)&self->_largeTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_viewVisibilityController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_destroyWeak((id *)&self->_searchControllerDelegate);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryContainer, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryModel, 0);
  objc_storeStrong((id *)&self->_largeTitleViewHostMap, 0);
  objc_storeStrong((id *)&self->_itemHostMap, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end