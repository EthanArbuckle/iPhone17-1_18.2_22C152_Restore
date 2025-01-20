@interface SBAppSwitcherModel
+ (NSString)appSwitcherHeaderIconImageDescriptorName;
- (SBAppSwitcherModel)init;
- (SBAppSwitcherModel)initWithIconController:(id)a3 applicationController:(id)a4 recents:(id)a5;
- (SBAppSwitcherModelDelegate)delegate;
- (id)_recentAppLayoutsController;
- (id)appLayoutContainingDisplayItem:(id)a3 includingHiddenAppLayouts:(BOOL)a4;
- (id)appLayoutsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4;
- (id)appLayoutsIncludingHiddenAppLayouts:(BOOL)a3;
- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4;
- (id)recentAppLayouts:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6;
- (id)recentAppLayouts:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5;
- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4;
- (int64_t)_adjustedIndexForVisibleAppLayoutAtIndex:(unint64_t)a3;
- (unint64_t)indexOfDisplayItem:(id)a3 visible:(BOOL)a4;
- (void)_warmUpIconsForAppLayout:(id)a3;
- (void)_warmUpIconsForRecentAppLayouts:(id)a3;
- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4;
- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (void)addToFront:(id)a3;
- (void)clearAppLayoutsSnapshot;
- (void)dealloc;
- (void)hide:(id)a3;
- (void)modifyWithDropContext:(id)a3;
- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4;
- (void)recentAppLayouts:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4;
- (void)remove:(id)a3;
- (void)removeAppLayouts:(id)a3;
- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4;
- (void)restoreAppLayoutsSnapshot;
- (void)setDelegate:(id)a3;
- (void)takeAppLayoutsSnapshot;
@end

@implementation SBAppSwitcherModel

- (id)_recentAppLayoutsController
{
  return self->_recents;
}

- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  return [(SBRecentAppLayouts *)self->_recents recentDisplayItemsForBundleIdentifier:a3 includingHiddenAppLayouts:a4];
}

- (id)appLayoutsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  return [(SBRecentAppLayouts *)self->_recents recentsForBundleIdentifier:a3 includingHiddenAppLayouts:a4];
}

- (void)clearAppLayoutsSnapshot
{
  appLayoutsSnapshot = self->_appLayoutsSnapshot;
  self->_appLayoutsSnapshot = 0;
}

- (id)appLayoutsIncludingHiddenAppLayouts:(BOOL)a3
{
  return [(SBRecentAppLayouts *)self->_recents recentsIncludingHiddenAppLayouts:a3];
}

void __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(a1 + 32) count] > a2)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
    if (([v4 isHidden] & 1) == 0) {
      [*(id *)(a1 + 40) _warmUpIconsForAppLayout:v4];
    }
  }
}

- (void)_warmUpIconsForAppLayout:(id)a3
{
  iconController = self->_iconController;
  id v5 = a3;
  v6 = [(SBIconController *)iconController model];
  v7 = [(SBIconController *)self->_iconController appSwitcherHeaderIconImageCache];
  v8 = [(SBIconController *)self->_iconController homeScreenViewController];
  v9 = [v8 traitCollection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SBAppSwitcherModel__warmUpIconsForAppLayout___block_invoke;
  v13[3] = &unk_1E6AFA810;
  id v14 = v6;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v6;
  [v5 enumerate:v13];
}

void __47__SBAppSwitcherModel__warmUpIconsForAppLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [a3 bundleIdentifier];
  id v7 = [v4 expectedIconForDisplayIdentifier:v5];

  if ([v7 isApplicationIcon]) {
    id v6 = (id)[*(id *)(a1 + 40) cacheImageForIcon:v7 compatibleWithTraitCollection:*(void *)(a1 + 48) options:0 completionHandler:0];
  }
}

- (void)addToFront:(id)a3
{
}

- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
}

- (id)recentAppLayouts:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = [WeakRetained appSwitcherModel:self willAddAppLayout:v9 replacingAppLayouts:v10 removingAppLayouts:v11];
  }
  else
  {
    id v14 = v9;
  }
  id v15 = v14;

  return v15;
}

void __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 object];
  id v6 = [v5 recentsIncludingHiddenAppLayouts:1];

  id v7 = [v3 userInfo];

  v8 = [v7 objectForKey:@"SBRecentAppLayoutsDidInsertAtIndexesKey"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke_2;
  id v15 = &unk_1E6B01700;
  id v16 = v6;
  id v17 = WeakRetained;
  id v9 = WeakRetained;
  id v10 = v6;
  [v8 enumerateIndexesUsingBlock:&v12];

  id v11 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v12, v13, v14, v15);
  [v11 postNotificationName:@"SBAppSwitcherModelDidChangeNotification" object:v9];
}

- (SBAppSwitcherModel)initWithIconController:(id)a3 applicationController:(id)a4 recents:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBAppSwitcherModel;
  uint64_t v12 = [(SBAppSwitcherModel *)&v22 init];
  if (v12)
  {
    kdebug_trace();
    objc_storeStrong((id *)&v12->_recents, a5);
    [(SBRecentAppLayouts *)v12->_recents setDelegate:v12];
    objc_storeStrong((id *)&v12->_iconController, a3);
    uint64_t v13 = [(SBRecentAppLayouts *)v12->_recents recentsIncludingHiddenAppLayouts:0];
    [(SBAppSwitcherModel *)v12 _warmUpIconsForRecentAppLayouts:v13];

    objc_initWeak(&location, v12);
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    recents = v12->_recents;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke;
    v19[3] = &unk_1E6B01728;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v14 addObserverForName:@"SBRecentAppLayoutsDidChangeNotification" object:recents queue:0 usingBlock:v19];
    id recentsChangedNotificationObserver = v12->_recentsChangedNotificationObserver;
    v12->_id recentsChangedNotificationObserver = (id)v16;

    kdebug_trace();
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (SBAppSwitcherModel)init
{
  id v3 = +[SBIconController sharedInstance];
  id v4 = +[SBApplicationController sharedInstance];
  id v5 = objc_alloc_init(SBRecentAppLayouts);
  id v6 = [(SBAppSwitcherModel *)self initWithIconController:v3 applicationController:v4 recents:v5];

  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_recentsChangedNotificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherModel;
  [(SBAppSwitcherModel *)&v4 dealloc];
}

- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4
{
}

- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4
{
}

- (void)remove:(id)a3
{
}

- (void)removeAppLayouts:(id)a3
{
}

- (void)hide:(id)a3
{
}

+ (NSString)appSwitcherHeaderIconImageDescriptorName
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      v2 = (id *)MEMORY[0x1E4F6F2B0];
    }
    else {
      v2 = (id *)MEMORY[0x1E4F6F2B8];
    }
    id v6 = *v2;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];
    id v5 = (id *)MEMORY[0x1E4F6F2B8];
    if (v4 == 1) {
      id v5 = (id *)MEMORY[0x1E4F6F2B0];
    }
    id v6 = *v5;
  }
  return (NSString *)v6;
}

- (void)_warmUpIconsForRecentAppLayouts:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [v8 count];
  if (v4 >= 0xF) {
    uint64_t v5 = 15;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [v8 objectAtIndexedSubscript:i];
      [(SBAppSwitcherModel *)self _warmUpIconsForAppLayout:v7];
    }
  }
}

- (void)modifyWithDropContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 currentDropRegion];
  uint64_t v6 = [v4 currentDropAction];
  if ((SBSwitcherDropRegionWarrantsModelUpdate(v5) & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:161 description:@"Unsupported drop region provided to modifyWithDropContext."];
  }
  id v7 = [v4 draggingAppLayout];
  uint64_t v8 = objc_msgSend(v7, "itemForLayoutRole:", objc_msgSend(v4, "draggingLayoutRole"));
  id v9 = [v4 intersectingAppLayout];
  uint64_t v10 = [v9 itemForLayoutRole:1];
  v46 = (void *)v8;
  unint64_t v11 = [(SBAppSwitcherModel *)self indexOfDisplayItem:v8 visible:1];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:172 description:@"Couldn't find the dragged app layout's index"];
  }
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  unint64_t v58 = 0;
  v45 = (void *)v10;
  unint64_t v58 = [(SBAppSwitcherModel *)self indexOfDisplayItem:v10 visible:1];
  if (v6 != 3 && v6 != 5 && v56[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:178 description:@"Couldn't find the target app layout's index"];
  }
  uint64_t v12 = [(SBAppSwitcherModel *)self appLayoutsIncludingHiddenAppLayouts:0];
  uint64_t v13 = [v12 lastObject];
  int v14 = [v13 isOrContainsAppLayout:v9];

  switch(v6)
  {
    case 1:
      if ([v7 isSplitConfiguration])
      {
        id v15 = [v4 remainingAppLayout];
        [(SBAppSwitcherModel *)self replaceAppLayout:v7 withAppLayout:v15];
      }
      else
      {
        [(SBAppSwitcherModel *)self remove:v7];
      }
      id v17 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self addAppLayout:v17 atIndex:0];
      goto LABEL_42;
    case 2:
      [(SBAppSwitcherModel *)self remove:v7];
      id v17 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v9 withAppLayout:v17];
      if (![v9 isSplitConfiguration]) {
        goto LABEL_42;
      }
      id v20 = [v4 evictedAppLayout];
      [(SBAppSwitcherModel *)self addAppLayout:v20 afterAppLayout:v17];
LABEL_41:

LABEL_42:
LABEL_43:
      _Block_object_dispose(&v55, 8);

      return;
    case 3:
      [(SBAppSwitcherModel *)self remove:v7];
      v21 = [v4 closestVisibleAppLayout];
      id v17 = [v21 itemForLayoutRole:1];

      unint64_t v22 = [(SBAppSwitcherModel *)self indexOfDisplayItem:v17 visible:0];
      id v20 = [v4 finalTargetAppLayout];
      if ([v20 isSplitConfiguration])
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:210 description:@"Expected full configuration layout"];
      }
      [(SBAppSwitcherModel *)self addAppLayout:v20 atIndex:v22];
      goto LABEL_41;
    case 4:
      id v17 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v7 withAppLayout:v17];
      goto LABEL_42;
    case 5:
      uint64_t v16 = [v4 closestVisibleAppLayout];
      id v17 = [v16 itemForLayoutRole:1];

      unint64_t v18 = [(SBAppSwitcherModel *)self indexOfDisplayItem:v17 visible:0];
      v19 = [v4 remainingAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v7 withAppLayout:v19];

      id v20 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self addAppLayout:v20 atIndex:v18];
      goto LABEL_41;
    case 6:
      v23 = [v4 evictedAppLayout];

      if (v23)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:308 description:@"Full -> Full shouldn't have an evicted layout"];
      }
      v24 = [v4 remainingAppLayout];

      if (v24)
      {
        v39 = [MEMORY[0x1E4F28B00] currentHandler];
        [v39 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:309 description:@"Full -> Full shouldn't have a remaining layout"];
      }
      [(SBAppSwitcherModel *)self remove:v7];
      [(SBAppSwitcherModel *)self remove:v9];
      if (v14
        && ([v7 isSplitConfiguration] & 1) == 0
        && ([v9 isSplitConfiguration] & 1) == 0)
      {
        --v56[3];
      }
      int64_t v25 = [(SBAppSwitcherModel *)self _adjustedIndexForVisibleAppLayoutAtIndex:v56[3]];
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        [v41 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherModel.m" lineNumber:320 description:@"Failed to find the adjusted insertion index"];
      }
      id v17 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self addAppLayout:v17 atIndex:v25];
      goto LABEL_42;
    case 7:
      unint64_t v26 = v56[3];
      v27 = [v4 finalTargetAppLayout];
      unint64_t v44 = v26;
      v28 = [v4 evictedAppLayout];
      [(SBAppSwitcherModel *)self remove:v7];
      [(SBAppSwitcherModel *)self remove:v9];
      v42 = v7;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke;
      v51[3] = &unk_1E6AFDBE0;
      v54 = &v55;
      v51[4] = self;
      id v29 = v28;
      id v52 = v29;
      id v30 = v27;
      id v53 = v30;
      v31 = (void (**)(void))MEMORY[0x1D948C7A0](v51);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke_2;
      v47[3] = &unk_1E6B01750;
      v47[4] = self;
      v50 = &v55;
      id v17 = v30;
      id v48 = v17;
      id v20 = v29;
      id v49 = v20;
      v32 = (void (**)(void))MEMORY[0x1D948C7A0](v47);
      if (v44 <= v11 || (v33 = v31, (v14 & 1) == 0))
      {
        if ([v4 intersectingAppLayoutIsOnFirstRow]) {
          v33 = v32;
        }
        else {
          v33 = v31;
        }
      }
      v33[2]();

      id v7 = v42;
      goto LABEL_41;
    case 8:
      id v17 = [v4 finalTargetAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v9 withAppLayout:v17];
      id v20 = [v4 remainingAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v7 withAppLayout:v20];
      goto LABEL_41;
    case 9:
      id v17 = [v4 finalTargetAppLayout];
      id v20 = [v4 evictedAppLayout];
      v34 = [v4 remainingAppLayout];
      [(SBAppSwitcherModel *)self replaceAppLayout:v7 withAppLayout:v34];
      [(SBAppSwitcherModel *)self replaceAppLayout:v9 withAppLayout:v17];
      [(SBAppSwitcherModel *)self addAppLayout:v20 afterAppLayout:v17];

      goto LABEL_41;
    default:
      goto LABEL_43;
  }
}

uint64_t __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) - 1));
  uint64_t v2 = [*(id *)(a1 + 32) _adjustedIndexForVisibleAppLayoutAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 addAppLayout:v4 atIndex:v2];
}

uint64_t __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)));
  uint64_t v2 = [*(id *)(a1 + 32) _adjustedIndexForVisibleAppLayoutAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 addAppLayout:v4 atIndex:v2];
}

- (unint64_t)indexOfDisplayItem:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SBRecentAppLayouts *)self->_recents recentsIncludingHiddenAppLayouts:!v4];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SBAppSwitcherModel_indexOfDisplayItem_visible___block_invoke;
  v11[3] = &unk_1E6AFD190;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  unint64_t v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __49__SBAppSwitcherModel_indexOfDisplayItem_visible___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsItem:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)appLayoutContainingDisplayItem:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBRecentAppLayouts *)self->_recents recentsIncludingHiddenAppLayouts:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsItem:", v6, (void)v13))
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int64_t)_adjustedIndexForVisibleAppLayoutAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBAppSwitcherModel *)self appLayoutsIncludingHiddenAppLayouts:1];
  id v6 = [(SBAppSwitcherModel *)self appLayoutsIncludingHiddenAppLayouts:0];
  if ([v6 count] <= a3)
  {
    int64_t v9 = [v5 count];
  }
  else
  {
    id v7 = [v6 objectAtIndex:a3];
    id v8 = [v7 itemForLayoutRole:1];
    int64_t v9 = [(SBAppSwitcherModel *)self indexOfDisplayItem:v8 visible:0];
  }
  return v9;
}

- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  return [(SBRecentAppLayouts *)self->_recents bestLastDisplayItemLayoutAttributesMapForAppLayout:a3 displayOrdinal:a4];
}

- (void)takeAppLayoutsSnapshot
{
  id v3 = [(SBRecentAppLayouts *)self->_recents recentsIncludingHiddenAppLayouts:1];
  appLayoutsSnapshot = self->_appLayoutsSnapshot;
  self->_appLayoutsSnapshot = v3;
}

- (void)restoreAppLayoutsSnapshot
{
}

- (void)recentAppLayouts:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained appSwitcherModel:self didRemoveAppLayoutForFallingOffList:v6];
}

- (id)recentAppLayouts:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained appSwitcherModel:self willReplaceAppLayout:v7 proposedReplacementAppLayout:v8];
  }
  else
  {
    id v11 = v8;
  }
  id v12 = v11;

  return v12;
}

- (SBAppSwitcherModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppSwitcherModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appLayoutsSnapshot, 0);
  objc_storeStrong(&self->_recentsChangedNotificationObserver, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
}

@end