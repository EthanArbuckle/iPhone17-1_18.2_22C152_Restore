@interface PKBackgroundContactlessInterfaceSessionController
- (PKBackgroundContactlessInterfaceSessionController)initWithFieldProperties:(id)a3 forPassUniqueID:(id)a4 relinquishOwnership:(id)a5;
- (PKSecureElementPass)pass;
- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4;
- (void)claimActiveSessionWithCompletion:(id)a3;
- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setSession:(id)a3;
- (void)start;
@end

@implementation PKBackgroundContactlessInterfaceSessionController

- (PKBackgroundContactlessInterfaceSessionController)initWithFieldProperties:(id)a3 forPassUniqueID:(id)a4 relinquishOwnership:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = 0;
  if (a3 && v8)
  {
    if ([a3 terminalType] == 4)
    {
      v11 = [MEMORY[0x1E4F84898] sharedInstance];
      v12 = [v11 passWithUniqueID:v8];
      v13 = [v12 secureElementPass];

      if (v13 && [v13 isIdentityPass])
      {
        v19.receiver = self;
        v19.super_class = (Class)PKBackgroundContactlessInterfaceSessionController;
        v14 = [(PKBackgroundContactlessInterfaceSessionController *)&v19 init];
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_pass, v13);
          v16 = _Block_copy(v9);
          id relinquishOwnershipBlock = v15->_relinquishOwnershipBlock;
          v15->_id relinquishOwnershipBlock = v16;

          v15->_lifecycleState = 0;
          v15->_lock._os_unfair_lock_opaque = 0;
        }
        self = v15;
        v10 = self;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  [(PKBackgroundContactlessInterfaceSessionController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKBackgroundContactlessInterfaceSessionController;
  [(PKBackgroundContactlessInterfaceSessionController *)&v3 dealloc];
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lifecycleState || self->_session)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    sessionHandle = self->_sessionHandle;
    os_unfair_lock_unlock(p_lock);
    if (!sessionHandle)
    {
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E4F84C40];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__PKBackgroundContactlessInterfaceSessionController_start__block_invoke;
      v10[3] = &unk_1E59CB488;
      objc_copyWeak(&v11, &location);
      id v8 = [v7 startSTSContactlessInterfaceSessionWithDelegate:0 completion:v10];
      id v9 = self->_sessionHandle;
      self->_sessionHandle = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      return;
    }
  }
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];

  [v4 raise:v5 format:@"PKBackgroundContactlessInterfaceSessionController: Start called twice"];
}

void __58__PKBackgroundContactlessInterfaceSessionController_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_4:
    InvalidateSession(v7);
    goto LABEL_6;
  }
  if (a3)
  {
    [WeakRetained invalidate];
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  [WeakRetained setSession:v7];
LABEL_6:
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lifecycleState == 2)
  {
    v4 = 0;
    uint64_t v5 = 0;
    v6 = 0;
  }
  else
  {
    uint64_t v5 = self->_sessionHandle;
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;

    v6 = self->_session;
    session = self->_session;
    self->_session = 0;

    group = self->_group;
    self->_group = 0;

    self->_lifecycleState = 2;
    id relinquishOwnershipBlock = self->_relinquishOwnershipBlock;
    if (relinquishOwnershipBlock)
    {
      v4 = (void (**)(void))[relinquishOwnershipBlock copy];
      id v11 = self->_relinquishOwnershipBlock;
      self->_id relinquishOwnershipBlock = 0;
    }
    else
    {
      v4 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  v12 = v5;
  if (v12)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v13 = [MEMORY[0x1E4FB1438] sharedApplication];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __InvalidateSessionHandle_block_invoke;
    v16[3] = &unk_1E59CB4B0;
    v16[4] = &v17;
    uint64_t v14 = [v13 beginBackgroundTaskWithExpirationHandler:v16];

    v18[3] = v14;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __InvalidateSessionHandle_block_invoke_2;
    v15[3] = &unk_1E59CB4B0;
    v15[4] = &v17;
    [(PKPaymentSessionHandle *)v12 invalidateSessionWithCompletion:v15];
    _Block_object_dispose(&v17, 8);
  }

  InvalidateSession(v6);
  if (v4) {
    v4[2](v4);
  }
}

- (void)setSession:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5 && self->_lifecycleState != 2)
  {
    objc_storeStrong((id *)&self->_session, a3);
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;

    self->_lifecycleState = 1;
    id v7 = (OS_dispatch_group *)dispatch_group_create();
    group = self->_group;
    self->_group = v7;

    id v9 = v7;
    dispatch_group_enter(v9);
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      [v5 setDelegate:self];
      v10 = self->_pass;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = [(PKSecureElementPass *)v10 devicePaymentApplications];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
LABEL_7:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
          if ([v16 paymentType] == 1002)
          {
            if ([v16 supportsContactlessPayment])
            {
              id v17 = v16;
              if (v17) {
                break;
              }
            }
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
            if (v13) {
              goto LABEL_7;
            }
            goto LABEL_15;
          }
        }
        v18 = v17;

        v28 = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        int v20 = [v5 activatePaymentApplications:v19 forPaymentPass:v10];

        if (!v20) {
          goto LABEL_18;
        }
        [v5 authorizeAndStartCardEmulationWithCredential:0 deferAuthorization:0 requiresConfirmationForHandoff:1 startHandoffIfPending:0];
      }
      else
      {
LABEL_15:

        v18 = 0;
LABEL_18:
        v21 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController: Failed to activate", v23, 2u);
        }
      }
      dispatch_group_leave(v9);
      os_unfair_lock_lock(&self->_lock);
      v22 = self->_group;
      self->_group = 0;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)claimActiveSessionWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void (**)(void, void))v4;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lifecycleState == 1)
    {
      v6 = self->_group;
      id v7 = self->_session;
      session = self->_session;
      self->_session = 0;

      sessionHandle = self->_sessionHandle;
      self->_sessionHandle = 0;

      os_unfair_lock_unlock(&self->_lock);
      if (v7)
      {
        if (v6)
        {
          uint64_t v10 = MEMORY[0x1E4F143A8];
          uint64_t v11 = 3221225472;
          uint64_t v12 = __86__PKBackgroundContactlessInterfaceSessionController_claimActiveSessionWithCompletion___block_invoke;
          uint64_t v13 = &unk_1E59CAD68;
          uint64_t v15 = v5;
          id v7 = v7;
          uint64_t v14 = v7;
          dispatch_group_notify((dispatch_group_t)v6, MEMORY[0x1E4F14428], &v10);
        }
        else
        {
          ((void (**)(void, PKContactlessInterfaceSession *))v5)[2](v5, v7);
        }
        goto LABEL_8;
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v6 = 0;
    }
    v5[2](v5, 0);
    id v7 = 0;
LABEL_8:
    [(PKBackgroundContactlessInterfaceSessionController *)self invalidate];

    return;
  }
  __break(1u);
}

uint64_t __86__PKBackgroundContactlessInterfaceSessionController_claimActiveSessionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = self;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController (%p): ignoring transaction end....", buf, 0xCu);
  }

  if (v7)
  {
    id v10 = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(PKBackgroundContactlessInterfaceSessionController *)self _processContexts:v9 didFinishTransaction:1];
  }
  else
  {
    [(PKBackgroundContactlessInterfaceSessionController *)self _processContexts:0 didFinishTransaction:1];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
}

- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 firstObject];
  id v8 = [v7 paymentPass];

  if (!v8)
  {
LABEL_16:
    v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "PKBackgroundContactlessInterfaceSessionController (%p): dropping transaction.", buf, 0xCu);
    }

    goto LABEL_19;
  }
  long long v24 = self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  int v10 = [v8 isStoredValuePass];
  long long v25 = v8;
  uint64_t v11 = [v8 uniqueID];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v6;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v30;
  int v27 = v10 | v4;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v18 = [v17 paymentApplication];
      if (v10)
      {
        uint64_t v19 = [v17 transitHistory];
        int v20 = [v17 date];
        v21 = [v17 expressState];
        [v9 processTransitTransactionEventWithHistory:v19 transactionDate:v20 forPaymentApplication:v18 withPassUniqueIdentifier:v11 expressTransactionState:v21];

        char v14 = 1;
      }
      else if (!v27)
      {
        goto LABEL_11;
      }
      v22 = [v18 applicationIdentifier];
      [v9 recordPaymentApplicationUsageForPassUniqueIdentifier:v11 paymentApplicationIdentifier:v22];

LABEL_11:
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v13);
LABEL_15:

  id v8 = v25;
  id v6 = v26;
  self = v24;
  if ((v14 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_19:
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);

  objc_storeStrong(&self->_relinquishOwnershipBlock, 0);
}

@end