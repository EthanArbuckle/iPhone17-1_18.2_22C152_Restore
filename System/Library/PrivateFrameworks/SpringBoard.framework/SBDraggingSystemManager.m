@interface SBDraggingSystemManager
+ (SBDraggingSystemManager)sharedInstance;
- (id)touchRoutingPolicyForBeginningDragSessionWithInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)dragSessionDidBegin:(id)a3;
- (void)dragSessionDidEnd:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCommandeered:(BOOL)a3 forDraggingSystemSession:(id)a4 forReason:(id)a5;
- (void)setCommandeered:(BOOL)a3 forDropSession:(id)a4 forReason:(id)a5;
@end

@implementation SBDraggingSystemManager

+ (SBDraggingSystemManager)sharedInstance
{
  v2 = (void *)sharedInstance_sharedInstance_0;
  if (!sharedInstance_sharedInstance_0)
  {
    v3 = objc_alloc_init(SBDraggingSystemManager);
    v4 = (void *)sharedInstance_sharedInstance_0;
    sharedInstance_sharedInstance_0 = (uint64_t)v3;

    v5 = [MEMORY[0x1E4F429C0] sharedInstance];
    [v5 setDelegate:sharedInstance_sharedInstance_0];

    v2 = (void *)sharedInstance_sharedInstance_0;
  }
  return (SBDraggingSystemManager *)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)setCommandeered:(BOOL)a3 forDropSession:(id)a4 forReason:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void *)MEMORY[0x1E4F429C0];
  id v9 = a5;
  id v10 = a4;
  id v12 = [v8 sharedInstance];
  v11 = [v12 sessionForDropSession:v10];

  [(SBDraggingSystemManager *)self setCommandeered:v6 forDraggingSystemSession:v11 forReason:v9];
}

- (void)setCommandeered:(BOOL)a3 forDraggingSystemSession:(id)a4 forReason:(id)a5
{
  BOOL v6 = a3;
  id v15 = a4;
  id v8 = a5;
  commandeerReasons = self->_commandeerReasons;
  if (commandeerReasons) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v6;
  }
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v12 = self->_commandeerReasons;
    self->_commandeerReasons = v11;

    commandeerReasons = self->_commandeerReasons;
  }
  v13 = [(NSMapTable *)commandeerReasons objectForKey:v15];
  id v14 = v13;
  if (v6)
  {
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      [(NSMapTable *)self->_commandeerReasons setObject:v14 forKey:v15];
    }
    [v14 addObject:v8];
    [v15 setCommandeered:1];
  }
  else
  {
    [v13 removeObject:v8];
    if (v14 && ![v14 count])
    {
      [v15 setCommandeered:0];
      [(NSMapTable *)self->_commandeerReasons removeObjectForKey:v15];
    }
  }
}

- (void)dragSessionDidBegin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) dragSessionDidBegin:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)dragSessionDidEnd:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) dragSessionDidEnd:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)touchRoutingPolicyForBeginningDragSessionWithInfo:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 supportsSystemDrag])
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F429C8]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __77__SBDraggingSystemManager_touchRoutingPolicyForBeginningDragSessionWithInfo___block_invoke;
    v63[3] = &unk_1E6AFAC58;
    id v44 = v4;
    id v64 = v44;
    v5 = (void (**)(void, void))MEMORY[0x1D948C7A0](v63);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v6 = [(id)SBApp windowSceneManager];
    uint64_t v7 = [v6 connectedWindowScenes];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v60 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v59 + 1) + 8 * i) switcherController];
          long long v13 = [v12 switcherWindow];

          if (v13) {
            ((void (**)(void, void *))v5)[2](v5, v13);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v9);
    }

    int v14 = [v3 processIdentifier];
    long long v57 = 0u;
    long long v58 = 0u;
    if (v3) {
      [v3 auditToken];
    }
    id v46 = v3;
    v56[0] = v57;
    v56[1] = v58;
    uint64_t v15 = [MEMORY[0x1E4F4F6A8] tokenFromAuditToken:v56];
    v16 = +[SBControlCenterController sharedInstanceIfExists];
    v17 = [v16 _controlCenterWindow];

    v43 = v17;
    int v47 = [v17 isHidden];
    if (v14 == getpid() || [v15 hasEntitlement:@"com.apple.springboard.app-drag"])
    {
      v42 = v15;
      v18 = +[SBUIController sharedInstance];
      v19 = [v18 window];

      if (v19) {
        int v20 = v47;
      }
      else {
        int v20 = 0;
      }
      if (v20 == 1) {
        ((void (**)(void, void *))v5)[2](v5, v19);
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v21 = [(id)SBApp windowSceneManager];
      v22 = [v21 connectedWindowScenes];

      uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v66 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v53;
        do
        {
          uint64_t v26 = 0;
          v27 = v19;
          do
          {
            if (*(void *)v53 != v25) {
              objc_enumerationMutation(v22);
            }
            v28 = *(void **)(*((void *)&v52 + 1) + 8 * v26);
            v29 = [v28 homeScreenController];
            v19 = [v29 window];

            if (v28) {
              int v30 = v47;
            }
            else {
              int v30 = 0;
            }
            if (v30 == 1) {
              ((void (**)(void, void *))v5)[2](v5, v19);
            }
            ++v26;
            v27 = v19;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }
        while (v24);
      }

      uint64_t v15 = v42;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v31 = [(id)SBApp windowSceneManager];
    v32 = [v31 connectedWindowScenes];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v65 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v48 + 1) + 8 * j) floatingDockController];
          v38 = [v37 floatingDockWindow];

          if (v38) {
            ((void (**)(void, void *))v5)[2](v5, v38);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v65 count:16];
      }
      while (v34);
    }

    if (v43) {
      char v39 = v47;
    }
    else {
      char v39 = 1;
    }
    if ((v39 & 1) == 0) {
      ((void (**)(void, void *))v5)[2](v5, v43);
    }
    v40 = v45;
    [v45 setContextIDsToAlwaysSendTouchesByDisplayIdentifier:v44];
    id v3 = v46;
    if (v14 == getpid()) {
      [v45 setHitTestingDisabled:1];
    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

void __77__SBDraggingSystemManager_touchRoutingPolicyForBeginningDragSessionWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 _screen];
  v5 = [v4 displayConfiguration];
  uint64_t v6 = [v5 hardwareIdentifier];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = (void *)*MEMORY[0x1E4F43FA8];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v16 = v8;

  uint64_t v9 = [*(id *)(a1 + 32) objectForKey:v16];

  if (!v9)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v10 setObject:v11 forKey:v16];
  }
  long long v12 = [*(id *)(a1 + 32) objectForKey:v16];
  long long v13 = NSNumber;
  uint64_t v14 = [v3 _contextId];

  uint64_t v15 = [v13 numberWithUnsignedInt:v14];
  [v12 addObject:v15];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandeerReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end