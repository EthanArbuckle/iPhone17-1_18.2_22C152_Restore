@interface SBFullScreenSwitcherLiveContentOverlayCoordinator
- (BOOL)_canTransitionToOverlayType:(int64_t)a3 forAppLayout:(id)a4;
- (BOOL)_layoutStateContainsElementBlockedForScreenTimeExpiration:(id)a3;
- (BOOL)_shouldAnimateAddingLiveContentOverlayForTransitionContext:(id)a3 leafAppLayout:(id)a4;
- (BOOL)_shouldCreateAssertionForType:(int64_t)a3 withSceneRelevancyResult:(id)a4;
- (BOOL)_shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4;
- (BOOL)_shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4;
- (BOOL)_supportsMovingOverlayTypeBetweenAppLayouts:(int64_t)a3;
- (BOOL)areLiveContentOverlayUpdatesSuspended;
- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3;
- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3;
- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3;
- (NSMutableArray)visibleAlwaysLiveAppLayouts;
- (NSMutableDictionary)appLayoutToLiveContentOverlayContext;
- (NSMutableDictionary)dsplayItemsToWindowRelevancyAssertions;
- (NSString)bundleIDForTargetOfKeyboardShortcuts;
- (NSString)keyboardFocusSceneID;
- (NSString)sceneIDForTargetOfKeyboardShortcuts;
- (SBAppSwitcherSettings)switcherSettings;
- (SBFullScreenSwitcherLiveContentOverlayCoordinator)initWithSwitcherController:(id)a3;
- (SBSceneManager)_sceneManager;
- (SBSwitcherController)switcherController;
- (SBSwitcherCoordinatedLayoutStateTransitionContext)currentCoordinatedLayoutStateTransitionContext;
- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate;
- (SBWindowScene)_sbWindowScene;
- (id)_newLiveContentOverlayForApplicationContext:(id)a3 layoutRole:(int64_t)a4 sbsDisplayLayoutRole:(int64_t)a5;
- (id)_updateSceneRelevancyAssertionsForAppLayout:(id)a3 assertionTypesToCurrentAssertions:(id)a4 applicationSceneHandle:(id)a5 sceneRelevancyResult:(id)a6 reason:(id)a7;
- (id)appLayoutForKeyboardFocusedScene;
- (int64_t)_calculateSBSDisplayLayoutElementRoleForDisplayItem:(id)a3 inAppLayout:(id)a4;
- (int64_t)_existingOverlayTypeForAppLayout:(id)a3;
- (int64_t)containerOrientation;
- (void)_addOverlay:(id)a3 forAppLayout:(id)a4 animated:(BOOL)a5;
- (void)_configureLiveContentOverlayView:(id)a3 forTransitionContext:(id)a4 layoutRole:(int64_t)a5 sbsDisplayLayoutRole:(int64_t)a6;
- (void)_invalidateAssertions:(id)a3;
- (void)_moveExistingOverlayForAppLayout:(id)a3 toAppLayout:(id)a4;
- (void)_presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4;
- (void)_removeOverlayForAppLayout:(id)a3 animated:(BOOL)a4;
- (void)_updateAlwaysLiveSceneContentOverlays;
- (void)_updateFullScreenDisplayLayoutElementsForActiveAppLayouts:(id)a3 inAppLayout:(id)a4;
- (void)_updatePortaledSceneLiveContentOverlays;
- (void)appLayoutDidBecomeHidden:(id)a3;
- (void)appLayoutWillBecomeVisible:(id)a3;
- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)fullScreenSwitcherSceneLiveContentOverlay:(id)a3 tappedStatusBar:(id)a4 tapActionType:(int64_t)a5;
- (void)invalidate;
- (void)itemContainerForAppLayout:(id)a3 willBeReusedForAppLayout:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3;
- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)setAppLayoutToLiveContentOverlayContext:(id)a3;
- (void)setBundleIDForTargetOfKeyboardShortcuts:(id)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setCurrentCoordinatedLayoutStateTransitionContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDsplayItemsToWindowRelevancyAssertions:(id)a3;
- (void)setKeyboardFocusSceneID:(id)a3;
- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3;
- (void)setSceneIDForTargetOfKeyboardShortcuts:(id)a3;
- (void)setSwitcherSettings:(id)a3;
- (void)setVisibleAlwaysLiveAppLayouts:(id)a3;
- (void)updateSceneRelevancyWithZOrderedLeafAppLayouts:(id)a3 withSettings:(id)a4;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBFullScreenSwitcherLiveContentOverlayCoordinator

void __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1[4], "_existingOverlayTypeForAppLayout:") == 1
    && ([a1[5] containsObject:v3] & 1) == 0
    && ([*((id *)a1[4] + 10) hasTransitioningDisplayItemsForAppLayout:v3] & 1) == 0)
  {
    [a1[6] addObject:v3];
  }
}

- (int64_t)_existingOverlayTypeForAppLayout:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:a3];
  int64_t v4 = [v3 overlayType];

  return v4;
}

void __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 overlayType] == 1)
  {
    id v3 = [v4 overlay];
    [v3 setAsyncRenderingDisabled:0];
  }
}

void __90__SBFullScreenSwitcherLiveContentOverlayCoordinator__updateAlwaysLiveSceneContentOverlays__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 overlayType] == 3
    && ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v5] & 1) == 0)
  {
    [*(id *)(a1 + 32) _removeOverlayForAppLayout:v5 animated:0];
  }
}

void __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 overlayType] == 4 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0) {
    [*(id *)(a1 + 40) _removeOverlayForAppLayout:v5 animated:0];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self areLiveContentOverlayUpdatesSuspended])
  {
    v8 = [v7 applicationTransitionContext];
    v9 = [v8 previousLayoutState];
    v73 = v8;
    v10 = [v8 layoutState];
    v11 = [v7 error];

    if (v11)
    {
      id v12 = v9;

      v10 = v12;
    }
    v13 = [v9 appLayout];
    v14 = [v9 floatingAppLayout];
    v68 = v13;
    v15 = [v13 leafAppLayouts];
    if (v14)
    {
      uint64_t v16 = [v14 leafAppLayouts];
      v17 = (void *)v16;
      if (v15)
      {
        v18 = v15;
        v15 = [v15 arrayByAddingObjectsFromArray:v16];
      }
      else
      {
        v15 = (void *)v16;
      }
    }
    [v10 invalidateAppLayout];
    [v10 invalidateFloatingAppLayout];
    v19 = [v10 appLayout];
    uint64_t v20 = [v10 floatingAppLayout];
    v76 = v19;
    v21 = [v19 leafAppLayouts];
    v67 = v14;
    v72 = (void *)v20;
    if (v20)
    {
      v22 = (void *)v20;
      v23 = v15;
      uint64_t v24 = [v22 leafAppLayouts];
      v25 = (void *)v24;
      if (v21)
      {
        uint64_t v26 = [v21 arrayByAddingObjectsFromArray:v24];

        v21 = (void *)v26;
      }
      else
      {
        v21 = (void *)v24;
      }
      v15 = v23;
    }
    v66 = v15;
    char v27 = BSEqualObjects();
    v69 = v21;
    if (v21 && (v27 & 1) == 0)
    {
      v64 = v9;
      id v65 = v6;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      obuint64_t j = v21;
      uint64_t v75 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
      if (!v75) {
        goto LABEL_40;
      }
      uint64_t v74 = *(void *)v89;
      id v70 = v7;
      while (1)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v89 != v74) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v88 + 1) + 8 * v28);
          uint64_t v30 = 3;
          if ([v29 environment] != 2)
          {
            v31 = [v29 allItems];
            v32 = [v31 firstObject];
            uint64_t v30 = [v76 layoutRoleForItem:v32];
          }
          v33 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v29];
          uint64_t v34 = [v33 overlay];
          if (!v34) {
            goto LABEL_26;
          }
          v35 = (void *)v34;
          if ([v33 overlayType] != 3)
          {
            if ([v33 overlayType] == 2)
            {
              v40 = [v10 elementWithRole:v30];
              v41 = [v40 workspaceEntity];
              char v42 = [v41 isAppClipPlaceholderEntity];

              if (v42)
              {
                id v7 = v70;
                goto LABEL_30;
              }
              [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v29 animated:0];
              id v7 = v70;
              goto LABEL_25;
            }
            if ([v33 overlayType] != 4
              || ![(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext hasTransitioningDisplayItemsForAppLayout:v29])
            {
              goto LABEL_30;
            }
          }
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v29 animated:0];
LABEL_25:

LABEL_26:
          BOOL v36 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _shouldAnimateAddingLiveContentOverlayForTransitionContext:v73 leafAppLayout:v29];
          v37 = [v29 itemForLayoutRole:1];
          if (v30 == 3) {
            v38 = v72;
          }
          else {
            v38 = v76;
          }
          id v39 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _newLiveContentOverlayForApplicationContext:v73 layoutRole:v30 sbsDisplayLayoutRole:[(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _calculateSBSDisplayLayoutElementRoleForDisplayItem:v37 inAppLayout:v38]];
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _addOverlay:v39 forAppLayout:v29 animated:v36];

          v35 = 0;
LABEL_30:

          ++v28;
        }
        while (v75 != v28);
        uint64_t v43 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
        uint64_t v75 = v43;
        if (!v43)
        {
LABEL_40:

          v9 = v64;
          id v6 = v65;
          break;
        }
      }
    }
    v44 = objc_opt_new();
    appLayoutToLiveContentOverlayContext = self->_appLayoutToLiveContentOverlayContext;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __124__SBFullScreenSwitcherLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v85[3] = &unk_1E6AFC1C0;
    v85[4] = self;
    id v46 = v69;
    id v86 = v46;
    id v47 = v44;
    id v87 = v47;
    [(NSMutableDictionary *)appLayoutToLiveContentOverlayContext enumerateKeysAndObjectsUsingBlock:v85];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v81 objects:v93 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v82 != v51) {
            objc_enumerationMutation(v48);
          }
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:*(void *)(*((void *)&v81 + 1) + 8 * i) animated:0];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v81 objects:v93 count:16];
      }
      while (v50);
    }

    [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext bs_each:&__block_literal_global_82];
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateAlwaysLiveSceneContentOverlays];
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updatePortaledSceneLiveContentOverlays];
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateFullScreenDisplayLayoutElementsForActiveAppLayouts:v46 inAppLayout:v76];
    v53 = [v10 appLayout];
    v54 = [v53 zOrderedLeafAppLayouts];

    v55 = [(SBAppSwitcherSettings *)self->_switcherSettings sceneRelevancySettings];
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self updateSceneRelevancyWithZOrderedLeafAppLayouts:v54 withSettings:v55];
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v56 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v78 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        if ([v61 overlayType] == 1)
        {
          v62 = [v61 overlay];
          v63 = [v62 contentViewController];

          if (objc_opt_respondsToSelector()) {
            [v63 layoutStateTransitionCoordinator:v6 transitionDidEndWithTransitionContext:v7];
          }
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v77 objects:v92 count:16];
    }
    while (v58);
  }
}

- (void)_updateAlwaysLiveSceneContentOverlays
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = self->_visibleAlwaysLiveAppLayouts;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    uint64_t v28 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _canTransitionToOverlayType:3 forAppLayout:v8])
        {
          int64_t v9 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _existingOverlayTypeForAppLayout:v8];
          if (v9 != 3)
          {
            int64_t v10 = v9;
            v11 = [v8 allItems];
            id v12 = [v11 firstObject];

            v13 = (void *)MEMORY[0x1E4F62A60];
            v14 = [v12 uniqueIdentifier];
            v15 = [v13 identityForIdentifier:v14];

            uint64_t v16 = objc_opt_class();
            v17 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
            v18 = [v17 existingSceneHandleForSceneIdentity:v15];
            v19 = SBSafeCast(v16, v18);

            if (v19)
            {
              if (v10) {
                [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v8 animated:0];
              }
              uint64_t v20 = [SBFullScreenAlwaysLiveLiveContentOverlay alloc];
              v21 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sbWindowScene];
              v22 = [v21 screen];
              [v22 _referenceBounds];
              v25 = -[SBFullScreenAlwaysLiveLiveContentOverlay initWithSceneHandle:referenceSize:containerOrientation:](v20, "initWithSceneHandle:referenceSize:containerOrientation:", v19, self->_containerOrientation, v23, v24);

              [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _addOverlay:v25 forAppLayout:v8 animated:0];
            }

            uint64_t v6 = v27;
            id v3 = v28;
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  uint64_t v26 = (void *)[(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext copy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__SBFullScreenSwitcherLiveContentOverlayCoordinator__updateAlwaysLiveSceneContentOverlays__block_invoke;
  v29[3] = &unk_1E6AFC230;
  v29[4] = self;
  [v26 enumerateKeysAndObjectsUsingBlock:v29];
}

- (void)_updateFullScreenDisplayLayoutElementsForActiveAppLayouts:(id)a3 inAppLayout:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v11];
        v13 = [v12 overlay];
        objc_msgSend(v13, "setDisplayLayoutElementActive:", objc_msgSend(v5, "containsObject:", v11));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)_updatePortaledSceneLiveContentOverlays
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v70 = [WeakRetained switcherCoordinator];
  v2 = [WeakRetained contentViewController];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  v63 = v6;
  uint64_t v7 = [v6 layoutContext];
  uint64_t v8 = [v7 activeGesture];
  v64 = [v8 gestureEvent];

  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v64 isWindowDragGestureEvent])
  {
    uint64_t v9 = [v64 selectedAppLayout];
    int64_t v10 = [v9 itemForLayoutRole:1];
    uint64_t v89 = 0;
    long long v90 = &v89;
    uint64_t v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__24;
    v93 = __Block_byref_object_dispose__24;
    id v94 = 0;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke;
    v86[3] = &unk_1E6AFC258;
    id v11 = v10;
    id v87 = v11;
    long long v88 = &v89;
    [v70 enumerateSwitcherControllersWithBlock:v86];
    id v12 = (void *)v90[5];
    if (!v12)
    {
      uint64_t v13 = [v70 switcherControllerForDisplayItem:v11];
      long long v14 = (void *)v90[5];
      v90[5] = v13;

      id v12 = (void *)v90[5];
    }
    id v74 = v12;
    long long v15 = [v74 layoutState];
    long long v16 = objc_msgSend(v9, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v15, "displayOrdinal"));

    [v65 addObject:v16];
    _Block_object_dispose(&v89, 8);

LABEL_10:
    goto LABEL_22;
  }
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  if (currentCoordinatedLayoutStateTransitionContext)
  {
    v18 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)currentCoordinatedLayoutStateTransitionContext toSwitcherController];
    int v19 = [WeakRetained isEqual:v18];

    if (v19)
    {
      id v74 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext fromSwitcherController];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v16 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext displayItems];
      uint64_t v20 = [v16 countByEnumeratingWithState:&v82 objects:v96 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v83 != v21) {
              objc_enumerationMutation(v16);
            }
            uint64_t v23 = *(void *)(*((void *)&v82 + 1) + 8 * i);
            double v24 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext toAppLayout];
            v25 = [v24 leafAppLayoutForItem:v23];

            [v65 addObject:v25];
          }
          uint64_t v20 = [v16 countByEnumeratingWithState:&v82 objects:v96 count:16];
        }
        while (v20);
      }
      goto LABEL_10;
    }
  }
  id v74 = 0;
LABEL_22:
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ((BSEqualObjects() & 1) == 0)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    obuint64_t j = v65;
    uint64_t v71 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
    if (v71)
    {
      uint64_t v68 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v71; ++j)
        {
          if (*(void *)v79 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v78 + 1) + 8 * j);
          uint64_t v28 = [v70 convertAppLayout:v27 fromSwitcherController:v74 toSwitcherController:WeakRetained];
          [v69 addObject:v28];
          int64_t v29 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _existingOverlayTypeForAppLayout:v28];
          int64_t v30 = v29;
          if (v29 != 1 && v29 != 4)
          {
            v67 = [v28 itemForLayoutRole:1];
            long long v32 = [v74 windowScene];
            long long v33 = [v32 sceneManager];

            uint64_t v34 = (void *)MEMORY[0x1E4F62A60];
            uint64_t v35 = [v67 uniqueIdentifier];
            BOOL v36 = [v34 identityForIdentifier:v35];
            v37 = [v33 existingSceneHandleForSceneIdentity:v36];
            uint64_t v38 = objc_opt_class();
            id v39 = v37;
            if (v38)
            {
              if (objc_opt_isKindOfClass()) {
                v40 = v39;
              }
              else {
                v40 = 0;
              }
            }
            else
            {
              v40 = 0;
            }
            id v41 = v40;

            char v42 = [v74 contentViewController];
            uint64_t v43 = [v42 liveContentOverlayForAppLayout:v27];

            if (objc_opt_respondsToSelector())
            {
              v44 = (void *)[v43 newPortaledLiveContentOverlayView];
              v45 = [v44 layer];
              uint64_t v46 = objc_opt_class();
              id v47 = v45;
              if (v46)
              {
                if (objc_opt_isKindOfClass()) {
                  id v48 = v47;
                }
                else {
                  id v48 = 0;
                }
              }
              else
              {
                id v48 = 0;
              }
              id v49 = v48;

              [v49 setCrossDisplay:1];
              if (v41 && v43 && v44)
              {
                if (v30) {
                  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v28 animated:0];
                }
                uint64_t v50 = [v43 contentOverlayView];
                [v50 frame];
                double v52 = v51;
                double v54 = v53;

                v55 = [v74 layoutState];
                v56 = [v41 sceneIdentifier];
                uint64_t v57 = [v55 interfaceOrientationForElementIdentifier:v56];

                uint64_t v58 = [WeakRetained layoutState];
                uint64_t v59 = [v58 interfaceOrientation];

                v60 = -[SBFluidSwitcherPortaledSceneLiveContentOverlay initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:]([SBFluidSwitcherPortaledSceneLiveContentOverlay alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:", v41, v57, v59, v44, v52, v54);
                [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _addOverlay:v60 forAppLayout:v28 animated:0];
              }
            }
            else
            {
              v44 = 0;
            }
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
      }
      while (v71);
    }
  }
  v61 = (void *)[(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext copy];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke_2;
  v75[3] = &unk_1E6AFC280;
  id v76 = v69;
  long long v77 = self;
  id v62 = v69;
  [v61 enumerateKeysAndObjectsUsingBlock:v75];
}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  id v4 = [a3 itemForLayoutRole:1];
  if ([v4 type])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F62A60];
    uint64_t v7 = [v4 uniqueIdentifier];
    uint64_t v8 = [v6 identityForIdentifier:v7];

    uint64_t v9 = objc_opt_class();
    int64_t v10 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
    id v11 = [v10 existingSceneHandleForSceneIdentity:v8];
    id v12 = SBSafeCast(v9, v11);

    char v5 = [v12 isEdgeProtectEnabledForHomeGesture];
  }

  return v5;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  id v4 = [a3 itemForLayoutRole:1];
  if ([v4 type])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F62A60];
    uint64_t v7 = [v4 uniqueIdentifier];
    uint64_t v8 = [v6 identityForIdentifier:v7];

    uint64_t v9 = objc_opt_class();
    int64_t v10 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
    id v11 = [v10 existingSceneHandleForSceneIdentity:v8];
    id v12 = SBSafeCast(v9, v11);

    char v5 = [v12 isAutoHideEnabledForHomeAffordance];
  }

  return v5;
}

- (SBSceneManager)_sceneManager
{
  v2 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sbWindowScene];
  uint64_t v3 = [v2 sceneManager];

  return (SBSceneManager *)v3;
}

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  uint64_t v3 = [WeakRetained windowScene];

  return (SBWindowScene *)v3;
}

- (void)_configureLiveContentOverlayView:(id)a3 forTransitionContext:(id)a4 layoutRole:(int64_t)a5 sbsDisplayLayoutRole:(int64_t)a6
{
  id v46 = a3;
  id v10 = a4;
  id v11 = [v10 entityForLayoutRole:a5];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = SBSafeCast(v12, v11);
  long long v14 = [v13 sceneHandle];
  [v10 frameForApplicationSceneEntity:v11];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v10 layoutState];

  uint64_t v24 = objc_opt_class();
  id v25 = v23;
  if (v24)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  id v27 = v26;

  uint64_t v28 = [v27 spaceConfiguration];
  uint64_t v43 = [v27 floatingConfiguration];
  uint64_t v29 = [v27 interfaceOrientationForLayoutRole:a5];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v46, "setContentReferenceSize:interfaceOrientation:", v29, v20, v22);
  }
  int64_t v30 = [v14 application];
  uint64_t v44 = v29;
  uint64_t v45 = v28;
  if ([v30 classicAppPhoneAppRunningOnPad]
    && [v14 _supportsMixedOrientation])
  {
    char v42 = ((unint64_t)(v29 - 3) < 2) ^ ((unint64_t)([v27 interfaceOrientation] - 3) < 2);
  }
  else
  {
    char v42 = 0;
  }

  long long v31 = [v27 elementWithRole:a5];
  long long v32 = [v27 layoutAttributesForElement:v31];
  uint64_t v33 = [v32 sizingPolicy];
  if ([v46 overlayType] == 1)
  {
    int64_t v40 = a6;
    uint64_t v34 = v13;
    int64_t containerOrientation = self->_containerOrientation;
    id v41 = v14;
    id v36 = v46;
    LOBYTE(v39) = v42;
    int64_t v37 = containerOrientation;
    uint64_t v13 = v34;
    objc_msgSend(v36, "configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:", v11, v44, v37, a5, v40, v45, v16, v18, v20, v22, v43, v39, v33);
    uint64_t v38 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self keyboardFocusSceneID];
    [v36 noteKeyboardFocusDidChangeToSceneID:v38];

    long long v14 = v41;
  }
}

- (NSString)keyboardFocusSceneID
{
  return self->_keyboardFocusSceneID;
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self setKeyboardFocusSceneID:v4];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  char v5 = [(id)SBApp systemUIScenesCoordinator];
  id v6 = [v5 overlayUISceneController];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__SBFullScreenSwitcherLiveContentOverlayCoordinator_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v25[3] = &unk_1E6AFC208;
  id v7 = v4;
  id v26 = v7;
  id v27 = &v28;
  [v6 enumerateScenesWithBlock:v25];

  if (!*((unsigned char *)v29 + 24))
  {
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self setSceneIDForTargetOfKeyboardShortcuts:v7];
    uint64_t v8 = [MEMORY[0x1E4F62A60] identityForIdentifier:v7];
    uint64_t v9 = objc_opt_class();
    id v10 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
    id v11 = [v10 existingSceneHandleForSceneIdentity:v8];
    uint64_t v12 = SBSafeCast(v9, v11);

    uint64_t v13 = [v12 application];
    long long v14 = [v13 bundleIdentifier];
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self setBundleIDForTargetOfKeyboardShortcuts:v14];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v15 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        double v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v19 overlayType] == 1)
        {
          double v20 = [v19 overlay];
          [v20 noteKeyboardFocusDidChangeToSceneID:v7];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(&v28, 8);
}

- (void)setSceneIDForTargetOfKeyboardShortcuts:(id)a3
{
}

- (void)setKeyboardFocusSceneID:(id)a3
{
}

- (void)setBundleIDForTargetOfKeyboardShortcuts:(id)a3
{
}

void __89__SBFullScreenSwitcherLiveContentOverlayCoordinator_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v5 = [a2 identifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  uint64_t v30 = [v6 applicationTransitionContext];
  id v7 = [v30 layoutState];
  uint64_t v8 = [v7 unlockedEnvironmentMode];
  uint64_t v29 = v7;
  BOOL IsValid = SBPeekConfigurationIsValid([v7 peekConfiguration]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v33 = self;
  id v10 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    char v14 = v8 != 1 || IsValid;
    char v32 = v14;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v16 overlayType] == 1)
        {
          if ((v32 & 1) == 0 && ([v6 isInterrupted] & 1) == 0)
          {
            uint64_t v17 = [v16 overlay];
            uint64_t v18 = objc_opt_class();
            id v19 = v17;
            if (v18)
            {
              if (objc_opt_isKindOfClass()) {
                double v20 = v19;
              }
              else {
                double v20 = 0;
              }
            }
            else
            {
              double v20 = 0;
            }
            id v21 = v20;

            long long v22 = [v21 deviceApplicationSceneViewController];

            if ([v22 displayMode] == 4) {
              [v22 setDisplayMode:0 animationFactory:0 completion:0];
            }
          }
          long long v23 = [v16 overlay];
          long long v24 = [v23 contentViewController];

          if (objc_opt_respondsToSelector()) {
            [v24 layoutStateTransitionCoordinator:v31 transitionWillEndWithTransitionContext:v6];
          }
          id v25 = [v16 overlay];
          uint64_t v26 = objc_opt_class();
          id v27 = [v25 deviceApplicationSceneViewController];
          uint64_t v28 = SBSafeCast(v26, v27);

          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)v33 _presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:v6 medusaViewController:v28];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
}

- (void)_presentTransientErrorMessageIfNeededForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 _sbWindowScene];
  uint64_t v8 = [v7 switcherController];

  if ([v8 windowManagementStyle])
  {
    if ([(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:v10 medusaViewController:v6])
    {
      uint64_t v9 = 2;
    }
    else
    {
      if (![(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:v10 medusaViewController:v6])goto LABEL_7; {
      uint64_t v9 = 3;
      }
    }
    [v8 _presentMedusaBanner:v9 fireInterval:0.0 dismissInterval:1.5];
  }
LABEL_7:
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v86 = a3;
  id v87 = a4;
  if ([(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self areLiveContentOverlayUpdatesSuspended])
  {
    goto LABEL_80;
  }
  id v6 = [v87 applicationTransitionContext];
  id v7 = [v6 request];
  uint64_t v8 = [v6 previousLayoutState];
  v93 = v6;
  long long v80 = [v6 layoutState];
  uint64_t v9 = [v8 appLayout];
  long long v81 = v8;
  id v10 = [v8 floatingAppLayout];
  long long v78 = v9;
  uint64_t v11 = [v9 leafAppLayouts];
  if (v10)
  {
    uint64_t v12 = [v10 leafAppLayouts];
    uint64_t v13 = (void *)v12;
    if (v11)
    {
      uint64_t v14 = [v11 arrayByAddingObjectsFromArray:v12];

      uint64_t v11 = (void *)v14;
    }
    else
    {
      uint64_t v11 = (void *)v12;
    }
  }
  [v80 invalidateAppLayout];
  [v80 invalidateFloatingAppLayout];
  double v15 = [v80 appLayout];
  uint64_t v16 = [v80 floatingAppLayout];
  uint64_t v17 = [v15 leafAppLayouts];
  if (v16)
  {
    uint64_t v18 = [v16 leafAppLayouts];
    id v19 = (void *)v18;
    if (v17)
    {
      uint64_t v20 = [v17 arrayByAddingObjectsFromArray:v18];

      uint64_t v17 = (void *)v20;
    }
    else
    {
      uint64_t v17 = (void *)v18;
    }
  }
  long long v79 = v7;
  uint64_t v83 = objc_msgSend(v7, "source", v11);
  uint64_t v89 = v15;
  long long v85 = v17;
  long long v77 = v10;
  v96 = v16;
  if (![v93 animationDisabled])
  {
    long long v111 = 0uLL;
    long long v112 = 0uLL;
    long long v109 = 0uLL;
    long long v110 = 0uLL;
    id v82 = v17;
    uint64_t v88 = [v82 countByEnumeratingWithState:&v109 objects:v120 count:16];
    if (!v88) {
      goto LABEL_64;
    }
    uint64_t v84 = *(void *)v110;
    while (1)
    {
      for (uint64_t i = 0; i != v88; ++i)
      {
        if (*(void *)v110 != v84) {
          objc_enumerationMutation(v82);
        }
        long long v35 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        uint64_t v36 = 3;
        if ([v35 environment] != 2)
        {
          long long v37 = [v35 allItems];
          uint64_t v38 = [v37 firstObject];
          uint64_t v36 = [v15 layoutRoleForItem:v38];
        }
        uint64_t v39 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v35];
        id v40 = [v39 overlay];
        uint64_t v95 = [v35 itemForLayoutRole:1];
        int64_t v41 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator _calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:](self, "_calculateSBSDisplayLayoutElementRoleForDisplayItem:inAppLayout:");
        if (v40)
        {
          if ([v39 overlayType] != 3)
          {
            if ([v39 overlayType] == 2)
            {
              char v42 = [v80 elementWithRole:v36];
              uint64_t v43 = [v42 workspaceEntity];
              char v44 = [v43 isAppClipPlaceholderEntity];

              if (v44) {
                goto LABEL_59;
              }
            }
            else if ([v39 overlayType] != 4)
            {
LABEL_59:
              double v15 = v89;
LABEL_60:
              [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _configureLiveContentOverlayView:v40 forTransitionContext:v93 layoutRole:v36 sbsDisplayLayoutRole:v41];
LABEL_61:

              goto LABEL_62;
            }
          }
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v35 animated:0];
        }
        int64_t v90 = v41;
        id obja = (id)v36;
        uint64_t v45 = [v35 itemForLayoutRole:1];
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v46 = self;
        id v47 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v105 objects:v119 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v106;
LABEL_41:
          uint64_t v51 = 0;
          while (1)
          {
            if (*(void *)v106 != v50) {
              objc_enumerationMutation(v47);
            }
            double v52 = *(void **)(*((void *)&v105 + 1) + 8 * v51);
            if ([v52 containsItem:v45]) {
              break;
            }
            if (v49 == ++v51)
            {
              uint64_t v49 = [v47 countByEnumeratingWithState:&v105 objects:v119 count:16];
              if (v49) {
                goto LABEL_41;
              }
              goto LABEL_47;
            }
          }
          id v53 = v52;
          self = v46;
          double v54 = [(NSMutableDictionary *)v46->_appLayoutToLiveContentOverlayContext objectForKey:v53];
          id v40 = [v54 overlay];

          if (!v40) {
            goto LABEL_50;
          }
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)v46 _moveExistingOverlayForAppLayout:v53 toAppLayout:v35];

          double v15 = v89;
          int64_t v41 = v90;
          uint64_t v36 = (uint64_t)obja;
          goto LABEL_60;
        }
LABEL_47:

        id v53 = 0;
        self = v46;
LABEL_50:
        double v15 = v89;

        if (![(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_currentCoordinatedLayoutStateTransitionContext hasTransitioningDisplayItemsForAppLayout:v35])
        {
          BOOL v55 = [v81 unlockedEnvironmentMode] == 2 && v83 != 11;
          uint64_t v56 = v83 == 11 || v55;
          BOOL v57 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _shouldAnimateAddingLiveContentOverlayForTransitionContext:v93 leafAppLayout:v35];
          id v40 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _newLiveContentOverlayForApplicationContext:v93 layoutRole:obja sbsDisplayLayoutRole:v90];
          [v40 setStatusBarHidden:v56 nubViewHidden:v56 animator:0];
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _addOverlay:v40 forAppLayout:v35 animated:v57];
          goto LABEL_61;
        }
LABEL_62:
      }
      uint64_t v88 = [v82 countByEnumeratingWithState:&v109 objects:v120 count:16];
      if (!v88)
      {
LABEL_64:

        [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateAlwaysLiveSceneContentOverlays];
        [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updatePortaledSceneLiveContentOverlays];
        [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateFullScreenDisplayLayoutElementsForActiveAppLayouts:v82 inAppLayout:v15];
        uint64_t v17 = v85;
        goto LABEL_65;
      }
    }
  }
  long long v115 = 0uLL;
  long long v116 = 0uLL;
  long long v113 = 0uLL;
  long long v114 = 0uLL;
  obuint64_t j = v17;
  uint64_t v21 = [obj countByEnumeratingWithState:&v113 objects:v121 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v94 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v114 != v94) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v113 + 1) + 8 * j);
        uint64_t v25 = 3;
        if ([v24 environment] != 2)
        {
          uint64_t v26 = [v24 allItems];
          id v27 = [v26 firstObject];
          uint64_t v25 = [v15 layoutRoleForItem:v27];
        }
        uint64_t v28 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v24];
        uint64_t v29 = [v28 overlay];
        uint64_t v30 = [v24 itemForLayoutRole:1];
        if (v25 == 3) {
          id v31 = v96;
        }
        else {
          id v31 = v15;
        }
        int64_t v32 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _calculateSBSDisplayLayoutElementRoleForDisplayItem:v30 inAppLayout:v31];
        if (v29)
        {
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _configureLiveContentOverlayView:v29 forTransitionContext:v93 layoutRole:v25 sbsDisplayLayoutRole:v32];
        }
        else
        {
          id v33 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _newLiveContentOverlayForApplicationContext:v93 layoutRole:v25 sbsDisplayLayoutRole:v32];
          [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _addOverlay:v33 forAppLayout:v24 animated:0];
          double v15 = v89;
          [v33 setStatusBarHidden:v83 == 11 nubViewHidden:v83 == 11 animator:0];
        }
        uint64_t v17 = v85;
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v113 objects:v121 count:16];
    }
    while (v22);
  }

LABEL_65:
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v58 = v76;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v60; ++k)
      {
        if (*(void *)v102 != v61) {
          objc_enumerationMutation(v58);
        }
        uint64_t v63 = *(void *)(*((void *)&v101 + 1) + 8 * k);
        if (([v17 containsObject:v63] & 1) == 0)
        {
          v64 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v63];
          id v65 = v64;
          if (v64 && [v64 overlayType] == 1)
          {
            v66 = [v65 overlay];
            [v66 setAsyncRenderingDisabled:1];
            v67 = [v66 deviceApplicationSceneViewController];
            if ([v67 displayMode] == 4) {
              [v67 setDisplayMode:3 animationFactory:0 completion:0];
            }
          }
        }
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v101 objects:v118 count:16];
    }
    while (v60);
  }

LABEL_80:
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v68 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v97 objects:v117 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v70; ++m)
      {
        if (*(void *)v98 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v97 + 1) + 8 * m);
        if ([v73 overlayType] == 1)
        {
          id v74 = [v73 overlay];
          uint64_t v75 = [v74 contentViewController];

          if (objc_opt_respondsToSelector()) {
            [v75 layoutStateTransitionCoordinator:v86 transitionDidBeginWithTransitionContext:v87];
          }
        }
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v97 objects:v117 count:16];
    }
    while (v70);
  }
}

- (BOOL)_shouldAnimateAddingLiveContentOverlayForTransitionContext:(id)a3 leafAppLayout:(id)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_visibleAlwaysLiveAppLayouts containsObject:a4])
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [v6 previousLayoutState];
    uint64_t v9 = [v6 layoutState];
    uint64_t v10 = [v8 unlockedEnvironmentMode];
    if (((v10 & 0xFFFFFFFFFFFFFFFELL) == 2 || SBPeekConfigurationIsValid([v8 peekConfiguration]))
      && -[SBFullScreenSwitcherLiveContentOverlayCoordinator _layoutStateContainsElementBlockedForScreenTimeExpiration:](self, "_layoutStateContainsElementBlockedForScreenTimeExpiration:", v9)|| (uint64_t v11 = [v8 interfaceOrientation], v11 != objc_msgSend(v9, "interfaceOrientation")))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v12 = [v6 request];
      uint64_t v13 = [v12 source];

      BOOL v7 = 1;
      if (v10 != 2 && v13 != 11)
      {
        uint64_t v14 = [v9 unlockedEnvironmentMode];
        BOOL v7 = v10 == 3 && v14 == 3;
      }
    }
  }
  return v7;
}

- (id)_newLiveContentOverlayForApplicationContext:(id)a3 layoutRole:(int64_t)a4 sbsDisplayLayoutRole:(int64_t)a5
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = [v8 layoutState];
  uint64_t v11 = [v10 elementWithRole:a4];
  uint64_t v12 = [v11 workspaceEntity];

  if ([v12 isAppClipPlaceholderEntity])
  {
    id v13 = v12;
    uint64_t v14 = [SBFluidSwitcherAppClipLiveContentOverlay alloc];
    double v15 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sbWindowScene];
    uint64_t v16 = [(SBFluidSwitcherAppClipLiveContentOverlay *)v14 initWithPlaceholderEntity:v13 windowScene:v15];

    uint64_t v17 = [WeakRetained parentViewControllerForContentOverlay];
    uint64_t v18 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)v16 contentViewController];
    [v17 addChildViewController:v18];
    objc_msgSend(v18, "bs_beginAppearanceTransition:animated:", 1, 0);
    [v18 didMoveToParentViewController:v17];
    objc_msgSend(v18, "bs_endAppearanceTransition");
  }
  else
  {
    uint64_t v16 = objc_alloc_init(SBFullScreenSwitcherSceneLiveContentOverlay);
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)v16 setStatusBarActionDelegate:self];
  }
  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _configureLiveContentOverlayView:v16 forTransitionContext:v8 layoutRole:a4 sbsDisplayLayoutRole:a5];
  if ([(SBFullScreenSwitcherSceneLiveContentOverlay *)v16 overlayType] == 1)
  {
    id v19 = [WeakRetained parentViewControllerForContentOverlay];
    uint64_t v20 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)v16 contentViewController];
    uint64_t v21 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)v16 orientationWrapperView];
    [v19 addChildViewController:v20];
    objc_msgSend(v20, "bs_beginAppearanceTransition:animated:", 1, 0);
    uint64_t v22 = [v20 view];
    [v21 addContentView:v22];

    [v20 didMoveToParentViewController:v19];
    objc_msgSend(v20, "bs_endAppearanceTransition");
  }
  return v16;
}

- (int64_t)_calculateSBSDisplayLayoutElementRoleForDisplayItem:(id)a3 inAppLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self switcherController];
  int v9 = [v8 isChamoisWindowingUIEnabled];

  uint64_t v10 = [v7 layoutRoleForItem:v6];
  if (v9)
  {
    uint64_t v11 = [v7 zOrderedItems];

    unint64_t v12 = [v11 indexOfObject:v6];
    if (v12 > 3) {
      int64_t v13 = 0;
    }
    else {
      int64_t v13 = qword_1D8FD0FE0[v12];
    }
  }
  else
  {
    uint64_t v14 = v10;
    uint64_t v15 = [v7 environment];

    if (v15 == 2) {
      int64_t v13 = 7;
    }
    else {
      int64_t v13 = SBSDisplayLayoutRoleForLayoutRole(v14);
    }
  }

  return v13;
}

- (SBSwitcherController)switcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  return (SBSwitcherController *)WeakRetained;
}

- (void)_addOverlay:(id)a3 forAppLayout:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self delegate];
  uint64_t v11 = [[SBFullScreenLiveContentOverlayContext alloc] initWithOverlay:v8];
  [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext setObject:v11 forKey:v9];
  if (objc_opt_respondsToSelector()) {
    [v8 setContainerOrientation:self->_containerOrientation];
  }
  unint64_t v12 = SBLogAppSwitcher();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    uint64_t v14 = v18 = v10;
    uint64_t v15 = NSStringFromFullScreenLiveContentOverlayType([v8 overlayType]);
    uint64_t v16 = [v9 succinctDescription];
    uint64_t v17 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544386;
    uint64_t v20 = v14;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    long long v24 = v15;
    __int16 v25 = 2114;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Adding %{public}@ overlay for: %{public}@, animated: %{public}@", buf, 0x34u);

    uint64_t v10 = v18;
  }

  [v10 addLiveContentOverlay:v8 forAppLayout:v9 animated:v5];
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFullScreenSwitcherLiveContentOverlayCoordinator.m" lineNumber:212 description:@"delegate must be set before use"];
  }
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)WeakRetained;
}

- (void)appLayoutWillBecomeVisible:(id)a3
{
  id v16 = a3;
  id v4 = [v16 allItems];
  if ([v4 count] == 1)
  {
    BOOL v5 = [v4 firstObject];
    if ([v5 type])
    {
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F62A60];
      id v7 = [v5 uniqueIdentifier];
      id v8 = [v6 identityForIdentifier:v7];

      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
      uint64_t v11 = [v10 existingSceneHandleForSceneIdentity:v8];
      unint64_t v12 = SBSafeCast(v9, v11);

      LODWORD(v10) = [v12 shouldAlwaysDisplayLiveContent];
      if (v10
        && ([(NSMutableArray *)self->_visibleAlwaysLiveAppLayouts containsObject:v16] & 1) == 0)
      {
        visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
        if (!visibleAlwaysLiveAppLayouts)
        {
          uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v15 = self->_visibleAlwaysLiveAppLayouts;
          self->_visibleAlwaysLiveAppLayouts = v14;

          visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
        }
        [(NSMutableArray *)visibleAlwaysLiveAppLayouts addObject:v16];
        [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateAlwaysLiveSceneContentOverlays];
      }
    }
  }
  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updatePortaledSceneLiveContentOverlays];
}

- (SBFullScreenSwitcherLiveContentOverlayCoordinator)initWithSwitcherController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenSwitcherLiveContentOverlayCoordinator;
  BOOL v5 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_switcherController, v4);
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appLayoutToLiveContentOverlayContext = v6->_appLayoutToLiveContentOverlayContext;
    v6->_appLayoutToLiveContentOverlayContext = v7;

    uint64_t v9 = +[SBAppSwitcherDomain rootSettings];
    switcherSettings = v6->_switcherSettings;
    v6->_switcherSettings = (SBAppSwitcherSettings *)v9;
  }
  return v6;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  if (self->_liveContentOverlayUpdatesSuspended != a3) {
    self->_liveContentOverlayUpdatesSuspended = a3;
  }
}

- (void)setContainerOrientation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_int64_t containerOrientation = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) overlay];
        if (objc_opt_respondsToSelector()) {
          [v9 setContainerOrientation:a3];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v17 + 1) + 8 * v15) overlay];
        if (objc_opt_respondsToSelector()) {
          [v16 willRotateFromInterfaceOrientation:a3 toInterfaceOrientation:a4 alongsideContainerView:v10 animated:v6];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) overlay];
        if (objc_opt_respondsToSelector()) {
          [v11 didRotateFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (SBSwitcherCoordinatedLayoutStateTransitionContext *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  BOOL v6 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v4 fromSwitcherController];
  int v7 = [WeakRetained isEqual:v6];

  if (v7)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v4 displayItems];
    uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    uint64_t v30 = v4;
    id v31 = self;
    uint64_t v29 = *(void *)v36;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
        long long v13 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v4 fromAppLayout];
        long long v14 = [v13 leafAppLayoutForItem:v12];

        long long v15 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v14];
        if ([v15 overlayType] == 1)
        {
          long long v34 = [v15 overlay];
          id v16 = [v34 deviceApplicationSceneViewController];
          uint64_t v17 = [v16 sceneHandle];
          long long v18 = +[SBSceneManagerCoordinator sharedInstance];
          long long v19 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)v4 toSwitcherController];
          long long v20 = [v19 displayIdentity];
          __int16 v21 = [v18 sceneManagerForDisplayIdentity:v20];

          uint64_t v22 = [v17 sceneManager];
          __int16 v23 = [v17 sceneIfExists];
          uint64_t v24 = [v23 identity];
          if (v24)
          {
            __int16 v25 = (void *)v24;
            char v26 = BSEqualObjects();

            uint64_t v10 = v29;
            if ((v26 & 1) == 0)
            {
              __int16 v23 = [v17 sceneIfExists];
              __int16 v27 = [v23 identity];
              [v22 transferOwnershipOfSceneWithIdentity:v27 toSceneManager:v21];

              goto LABEL_12;
            }
          }
          else
          {
            uint64_t v10 = v29;
LABEL_12:
          }
          self = v31;
          if ([v16 displayMode] == 4) {
            [v16 setDisplayMode:3 animationFactory:0 completion:0];
          }

          id v4 = v30;
          uint64_t v9 = v32;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v9)
      {
LABEL_18:

        break;
      }
    }
  }
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = v4;
}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  BOOL v6 = [v4 fromSwitcherController];
  int v7 = [WeakRetained isEqual:v6];

  if (v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = objc_msgSend(v4, "displayItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          long long v14 = [v4 fromAppLayout];
          long long v15 = [v14 leafAppLayoutForItem:v13];

          id v16 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v15];
          if ([v16 overlayType]) {
            [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:v15 animated:0];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updatePortaledSceneLiveContentOverlays];
  currentCoordinatedLayoutStateTransitionContext = self->_currentCoordinatedLayoutStateTransitionContext;
  self->_currentCoordinatedLayoutStateTransitionContext = 0;
}

- (id)appLayoutForKeyboardFocusedScene
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v7];
        if ([v8 overlayType] == 1)
        {
          uint64_t v9 = [v7 allItems];
          uint64_t v10 = [v9 firstObject];

          uint64_t v11 = [v10 uniqueIdentifier];
          uint64_t v12 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self sceneIDForTargetOfKeyboardShortcuts];
          char v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            id v14 = v7;

            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  LOBYTE(v3) = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 <= 0x14 && ((1 << a3) & 0x1E7980) != 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allValues];
    uint64_t v3 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v3)
    {
      int64_t v18 = a3;
      uint64_t v6 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v8, "overlayType", v18) == 1)
          {
            uint64_t v9 = [v8 overlay];
            uint64_t v10 = objc_opt_class();
            uint64_t v11 = [v9 deviceApplicationSceneViewController];
            uint64_t v12 = SBSafeCast(v10, v11);

            char v13 = [v12 sceneHandle];
            id v14 = [v13 sceneIdentifier];
            long long v15 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self sceneIDForTargetOfKeyboardShortcuts];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              [v12 performSwitcherKeyboardShortcutAction:v18];

              LOBYTE(v3) = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v3 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v3;
}

- (void)appLayoutDidBecomeHidden:(id)a3
{
  id v5 = a3;
  if (-[NSMutableArray containsObject:](self->_visibleAlwaysLiveAppLayouts, "containsObject:"))
  {
    [(NSMutableArray *)self->_visibleAlwaysLiveAppLayouts removeObject:v5];
    if (![(NSMutableArray *)self->_visibleAlwaysLiveAppLayouts count])
    {
      visibleAlwaysLiveAppLayouts = self->_visibleAlwaysLiveAppLayouts;
      self->_visibleAlwaysLiveAppLayouts = 0;
    }
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateAlwaysLiveSceneContentOverlays];
  }
  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updatePortaledSceneLiveContentOverlays];
}

- (void)itemContainerForAppLayout:(id)a3 willBeReusedForAppLayout:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [v9 itemForLayoutRole:1];
  uint64_t v8 = [v6 itemForLayoutRole:1];
  if ([v7 isEqual:v8]) {
    [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _moveExistingOverlayForAppLayout:v9 toAppLayout:v6];
  }
}

- (void)updateSceneRelevancyWithZOrderedLeafAppLayouts:(id)a3 withSettings:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v46 = v7;
    uint64_t v8 = +[SBSceneRelevancyResolver displayItemsToSceneRelevancyResultForZOrderedAppLayouts:v6 withSettings:v7];
    dsplayItemsToWindowRelevancyAssertions = self->_dsplayItemsToWindowRelevancyAssertions;
    if (dsplayItemsToWindowRelevancyAssertions)
    {
      uint64_t v10 = [(NSMutableDictionary *)dsplayItemsToWindowRelevancyAssertions allKeys];
      uint64_t v11 = [v8 allKeys];
      uint64_t v12 = objc_msgSend(v10, "bs_differenceWithArray:", v11);

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v65 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            long long v19 = [(NSMutableDictionary *)self->_dsplayItemsToWindowRelevancyAssertions objectForKey:v18];
            [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _invalidateAssertions:v19];
            [(NSMutableDictionary *)self->_dsplayItemsToWindowRelevancyAssertions removeObjectForKey:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v15);
      }
    }
    else
    {
      long long v20 = (void *)MEMORY[0x1E4F1CA60];
      long long v21 = [v8 allKeys];
      objc_msgSend(v20, "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      long long v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      long long v23 = self->_dsplayItemsToWindowRelevancyAssertions;
      self->_dsplayItemsToWindowRelevancyAssertions = v22;
    }
    uint64_t v24 = +[SBSceneRelevancyResult defaultResult];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v47 = v6;
    objc_msgSend(v6, "bs_reverse");
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v61;
      double v52 = v24;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v61 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = v25;
          char v26 = *(void **)(*((void *)&v60 + 1) + 8 * v25);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          double v54 = v26;
          __int16 v27 = [v26 zOrderedItems];
          uint64_t v28 = objc_msgSend(v27, "bs_reverse");

          id v55 = v28;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v57;
            uint64_t v53 = *(void *)v57;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v57 != v31) {
                  objc_enumerationMutation(v55);
                }
                uint64_t v33 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                long long v34 = [(NSMutableDictionary *)self->_dsplayItemsToWindowRelevancyAssertions objectForKey:v33];
                long long v35 = [v8 objectForKey:v33];
                long long v36 = v35;
                if (v35 && ([v35 isEqual:v24] & 1) == 0)
                {
                  long long v37 = v8;
                  long long v38 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v54];
                  uint64_t v39 = [v38 overlay];

                  uint64_t v40 = [v39 overlaySceneHandle];
                  uint64_t v41 = objc_opt_class();
                  id v42 = v40;
                  if (v41)
                  {
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v43 = v42;
                    }
                    else {
                      uint64_t v43 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v43 = 0;
                  }
                  id v44 = v43;

                  if (v44 && [v39 overlayType] == 1)
                  {
                    if (v34) {
                      [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _updateSceneRelevancyAssertionsForAppLayout:v54 assertionTypesToCurrentAssertions:v34 applicationSceneHandle:v44 sceneRelevancyResult:v36 reason:@"set relevancy result"];
                    }
                    else {
                    uint64_t v45 = [v44 acquireAssertionsForRelevancyResult:v36 reason:@"set relevancy result"];
                    }
                    [(NSMutableDictionary *)self->_dsplayItemsToWindowRelevancyAssertions setObject:v45 forKey:v33];
                  }
                  uint64_t v8 = v37;
                  uint64_t v24 = v52;
                  uint64_t v31 = v53;
                }
                else
                {
                  [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _invalidateAssertions:v34];
                  [(NSMutableDictionary *)self->_dsplayItemsToWindowRelevancyAssertions removeObjectForKey:v33];
                }
              }
              uint64_t v30 = [v55 countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v30);
          }

          uint64_t v25 = v51 + 1;
        }
        while (v51 + 1 != v50);
        uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v50);
    }

    id v7 = v46;
    id v6 = v47;
  }
}

- (BOOL)_shouldShowSplitViewNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 sceneHandle];
  uint64_t v8 = [v7 application];
  id v9 = [v6 _sbWindowScene];

  uint64_t v10 = [v9 switcherController];

  uint64_t v11 = [v10 windowManagementStyle];
  uint64_t v12 = [v10 displayIdentity];
  LOBYTE(v11) = [v8 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v11 displayIdentity:v12];

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = [v5 fromLayoutState];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        long long v17 = v16;
      }
      else {
        long long v17 = 0;
      }
    }
    else
    {
      long long v17 = 0;
    }
    id v18 = v17;

    long long v19 = [v5 toLayoutState];
    uint64_t v20 = objc_opt_class();
    id v21 = v19;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        long long v22 = v21;
      }
      else {
        long long v22 = 0;
      }
    }
    else
    {
      long long v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = [v7 lastActivationSource];
    if (SBPeekConfigurationIsValid([v18 peekConfiguration])
      && !SBPeekConfigurationIsValid([v23 peekConfiguration]))
    {
      uint64_t v25 = [v18 appLayout];
      char v26 = [v18 floatingAppLayout];
      __int16 v27 = [v23 appLayout];
      BOOL v13 = [v23 spaceConfiguration] == 1 && v27 != v25 && v26 == 0;
    }
    else
    {
      if (v24 != 27)
      {
        BOOL v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v25 = [v18 appLayout];
      char v26 = [v23 appLayout];
      if ([v26 isCenterOverFull])
      {
        BOOL v13 = 0;
      }
      else
      {
        uint64_t v30 = [v23 floatingAppLayout];
        BOOL v13 = v30 == 0;
      }
      if (v26 == v25) {
        BOOL v13 = 0;
      }
    }

    goto LABEL_33;
  }
  BOOL v13 = 0;
LABEL_34:

  return v13;
}

- (BOOL)_shouldShowMultipleWindowsNotSupportedMessageForLayoutStateTransitionContext:(id)a3 medusaViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 sceneHandle];
  uint64_t v8 = [v7 application];
  id v9 = [v8 info];
  char v10 = [v9 supportsMultiwindow];

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = [v5 fromLayoutState];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    long long v17 = [v5 toLayoutState];
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v21 = v20;

    if (SBPeekConfigurationIsValid([v16 peekConfiguration])
      && !SBPeekConfigurationIsValid([v21 peekConfiguration]))
    {
      uint64_t v36 = [v7 lastActivationSource];
      long long v22 = [v16 appLayout];
      id v23 = [v16 floatingAppLayout];
      uint64_t v24 = [v21 appLayout];
      uint64_t v25 = [v21 floatingAppLayout];
      char v26 = (void *)v25;
      long long v37 = v23;
      if (v23)
      {
        long long v34 = objc_msgSend(v24, "leafAppLayoutForRole:", objc_msgSend(v6, "layoutRole"));
        [v23 leafAppLayoutForRole:1];
        __int16 v27 = v35 = v22;
        uint64_t v28 = objc_msgSend(v27, "appLayoutByModifyingEnvironment:", objc_msgSend(v24, "environment"));
        BOOL v29 = v34 == v28 && v26 == 0;
        uint64_t v30 = v26;
        char v31 = v29;

        long long v22 = v35;
      }
      else
      {
        uint64_t v30 = (void *)v25;
        char v31 = 0;
      }
      if (v24 == v22) {
        char v32 = 1;
      }
      else {
        char v32 = v31;
      }
      if (v36 == 3) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = v32;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _removeOverlayForAppLayout:*(void *)(*((void *)&v8 + 1) + 8 * v7++) animated:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext removeAllObjects];
  [(NSMutableArray *)self->_visibleAlwaysLiveAppLayouts removeAllObjects];
}

- (void)fullScreenSwitcherSceneLiveContentOverlay:(id)a3 tappedStatusBar:(id)a4 tapActionType:(int64_t)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v9 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v59 count:16];
  uint64_t v49 = v8;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v14 environment] == 3)
        {
          id v15 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v16 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext allKeys];
  id v17 = (id)[v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v17)
  {
    id v18 = v15;
    uint64_t v19 = *(void *)v51;
    while (2)
    {
      for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        long long v22 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v21];
        id v23 = [v22 overlay];

        if (v23 == v7)
        {
          id v17 = v7;
          id v24 = v21;

          goto LABEL_21;
        }
      }
      id v17 = (id)[v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    id v24 = 0;
LABEL_21:
    id v15 = v18;
  }
  else
  {
    id v24 = 0;
  }

  if (!v15 || v24 == v15)
  {
    __int16 v27 = [v24 itemForLayoutRole:1];
    char v26 = [v27 uniqueIdentifier];
  }
  else
  {
    uint64_t v25 = [v15 itemForLayoutRole:1];
    char v26 = [v25 uniqueIdentifier];

    __int16 v27 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v15];
    uint64_t v28 = [v27 overlay];

    id v17 = (id)v28;
  }

  BOOL v29 = [MEMORY[0x1E4F62A60] identityForIdentifier:v26];
  uint64_t v30 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _sceneManager];
  char v31 = [v30 existingSceneHandleForSceneIdentity:v29];
  uint64_t v32 = objc_opt_class();
  id v33 = v31;
  if (v32)
  {
    if (objc_opt_isKindOfClass()) {
      long long v34 = v33;
    }
    else {
      long long v34 = 0;
    }
  }
  else
  {
    long long v34 = 0;
  }
  id v35 = v34;

  uint64_t v36 = [v35 sceneIfExists];

  if (v36)
  {
    id v47 = [v17 contentViewController];
    long long v37 = [v47 view];
    [v49 locationInView:v37];
    double v39 = v38;

    uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F42E50]) initWithType:a5 xPosition:v39];
    [MEMORY[0x1E4F1CAD0] setWithObject:v40];
    uint64_t v41 = v29;
    id v42 = v26;
    id v43 = v17;
    id v44 = v24;
    id v46 = v45 = v15;
    [v36 sendActions:v46];

    id v15 = v45;
    id v24 = v44;
    id v17 = v43;
    char v26 = v42;
    BOOL v29 = v41;
  }
}

- (BOOL)_layoutStateContainsElementBlockedForScreenTimeExpiration:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__SBFullScreenSwitcherLiveContentOverlayCoordinator__layoutStateContainsElementBlockedForScreenTimeExpiration___block_invoke;
  v7[3] = &unk_1E6AFBD78;
  id v4 = v3;
  id v8 = v4;
  long long v9 = &v10;
  SBLayoutRoleEnumerateAppLayoutRoles(v7);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __111__SBFullScreenSwitcherLiveContentOverlayCoordinator__layoutStateContainsElementBlockedForScreenTimeExpiration___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) elementWithRole:a2];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 workspaceEntity];
    char v5 = [v4 applicationSceneEntity];
    uint64_t v6 = [v5 application];

    id v7 = [v6 info];
    LODWORD(v5) = [v7 isBlockedForScreenTimeExpiration];

    if (v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }

    id v3 = v8;
  }
}

- (BOOL)_canTransitionToOverlayType:(int64_t)a3 forAppLayout:(id)a4
{
  int64_t v5 = [(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _existingOverlayTypeForAppLayout:a4];
  return a3 != 3 || v5 != 1;
}

- (BOOL)_supportsMovingOverlayTypeBetweenAppLayouts:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_removeOverlayForAppLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    if ([v7 overlayType] == 3)
    {
      long long v9 = [v8 overlay];
      [v9 invalidate];
LABEL_8:

      goto LABEL_9;
    }
    if ([v8 overlayType] == 2
      || [v8 overlayType] == 1
      || [v8 overlayType] == 4)
    {
      uint64_t v10 = [v8 overlay];
      long long v9 = [v10 contentViewController];

      [v9 willMoveToParentViewController:0];
      objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", 0, 0);
      [v9 removeFromParentViewController];
      objc_msgSend(v9, "bs_endAppearanceTransition");
      uint64_t v11 = [v8 overlay];
      [v11 invalidate];

      goto LABEL_8;
    }
  }
LABEL_9:
  [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext removeObjectForKey:v6];
  uint64_t v12 = SBLogAppSwitcher();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromFullScreenLiveContentOverlayType([v8 overlayType]);
    id v16 = [v6 succinctDescription];
    id v17 = NSStringFromBOOL();
    int v19 = 138544386;
    uint64_t v20 = v14;
    __int16 v21 = 2048;
    long long v22 = self;
    __int16 v23 = 2114;
    id v24 = v15;
    __int16 v25 = 2114;
    char v26 = v16;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Removing %{public}@ overlay for: %{public}@, animated: %{public}@", (uint8_t *)&v19, 0x34u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeLiveContentOverlayForAppLayout:v6 animated:v4];
}

- (void)_moveExistingOverlayForAppLayout:(id)a3 toAppLayout:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext objectForKey:v6];
  long long v9 = v8;
  if (v8
    && -[SBFullScreenSwitcherLiveContentOverlayCoordinator _supportsMovingOverlayTypeBetweenAppLayouts:](self, "_supportsMovingOverlayTypeBetweenAppLayouts:", [v8 overlayType]))
  {
    [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_appLayoutToLiveContentOverlayContext setObject:v9 forKey:v7];
    uint64_t v10 = SBLogAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      char v13 = NSStringFromFullScreenLiveContentOverlayType([v9 overlayType]);
      id v14 = [v6 succinctDescription];
      id v15 = [v7 succinctDescription];
      int v18 = 138544386;
      int v19 = v12;
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = v13;
      __int16 v24 = 2114;
      __int16 v25 = v14;
      __int16 v26 = 2114;
      __int16 v27 = v15;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Moving existing %{public}@ overlay from: %{public}@, to: %{public}@", (uint8_t *)&v18, 0x34u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v17 = [v9 overlay];
    [WeakRetained moveExistingLiveContentOverlay:v17 forAppLayout:v6 toAppLayout:v7];
  }
}

void __92__SBFullScreenSwitcherLiveContentOverlayCoordinator__updatePortaledSceneLiveContentOverlays__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 _currentMainAppLayout];
  int v7 = [v6 containsItem:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_updateSceneRelevancyAssertionsForAppLayout:(id)a3 assertionTypesToCurrentAssertions:(id)a4 applicationSceneHandle:(id)a5 sceneRelevancyResult:(id)a6 reason:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v35 = a5;
  id v12 = a6;
  id v34 = a7;
  id v37 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = [&unk_1F3347BC8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    id v36 = v11;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(&unk_1F3347BC8);
        }
        id v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v18 = [v11 objectForKey:v17];
        uint64_t v19 = [v17 integerValue];
        if (![(SBFullScreenSwitcherLiveContentOverlayCoordinator *)self _shouldCreateAssertionForType:v19 withSceneRelevancyResult:v12])
        {
          [v18 invalidate];
          goto LABEL_38;
        }
        if (v19 == 2)
        {
          uint64_t v27 = [v12 prefersProcessTaskSuspensionWhileSceneForeground];
          uint64_t v28 = objc_opt_class();
          id v22 = v18;
          if (v28)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v29 = v22;
            }
            else {
              uint64_t v29 = 0;
            }
          }
          else
          {
            uint64_t v29 = 0;
          }
          id v30 = v29;

          if (v30 && v27 == [v30 taskSuspensionForegroundPreference]) {
            goto LABEL_36;
          }
          uint64_t v31 = [v35 acquireSceneTaskSuspensionForegroundPreferenceAssertionWithReason:v34 prefersProcessTaskSuspensionWhileSceneForeground:v27];
        }
        else if (v19 == 1)
        {
          uint64_t v24 = [v12 jetsamMode];
          uint64_t v25 = objc_opt_class();
          id v22 = v18;
          if (v25)
          {
            if (objc_opt_isKindOfClass()) {
              __int16 v26 = v22;
            }
            else {
              __int16 v26 = 0;
            }
          }
          else
          {
            __int16 v26 = 0;
          }
          id v30 = v26;

          if (v30 && [v30 jetsamMode] == v24) {
            goto LABEL_36;
          }
          uint64_t v31 = [v35 acquireSceneJetsamModeAssertionWithReason:v34 jetsamMode:v24];
        }
        else
        {
          if (v19) {
            goto LABEL_38;
          }
          uint64_t v20 = [v12 activityMode];
          uint64_t v21 = objc_opt_class();
          id v22 = v18;
          if (v21)
          {
            if (objc_opt_isKindOfClass()) {
              __int16 v23 = v22;
            }
            else {
              __int16 v23 = 0;
            }
          }
          else
          {
            __int16 v23 = 0;
          }
          id v30 = v23;

          if (v30 && [v30 activityMode] == v20)
          {
LABEL_36:
            [v37 setObject:v30 forKey:v17];
            goto LABEL_37;
          }
          uint64_t v31 = [v35 acquireSceneActivityModeAssertionWithReason:v34 activityMode:v20];
        }
        uint64_t v32 = (void *)v31;
        [v37 setObject:v31 forKey:v17];
        [v22 invalidate];

LABEL_37:
        id v11 = v36;

LABEL_38:
      }
      uint64_t v14 = [&unk_1F3347BC8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v14);
  }

  return v37;
}

- (void)_invalidateAssertions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = objc_msgSend(a3, "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)_shouldCreateAssertionForType:(int64_t)a3 withSceneRelevancyResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 2)
  {
    char v8 = [v5 prefersProcessTaskSuspensionWhileSceneForeground];
  }
  else
  {
    if (a3 == 1)
    {
      int v7 = [v5 jetsamMode];
    }
    else
    {
      if (a3)
      {
        char v8 = 1;
        goto LABEL_9;
      }
      int v7 = [v5 activityMode];
    }
    char v8 = v7 != 0;
  }
LABEL_9:

  return v8;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sceneIDForTargetOfKeyboardShortcuts
{
  return self->_sceneIDForTargetOfKeyboardShortcuts;
}

- (NSString)bundleIDForTargetOfKeyboardShortcuts
{
  return self->_bundleIDForTargetOfKeyboardShortcuts;
}

- (NSMutableDictionary)appLayoutToLiveContentOverlayContext
{
  return self->_appLayoutToLiveContentOverlayContext;
}

- (void)setAppLayoutToLiveContentOverlayContext:(id)a3
{
}

- (NSMutableArray)visibleAlwaysLiveAppLayouts
{
  return self->_visibleAlwaysLiveAppLayouts;
}

- (void)setVisibleAlwaysLiveAppLayouts:(id)a3
{
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)currentCoordinatedLayoutStateTransitionContext
{
  return self->_currentCoordinatedLayoutStateTransitionContext;
}

- (void)setCurrentCoordinatedLayoutStateTransitionContext:(id)a3
{
}

- (SBAppSwitcherSettings)switcherSettings
{
  return self->_switcherSettings;
}

- (void)setSwitcherSettings:(id)a3
{
}

- (NSMutableDictionary)dsplayItemsToWindowRelevancyAssertions
{
  return self->_dsplayItemsToWindowRelevancyAssertions;
}

- (void)setDsplayItemsToWindowRelevancyAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsplayItemsToWindowRelevancyAssertions, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_currentCoordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_visibleAlwaysLiveAppLayouts, 0);
  objc_storeStrong((id *)&self->_appLayoutToLiveContentOverlayContext, 0);
  objc_storeStrong((id *)&self->_bundleIDForTargetOfKeyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_sceneIDForTargetOfKeyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_keyboardFocusSceneID, 0);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end