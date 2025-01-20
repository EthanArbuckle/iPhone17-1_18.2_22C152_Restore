@interface NFSecureTransactionServicesHandoverSession
- (NFSecureTransactionServicesHandoverSessionDelegate)delegate;
- (NFTNEPReaderDelegate)tagReaderDelegate;
- (NFTNEPTagDeviceDelegate)tagDeviceDelegate;
- (id)deselectService;
- (id)restartPolling;
- (id)selectService:(id)a3;
- (id)startTNEPReaderWithDelegate:(id)a3;
- (id)startTNEPTagDeviceWithService:(id)a3 optionalRecords:(id)a4 delegate:(id)a5;
- (void)connectionHandoverProcessCompleted;
- (void)connectionHandoverProcessFailure:(id)a3;
- (void)connectionHandoverTNEPServiceSelected:(id)a3;
- (void)fieldChange:(BOOL)a3;
- (void)fieldNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTagDeviceDelegate:(id)a3;
- (void)setTagReaderDelegate:(id)a3;
- (void)singleResponseCommunicationReaderSend:(id)a3 completionHandler:(id)a4;
- (void)singleResponseCommunicationTagSend:(id)a3 completionHandler:(id)a4;
- (void)startSTSNotificationListenerWithEndpoint:(id)a3;
- (void)staticReaderEngagementDiscovered:(id)a3;
- (void)stopTNEPOperation;
- (void)tnepReaderServicesAborted:(id)a3;
- (void)tnepReaderServicesDiscovered:(id)a3;
- (void)tnepTagDeviceDeselected:(id)a3;
- (void)tnepTagDeviceNDEFMessageReceived:(id)a3;
- (void)tnepTagDeviceReaderDetected;
- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4;
@end

@implementation NFSecureTransactionServicesHandoverSession

- (void)startSTSNotificationListenerWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_19D636000, "startSTSNotificationListenerWithEndpoint:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__NFSecureTransactionServicesHandoverSession_startSTSNotificationListenerWithEndpoint___block_invoke;
  v8[3] = &unk_1E595C648;
  v8[4] = self;
  v8[5] = a2;
  v7 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v8];
  [v7 startSTSNotificationListenerEndpoint:v5];
}

void __87__NFSecureTransactionServicesHandoverSession_startSTSNotificationListenerWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 32, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = 32;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

- (id)startTNEPTagDeviceWithService:(id)a3 optionalRecords:(id)a4 delegate:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v25 = a5;
  v10 = _os_activity_create(&dword_19D636000, "startTNEPTagDeviceWithService:optionalRecords:delegate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v11 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)[objc_alloc(MEMORY[0x1E4FBA868]) initWithNDEFRecord:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__21;
  v31 = __Block_byref_object_dispose__21;
  id v32 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke;
  v27[3] = &unk_1E595C648;
  v27[4] = self;
  v27[5] = a2;
  int v18 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v27];
  id v37 = v8;
  __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v20 = (void *)[v11 copy];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke_14;
  v26[3] = &unk_1E595CF58;
  v26[4] = &state;
  [v18 startTNEPDeviceWithServices:v19 optionalRecords:v20 callback:v26];

  __int16 v21 = *(void **)(state.opaque[1] + 40);
  if (!v21)
  {
    [(NFSecureTransactionServicesHandoverSession *)self setTagDeviceDelegate:v25];
    __int16 v21 = *(void **)(state.opaque[1] + 40);
  }
  id v22 = v21;
  _Block_object_dispose(&state, 8);

  return v22;
}

void __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 81, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 81;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke_14(uint64_t a1, void *a2)
{
}

- (void)singleResponseCommunicationTagSend:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = _os_activity_create(&dword_19D636000, "singleResponseCommunicationTagSend:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FBA860]) initWithNDEFMessage:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke;
  v15[3] = &unk_1E595C648;
  v15[4] = self;
  v15[5] = a2;
  v11 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke_16;
  v13[3] = &unk_1E595E138;
  id v14 = v7;
  id v12 = v7;
  [v11 tnepTagDeviceSendNDEFMessage:v10 callback:v13];
}

void __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 101, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 101;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

uint64_t __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)startTNEPReaderWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = _os_activity_create(&dword_19D636000, "startTNEPReaderWithDelegate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke;
  v12[3] = &unk_1E595C648;
  v12[4] = self;
  v12[5] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke_17;
  v11[3] = &unk_1E595CF58;
  v11[4] = &state;
  [v7 startTNEPReaderWithCallback:v11];

  id v8 = *(void **)(state.opaque[1] + 40);
  if (!v8)
  {
    [(NFSecureTransactionServicesHandoverSession *)self setTagReaderDelegate:v5];
    id v8 = *(void **)(state.opaque[1] + 40);
  }
  id v9 = v8;
  _Block_object_dispose(&state, 8);

  return v9;
}

void __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 116, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 116;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke_17(uint64_t a1, void *a2)
{
}

- (void)singleResponseCommunicationReaderSend:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = _os_activity_create(&dword_19D636000, "singleResponseCommunicationReaderSend:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FBA860]) initWithNDEFMessage:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke;
  v15[3] = &unk_1E595C648;
  v15[4] = self;
  v15[5] = a2;
  v11 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke_18;
  v13[3] = &unk_1E595EAF8;
  id v14 = v7;
  id v12 = v7;
  [v11 tnepReaderSend:v10 callback:v13];
}

void __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 136, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 136;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[NFNdefMessage alloc] initWithNDEFMessage:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)selectService:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "selectService:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__21;
  uint64_t v15 = __Block_byref_object_dispose__21;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke;
  v11[3] = &unk_1E595C648;
  v11[4] = self;
  void v11[5] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke_21;
  v10[3] = &unk_1E595CF58;
  v10[4] = &state;
  [v7 tnepReaderSelectService:v5 callback:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 151, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 151;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke_21(uint64_t a1, void *a2)
{
}

- (id)deselectService
{
  v4 = _os_activity_create(&dword_19D636000, "deselectService", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke_22;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 tnepReaderDeselectWithCallback:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 168, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 168;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke_22(uint64_t a1, void *a2)
{
}

- (id)restartPolling
{
  v4 = _os_activity_create(&dword_19D636000, "restartPolling", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke_23;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 tnepReaderRestartPollingWithCallback:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 185, v3);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 185;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }
}

void __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke_23(uint64_t a1, void *a2)
{
}

- (void)stopTNEPOperation
{
  id v3 = _os_activity_create(&dword_19D636000, "stopTNEPOperation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__21;
  uint64_t v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__NFSecureTransactionServicesHandoverSession_stopTNEPOperation__block_invoke;
  v5[3] = &unk_1E595CF58;
  v5[4] = &state;
  v4 = [(NFSession *)self remoteObjectProxyWithErrorHandler:v5];
  [v4 tnepServiceInvalidate];

  _Block_object_dispose(&state, 8);
}

void __63__NFSecureTransactionServicesHandoverSession_stopTNEPOperation__block_invoke(uint64_t a1, void *a2)
{
}

- (void)fieldNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__NFSecureTransactionServicesHandoverSession_fieldNotification___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__NFSecureTransactionServicesHandoverSession_fieldNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) fieldNotification:*(void *)(a1 + 40)];
}

- (void)fieldChange:(BOOL)a3
{
  id v5 = [(NFSession *)self callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NFSecureTransactionServicesHandoverSession_fieldChange___block_invoke;
  v6[3] = &unk_1E595D0F0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __58__NFSecureTransactionServicesHandoverSession_fieldChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 session:*(void *)(a1 + 32) fieldChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)tnepReaderServicesDiscovered:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__NFSecureTransactionServicesHandoverSession_tnepReaderServicesDiscovered___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__NFSecureTransactionServicesHandoverSession_tnepReaderServicesDiscovered___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagReaderDelegate];
  [v2 didDiscoverServices:*(void *)(a1 + 40)];
}

- (void)staticReaderEngagementDiscovered:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i handover select %@", v11, ClassName, Name, 236, v5);
  }
  dispatch_get_specific(*v6);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v18 = v14;
    __int16 v19 = 2082;
    v20 = object_getClassName(self);
    __int16 v21 = 2082;
    id v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 236;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select %@", buf, 0x2Cu);
  }
}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5 = a3;
  id v6 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NFSecureTransactionServicesHandoverSession_tnepReaderServicesAborted___block_invoke;
  block[3] = &unk_1E595CC48;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__NFSecureTransactionServicesHandoverSession_tnepReaderServicesAborted___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tagReaderDelegate];
  [v2 didAbort:*(void *)(a1 + 40)];

  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 session:*(void *)(a1 + 32) didEndUnexpectedly:*(void *)(a1 + 40)];
  }
  id v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(4, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", v12, ClassName, Name, 246);
  }
  dispatch_get_specific(*v6);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    id v16 = object_getClassName(*(id *)(a1 + 32));
    id v17 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v21 = v15;
    __int16 v22 = 2082;
    __int16 v23 = v16;
    __int16 v24 = 2082;
    __int16 v25 = v17;
    __int16 v26 = 1024;
    int v27 = 246;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", buf, 0x22u);
  }

  return [*(id *)(a1 + 32) endSession];
}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NFSecureTransactionServicesHandoverSession_tnepTagDeviceDeselected___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__NFSecureTransactionServicesHandoverSession_tnepTagDeviceDeselected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagDeviceDelegate];
  [v2 didDeselect:*(void *)(a1 + 40)];
}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NFSecureTransactionServicesHandoverSession_tnepTagDeviceNDEFMessageReceived___block_invoke;
  v7[3] = &unk_1E595D0C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__NFSecureTransactionServicesHandoverSession_tnepTagDeviceNDEFMessageReceived___block_invoke(uint64_t a1)
{
  char v3 = [[NFNdefMessage alloc] initWithNDEFMessage:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) tagDeviceDelegate];
  [v2 didReceiveMessage:v3];
}

- (void)tnepTagDeviceReaderDetected
{
  char v3 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NFSecureTransactionServicesHandoverSession_tnepTagDeviceReaderDetected__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __73__NFSecureTransactionServicesHandoverSession_tnepTagDeviceReaderDetected__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tagDeviceDelegate];
  [v1 didDetectReader];
}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke;
  block[3] = &unk_1E595D140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tagDeviceDelegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke_2;
  v4[3] = &unk_1E595D118;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 didSelect:v3 respondHandler:v4];
}

void __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4FBA868]);
        id v13 = objc_msgSend(v12, "initWithNDEFRecord:", v11, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)connectionHandoverTNEPServiceSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NFSecureTransactionServicesHandoverSession_connectionHandoverTNEPServiceSelected___block_invoke;
  v7[3] = &unk_1E595D0C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__NFSecureTransactionServicesHandoverSession_connectionHandoverTNEPServiceSelected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) tnepService:*(void *)(a1 + 40)];
}

- (void)connectionHandoverProcessFailure:(id)a3
{
  id v4 = a3;
  id v5 = [(NFSession *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessFailure___block_invoke;
  v7[3] = &unk_1E595D0C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessFailure___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) connectionHandoverProcessFailure:*(void *)(a1 + 40)];
}

- (void)connectionHandoverProcessCompleted
{
  uint64_t v3 = [(NFSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessCompleted__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __80__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessCompleted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connectionHandoverCompleted:*(void *)(a1 + 32)];
}

- (NFSecureTransactionServicesHandoverSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NFSecureTransactionServicesHandoverSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFTNEPTagDeviceDelegate)tagDeviceDelegate
{
  return self->_tagDeviceDelegate;
}

- (void)setTagDeviceDelegate:(id)a3
{
}

- (NFTNEPReaderDelegate)tagReaderDelegate
{
  return self->_tagReaderDelegate;
}

- (void)setTagReaderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagReaderDelegate, 0);
  objc_storeStrong((id *)&self->_tagDeviceDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end