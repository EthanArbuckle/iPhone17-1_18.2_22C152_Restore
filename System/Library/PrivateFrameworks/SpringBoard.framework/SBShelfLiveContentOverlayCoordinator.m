@interface SBShelfLiveContentOverlayCoordinator
- (BOOL)areLiveContentOverlayUpdatesSuspended;
- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3;
- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3;
- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3;
- (SBShelfLiveContentOverlayCoordinator)initWithShelfDelegate:(id)a3;
- (SBShelfLiveContentOverlayCoordinatorDelegate)shelfDelegate;
- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate;
- (id)appLayoutForKeyboardFocusedScene;
- (int64_t)containerOrientation;
- (void)_addOverlaysIfNeededForTransitionContext:(id)a3;
- (void)dealloc;
- (void)didUpdateCacheEntry:(id)a3;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3;
@end

@implementation SBShelfLiveContentOverlayCoordinator

- (SBShelfLiveContentOverlayCoordinator)initWithShelfDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBShelfLiveContentOverlayCoordinator;
  v5 = [(SBShelfLiveContentOverlayCoordinator *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfDelegate, v4);
    uint64_t v7 = objc_opt_new();
    leafAppLayoutsToOverlays = v6->_leafAppLayoutsToOverlays;
    v6->_leafAppLayoutsToOverlays = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (void)dealloc
{
  if (self->_isSnapshotCacheObserver)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
    id v4 = [WeakRetained shelfLiveContentOverlayCoordinatorSnapshotCache:self];

    [v4 removeSnapshotObserver:self];
    v5 = SBLogShelfLiveContent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Removed live content coordinator as snapshot observer", buf, 2u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SBShelfLiveContentOverlayCoordinator;
  [(SBShelfLiveContentOverlayCoordinator *)&v6 dealloc];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [v5 fromLayoutState];
  uint64_t v7 = [v5 toLayoutState];
  v8 = [v6 appLayout];
  v9 = [v8 leafAppLayouts];
  v47 = v6;
  objc_super v10 = [v6 floatingAppLayout];
  v11 = [v10 leafAppLayouts];
  v12 = [v9 arrayByAddingObjectsFromArray:v11];

  v13 = [v7 appLayout];
  v14 = [v13 leafAppLayouts];
  v46 = v7;
  v15 = [v7 floatingAppLayout];
  v16 = [v15 leafAppLayouts];
  v17 = [v14 arrayByAddingObjectsFromArray:v16];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
  v59[3] = &unk_1E6AF4B60;
  id v18 = v17;
  id v60 = v18;
  v42 = objc_msgSend(v12, "bs_filter:", v59);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2;
  v57[3] = &unk_1E6AF4B60;
  id v44 = v12;
  v45 = v18;
  id v58 = v44;
  v19 = objc_msgSend(v18, "bs_filter:", v57);
  v48 = v5;
  [(SBShelfLiveContentOverlayCoordinator *)self _addOverlaysIfNeededForTransitionContext:v5];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v26 = [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays objectForKey:v25];
        v27 = v26;
        if (v26)
        {
          [v26 setDisplayMode:0];
          [v27 setPendingSwitcherSnapshotCacheUpdate:0];
          v28 = SBLogShelfLiveContent();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v25 itemForLayoutRole:1];
            v30 = [v29 uniqueIdentifier];
            *(_DWORD *)buf = 138412290;
            v63 = v30;
            _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Set displayMode to Snapshot and pendingSnapshotCacheUpdate to NO for %@ because it's going live", buf, 0xCu);
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v22);
  }
  v43 = v20;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v31 = v42;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        v37 = [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays objectForKey:v36];
        v38 = v37;
        if (v37)
        {
          [v37 setDisplayMode:1];
          v39 = SBLogShelfLiveContent();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [v36 itemForLayoutRole:1];
            v41 = [v40 uniqueIdentifier];
            *(_DWORD *)buf = 138412290;
            v63 = v41;
            _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEFAULT, "Set displayMode to LivePortal for %@ because it's going background", buf, 0xCu);
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v33);
  }
}

uint64_t __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
  uint64_t v7 = [v5 fromLayoutState];
  v40 = v5;
  v8 = [v5 toLayoutState];
  v9 = [v7 appLayout];
  objc_super v10 = [v9 leafAppLayouts];
  v39 = v7;
  v11 = [v7 floatingAppLayout];
  v12 = [v11 leafAppLayouts];
  v13 = [v10 arrayByAddingObjectsFromArray:v12];

  v14 = [v8 appLayout];
  v15 = [v14 leafAppLayouts];
  v38 = v8;
  v16 = [v8 floatingAppLayout];
  v17 = [v16 leafAppLayouts];
  id v18 = [v15 arrayByAddingObjectsFromArray:v17];

  v19 = WeakRetained;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __112__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionWillEndWithTransitionContext___block_invoke;
  v47[3] = &unk_1E6AF4B60;
  id v36 = v18;
  v37 = v13;
  id v48 = v36;
  objc_msgSend(v13, "bs_filter:", v47);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    uint64_t v23 = 1;
    v41 = self;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v26 = [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays objectForKey:v25];
        if (v26)
        {
          v27 = [v19 shelfLiveContentOverlayCoordinatorSnapshotCache:self];
          v28 = [v25 itemForLayoutRole:v23];
          [v27 addSnapshotUpdateObserver:self forDisplayItem:v28 inAppLayout:v25];

          self->_isSnapshotCacheObserver = 1;
          [v26 setPendingSwitcherSnapshotCacheUpdate:1];
          v29 = SBLogShelfLiveContent();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v25 itemForLayoutRole:v23];
            [v30 uniqueIdentifier];
            uint64_t v31 = v21;
            uint64_t v32 = v22;
            uint64_t v33 = v23;
            v35 = uint64_t v34 = v19;
            *(_DWORD *)buf = 138412290;
            long long v50 = v35;
            _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "Set pendingSnapshotCacheUpdate for %@ because it is about to be backgrounded", buf, 0xCu);

            v19 = v34;
            uint64_t v23 = v33;
            uint64_t v22 = v32;
            uint64_t v21 = v31;
            self = v41;
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v21);
  }
}

uint64_t __112__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionWillEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [v5 fromLayoutState];
  uint64_t v7 = [v5 toLayoutState];
  v8 = [v6 appLayout];
  v9 = [v8 leafAppLayouts];
  long long v45 = v6;
  objc_super v10 = [v6 floatingAppLayout];
  v11 = [v10 leafAppLayouts];
  v12 = [v9 arrayByAddingObjectsFromArray:v11];

  v13 = [v7 appLayout];
  v14 = [v13 leafAppLayouts];
  long long v44 = v7;
  v15 = [v7 floatingAppLayout];
  v16 = [v15 leafAppLayouts];
  v17 = [v14 arrayByAddingObjectsFromArray:v16];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
  v58[3] = &unk_1E6AF4B60;
  id v18 = v17;
  id v59 = v18;
  v41 = objc_msgSend(v12, "bs_filter:", v58);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
  v56[3] = &unk_1E6AF4B60;
  id v42 = v12;
  long long v43 = v18;
  id v57 = v42;
  v19 = objc_msgSend(v18, "bs_filter:", v56);
  long long v46 = v5;
  [(SBShelfLiveContentOverlayCoordinator *)self _addOverlaysIfNeededForTransitionContext:v5];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v25 = -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v24, v41);
        v26 = v25;
        if (v25)
        {
          [v25 setDisplayMode:1];
          v27 = SBLogShelfLiveContent();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v24 itemForLayoutRole:1];
            v29 = [v28 uniqueIdentifier];
            *(_DWORD *)buf = 138412290;
            v62 = v29;
            _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Set displayMode to LivePortal for %@ because it is live", buf, 0xCu);
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v21);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = v41;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v36 = -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v35, v41);
        v37 = v36;
        if (v36)
        {
          [v36 setDisplayMode:0];
          v38 = SBLogShelfLiveContent();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [v35 itemForLayoutRole:1];
            v40 = [v39 uniqueIdentifier];
            *(_DWORD *)buf = 138412290;
            v62 = v40;
            _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "Set displayMode to Snapshot for %@ because it is backgrounded", buf, 0xCu);
          }
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v32);
  }
}

uint64_t __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)_addOverlaysIfNeededForTransitionContext:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v64 = [(SBShelfLiveContentOverlayCoordinator *)self delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
  objc_super v6 = [v4 toLayoutState];
  v61 = v4;
  id v59 = [v4 applicationTransitionContext];
  id v60 = WeakRetained;
  uint64_t v7 = [WeakRetained shelfLiveContentOverlayCoordinatorAppLayouts:self];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v58 = v7;
  v9 = objc_msgSend(v7, "bs_map:", &__block_literal_global_409);
  objc_super v10 = objc_msgSend(v9, "bs_flatten");
  v11 = [v8 setWithArray:v10];

  v12 = [v6 appLayout];
  v13 = [v12 leafAppLayouts];
  uint64_t v65 = v6;
  v14 = [v6 floatingAppLayout];
  v15 = [v14 leafAppLayouts];
  v16 = [v13 arrayByAddingObjectsFromArray:v15];

  v17 = self;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v73;
    uint64_t v55 = *MEMORY[0x1E4F39FE0];
    *(void *)&long long v19 = 138412290;
    long long v54 = v19;
    v63 = v17;
    uint64_t v56 = *(void *)v73;
    id v57 = v11;
    do
    {
      uint64_t v22 = 0;
      uint64_t v62 = v20;
      do
      {
        if (*(void *)v73 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * v22);
        if (objc_msgSend(v23, "containsAnyItemFromSet:", v11, v54))
        {
          v24 = [(NSMutableDictionary *)v17->_leafAppLayoutsToOverlays objectForKey:v23];
          if (!v24) {
            goto LABEL_12;
          }
          v25 = v24;
          if ([v24 isPendingSwitcherSnapshotCacheUpdate])
          {
            [(NSMutableDictionary *)v17->_leafAppLayoutsToOverlays removeObjectForKey:v23];
            [v64 removeLiveContentOverlayForAppLayout:v23 animated:1];
            v26 = SBLogShelfLiveContent();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = [v23 itemForLayoutRole:1];
              v28 = [v27 uniqueIdentifier];
              *(_DWORD *)buf = v54;
              v77 = v28;
              _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Removing live content overlay for %@ because it's waiting for a snapshot and we're going to re-add it with live content", buf, 0xCu);

              v17 = v63;
            }

LABEL_12:
            v29 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
            id v30 = [v23 itemForLayoutRole:1];
            uint64_t v31 = +[SBApplicationController sharedInstance];
            uint64_t v32 = [v30 bundleIdentifier];
            uint64_t v33 = [v31 applicationWithBundleIdentifier:v32];

            uint64_t v34 = [v30 uniqueIdentifier];
            v69 = (void *)v33;
            uint64_t v35 = [v29 sceneIdentityForApplication:v33 uniqueIdentifier:v34];

            v70 = v29;
            v68 = (void *)v35;
            id v36 = [v29 existingSceneHandleForSceneIdentity:v35];
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke_7;
            v71[3] = &unk_1E6AF4B60;
            v71[4] = v23;
            v67 = objc_msgSend(v58, "bs_firstObjectPassingTest:", v71);
            uint64_t v37 = 3;
            if ([v67 environment] != 2)
            {
              v38 = [v65 appLayout];
              v39 = [v23 itemForLayoutRole:1];
              uint64_t v37 = [v38 layoutRoleForItem:v39];
            }
            v40 = [v59 entityForLayoutRole:v37];
            [v59 frameForApplicationSceneEntity:v40];
            double v42 = v41;
            double v44 = v43;
            long long v45 = [v36 sceneIdentifier];
            uint64_t v46 = [v65 interfaceOrientationForElementIdentifier:v45];

            uint64_t v47 = [v65 interfaceOrientation];
            long long v48 = [v60 shelfLiveContentOverlayCoordinator:v17 liveViewForAppLayout:v23];
            long long v49 = [v48 layer];
            [v49 setShouldRasterize:1];
            [v64 displayScaleForContentOverlay];
            [v49 setRasterizationScale:v50 * 0.5];
            [v49 setMinificationFilter:v55];
            long long v51 = -[SBShelfLiveContentOverlay initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:]([SBShelfLiveContentOverlay alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:", v36, v46, v47, v48, v42, v44);
            v17 = v63;
            objc_msgSend(v64, "addLiveContentOverlay:forAppLayout:animated:", v51, v23, objc_msgSend(v61, "animationsDisabled") ^ 1);
            [(NSMutableDictionary *)v63->_leafAppLayoutsToOverlays setObject:v51 forKey:v23];
            long long v52 = SBLogShelfLiveContent();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              long long v53 = [v30 uniqueIdentifier];
              *(_DWORD *)buf = v54;
              v77 = v53;
              _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_DEFAULT, "Creating and adding live content overlay for %@", buf, 0xCu);
            }
            v25 = 0;
            uint64_t v21 = v56;
            v11 = v57;
            uint64_t v20 = v62;
          }
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v20);
  }
}

uint64_t __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allItems];
}

uint64_t __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(a1 + 32)];
}

- (void)didUpdateCacheEntry:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 appLayout];
  id v5 = [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays objectForKey:v4];
  objc_super v6 = v5;
  if (v5 && [v5 isPendingSwitcherSnapshotCacheUpdate])
  {
    uint64_t v7 = [(SBShelfLiveContentOverlayCoordinator *)self delegate];
    [v7 removeLiveContentOverlayForAppLayout:v4 animated:1];

    [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays removeObjectForKey:v4];
    v8 = SBLogShelfLiveContent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 itemForLayoutRole:1];
      objc_super v10 = [v9 uniqueIdentifier];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Removing live content overlay for %@ because its cached snapshot is ready", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)appLayoutForKeyboardFocusedScene
{
  return 0;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  return 0;
}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  return 0;
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(SBShelfLiveContentOverlayCoordinator *)self delegate];
  id v4 = [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [v3 removeLiveContentOverlayForAppLayout:v9 animated:1];
        [(NSMutableDictionary *)self->_leafAppLayoutsToOverlays removeObjectForKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (int64_t)containerOrientation
{
  return self->containerOrientation;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->containerOrientation = a3;
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  self->liveContentOverlayUpdatesSuspended = a3;
}

- (SBShelfLiveContentOverlayCoordinatorDelegate)shelfDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
  return (SBShelfLiveContentOverlayCoordinatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelfDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_leafAppLayoutsToOverlays, 0);
}

@end