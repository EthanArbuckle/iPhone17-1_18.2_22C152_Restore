@interface SBHardwareButtonService
+ (SBHardwareButtonService)sharedInstance;
- (BOOL)_hwButtonHintViewsSupported;
- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5;
- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5 continuation:(id *)a6;
- (BOOL)consumeHeadsetPlayPauseSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4;
- (BOOL)consumeHeadsetPlayPauseSinglePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeHomeButtonDoublePressDownWithPriority:(int64_t)a3;
- (BOOL)consumeHomeButtonLongPressWithPriority:(int64_t)a3;
- (BOOL)consumeHomeButtonSinglePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeHomeButtonTriplePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeLockButtonDoublePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeLockButtonLongPressWithPriority:(int64_t)a3;
- (BOOL)consumeLockButtonSinglePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeRingerSwitchToggleStateOffWithPriority:(int64_t)a3;
- (BOOL)consumeRingerSwitchToggleStateOnWithPriority:(int64_t)a3;
- (BOOL)consumeVolumeDecreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4;
- (BOOL)consumeVolumeDecreaseButtonSinglePressUpWithPriority:(int64_t)a3;
- (BOOL)consumeVolumeIncreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4;
- (BOOL)consumeVolumeIncreaseButtonSinglePressUpWithPriority:(int64_t)a3;
- (BOOL)hasConsumersForHomeButtonPresses;
- (BOOL)hasConsumersForHomeButtonSinglePress;
- (BOOL)hasConsumersForLockButtonDoublePressUp;
- (BOOL)hasConsumersForLockButtonPresses;
- (BOOL)systemServiceServer:(id)a3 client:(id)a4 registerAssociatedHintViewContextId:(unsigned int)a5 renderId:(unint64_t)a6 size:(CGSize)a7 buttonKind:(int64_t)a8 clientPort:(id)a9;
- (BOOL)systemServiceServer:(id)a3 client:(id)a4 requestSystemGlowEffectWithInitialStyle:(int64_t)a5 clientPort:(id)a6;
- (BOOL)systemServiceServer:(id)a3 getHintViewsSupportedForClient:(id)a4;
- (BSMutableIntegerMap)clientsByPID;
- (BSMutableIntegerMap)registrationsByButtonKind;
- (SBHardwareButtonService)init;
- (SBWindowScene)mainWindowScene;
- (id)_applicationForClientInfo:(id)a3;
- (id)_init;
- (id)_initWithSystemServiceServer:(id)a3;
- (id)_mutableRegistrationsForButtonKind:(int64_t)a3;
- (id)_mutableRegistrationsForButtonKind:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_registrationsForButtonKind:(int64_t)a3;
- (id)addObserver:(id)a3;
- (void)_addRegistration:(id)a3 toClient:(id)a4;
- (void)_performButtonRegistrationChangeAndNotifyObservers:(id)a3;
- (void)_process:(id)a3 stateDidUpdate:(id)a4;
- (void)_reconfigureProcessMonitor;
- (void)_reconfigureProcessMonitorForPredicates:(id)a3;
- (void)_removeRegistration:(id)a3 fromClient:(id)a4;
- (void)_sendXPCMessageForEvent:(int64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5 toClient:(id)a6;
- (void)_setSystemServiceClient:(id)a3 buttonKind:(int64_t)a4 eventMask:(unint64_t)a5 priority:(int64_t)a6;
- (void)_updateAllButtonEventMasks;
- (void)_updateEventMasksForButtonKind:(int64_t)a3;
- (void)setClientsByPID:(id)a3;
- (void)setMainWindowScene:(id)a3;
- (void)setRegistrationsByButtonKind:(id)a3;
- (void)systemServiceServer:(id)a3 client:(id)a4 acquireAssertionOfType:(int64_t)a5 forReason:(id)a6 withCompletion:(id)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 fetchHapticTypeForButtonKind:(int64_t)a5 completion:(id)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 requestsHIDEvents:(BOOL)a5 token:(id)a6 forButtonKind:(int64_t)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 setEventMask:(unint64_t)a5 buttonKind:(int64_t)a6 priority:(int64_t)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 setHapticType:(int64_t)a5 buttonKind:(int64_t)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 updateHintContentVisibility:(int64_t)a5 forButton:(int64_t)a6 animationSettings:(id)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 updateSystemGlowStyle:(int64_t)a5;
- (void)systemServiceServer:(id)a3 clientDidDisconnect:(id)a4;
@end

@implementation SBHardwareButtonService

void __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F96448];
  id v4 = a2;
  v5 = [v3 descriptor];
  v8[0] = *MEMORY[0x1E4F62718];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 setEndowmentNamespaces:v6];

  [v4 setStateDescriptor:v5];
  [v4 setServiceClass:33];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_2;
  v7[3] = &unk_1E6AF9008;
  v7[4] = *(void *)(a1 + 32);
  [v4 setUpdateHandler:v7];
  [v4 setPredicates:*(void *)(a1 + 40)];
}

- (void)_addRegistration:(id)a3 toClient:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v6;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Registration add: %{public}@ client:%{public}@", buf, 0x16u);
  }

  uint64_t v9 = [v6 buttonKind];
  id v10 = [v7 registrations];
  if (([v10 containsObject:v6] & 1) == 0)
  {
    if (v10)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v10;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v15, "buttonKind", (void)v18) == v9)
            {
              objc_msgSend(v15, "setEventMask:", objc_msgSend(v6, "eventMask"));
              objc_msgSend(v15, "setEventPriority:", objc_msgSend(v6, "eventPriority"));
              id v16 = v15;

              id v6 = v16;
              goto LABEL_17;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CA80] set];
      [v7 setRegistrations:v10];
    }
    objc_msgSend(v10, "addObject:", v6, (void)v18);
LABEL_17:
    v17 = [(SBHardwareButtonService *)self _mutableRegistrationsForButtonKind:v9 createIfNecessary:1];
    [v17 insertObject:v6 atIndex:0];
    [(SBHardwareButtonService *)self _updateEventMasksForButtonKind:v9];
  }
}

void __51__SBHardwareButtonService__process_stateDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
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
        objc_msgSend(*(id *)(a1 + 40), "_updateEventMasksForButtonKind:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "buttonKind"));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_process:(id)a3 stateDidUpdate:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  long long v8 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v7 state];
    long long v10 = [v9 endowmentNamespaces];
    *(_DWORD *)buf = 138543874;
    *(void *)v33 = v6;
    *(_WORD *)&v33[8] = 2114;
    id v34 = v7;
    __int16 v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "process %{public}@ update:%{public}@ endowments:%{public}@", buf, 0x20u);
  }
  int v27 = [v6 pid];
  v28 = self;
  uint64_t v11 = [(BSMutableIntegerMap *)self->_clientsByPID objectForKey:v27];
  uint64_t v12 = [v7 state];
  uint64_t v13 = [v7 previousState];
  int v14 = [v12 taskState];
  v15 = (void *)MEMORY[0x1E4F62718];
  if (v14 == 4)
  {
    id v16 = [v12 endowmentNamespaces];
    uint64_t v17 = [v16 containsObject:*v15];
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([v13 taskState] == 4)
  {
    long long v18 = [v13 endowmentNamespaces];
    int v19 = [v18 containsObject:*v15];
  }
  else
  {
    int v19 = 0;
  }
  int v20 = [v11 canReceiveEvents];
  if (v19 != v17)
  {
    long long v21 = SBLogButtonsInteraction();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v33 = v6;
        v23 = "process is running / visible:%{public}@";
LABEL_15:
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v33 = v6;
      v23 = "process is not running / not visible:%{public}@";
      goto LABEL_15;
    }

    [v11 setRunningVisible:v17];
  }
  [v11 setSuspended:v14 == 3];
  int v24 = [v11 canReceiveEvents];
  if (v20 != v24)
  {
    int v25 = v24;
    id v26 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v33 = v27;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v20;
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = v25;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "pid %d canReceiveEvents previously:%{BOOL}u now:%{BOOL}u", buf, 0x14u);
    }

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __51__SBHardwareButtonService__process_stateDidUpdate___block_invoke;
    v29[3] = &unk_1E6AF5290;
    id v30 = v11;
    v31 = v28;
    [(SBHardwareButtonService *)v28 _performButtonRegistrationChangeAndNotifyObservers:v29];
  }
}

- (void)_updateEventMasksForButtonKind:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SBHardwareButtonService *)self _mutableRegistrationsForButtonKind:a3 createIfNecessary:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 client];
        int v13 = [v12 canReceiveEvents];

        if (v13) {
          v8 |= [v11 eventMask];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (!self->_eventMaskPerKind)
  {
    int v14 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    eventMaskPerKind = self->_eventMaskPerKind;
    self->_eventMaskPerKind = v14;
  }
  id v16 = self->_eventMaskPerKind;
  if (v8)
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v8];
    [(BSMutableIntegerMap *)v16 setObject:v17 forKey:a3];
  }
  else
  {
    [(BSMutableIntegerMap *)v16 removeObjectForKey:a3];
  }
  long long v18 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = NSStringFromSBSHardwareButtonKind();
    *(_DWORD *)buf = 138543618;
    int v25 = v19;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "_updateEventMasksForButtonKind:%{public}@ eventMask:%lX", buf, 0x16u);
  }
}

- (id)_mutableRegistrationsForButtonKind:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  -[BSMutableIntegerMap objectForKey:](self->_registrationsByButtonKind, "objectForKey:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    registrationsByButtonKind = self->_registrationsByButtonKind;
    if (!registrationsByButtonKind)
    {
      long long v10 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
      uint64_t v11 = self->_registrationsByButtonKind;
      self->_registrationsByButtonKind = v10;

      registrationsByButtonKind = self->_registrationsByButtonKind;
    }
    [(BSMutableIntegerMap *)registrationsByButtonKind setObject:v7 forKey:a3];
  }
  return v7;
}

- (void)_setSystemServiceClient:(id)a3 buttonKind:(int64_t)a4 eventMask:(unint64_t)a5 priority:(int64_t)a6
{
  id v10 = a3;
  int v11 = [v10 pid];
  uint64_t v12 = [(BSMutableIntegerMap *)self->_clientsByPID objectForKey:v11];
  int v13 = objc_alloc_init(SBButtonConsumerRegistration);
  [(SBButtonConsumerRegistration *)v13 setClient:v12];
  [(SBButtonConsumerRegistration *)v13 setButtonKind:a4];
  [(SBButtonConsumerRegistration *)v13 setEventMask:a5];
  [(SBButtonConsumerRegistration *)v13 setEventPriority:a6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__SBHardwareButtonService__setSystemServiceClient_buttonKind_eventMask_priority___block_invoke;
  v17[3] = &unk_1E6B00978;
  long long v21 = v13;
  unint64_t v22 = a5;
  id v18 = v12;
  id v19 = v10;
  int v23 = v11;
  long long v20 = self;
  int v14 = v13;
  id v15 = v10;
  id v16 = v12;
  [(SBHardwareButtonService *)self _performButtonRegistrationChangeAndNotifyObservers:v17];
}

- (void)_performButtonRegistrationChangeAndNotifyObservers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = (void *)[(BSMutableIntegerMap *)self->_eventMaskPerKind copy];
  v4[2](v4);
  uint64_t v6 = self->_eventMaskPerKind;
  for (uint64_t i = 1; i != 11; ++i)
  {
    BOOL v8 = [v5 objectForKey:i];
    uint64_t v9 = [v8 unsignedIntegerValue];

    id v10 = [(BSMutableIntegerMap *)v6 objectForKey:i];
    uint64_t v11 = [v10 unsignedIntegerValue];

    if (v9 != v11)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v12 = self->_observers;
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * v16++) buttonService:self buttonKind:i eventsConsumedDidChange:v11];
          }
          while (v14 != v16);
          uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
  }
}

void __81__SBHardwareButtonService__setSystemServiceClient_buttonKind_eventMask_priority___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    v2 = (SBButtonConsumerClient *)*(id *)(a1 + 32);
    if (!v2)
    {
      uint64_t v13 = objc_alloc_init(SBButtonConsumerClient);
      [(SBButtonConsumerClient *)v13 setSystemServiceClient:*(void *)(a1 + 40)];
      uint64_t v3 = [*(id *)(a1 + 40) processHandle];
      uint64_t v4 = [v3 hasEntitlement:*MEMORY[0x1E4FA6FD8]];

      [(SBButtonConsumerClient *)v13 setEntitledToConsumeButtonsInBackground:v4];
      uint64_t v5 = [*(id *)(a1 + 48) _applicationForClientInfo:v13];
      [(SBButtonConsumerClient *)v13 setApplication:v5 != 0];
      uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 80);
      if (!v6)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F4F788]);
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = *(void **)(v8 + 80);
        *(void *)(v8 + 80) = v7;

        uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 80);
      }
      [v6 setObject:v13 forKey:*(int *)(a1 + 72)];
      [*(id *)(a1 + 48) _reconfigureProcessMonitor];

      v2 = v13;
    }
    uint64_t v14 = v2;
    [*(id *)(a1 + 56) setClient:v2];
    [*(id *)(a1 + 48) _addRegistration:*(void *)(a1 + 56) toClient:v14];
  }
  else
  {
    [*(id *)(a1 + 48) _removeRegistration:*(void *)(a1 + 56) fromClient:*(void *)(a1 + 32)];
    id v10 = [*(id *)(a1 + 32) registrations];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      [*(id *)(*(void *)(a1 + 48) + 80) removeObjectForKey:*(int *)(a1 + 72)];
      uint64_t v12 = *(void **)(a1 + 48);
      [v12 _reconfigureProcessMonitor];
    }
  }
}

- (BOOL)hasConsumersForHomeButtonSinglePress
{
  v2 = [(BSMutableIntegerMap *)self->_eventMaskPerKind objectForKey:1];
  int v3 = [v2 unsignedIntegerValue];

  return (*(void *)&v3 & 0x10002) != 0;
}

- (void)_reconfigureProcessMonitor
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  clientsByPID = self->_clientsByPID;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SBHardwareButtonService__reconfigureProcessMonitor__block_invoke;
  v6[3] = &unk_1E6B00908;
  id v7 = v3;
  id v5 = v3;
  [(BSMutableIntegerMap *)clientsByPID enumerateKeysWithBlock:v6];
  [(SBHardwareButtonService *)self _reconfigureProcessMonitorForPredicates:v5];
}

- (void)_reconfigureProcessMonitorForPredicates:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    processMonitor = self->_processMonitor;
    if (processMonitor)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_4;
      v11[3] = &unk_1E6AF9058;
      uint64_t v12 = v5;
      [(RBSProcessMonitor *)processMonitor updateConfiguration:v11];
      id v7 = v12;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F96418];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke;
      v13[3] = &unk_1E6AF9030;
      v13[4] = self;
      uint64_t v14 = v5;
      uint64_t v9 = [v8 monitorWithConfiguration:v13];
      id v10 = self->_processMonitor;
      self->_processMonitor = v9;

      id v7 = v14;
    }
  }
  else
  {
    [(RBSProcessMonitor *)self->_processMonitor invalidate];
    id v7 = self->_processMonitor;
    self->_processMonitor = 0;
  }
}

- (id)_applicationForClientInfo:(id)a3
{
  id v3 = [a3 systemServiceClient];
  id v4 = [v3 processHandle];
  uint64_t v5 = [v4 pid];

  uint64_t v6 = +[SBApplicationController sharedInstance];
  id v7 = [v6 applicationWithPid:v5];

  return v7;
}

uint64_t __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process:*(void *)(a1 + 40) stateDidUpdate:*(void *)(a1 + 48)];
}

uint64_t __87__SBHardwareButtonService_systemServiceServer_client_setEventMask_buttonKind_priority___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSystemServiceClient:*(void *)(a1 + 40) buttonKind:*(void *)(a1 + 48) eventMask:*(void *)(a1 + 56) priority:*(void *)(a1 + 64)];
}

void __53__SBHardwareButtonService__reconfigureProcessMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F96430];
  id v4 = [NSNumber numberWithInt:a2];
  id v5 = [v3 predicateMatchingIdentifier:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

void __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setEventMask:(unint64_t)a5 buttonKind:(int64_t)a6 priority:(int64_t)a7
{
  id v8 = a4;
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  id v14 = 0;
  int v10 = [(FBServiceClientAuthenticator *)serviceClientEventConsumerEntitlement authenticateClient:v8 error:&v14];
  id v11 = v14;
  if (v10)
  {
    id v13 = v8;
    BSDispatchMain();
  }
  else
  {
    uint64_t v12 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHardwareButtonService systemServiceServer:client:setEventMask:buttonKind:priority:](v8);
    }
  }
}

+ (SBHardwareButtonService)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1) {
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_142);
  }
  v2 = (void *)sharedInstance___sharedInstance_12;
  return (SBHardwareButtonService *)v2;
}

void __41__SBHardwareButtonService_sharedInstance__block_invoke()
{
  id v0 = [[SBHardwareButtonService alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_12;
  sharedInstance___sharedInstance_12 = (uint64_t)v0;
}

- (id)_initWithSystemServiceServer:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBHardwareButtonService;
  id v6 = [(SBHardwareButtonService *)&v17 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v8 = [v7 initWithEntitlement:*MEMORY[0x1E4FA6FF0]];
    serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator = v6->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator;
    v6->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator = (FBServiceClientAuthenticator *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v11 = [v10 initWithEntitlement:*MEMORY[0x1E4FA6FE8]];
    serviceClientEventConsumerEntitlement = v6->_serviceClientEventConsumerEntitlement;
    v6->_serviceClientEventConsumerEntitlement = (FBServiceClientAuthenticator *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v14 = [v13 initWithEntitlement:*MEMORY[0x1E4FA6FE0]];
    serviceClientHintViewEntitlement = v6->_serviceClientHintViewEntitlement;
    v6->_serviceClientHintViewEntitlement = (FBServiceClientAuthenticator *)v14;

    [v5 setHardwareButtonDelegate:v6];
    objc_storeStrong((id *)&v6->_systemServiceServer, a3);
  }

  return v6;
}

- (id)_init
{
  id v3 = +[SBSystemServiceServer sharedInstance];
  id v4 = [(SBHardwareButtonService *)self _initWithSystemServiceServer:v3];

  return v4;
}

- (SBHardwareButtonService)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@ does not support initialization.", v6 format];

  return (SBHardwareButtonService *)[(SBHardwareButtonService *)self _init];
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __39__SBHardwareButtonService_addObserver___block_invoke;
  uint64_t v15 = &unk_1E6AFD050;
  uint64_t v16 = self;
  id v6 = v4;
  id v17 = v6;
  id v7 = (void *)[v5 initWithIdentifier:@"SBHardwareButtonServiceObserver" forReason:@"buttons!" invalidationBlock:&v12];
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = self->_observers;
    self->_observers = v9;

    observers = self->_observers;
  }
  -[NSMutableArray addObject:](observers, "addObject:", v6, v12, v13, v14, v15, v16);

  return v7;
}

uint64_t __39__SBHardwareButtonService_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)hasConsumersForHomeButtonPresses
{
  v2 = [(BSMutableIntegerMap *)self->_eventMaskPerKind objectForKey:1];
  uint64_t v3 = [v2 unsignedIntegerValue];

  return v3 != 0;
}

- (BOOL)consumeHomeButtonSinglePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:1 buttonKind:1 withPriority:a3];
}

- (BOOL)consumeHomeButtonDoublePressDownWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:2 buttonKind:1 withPriority:a3];
}

- (BOOL)consumeHomeButtonTriplePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:4 buttonKind:1 withPriority:a3];
}

- (BOOL)consumeHomeButtonLongPressWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:5 buttonKind:1 withPriority:a3];
}

- (BOOL)hasConsumersForLockButtonPresses
{
  v2 = [(BSMutableIntegerMap *)self->_eventMaskPerKind objectForKey:2];
  uint64_t v3 = [v2 unsignedIntegerValue];

  return v3 != 0;
}

- (BOOL)hasConsumersForLockButtonDoublePressUp
{
  v2 = [(BSMutableIntegerMap *)self->_eventMaskPerKind objectForKey:2];
  int v3 = [v2 unsignedIntegerValue];

  return (*(void *)&v3 & 0x10008) != 0;
}

- (BOOL)consumeLockButtonSinglePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:1 buttonKind:2 withPriority:a3];
}

- (BOOL)consumeLockButtonDoublePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:3 buttonKind:2 withPriority:a3];
}

- (BOOL)consumeLockButtonLongPressWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:5 buttonKind:2 withPriority:a3];
}

- (BOOL)consumeVolumeIncreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  uint64_t v13 = 0;
  BOOL v6 = [(SBHardwareButtonService *)self _sendEvent:6 buttonKind:3 withPriority:a3 continuation:&v13];
  id v7 = (void *)MEMORY[0x1D948C7A0](v13);
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__SBHardwareButtonService_consumeVolumeIncreaseButtonSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E6AFE440;
    id v11 = v7;
    int64_t v12 = a3;
    *a4 = (id)MEMORY[0x1D948C7A0](v10);
  }
  return v6;
}

uint64_t __95__SBHardwareButtonService_consumeVolumeIncreaseButtonSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 3, *(void *)(a1 + 40));
}

- (BOOL)consumeVolumeIncreaseButtonSinglePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:1 buttonKind:3 withPriority:a3];
}

- (BOOL)consumeVolumeDecreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  uint64_t v13 = 0;
  BOOL v6 = [(SBHardwareButtonService *)self _sendEvent:6 buttonKind:4 withPriority:a3 continuation:&v13];
  id v7 = (void *)MEMORY[0x1D948C7A0](v13);
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__SBHardwareButtonService_consumeVolumeDecreaseButtonSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E6AFE440;
    id v11 = v7;
    int64_t v12 = a3;
    *a4 = (id)MEMORY[0x1D948C7A0](v10);
  }
  return v6;
}

uint64_t __95__SBHardwareButtonService_consumeVolumeDecreaseButtonSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 4, *(void *)(a1 + 40));
}

- (BOOL)consumeVolumeDecreaseButtonSinglePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:1 buttonKind:4 withPriority:a3];
}

- (BOOL)consumeHeadsetPlayPauseSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  uint64_t v13 = 0;
  BOOL v6 = [(SBHardwareButtonService *)self _sendEvent:6 buttonKind:5 withPriority:a3 continuation:&v13];
  id v7 = (void *)MEMORY[0x1D948C7A0](v13);
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__SBHardwareButtonService_consumeHeadsetPlayPauseSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E6AFE440;
    id v11 = v7;
    int64_t v12 = a3;
    *a4 = (id)MEMORY[0x1D948C7A0](v10);
  }
  return v6;
}

uint64_t __91__SBHardwareButtonService_consumeHeadsetPlayPauseSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 5, *(void *)(a1 + 40));
}

- (BOOL)consumeHeadsetPlayPauseSinglePressUpWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:1 buttonKind:5 withPriority:a3];
}

- (BOOL)consumeRingerSwitchToggleStateOnWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:7 buttonKind:6 withPriority:a3];
}

- (BOOL)consumeRingerSwitchToggleStateOffWithPriority:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _sendEvent:8 buttonKind:6 withPriority:a3];
}

- (void)_updateAllButtonEventMasks
{
  for (uint64_t i = 1; i != 11; ++i)
    [(SBHardwareButtonService *)self _updateEventMasksForButtonKind:i];
}

uint64_t __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

- (id)_mutableRegistrationsForButtonKind:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _mutableRegistrationsForButtonKind:a3 createIfNecessary:1];
}

- (id)_registrationsForButtonKind:(int64_t)a3
{
  return [(SBHardwareButtonService *)self _mutableRegistrationsForButtonKind:a3 createIfNecessary:0];
}

- (void)_sendXPCMessageForEvent:(int64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5 toClient:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__SBHardwareButtonService__sendXPCMessageForEvent_buttonKind_priority_toClient___block_invoke;
  v15[3] = &__block_descriptor_56_e33_v16__0__NSObject_OS_xpc_object__8l;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a5;
  id v11 = [MEMORY[0x1E4F62B40] messageWithPacker:v15];
  systemServiceServer = self->_systemServiceServer;
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
  [(FBSServiceFacility *)systemServiceServer sendMessage:v11 withType:0 toClients:v13];

  uint64_t v14 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SBHardwareButtonService _sendXPCMessageForEvent:buttonKind:priority:toClient:]((uint64_t)v10, v14);
  }
}

void __80__SBHardwareButtonService__sendXPCMessageForEvent_buttonKind_priority_toClient___block_invoke(void *a1, void *a2)
{
  int v3 = (const char *)*MEMORY[0x1E4FA7750];
  int64_t v4 = a1[4];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4FA7738], a1[5]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4FA7780], a1[6]);
}

- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5
{
  return [(SBHardwareButtonService *)self _sendEvent:a3 buttonKind:a4 withPriority:a5 continuation:0];
}

- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5 continuation:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = [(SBHardwareButtonService *)self _registrationsForButtonKind:a4];
  id v11 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = NSStringFromSBSHardwareButtonKind();
    *(_DWORD *)buf = 138543618;
    *(void *)v49 = v12;
    *(_WORD *)&v49[8] = 2114;
    *(void *)&v49[10] = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Registrations for kind:%{public}@ %{public}@", buf, 0x16u);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v37 = a4;
    v38 = self;
    v39 = a6;
    uint64_t v15 = *(void *)v45;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v45 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v44 + 1) + 8 * v16);
      long long v18 = [v17 client];
      int64_t v19 = [v17 eventPriority];
      if (v19 >= a5)
      {
        if ([v18 canReceiveEvents])
        {
          long long v21 = [v18 systemServiceClient];
          int v25 = SBLogButtonsInteraction();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v49 = a3;
            *(_WORD *)&v49[4] = 2114;
            *(void *)&v49[6] = v18;
            *(_WORD *)&v49[14] = 2114;
            *(void *)&v49[16] = v17;
            _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Sending event:%d to %{public}@ (%{public}@)", buf, 0x1Cu);
          }

          uint64_t v26 = [v17 eventMask];
          if ((v26 & (1 << a3)) != 0)
          {
            v31 = SBLogButtonsInteraction();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v49 = a3;
              _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, "Sending %d", buf, 8u);
            }

            v32 = v38;
            [(SBHardwareButtonService *)v38 _sendXPCMessageForEvent:a3 buttonKind:v37 priority:a5 toClient:v21];
            v33 = v39;
            if (v39)
            {
              id v34 = v43;
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              __int16 v35 = __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke;
              goto LABEL_33;
            }
LABEL_34:

            BOOL v30 = 1;
            goto LABEL_35;
          }
          int v27 = v26;
          v28 = SBLogButtonsInteraction();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if ((v27 & 0x10000) != 0)
          {
            if (v29)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Sending any", buf, 2u);
            }

            v32 = v38;
            [(SBHardwareButtonService *)v38 _sendXPCMessageForEvent:a3 buttonKind:v37 priority:a5 toClient:v21];
            v33 = v39;
            if (v39)
            {
              id v34 = v42;
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              __int16 v35 = __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke_136;
LABEL_33:
              v34[2] = v35;
              v34[3] = &unk_1E6B00950;
              v34[4] = v32;
              v34[5] = v21;
              id *v33 = (id)MEMORY[0x1D948C7A0](v34);
            }
            goto LABEL_34;
          }
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Client doesn't handle this event", buf, 2u);
          }

          goto LABEL_22;
        }
        long long v21 = SBLogButtonsInteraction();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v49 = v18;
          uint64_t v22 = v21;
          int v23 = "Client can't receive events: %{public}@";
          uint32_t v24 = 12;
          goto LABEL_21;
        }
      }
      else
      {
        int v20 = v19;
        long long v21 = SBLogButtonsInteraction();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v49 = v20;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = a5;
          *(_WORD *)&v49[10] = 2114;
          *(void *)&v49[12] = v17;
          uint64_t v22 = v21;
          int v23 = "Registration priority %d < required %d: %{public}@";
          uint32_t v24 = 24;
LABEL_21:
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        }
      }
LABEL_22:

      if (v14 == ++v16)
      {
        uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v14) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  BOOL v30 = 0;
LABEL_35:

  return v30;
}

uint64_t __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _sendXPCMessageForEvent:a2 buttonKind:a3 priority:a4 toClient:*(void *)(a1 + 40)];
}

uint64_t __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke_136(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _sendXPCMessageForEvent:a2 buttonKind:a3 priority:a4 toClient:*(void *)(a1 + 40)];
}

- (void)_removeRegistration:(id)a3 fromClient:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v38 = v6;
    __int16 v39 = 2114;
    id v40 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Registration remove: %{public}@ client:%{public}@", buf, 0x16u);
  }

  uint64_t v9 = [v6 buttonKind];
  uint64_t v26 = self;
  id v10 = [(SBHardwareButtonService *)self _mutableRegistrationsForButtonKind:v9 createIfNecessary:0];
  [v10 removeObject:v6];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = (void *)[v10 copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v17 = [v16 client];

        if (v17 == v7) {
          [v10 removeObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  if (![v10 count]) {
    [(BSMutableIntegerMap *)v26->_registrationsByButtonKind removeObjectForKey:v9];
  }
  long long v18 = [v7 registrations];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int64_t v19 = [v7 registrations];
  int v20 = (void *)[v19 copy];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        int v25 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        if ([v25 buttonKind] == v9)
        {
          [v18 removeObject:v25];
          goto LABEL_24;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  [(SBHardwareButtonService *)v26 _updateEventMasksForButtonKind:v9];
}

- (void)systemServiceServer:(id)a3 clientDidDisconnect:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _performButtonRegistrationChangeAndNotifyObservers:v5];
}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (int)[*(id *)(a1 + 32) pid];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:v2];
  uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 40) + 72) copy];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_3;
  id v10 = &unk_1E6B009A0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v6 = v3;
  [v4 enumerateWithBlock:&v7];

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "removeObjectForKey:", v2, v7, v8, v9, v10);
  [*(id *)(a1 + 40) _reconfigureProcessMonitor];
}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v5, "copy", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 client];
        uint64_t v13 = *(void **)(a1 + 32);

        if (v12 == v13) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 40) _updateEventMasksForButtonKind:a2];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestsHIDEvents:(BOOL)a5 token:(id)a6 forButtonKind:(int64_t)a7
{
  id v8 = a4;
  id v11 = a6;
  id v9 = v11;
  id v10 = v8;
  BSDispatchMain();
}

void __92__SBHardwareButtonService_systemServiceServer_client_requestsHIDEvents_token_forButtonKind___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pid];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = [(id)SBApp cameraHardwareButton];
  id v5 = v4;
  if (v3) {
    [v4 addProcessRequestingCameraButton:v2 token:*(void *)(a1 + 40)];
  }
  else {
    [v4 removeProcessRequestingCameraButton:v2];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setHapticType:(int64_t)a5 buttonKind:(int64_t)a6
{
  id v8 = a4;
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  id v14 = 0;
  int v10 = [(FBServiceClientAuthenticator *)serviceClientEventConsumerEntitlement authenticateClient:v8 error:&v14];
  id v11 = v14;
  if (v10)
  {
    if (a6 == 1)
    {
      BSDispatchMain();
    }
    else
    {
      uint64_t v13 = SBLogButtonsInteraction();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:]();
      }
    }
  }
  else
  {
    uint64_t v12 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:](v8);
    }
  }
}

void __79__SBHardwareButtonService_systemServiceServer_client_setHapticType_buttonKind___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp homeHardwareButton];
  [v2 setHapticType:*(void *)(a1 + 32)];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 fetchHapticTypeForButtonKind:(int64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (void (**)(id, void))a6;
  if (!v13)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBHardwareButtonService.m", 732, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];
  }
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  id v21 = 0;
  int v15 = [(FBServiceClientAuthenticator *)serviceClientEventConsumerEntitlement authenticateClient:v12 error:&v21];
  id v16 = v21;
  if (!v15)
  {
    long long v17 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBHardwareButtonService systemServiceServer:client:fetchHapticTypeForButtonKind:completion:](v12);
    }

    goto LABEL_12;
  }
  if (a5 != 1)
  {
    long long v18 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:]();
    }

LABEL_12:
    v13[2](v13, 0);
    goto LABEL_13;
  }
  int v20 = v13;
  BSDispatchMain();

LABEL_13:
}

void __94__SBHardwareButtonService_systemServiceServer_client_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [(id)SBApp homeHardwareButton];
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, [v2 hapticType]);
}

- (void)systemServiceServer:(id)a3 client:(id)a4 acquireAssertionOfType:(int64_t)a5 forReason:(id)a6 withCompletion:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke;
  v26[3] = &unk_1E6AF74C0;
  int64_t v30 = a5;
  id v14 = v12;
  id v27 = v14;
  id v15 = v11;
  id v28 = v15;
  id v16 = v13;
  id v29 = v16;
  long long v17 = (void (**)(void))MEMORY[0x1D948C7A0](v26);
  if (a5) {
    long long v18 = 0;
  }
  else {
    long long v18 = self->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator;
  }
  id v25 = 0;
  int v19 = [(FBServiceClientAuthenticator *)v18 authenticateClient:v15 error:&v25];
  id v20 = v25;
  if (v19)
  {
    v17[2](v17);
  }
  else
  {
    id v21 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      [v15 pid];
      uint32_t v24 = BSProcessDescriptionForPID();
      *(_DWORD *)buf = 138543874;
      long long v32 = v23;
      __int16 v33 = 2112;
      long long v34 = v24;
      __int16 v35 = 2112;
      id v36 = v20;
      _os_log_error_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to acquire hardware button assertion: %@", buf, 0x20u);
    }
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    id v2 = 0;
  }
  else {
    id v2 = @"HomeHardwareButtonHintSuppressionAssertion";
  }
  int v3 = NSString;
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];
  id v6 = [v3 stringWithFormat:@"%@-%@", v5, *(void *)(a1 + 32)];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid"));
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v8 setObject:v2 forSetting:1];
  [v8 setObject:v6 forSetting:2];
  [v8 setObject:v7 forSetting:3];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F668]) initWithInfo:v8 timeout:0 forResponseOnQueue:&__block_literal_global_164 withHandler:0.0];
  objc_initWeak(&location, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_3;
  v12[3] = &unk_1E6AFEA20;
  v13[1] = *(id *)(a1 + 56);
  objc_copyWeak(v13, &location);
  [v9 setInvalidationHandler:v12];
  id v10 = v9;
  id v11 = *(id *)(a1 + 48);
  BSDispatchMain();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_3(uint64_t a1)
{
  v1[1] = *(id *)(a1 + 40);
  objc_copyWeak(v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(v1);
}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_4(uint64_t a1)
{
  if (!*(void *)(a1 + 40))
  {
    id v3 = [(id)SBApp homeHardwareButton];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [v3 removeHintSuppressionAssertion:WeakRetained];
  }
}

uint64_t __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_5(void *a1)
{
  if (!a1[6])
  {
    id v2 = [(id)SBApp homeHardwareButton];
    [v2 addHintSuppressionAssertion:a1[4]];
  }
  id v3 = *(uint64_t (**)(void))(a1[5] + 16);
  return v3();
}

- (BOOL)_hwButtonHintViewsSupported
{
  id v2 = +[SBPlatformController sharedInstance];
  if ([v2 deviceSupportsHWButtonBezelEffects])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v3 = [v4 BOOLForKey:@"SBHardwareButtonHintDropletsEnabled"];
  }
  return v3;
}

- (BOOL)systemServiceServer:(id)a3 getHintViewsSupportedForClient:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  id v15 = 0;
  int v7 = [(FBServiceClientAuthenticator *)serviceClientHintViewEntitlement authenticateClient:v5 error:&v15];
  id v8 = v15;
  if (v7)
  {
    BOOL v9 = [(SBHardwareButtonService *)self _hwButtonHintViewsSupported];
  }
  else
  {
    id v10 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      [v5 pid];
      id v14 = BSProcessDescriptionForPID();
      *(_DWORD *)buf = 138543874;
      long long v17 = v13;
      __int16 v18 = 2112;
      int v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to query hardware button service: %@", buf, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)systemServiceServer:(id)a3 client:(id)a4 registerAssociatedHintViewContextId:(unsigned int)a5 renderId:(unint64_t)a6 size:(CGSize)a7 buttonKind:(int64_t)a8 clientPort:(id)a9
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a9;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  id v24 = 0;
  int v14 = [(FBServiceClientAuthenticator *)serviceClientHintViewEntitlement authenticateClient:v11 error:&v24];
  id v15 = v24;
  if (!v14)
  {
    long long v17 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      [v11 pid];
      id v21 = BSProcessDescriptionForPID();
      uint64_t v22 = NSStringFromSBSHardwareButtonKind();
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = v21;
      __int16 v29 = 2114;
      int64_t v30 = v22;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_error_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to add hint view to %{public}@ button: %@", buf, 0x2Au);
    }
    goto LABEL_7;
  }
  if (![(SBHardwareButtonService *)self _hwButtonHintViewsSupported])
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  id v23 = v12;
  BSDispatchMain();

  BOOL v16 = 1;
LABEL_8:

  return v16;
}

void __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43298]), "initWithFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  char v3 = [v2 portalLayer];
  [v3 setSourceContextId:*(unsigned int *)(a1 + 80)];

  uint64_t v4 = [v2 portalLayer];
  [v4 setSourceLayerRenderId:*(void *)(a1 + 64)];

  [v2 setHidesSourceView:1];
  [v2 setMatchesAlpha:1];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) hardwareButtonBezelEffectsCoordinator];
  id v6 = [v5 associateHintView:v2 withButton:*(void *)(a1 + 72)];

  int v7 = (void *)MEMORY[0x1E4F4F7E0];
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_2;
  v10[3] = &unk_1E6AF4AC0;
  id v11 = v6;
  id v9 = v6;
  [v7 monitorSendRight:v8 withHandler:v10];
}

void __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 updateHintContentVisibility:(int64_t)a5 forButton:(int64_t)a6 animationSettings:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a7;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  id v21 = 0;
  int v13 = [(FBServiceClientAuthenticator *)serviceClientHintViewEntitlement authenticateClient:v10 error:&v21];
  id v14 = v21;
  if (v13)
  {
    id v20 = v11;
    BSDispatchMain();
  }
  else
  {
    id v15 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      [v10 pid];
      __int16 v18 = BSProcessDescriptionForPID();
      int v19 = NSStringFromSBSHardwareButtonKind();
      *(_DWORD *)buf = 138544386;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      __int16 v28 = 2114;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_error_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to update hint content appearance state to %ld for %{public}@ button: %@", buf, 0x34u);
    }
  }
}

void __110__SBHardwareButtonService_systemServiceServer_client_updateHintContentVisibility_forButton_animationSettings___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hwButtonHintViewsSupported])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 64) hardwareButtonBezelEffectsCoordinator];
    [v2 updateHintContentVisibility:*(void *)(a1 + 48) forButton:*(void *)(a1 + 56) animationSettings:*(void *)(a1 + 40)];
  }
}

- (BOOL)systemServiceServer:(id)a3 client:(id)a4 requestSystemGlowEffectWithInitialStyle:(int64_t)a5 clientPort:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  id v21 = 0;
  int v11 = [(FBServiceClientAuthenticator *)serviceClientHintViewEntitlement authenticateClient:v8 error:&v21];
  id v12 = v21;
  if (!v11)
  {
    id v14 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      [v8 pid];
      __int16 v18 = BSProcessDescriptionForPID();
      int v19 = NSStringFromSBSHardwareButtonSystemGlowStyle();
      *(_DWORD *)buf = 138544130;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2114;
      int64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_error_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to add system glow effect to %{public}@ buttons: %@", buf, 0x2Au);
    }
    goto LABEL_7;
  }
  if (![(SBHardwareButtonService *)self _hwButtonHintViewsSupported])
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  id v20 = v9;
  BSDispatchMain();

  BOOL v13 = 1;
LABEL_8:

  return v13;
}

void __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 64) hardwareButtonBezelEffectsCoordinator];
  char v3 = [v2 requestSystemGlowEffectWithInitialStyle:a1[6] reason:@"HardwareButtonService request"];

  uint64_t v4 = (void *)MEMORY[0x1E4F4F7E0];
  uint64_t v5 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_2;
  v7[3] = &unk_1E6AF4AC0;
  id v8 = v3;
  id v6 = v3;
  [v4 monitorSendRight:v5 withHandler:v7];
}

void __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 updateSystemGlowStyle:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  id v15 = 0;
  int v8 = [(FBServiceClientAuthenticator *)serviceClientHintViewEntitlement authenticateClient:v6 error:&v15];
  id v9 = v15;
  if (v8)
  {
    BSDispatchMain();
  }
  else
  {
    id v10 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      [v6 pid];
      BOOL v13 = BSProcessDescriptionForPID();
      id v14 = NSStringFromSBSHardwareButtonSystemGlowStyle();
      *(_DWORD *)buf = 138544130;
      long long v17 = v12;
      __int16 v18 = 2112;
      int v19 = v13;
      __int16 v20 = 2114;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to update system glow effect to %{public}@: %@", buf, 0x2Au);
    }
  }
}

void __76__SBHardwareButtonService_systemServiceServer_client_updateSystemGlowStyle___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hwButtonHintViewsSupported])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 64) hardwareButtonBezelEffectsCoordinator];
    [v2 updateSystemGlowStyle:*(void *)(a1 + 40)];
  }
}

- (SBWindowScene)mainWindowScene
{
  return self->_mainWindowScene;
}

- (void)setMainWindowScene:(id)a3
{
}

- (BSMutableIntegerMap)registrationsByButtonKind
{
  return self->_registrationsByButtonKind;
}

- (void)setRegistrationsByButtonKind:(id)a3
{
}

- (BSMutableIntegerMap)clientsByPID
{
  return self->_clientsByPID;
}

- (void)setClientsByPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsByPID, 0);
  objc_storeStrong((id *)&self->_registrationsByButtonKind, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_eventMaskPerKind, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_serviceClientHintViewEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceClientEventConsumerEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_systemServiceServer, 0);
}

- (void)_sendXPCMessageForEvent:(uint64_t)a1 buttonKind:(NSObject *)a2 priority:toClient:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "XPC send to client:%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)systemServiceServer:(void *)a1 client:setEventMask:buttonKind:priority:.cold.1(void *a1)
{
  [a1 pid];
  id v1 = BSProcessDescriptionForPID();
  int v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_12(&dword_1D85BA000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemServiceServer:client:setHapticType:buttonKind:.cold.1()
{
  id v0 = NSStringFromSBSHardwareButtonKind();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "Button not supported for haptics:%{public}@", v3, v4, v5, v6, 2u);
}

- (void)systemServiceServer:(void *)a1 client:setHapticType:buttonKind:.cold.2(void *a1)
{
  [a1 pid];
  uint64_t v1 = BSProcessDescriptionForPID();
  uint64_t v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_12(&dword_1D85BA000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemServiceServer:(void *)a1 client:fetchHapticTypeForButtonKind:completion:.cold.2(void *a1)
{
  [a1 pid];
  uint64_t v1 = BSProcessDescriptionForPID();
  uint64_t v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_12(&dword_1D85BA000, v3, v4, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

@end