@interface SBApplicationLaunchAlertService
- (NSString)description;
- (SBApplicationLaunchAlertService)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initObservingSceneManagers:(id)a3 launchAlertEvaluators:(id)a4 applicationController:(id)a5 alertItemsController:(id)a6;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_invalidateAndDismissLaunchAlertsForLaunchAlertInfo:(id)a3;
- (void)_reallyShowLaunchAlertOfType:(unint64_t)a3 withLaunchAlertInfo:(id)a4 application:(id)a5;
- (void)_sceneDidBecomeForeground:(id)a3;
- (void)_sceneDidResignForeground:(id)a3;
- (void)_sceneWillBecomeForeground:(id)a3;
- (void)_tryShowLaunchAlertsForLaunchAlertInfo:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
- (void)showLaunchAlertOfType:(unint64_t)a3 forApplication:(id)a4;
@end

@implementation SBApplicationLaunchAlertService

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  objc_msgSend(a4, "scene", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBApplicationLaunchAlertService *)self _sceneWillBecomeForeground:v5];
}

- (void)_sceneWillBecomeForeground:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 206, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    if ([v6 contentState] == 2)
    {
      [(SBApplicationLaunchAlertService *)self _sceneDidBecomeForeground:v6];
    }
    else
    {
      [v6 addObserver:self];
      [(NSMutableSet *)self->_foregroundingScenes addObject:v6];
    }
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_foregroundingScenes, "containsObject:")
    && [v4 contentState] == 2)
  {
    [(SBApplicationLaunchAlertService *)self _sceneDidBecomeForeground:v4];
  }
}

- (void)_sceneDidBecomeForeground:(id)a3
{
  id v11 = a3;
  [v11 removeObserver:self];
  [(NSMutableSet *)self->_foregroundingScenes removeObject:v11];
  id v4 = [v11 definition];
  id v5 = [v4 clientIdentity];
  id v6 = [v5 bundleIdentifier];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_mapBundleIDToLaunchAlertInfo objectForKey:v6];
    if (v7
      || (v7 = -[_SBApplicationLaunchAlertInfo initWithBundleID:]([_SBApplicationLaunchAlertInfo alloc], v6), [(NSMutableDictionary *)self->_mapBundleIDToLaunchAlertInfo setObject:v7 forKey:v6], v7))
    {
      v8 = (void *)v7[2];
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = [v9 count];
    [v9 addObject:v11];
    if (!v10) {
      [(SBApplicationLaunchAlertService *)self _tryShowLaunchAlertsForLaunchAlertInfo:v7];
    }
  }
}

- (void)_tryShowLaunchAlertsForLaunchAlertInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    uint64_t v5 = v4[1];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:v5];
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = self->_launchAlertEvaluators;
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 |= objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "shouldShowLaunchAlertForApplication:", v6, (void)v13);
        }
        uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);

      if (v10) {
        [(SBApplicationLaunchAlertService *)self _reallyShowLaunchAlertOfType:v10 withLaunchAlertInfo:v4 application:v6];
      }
    }
    else
    {
    }
  }
}

- (SBApplicationLaunchAlertService)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationLaunchAlertService.m" lineNumber:77 description:@"Init is unavailable."];

  return 0;
}

- (id)initObservingSceneManagers:(id)a3 launchAlertEvaluators:(id)a4 applicationController:(id)a5 alertItemsController:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id obja = [MEMORY[0x1E4F28B00] currentHandler];
    [obja handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 85, @"Invalid parameter not satisfying: %@", @"sceneManagers" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_24:
      id objc = [MEMORY[0x1E4F28B00] currentHandler];
      [objc handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 87, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  id objb = [MEMORY[0x1E4F28B00] currentHandler];
  [objb handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 86, @"Invalid parameter not satisfying: %@", @"launchAlertEvaluators" object file lineNumber description];

  if (!v14) {
    goto LABEL_24;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_25:
  id objd = [MEMORY[0x1E4F28B00] currentHandler];
  [objd handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 88, @"Invalid parameter not satisfying: %@", @"alertItemsController" object file lineNumber description];

LABEL_5:
  v51.receiver = self;
  v51.super_class = (Class)SBApplicationLaunchAlertService;
  long long v16 = [(SBApplicationLaunchAlertService *)&v51 init];
  v17 = v16;
  if (v16)
  {
    id v34 = v15;
    id v35 = v14;
    id v36 = v13;
    objc_storeStrong((id *)&v16->_applicationController, a5);
    objc_storeStrong((id *)&v17->_alertItemsController, a6);
    objc_storeStrong((id *)&v17->_launchAlertEvaluators, a4);
    uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundingScenes = v17->_foregroundingScenes;
    v17->_foregroundingScenes = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapBundleIDToLaunchAlertInfo = v17->_mapBundleIDToLaunchAlertInfo;
    v17->_mapBundleIDToLaunchAlertInfo = v20;

    objc_storeStrong((id *)&v17->_sceneManagers, a3);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v37 = v12;
    id obj = v12;
    uint64_t v22 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v47 + 1) + 8 * v25);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v27 = [v26 externalForegroundApplicationSceneHandles];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v44;
            do
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v44 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = [*(id *)(*((void *)&v43 + 1) + 8 * v31) scene];
                [(SBApplicationLaunchAlertService *)v17 _sceneWillBecomeForeground:v32];

                ++v31;
              }
              while (v29 != v31);
              uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v29);
          }

          [v26 addObserver:v17];
          ++v25;
        }
        while (v25 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v23);
    }

    id v13 = v36;
    id v12 = v37;
    id v15 = v34;
    id v14 = v35;
  }

  return v17;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationLaunchAlertService.m" lineNumber:109 description:@"Must be invalidated before deallocating."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationLaunchAlertService;
  [(SBApplicationLaunchAlertService *)&v5 dealloc];
}

- (void)showLaunchAlertOfType:(unint64_t)a3 forApplication:(id)a4
{
  id v12 = a4;
  BSDispatchQueueAssertMain();
  v7 = v12;
  if (!v12)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 117, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];

    v7 = 0;
  }
  mapBundleIDToLaunchAlertInfo = self->_mapBundleIDToLaunchAlertInfo;
  uint64_t v9 = [v7 bundleIdentifier];
  uint64_t v10 = [(NSMutableDictionary *)mapBundleIDToLaunchAlertInfo objectForKey:v9];

  if (a3 && !self->_invalidated && v10) {
    [(SBApplicationLaunchAlertService *)self _reallyShowLaunchAlertOfType:a3 withLaunchAlertInfo:v10 application:v12];
  }
}

- (NSString)description
{
  return (NSString *)[(SBApplicationLaunchAlertService *)self descriptionWithMultilinePrefix:0];
}

- (void)invalidate
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = (void *)[(NSMutableDictionary *)self->_mapBundleIDToLaunchAlertInfo copy];
  id v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBApplicationLaunchAlertService *)self _invalidateAndDismissLaunchAlertsForLaunchAlertInfo:*(void *)(*((void *)&v29 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_foregroundingScenes;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v13++) removeObserver:self];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = self->_sceneManagers;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "removeObserver:", self, (void)v21);
      }
      while (v16 != v18);
      uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v16);
  }

  foregroundingScenes = self->_foregroundingScenes;
  self->_foregroundingScenes = 0;

  mapBundleIDToLaunchAlertInfo = self->_mapBundleIDToLaunchAlertInfo;
  self->_mapBundleIDToLaunchAlertInfo = 0;

  self->_invalidated = 1;
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  objc_msgSend(a4, "scene", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBApplicationLaunchAlertService *)self _sceneDidResignForeground:v5];
}

- (id)succinctDescription
{
  v2 = [(SBApplicationLaunchAlertService *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBApplicationLaunchAlertService *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBApplicationLaunchAlertService *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_mapBundleIDToLaunchAlertInfo withName:@"bundleIDsToLaunchAlertInfo" skipIfNil:1];
  id v6 = (id)[v4 appendObject:self->_foregroundingScenes withName:@"foregroundingScenes" skipIfNil:1];
  return v4;
}

- (void)_sceneDidResignForeground:(id)a3
{
  id v13 = a3;
  if (!v13)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 243, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    [v13 removeObserver:self];
    [(NSMutableSet *)self->_foregroundingScenes removeObject:v13];
    id v5 = [v13 definition];
    id v6 = [v5 clientIdentity];
    uint64_t v7 = [v6 bundleIdentifier];

    if (v7)
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_mapBundleIDToLaunchAlertInfo objectForKey:v7];
      uint64_t v9 = (void *)v8;
      if (v8)
      {
        id v10 = *(id *)(v8 + 16);
        [v10 removeObject:v13];
        uint64_t v11 = [v10 count];

        if (!v11) {
          [(SBApplicationLaunchAlertService *)self _invalidateAndDismissLaunchAlertsForLaunchAlertInfo:v9];
        }
      }
    }
  }
}

- (void)_reallyShowLaunchAlertOfType:(unint64_t)a3 withLaunchAlertInfo:(id)a4 application:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  long long v43 = __Block_byref_object_copy__34;
  long long v44 = __Block_byref_object_dispose__34;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__34;
  v38 = __Block_byref_object_dispose__34;
  id v39 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  long long v28 = (void (*)(void *))__96__SBApplicationLaunchAlertService__reallyShowLaunchAlertOfType_withLaunchAlertInfo_application___block_invoke;
  long long v29 = &unk_1E6AFED98;
  long long v30 = self;
  long long v31 = &v34;
  long long v32 = &v40;
  SEL v33 = a2;
  uint64_t v11 = v27;
  if (a3)
  {
    char v46 = 0;
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v12.i16[0] = vaddlv_u8(v12);
    int v13 = v12.i32[0];
    if (v12.i32[0])
    {
      unint64_t v14 = 0;
      do
      {
        if (((1 << v14) & a3) != 0)
        {
          v28(v11);
          if (v46) {
            break;
          }
          --v13;
        }
        if (v14 > 0x3E) {
          break;
        }
        ++v14;
      }
      while (v13 > 0);
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = (id)v41[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v15);
        }
        if (v9) {
          v19 = (void *)v9[3];
        }
        else {
          v19 = 0;
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        id v21 = v19;
        objc_msgSend(v21, "addObject:", v20, (void)v23);

        [(SBAlertItemsController *)self->_alertItemsController activateAlertItem:v35[5]];
        [v10 setHasDisplayedLaunchAlert:1 forType:a3];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v22 = [v15 countByEnumeratingWithState:&v23 objects:v47 count:16];
      uint64_t v16 = v22;
    }
    while (v22);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

void __96__SBApplicationLaunchAlertService__reallyShowLaunchAlertOfType_withLaunchAlertInfo_application___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  switch(a2)
  {
    case -1:
    case 0:
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a1[7] object:a1[4] file:@"SBApplicationLaunchAlertService.m" lineNumber:291 description:@"Cannot show an application launch alert for All or None."];
      goto LABEL_7;
    case 1:
      uint64_t v7 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_6;
    case 2:
      uint64_t v7 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
      goto LABEL_6;
    case 4:
      uint64_t v7 = SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem;
LABEL_6:
      id v8 = objc_alloc_init(v7);
      uint64_t v9 = *(void *)(a1[5] + 8);
      id v6 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
LABEL_7:

      break;
    default:
      break;
  }
  uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (v10)
  {
    uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v13 = *(void *)(a1[6] + 8);
      unint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
    }
    [v11 addObject:v10];
  }
}

- (void)_invalidateAndDismissLaunchAlertsForLaunchAlertInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = (void *)v5[3];
  }
  else
  {
    unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBApplicationLaunchAlertService.m", 322, @"Invalid parameter not satisfying: %@", @"launchAlertInfo" object file lineNumber description];

    uint64_t v7 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  id v8 = (void *)[v7 copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBAlertItemsController *)self->_alertItemsController deactivateAlertItem:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (v6) {
    uint64_t v13 = v6[1];
  }
  else {
    uint64_t v13 = 0;
  }
  [(NSMutableDictionary *)self->_mapBundleIDToLaunchAlertInfo removeObjectForKey:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapBundleIDToLaunchAlertInfo, 0);
  objc_storeStrong((id *)&self->_foregroundingScenes, 0);
  objc_storeStrong((id *)&self->_sceneManagers, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_launchAlertEvaluators, 0);
}

@end