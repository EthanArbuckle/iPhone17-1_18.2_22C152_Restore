@interface SBBackgroundActivityAttributionManager
+ (Class)_implementationClass;
+ (id)sharedInstance;
- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4;
- (FBWorkspaceEventQueue)eventQueue;
- (NSMapTable)attributionsByBackgroundActivityIdentifier;
- (NSMapTable)suspendedAttributionsByBackgroundActivityIdentifier;
- (NSMutableSet)backgroundActivityIdentifiers;
- (NSMutableSet)suspendedBackgroundActivityIdentifiers;
- (NSString)description;
- (OS_dispatch_queue)internalQueue;
- (SBBackgroundActivityAssertionServiceManager)assertionServiceManager;
- (SBBackgroundActivityAttributionManager)init;
- (SBStatusBarTapManager)statusBarTapManager;
- (SBWindowSceneStatusBarAssertionManager)appStatusBarAssertionManager;
- (id)_applicationForBackgroundActivityAttribution:(id)a3;
- (id)_statusStringsByIdentifierForActiveAttributionsByBackgroundActivityIdentifier:(id)a3 inactiveAttributionsByBackgroundActivityIdentifier:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:(id)a3 withHandler:(id)a4;
- (void)_postStatusStringsByIdentifier:(id)a3;
- (void)_queue_updateWithData:(id)a3 andOverrides:(id)a4;
- (void)_registerHandlerAndHandleExistingState;
- (void)_updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:(id)a3 removedBackgroundActivityIdentifiers:(id)a4;
- (void)assertionServiceDidChangeStatusStringsForAForegroundApp;
- (void)dealloc;
- (void)invalidateBackgroundActivityAttributions:(id)a3;
- (void)setAppStatusBarAssertionManager:(id)a3;
- (void)setAttributionsByBackgroundActivityIdentifier:(id)a3;
- (void)setBackgroundActivityIdentifiers:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setSuspendedAttributionsByBackgroundActivityIdentifier:(id)a3;
- (void)setSuspendedBackgroundActivityIdentifiers:(id)a3;
- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4;
- (void)updateForegroundApplicationSceneHandles:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5;
@end

@implementation SBBackgroundActivityAttributionManager

uint64_t __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBBackgroundActivityAttributionManager *)self updateForegroundApplicationSceneHandles:v5 withOptions:2 completion:0];
}

- (void)updateForegroundApplicationSceneHandles:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"-[SBBackgroundActivityAttributionManager updateForegroundApplicationSceneHandles:withOptions:completion:]"];
    [v12 handleFailureInFunction:v13 file:@"SBBackgroundActivityAttributionManager.m" lineNumber:128 description:@"this call must be made on the main thread"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__SBBackgroundActivityAttributionManager_updateForegroundApplicationSceneHandles_withOptions_completion___block_invoke;
  v14[3] = &unk_1E6B00760;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SBBackgroundActivityAttributionManager *)self _mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:v11 withHandler:v14];
}

- (void)_mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:(id)a3 withHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[SBBackgroundActivityAttributionManager _mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:withHandler:]"];
    [v25 handleFailureInFunction:v26 file:@"SBBackgroundActivityAttributionManager.m" lineNumber:179 description:@"this call must be made on the main thread"];
  }
  v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v46;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v7;
        v33 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        id v8 = [v33 application];
        id v9 = [v8 backgroundActivityAttributionsByIdentifier];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              id v16 = [v10 objectForKey:v15];
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v40[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke;
              v40[3] = &unk_1E6B00788;
              v40[4] = self;
              v40[5] = v33;
              unint64_t v17 = [v16 objectsPassingTest:v40];
              v18 = [v6 objectForKey:v15];
              v19 = (void *)[v18 mutableCopy];

              if (v19) {
                [v19 unionSet:v17];
              }
              else {
                [v6 setObject:v17 forKey:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v30);
  }

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__47;
  v38[4] = __Block_byref_object_dispose__47;
  v20 = [(SBWindowSceneStatusBarAssertionManager *)self->_appStatusBarAssertionManager currentStatusBarSettings];
  v21 = [v20 backgroundActivitiesToSuppress];
  id v39 = (id)[v21 mutableCopy];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_34;
  block[3] = &unk_1E6B007D8;
  block[4] = self;
  id v35 = v6;
  id v36 = v27;
  v37 = v38;
  id v23 = v27;
  id v24 = v6;
  dispatch_async(internalQueue, block);

  _Block_object_dispose(v38, 8);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBBackgroundActivityAttributionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_16 != -1) {
    dispatch_once(&sharedInstance_onceToken_16, block);
  }
  v2 = (void *)sharedInstance___sharedBackgroundActivityAssertionManager;
  return v2;
}

void __105__SBBackgroundActivityAttributionManager_updateForegroundApplicationSceneHandles_withOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    [*(id *)(a1 + 32) _postStatusStringsByIdentifier:v6];
    uint64_t v7 = *(void *)(a1 + 56);
  }
  if ((v7 & 2) != 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setBackgroundActivitiesToSuppress:", v5, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

- (void)_postStatusStringsByIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v3 objectForKey:v8];
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        if (v9 == v10) {
          uint64_t v11 = &stru_1F3084718;
        }
        else {
          uint64_t v11 = v9;
        }
        uint64_t v12 = v11;

        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F42E40], "stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:", v8);
        if (([(__CFString *)v12 isEqualToString:v13] & 1) == 0) {
          objc_msgSend(MEMORY[0x1E4F42E40], "stui_postDoubleHeightStatusString:forBackgroundActivityWithIdentifier:", v12, v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

void __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v8];
        uint64_t v10 = [v9 setRepresentation];
        uint64_t v11 = (void *)[v10 mutableCopy];

        if ([v11 count])
        {
          uint64_t v12 = [*(id *)(a1 + 40) objectForKey:v8];
          [v11 minusSet:v12];

          if ([v11 count]) {
            [v2 setObject:v11 forKey:v8];
          }
          else {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  long long v14 = (void *)[v2 copy];
  long long v15 = [v13 _statusStringsByIdentifierForActiveAttributionsByBackgroundActivityIdentifier:v14 inactiveAttributionsByBackgroundActivityIdentifier:*(void *)(a1 + 40)];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_2;
  block[3] = &unk_1E6B007B0;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  id v21 = v16;
  uint64_t v22 = v17;
  id v20 = v15;
  id v18 = v15;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)_statusStringsByIdentifierForActiveAttributionsByBackgroundActivityIdentifier:(id)a3 inactiveAttributionsByBackgroundActivityIdentifier:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v55 = *(void *)v65;
    id v51 = v7;
    v52 = v8;
    id v48 = v9;
    do
    {
      uint64_t v12 = 0;
      uint64_t v50 = v11;
      do
      {
        if (*(void *)v65 != v55) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v64 + 1) + 8 * v12);
        long long v14 = [v9 objectForKey:v13];
        long long v15 = [v7 objectForKey:v13];
        uint64_t v16 = STUIStyleOverrideForBackgroundActivityIdentifier();
        if (v16 == 4) {
          goto LABEL_34;
        }
        if (v16 != 2048)
        {
          uint64_t v30 = [(SBBackgroundActivityAssertionServiceManager *)self->_assertionServiceManager statusStringForBackgroundActivityWithIdentifier:v13 activeAttributions:v14];
          if (v30) {
            goto LABEL_40;
          }
LABEL_34:
          if ([v14 count] != 1) {
            goto LABEL_39;
          }
          uint64_t v57 = v13;
          v59 = v15;
          uint64_t v39 = v12;
          v40 = v14;
          long long v41 = [v14 anyObject];
          long long v42 = [(SBBackgroundActivityAttributionManager *)self _applicationForBackgroundActivityAttribution:v41];
          long long v43 = [v42 displayName];
          if (v43)
          {
            long long v44 = NSString;
            long long v45 = [MEMORY[0x1E4F28B50] mainBundle];
            long long v46 = [v45 localizedStringForKey:@"STATUS_BAR_BACKGROUND_ACTIVITY_SINGLE_APP_WITH_NAME_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
            uint64_t v30 = objc_msgSend(v44, "stringWithFormat:", v46, v43);

            uint64_t v11 = v50;
          }
          else
          {
            uint64_t v30 = 0;
          }

          uint64_t v12 = v39;
          long long v14 = v40;
          uint64_t v13 = v57;
          long long v15 = v59;
          id v7 = v51;
          uint64_t v8 = v52;
          if (!v30)
          {
LABEL_39:
            uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
          }
          goto LABEL_40;
        }
        uint64_t v56 = v13;
        v58 = v15;
        uint64_t v53 = v12;
        uint64_t v49 = [v15 count];
        uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v54 = v14;
        id v18 = v14;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v61 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              long long v24 = [v23 activityAttribution];
              long long v25 = [v24 attributedEntity];
              char v26 = [v25 isSystemService];

              if ((v26 & 1) == 0)
              {
                id v27 = [(SBBackgroundActivityAttributionManager *)self _applicationForBackgroundActivityAttribution:v23];
                if (v27)
                {
                  [v17 addObject:v27];
                }
                else
                {
                  uint64_t v28 = SBLogStatusBarish();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v69 = v23;
                    _os_log_fault_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_FAULT, "Could not look up a background locating app for %@", buf, 0xCu);
                  }
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v20);
        }

        uint64_t v29 = [v17 count];
        uint64_t v30 = (void *)v29;
        if (v29)
        {
          if (v29 == 1)
          {
            uint64_t v31 = [v17 anyObject];
            v32 = [v31 displayName];

            v33 = NSString;
            v34 = [MEMORY[0x1E4F28B50] mainBundle];
            id v35 = [v34 localizedStringForKey:@"STATUS_BAR_BACKGROUND_LOCATION_SINGLE_APP_WITH_NAME_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
            uint64_t v30 = objc_msgSend(v33, "stringWithFormat:", v35, v32);
          }
          else
          {
            id v36 = NSString;
            v37 = [MEMORY[0x1E4F28B50] mainBundle];
            v32 = v37;
            if (v49) {
              v38 = @"STATUS_BAR_BACKGROUND_LOCATION_MULTIPLE_OTHER_APPS_WITH_COUNT_FORMAT";
            }
            else {
              v38 = @"STATUS_BAR_BACKGROUND_LOCATION_MULTIPLE_APPS_WITH_COUNT_FORMAT";
            }
            v34 = [v37 localizedStringForKey:v38 value:&stru_1F3084718 table:@"SpringBoardPlurals"];
            uint64_t v30 = objc_msgSend(v36, "stringWithFormat:", v34, v30);
          }
          id v7 = v51;
          uint64_t v8 = v52;
          id v9 = v48;
          uint64_t v13 = v56;

          long long v14 = v54;
          long long v15 = v58;
          uint64_t v11 = v50;
        }
        else
        {
          id v7 = v51;
          uint64_t v8 = v52;
          id v9 = v48;
          uint64_t v11 = v50;
          long long v14 = v54;
          uint64_t v13 = v56;
          long long v15 = v58;
        }

        uint64_t v12 = v53;
        if (!v30) {
          goto LABEL_34;
        }
LABEL_40:
        [v8 setObject:v30 forKey:v13];

        ++v12;
      }
      while (v12 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (Class)_implementationClass
{
  return (Class)objc_opt_class();
}

uint64_t __56__SBBackgroundActivityAttributionManager_sharedInstance__block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = objc_alloc_init((Class)[*(id *)(a1 + 32) _implementationClass]);
  id v3 = (void *)sharedInstance___sharedBackgroundActivityAssertionManager;
  sharedInstance___sharedBackgroundActivityAssertionManager = (uint64_t)v2;

  return kdebug_trace();
}

- (SBBackgroundActivityAttributionManager)init
{
  v33.receiver = self;
  v33.super_class = (Class)SBBackgroundActivityAttributionManager;
  id v3 = [(SBBackgroundActivityAttributionManager *)&v33 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    attributionsByBackgroundActivityIdentifier = v3->_attributionsByBackgroundActivityIdentifier;
    v3->_attributionsByBackgroundActivityIdentifier = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    suspendedAttributionsByBackgroundActivityIdentifier = v3->_suspendedAttributionsByBackgroundActivityIdentifier;
    v3->_suspendedAttributionsByBackgroundActivityIdentifier = (NSMapTable *)v6;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)Serial;

    id v10 = objc_alloc(MEMORY[0x1E4F624E0]);
    uint64_t v11 = [v10 initWithName:@"com.apple.springboard.background-activities.eventqueue" onQueue:MEMORY[0x1E4F14428]];
    eventQueue = v3->_eventQueue;
    v3->_eventQueue = (FBWorkspaceEventQueue *)v11;

    uint64_t v13 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
    uint64_t v14 = [v13 assertionManager];
    appStatusBarAssertionManager = v3->_appStatusBarAssertionManager;
    v3->_appStatusBarAssertionManager = (SBWindowSceneStatusBarAssertionManager *)v14;

    [(SBWindowSceneStatusBarAssertionManager *)v3->_appStatusBarAssertionManager addObserver:v3];
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    backgroundActivityIdentifiers = v3->_backgroundActivityIdentifiers;
    v3->_backgroundActivityIdentifiers = (NSMutableSet *)v16;

    id v18 = objc_alloc_init(SBStatusBarTapManager);
    statusBarTapManager = v3->_statusBarTapManager;
    v3->_statusBarTapManager = v18;

    objc_initWeak(&location, v3);
    uint64_t v30 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v31, &location);
    id v20 = (id)BSLogAddStateCaptureBlockWithTitle();
    uint64_t v21 = objc_msgSend((id)SBApp, "systemStatusServer", v30, 3221225472, __46__SBBackgroundActivityAttributionManager_init__block_invoke, &unk_1E6AF76A8);
    if (!v21)
    {
      uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:v3 file:@"SBBackgroundActivityAttributionManager.m" lineNumber:98 description:@"SBBackgroundActivityAttributionManager is being created before the system status server"];
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FA9320]) initWithServerHandle:v21];
    backgroundActivitiesDomain = v3->_backgroundActivitiesDomain;
    v3->_backgroundActivitiesDomain = (STBackgroundActivitiesStatusDomain *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FA94F0]) initWithServerHandle:v21];
    overridesDomain = v3->_overridesDomain;
    v3->_overridesDomain = (STStatusBarOverridesStatusDomain *)v24;

    [(SBBackgroundActivityAttributionManager *)v3 _registerHandlerAndHandleExistingState];
    char v26 = objc_alloc_init(SBBackgroundActivityAssertionServiceManager);
    assertionServiceManager = v3->_assertionServiceManager;
    v3->_assertionServiceManager = v26;

    [(SBBackgroundActivityAssertionServiceManager *)v3->_assertionServiceManager setDelegate:v3];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __46__SBBackgroundActivityAttributionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(STBackgroundActivitiesStatusDomain *)self->_backgroundActivitiesDomain invalidate];
  [(STStatusBarOverridesStatusDomain *)self->_overridesDomain invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundActivityAttributionManager;
  [(SBBackgroundActivityAttributionManager *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBBackgroundActivityAttributionManager *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SBBackgroundActivityAssertionServiceManager *)self->_assertionServiceManager handleTapForBackgroundActivityWithIdentifier:v6 windowScene:v7]|| [(SBStatusBarTapManager *)self->_statusBarTapManager handleTapForBackgroundActivityWithIdentifier:v6 windowScene:v7];

  return v8;
}

- (void)invalidateBackgroundActivityAttributions:(id)a3
{
}

- (id)_applicationForBackgroundActivityAttribution:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 activityAttribution];
  uint64_t v5 = [v4 attributedEntity];
  id v6 = [v5 bundleIdentifier];

  id v7 = +[SBApplicationController sharedInstance];
  BOOL v8 = v7;
  if (v6)
  {
    id v9 = [v7 applicationWithBundleIdentifier:v6];
  }
  else
  {
    id v10 = [v3 activityAttribution];
    id v9 = objc_msgSend(v8, "applicationWithPid:", objc_msgSend(v10, "pid"));
  }
  return v9;
}

uint64_t __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 96);
  id v4 = a2;
  uint64_t v5 = [v4 backgroundActivityIdentifier];
  id v6 = [*(id *)(a1 + 40) _windowScene];
  LODWORD(v3) = [v3 canHandleTapForBackgroundActivityWithIdentifier:v5 windowScene:v6];

  LODWORD(v6) = [v4 showsWhenForeground];
  return (v6 | v3) ^ 1;
}

- (void)_updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:(id)a3 removedBackgroundActivityIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke;
  block[3] = &unk_1E6AF4E00;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"%@-%@", v4, @"UpdateSuppressionSettings"];

  id v6 = (void *)MEMORY[0x1E4F624D8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_2;
  v10[3] = &unk_1E6AF59B8;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = [v6 eventWithName:v8 handler:v10];
  [*(id *)(*(void *)(a1 + 32) + 72) executeOrAppendEvent:v9];
}

void __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) acquireLockForReason:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) count])
  {
    id v3 = [MEMORY[0x1E4FA9348] sharedInstance];
    [v3 removeActiveBackgroundActivities:*(void *)(a1 + 48)];

    [MEMORY[0x1E4F42E40] removeStyleOverrides:STUIStyleOverridesForBackgroundActivityIdentifiers()];
    id v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = STBackgroundActivityIdentifiersDescription();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Removed background activities: %{public}@", buf, 0xCu);
    }
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_67;
  v11[3] = &unk_1E6AF4E00;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v2;
  id v10 = v2;
  [v6 updateForegroundApplicationSceneHandles:v7 withOptions:-1 completion:v11];
}

uint64_t __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_67(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x1E4FA9348] sharedInstance];
    [v2 addActiveBackgroundActivities:*(void *)(a1 + 32)];

    [MEMORY[0x1E4F42E40] addStyleOverrides:STUIStyleOverridesForBackgroundActivityIdentifiers()];
    id v3 = SBLogStatusBarish();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = STBackgroundActivityIdentifiersDescription();
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Added background activities: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 72) relinquishLock:*(void *)(a1 + 48)];
}

- (void)_registerHandlerAndHandleExistingState
{
  objc_initWeak(&location, self);
  backgroundActivitiesDomain = self->_backgroundActivitiesDomain;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke;
  v10[3] = &unk_1E6B00800;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [(STBackgroundActivitiesStatusDomain *)backgroundActivitiesDomain observeDataWithBlock:v10];
  overridesDomain = self->_overridesDomain;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_3;
  v8[3] = &unk_1E6B00828;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [(STStatusBarOverridesStatusDomain *)overridesDomain observeDataWithBlock:v8];
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_5;
  v6[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v7, &location);
  dispatch_async(internalQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_2;
  v6[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateWithData:andOverrides:", *(void *)(a1 + 32), WeakRetained[4]);
    id WeakRetained = v3;
  }
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_4;
  v6[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateWithData:andOverrides:", WeakRetained[2], *(void *)(a1 + 32));
    id WeakRetained = v3;
  }
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained[1] data];
    id v3 = [v4[3] data];
    objc_msgSend(v4, "_queue_updateWithData:andOverrides:", v2, v3);

    id WeakRetained = v4;
  }
}

- (void)_queue_updateWithData:(id)a3 andOverrides:(id)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BSDispatchQueueAssert();
  id v9 = [(STBackgroundActivitiesStatusDomainData *)self->_queue_processedData attributions];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C978] array];
  }
  id v12 = v11;

  uint64_t v13 = [v7 attributions];
  id v14 = v13;
  v76 = v7;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v16 = v15;

  uint64_t v17 = objc_msgSend(v16, "bs_differenceWithArray:", v12);
  v73 = v16;
  id v18 = objc_msgSend(v12, "bs_differenceWithArray:", v16);
  objc_storeStrong((id *)&self->_queue_processedData, a3);
  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  v83 = [MEMORY[0x1E4F1CA80] set];
  id v20 = [(STStatusBarOverridesStatusDomainData *)self->_queue_processedOverrides suppressedBackgroundActivityIdentifiers];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F1CAD0] set];
  }
  v81 = v22;

  long long v23 = [v8 suppressedBackgroundActivityIdentifiers];
  uint64_t v24 = v23;
  v74 = v12;
  v75 = v8;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [MEMORY[0x1E4F1CAD0] set];
  }
  char v26 = v25;

  uint64_t v28 = __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke(v27, v26, v81);
  v80 = v26;
  __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke((uint64_t)v28, v81, v26);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_queue_processedOverrides, a4);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v29 = v18;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v108 objects:v117 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v109 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        id v35 = [v34 backgroundActivityIdentifier];
        if ([v81 containsObject:v35])
        {
          SBRemoveBackgroundActivityAttributionByIdentifier(v34, self->_suspendedAttributionsByBackgroundActivityIdentifier);
        }
        else if (SBRemoveBackgroundActivityAttributionByIdentifier(v34, self->_attributionsByBackgroundActivityIdentifier))
        {
          [v83 addObject:v35];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v108 objects:v117 count:16];
    }
    while (v31);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v36 = v17;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v104 objects:v116 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v105 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = *(void **)(*((void *)&v104 + 1) + 8 * j);
        long long v42 = [v41 backgroundActivityIdentifier];
        if ([v80 containsObject:v42])
        {
          SBAddBackgroundActivityAttributionByIdentifier(v41, self->_suspendedAttributionsByBackgroundActivityIdentifier);
        }
        else if (SBAddBackgroundActivityAttributionByIdentifier(v41, self->_attributionsByBackgroundActivityIdentifier))
        {
          [v19 addObject:v42];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v104 objects:v116 count:16];
    }
    while (v38);
  }
  v82 = v19;

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v28;
  uint64_t v43 = [obj countByEnumeratingWithState:&v100 objects:v115 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v101;
    do
    {
      uint64_t v46 = 0;
      long long v47 = v29;
      do
      {
        if (*(void *)v101 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = *(void *)(*((void *)&v100 + 1) + 8 * v46);
        uint64_t v49 = [(NSMapTable *)self->_attributionsByBackgroundActivityIdentifier objectForKey:v48];
        uint64_t v50 = [v49 allObjects];

        [(NSMapTable *)self->_attributionsByBackgroundActivityIdentifier removeObjectForKey:v48];
        id v29 = [v47 arrayByAddingObjectsFromArray:v50];

        if ([v50 count])
        {
          [v82 removeObject:v48];
          [v83 addObject:v48];
        }
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v51 = v50;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v96 objects:v114 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v97;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v97 != v54) {
                objc_enumerationMutation(v51);
              }
              SBAddBackgroundActivityAttributionByIdentifier(*(void **)(*((void *)&v96 + 1) + 8 * k), self->_suspendedAttributionsByBackgroundActivityIdentifier);
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v96 objects:v114 count:16];
          }
          while (v53);
        }

        ++v46;
        long long v47 = v29;
      }
      while (v46 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v100 objects:v115 count:16];
    }
    while (v44);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v93 = 0u;
  long long v92 = 0u;
  id v78 = v77;
  uint64_t v56 = [v78 countByEnumeratingWithState:&v92 objects:v113 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v93;
    do
    {
      uint64_t v59 = 0;
      long long v60 = v36;
      do
      {
        if (*(void *)v93 != v58) {
          objc_enumerationMutation(v78);
        }
        uint64_t v61 = *(void *)(*((void *)&v92 + 1) + 8 * v59);
        long long v62 = [(NSMapTable *)self->_suspendedAttributionsByBackgroundActivityIdentifier objectForKey:v61];
        long long v63 = [v62 allObjects];

        [(NSMapTable *)self->_suspendedAttributionsByBackgroundActivityIdentifier removeObjectForKey:v61];
        id v36 = [v60 arrayByAddingObjectsFromArray:v63];

        if ([v63 count])
        {
          [v83 removeObject:v61];
          [v82 addObject:v61];
        }
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v64 = v63;
        uint64_t v65 = [v64 countByEnumeratingWithState:&v88 objects:v112 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v89;
          do
          {
            for (uint64_t m = 0; m != v66; ++m)
            {
              if (*(void *)v89 != v67) {
                objc_enumerationMutation(v64);
              }
              SBAddBackgroundActivityAttributionByIdentifier(*(void **)(*((void *)&v88 + 1) + 8 * m), self->_attributionsByBackgroundActivityIdentifier);
            }
            uint64_t v66 = [v64 countByEnumeratingWithState:&v88 objects:v112 count:16];
          }
          while (v66);
        }

        ++v59;
        long long v60 = v36;
      }
      while (v59 != v57);
      uint64_t v57 = [v78 countByEnumeratingWithState:&v92 objects:v113 count:16];
    }
    while (v57);
  }

  [(NSMutableSet *)self->_backgroundActivityIdentifiers minusSet:v83];
  [(NSMutableSet *)self->_backgroundActivityIdentifiers unionSet:v82];
  v69 = (NSMutableSet *)[v80 mutableCopy];
  suspendedBackgroundActivityIdentifiers = self->_suspendedBackgroundActivityIdentifiers;
  self->_suspendedBackgroundActivityIdentifiers = v69;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke_2;
  block[3] = &unk_1E6AF4E00;
  id v85 = v29;
  v86 = self;
  id v87 = v36;
  id v71 = v36;
  id v72 = v29;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if ([v82 count] || objc_msgSend(v83, "count")) {
    [(SBBackgroundActivityAttributionManager *)self _updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:v82 removedBackgroundActivityIdentifiers:v83];
  }
}

id __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)[a2 mutableCopy];
  [v5 minusSet:v4];

  return v5;
}

void __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke_2(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v8 = [a1[5] _applicationForBackgroundActivityAttribution:v7];
        [v8 releaseBackgroundActivityAttribution:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = a1[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * j);
        id v15 = objc_msgSend(a1[5], "_applicationForBackgroundActivityAttribution:", v14, (void)v16);
        [v15 takeBackgroundActivityAttribution:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (id)succinctDescription
{
  id v2 = [(SBBackgroundActivityAttributionManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBBackgroundActivityAttributionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBBackgroundActivityAttributionManager *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) dictionaryRepresentation];
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E6B00850;
  id v8 = v2;
  id v5 = v2;
  [v3 appendDictionarySection:v5 withName:@"attributionsByBackgroundActivityIdentifier" multilinePrefix:v4 skipIfEmpty:1 objectTransformer:v7];

  id v6 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 104) withName:@"assertionServiceManager"];
}

id __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 allObjects];
  }
  else
  {
    id v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (void)assertionServiceDidChangeStatusStringsForAForegroundApp
{
}

void __97__SBBackgroundActivityAttributionManager_assertionServiceDidChangeStatusStringsForAForegroundApp__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 updateForegroundApplicationSceneHandles:v2 withOptions:1 completion:0];
}

- (SBWindowSceneStatusBarAssertionManager)appStatusBarAssertionManager
{
  return self->_appStatusBarAssertionManager;
}

- (void)setAppStatusBarAssertionManager:(id)a3
{
}

- (NSMapTable)attributionsByBackgroundActivityIdentifier
{
  return self->_attributionsByBackgroundActivityIdentifier;
}

- (void)setAttributionsByBackgroundActivityIdentifier:(id)a3
{
}

- (NSMapTable)suspendedAttributionsByBackgroundActivityIdentifier
{
  return self->_suspendedAttributionsByBackgroundActivityIdentifier;
}

- (void)setSuspendedAttributionsByBackgroundActivityIdentifier:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (FBWorkspaceEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (NSMutableSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
}

- (NSMutableSet)suspendedBackgroundActivityIdentifiers
{
  return self->_suspendedBackgroundActivityIdentifiers;
}

- (void)setSuspendedBackgroundActivityIdentifiers:(id)a3
{
}

- (SBStatusBarTapManager)statusBarTapManager
{
  return self->_statusBarTapManager;
}

- (SBBackgroundActivityAssertionServiceManager)assertionServiceManager
{
  return self->_assertionServiceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionServiceManager, 0);
  objc_storeStrong((id *)&self->_statusBarTapManager, 0);
  objc_storeStrong((id *)&self->_suspendedBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_suspendedAttributionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_appStatusBarAssertionManager, 0);
  objc_storeStrong((id *)&self->_queue_processedOverrides, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
  objc_storeStrong((id *)&self->_queue_processedData, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesDomain, 0);
}

@end