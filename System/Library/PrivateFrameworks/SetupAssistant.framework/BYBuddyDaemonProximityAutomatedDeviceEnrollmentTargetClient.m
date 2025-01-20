@interface BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient
+ (id)clientInterface;
- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)init;
- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol)delegate;
- (NSXPCConnection)daemonConnection;
- (OS_dispatch_queue)connectionQueue;
- (id)connectionToMachService:(id)a3;
- (void)activateUsingWiFiWithCompletion:(id)a3;
- (void)beginAdvertisingProximityAutomatedDeviceEnrollment;
- (void)configuratorPairingSuccessfulWithViewModel:(id)a3;
- (void)dismissProximityPinCodeWithError:(id)a3;
- (void)displayProximityPinCode:(id)a3;
- (void)displayShutdownUI;
- (void)endAdvertisingProximityAutomatedDeviceEnrollment;
- (void)enrollmentCompleteWithViewModel:(id)a3;
- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3;
- (void)fetchActivationStateWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shutdown;
@end

@implementation BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient;
  v2 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)&v14 init];
  if (v2)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v3 = (void *)getDMTEnrollmentStatusViewModelClass_softClass;
    uint64_t v23 = getDMTEnrollmentStatusViewModelClass_softClass;
    if (!getDMTEnrollmentStatusViewModelClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getDMTEnrollmentStatusViewModelClass_block_invoke;
      v18 = &unk_1E5D2B9E8;
      v19 = &v20;
      __getDMTEnrollmentStatusViewModelClass_block_invoke((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v20, 8);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v5 = (void *)getDMTEnrollmentCompletionViewModelClass_softClass;
    uint64_t v23 = getDMTEnrollmentCompletionViewModelClass_softClass;
    if (!getDMTEnrollmentCompletionViewModelClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getDMTEnrollmentCompletionViewModelClass_block_invoke;
      v18 = &unk_1E5D2B9E8;
      v19 = &v20;
      __getDMTEnrollmentCompletionViewModelClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v21[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v20, 8);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)v2 connectionToMachService:@"com.apple.purplebuddy.budd.proximityautomateddeviceenrollment.target.xpc"];
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v11;

    [(NSXPCConnection *)v2->_daemonConnection resume];
  }
  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE4F8B0];
}

- (id)connectionToMachService:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:0];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5A840];
  [v5 setRemoteObjectInterface:v6];

  [v5 setExportedObject:self];
  v7 = [(id)objc_opt_class() clientInterface];
  [v5 setExportedInterface:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke;
  v13[3] = &unk_1E5D2BA60;
  id v8 = v4;
  id v14 = v8;
  [v5 setInvalidationHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke_65;
  v11[3] = &unk_1E5D2BA60;
  id v12 = v8;
  id v9 = v8;
  [v5 setInterruptionHandler:v11];

  return v5;
}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_connectionToMachService___block_invoke_65(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ interrupted", (uint8_t *)&v4, 0xCu);
  }
}

- (void)beginAdvertisingProximityAutomatedDeviceEnrollment
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_beginAdvertisingProximityAutomatedDeviceEnrollment__block_invoke;
  v4[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __113__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_beginAdvertisingProximityAutomatedDeviceEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained daemonConnection];
  v2 = [v1 remoteObjectProxy];
  [v2 beginAdvertisingProximityAutomatedDeviceEnrollment];
}

- (void)endAdvertisingProximityAutomatedDeviceEnrollment
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_endAdvertisingProximityAutomatedDeviceEnrollment__block_invoke;
  v4[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __111__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_endAdvertisingProximityAutomatedDeviceEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained daemonConnection];
  v2 = [v1 remoteObjectProxy];
  [v2 endAdvertisingProximityAutomatedDeviceEnrollment];
}

- (void)shutdown
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_shutdown__block_invoke;
  v4[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_shutdown__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained daemonConnection];
  v2 = [v1 remoteObjectProxy];
  [v2 shutdown];
}

- (void)displayProximityPinCode:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayProximityPinCode___block_invoke;
  v10[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __87__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayProximityPinCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 displayProximityPinCode:*(void *)(a1 + 32)];
}

- (void)dismissProximityPinCodeWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_dismissProximityPinCodeWithError___block_invoke;
  v10[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __96__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_dismissProximityPinCodeWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 dismissProximityPinCodeWithError:*(void *)(a1 + 32)];
}

- (void)configuratorPairingSuccessfulWithViewModel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_configuratorPairingSuccessfulWithViewModel___block_invoke;
  v10[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __106__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_configuratorPairingSuccessfulWithViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 configuratorPairingSuccessfulWithViewModel:*(void *)(a1 + 32)];
}

- (void)enrollmentHasStatusUpdateWithViewModel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentHasStatusUpdateWithViewModel___block_invoke;
  v10[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __102__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentHasStatusUpdateWithViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 enrollmentHasStatusUpdateWithViewModel:*(void *)(a1 + 32)];
}

- (void)fetchActivationStateWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_fetchActivationStateWithCompletion___block_invoke;
  v10[3] = &unk_1E5D2BAD8;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __98__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_fetchActivationStateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 fetchActivationStateWithCompletion:*(void *)(a1 + 32)];
}

- (void)activateUsingWiFiWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_activateUsingWiFiWithCompletion___block_invoke;
  v9[3] = &unk_1E5D2BAD8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_activateUsingWiFiWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 activateUsingWiFiWithCompletion:*(void *)(a1 + 32)];
}

- (void)enrollmentCompleteWithViewModel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentCompleteWithViewModel___block_invoke;
  v9[3] = &unk_1E5D2BAB0;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __95__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_enrollmentCompleteWithViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 enrollmentCompleteWithViewModel:*(void *)(a1 + 32)];
}

- (void)displayShutdownUI
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v6 = [(BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayShutdownUI__block_invoke;
  block[3] = &unk_1E5D2BA88;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __80__BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetClient_displayShutdownUI__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 displayShutdownUI];
}

- (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYBuddyDaemonProximityAutomatedDeviceEnrollmentTargetProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end