@interface _SBUIBiometricKitInterface
- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4;
- (BOOL)hasEnrolledIdentities;
- (BOOL)isFingerOn;
- (BOOL)isPearlIDCapable;
- (BOOL)isPeriocularMatchingEnabled;
- (BOOL)isTouchIDCapable;
- (_SBUIBiometricKitInterface)init;
- (_SBUIBiometricKitInterfaceDelegate)delegate;
- (id)_createPresenceDetectOperationsForDeviceTypes:(id)a3 error:(id *)a4;
- (id)_trackerForOperation:(id)a3;
- (id)createFaceDetectOperationsWithError:(id *)a3;
- (id)createFingerDetectOperationsWithError:(id *)a3;
- (id)createMatchOperationsWithMode:(unint64_t)a3 andCredentialSet:(id)a4 error:(id *)a5;
- (id)createPearlDevice;
- (id)createPresenceDetectOperationsWithError:(id *)a3;
- (unint64_t)_biometricEventForFaceDetectFeedback:(int64_t)a3;
- (unint64_t)_eventForLockoutState:(int64_t)a3;
- (unint64_t)_matchOperationTriggerForWakeSource:(unint64_t)a3;
- (unint64_t)lockoutState;
- (void)_sendDelegateEvent:(unint64_t)a3;
- (void)_sendDelegateEventForFaceOcclusionInfo:(id)a3;
- (void)_sendDelegateEventForFaceWUPoseEligibilityInfo:(id)a3;
- (void)_sendDelegateEventForFeedback:(int64_t)a3;
- (void)_setTracker:(id)a3 forOperation:(id)a4;
- (void)dealloc;
- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4;
- (void)forceBioLockout;
- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)matchOperation:(id)a3 providedFaceOcclusionInfo:(id)a4;
- (void)matchOperation:(id)a3 providedFaceWUPoseEligibilityInfo:(id)a4;
- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _SBUIBiometricKitInterface

- (_SBUIBiometricKitInterface)init
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)_SBUIBiometricKitInterface;
  v2 = [(_SBUIBiometricKitInterface *)&v51 init];
  v3 = v2;
  if (v2)
  {
    v2->_enrolledIdentitiesCount = 0;
    if (__loadBiometricKitIfNecessary_onceToken != -1) {
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global);
    }
    if (__loadBiometricKitIfNecessary_biometricKit && __loadBiometricKitIfNecessary_localAuthentication)
    {
      v4 = [MEMORY[0x1E4F4F730] serial];
      v5 = [v4 serviceClass:25];
      uint64_t v6 = BSDispatchQueueCreate();
      delegateQueue = v3->_delegateQueue;
      v3->_delegateQueue = (OS_dispatch_queue *)v6;

      v8 = [(objc_class *)_SBUIEffectiveBiometricClassFromString(@"BKDeviceManager") availableDevices];
      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      obuint64_t j = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v48 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v13 = _SBUIEffectiveBiometricClassFromString(@"BKDevice");
            id v46 = 0;
            v14 = [(objc_class *)v13 deviceWithDescriptor:v12 error:&v46];
            id v15 = v46;
            if (v14)
            {
              [v38 addObject:v14];
            }
            else
            {
              v16 = SBLogBiometricResource();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v54 = v12;
                __int16 v55 = 2112;
                id v56 = v15;
                _os_log_error_impl(&dword_1A7607000, v16, OS_LOG_TYPE_ERROR, "Failed to create biometric device for descriptor %@: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
        }
        while (v9);
      }

      uint64_t v17 = [v38 copy];
      biometricDevices = v3->_biometricDevices;
      v3->_biometricDevices = (NSSet *)v17;

      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v35 = v3->_biometricDevices;
      uint64_t v19 = [(NSSet *)v35 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v19)
      {
        uint64_t v21 = *(void *)v43;
        *(void *)&long long v20 = 138412546;
        long long v34 = v20;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v35);
            }
            v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            id v41 = 0;
            v24 = objc_msgSend(v23, "identitiesWithError:", &v41, v34);
            id v25 = v41;
            if (v24)
            {
              [v37 addObjectsFromArray:v24];
            }
            else
            {
              v26 = SBLogBiometricResource();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v34;
                v54 = v23;
                __int16 v55 = 2112;
                id v56 = v25;
                _os_log_error_impl(&dword_1A7607000, v26, OS_LOG_TYPE_ERROR, "Failed to retrieve identities from device %@: %@", buf, 0x16u);
              }
            }
            if (!v3->_mesaDevice)
            {
              mesaDevice = [v23 descriptor];
              if ([mesaDevice type] == 1)
              {
                _SBUIEffectiveBiometricClassFromString(@"BKDeviceTouchID");
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0) {
                  goto LABEL_33;
                }
                v29 = v23;
                mesaDevice = v3->_mesaDevice;
                v3->_mesaDevice = v29;
              }
            }
LABEL_33:
            if (!v3->_pearlDevice)
            {
              v30 = [v23 descriptor];
              if ([v30 type] == 2)
              {
                _SBUIEffectiveBiometricClassFromString(@"BKDevicePearl");
                objc_opt_class();
                char v31 = objc_opt_isKindOfClass();

                if (v31)
                {
                  objc_storeStrong((id *)&v3->_pearlDevice, v23);
                  [(BKDevicePearl *)v3->_pearlDevice setDelegate:v3];
                }
              }
              else
              {
              }
            }
          }
          uint64_t v19 = [(NSSet *)v35 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v19);
      }

      v3->_enrolledIdentitiesCount = [v37 count];
      objc_initWeak((id *)buf, v3);
      id v32 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __34___SBUIBiometricKitInterface_init__block_invoke;
      handler[3] = &unk_1E5CCC7B0;
      objc_copyWeak(&v40, (id *)buf);
      notify_register_dispatch("com.apple.BiometricKit.enrollmentChanged", &v3->_enrollmentChangedNotifyToken, MEMORY[0x1E4F14428], handler);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
    }
  }
  return v3;
}

- (void)dealloc
{
  notify_cancel(self->_enrollmentChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_SBUIBiometricKitInterface;
  [(_SBUIBiometricKitInterface *)&v3 dealloc];
}

- (BOOL)isTouchIDCapable
{
  return self->_mesaDevice != 0;
}

- (BOOL)isPearlIDCapable
{
  return self->_pearlDevice != 0;
}

- (id)createPearlDevice
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [(objc_class *)_SBUIEffectiveBiometricClassFromString(@"BKDeviceManager") availableDevices];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v4 = 138412546;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", v15) == 2)
        {
          uint64_t v10 = _SBUIEffectiveBiometricClassFromString(@"BKDevice");
          id v16 = 0;
          v11 = [(objc_class *)v10 deviceWithDescriptor:v9 error:&v16];
          id v12 = v16;
          if (v11)
          {
            v13 = v6;
            uint64_t v6 = v11;
          }
          else
          {
            v13 = SBLogBiometricResource();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v22 = v9;
              __int16 v23 = 2112;
              id v24 = v12;
              _os_log_error_impl(&dword_1A7607000, v13, OS_LOG_TYPE_ERROR, "Failed to create biometric device for descriptor %@: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (a3 && !self->_mesaDevice)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_SBUIBiometricKitInterface.m" lineNumber:322 description:@"can't enable background FDET without mesa"];
  }
  mesaDevice = self->_mesaDevice;
  return [(BKDeviceTouchID *)mesaDevice enableBackgroundFingerDetection:v5 error:a4];
}

- (id)createMatchOperationsWithMode:(unint64_t)a3 andCredentialSet:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_SBUIBiometricKitInterface.m", 331, @"Invalid parameter not satisfying: %@", @"matchMode != SBUIBiometricMatchModeNone" object file lineNumber description];
  }
  v8 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSSet count](self->_biometricDevices, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = self->_biometricDevices;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 4;
    if (!v7) {
      uint64_t v12 = 2;
    }
    uint64_t v24 = v12;
    uint64_t v13 = *(void *)v29;
    obuint64_t j = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) createMatchOperationWithError:a5];
        if (!v15)
        {

          uint64_t v9 = v8;
          v8 = 0;
          goto LABEL_26;
        }
        id v16 = v15;
        [v15 setDelegate:self];
        [v16 setQueue:self->_delegateQueue];
        _SBUIEffectiveBiometricClassFromString(@"BKMatchPearlOperation");
        if (objc_opt_isKindOfClass()) {
          id v17 = v16;
        }
        else {
          id v17 = 0;
        }
        switch(a3)
        {
          case 0uLL:
            long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
            [v18 handleFailureInMethod:a2 object:self file:@"_SBUIBiometricKitInterface.m" lineNumber:346 description:@"Invalid Match Mode"];

            break;
          case 1uLL:
            [v16 setPurpose:5];
            break;
          case 2uLL:
            [v16 setPurpose:5];
            [v16 setCaptureOnly:1];
            break;
          case 3uLL:
            [v16 setPurpose:v24];
            [v17 setShouldAutoRetry:1];
            if (SBUIAllowsIndicatorSecureRendering()) {
              objc_msgSend(v17, "setTrigger:", -[_SBUIBiometricKitInterface _matchOperationTriggerForWakeSource:](self, "_matchOperationTriggerForWakeSource:", -[_SBUIBiometricKitInterfaceDelegate wakeSourceForBiometricKitInterface:](self->_delegate, "wakeSourceForBiometricKitInterface:", self)));
            }
            break;
          default:
            break;
        }
        [v17 setLongTimeout:1];
        [v17 setStopOnSuccess:1];
        if (v7)
        {
          long long v19 = [v7 serializedCredentialSet];
          [v16 setCredentialSet:v19];
        }
        [(NSSet *)v8 addObject:v16];
        long long v20 = [[_SBUIBiometricKitInterfaceOperationStateTracker alloc] initWithState:0];
        [(_SBUIBiometricKitInterface *)self _setTracker:v20 forOperation:v16];
      }
      uint64_t v9 = obj;
      uint64_t v11 = [(NSSet *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  uint64_t v21 = (void *)[(NSSet *)v8 copy];
  return v21;
}

- (id)createPresenceDetectOperationsWithError:(id *)a3
{
  return [(_SBUIBiometricKitInterface *)self _createPresenceDetectOperationsForDeviceTypes:0 error:a3];
}

- (id)createFingerDetectOperationsWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EFCEACE0];
  uint64_t v6 = [(_SBUIBiometricKitInterface *)self _createPresenceDetectOperationsForDeviceTypes:v5 error:a3];

  return v6;
}

- (id)createFaceDetectOperationsWithError:(id *)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EFCEACF8];
  uint64_t v6 = [(_SBUIBiometricKitInterface *)self _createPresenceDetectOperationsForDeviceTypes:v5 error:a3];

  return v6;
}

- (unint64_t)lockoutState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getuid();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v4 = self->_biometricDevices;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v14 = 0;
        int v10 = [v9 bioLockoutState:&v14 forUser:v3 error:0];
        uint64_t v11 = v14;
        if (v10) {
          BOOL v12 = v14 == 1;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {

          if ((unint64_t)(v11 - 2) > 6) {
            return 10;
          }
          else {
            return qword_1A76A51E0[v11 - 2];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (BOOL)hasEnrolledIdentities
{
  return self->_enrolledIdentitiesCount != 0;
}

- (BOOL)isFingerOn
{
  return self->_isFingerDetected;
}

- (void)forceBioLockout
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_biometricDevices;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        uint64_t v8 = getuid();
        uint64_t v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v19 = v7;
          _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_INFO, "Forcing Bio Lockout for device: %@", buf, 0xCu);
        }

        id v13 = 0;
        char v10 = [v7 forceBioLockoutForUser:v8 error:&v13];
        id v11 = v13;
        if ((v10 & 1) == 0)
        {
          BOOL v12 = SBLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            long long v19 = v7;
            __int16 v20 = 2114;
            id v21 = v11;
            _os_log_error_impl(&dword_1A7607000, v12, OS_LOG_TYPE_ERROR, "Failed to force Bio Lockout for device: %{public}@ with error: %{public}@", buf, 0x16u);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }
}

- (BOOL)isPeriocularMatchingEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  pearlDevice = self->_pearlDevice;
  id v8 = 0;
  uint64_t v3 = [(BKDevicePearl *)pearlDevice protectedConfigurationForUser:getuid() error:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Could not get protected config: %@", buf, 0xCu);
    }
    char v6 = 0;
  }
  else
  {
    uint64_t v5 = [v3 periocularFaceIDMatchEnabled];
    char v6 = [v5 BOOLValue];
  }

  return v6;
}

- (void)_setTracker:(id)a3 forOperation:(id)a4
{
}

- (id)_trackerForOperation:(id)a3
{
  return objc_getAssociatedObject(a3, &__tracker);
}

- (unint64_t)_matchOperationTriggerForWakeSource:(unint64_t)a3
{
  if (a3 > 6) {
    return 3;
  }
  else {
    return qword_1A76A5218[a3];
  }
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___SBUIBiometricKitInterface_operation_finishedWithReason___block_invoke;
  block[3] = &unk_1E5CCC7D8;
  id v10 = self;
  int64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6 = a3;
  if (([v6 isMemberOfClass:_SBUIEffectiveBiometricClassFromString(@"BKFaceDetectOperation")] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke;
    block[3] = &unk_1E5CCC7D8;
    void block[4] = self;
    id v8 = v6;
    int64_t v9 = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___SBUIBiometricKitInterface_matchOperation_failedWithReason___block_invoke;
  block[3] = &unk_1E5CCC7D8;
  id v10 = self;
  int64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___SBUIBiometricKitInterface_operation_presenceStateChanged___block_invoke;
  block[3] = &unk_1E5CCC800;
  BOOL v11 = a4;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___SBUIBiometricKitInterface_matchOperation_matchedWithResult___block_invoke;
  block[3] = &unk_1E5CCC828;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___SBUIBiometricKitInterface_matchOperation_providedFeedback___block_invoke;
  v4[3] = &unk_1E5CCC850;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

- (void)matchOperation:(id)a3 providedFaceOcclusionInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___SBUIBiometricKitInterface_matchOperation_providedFaceOcclusionInfo___block_invoke;
  v7[3] = &unk_1E5CCC878;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)matchOperation:(id)a3 providedFaceWUPoseEligibilityInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79___SBUIBiometricKitInterface_matchOperation_providedFaceWUPoseEligibilityInfo___block_invoke;
  v7[3] = &unk_1E5CCC878;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4
{
  if (a4 == 16 && self->_pearlDevice == a3 && _os_feature_enabled_impl())
  {
    [(_SBUIBiometricKitInterface *)self _sendDelegateEvent:34];
  }
}

- (void)_sendDelegateEvent:(unint64_t)a3
{
}

- (void)_sendDelegateEventForFeedback:(int64_t)a3
{
  unint64_t v4 = [(_SBUIBiometricKitInterface *)self _biometricEventForFaceDetectFeedback:a3];
  [(_SBUIBiometricKitInterface *)self _sendDelegateEvent:v4];
}

- (void)_sendDelegateEventForFaceOcclusionInfo:(id)a3
{
  if ([a3 hasFaceOcclusion])
  {
    [(_SBUIBiometricKitInterface *)self _sendDelegateEvent:21];
  }
}

- (void)_sendDelegateEventForFaceWUPoseEligibilityInfo:(id)a3
{
  if ([a3 isEligible])
  {
    [(_SBUIBiometricKitInterface *)self _sendDelegateEvent:29];
  }
}

- (unint64_t)_eventForLockoutState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 5;
  }
  else {
    return qword_1A76A5250[a3 - 1];
  }
}

- (unint64_t)_biometricEventForFaceDetectFeedback:(int64_t)a3
{
  switch(a3)
  {
    case 2:
    case 5:
    case 9:
      unint64_t result = 22;
      break;
    case 3:
      unint64_t result = 18;
      break;
    case 4:
      unint64_t result = 17;
      break;
    case 6:
      unint64_t result = 20;
      break;
    case 7:
      unint64_t result = 21;
      break;
    case 8:
      unint64_t result = 19;
      break;
    case 10:
      unint64_t result = 23;
      break;
    case 11:
      unint64_t result = 28;
      break;
    case 12:
      unint64_t result = 30;
      break;
    case 13:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()) {
        unint64_t result = 31;
      }
      else {
        unint64_t result = 16;
      }
      break;
    default:
      unint64_t result = 16;
      break;
  }
  return result;
}

- (id)_createPresenceDetectOperationsForDeviceTypes:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSSet count](self->_biometricDevices, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = self->_biometricDevices;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    obuint64_t j = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (!v5) {
          goto LABEL_8;
        }
        id v13 = v6;
        long long v14 = NSNumber;
        long long v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) descriptor];
        long long v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "type"));
        int v17 = [v5 containsObject:v16];

        id v6 = v13;
        if (v17)
        {
LABEL_8:
          long long v18 = objc_msgSend(v12, "createPresenceDetectOperationWithError:", a4, obj);
          if (!v18)
          {

            id v7 = v6;
            id v6 = 0;
            goto LABEL_14;
          }
          long long v19 = v18;
          [v18 setDelegate:self];
          [v19 setQueue:self->_delegateQueue];
          [(NSSet *)v6 addObject:v19];
        }
      }
      id v7 = obj;
      uint64_t v9 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  __int16 v20 = (void *)[(NSSet *)v6 copy];
  return v20;
}

- (_SBUIBiometricKitInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_SBUIBiometricKitInterfaceDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_mesaDevice, 0);
  objc_storeStrong((id *)&self->_biometricDevices, 0);
}

@end