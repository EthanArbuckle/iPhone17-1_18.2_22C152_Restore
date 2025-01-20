@interface SBUniversalControlServer
- (NSString)description;
- (SBUniversalControlServer)initWithKeyboardFocusController:(id)a3 keyboardSuppressionManager:(id)a4;
- (unint64_t)externalProcessActiveOnScreenEdges;
- (void)_lock_reevaluateKeyboardFocusDisablement;
- (void)_lock_reevaluateScreenEdgeOwnership;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setExternalProcessActiveOnScreenEdges:(unint64_t)a3;
- (void)setKeyboardFocusDisabled:(id)a3 reason:(id)a4;
- (void)setScreenEdgesOwned:(id)a3 reason:(id)a4;
@end

@implementation SBUniversalControlServer

- (SBUniversalControlServer)initWithKeyboardFocusController:(id)a3 keyboardSuppressionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBUniversalControlServer;
  v9 = [(SBUniversalControlServer *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyboardFocusController, a3);
    objc_storeStrong((id *)&v10->_keyboardSuppressionManager, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.universal-control"];
    clientAuthenticator = v10->_clientAuthenticator;
    v10->_clientAuthenticator = (FBServiceClientAuthenticator *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v10->_connections;
    v10->_connections = v13;

    uint64_t v15 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = (void *)MEMORY[0x1E4F628A0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__SBUniversalControlServer_initWithKeyboardFocusController_keyboardSuppressionManager___block_invoke;
    v22[3] = &unk_1E6AF58F0;
    v18 = v10;
    v23 = v18;
    uint64_t v19 = [v17 listenerWithConfigurator:v22];
    id v20 = v18[1];
    v18[1] = (id)v19;

    [v18[1] activate];
  }

  return v10;
}

void __87__SBUniversalControlServer_initWithKeyboardFocusController_keyboardSuppressionManager___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6C80] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __39__SBUniversalControlServer_description__block_invoke;
  v10 = &unk_1E6AF5290;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __39__SBUniversalControlServer_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)[(NSMutableDictionary *)self->_lock_keyboardDisabledReasonsByPID copy];
  os_unfair_lock_unlock(p_lock);
  id v6 = (id)[v7 appendObject:v5 withName:@"keyboardDisabledReasonsByPID"];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Received SBUniversalControlServer connection: %{public}@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_1E6AF7470;
  v15[4] = self;
  [v6 configureConnection:v15];
  clientAuthenticator = self->_clientAuthenticator;
  v9 = [v6 remoteProcess];
  v10 = [v9 auditToken];
  LODWORD(clientAuthenticator) = [(FBServiceClientAuthenticator *)clientAuthenticator authenticateAuditToken:v10];

  if (clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_13;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    id v12 = v6;
    id v14 = v12;
    dispatch_async(queue, block);
    [v12 activate];
  }
  else
  {
    [v6 invalidate];
  }
}

void __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FA6C80];
  id v4 = a2;
  v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  id v6 = [MEMORY[0x1E4FA6C80] interface];
  [v4 setInterface:v6];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E6B001E8;
  v7[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v7];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
}

void __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Received SBUniversalControlServer connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)setKeyboardFocusDisabled:(id)a3 reason:(id)a4
{
  id v16 = a4;
  id v6 = (void *)MEMORY[0x1E4F62880];
  id v7 = a3;
  uint64_t v8 = [v6 currentContext];
  v9 = [v8 remoteTarget];

  uint64_t v10 = [v9 pid];
  os_unfair_lock_lock(&self->_lock);
  int v11 = [v7 BOOLValue];

  lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
  if (v11)
  {
    if (!lock_keyboardDisabledReasonsByPID)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v14 = self->_lock_keyboardDisabledReasonsByPID;
      self->_lock_keyboardDisabledReasonsByPID = v13;

      lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
    }
    uint64_t v15 = [NSNumber numberWithInt:v10];
    [(NSMutableDictionary *)lock_keyboardDisabledReasonsByPID setObject:v16 forKey:v15];
  }
  else
  {
    uint64_t v15 = [NSNumber numberWithInt:v10];
    [(NSMutableDictionary *)lock_keyboardDisabledReasonsByPID removeObjectForKey:v15];
  }

  [(SBUniversalControlServer *)self _lock_reevaluateKeyboardFocusDisablement];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setScreenEdgesOwned:(id)a3 reason:(id)a4
{
  id v13 = a3;
  int v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteTarget];

  uint64_t v7 = [v6 pid];
  os_unfair_lock_lock(&self->_lock);
  int v8 = [v13 unsignedIntValue];
  lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
  if (v8)
  {
    if (!lock_screenEdgesOwnedByPID)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v11 = self->_lock_screenEdgesOwnedByPID;
      self->_lock_screenEdgesOwnedByPID = v10;

      lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
    }
    id v12 = [NSNumber numberWithInt:v7];
    [(NSMutableDictionary *)lock_screenEdgesOwnedByPID setObject:v13 forKey:v12];
  }
  else
  {
    id v12 = [NSNumber numberWithInt:v7];
    [(NSMutableDictionary *)lock_screenEdgesOwnedByPID removeObjectForKey:v12];
  }

  [(SBUniversalControlServer *)self _lock_reevaluateScreenEdgeOwnership];
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)externalProcessActiveOnScreenEdges
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_externallyControlledScreenEdgeMask = self->_lock_externallyControlledScreenEdgeMask;
  os_unfair_lock_unlock(p_lock);
  return lock_externallyControlledScreenEdgeMask;
}

- (void)_lock_reevaluateScreenEdgeOwnership
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  self->_unint64_t lock_externallyControlledScreenEdgeMask = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSMutableDictionary *)self->_lock_screenEdgesOwnedByPID allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        self->_lock_externallyControlledScreenEdgeMask |= [*(id *)(*((void *)&v10 + 1) + 8 * v7++) unsignedIntValue];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }

  int v8 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t lock_externallyControlledScreenEdgeMask = self->_lock_externallyControlledScreenEdgeMask;
    *(_DWORD *)buf = 67109120;
    int v15 = lock_externallyControlledScreenEdgeMask;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "externally controlled screen edges now: %X", buf, 8u);
  }
}

- (void)_lock_reevaluateKeyboardFocusDisablement
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = [(NSMutableDictionary *)self->_lock_keyboardDisabledReasonsByPID count];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBUniversalControlServer__lock_reevaluateKeyboardFocusDisablement__block_invoke;
  v4[3] = &unk_1E6AF5D38;
  v4[4] = self;
  BOOL v5 = v3 != 0;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __68__SBUniversalControlServer__lock_reevaluateKeyboardFocusDisablement__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [(id)SBApp windowSceneManager];
    uint64_t v3 = [v2 activeDisplayWindowScene];

    uint64_t v4 = *(void **)(a1 + 32);
    if (!v4[8])
    {
      BOOL v5 = (void *)v4[12];
      uint64_t v6 = [(id)SBApp windowSceneManager];
      uint64_t v7 = [v6 activeDisplayWindowScene];
      int v8 = +[SBKeyboardFocusLockReason universalControl];
      uint64_t v9 = [v5 focusLockSpringBoardWindowScene:v7 forReason:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      long long v11 = *(void **)(v10 + 64);
      *(void *)(v10 + 64) = v9;

      uint64_t v4 = *(void **)(a1 + 32);
    }
    long long v12 = (void *)v4[13];
    long long v13 = [v3 _fbsDisplayIdentity];
    uint64_t v14 = [v12 acquireKeyboardSuppressionAssertionWithReason:@"SBUniversalControlServer" predicate:0 displayIdentity:v13];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 72);
    *(void *)(v15 + 72) = v14;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 64);
    *(void *)(v17 + 64) = 0;

    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v19 + 72);
    *(void *)(v19 + 72) = 0;
  }

  id v20 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock(v20);
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Adding SBUniversalControlServer connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableSet *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Removing SBUniversalControlServer connection: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v6 = [MEMORY[0x1E4F62880] currentContext];
  id v7 = [v6 remoteTarget];

  [(NSMutableSet *)self->_connections removeObject:v4];
  os_unfair_lock_lock(&self->_lock);
  lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "pid"));
  [(NSMutableDictionary *)lock_keyboardDisabledReasonsByPID removeObjectForKey:v9];

  [(SBUniversalControlServer *)self _lock_reevaluateKeyboardFocusDisablement];
  lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
  long long v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "pid"));
  [(NSMutableDictionary *)lock_screenEdgesOwnedByPID removeObjectForKey:v11];

  [(SBUniversalControlServer *)self _lock_reevaluateScreenEdgeOwnership];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setExternalProcessActiveOnScreenEdges:(unint64_t)a3
{
  self->_externalProcessActiveOnScreenEdges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_lock_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lock_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_lock_screenEdgesOwnedByPID, 0);
  objc_storeStrong((id *)&self->_lock_keyboardDisabledReasonsByPID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end