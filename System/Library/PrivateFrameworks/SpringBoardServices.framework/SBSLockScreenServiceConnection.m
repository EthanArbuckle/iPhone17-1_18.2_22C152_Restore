@interface SBSLockScreenServiceConnection
- (SBSLockScreenServiceConnection)init;
- (id)preventPasscodeLockWithReason:(id)a3;
- (id)preventSpuriousScreenUndimWithReason:(id)a3;
- (void)dealloc;
- (void)launchEmergencyDialerWithCompletion:(id)a3;
- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)migrateIncomingNotificationsToHistory;
- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4;
- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4;
@end

@implementation SBSLockScreenServiceConnection

- (SBSLockScreenServiceConnection)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBSLockScreenServiceConnection;
  v2 = [(SBSLockScreenServiceConnection *)&v13 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F50BB8];
    v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v5 = +[SBSLockScreenServiceSpecification identifier];
    v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
      connection = v2->_connection;
      v2->_connection = (BSServiceConnection *)v7;

      v9 = v2->_connection;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __38__SBSLockScreenServiceConnection_init__block_invoke;
      v11[3] = &unk_1E566B118;
      v12 = v2;
      [(BSServiceConnection *)v9 configureConnection:v11];
      [(BSServiceConnection *)v2->_connection activate];
    }
  }
  return v2;
}

void __38__SBSLockScreenServiceConnection_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSLockScreenServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v5];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __38__SBSLockScreenServiceConnection_init__block_invoke_2;
  v9 = &unk_1E566B0F0;
  objc_copyWeak(&v10, &location);
  [v3 setInterruptionHandler:&v6];
  [v3 setInvalidationHandler:^(void) {
    __block_literal_global_4(v6, v7, v8, v9);
}];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__SBSLockScreenServiceConnection_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_INFO, "SBSLockScreenService: interrupted - resyncing state", v11, 2u);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    [v3 activate];
    uint64_t v7 = [v3 remoteTarget];
    v8 = [MEMORY[0x1E4F28ED0] numberWithInt:[*(id *)&v6[6]._os_unfair_lock_opaque count] != 0];
    [v7 setPreventPasscodeLock:v8];

    v9 = [v3 remoteTarget];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:objc_msgSend(*(id *)&v6[8]._os_unfair_lock_opaque, "count") != 0];
    [v9 setPreventSpuriousScreenUndim:v10];

    os_unfair_lock_unlock(v6 + 4);
  }
}

void __38__SBSLockScreenServiceConnection_init__block_invoke_5()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FBC5000, v0, OS_LOG_TYPE_INFO, "SBSLockScreenService: invalidated remotely", v1, 2u);
  }
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSLockScreenServiceConnection;
  [(SBSLockScreenServiceConnection *)&v3 dealloc];
}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke;
    v8[3] = &unk_1E566B488;
    v9 = v4;
    [v5 launchEmergencyDialerWithCompletion:v8];
    uint64_t v6 = v9;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBSLockScreenServiceConnection launchEmergencyDialerWithCompletion:]();
  }

  if (v4)
  {
    uint64_t v6 = dispatch_get_global_queue(25, 0);
    dispatch_async(v6, v4);
    goto LABEL_7;
  }
LABEL_8:
}

void __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke_cold_1();
    }
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(25, 0);
    dispatch_async(v6, v5);
  }
}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke;
    v14[3] = &unk_1E566B488;
    v9 = &v15;
    id v15 = v7;
    [v8 requestPasscodeUnlockUIWithOptions:v6 withCompletion:v14];
LABEL_7:

    goto LABEL_8;
  }
  id v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBSLockScreenServiceConnection requestPasscodeUnlockUIWithOptions:withCompletion:]();
  }

  if (v7)
  {
    v11 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_12;
    v12[3] = &unk_1E566B4D8;
    v9 = &v13;
    id v13 = v7;
    dispatch_async(v11, v12);

    goto LABEL_7;
  }
LABEL_8:
}

void __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_cold_1();
    }
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(25, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_10;
    v7[3] = &unk_1E566B4B0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke;
    v14[3] = &unk_1E566B488;
    id v9 = &v15;
    id v15 = v7;
    [v8 requestPasscodeCheckUIWithOptions:v6 withCompletion:v14];
LABEL_7:

    goto LABEL_8;
  }
  id v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBSLockScreenServiceConnection requestPasscodeCheckUIWithOptions:withCompletion:]();
  }

  if (v7)
  {
    v11 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_14;
    v12[3] = &unk_1E566B4D8;
    id v9 = &v13;
    id v13 = v7;
    dispatch_async(v11, v12);

    goto LABEL_7;
  }
LABEL_8:
}

void __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_cold_1();
    }
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(25, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_13;
    v7[3] = &unk_1E566B4B0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)preventPasscodeLockWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSLockScreenService.m", 128, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__SBSLockScreenServiceConnection_preventPasscodeLockWithReason___block_invoke;
  v19[3] = &unk_1E566B500;
  v19[4] = self;
  v19[5] = a2;
  id v7 = (void *)[v6 initWithIdentifier:@"com.apple.springboard.lockscreen.preventPasscodeLock" forReason:v5 invalidationBlock:v19];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(BSServiceConnection *)self->_connection remoteTarget];
  lock_preventPasscodeLockReasons = self->_lock_preventPasscodeLockReasons;
  if (lock_preventPasscodeLockReasons)
  {
    v11 = [v7 reason];
    [(NSCountedSet *)lock_preventPasscodeLockReasons addObject:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28BD0];
    v11 = [v7 reason];
    id v13 = [v12 setWithObject:v11];
    v14 = self->_lock_preventPasscodeLockReasons;
    self->_lock_preventPasscodeLockReasons = v13;
  }
  id v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v7 reason];
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_18FBC5000, v15, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: creating new preventPasscodeLock assertion (%@)", buf, 0xCu);
  }
  [v9 setPreventPasscodeLock:MEMORY[0x1E4F1CC38]];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

void __64__SBSLockScreenServiceConnection_preventPasscodeLockWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) remoteTarget];
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = [v3 reason];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SBSLockScreenService.m", 133, @"invalid internal state : assertion isn't appropriately tracked : %@", v3 object file lineNumber description];
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v8 = [v3 reason];
  [v7 removeObject:v8];

  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v3 reason];
    *(_DWORD *)buf = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: preventPasscodeLock assertion invalidated (%@)", buf, 0xCu);
  }
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = 0;

    [v4 setPreventPasscodeLock:MEMORY[0x1E4F1CC28]];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (id)preventSpuriousScreenUndimWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSLockScreenService.m", 158, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__SBSLockScreenServiceConnection_preventSpuriousScreenUndimWithReason___block_invoke;
  v19[3] = &unk_1E566B500;
  v19[4] = self;
  v19[5] = a2;
  id v7 = (void *)[v6 initWithIdentifier:@"com.apple.springboard.lockscreen.preventSpuriousScreenUndim" forReason:v5 invalidationBlock:v19];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(BSServiceConnection *)self->_connection remoteTarget];
  lock_preventSpuriousScreenUndimReasons = self->_lock_preventSpuriousScreenUndimReasons;
  if (lock_preventSpuriousScreenUndimReasons)
  {
    uint64_t v11 = [v7 reason];
    [(NSCountedSet *)lock_preventSpuriousScreenUndimReasons addObject:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28BD0];
    uint64_t v11 = [v7 reason];
    id v13 = [v12 setWithObject:v11];
    v14 = self->_lock_preventSpuriousScreenUndimReasons;
    self->_lock_preventSpuriousScreenUndimReasons = v13;
  }
  id v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v7 reason];
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_18FBC5000, v15, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: creating new preventSpuriousScreenUndim assertion (%@)", buf, 0xCu);
  }
  [v9 setPreventSpuriousScreenUndim:MEMORY[0x1E4F1CC38]];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

void __71__SBSLockScreenServiceConnection_preventSpuriousScreenUndimWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) remoteTarget];
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [v3 reason];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SBSLockScreenService.m", 163, @"invalid internal state : assertion isn't appropriately tracked : %@", v3 object file lineNumber description];
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = [v3 reason];
  [v7 removeObject:v8];

  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v3 reason];
    *(_DWORD *)buf = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: preventSpuriousScreenUndim assertion invalidated (%@)", buf, 0xCu);
  }
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = 0;

    [v4 setPreventSpuriousScreenUndim:MEMORY[0x1E4F1CC28]];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke;
    v13[3] = &unk_1E566B488;
    id v9 = &v14;
    id v14 = v6;
    [v7 lockDeviceAnimated:v8 withCompletion:v13];
LABEL_7:

    goto LABEL_8;
  }
  id v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBSLockScreenServiceConnection lockDeviceAnimated:withCompletion:]();
  }

  if (v6)
  {
    id v8 = dispatch_get_global_queue(25, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_36;
    v11[3] = &unk_1E566B4D8;
    id v9 = &v12;
    id v12 = v6;
    dispatch_async(v8, v11);
    goto LABEL_7;
  }
LABEL_8:
}

void __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_cold_1();
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(25, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_35;
    v7[3] = &unk_1E566B4B0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)migrateIncomingNotificationsToHistory
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSLockScreenService: failed request for notification migration (no remoteTarget)", v2, v3, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_preventSpuriousScreenUndimReasons, 0);
  objc_storeStrong((id *)&self->_lock_preventPasscodeLockReasons, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)launchEmergencyDialerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSLockScreenService: failed request to launch emergency dialer (no remoteTarget)", v2, v3, v4, v5, v6);
}

void __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSLockScreenService: error from request to launch emergency dialer : %@", v2, v3, v4, v5, v6);
}

- (void)requestPasscodeUnlockUIWithOptions:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSLockScreenService: failed request for unlock (no remoteTarget)", v2, v3, v4, v5, v6);
}

void __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSLockScreenService: error from request for unlock : %@", v2, v3, v4, v5, v6);
}

- (void)requestPasscodeCheckUIWithOptions:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSLockScreenService: failed request for check (no remoteTarget)", v2, v3, v4, v5, v6);
}

void __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSLockScreenService: error from request for check : %@", v2, v3, v4, v5, v6);
}

- (void)lockDeviceAnimated:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSLockScreenService: failed request for lock (no remoteTarget)", v2, v3, v4, v5, v6);
}

void __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSLockScreenService: error from request for lock : %@", v2, v3, v4, v5, v6);
}

@end