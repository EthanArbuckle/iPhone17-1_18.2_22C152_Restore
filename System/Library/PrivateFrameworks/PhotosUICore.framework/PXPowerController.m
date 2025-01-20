@interface PXPowerController
+ (PXPowerController)sharedController;
- (BKSProcessAssertion)backgroundProcessAssertion;
- (BOOL)hasBackgroundAssertion;
- (BOOL)hasPowerAssertion;
- (BOOL)isBackgrounded;
- (NSMutableDictionary)assertionReasonsByIdentifier;
- (OS_dispatch_queue)powerControllerQueue;
- (PXPowerController)init;
- (double)powerAssertionStartTime;
- (id)description;
- (unsigned)assertionID;
- (unsigned)generateAssertionIdentifier;
- (void)acquireBackgroundAssertion;
- (void)acquireBackgroundAssertionIfNeeded;
- (void)addPowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5;
- (void)dealloc;
- (void)handleEnteringBackground;
- (void)handleEnteringForeground;
- (void)invalidateBackgroundAssertion;
- (void)invalidateBackgroundAssertionIfNeeded;
- (void)releasePowerAssertion;
- (void)releasePowerAssertionIfNeeded;
- (void)removePowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5;
- (void)setAssertionID:(unsigned int)a3;
- (void)setBackgroundProcessAssertion:(id)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)setPowerAssertionStartTime:(double)a3;
- (void)takePowerAssertion;
- (void)takePowerAssertionIfNeeded;
@end

@implementation PXPowerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundProcessAssertion, 0);
  objc_storeStrong((id *)&self->_powerControllerQueue, 0);
  objc_storeStrong((id *)&self->_assertionReasonsByIdentifier, 0);
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (BOOL)isBackgrounded
{
  return self->_backgrounded;
}

- (void)setPowerAssertionStartTime:(double)a3
{
  self->_powerAssertionStartTime = a3;
}

- (double)powerAssertionStartTime
{
  return self->_powerAssertionStartTime;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setBackgroundProcessAssertion:(id)a3
{
}

- (BKSProcessAssertion)backgroundProcessAssertion
{
  return self->_backgroundProcessAssertion;
}

- (OS_dispatch_queue)powerControllerQueue
{
  return self->_powerControllerQueue;
}

- (NSMutableDictionary)assertionReasonsByIdentifier
{
  return self->_assertionReasonsByIdentifier;
}

- (BOOL)hasBackgroundAssertion
{
  v2 = [(PXPowerController *)self backgroundProcessAssertion];
  char v3 = [v2 valid];

  return v3;
}

- (void)acquireBackgroundAssertion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "📴✅ Acquiring background assertion", buf, 2u);
  }

  id v4 = [(PXPowerController *)self assertionReasonsByIdentifier];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v30 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)location = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:location objects:buf count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *((void *)location[1] + i);
        v11 = [v6 objectForKeyedSubscript:v10];
        v12 = NSStringFromPXPowerAssertionReasonBitfield([v11 intValue]);

        [v5 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:location objects:buf count:16];
    }
    while (v7);
  }

  v13 = [(id)objc_opt_class() description];
  objc_initWeak(location, self);
  id v14 = objc_alloc(MEMORY[0x1E4F4E280]);
  uint64_t v15 = getpid();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__PXPowerController_acquireBackgroundAssertion__block_invoke;
  v24[3] = &unk_1E5DD21B0;
  objc_copyWeak(&v26, location);
  id v16 = v5;
  id v25 = v16;
  v17 = (void *)[v14 initWithPID:v15 flags:1 reason:10004 name:v13 withHandler:v24];
  [(PXPowerController *)self setBackgroundProcessAssertion:v17];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__PXPowerController_acquireBackgroundAssertion__block_invoke_41;
  v22[3] = &unk_1E5DD36F8;
  id v18 = v16;
  id v23 = v18;
  uint64_t v19 = [(PXPowerController *)self backgroundProcessAssertion];
  [(id)v19 setInvalidationHandler:v22];

  v20 = [(PXPowerController *)self backgroundProcessAssertion];
  LOBYTE(v19) = [v20 acquire];

  if ((v19 & 1) == 0)
  {
    v21 = _powerControllerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v18;
      _os_log_error_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "Unable to acquire background assertion for acive power assertions: %{public}@", buf, 0xCu);
    }
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

void __47__PXPowerController_acquireBackgroundAssertion__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _powerControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained backgroundProcessAssertion];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_INFO, "Started background assertion: %@ for active assertions: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __47__PXPowerController_acquireBackgroundAssertion__block_invoke_41(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _powerControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "-[PXPowerController acquireBackgroundAssertion]_block_invoke";
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_error_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "%s: A background assertion was invalidated without finishing! Assertions active: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)invalidateBackgroundAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(PXPowerController *)self backgroundProcessAssertion];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "📴❌ Invalidating background assertion: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = [(PXPowerController *)self backgroundProcessAssertion];
  [v5 invalidate];

  [(PXPowerController *)self setBackgroundProcessAssertion:0];
}

- (void)acquireBackgroundAssertionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    id v18 = "-[PXPowerController acquireBackgroundAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v17, 0xCu);
  }

  BOOL v4 = [(PXPowerController *)self hasPowerAssertion];
  BOOL v5 = [(PXPowerController *)self isBackgrounded];
  BOOL v6 = [(PXPowerController *)self hasBackgroundAssertion];
  BOOL v7 = v6;
  if (v5 && v4 && !v6)
  {
    [(PXPowerController *)self acquireBackgroundAssertion];
  }
  else
  {
    uint64_t v8 = _powerControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (v5) {
        uint64_t v9 = @"NO";
      }
      else {
        uint64_t v9 = @"YES";
      }
      uint64_t v10 = v9;
      if (v4) {
        v11 = @"NO";
      }
      else {
        v11 = @"YES";
      }
      v12 = v11;
      v13 = v10;
      if (v7) {
        id v14 = @"YES";
      }
      else {
        id v14 = @"NO";
      }
      uint64_t v15 = v14;
      id v16 = v12;
      int v17 = 138543874;
      id v18 = (const char *)v10;
      __int16 v19 = 2114;
      v20 = v12;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_debug_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "Not creating background assertion because either we are not backgrounded: %{public}@, or we don't have a power assertion: %{public}@, or background assertion is already active: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)invalidateBackgroundAssertionIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[PXPowerController invalidateBackgroundAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  BOOL v4 = [(PXPowerController *)self hasPowerAssertion];
  BOOL v5 = [(PXPowerController *)self isBackgrounded];
  BOOL v6 = [(PXPowerController *)self hasBackgroundAssertion];
  if (!v6 || v4 && v5)
  {
    BOOL v7 = _powerControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (v4) {
        uint64_t v8 = @"NO";
      }
      else {
        uint64_t v8 = @"YES";
      }
      uint64_t v9 = v8;
      if (v6) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      v11 = v10;
      v12 = v9;
      int v13 = 138543618;
      id v14 = (const char *)v9;
      __int16 v15 = 2114;
      id v16 = v11;
      _os_log_debug_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "No background assertion to invalidate because either we don't have a power assertion: %{public}@, or background assertion already exists: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    [(PXPowerController *)self invalidateBackgroundAssertion];
  }
}

- (void)handleEnteringBackground
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v6 = "-[PXPowerController handleEnteringBackground]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  BOOL v4 = [(PXPowerController *)self powerControllerQueue];
  pl_dispatch_sync();
}

uint64_t __45__PXPowerController_handleEnteringBackground__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgrounded:1];
  v2 = *(void **)(a1 + 32);
  return [v2 acquireBackgroundAssertionIfNeeded];
}

- (void)handleEnteringForeground
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v6 = "-[PXPowerController handleEnteringForeground]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  BOOL v4 = [(PXPowerController *)self powerControllerQueue];
  pl_dispatch_sync();
}

uint64_t __45__PXPowerController_handleEnteringForeground__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgrounded:0];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateBackgroundAssertionIfNeeded];
}

- (BOOL)hasPowerAssertion
{
  [(PXPowerController *)self powerAssertionStartTime];
  return v2 != 0.0;
}

- (void)releasePowerAssertion
{
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "⚡️❌ Releasing power assertion", buf, 2u);
  }

  [(PXPowerController *)self powerAssertionStartTime];
  if (v4 != 0.0)
  {
    uint64_t v5 = IOPMAssertionRelease(self->_assertionID);
    if (v5)
    {
      uint64_t v6 = v5;
      _PFAssertContinueHandler();
    }
    -[PXPowerController setPowerAssertionStartTime:](self, "setPowerAssertionStartTime:", 0.0, v6);
  }
}

- (void)takePowerAssertion
{
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "⚡️✅ Taking power assertion", buf, 2u);
  }

  if (IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"Photos Import/Export activity", @"com.apple.Photos.importExport", @"Ensure user-initiated import or export activity does not get interrupted.", 0, 3600.0, @"TimeoutActionTurnOff", &self->_assertionID))
  {
    _PFAssertContinueHandler();
  }
  [(PXPowerController *)self setPowerAssertionStartTime:CFAbsoluteTimeGetCurrent()];
}

- (void)releasePowerAssertionIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    v12 = "-[PXPowerController releasePowerAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  double v4 = [(PXPowerController *)self assertionReasonsByIdentifier];
  uint64_t v5 = [v4 count];

  BOOL v6 = [(PXPowerController *)self hasPowerAssertion];
  BOOL v7 = v6;
  if (v5 || !v6)
  {
    uint64_t v8 = _powerControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"YES";
      if (v7) {
        uint64_t v9 = @"NO";
      }
      uint64_t v10 = v9;
      int v11 = 134349314;
      v12 = (const char *)v5;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "Not releasing power assertion because either: numActiveAssertionIdentifiers=%{public}ld, or power assert doesn't exist: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [(PXPowerController *)self releasePowerAssertion];
    [(PXPowerController *)self invalidateBackgroundAssertionIfNeeded];
  }
}

- (void)takePowerAssertionIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _powerControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    v12 = "-[PXPowerController takePowerAssertionIfNeeded]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v11, 0xCu);
  }

  double v4 = [(PXPowerController *)self assertionReasonsByIdentifier];
  uint64_t v5 = [v4 count];

  BOOL v6 = [(PXPowerController *)self hasPowerAssertion];
  BOOL v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v8 = _powerControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v7) {
        uint64_t v9 = @"YES";
      }
      uint64_t v10 = v9;
      int v11 = 134349314;
      v12 = (const char *)v5;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "Not taking power assertion because either: numActiveAssertionIdentifiers=%{public}ld, or already has power assertion: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [(PXPowerController *)self takePowerAssertion];
    [(PXPowerController *)self acquireBackgroundAssertionIfNeeded];
  }
}

- (void)removePowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5
{
  id v6 = a5;
  BOOL v7 = [(PXPowerController *)self powerControllerQueue];
  id v8 = v6;
  pl_dispatch_async();
}

void __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_2;
  aBlock[3] = &unk_1E5DD3128;
  id v26 = *(id *)(a1 + 40);
  double v2 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  double v4 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    uint64_t v9 = _powerControllerLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_15;
    }
    int v12 = *(_DWORD *)(a1 + 48);
    unsigned int v13 = *(_DWORD *)(a1 + 52) - 2;
    if (v13 > 6) {
      id v14 = @"PXPowerAssertionReasonImportAssets";
    }
    else {
      id v14 = off_1E5DB44F0[v13];
    }
    uint64_t v23 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
    *(_DWORD *)buf = 136315906;
    long long v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    __int16 v29 = 1024;
    *(_DWORD *)long long v30 = v12;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v14;
    __int16 v31 = 2114;
    id v32 = v23;
    v24 = "%s: Power assertion %d not found, cannot remove reason %{public}@; existing assertion reasons: %{public}@";
LABEL_22:
    _os_log_error_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, v24, buf, 0x26u);

    goto LABEL_10;
  }
  unsigned int v6 = [v5 intValue];
  int v7 = *(_DWORD *)(a1 + 52) & v6;
  id v8 = _powerControllerLog();
  uint64_t v9 = v8;
  if (!v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v20 = *(_DWORD *)(a1 + 48);
    unsigned int v21 = *(_DWORD *)(a1 + 52) - 2;
    if (v21 > 6) {
      v22 = @"PXPowerAssertionReasonImportAssets";
    }
    else {
      v22 = off_1E5DB44F0[v21];
    }
    uint64_t v23 = NSStringFromPXPowerAssertionReasonBitfield(v6);
    *(_DWORD *)buf = 136315906;
    long long v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    __int16 v29 = 1024;
    *(_DWORD *)long long v30 = v20;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v22;
    __int16 v31 = 2114;
    id v32 = v23;
    v24 = "%s: Power assertion %d was not asserted with reason %{public}@; existing assertion reasons: %{public}@";
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v10 = *(_DWORD *)(a1 + 52) - 2;
    if (v10 > 6) {
      int v11 = @"PXPowerAssertionReasonImportAssets";
    }
    else {
      int v11 = off_1E5DB44F0[v10];
    }
    int v15 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    long long v28 = "-[PXPowerController removePowerAssertionForIdentifier:withReason:completion:]_block_invoke";
    __int16 v29 = 2114;
    *(void *)long long v30 = v11;
    *(_WORD *)&v30[8] = 1026;
    *(_DWORD *)&v30[10] = v15;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "%s: Removing power assertion %{public}@ for identifier: %{public}d", buf, 0x1Cu);
  }

  unsigned int v16 = v6 & ~*(_DWORD *)(a1 + 52);
  uint64_t v17 = [NSNumber numberWithUnsignedInt:v16];
  id v18 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
  [v18 setObject:v17 forKeyedSubscript:v3];

  if (!v16)
  {
    __int16 v19 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
    [v19 removeObjectForKey:v3];

    [*(id *)(a1 + 32) releasePowerAssertionIfNeeded];
  }
LABEL_15:
  v2[2](v2);
}

void __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_3;
    block[3] = &unk_1E5DD3128;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __77__PXPowerController_removePowerAssertionForIdentifier_withReason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addPowerAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4 completion:(id)a5
{
  id v6 = a5;
  int v7 = [(PXPowerController *)self powerControllerQueue];
  id v8 = v6;
  pl_dispatch_async();
}

void __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_2;
  aBlock[3] = &unk_1E5DD3128;
  id v18 = *(id *)(a1 + 40);
  double v2 = (void (**)(void))_Block_copy(aBlock);
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  double v4 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  unsigned int v6 = [v5 intValue];

  LODWORD(v5) = *(_DWORD *)(a1 + 52) & v6;
  int v7 = _powerControllerLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = *(_DWORD *)(a1 + 52) - 2;
      if (v14 > 6) {
        int v15 = @"PXPowerAssertionReasonImportAssets";
      }
      else {
        int v15 = off_1E5DB44F0[v14];
      }
      int v16 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      int v20 = "-[PXPowerController addPowerAssertionForIdentifier:withReason:completion:]_block_invoke";
      __int16 v21 = 2114;
      v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_error_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "%s: Power assertion %{public}@ already exists for identifier: %d", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = *(_DWORD *)(a1 + 52) - 2;
      if (v9 > 6) {
        unsigned int v10 = @"PXPowerAssertionReasonImportAssets";
      }
      else {
        unsigned int v10 = off_1E5DB44F0[v9];
      }
      int v11 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      int v20 = "-[PXPowerController addPowerAssertionForIdentifier:withReason:completion:]_block_invoke";
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_INFO, "%s: Adding power assertion %{public}@ for identifier: %{public}d", buf, 0x1Cu);
    }

    int v12 = [NSNumber numberWithUnsignedInt:*(_DWORD *)(a1 + 52) | v6];
    unsigned int v13 = [*(id *)(a1 + 32) assertionReasonsByIdentifier];
    [v13 setObject:v12 forKeyedSubscript:v3];

    [*(id *)(a1 + 32) takePowerAssertionIfNeeded];
  }
  v2[2](v2);
}

void __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_3;
    block[3] = &unk_1E5DD3128;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __74__PXPowerController_addPowerAssertionForIdentifier_withReason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unsigned)generateAssertionIdentifier
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_assertionIdentifierGenerator, 1u) + 1;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPowerController *)self assertionReasonsByIdentifier];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int v11 = [v5 objectForKeyedSubscript:v10];
        unsigned int v12 = [v11 intValue];

        unsigned int v13 = NSStringFromPXPowerAssertionReasonBitfield(v12);
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  unsigned int v14 = NSString;
  uint64_t v15 = objc_opt_class();
  int v16 = [(PXPowerController *)self backgroundProcessAssertion];
  uint64_t v17 = [v14 stringWithFormat:@"<%@ backgroundProcessAssertion:%@ assertions:%@>", v15, v16, v4];

  return v17;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2738] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXPowerController;
  [(PXPowerController *)&v4 dealloc];
}

- (PXPowerController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXPowerController;
  double v2 = [(PXPowerController *)&v11 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionReasonsByIdentifier = v2->_assertionReasonsByIdentifier;
    v2->_assertionReasonsByIdentifier = v3;

    backgroundProcessAssertion = v2->_backgroundProcessAssertion;
    v2->_backgroundProcessAssertion = 0;

    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.power-controller.assertions", v6);
    powerControllerQueue = v2->_powerControllerQueue;
    v2->_powerControllerQueue = (OS_dispatch_queue *)v7;

    unsigned int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];
    [v9 addObserver:v2 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v2;
}

+ (PXPowerController)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_4_56569);
  }
  double v2 = (void *)sharedController_powerController;
  return (PXPowerController *)v2;
}

void __37__PXPowerController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PXPowerController);
  v1 = (void *)sharedController_powerController;
  sharedController_powerController = (uint64_t)v0;
}

@end