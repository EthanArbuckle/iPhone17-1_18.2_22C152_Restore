@interface SBUIBiometricKitInterface
@end

@implementation SBUIBiometricKitInterface

void __34___SBUIBiometricKitInterface_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    *((void *)WeakRetained + 2) = state64;
    objc_msgSend(*((id *)WeakRetained + 8), "biometricKitInterface:enrolledIdentitiesDidChange:", WeakRetained, objc_msgSend(WeakRetained, "hasEnrolledIdentities"));
  }
}

uint64_t __59___SBUIBiometricKitInterface_operation_finishedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void *)(a1 + 48) - 1;
    if (v4 > 3) {
      v5 = @"BKOperationEndReasonFailed";
    }
    else {
      v5 = off_1E5CCCBE0[v4];
    }
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_INFO, "operation:%@ finishedWithReason:%@", (uint8_t *)&v7, 0x16u);
  }

  _SBUIEffectiveBiometricClassFromString(@"BKMatchPearlOperation");
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0 && *(void *)(a1 + 48) == 3) {
    return [*(id *)(a1 + 40) _sendDelegateEvent:15];
  }
  return result;
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) _trackerForOperation:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(v2 + 8);
  v5 = SBLogBiometricResource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *(id *)v2;
    if ((unint64_t)(v4 - 1) > 4) {
      int v7 = @"BKOperationStateFinished";
    }
    else {
      int v7 = off_1E5CCCC00[v4 - 1];
    }
    *(_DWORD *)v14 = 138412546;
    *(void *)&v14[4] = v6;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "operation:%@ stateChanged:%@", v14, 0x16u);
  }

  switch(v4)
  {
    case 1:
    case 3:
      goto LABEL_7;
    case 2:
      [v3 setState:1];
      [*(id *)(a1 + 32) _sendDelegateEvent:12];
      break;
    case 5:
      _SBUIEffectiveBiometricClassFromString(@"BKMatchPearlOperation");
      if (objc_opt_isKindOfClass())
      {
        if ([v3 state] == 1)
        {
          *(void *)v14 = 1;
          uint64_t v8 = [*(id *)v2 device];
          int v9 = [v8 bioLockoutState:v14 forUser:getuid() error:0];
          uint64_t v10 = *(void *)v14;

          uint64_t v11 = 15;
          if (v9 && v10 != 1) {
            uint64_t v11 = [*(id *)(a1 + 32) _eventForLockoutState:*(void *)v14];
          }
          v12 = SBLogBiometricResource();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_1((uint64_t *)v2, v11, v12);
          }

          [*(id *)(a1 + 32) _sendDelegateEvent:v11];
        }
        else
        {
          v13 = SBLogBiometricResource();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_2((uint64_t *)v2, v3, v13);
          }
        }
      }
LABEL_7:
      [v3 setState:0];
      break;
    default:
      break;
  }
}

void __62___SBUIBiometricKitInterface_matchOperation_failedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogBiometricResource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void *)(a1 + 48) - 2;
    if (v4 > 9) {
      v5 = @"BKMatchFailReasonUnspecified";
    }
    else {
      v5 = off_1E5CCCC28[v4];
    }
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_INFO, "operation:%@ finishedWithReason:%@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 != 2)
  {
    uint64_t v7 = 27;
    if (v6 == 5) {
      uint64_t v7 = 26;
    }
    if (v6 == 4) {
      uint64_t v8 = 25;
    }
    else {
      uint64_t v8 = v7;
    }
    [*(id *)(a1 + 40) _sendDelegateEvent:v8];
  }
}

uint64_t __61___SBUIBiometricKitInterface_operation_presenceStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) device];
  uint64_t v3 = [v2 descriptor];
  uint64_t v4 = [v3 type];

  if (*(unsigned char *)(a1 + 48))
  {
    if (v4 == 2)
    {
      uint64_t v4 = 13;
      return [*(id *)(a1 + 40) _sendDelegateEvent:v4];
    }
    if (v4 == 1)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 28) = 1;
      uint64_t v10 = 1;
      _SBUIEffectiveBiometricClassFromString(@"BKMatchOperation");
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return [*(id *)(a1 + 40) _sendDelegateEvent:v4];
      }
      v5 = [*(id *)(a1 + 32) device];
      if ([v5 bioLockoutState:&v10 forUser:getuid() error:0])
      {
        uint64_t v6 = v10;

        if (v6 != 1)
        {
          uint64_t v4 = [*(id *)(a1 + 40) _eventForLockoutState:v10];
          return [*(id *)(a1 + 40) _sendDelegateEvent:v4];
        }
      }
      else
      {
      }
    }
    uint64_t v4 = 1;
    return [*(id *)(a1 + 40) _sendDelegateEvent:v4];
  }
  if (v4 == 2)
  {
    uint64_t v7 = 14;
  }
  else
  {
    uint64_t v7 = 0;
    if (v4 == 1) {
      *(unsigned char *)(*(void *)(a1 + 40) + 28) = 0;
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);
  return [v8 _sendDelegateEvent:v7];
}

void __63___SBUIBiometricKitInterface_matchOperation_matchedWithResult___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _trackerForOperation:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) identity];

  if (v2)
  {
    [v8 setState:2];
    [*(id *)(a1 + 32) _sendDelegateEvent:3];
  }
  else
  {
    [v8 setState:3];
    uint64_t v3 = [*(id *)(a1 + 48) identity];

    if (!v3)
    {
      uint64_t v4 = [*(id *)(a1 + 48) lockoutState];
      objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", objc_msgSend(*(id *)(a1 + 32), "_eventForLockoutState:", v4));
      uint64_t v5 = (v4 & 0xFFFFFFFFFFFFFFFDLL) == 4 ? 11 : 10;
      [*(id *)(a1 + 32) _sendDelegateEvent:v5];
      _SBUIEffectiveBiometricClassFromString(@"BKMatchPearlResultInfo");
      if (objc_opt_isKindOfClass())
      {
        id v6 = *(id *)(a1 + 48);
        uint64_t v7 = [v6 feedback];
        if (v7 >= 1) {
          [*(id *)(a1 + 32) _sendDelegateEventForFeedback:v7];
        }
        if ([v6 periocularMatchState] == 8) {
          [*(id *)(a1 + 32) _sendDelegateEvent:32];
        }
      }
    }
  }
}

uint64_t __62___SBUIBiometricKitInterface_matchOperation_providedFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateEventForFeedback:*(void *)(a1 + 40)];
}

uint64_t __71___SBUIBiometricKitInterface_matchOperation_providedFaceOcclusionInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateEventForFaceOcclusionInfo:*(void *)(a1 + 40)];
}

uint64_t __79___SBUIBiometricKitInterface_matchOperation_providedFaceWUPoseEligibilityInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateEventForFaceWUPoseEligibilityInfo:*(void *)(a1 + 40)];
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = @"BKOperationStateOnHold";
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1A7607000, log, OS_LOG_TYPE_DEBUG, "operation:%@ stateChanged:%@ sending event %lu because operation was running", (uint8_t *)&v4, 0x20u);
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_2(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  int v5 = 138412802;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  __int16 v8 = @"BKOperationStateOnHold";
  __int16 v9 = 2048;
  uint64_t v10 = [a2 state];
  _os_log_debug_impl(&dword_1A7607000, a3, OS_LOG_TYPE_DEBUG, "operation:%@ stateChanged:%@ not sending event because operation was in state %ld", (uint8_t *)&v5, 0x20u);
}

@end