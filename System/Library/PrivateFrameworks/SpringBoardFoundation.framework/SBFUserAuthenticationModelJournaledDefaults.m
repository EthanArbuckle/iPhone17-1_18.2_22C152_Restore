@interface SBFUserAuthenticationModelJournaledDefaults
+ (id)_journaledDefaultsAndTypes;
- (BOOL)_isDeviceWipePreferenceEnabled;
- (BOOL)isPermanentlyBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isUserRequestedEraseEnabled;
- (SBFUserAuthenticationModelDelegate)delegate;
- (SBFUserAuthenticationModelJournaledDefaults)init;
- (double)timeUntilUnblockedSinceReferenceDate;
- (id)_copyLockControllerDefaults;
- (id)_initWithJournalPath:(id)a3 securityDefaults:(id)a4 profileConnection:(id)a5;
- (id)updateLockControllerDefaultsWithBlock:(id)a3 journaled:(BOOL)a4;
- (void)_evaluatePendingWipe;
- (void)_loadLockControllerDefaults:(id)a3;
- (void)_loadLockControllerDefaultsJournalIfNecessary;
- (void)_persistentStateQueue_beginSpeculativeFailureCharge;
- (void)_persistentStateQueue_cancelSpeculativeFailureCharge;
- (void)_persistentStateQueue_clearBlockedState;
- (void)_persistentStateQueue_evaluatePendingWipe;
- (void)_persistentStateQueue_loadLockState;
- (void)_persistentStateQueue_unlockFailedWithError:(id)a3;
- (void)_persistentStateQueue_unlockSucceeded;
- (void)_updateLockControllerDefaultsJournal;
- (void)clearBlockedState;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)notePasscodeUnlockFailedWithError:(id)a3;
- (void)notePasscodeUnlockSucceeded;
- (void)performPasswordTest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)synchronize;
- (void)test_reloadState;
@end

@implementation SBFUserAuthenticationModelJournaledDefaults

- (SBFUserAuthenticationModelJournaledDefaults)init
{
  v3 = [@"~/Library/SpringBoard/LockoutStateJournal.plist" stringByExpandingTildeInPath];
  v4 = objc_alloc_init(SBSecurityDefaults);
  v5 = [MEMORY[0x1E4F74230] sharedConnection];
  v6 = [(SBFUserAuthenticationModelJournaledDefaults *)self _initWithJournalPath:v3 securityDefaults:v4 profileConnection:v5];

  return v6;
}

- (id)_initWithJournalPath:(id)a3 securityDefaults:(id)a4 profileConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBFUserAuthenticationModelJournaledDefaults;
  v11 = [(SBFUserAuthenticationModelJournaledDefaults *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_securityDefaults, a4);
    objc_storeStrong((id *)&v12->_profileConnection, a5);
    uint64_t v13 = [v8 copy];
    journalPath = v12->_journalPath;
    v12->_journalPath = (NSString *)v13;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    persistentStateQueue = v12->_persistentStateQueue;
    v12->_persistentStateQueue = (OS_dispatch_queue *)Serial;

    [(SBFUserAuthenticationModelJournaledDefaults *)v12 _loadLockControllerDefaultsJournalIfNecessary];
    v17 = v12->_persistentStateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__SBFUserAuthenticationModelJournaledDefaults__initWithJournalPath_securityDefaults_profileConnection___block_invoke;
    block[3] = &unk_1E548CA88;
    v21 = v12;
    dispatch_async(v17, block);
    v18 = SBLogAuthenticationModel();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SBFUserAuthenticationModelJournaledDefaults _initWithJournalPath:securityDefaults:profileConnection:]((uint64_t *)&v12->_journalPath, v18);
    }
  }
  return v12;
}

uint64_t __103__SBFUserAuthenticationModelJournaledDefaults__initWithJournalPath_securityDefaults_profileConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_loadLockState");
}

- (void)synchronize
{
  v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode synchronize]();
  }

  [(BSAbstractDefaultDomain *)self->_securityDefaults synchronizeDefaults];
}

- (void)notePasscodeEntryBegan
{
  v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryBegan]();
  }

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryBegan__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __69__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryBegan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_beginSpeculativeFailureCharge");
}

- (void)notePasscodeEntryCancelled
{
  v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryCancelled]();
  }

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryCancelled__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __73__SBFUserAuthenticationModelJournaledDefaults_notePasscodeEntryCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_cancelSpeculativeFailureCharge");
}

- (void)notePasscodeUnlockSucceeded
{
  v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockSucceeded]();
  }

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockSucceeded__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_sync(persistentStateQueue, block);
  [(SBFUserAuthenticationModelDelegate *)self->_delegate deviceLockStateMayHaveChangedForModel:self];
}

uint64_t __74__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockSucceeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockSucceeded");
}

- (void)notePasscodeUnlockFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:]((uint64_t)v4, v5);
  }

  persistentStateQueue = self->_persistentStateQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __81__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockFailedWithError___block_invoke;
  v11 = &unk_1E548CBA0;
  v12 = self;
  id v13 = v4;
  id v7 = v4;
  dispatch_async(persistentStateQueue, &v8);
  -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self, v8, v9, v10, v11, v12);
}

uint64_t __81__SBFUserAuthenticationModelJournaledDefaults_notePasscodeUnlockFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockFailedWithError:", *(void *)(a1 + 40));
}

- (void)performPasswordTest:(id)a3
{
  id v4 = a3;
  v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode performPasswordTest:]();
  }

  persistentStateQueue = self->_persistentStateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SBFUserAuthenticationModelJournaledDefaults_performPasswordTest___block_invoke;
  v8[3] = &unk_1E548D2A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(persistentStateQueue, v8);
}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults_performPasswordTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearBlockedState
{
  v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelSEP clearBlockedState]();
  }

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBFUserAuthenticationModelJournaledDefaults_clearBlockedState__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_async(persistentStateQueue, block);
  [(SBFUserAuthenticationModelDelegate *)self->_delegate deviceLockStateMayHaveChangedForModel:self];
}

uint64_t __64__SBFUserAuthenticationModelJournaledDefaults_clearBlockedState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_clearBlockedState");
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (SBFUserAuthenticationModelDelegate *)a3;
    [(SBFUserAuthenticationModelJournaledDefaults *)self _evaluatePendingWipe];
  }
}

- (BOOL)isPermanentlyBlocked
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBFUserAuthenticationModelJournaledDefaults_isPermanentlyBlocked__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults_isPermanentlyBlocked__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

- (BOOL)isTemporarilyBlocked
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(SBFUserAuthenticationModelJournaledDefaults *)self timeUntilUnblockedSinceReferenceDate];
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__SBFUserAuthenticationModelJournaledDefaults_timeUntilUnblockedSinceReferenceDate__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __83__SBFUserAuthenticationModelJournaledDefaults_timeUntilUnblockedSinceReferenceDate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 64);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isUserRequestedEraseEnabled
{
  return 0;
}

- (void)_evaluatePendingWipe
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBFUserAuthenticationModelJournaledDefaults__evaluatePendingWipe__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_async(persistentStateQueue, block);
}

uint64_t __67__SBFUserAuthenticationModelJournaledDefaults__evaluatePendingWipe__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_evaluatePendingWipe");
}

- (BOOL)_isDeviceWipePreferenceEnabled
{
  return [(SBSecurityDefaults *)self->_securityDefaults isDeviceWipeEnabled];
}

- (void)_persistentStateQueue_beginSpeculativeFailureCharge
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 1;
    double v4 = [(SBSecurityDefaults *)self->_securityDefaults numberOfFailedPasscodeAttempts];
    int v5 = [v4 intValue];

    int v6 = [(MCProfileConnection *)self->_profileConnection effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE0]];
    id v7 = [(MCProfileConnection *)self->_profileConnection valueRestrictionForFeature:*MEMORY[0x1E4F740B8]];
    uint64_t v8 = v7;
    if (v7) {
      int v9 = [v7 intValue];
    }
    else {
      int v9 = -1;
    }
    if (v9 == -1 && v6 != 2)
    {
      if ([(SBFUserAuthenticationModelJournaledDefaults *)self _isDeviceWipePreferenceEnabled])
      {
        int v9 = 10;
      }
      else
      {
        int v9 = -1;
      }
    }
    int v10 = 0;
    int v11 = v5 + 1;
    BOOL v12 = v9 < 0 || v11 < v9;
    char v13 = !v12;
    if (v12)
    {
      unsigned int v14 = v5 - 5;
      if (v5 >= 5)
      {
        if (v14 > 4) {
          int v10 = -1;
        }
        else {
          int v10 = dword_18B5E6060[v14];
        }
      }
    }
    if (self->_originalDefaultsForRollback)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"SBFUserAuthenticationModelJournaledDefaults.m", 214, @"We should not have rollback values when beginning a speculative failure charge, but we had %@", self->_originalDefaultsForRollback object file lineNumber description];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_beginSpeculativeFailureCharge__block_invoke;
    v18[3] = &unk_1E548E1E8;
    v18[4] = self;
    int v19 = v11;
    int v20 = v10;
    char v21 = v13;
    v15 = [(SBFUserAuthenticationModelJournaledDefaults *)self updateLockControllerDefaultsWithBlock:v18 journaled:1];
    originalDefaultsForRollback = self->_originalDefaultsForRollback;
    self->_originalDefaultsForRollback = v15;

    [(BSAbstractDefaultDomain *)self->_securityDefaults synchronizeDefaults];
  }
}

void __98__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_beginSpeculativeFailureCharge__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  double v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v2 setNumberOfFailedPasscodeAttempts:v3];

  int v4 = *(_DWORD *)(a1 + 44);
  if (v4)
  {
    int v5 = *(void **)(*(void *)(a1 + 32) + 16);
    int v6 = NSNumber;
    if (v4 == -1)
    {
      id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v7 timeIntervalSinceReferenceDate];
      uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
      [v5 setUnblockTimeFromReferenceDate:v8];

      [*(id *)(*(void *)(a1 + 32) + 16) setBlockedForPasscode:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      int v10 = [v6 numberWithDouble:v9 + (double)*(int *)(a1 + 44)];
      [v5 setUnblockTimeFromReferenceDate:v10];
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    int v11 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    [v11 setPendingDeviceWipe:v12];
  }
}

- (void)_persistentStateQueue_cancelSpeculativeFailureCharge
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __99__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_cancelSpeculativeFailureCharge__block_invoke;
    v5[3] = &unk_1E548CA88;
    v5[4] = self;
    id v3 = [(SBFUserAuthenticationModelJournaledDefaults *)self updateLockControllerDefaultsWithBlock:v5 journaled:0];
    originalDefaultsForRollback = self->_originalDefaultsForRollback;
    self->_originalDefaultsForRollback = 0;
  }
}

uint64_t __99__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_cancelSpeculativeFailureCharge__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadLockControllerDefaults:*(void *)(*(void *)(a1 + 32) + 48)];
}

- (void)_persistentStateQueue_unlockSucceeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_cancelSpeculativeFailureCharge];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_unlockSucceeded__block_invoke;
  v4[3] = &unk_1E548CA88;
  v4[4] = self;
  id v3 = [(SBFUserAuthenticationModelJournaledDefaults *)self updateLockControllerDefaultsWithBlock:v4 journaled:0];
}

uint64_t __84__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_unlockSucceeded__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setNumberOfFailedPasscodeAttempts:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setUnblockTimeFromReferenceDate:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 setBlockedForPasscode:0];
}

- (void)_persistentStateQueue_unlockFailedWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    int v4 = SBLogAuthenticationModel();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_18B52E000, v4, OS_LOG_TYPE_INFO, "A passcode attempt failed without a corresponding speculative failure charge. Callstack %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_beginSpeculativeFailureCharge];
  }
  self->_speculativePasscodeFailureChargeOutstanding = 0;
  originalDefaultsForRollback = self->_originalDefaultsForRollback;
  self->_originalDefaultsForRollback = 0;

  [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_loadLockState];
  [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_evaluatePendingWipe];
}

- (void)_persistentStateQueue_loadLockState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  id v3 = [(SBSecurityDefaults *)self->_securityDefaults unblockTimeFromReferenceDate];
  id v9 = v3;
  if (v3)
  {
    [v3 doubleValue];
    self->_unblockTime = v4;
  }
  else
  {
    int v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v5 timeIntervalSinceReferenceDate];
    self->_unblockTime = v6;
  }
  int v7 = [(SBSecurityDefaults *)self->_securityDefaults isPendingDeviceWipe];
  self->_pendingWipe = [v7 BOOLValue];

  uint64_t v8 = [(SBSecurityDefaults *)self->_securityDefaults isBlockedForPasscode];
  self->_permanentlyBlocked = [v8 BOOLValue];
}

- (void)_persistentStateQueue_evaluatePendingWipe
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  if (self->_pendingWipe)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_evaluatePendingWipe__block_invoke;
    block[3] = &unk_1E548CA88;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __88__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_evaluatePendingWipe__block_invoke(uint64_t a1)
{
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_18B52E000, v2, OS_LOG_TYPE_INFO, "Wiping device", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "deviceLockModelRequestsDeviceWipe:");
}

- (void)_persistentStateQueue_clearBlockedState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_persistentStateQueue);
  [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_cancelSpeculativeFailureCharge];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_clearBlockedState__block_invoke;
  v4[3] = &unk_1E548CA88;
  v4[4] = self;
  id v3 = [(SBFUserAuthenticationModelJournaledDefaults *)self updateLockControllerDefaultsWithBlock:v4 journaled:0];
  [(SBFUserAuthenticationModelJournaledDefaults *)self _persistentStateQueue_loadLockState];
}

uint64_t __86__SBFUserAuthenticationModelJournaledDefaults__persistentStateQueue_clearBlockedState__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setNumberOfFailedPasscodeAttempts:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setUnblockTimeFromReferenceDate:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 setBlockedForPasscode:0];
}

- (void)test_reloadState
{
  [(SBFUserAuthenticationModelJournaledDefaults *)self _loadLockControllerDefaultsJournalIfNecessary];
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBFUserAuthenticationModelJournaledDefaults_test_reloadState__block_invoke;
  block[3] = &unk_1E548CA88;
  void block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

uint64_t __63__SBFUserAuthenticationModelJournaledDefaults_test_reloadState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_loadLockState");
}

- (id)updateLockControllerDefaultsWithBlock:(id)a3 journaled:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (void (**)(void))a3;
  id v7 = [(SBFUserAuthenticationModelJournaledDefaults *)self _copyLockControllerDefaults];
  uint64_t v8 = [(SBSecurityDefaults *)self->_securityDefaults blockStateGeneration];
  uint64_t v9 = [v8 longLongValue];

  v6[2](v6);
  securityDefaults = self->_securityDefaults;
  int v11 = [NSNumber numberWithLongLong:v9 + 1];
  [(SBSecurityDefaults *)securityDefaults setBlockStateGeneration:v11];

  if (v4) {
    [(SBFUserAuthenticationModelJournaledDefaults *)self _updateLockControllerDefaultsJournal];
  }
  return v7;
}

+ (id)_journaledDefaultsAndTypes
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SBDeviceLockBlocked";
  v5[0] = objc_opt_class();
  v4[1] = @"SBDeviceLockFailedAttempts";
  v5[1] = objc_opt_class();
  v4[2] = @"SBFDeviceLockPendingWipe";
  v5[2] = objc_opt_class();
  v4[3] = @"SBDeviceLockBlockTimeIntervalSinceReferenceDate";
  v5[3] = objc_opt_class();
  v4[4] = @"SBDeviceLockBlockStateGeneration";
  v5[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

- (id)_copyLockControllerDefaults
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _journaledDefaultsAndTypes];
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v11 = -[SBSecurityDefaults deviceLockDefaultForKey:](self->_securityDefaults, "deviceLockDefaultForKey:", v10, (void)v14);
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

- (void)_updateLockControllerDefaultsJournal
{
  id v3 = [(SBFUserAuthenticationModelJournaledDefaults *)self _copyLockControllerDefaults];
  [v3 writeToFile:self->_journalPath atomically:1];
  sync();
  BOOL v4 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_18B52E000, v4, OS_LOG_TYPE_INFO, "Updated journal", v5, 2u);
  }
}

- (void)_loadLockControllerDefaults:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)objc_opt_class() _journaledDefaultsAndTypes];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        int v11 = [v4 objectForKeyedSubscript:v10];
        if (v11)
        {
          id v12 = (id)[v5 objectForKeyedSubscript:v10];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v21 = SBLogAuthenticationModel();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              objc_super v22 = objc_opt_class();
              *(_DWORD *)buf = 138413058;
              uint64_t v34 = v10;
              __int16 v35 = 2112;
              v36 = v11;
              __int16 v37 = 2114;
              v38 = v22;
              __int16 v39 = 2114;
              id v40 = v12;
              id v23 = v22;
              _os_log_impl(&dword_18B52E000, v21, OS_LOG_TYPE_INFO, "Loading journal key %@ found object %@ of type %{public}@ but expected type %{public}@. Aborting journal loading.", buf, 0x2Au);
            }
            goto LABEL_21;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        securityDefaults = self->_securityDefaults;
        int v20 = objc_msgSend(v4, "objectForKeyedSubscript:", v18, (void)v24);
        [(SBSecurityDefaults *)securityDefaults setDeviceLockDefault:v20 forKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }
LABEL_21:
}

- (void)_loadLockControllerDefaultsJournalIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:self->_journalPath];
  if (v3)
  {
    id v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"SBDeviceLockBlockStateGeneration", objc_opt_class());
    uint64_t v5 = [v4 longLongValue];

    uint64_t v6 = [(SBSecurityDefaults *)self->_securityDefaults blockStateGeneration];
    uint64_t v7 = [v6 longLongValue];

    if (v7 < v5)
    {
      uint64_t v8 = SBLogAuthenticationModel();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 134218240;
        uint64_t v10 = v5;
        __int16 v11 = 2048;
        uint64_t v12 = v7;
        _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_INFO, "journalGeneration = %lld defaultsGeneration = %lld. Updating defaults from journal", (uint8_t *)&v9, 0x16u);
      }

      [(SBFUserAuthenticationModelJournaledDefaults *)self _loadLockControllerDefaults:v3];
    }
  }
}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDefaultsForRollback, 0);
  objc_storeStrong((id *)&self->_persistentStateQueue, 0);
  objc_storeStrong((id *)&self->_journalPath, 0);
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

- (void)_initWithJournalPath:(uint64_t *)a1 securityDefaults:(NSObject *)a2 profileConnection:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18B52E000, a2, OS_LOG_TYPE_DEBUG, "Model using journal @ path: %@", (uint8_t *)&v3, 0xCu);
}

@end