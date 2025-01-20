@interface SBSUICameraOverlaySceneClientComponent
- (BSAuditToken)overlayRequestingProcessAuditToken;
- (FBSSceneIdentityToken)overlayRequestingSceneIdentityToken;
- (NSString)overlayRequestingBundleIdentifier;
- (SBSUICameraOverlaySceneClientComponent)init;
- (int)overlayRequestingPID;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation SBSUICameraOverlaySceneClientComponent

- (SBSUICameraOverlaySceneClientComponent)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSUICameraOverlaySceneClientComponent;
  result = [(SBSUICameraOverlaySceneClientComponent *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_observers = self->_lock_observers;
  if (!lock_observers)
  {
    v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  [(NSHashTable *)lock_observers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  if (![(NSHashTable *)self->_lock_observers count])
  {
    lock_observers = self->_lock_observers;
    self->_lock_observers = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BSAuditToken)overlayRequestingProcessAuditToken
{
  v2 = [(FBSSceneComponent *)self scene];
  objc_super v3 = [v2 settings];
  v4 = [v3 overlayRequestingProcessAuditToken];

  return (BSAuditToken *)v4;
}

- (FBSSceneIdentityToken)overlayRequestingSceneIdentityToken
{
  v2 = [(FBSSceneComponent *)self scene];
  objc_super v3 = [v2 settings];
  v4 = [v3 overlayRequestingSceneIdentityToken];

  return (FBSSceneIdentityToken *)v4;
}

- (NSString)overlayRequestingBundleIdentifier
{
  v2 = [(FBSSceneComponent *)self scene];
  objc_super v3 = [v2 settings];
  v4 = [v3 overlayRequestingBundleIdentifier];

  return (NSString *)v4;
}

- (int)overlayRequestingPID
{
  v2 = [(FBSSceneComponent *)self scene];
  objc_super v3 = [v2 settings];
  int v4 = [v3 overlayRequestingPID];

  return v4;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke;
  v4[3] = &unk_1E5CCE340;
  v4[4] = self;
  [a4 inspect:v4];
}

void __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (([v5 containsProperty:sel_overlayRequestingBundleIdentifier] & 1) != 0
    || ([v5 containsProperty:sel_overlayRequestingSceneIdentityToken] & 1) != 0
    || ([v5 containsProperty:sel_overlayRequestingPID] & 1) != 0
    || [v5 containsProperty:sel_overlayRequestingProcessAuditToken])
  {
    v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectEnumerator];
    id v7 = [v6 allObjects];

    id v8 = v7;
    BSDispatchMain();
  }
}

void __66__SBSUICameraOverlaySceneClientComponent_scene_didUpdateSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "clientMonitor:requestingSceneUpdatedWithInfo:", *(void *)(a1 + 40), *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end