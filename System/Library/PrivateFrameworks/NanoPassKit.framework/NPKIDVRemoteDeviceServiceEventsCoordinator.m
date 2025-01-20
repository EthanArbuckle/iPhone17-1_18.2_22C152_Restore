@interface NPKIDVRemoteDeviceServiceEventsCoordinator
- (NPKIDVRemoteDeviceServiceEventsCoordinator)init;
- (NSString)remoteDeviceID;
- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4;
- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4;
- (void)_insideLockPersistServiceContext;
- (void)_insideLockSetupBiometricAuthenticationTokenReminderForDeviceID:(id)a3 serviceNames:(id)a4;
- (void)_insideLockTeardownBiometricAuthenticationTokenReminderForDeviceID:(id)a3;
- (void)_notifyProcessWithServiceNames:(id)a3 deviceEvent:(unint64_t)a4 forDeviceID:(id)a5;
- (void)handlePassDeletionForPass:(id)a3;
- (void)initializeWithDevice:(id)a3;
- (void)insideLockTeardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3;
- (void)setNeedsPrearmCredential:(BOOL)a3;
- (void)teardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3;
@end

@implementation NPKIDVRemoteDeviceServiceEventsCoordinator

- (NPKIDVRemoteDeviceServiceEventsCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceServiceEventsCoordinator;
  v2 = [(NPKIDVRemoteDeviceServiceEventsCoordinator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_serviceContextLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoPassKit.RemoteDeviceServiceEventsCoordinator.remoteNotification", 0);
    remoteProcessNotificationQueue = v3->_remoteProcessNotificationQueue;
    v3->_remoteProcessNotificationQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoPassKit.RemoteDeviceServiceEventsCoordinator.lockStatus", 0);
    lockStatusChangeCoordinatorQueue = v3->_lockStatusChangeCoordinatorQueue;
    v3->_lockStatusChangeCoordinatorQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (NSString)remoteDeviceID
{
  p_serviceContextLock = &self->_serviceContextLock;
  os_unfair_lock_lock(&self->_serviceContextLock);
  dispatch_queue_t v4 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext remoteDeviceID];
  os_unfair_lock_unlock(p_serviceContextLock);
  if (!v4)
  {
    v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v9 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized", v9, 2u);
      }
    }
  }
  return (NSString *)v4;
}

- (void)teardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested tear down service context with reason:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (a3) {
    uint64_t v9 = 4 * (a3 == 1);
  }
  else {
    uint64_t v9 = 2;
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  v10 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext remoteDeviceID];
  v11 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext serviceNamesForEvent:v9];
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self insideLockTeardownCurrentRemoteDeviceContextWithReason:a3];
  os_unfair_lock_unlock(&self->_serviceContextLock);
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _notifyProcessWithServiceNames:v11 deviceEvent:v9 forDeviceID:v10];
}

- (void)insideLockTeardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  serviceContext = self->_serviceContext;
  if (serviceContext)
  {
    BOOL v6 = [(NPKIDVRemoteDeviceServiceContext *)serviceContext remoteDeviceID];
    v7 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext serviceNamesForEvent:4];
    v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_serviceContext;
        serviceContextPath = self->_serviceContextPath;
        v13 = NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
        int v21 = 138413058;
        v22 = v11;
        __int16 v23 = 2112;
        v24 = serviceContextPath;
        __int16 v25 = 2112;
        v26 = v6;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will tear down service context:%@ at path:%@ for deviceID:%@ reason:%@", (uint8_t *)&v21, 0x2Au);
      }
    }
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockPersistServiceContext];
    uint64_t v14 = self->_serviceContext;
    self->_serviceContext = 0;

    v15 = self->_serviceContextPath;
    self->_serviceContextPath = 0;

    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        int v21 = 138412546;
        v22 = v6;
        __int16 v23 = 2112;
        v24 = v19;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did tear down service context for deviceID:%@ reason:%@", (uint8_t *)&v21, 0x16u);
      }
    }
    if (a3) {
      uint64_t v20 = 4 * (a3 == 1);
    }
    else {
      uint64_t v20 = 2;
    }
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockTeardownBiometricAuthenticationTokenReminderForDeviceID:v6];
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _notifyProcessWithServiceNames:v7 deviceEvent:v20 forDeviceID:v6];
  }
}

- (void)initializeWithDevice:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested initialize service context for device with ParingID:%@", buf, 0xCu);
    }
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  if (self->_serviceContext)
  {
    BOOL v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext remoteDeviceID];
        *(_DWORD *)buf = 138412290;
        v45 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: It seem we didn't teardown deviceID:%@. Lets make sure we start from a clean state", buf, 0xCu);
      }
    }
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self insideLockTeardownCurrentRemoteDeviceContextWithReason:0];
    serviceContext = self->_serviceContext;
    self->_serviceContext = 0;
  }
  uint64_t v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v15)
    {
      v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v5;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will initialize context for device with ParingID:%@", buf, 0xCu);
      }
    }
    BOOL v17 = NPKHomeDirectoryPathForDevice(v4);
    v18 = [v17 stringByAppendingPathComponent:@"remoteDeviceServiceContext.npkctx"];
    serviceContextPath = self->_serviceContextPath;
    self->_serviceContextPath = v18;

    uint64_t v20 = self->_serviceContextPath;
    id v43 = 0;
    int v21 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v20 options:1 error:&v43];
    v22 = v43;
    if (v22)
    {
      __int16 v23 = pk_Payment_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (!v24)
      {
LABEL_26:
        v31 = self->_serviceContext;
        if (!v31)
        {
          v32 = pk_Payment_log();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

          if (v33)
          {
            v34 = pk_Payment_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = self->_serviceContextPath;
              *(_DWORD *)buf = 138412290;
              v45 = (NPKIDVRemoteDeviceServiceContext *)v35;
              _os_log_impl(&dword_21E92F000, v34, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: NPKIDVRemoteDeviceServiceContext from:%@ was nil.", buf, 0xCu);
            }
          }
          v36 = objc_alloc_init(NPKIDVRemoteDeviceServiceContext);
          v37 = self->_serviceContext;
          self->_serviceContext = v36;

          [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockPersistServiceContext];
          v31 = self->_serviceContext;
        }
        v28 = [(NPKIDVRemoteDeviceServiceContext *)v31 remoteDeviceID];
        v38 = pk_Payment_log();
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

        if (v39)
        {
          v40 = pk_Payment_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = self->_serviceContext;
            v42 = self->_serviceContextPath;
            *(_DWORD *)buf = 138413058;
            v45 = v41;
            __int16 v46 = 2112;
            v47 = v42;
            __int16 v48 = 2112;
            v49 = v5;
            __int16 v50 = 2112;
            v51 = v28;
            _os_log_impl(&dword_21E92F000, v40, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: initialized context:%@ at path:%@ for device with ParingID:%@ and deviceID:%@", buf, 0x2Au);
          }
        }
        __int16 v27 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext serviceNamesForEvent:1];

        goto LABEL_37;
      }
      p_super = pk_Payment_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_serviceContextPath;
        *(_DWORD *)buf = 138412546;
        v45 = (NPKIDVRemoteDeviceServiceContext *)v22;
        __int16 v46 = 2112;
        v47 = v26;
        _os_log_impl(&dword_21E92F000, p_super, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: NPKIDVRemoteDeviceServiceContext error:%@ loading context from:%@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v29 = objc_opt_class();
      NPKSecureUnarchiveObject(v21, v29);
      v30 = (NPKIDVRemoteDeviceServiceContext *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_serviceContext->super;
      self->_serviceContext = v30;
    }

    goto LABEL_26;
  }
  if (!v15)
  {
    __int16 v27 = 0;
    v28 = 0;
    goto LABEL_38;
  }
  v22 = pk_Payment_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: No active device is found, this could be ok but we let you know just in case", buf, 2u);
  }
  __int16 v27 = 0;
  v28 = 0;
LABEL_37:

LABEL_38:
  os_unfair_lock_unlock(&self->_serviceContextLock);
  if ([v27 count] && objc_msgSend(v28, "length")) {
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _notifyProcessWithServiceNames:v27 deviceEvent:1 forDeviceID:v28];
  }
}

- (void)setNeedsPrearmCredential:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3) {
    unint64_t v5 = 8;
  }
  else {
    unint64_t v5 = 16;
  }
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v5);
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested notify %@", (uint8_t *)&v12, 0xCu);
    }
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  BOOL v10 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext remoteDeviceID];
  v11 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext serviceNamesForEvent:v5];
  if (v3) {
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockSetupBiometricAuthenticationTokenReminderForDeviceID:v10 serviceNames:v11];
  }
  else {
    [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockTeardownBiometricAuthenticationTokenReminderForDeviceID:v10];
  }
  os_unfair_lock_unlock(&self->_serviceContextLock);
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _notifyProcessWithServiceNames:v11 deviceEvent:v5 forDeviceID:v10];
}

- (void)handlePassDeletionForPass:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(0x20uLL);
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested notify %@", (uint8_t *)&v10, 0xCu);
    }
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  v8 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext remoteDeviceID];
  BOOL v9 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext serviceNamesForEvent:32];
  os_unfair_lock_unlock(&self->_serviceContextLock);
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _notifyProcessWithServiceNames:v9 deviceEvent:32 forDeviceID:v8];
}

- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      int v19 = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested register events:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);
    }
  }
  if (!self->_serviceContext)
  {
    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v17)
    {
      unint64_t v11 = 0xFFFFFFFF80000000;
      goto LABEL_15;
    }
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized, we can't register requested events", (uint8_t *)&v19, 2u);
    }
    unint64_t v11 = 0xFFFFFFFF80000000;
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  unint64_t v11 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext registerEvents:a3 forServiceName:v6];
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockPersistServiceContext];
  os_unfair_lock_unlock(&self->_serviceContextLock);
  uint64_t v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v11);
      int v19 = 138412546;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish register events with currentEvents:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);
    }
LABEL_13:
  }
LABEL_15:

  return v11;
}

- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      int v19 = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested unregister events:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);
    }
  }
  if (!self->_serviceContext)
  {
    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v17)
    {
      unint64_t v11 = 0xFFFFFFFF80000000;
      goto LABEL_15;
    }
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized, we can't unregister requested events", (uint8_t *)&v19, 2u);
    }
    unint64_t v11 = 0xFFFFFFFF80000000;
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  unint64_t v11 = [(NPKIDVRemoteDeviceServiceContext *)self->_serviceContext unregisterEvents:a3 forServiceName:v6];
  [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self _insideLockPersistServiceContext];
  os_unfair_lock_unlock(&self->_serviceContextLock);
  uint64_t v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v11);
      int v19 = 138412546;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish unregister events with currentEvents:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);
    }
LABEL_13:
  }
LABEL_15:

  return v11;
}

- (void)_notifyProcessWithServiceNames:(id)a3 deviceEvent:(unint64_t)a4 forDeviceID:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  unint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (v12)
    {
      BOOL v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a4);
        *(_DWORD *)buf = 138412802;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v14;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Found remote process with service Names:%@ event:%@ for deviceID:%@", buf, 0x20u);
      }
    }
    remoteProcessNotificationQueue = self->_remoteProcessNotificationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke;
    block[3] = &unk_2644D3288;
    int v19 = v8;
    unint64_t v21 = a4;
    id v20 = v9;
    dispatch_async(remoteProcessNotificationQueue, block);

    v16 = v19;
  }
  else
  {
    if (!v12) {
      goto LABEL_8;
    }
    v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a4);
      *(_DWORD *)buf = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: No service names to notify event:%@ for device with ID:%@", buf, 0x16u);
    }
  }

LABEL_8:
}

void __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke_2;
  v3[3] = &unk_2644D59E0;
  v2 = (void *)a1[4];
  v1 = (void *)a1[5];
  uint64_t v5 = a1[6];
  id v4 = v1;
  [v2 enumerateObjectsUsingBlock:v3];
}

void __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[NPKIDVRemoteDeviceServiceClient alloc] initWithRemoteServiceName:v3];

  [(NPKIDVRemoteDeviceServiceClient *)v4 didReceiveEvent:*(void *)(a1 + 40) fromRemoteDeviceWithID:*(void *)(a1 + 32)];
}

- (void)_insideLockPersistServiceContext
{
  os_unfair_lock_assert_owner(&self->_serviceContextLock);
  NPKSecureArchiveObject(self->_serviceContext);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 writeToFile:self->_serviceContextPath atomically:1];
}

- (void)_insideLockSetupBiometricAuthenticationTokenReminderForDeviceID:(id)a3 serviceNames:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Setup biometric authentication token reminder for deviceID:%@", buf, 0xCu);
    }
  }
  unint64_t v11 = [[NPKLockStatusChangeCoordinator alloc] initWithQueue:self->_lockStatusChangeCoordinatorQueue];
  [(NPKLockStatusChangeCoordinator *)v11 setWipeBlocksAfterPerform:0];
  objc_initWeak((id *)buf, v11);
  objc_initWeak(&location, self);
  lockStatusChangeCoordinatorQueue = self->_lockStatusChangeCoordinatorQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __123__NPKIDVRemoteDeviceServiceEventsCoordinator__insideLockSetupBiometricAuthenticationTokenReminderForDeviceID_serviceNames___block_invoke;
  v18[3] = &unk_2644D5A30;
  BOOL v13 = v11;
  int v19 = v13;
  objc_copyWeak(&v22, (id *)buf);
  objc_copyWeak(&v23, &location);
  id v20 = v7;
  id v21 = v6;
  id v14 = v6;
  id v15 = v7;
  dispatch_async(lockStatusChangeCoordinatorQueue, v18);
  lockStatusChangeCoordinator = self->_lockStatusChangeCoordinator;
  self->_lockStatusChangeCoordinator = v13;
  BOOL v17 = v13;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __123__NPKIDVRemoteDeviceServiceEventsCoordinator__insideLockSetupBiometricAuthenticationTokenReminderForDeviceID_serviceNames___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __123__NPKIDVRemoteDeviceServiceEventsCoordinator__insideLockSetupBiometricAuthenticationTokenReminderForDeviceID_serviceNames___block_invoke_2;
  v3[3] = &unk_2644D5A08;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_copyWeak(&v7, (id *)(a1 + 64));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performSubjectToEvent:1 blockToPerform:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
}

void __123__NPKIDVRemoteDeviceServiceEventsCoordinator__insideLockSetupBiometricAuthenticationTokenReminderForDeviceID_serviceNames___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Reminder: remote device Needs biometric authentication token", v8, 2u);
      }
    }
    [v4 _notifyProcessWithServiceNames:*(void *)(a1 + 32) deviceEvent:8 forDeviceID:*(void *)(a1 + 40)];
  }
}

- (void)_insideLockTeardownBiometricAuthenticationTokenReminderForDeviceID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: tear down biometric authentication token reminder for deviceID:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  lockStatusChangeCoordinator = self->_lockStatusChangeCoordinator;
  self->_lockStatusChangeCoordinator = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStatusChangeCoordinatorQueue, 0);
  objc_storeStrong((id *)&self->_lockStatusChangeCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteProcessNotificationQueue, 0);
  objc_storeStrong((id *)&self->_serviceContextPath, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end