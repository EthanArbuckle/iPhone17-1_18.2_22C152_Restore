@interface SBDisplayAppInteractionEventSource
- (BKSTouchDeliveryObservationService)touchDeliveryObservationService;
- (FBSDisplayLayoutPublishing)displayLayoutPublisher;
- (NSHashTable)observers;
- (NSString)currentFocusedBundleID;
- (SBApplicationController)applicationController;
- (SBApplicationRestrictionController)applicationRestrictionController;
- (SBFAnalyticsClient)analyticsClient;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (id)_bundleIDsForIcons:(id)a3;
- (id)_initWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9;
- (void)_configureEventSourceWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9;
- (void)_iconVisibilityDidChange:(id)a3;
- (void)_installedAppsDidChange:(id)a3;
- (void)_noteTouchForProcess:(int)a3 context:(unsigned int)a4;
- (void)_notifyTransition:(id)a3 beginning:(BOOL)a4;
- (void)_userQuitApplication:(id)a3;
- (void)_userRemovedSuggestion:(id)a3;
- (void)_webBookmarkUninstalled:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5;
- (void)dealloc;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setAnalyticsClient:(id)a3;
- (void)setApplicationController:(id)a3;
- (void)setApplicationRestrictionController:(id)a3;
- (void)setCurrentFocusedBundleID:(id)a3;
- (void)setDisplayLayoutPublisher:(id)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setTouchDeliveryObservationService:(id)a3;
- (void)touchDetachedForIdentifier:(unsigned int)a3 context:(unsigned int)a4 pid:(int)a5;
- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBDisplayAppInteractionEventSource

uint64_t __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)_notifyTransition:(id)a3 beginning:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 toLayoutState];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_63;
  }
  uint64_t v7 = [v6 unlockedEnvironmentMode];
  uint64_t v8 = objc_opt_class();
  v9 = [v5 workspaceTransaction];
  v10 = [v9 transitionRequest];
  v11 = SBSafeCast(v8, v10);

  v68 = v11;
  if (v11) {
    uint64_t v12 = [v11 source];
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = [v5 applicationTransitionContext];
  uint64_t v14 = [v13 requestedActivatingWorkspaceEntity];

  v15 = v6;
  v72 = (void *)v14;
  id v69 = v5;
  BOOL v70 = v4;
  if (v14)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v16 = [v6 elements];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v103 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v87;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v87 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          v22 = [v21 workspaceEntity];
          int v23 = [v72 isAnalogousToEntity:v22];

          if (v23)
          {
            id v24 = v21;
            goto LABEL_16;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v103 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      id v24 = 0;
LABEL_16:
      v6 = v15;
      BOOL v4 = v70;
    }
    else
    {
      id v24 = 0;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (v12 == 27)
  {
    v25 = [v5 fromLayoutState];
    v16 = [v25 elements];

    [v6 elements];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v82 objects:v102 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v83;
      while (2)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v83 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v82 + 1) + 8 * j);
          if (([v16 containsObject:v31] & 1) == 0)
          {
            id v24 = v31;
            goto LABEL_30;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v82 objects:v102 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    id v24 = 0;
LABEL_30:

    v6 = v15;
    goto LABEL_31;
  }
  id v24 = 0;
LABEL_32:
  v32 = [v6 elements];
  v33 = objc_msgSend(v32, "bs_map:", &__block_literal_global_328);

  if (!v33)
  {
    v33 = [MEMORY[0x1E4F1CAD0] set];
  }
  v34 = [v6 elements];
  v35 = objc_msgSend(v34, "bs_map:", &__block_literal_global_55_3);

  if (!v35)
  {
    v35 = [MEMORY[0x1E4F1CAD0] set];
  }
  v67 = v33;
  v36 = [v33 allObjects];
  uint64_t v37 = [v36 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  v66 = v35;
  v38 = [v35 allObjects];
  v71 = [v38 sortedArrayUsingComparator:&__block_literal_global_64_2];

  uint64_t v39 = 4;
  if (!v4) {
    uint64_t v39 = 5;
  }
  uint64_t v64 = v39;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  uint64_t v40 = *MEMORY[0x1E4FA7588];
  v65 = (void *)v37;
  v101[0] = v37;
  uint64_t v41 = *MEMORY[0x1E4FA7590];
  v100[0] = v40;
  v100[1] = v41;
  v63 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "interfaceOrientationForLayoutRole:", 1));
  v101[1] = v63;
  v100[2] = *MEMORY[0x1E4FA75B0];
  v61 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "interfaceOrientation"));
  v101[2] = v61;
  v100[3] = *MEMORY[0x1E4FA75B8];
  v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "spaceConfiguration"));
  v101[3] = v42;
  v100[4] = *MEMORY[0x1E4FA75A8];
  v43 = v6;
  v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "floatingConfiguration"));
  v101[4] = v44;
  v100[5] = *MEMORY[0x1E4FA75C8];
  v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v43, "unlockedEnvironmentMode"));
  v101[5] = v45;
  v100[6] = *MEMORY[0x1E4FA75C0];
  v46 = [NSNumber numberWithInteger:v12];
  v100[7] = *MEMORY[0x1E4FA75A0];
  v101[6] = v46;
  v101[7] = v71;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:8];
  [WeakRetained emitEvent:v64 withPayload:v47];

  v48 = SBLogDockRecents();
  BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
  if (v70)
  {
    if (v49)
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v93 = v7;
      __int16 v94 = 2112;
      v95 = v15;
      __int16 v96 = 2112;
      id v97 = v24;
      __int16 v98 = 2048;
      uint64_t v99 = v12;
      _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_INFO, "beginning transition to mode: %ld; layoutState: %@; activatingElement: %@, triggeredBy: %ld",
        buf,
        0x2Au);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v50 = self->_observers;
    uint64_t v51 = [(NSHashTable *)v50 countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v52; ++k)
        {
          if (*(void *)v79 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = *(void **)(*((void *)&v78 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [v55 eventSource:self didBeginTransitionToMode:v7 withLayoutState:v15 activatingElement:v24 triggeredBy:v12];
          }
        }
        uint64_t v52 = [(NSHashTable *)v50 countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v52);
    }
  }
  else
  {
    if (v49)
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v93 = v7;
      __int16 v94 = 2112;
      v95 = v15;
      __int16 v96 = 2112;
      id v97 = v24;
      __int16 v98 = 2048;
      uint64_t v99 = v12;
      _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_INFO, "ending transition to mode: %ld; layoutState: %@; activatingElement: %@, triggeredBy: %ld",
        buf,
        0x2Au);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v50 = self->_observers;
    uint64_t v56 = [(NSHashTable *)v50 countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v75 != v58) {
            objc_enumerationMutation(v50);
          }
          v60 = *(void **)(*((void *)&v74 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [v60 eventSource:self didFinishTransitionToMode:v7 withLayoutState:v15 activatingElement:v24 triggeredBy:v12];
          }
        }
        uint64_t v57 = [(NSHashTable *)v50 countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v57);
    }
  }

  id v5 = v69;
  v6 = v15;
LABEL_63:
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v7 = a4;
  id v34 = a5;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = v7;
  obuint64_t j = [v7 elements];
  uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    uint64_t v42 = *(void *)v49;
    uint64_t v41 = *MEMORY[0x1E4FA7478];
    uint64_t v11 = *MEMORY[0x1E4FA7480];
    uint64_t v40 = *MEMORY[0x1E4FA7470];
    uint64_t v39 = *MEMORY[0x1E4FA7468];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (!v10)
        {
          if (objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "hasKeyboardFocus", v34))
          {
            v10 = [v13 bundleIdentifier];
            uint64_t v14 = SBLogDockRecents();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v10;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "elementWithFocusBundleID = %@", buf, 0xCu);
            }
          }
          else
          {
            v10 = 0;
          }
        }
        v15 = v10;
        v16 = (void *)MEMORY[0x1E4F1CA60];
        v59[0] = v41;
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "level", v34));
        v60[0] = v17;
        v59[1] = v11;
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isUIApplicationElement"));
        v60[1] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
        v20 = [v16 dictionaryWithDictionary:v19];

        v21 = [v13 identifier];
        if (v21) {
          [v20 setObject:v21 forKeyedSubscript:v40];
        }
        v22 = [v13 bundleIdentifier];
        if (v22) {
          [v20 setObject:v22 forKeyedSubscript:v39];
        }
        [v43 addObject:v20];

        v10 = v15;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  uint64_t v57 = *MEMORY[0x1E4FA7488];
  id v58 = v43;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  [WeakRetained emitEvent:3 withPayload:v24];

  if (v10 && ![(NSString *)self->_currentFocusedBundleID isEqualToString:v10])
  {
    v25 = SBLogDockRecents();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      currentFocusedBundleID = self->_currentFocusedBundleID;
      *(_DWORD *)buf = 138412546;
      v54 = currentFocusedBundleID;
      __int16 v55 = 2112;
      uint64_t v56 = v10;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "elementWithFocusBundleID changed. old: %@; new: %@;",
        buf,
        0x16u);
    }

    uint64_t v27 = v10;
    [(SBDisplayAppInteractionEventSource *)self setCurrentFocusedBundleID:v10];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v28 = self->_observers;
    uint64_t v29 = [(NSHashTable *)v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v33 eventSource:self keyboardFocusChangedToApplication:self->_currentFocusedBundleID];
          }
        }
        uint64_t v30 = [(NSHashTable *)v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v30);
    }

    v10 = v27;
  }
}

id __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke_2(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[SBDisplayItem displayItemForLayoutElement:v2];
  BOOL v4 = v3;
  if (v3)
  {
    v11[0] = *MEMORY[0x1E4FA7580];
    uint64_t v5 = [v3 bundleIdentifier];
    v6 = (void *)v5;
    id v7 = @"none";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v12[0] = v7;
    v11[1] = *MEMORY[0x1E4FA7598];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "layoutRole"));
    v12[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_noteTouchForProcess:(int)a3 context:(unsigned int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBDisplayAppInteractionEventSource__noteTouchForProcess_context___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  int v5 = a3;
  unsigned int v6 = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __67__SBDisplayAppInteractionEventSource__noteTouchForProcess_context___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  v3 = [WeakRetained applicationWithPid:*(unsigned int *)(a1 + 40)];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [v3 bundleIdentifier];
        if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v9 eventSource:*(void *)(a1 + 32) userTouchedApplication:v10];
        }
        if (objc_opt_respondsToSelector()) {
          [v9 eventSource:*(void *)(a1 + 32) userTouchedApplication:v10 pid:*(unsigned int *)(a1 + 40) inContext:*(unsigned int *)(a1 + 44)];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_initWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBDisplayAppInteractionEventSource;
  v22 = [(SBDisplayAppInteractionEventSource *)&v25 init];
  int v23 = v22;
  if (v22) {
    [(SBDisplayAppInteractionEventSource *)v22 _configureEventSourceWithAnalyticsClient:v15 applicationController:v16 applicationRestrictionController:v17 iconModel:v18 layoutStateTransitionCoordinator:v19 displayLayoutPublisher:v20 touchDeliveryObservationService:v21];
  }

  return v23;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v22 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v22 homeScreenController];
  uint64_t v7 = [v6 iconManager];
  uint64_t v8 = [v7 iconModel];
  uint64_t v9 = SBSafeCast(v5, v8);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    long long v12 = +[SBIconController sharedInstance];
    id v11 = [v12 model];
  }
  if (self->_displayLayoutPublisher)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBDisplayAppInteractionEventSource.m" lineNumber:70 description:@"An event source cannot have multiple window scene connections."];
  }
  long long v13 = [MEMORY[0x1E4FA5E78] sharedInstance];
  long long v14 = +[SBApplicationController sharedInstance];
  id v15 = +[SBApplicationController sharedInstance];
  id v16 = [v15 restrictionController];
  id v17 = [v22 sceneManager];
  id v18 = [v17 _layoutStateTransitionCoordinator];
  id v19 = [v22 displayLayoutPublisher];
  id v20 = [MEMORY[0x1E4F4F3D8] sharedInstance];
  [(SBDisplayAppInteractionEventSource *)self _configureEventSourceWithAnalyticsClient:v13 applicationController:v14 applicationRestrictionController:v16 iconModel:v11 layoutStateTransitionCoordinator:v18 displayLayoutPublisher:v19 touchDeliveryObservationService:v20];
}

- (void)_configureEventSourceWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9
{
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  objc_storeWeak((id *)&self->_analyticsClient, a3);
  objc_storeWeak((id *)&self->_applicationController, v20);
  [v19 addObserver:self];
  objc_storeWeak((id *)&self->_applicationRestrictionController, v19);

  [v17 addObserver:self];
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, v17);

  [v15 addObserver:self];
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = (FBSDisplayLayoutPublishing *)v15;
  id v22 = v15;

  [v16 addObserver:self];
  objc_storeWeak((id *)&self->_touchDeliveryObservationService, v16);

  id v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 addObserver:self selector:sel__installedAppsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:v20];

  [v23 addObserver:self selector:sel__userQuitApplication_ name:@"SBAppSwitcherQuitAppNotification" object:0];
  [v23 addObserver:self selector:sel__iconVisibilityDidChange_ name:*MEMORY[0x1E4FA66F8] object:v18];

  [v23 addObserver:self selector:sel__userRemovedSuggestion_ name:@"SBFloatingDockSuggestionsDeletedNotification" object:0];
  [v23 addObserver:self selector:sel__webBookmarkUninstalled_ name:*MEMORY[0x1E4FA6750] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDeliveryObservationService);
  [WeakRetained removeObserver:self];

  [(FBSDisplayLayoutPublishing *)self->_displayLayoutPublisher removeObserver:self];
  id v5 = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  [v5 removeObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_applicationRestrictionController);
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)SBDisplayAppInteractionEventSource;
  [(SBDisplayAppInteractionEventSource *)&v7 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    objc_super v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)touchDetachedForIdentifier:(unsigned int)a3 context:(unsigned int)a4 pid:(int)a5
{
}

- (void)_installedAppsDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SBInstalledApplicationsRemovedBundleIDs"];

  id v6 = SBLogDockRecents();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "installedAppsChanged changed. removedBundleIDs: %@;",
      buf,
      0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "eventSource:userDeletedApplications:", self, v5, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_userQuitApplication:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SBAppSwitcherQuitAppBundleIdentifierKey"];

  id v6 = SBLogDockRecents();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "userQuitApplication: %@;", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "eventSource:userQuitApplicationInSwitcher:", self, v5, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([v8 count])
  {
    uint64_t v9 = SBLogDockRecents();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "hiddenTags: %@;", buf, 0xCu);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = self->_observers;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v15 eventSource:self applicationsBecameHidden:v8];
          }
        }
        uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
  }
  if ([v7 count])
  {
    long long v16 = SBLogDockRecents();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v7;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "visibleTags: %@;", buf, 0xCu);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = self->_observers;
    uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v22, "eventSource:applicationsBecameVisible:", self, v7, (void)v23);
          }
        }
        uint64_t v19 = [(NSHashTable *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
  }
}

- (void)_userRemovedSuggestion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"SBFloatingDockSuggestionsDeletedNotificationBundleIdentifierKey"];

  long long v16 = v4;
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"SBFloatingDockSuggestionsDeletedNotificationWebAppIdentifierKey"];

  uint64_t v9 = SBLogDockRecents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v23 = v6;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "userRemovedSuggestion: %@;", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_observers;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          if (v6) {
            [v15 eventSource:self userRemovedSuggestions:v6];
          }
          if (v8) {
            [v15 eventSource:self userRemovedSuggestions:v8];
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_webBookmarkUninstalled:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 object];
  id v7 = SBSafeCast(v5, v6);

  if (v7)
  {
    id v8 = SBLogDockRecents();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 identifier];
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "uninstalled bookmark for webClip: %@", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_observers;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "eventSource:userDeletedWebBookmark:", self, v7, (void)v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

uint64_t __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4FA7580];
  id v5 = a3;
  id v6 = [a2 objectForKey:v4];
  id v7 = [v5 objectForKey:v4];

  uint64_t v8 = [v6 localizedCaseInsensitiveCompare:v7];
  return v8;
}

- (void)_iconVisibilityDidChange:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA6868]];

  long long v26 = (void *)v6;
  id v7 = [(SBDisplayAppInteractionEventSource *)self _bundleIDsForIcons:v6];
  if ([v7 count])
  {
    uint64_t v8 = SBLogDockRecents();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "applications became hidden: %@", buf, 0xCu);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v9 = self->_observers;
    uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v14 eventSource:self applicationsBecameHidden:v7];
          }
        }
        uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }
  }
  long long v15 = [v4 userInfo];
  long long v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FA6870]];

  long long v17 = [(SBDisplayAppInteractionEventSource *)self _bundleIDsForIcons:v16];
  if ([v17 count])
  {
    long long v25 = v16;
    long long v18 = SBLogDockRecents();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "applications became unhidden: %@", buf, 0xCu);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v19 = self->_observers;
    uint64_t v20 = [(NSHashTable *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v24 eventSource:self applicationsBecameVisible:v17];
          }
        }
        uint64_t v21 = [(NSHashTable *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }

    long long v16 = v25;
  }
}

- (id)_bundleIDsForIcons:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "applicationBundleID", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)currentFocusedBundleID
{
  return self->_currentFocusedBundleID;
}

- (void)setCurrentFocusedBundleID:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKSTouchDeliveryObservationService)touchDeliveryObservationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDeliveryObservationService);
  return (BKSTouchDeliveryObservationService *)WeakRetained;
}

- (void)setTouchDeliveryObservationService:(id)a3
{
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (void)setDisplayLayoutPublisher:(id)a3
{
}

- (SBApplicationController)applicationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationController);
  return (SBApplicationController *)WeakRetained;
}

- (void)setApplicationController:(id)a3
{
}

- (SBApplicationRestrictionController)applicationRestrictionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationRestrictionController);
  return (SBApplicationRestrictionController *)WeakRetained;
}

- (void)setApplicationRestrictionController:(id)a3
{
}

- (SBFAnalyticsClient)analyticsClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  return (SBFAnalyticsClient *)WeakRetained;
}

- (void)setAnalyticsClient:(id)a3
{
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  return (SBLayoutStateTransitionCoordinator *)WeakRetained;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_destroyWeak((id *)&self->_analyticsClient);
  objc_destroyWeak((id *)&self->_applicationRestrictionController);
  objc_destroyWeak((id *)&self->_applicationController);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_destroyWeak((id *)&self->_touchDeliveryObservationService);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentFocusedBundleID, 0);
}

@end