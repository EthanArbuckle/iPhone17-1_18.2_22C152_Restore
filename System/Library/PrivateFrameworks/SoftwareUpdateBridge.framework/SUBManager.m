@interface SUBManager
- (OS_dispatch_queue)queue;
- (OS_xpc_object)serverConnection;
- (SUBManager)initWithDelegate:(id)a3;
- (SUBManagerDelegate)delegate;
- (id)_serverConnection;
- (void)_forwardDownloadProgress:(id)a3;
- (void)_forwardInstallResult:(id)a3;
- (void)_forwardInstallationAwaitingUserInteraction:(id)a3;
- (void)_forwardInstallationCanProceed:(id)a3;
- (void)_forwardInstallationWillProceed:(id)a3;
- (void)_forwardScanResult:(id)a3;
- (void)_forwardUserDidAcceptTermsAndConditionsChanged:(id)a3;
- (void)_forwardUserInstallRequestTypeChanged:(id)a3;
- (void)dealloc;
- (void)getCloudDescriptors:(id)a3;
- (void)installUpdate:(id)a3;
- (void)installUpdate:(id)a3 passcode:(id)a4;
- (void)managerState:(id)a3;
- (void)performMigration;
- (void)purgeUpdate:(id)a3 completion:(id)a4;
- (void)removeCloudDescriptor:(id)a3;
- (void)scanForUpdates;
- (void)sendTermsRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setUserInstallRequestTypeForUpdate:(id)a3 userInstallRequestType:(int64_t)a4 completion:(id)a5;
- (void)startDownload:(id)a3;
- (void)startDownload:(id)a3 passcode:(id)a4;
- (void)supportsInstallTonightWithCompletion:(id)a3;
- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3;
- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3 completion:(id)a4;
@end

@implementation SUBManager

- (SUBManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUBManager;
  v5 = [(SUBManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SUBManager.ipc", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    id v10 = [(SUBManager *)v6 _serverConnection];
  }

  return v6;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C27B000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc SUManager", buf, 2u);
  }
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    xpc_connection_cancel(serverConnection);
  }
  v5.receiver = self;
  v5.super_class = (Class)SUBManager;
  [(SUBManager *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__SUBManager_setDelegate___block_invoke;
  v7[3] = &unk_264E3BF78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

id __26__SUBManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (SUBManagerDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__SUBManager_delegate__block_invoke;
  v5[3] = &unk_264E3BFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUBManagerDelegate *)v3;
}

uint64_t __22__SUBManager_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  return MEMORY[0x270F9A758]();
}

- (id)_serverConnection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUBManager__serverConnection__block_invoke;
  v5[3] = &unk_264E3BFF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SUBManager__serverConnection__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service(SUBMachServiceName, 0, 2uLL);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), mach_service);
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 24);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __31__SUBManager__serverConnection__block_invoke_2;
    v9[3] = &unk_264E3BFC8;
    objc_copyWeak(&v12, &location);
    objc_super v5 = mach_service;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = v5;
    uint64_t v11 = v6;
    xpc_connection_set_event_handler(v4, v9);
    xpc_connection_activate(*(xpc_connection_t *)(*(void *)(a1 + 32) + 24));
    v7 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v8;
      _os_log_impl(&dword_23C27B000, v7, OS_LOG_TYPE_DEFAULT, "activated server connection: %p", buf, 0xCu);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __31__SUBManager__serverConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = MEMORY[0x23ECDFBB0](v3);
    if (v5 == MEMORY[0x263EF8720])
    {
      id v10 = (void *)softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(const char **)(a1 + 32);
        id v12 = (const char *)*MEMORY[0x263EF86B0];
        v13 = v10;
        *(_DWORD *)buf = 134218242;
        v22 = v11;
        __int16 v23 = 2082;
        string = xpc_dictionary_get_string(v3, v12);
        _os_log_impl(&dword_23C27B000, v13, OS_LOG_TYPE_DEFAULT, "XPC error on server connection (%p): %{public}s", buf, 0x16u);
      }
      if (v3 == (id)MEMORY[0x263EF86A8])
      {
        v14 = [WeakRetained queue];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __31__SUBManager__serverConnection__block_invoke_275;
        v18[3] = &unk_264E3BFA0;
        uint64_t v20 = *(void *)(a1 + 40);
        id v19 = WeakRetained;
        dispatch_async(v14, v18);
      }
    }
    else if (v5 == MEMORY[0x263EF8708])
    {
      uint64_t v15 = xpc_dictionary_get_string(v3, SUBMessageTypeKey);
      if (!strcmp(v15, SUBMessageTypeDownloadProgress))
      {
        [WeakRetained _forwardDownloadProgress:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeScanResult))
      {
        [WeakRetained _forwardScanResult:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeInstallResult))
      {
        [WeakRetained _forwardInstallResult:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeInstallationCanProceed))
      {
        [WeakRetained _forwardInstallationCanProceed:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeInstallationWillProceed))
      {
        [WeakRetained _forwardInstallationWillProceed:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeUserDidAcceptTermsAndConditionsChanged))
      {
        [WeakRetained _forwardUserDidAcceptTermsAndConditionsChanged:v3];
      }
      else if (!strcmp(v15, SUBMessageTypeUserInstallRequestTypeChanged))
      {
        [WeakRetained _forwardUserInstallRequestTypeChanged:v3];
      }
      else if (!strcmp(v15, SUBMessageTypePresentingAlertOnGizmo))
      {
        [WeakRetained _forwardInstallationAwaitingUserInteraction:v3];
      }
      else
      {
        uint64_t v16 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(const char **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 136446466;
          v22 = v15;
          __int16 v23 = 2048;
          string = v17;
          _os_log_impl(&dword_23C27B000, v16, OS_LOG_TYPE_DEFAULT, "unhandled message type %{public}s on server connection %p", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v6 = MEMORY[0x23ECDFAF0](v3);
      if (v6)
      {
        v7 = (char *)v6;
        uint64_t v8 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(const char **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 136446466;
          v22 = v7;
          __int16 v23 = 2048;
          string = v9;
          _os_log_impl(&dword_23C27B000, v8, OS_LOG_TYPE_DEFAULT, "unexpected message %{public}s on connection %p", buf, 0x16u);
        }
        free(v7);
      }
    }
  }
}

uint64_t __31__SUBManager__serverConnection__block_invoke_275(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(a1 + 32);
  return [v2 setServerConnection:0];
}

- (void)_forwardScanResult:(id)a3
{
  id v4 = SUBMessageDescriptorKey;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  SUBIPCDecodeObjectForKey(v5, v4, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = SUBMessageErrorKey;
  uint64_t v8 = objc_opt_class();
  v9 = SUBIPCDecodeObjectForKey(v5, v7, v8);

  id v10 = [(SUBManager *)self delegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 manager:self scanRequestDidLocateUpdate:v11 error:v9];
  }
}

- (void)_forwardDownloadProgress:(id)a3
{
  id v4 = SUBMessageDownloadKey;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  SUBIPCDecodeObjectForKey(v5, v4, v6);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v7 = SUBMessageErrorKey;
  uint64_t v8 = objc_opt_class();
  v9 = SUBIPCDecodeObjectForKey(v5, v7, v8);

  uint64_t v10 = [(SUBManager *)self delegate];
  id v11 = (void *)v10;
  if (v9)
  {
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v11 manager:self didFailDownload:v20 withError:v9];
    }
  }
  else
  {
    id v12 = [v20 progress];
    int v13 = [v12 isDone];

    if (v13)
    {
      if (!v11) {
        goto LABEL_15;
      }
      if (objc_opt_respondsToSelector())
      {
        v14 = [v20 descriptor];
        uint64_t v15 = [v20 descriptor];
        uint64_t v16 = [v15 willProceedWithInstallation];
        v17 = [v20 descriptor];
        objc_msgSend(v11, "manager:installationOfUpdate:willProceed:waitingForAdmissionControl:", self, v14, v16, objc_msgSend(v17, "isAwaitingAdmissionControlForInstallation"));
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_15;
        }
        v14 = [v20 descriptor];
        uint64_t v18 = [v14 willProceedWithInstallation];
        id v19 = [v20 descriptor];
        objc_msgSend(v11, "manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:", self, v20, v18, objc_msgSend(v19, "isAwaitingAdmissionControlForInstallation"));
      }
    }
    else if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v11 manager:self didChangeProgressOnDownload:v20];
    }
  }
LABEL_15:
}

- (void)_forwardInstallResult:(id)a3
{
  id v4 = SUBMessageDescriptorKey;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  SUBIPCDecodeObjectForKey(v5, v4, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = SUBMessageErrorKey;
  uint64_t v8 = objc_opt_class();
  v9 = SUBIPCDecodeObjectForKey(v5, v7, v8);

  uint64_t v10 = [(SUBManager *)self delegate];
  id v11 = (void *)v10;
  if (v9)
  {
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v11 manager:self didFailInstallation:v12 withError:v9];
    }
  }
  else if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v11 manager:self didFinishInstallation:v12];
  }
}

- (void)_forwardInstallationCanProceed:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = [(SUBManager *)self delegate];
  if (v4)
  {
    id v5 = SUBMessageDescriptorKey;
    uint64_t v6 = objc_opt_class();
    v7 = SUBIPCDecodeObjectForKey(xdict, v5, v6);
    int64_t int64 = xpc_dictionary_get_int64(xdict, SUBMessageCanProceedWithInstallationKey);
    if (objc_opt_respondsToSelector())
    {
      [v4 manager:self installationOfUpdate:v7 willProceed:0 waitingForAdmissionControl:int64 == 0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v4 manager:self installationOfUpdate:v7 canProceed:int64 != 0];
    }
  }
}

- (void)_forwardInstallationWillProceed:(id)a3
{
  id v8 = a3;
  id v4 = [(SUBManager *)self delegate];
  if (v4)
  {
    id v5 = SUBMessageDescriptorKey;
    uint64_t v6 = objc_opt_class();
    v7 = SUBIPCDecodeObjectForKey(v8, v5, v6);
    if (objc_opt_respondsToSelector())
    {
      [v4 manager:self installationOfUpdate:v7 willProceed:1 waitingForAdmissionControl:0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v4 manager:self willProceedWithInstallation:v7];
    }
  }
}

- (void)_forwardUserDidAcceptTermsAndConditionsChanged:(id)a3
{
  id v4 = [(SUBManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 managerUserDidAcceptTermsAndConditionsForUpdate:self];
  }
}

- (void)_forwardUserInstallRequestTypeChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(SUBManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = SUBMessageUserInstallRequestTypeKey;
    uint64_t v6 = objc_opt_class();
    v7 = SUBIPCDecodeObjectForKey(v8, v5, v6);
    objc_msgSend(v4, "manager:userInstallRequestTypeDidChange:", self, objc_msgSend(v7, "unsignedIntegerValue"));
  }
}

- (void)_forwardInstallationAwaitingUserInteraction:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = SUBMessageDescriptorKey;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = SUBIPCDecodeObjectForKey(v5, v4, v6);

  id v8 = [(SUBManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = softwareupdatebridge_log;
  BOOL v11 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v12 = 136446210;
      int v13 = SUBMessageTypePresentingAlertOnGizmo;
      _os_log_impl(&dword_23C27B000, v10, OS_LOG_TYPE_DEFAULT, "Delegate found to handle %{public}s notification", (uint8_t *)&v12, 0xCu);
    }
    [v8 manager:self installationAwaitingUserInteraction:v7];
  }
  else if (v11)
  {
    int v12 = 136446210;
    int v13 = SUBMessageTypePresentingAlertOnGizmo;
    _os_log_impl(&dword_23C27B000, v10, OS_LOG_TYPE_DEFAULT, "No delegate currently responds to %{public}s notification", (uint8_t *)&v12, 0xCu);
  }
}

- (void)managerState:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUBMessageTypeKey, SUBMessageTypeQueryManagerState);
  uint64_t v6 = [(SUBManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __27__SUBManager_managerState___block_invoke;
  handler[3] = &unk_264E3C018;
  id v7 = v4;
  id v10 = v7;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);

  if ((atomic_exchange((atomic_uchar *volatile)&self->_hasQueriedStateOnceFlag, 1u) & 1) == 0)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, SUBMessageTypeKey, SUBMessageTypeAddClient);
    xpc_connection_send_message(self->_serverConnection, v8);
  }
}

void __27__SUBManager_managerState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x23ECDFBB0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    int v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error querying manager state", v21, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
    BOOL v11 = @"Error from XPC: %s";
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      uint64_t v14 = SUBMessageDescriptorKey;
      uint64_t v15 = objc_opt_class();
      int v13 = SUBIPCDecodeObjectForKey(v3, v14, v15);
      xpc_dictionary_get_int64(v3, SUBMessageManagerStateKey);
      uint64_t v16 = SUBMessageErrorKey;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SUBIPCDecodeObjectForKey(v3, v16, v17);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      goto LABEL_11;
    }
    xpc_object_t v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "unexpected XPC type querying manager state", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    BOOL v11 = @"Unexpected XPC type";
  }
  int v13 = SUBError(@"SUBError", 2, 0, v11, v6, v7, v8, v9, (uint64_t)string);
  (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v13);
LABEL_11:
}

- (void)scanForUpdates
{
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeScanForUpdates);
  id v3 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v3, message);
}

- (void)startDownload:(id)a3
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeStartDownload);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v4);

  xpc_object_t v5 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v5, message);
}

- (void)startDownload:(id)a3 passcode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeStartDownload);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v7);

  SUBIPCEncodeObject(message, SUBMessagePasscodeKey, v6);
  uint64_t v8 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v8, message);
}

- (void)installUpdate:(id)a3
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeInstallUpdate);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v4);

  xpc_object_t v5 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v5, message);
}

- (void)installUpdate:(id)a3 passcode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeInstallUpdate);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v7);

  SUBIPCEncodeObject(message, SUBMessagePasscodeKey, v6);
  uint64_t v8 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v8, message);
}

- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeUserDidAcceptTermsAndConditions);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v4);
  xpc_object_t v5 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v5, message);

  [v4 setUserDidAcceptTermsAndConditions:1];
}

- (void)getCloudDescriptors:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUBMessageTypeKey, SUBMessageTypeGetCloudDescriptors);
  id v6 = [(SUBManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __34__SUBManager_getCloudDescriptors___block_invoke;
  handler[3] = &unk_264E3C018;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);
}

void __34__SUBManager_getCloudDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (MEMORY[0x23ECDFBB0]() != MEMORY[0x263EF8708] || MEMORY[0x263EF8720] == MEMORY[0x263EF8708])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    xpc_object_t v5 = SUBMessageDescriptorArrayKey;
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = SUBIPCDecodeObjectsForKey(v11, v5, v8);

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    }
  }
}

- (void)removeCloudDescriptor:(id)a3
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypeRemoveCloudDescriptor);
  SUBIPCEncodeObject(message, SUBMessageDescriptorKey, v4);

  xpc_object_t v5 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v5, message);
}

- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if ([v6 userDidAcceptTermsAndConditions])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__SUBManager_userDidAcceptTermsAndConditionsForUpdate_completion___block_invoke;
    v8[3] = &unk_264E3C040;
    id v11 = v7;
    id v9 = v6;
    uint64_t v10 = self;
    [(SUBManager *)self supportsInstallTonightWithCompletion:v8];
  }
}

void __66__SUBManager_userDidAcceptTermsAndConditionsForUpdate_completion___block_invoke(void **a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = a1[6];
    if (v6)
    {
      uint64_t v7 = (void (*)(void))*((void *)v6 + 2);
LABEL_8:
      v7();
    }
  }
  else if (a3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, SUBMessageTypeKey, SUBMessageTypeUserDidAcceptTermsAndConditionsWithReply);
    SUBIPCEncodeObject(v8, SUBMessageDescriptorKey, a1[4]);
    SUBIPCEncodeObject(v8, SUBMessageUserDidAcceptTermsAndConditionsKey, MEMORY[0x263EFFA88]);
    id v9 = [a1[5] _serverConnection];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __66__SUBManager_userDidAcceptTermsAndConditionsForUpdate_completion___block_invoke_2;
    handler[3] = &unk_264E3C018;
    id v12 = a1[6];
    xpc_connection_send_message_with_reply(v9, v8, 0, handler);
  }
  else
  {
    [a1[5] userDidAcceptTermsAndConditionsForUpdate:a1[4]];
    uint64_t v10 = a1[6];
    if (v10)
    {
      uint64_t v7 = (void (*)(void))*((void *)v10 + 2);
      goto LABEL_8;
    }
  }
}

void __66__SUBManager_userDidAcceptTermsAndConditionsForUpdate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x23ECDFBB0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error setting user install request type", v19, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      id v11 = @"Error from XPC: %s";
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      uint64_t v14 = SUBMessageErrorKey;
      uint64_t v15 = objc_opt_class();
      int v13 = SUBIPCDecodeObjectForKey(v3, v14, v15);
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v13);
      }
      goto LABEL_14;
    }
    id v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "Got XPC error setting user install request type", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = @"Unexpected XPC type";
LABEL_11:
      int v13 = SUBError(@"SUBError", 2, 0, v11, v6, v7, v8, v9, (uint64_t)string);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
LABEL_14:
    }
  }
}

- (void)purgeUpdate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, SUBMessageTypeKey, SUBMessageTypePurgeUpdate);
  SUBIPCEncodeObject(v8, SUBMessageDescriptorKey, v7);

  uint64_t v9 = [(SUBManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __37__SUBManager_purgeUpdate_completion___block_invoke;
  handler[3] = &unk_264E3C018;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v9, v8, 0, handler);
}

void __37__SUBManager_purgeUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = SUBMessageErrorKey;
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  SUBIPCDecodeObjectForKey(v4, v3, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (void)setUserInstallRequestTypeForUpdate:(id)a3 userInstallRequestType:(int64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  xpc_object_t v8 = (char *)a3;
  id v9 = a5;
  id v10 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 136446210;
    v21 = SUBStringForUserInstallRequestType(a4);
    _os_log_impl(&dword_23C27B000, v11, OS_LOG_TYPE_DEFAULT, "Request Type: %{public}s", buf, 0xCu);
  }
  id v12 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Descriptor(setUserInstallRequestTypeForUpdate): %{public}@", buf, 0xCu);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__SUBManager_setUserInstallRequestTypeForUpdate_userInstallRequestType_completion___block_invoke;
  v15[3] = &unk_264E3C090;
  id v18 = v9;
  int64_t v19 = a4;
  uint64_t v16 = v8;
  uint64_t v17 = self;
  int v13 = v8;
  id v14 = v9;
  [(SUBManager *)self supportsInstallTonightWithCompletion:v15];
}

void __83__SUBManager_setUserInstallRequestTypeForUpdate_userInstallRequestType_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (!v5)
  {
    if (a3)
    {
      id v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, SUBMessageTypeKey, SUBMessageTypeSetUserInstallRequestType);
      SUBIPCEncodeObject(v7, SUBMessageDescriptorKey, *(void **)(a1 + 32));
      xpc_object_t v8 = SUBMessageUserInstallRequestTypeKey;
      id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
      SUBIPCEncodeObject(v7, v8, v9);

      id v10 = [*(id *)(a1 + 40) _serverConnection];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __83__SUBManager_setUserInstallRequestTypeForUpdate_userInstallRequestType_completion___block_invoke_2;
      v13[3] = &unk_264E3C068;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      id v14 = v11;
      uint64_t v15 = v12;
      xpc_connection_send_message_with_reply(v10, v7, 0, v13);
    }
    else
    {
      if (!*(void *)(a1 + 48)) {
        goto LABEL_9;
      }
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SUBError" code:39 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }

    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v5, *(void *)(a1 + 56));
  }
LABEL_9:
}

void __83__SUBManager_setUserInstallRequestTypeForUpdate_userInstallRequestType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x23ECDFBB0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    uint64_t v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error setting user install request type", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
    id v11 = @"Error from XPC: %s";
    goto LABEL_9;
  }
  if (v4 != MEMORY[0x263EF8708])
  {
    id v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "Got XPC error setting user install request type", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = @"Unexpected XPC type";
LABEL_9:
    int v13 = SUBError(@"SUBError", 2, 0, v11, v6, v7, v8, v9, (uint64_t)string);
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v13, *(void *)(a1 + 40));
    goto LABEL_10;
  }
  id v14 = SUBMessageErrorKey;
  uint64_t v15 = objc_opt_class();
  int v13 = SUBIPCDecodeObjectForKey(v3, v14, v15);
  uint64_t v16 = SUBMessageUserInstallRequestTypeKey;
  uint64_t v17 = objc_opt_class();
  id v18 = SUBIPCDecodeObjectForKey(v3, v16, v17);
  unint64_t v19 = [v18 integerValue];

  id v20 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = SUBStringForUserInstallRequestType(v19);
    _os_log_impl(&dword_23C27B000, v21, OS_LOG_TYPE_DEFAULT, "Decoded request type: %{public}s", buf, 0xCu);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    (*(void (**)(uint64_t, void *, unint64_t))(v22 + 16))(v22, v13, v19);
  }
LABEL_10:
}

- (void)performMigration
{
  xpc_object_t message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUBMessageTypeKey, SUBMessageTypePerformMigration);
  id v3 = [(SUBManager *)self _serverConnection];
  xpc_connection_send_message(v3, message);
}

- (void)supportsInstallTonightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v6 = [v5 getActivePairedDevice];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"79C6122C-6767-4098-9B1E-30DE4D6D0180"];
  int v8 = [v6 supportsCapability:v7];

  if (v8)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, SUBMessageTypeKey, SUBMessageTypeGetSupportsInstallTonight);
    uint64_t v10 = [(SUBManager *)self _serverConnection];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__SUBManager_supportsInstallTonightWithCompletion___block_invoke;
    handler[3] = &unk_264E3C018;
    id v12 = v4;
    xpc_connection_send_message_with_reply(v10, v9, 0, handler);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __51__SUBManager_supportsInstallTonightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x23ECDFBB0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v23 = 0;
      _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error querying install tonight support", v23, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      id v11 = @"Error from XPC: %s";
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      id v14 = SUBMessageErrorKey;
      uint64_t v15 = objc_opt_class();
      int v13 = SUBIPCDecodeObjectForKey(v3, v14, v15);
      uint64_t v16 = SUBMessageSupportsInstallTonightKey;
      uint64_t v17 = objc_opt_class();
      id v18 = SUBIPCDecodeObjectForKey(v3, v16, v17);
      unint64_t v19 = v18;
      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v13, [v18 BOOLValue]);
      }

      goto LABEL_15;
    }
    id v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "Got XPC error querying install tonight support", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = @"Unexpected XPC type";
LABEL_11:
      int v13 = SUBError(@"SUBError", 2, 0, v11, v6, v7, v8, v9, (uint64_t)string);
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v13, 0);
LABEL_15:
    }
  }
}

- (void)sendTermsRequest:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUBMessageTypeKey, SUBMessageTypeSendTermsRequest);
  uint64_t v6 = [(SUBManager *)self _serverConnection];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __31__SUBManager_sendTermsRequest___block_invoke;
  handler[3] = &unk_264E3C018;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);
}

void __31__SUBManager_sendTermsRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x23ECDFBB0]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl(&dword_23C27B000, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error trying to request terms", v19, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      id v11 = @"Error from XPC: %s";
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == MEMORY[0x263EF8708])
    {
      id v14 = SUBMessageErrorKey;
      uint64_t v15 = objc_opt_class();
      int v13 = SUBIPCDecodeObjectForKey(v3, v14, v15);
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v13);
      }
      goto LABEL_14;
    }
    xpc_object_t v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "Got XPC error querying install tonight support", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = @"Unexpected XPC type";
LABEL_11:
      int v13 = SUBError(@"SUBError", 2, 0, v11, v6, v7, v8, v9, (uint64_t)string);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
LABEL_14:
    }
  }
}

- (OS_xpc_object)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end