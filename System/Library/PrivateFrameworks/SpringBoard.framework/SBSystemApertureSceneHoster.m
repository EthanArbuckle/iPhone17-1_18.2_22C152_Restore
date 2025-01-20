@interface SBSystemApertureSceneHoster
- (SBSSystemApertureScenePresentationSessionServer)server;
- (SBSystemApertureController)systemApertureController;
- (id)sceneCreationRequestServer:(id)a3 didReceiveRequestForSystemApertureSceneWithClientIdentity:(id)a4;
- (void)_addPendingElement:(id)a3;
- (void)_enumerateElementsUsingBlock:(id)a3;
- (void)_invalidateElement:(id)a3;
- (void)_registerElement:(id)a3;
- (void)_removeElement:(id)a3;
- (void)_removePendingElement:(id)a3;
- (void)activateWithSystemApertureController:(id)a3;
- (void)invalidate;
- (void)sceneCreationRequestServer:(id)a3 invalidateSceneElement:(id)a4;
- (void)setServer:(id)a3;
- (void)setSystemApertureController:(id)a3;
@end

@implementation SBSystemApertureSceneHoster

- (void)activateWithSystemApertureController:(id)a3
{
  objc_storeWeak((id *)&self->_systemApertureController, a3);
  v4 = [(SBSystemApertureSceneHoster *)self server];

  if (!v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6C48]) initWithDelegate:self];
    [(SBSystemApertureSceneHoster *)self setServer:v5];

    id v6 = [(SBSystemApertureSceneHoster *)self server];
    [v6 startServer];
  }
}

- (id)sceneCreationRequestServer:(id)a3 didReceiveRequestForSystemApertureSceneWithClientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  v8 = [SBSystemApertureSceneElement alloc];
  v9 = [MEMORY[0x1E4FA7DA0] specification];
  v10 = [(SBSystemApertureSceneHoster *)self systemApertureController];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __116__SBSystemApertureSceneHoster_sceneCreationRequestServer_didReceiveRequestForSystemApertureSceneWithClientIdentity___block_invoke;
  v18 = &unk_1E6B0E040;
  objc_copyWeak(&v19, &location);
  v11 = [(SBSystemApertureSceneElement *)v8 initWithSceneSpecification:v9 sceneClientIdentity:v7 statusBarBackgroundActivitiesSuppresser:v10 readyForPresentationHandler:&v15];

  -[SBSystemApertureSceneHoster _addPendingElement:](self, "_addPendingElement:", v11, v15, v16, v17, v18);
  [(SBSystemApertureSceneElement *)v11 activate];
  v12 = [(SBSystemApertureSceneElement *)v11 scene];
  v13 = [v12 identityToken];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __116__SBSystemApertureSceneHoster_sceneCreationRequestServer_didReceiveRequestForSystemApertureSceneWithClientIdentity___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    id v8 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained _registerElement:v8];
    }
    else if ([v8 isActivated])
    {
      [v8 deactivateWhenRemovedWithHandler:0];
    }

    id v5 = v8;
  }
}

- (void)sceneCreationRequestServer:(id)a3 invalidateSceneElement:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (void *)[(NSMapTable *)self->_activeElements copy];
  id v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 scene];
        v14 = [v13 identityToken];

        if ([v14 isEqual:v5])
        {
          [(SBSystemApertureSceneHoster *)self _invalidateElement:v12];

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_addPendingElement:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  pendingElements = self->_pendingElements;
  if (!pendingElements)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    id v6 = self->_pendingElements;
    self->_pendingElements = v5;

    pendingElements = self->_pendingElements;
  }
  [(NSMutableSet *)pendingElements addObject:v7];
}

- (void)_removePendingElement:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSMutableSet *)self->_pendingElements removeObject:v4];

  if (![(NSMutableSet *)self->_pendingElements count])
  {
    pendingElements = self->_pendingElements;
    self->_pendingElements = 0;
  }
}

- (void)_registerElement:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_activeElements)
  {
    id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    activeElements = self->_activeElements;
    self->_activeElements = v5;
  }
  id v7 = [(SBSystemApertureSceneHoster *)self systemApertureController];
  uint64_t v8 = [v7 registerElement:v4];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  uint64_t v9 = [v4 scene];
  uint64_t v10 = [v9 clientHandle];
  v11 = [v10 processHandle];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__SBSystemApertureSceneHoster__registerElement___block_invoke;
  v19[3] = &unk_1E6B0E068;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  [v11 monitorForDeath:v19];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __48__SBSystemApertureSceneHoster__registerElement___block_invoke_3;
  long long v16 = &unk_1E6B0E090;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  v12 = (void *)MEMORY[0x1D948C7A0](&v13);
  objc_msgSend(v4, "setClientInvalidationRequestHandler:", v12, v13, v14, v15, v16);
  [v4 setSceneInvalidationHandler:v12];
  if (v8) {
    [(NSMapTable *)self->_activeElements setObject:v8 forKey:v4];
  }
  else {
    [(SBSystemApertureSceneHoster *)self _invalidateElement:v4];
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_copyWeak(&v8, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained _invalidateElement:v2];
  }
}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_copyWeak(&v5, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateElement:v2];
}

- (void)_invalidateElement:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSystemApertureSceneHoster.m", 125, @"Invalid parameter not satisfying: %@", @"element != nil" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  id v6 = [(NSMapTable *)self->_activeElements objectForKey:v5];
  if ([v5 isActivated] && (objc_msgSend(v5, "isDeactivating") & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__SBSystemApertureSceneHoster__invalidateElement___block_invoke;
    v8[3] = &unk_1E6AFB518;
    v8[4] = self;
    [v5 deactivateWhenRemovedWithHandler:v8];
  }
  else if (([v5 isDeactivating] & 1) == 0)
  {
    [(SBSystemApertureSceneHoster *)self _removeElement:v5];
  }
  if ([v6 isValid]) {
    [v6 invalidateWithReason:@"SBSystemApertureSceneHoster invalidated element"];
  }
}

uint64_t __50__SBSystemApertureSceneHoster__invalidateElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeElement:a2];
}

- (void)_removeElement:(id)a3
{
  activeElements = self->_activeElements;
  id v5 = a3;
  [(NSMapTable *)activeElements removeObjectForKey:v5];
  [(NSMutableSet *)self->_pendingElements removeObject:v5];

  if (![(NSMapTable *)self->_activeElements count])
  {
    id v6 = self->_activeElements;
    self->_activeElements = 0;
  }
}

- (void)invalidate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SBSystemApertureSceneHoster_invalidate__block_invoke;
  v4[3] = &unk_1E6AFB518;
  v4[4] = self;
  [(SBSystemApertureSceneHoster *)self _enumerateElementsUsingBlock:v4];
  id v3 = [(SBSystemApertureSceneHoster *)self server];
  [v3 invalidate];

  [(SBSystemApertureSceneHoster *)self setServer:0];
}

uint64_t __41__SBSystemApertureSceneHoster_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateElement:a2];
}

- (void)_enumerateElementsUsingBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(NSMutableSet *)self->_pendingElements allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v20 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = (void *)[(NSMapTable *)self->_activeElements copy];
  v11 = [v10 keyEnumerator];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        v4[2](v4, *(void *)(*((void *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (SBSystemApertureController)systemApertureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureController);
  return (SBSystemApertureController *)WeakRetained;
}

- (void)setSystemApertureController:(id)a3
{
}

- (SBSSystemApertureScenePresentationSessionServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
  objc_storeStrong((id *)&self->_pendingElements, 0);
  objc_storeStrong((id *)&self->_activeElements, 0);
}

@end