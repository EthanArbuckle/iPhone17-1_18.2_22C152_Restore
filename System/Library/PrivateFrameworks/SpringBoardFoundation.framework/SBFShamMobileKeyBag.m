@interface SBFShamMobileKeyBag
+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4;
+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6;
- (BOOL)beginRecovery:(id)a3 error:(id *)a4;
- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4;
- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6;
- (id)extendedState;
- (id)state;
- (int64_t)_simplifiedLockStateForLockState:(int64_t)a3;
- (void)_queue_initializeSecretChangeMachine:(id)a3;
- (void)_queue_stepSecretChangeMachine;
- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5;
- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5 completionQueue:(id)a6;
- (void)lock;
- (void)waitForUnlockWithTimeout:(float)a3;
@end

@implementation SBFShamMobileKeyBag

+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [[SBFShamMobileKeyBag alloc] initWithRecoveryRequired:v4 correctPasscode:v5];

  return v6;
}

+ (id)shamKeyBagWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a6;
  v10 = [SBFShamMobileKeyBag alloc];
  *(float *)&double v11 = a5;
  v12 = [(SBFShamMobileKeyBag *)v10 initWithRecoveryRequired:v8 recoveryPossible:v7 timeScaleFactor:v9 correctPasscode:v11];

  return v12;
}

- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 correctPasscode:(id)a4
{
  LODWORD(v4) = 1.0;
  return [(SBFShamMobileKeyBag *)self initWithRecoveryRequired:a3 recoveryPossible:1 timeScaleFactor:a4 correctPasscode:v4];
}

- (SBFShamMobileKeyBag)initWithRecoveryRequired:(BOOL)a3 recoveryPossible:(BOOL)a4 timeScaleFactor:(float)a5 correctPasscode:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBFShamMobileKeyBag;
  double v11 = [(SBFShamMobileKeyBag *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeScaleFactor = a5;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.springboardfoundation.shamkeybag", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v10 copy];
    queue_correctPasscode = v12->_queue_correctPasscode;
    v12->_queue_correctPasscode = (NSData *)v15;

    v17 = objc_alloc_init(SBFMutableMobileKeyBagState);
    queue_state = v12->_queue_state;
    v12->_queue_state = v17;

    [(SBFMutableMobileKeyBagState *)v12->_queue_state setLockState:2];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setBackOffTime:0.0];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setFailedAttemptCount:0];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setPermanentlyBlocked:0];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setShouldWipe:0];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setRecoveryEnabled:1];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setRecoveryRequired:v8];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setRecoveryPossible:v7];
    [(SBFMutableMobileKeyBagState *)v12->_queue_state setEscrowCount:0];
  }

  return v12;
}

- (void)lock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SBFShamMobileKeyBag_lock__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__SBFShamMobileKeyBag_lock__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setLockState:2];
}

- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5
{
}

- (void)createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4 completion:(id)a5 completionQueue:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__SBFShamMobileKeyBag_createStashBag_skipSEKeepUserDataOperation_completion_completionQueue___block_invoke;
  v16[3] = &unk_1E548E1C0;
  v16[4] = self;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __93__SBFShamMobileKeyBag_createStashBag_skipSEKeepUserDataOperation_completion_completionQueue___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 32) lockState])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) lockState];
      int v6 = 134217984;
      uint64_t v7 = v2;
      _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failing because state %ld is not unlocked", (uint8_t *)&v6, 0xCu);
    }
    v3 = *(void **)(a1 + 56);
    if (v3) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 40), v3);
    }
  }
  if (([*(id *)(a1 + 48) isEqualToData:*(void *)(*(void *)(a1 + 32) + 24)] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failing because passcodes do not match", (uint8_t *)&v6, 2u);
    }
    double v4 = *(void **)(a1 + 56);
    if (v4) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
    }
  }
  id v5 = *(void **)(a1 + 56);
  if (v5) {
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
  }
}

- (BOOL)beginRecovery:(id)a3 error:(id *)a4
{
  id v5 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SBFShamMobileKeyBag_beginRecovery_error___block_invoke;
  v9[3] = &unk_1E548CBA0;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

uint64_t __43__SBFShamMobileKeyBag_beginRecovery_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_initializeSecretChangeMachine:", *(void *)(a1 + 40));
}

- (void)waitForUnlockWithTimeout:(float)a3
{
  id v5 = [(SBFShamMobileKeyBag *)self state];
  uint64_t v6 = [v5 lockState];

  if (v6)
  {
    useconds_t v7 = (float)((float)(a3 * 1000000.0) / self->_timeScaleFactor);
    usleep(v7);
  }
}

- (id)state
{
  v3 = [(SBFShamMobileKeyBag *)self extendedState];
  double v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "setLockState:", -[SBFShamMobileKeyBag _simplifiedLockStateForLockState:](self, "_simplifiedLockStateForLockState:", objc_msgSend(v4, "lockState")));
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)extendedState
{
  uint64_t v6 = 0;
  useconds_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__4;
  id v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SBFShamMobileKeyBag_extendedState__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__SBFShamMobileKeyBag_extendedState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "_queue_stepSecretChangeMachine");
}

- (void)_queue_initializeSecretChangeMachine:(id)a3
{
  self->_queue_escrowState = 1;
  double v4 = (NSData *)[a3 copy];
  queue_trialPasscode = self->_queue_trialPasscode;
  self->_queue_trialPasscode = v4;

  self->_queue_escrowCountTotal = 1000000.0;
  self->_queue_escrowCountDelta = self->_timeScaleFactor * 1667.0;
  queue_state = self->_queue_state;
  [(SBFMutableMobileKeyBagState *)queue_state setEscrowCount:1000000];
}

- (void)_queue_stepSecretChangeMachine
{
  if (self->_queue_escrowState == 1)
  {
    float v3 = self->_queue_escrowCountTotal - self->_queue_escrowCountDelta;
    self->_uint64_t queue_escrowCountTotal = v3;
    if (v3 <= 0.0)
    {
      self->_uint64_t queue_escrowCountTotal = 0.0;
      if (![(SBFMobileKeyBagState *)self->_queue_state permanentlyBlocked]
        && [(SBFMobileKeyBagState *)self->_queue_state recoveryPossible]
        && [(NSData *)self->_queue_trialPasscode isEqualToData:self->_queue_correctPasscode])
      {
        [(SBFMutableMobileKeyBagState *)self->_queue_state setLockState:0];
        [(SBFMutableMobileKeyBagState *)self->_queue_state setBackOffTime:0.0];
        [(SBFMutableMobileKeyBagState *)self->_queue_state setFailedAttemptCount:0];
        [(SBFMutableMobileKeyBagState *)self->_queue_state setShouldWipe:0];
        [(SBFMutableMobileKeyBagState *)self->_queue_state setRecoveryRequired:0];
        unint64_t v4 = 2;
      }
      else
      {
        if (![(SBFMobileKeyBagState *)self->_queue_state permanentlyBlocked])
        {
          if ([(SBFMobileKeyBagState *)self->_queue_state recoveryPossible])
          {
            [(SBFMutableMobileKeyBagState *)self->_queue_state setFailedAttemptCount:[(SBFMobileKeyBagState *)self->_queue_state failedAttemptCount] + 1];
            if ([(SBFMobileKeyBagState *)self->_queue_state failedAttemptCount] >= 5) {
              [(SBFMutableMobileKeyBagState *)self->_queue_state setRecoveryPossible:0];
            }
          }
        }
        unint64_t v4 = 3;
      }
      self->_queue_escrowState = v4;
    }
    queue_state = self->_queue_state;
    uint64_t queue_escrowCountTotal = (uint64_t)self->_queue_escrowCountTotal;
    [(SBFMutableMobileKeyBagState *)queue_state setEscrowCount:queue_escrowCountTotal];
  }
}

- (int64_t)_simplifiedLockStateForLockState:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)(a3 - 4) <= 3) {
    return qword_18B5E6040[a3 - 4];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_trialPasscode, 0);
  objc_storeStrong((id *)&self->_queue_state, 0);
  objc_storeStrong((id *)&self->_queue_correctPasscode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end