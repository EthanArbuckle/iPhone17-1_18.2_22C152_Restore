@interface NFReaderSession
- (BOOL)_disconnectTagWithCardRemoval:(BOOL)a3 outError:(id *)a4;
- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4;
- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4 error:(id *)a5;
- (BOOL)checkPresence;
- (BOOL)checkPresenceWithError:(id *)a3;
- (BOOL)connectTag:(id)a3;
- (BOOL)connectTag:(id)a3 error:(id *)a4;
- (BOOL)disconnectTag;
- (BOOL)disconnectTagWithCardRemoval:(id *)a3;
- (BOOL)disconnectTagWithError:(id *)a3;
- (BOOL)formatNdefWithKey:(id)a3;
- (BOOL)formatNdefWithKey:(id)a3 error:(id *)a4;
- (BOOL)ndefWrite:(id)a3;
- (BOOL)ndefWrite:(id)a3 error:(id *)a4;
- (BOOL)restartPollingWithError:(id *)a3;
- (BOOL)setECPPayload:(id)a3 error:(id *)a4;
- (BOOL)setPollingProfile:(int64_t)a3 error:(id *)a4;
- (BOOL)startLPCDPollingWithError:(id *)a3;
- (BOOL)startPolling;
- (BOOL)startPollingForTechnology:(unsigned int)a3;
- (BOOL)startPollingForTechnology:(unsigned int)a3 error:(id *)a4;
- (BOOL)startPollingWithConfig:(id)a3 error:(id *)a4;
- (BOOL)startPollingWithError:(id *)a3;
- (BOOL)stopPolling;
- (BOOL)stopPollingWithError:(id *)a3;
- (NFReaderSession)initWithUIType:(int64_t)a3;
- (NFReaderSessionDelegate)delegate;
- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4;
- (id)felicaRequestService:(id)a3 error:(id *)a4;
- (id)felicaRequestService:(id)a3 forSystemCode:(id)a4 error:(id *)a5;
- (id)felicaState;
- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6;
- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6 error:(id *)a7;
- (id)felicaStateWithError:(id *)a3;
- (id)ndefRead;
- (id)ndefReadWithError:(id *)a3;
- (id)performVAS:(id)a3 error:(id *)a4;
- (id)skipMifareClassification;
- (id)transceive:(id)a3;
- (id)transceive:(id)a3 error:(id *)a4;
- (id)updateUIAlertMessage:(id)a3;
- (int64_t)actionSheetUI;
- (unsigned)runScript:(id)a3 parameters:(id)a4 results:(id *)a5;
- (void)didDetectExternalReaderWithNotification:(id)a3;
- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6;
- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4;
- (void)didEndUnexpectedly;
- (void)didTerminate:(id)a3;
- (void)didUIControllerInvalidate:(id)a3;
- (void)endSession;
- (void)setDelegate:(id)a3;
@end

@implementation NFReaderSession

- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke;
  v12[3] = &unk_1E595C6C0;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  v8 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_12;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = a2;
  [v8 enableContinuousWave:v5 withFrequencySweep:v4 completion:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 20, v4);
  }
  dispatch_get_specific(*v5);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 20;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __73__NFReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 24, v4);
    }
    dispatch_get_specific(*v5);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      v21 = v14;
      __int16 v22 = 2082;
      v23 = v15;
      __int16 v24 = 1024;
      int v25 = 24;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (NFReaderSession)initWithUIType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NFReaderSession;
  result = [(NFSession *)&v5 init];
  if (result) {
    result->_actionSheetUI = a3;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFReaderSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFReaderSessionDelegate *)WeakRetained;
}

- (void)endSession
{
  [(NFReaderSession *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)NFReaderSession;
  [(NFSession *)&v3 endSession];
}

- (void)didTerminate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(5, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", v11, ClassName, Name, 115, v5);
  }
  dispatch_get_specific(*v6);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v19 = v14;
    __int16 v20 = 2082;
    v21 = object_getClassName(self);
    __int16 v22 = 2082;
    v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 115;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = [(NFReaderSession *)self delegate];
  [(NFReaderSession *)self endSession];
  if (objc_opt_respondsToSelector())
  {
    [v15 readerSessionDidEndUnexpectedly:self reason:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v15 readerSessionDidEndUnexpectedly:self];
  }
}

- (void)didUIControllerInvalidate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(NFReaderSession *)self actionSheetUI] == 1)
  {
    [(NFReaderSession *)self didTerminate:v5];
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(5, "%c[%{public}s %{public}s]:%i Not supported", v12, ClassName, Name, 134);
    }
    dispatch_get_specific(*v6);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v18 = v15;
      __int16 v19 = 2082;
      __int16 v20 = object_getClassName(self);
      __int16 v21 = 2082;
      __int16 v22 = sel_getName(a2);
      __int16 v23 = 1024;
      int v24 = 134;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not supported", buf, 0x22u);
    }
  }
}

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke;
  v14[3] = &unk_1E595E5B0;
  id v8 = v7;
  v16 = self;
  unint64_t v17 = a4;
  id v15 = v8;
  [v6 enumerateObjectsUsingBlock:v14];

  v13.receiver = self;
  v13.super_class = (Class)NFReaderSession;
  id v9 = [(NFSession *)&v13 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke_2;
  block[3] = &unk_1E595D0C8;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  obj = [[NFTag alloc] initWithNFTag:v5];

  [*(id *)(a1 + 32) addObject:obj];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v6 == a3) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), obj);
  }
}

void __51__NFReaderSession_didDetectTags_connectedTagIndex___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 readerSession:*(void *)(a1 + 32) didDetectTags:*(void *)(a1 + 40)];
  }
}

- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(5, "%c[%{public}s %{public}s]:%i Not supported", v14, ClassName, Name, 161);
  }
  dispatch_get_specific(*v8);
  id v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v20 = v17;
    __int16 v21 = 2082;
    __int16 v22 = object_getClassName(self);
    __int16 v23 = 2082;
    int v24 = sel_getName(a2);
    __int16 v25 = 1024;
    int v26 = 161;
    _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not supported", buf, 0x22u);
  }
}

- (void)didDetectExternalReaderWithNotification:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFReaderSession;
  id v5 = [(NFSession *)&v9 callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NFReaderSession_didDetectExternalReaderWithNotification___block_invoke;
  v7[3] = &unk_1E595D0C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__NFReaderSession_didDetectExternalReaderWithNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 readerSession:*(void *)(a1 + 32) externalReaderFieldNotification:*(void *)(a1 + 40)];
  }
}

- (void)didEndUnexpectedly
{
  v5.receiver = self;
  v5.super_class = (Class)NFReaderSession;
  char v3 = [(NFSession *)&v5 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NFReaderSession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

id __37__NFReaderSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    v7 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithUTF8String:"XPC Error"];
    v15[0] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v10 = (void *)[v6 initWithDomain:v7 code:7 userInfo:v9];
    [v4 readerSessionDidEndUnexpectedly:v5 reason:v10];

LABEL_5:
    goto LABEL_6;
  }
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 readerSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
    goto LABEL_5;
  }
LABEL_6:
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)NFReaderSession;
  return objc_msgSendSuper2(&v13, sel_didEndUnexpectedly);
}

- (BOOL)setECPPayload:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "setECPPayload:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  int v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__NFReaderSession_setECPPayload_error___block_invoke;
  v13[3] = &unk_1E595CBD0;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  objc_super v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__NFReaderSession_setECPPayload_error___block_invoke_101;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  void v12[7] = a2;
  [v9 setECPPayload:v7 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __39__NFReaderSession_setECPPayload_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 197, v3);
  }
  dispatch_get_specific(*v4);
  char v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    objc_super v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    char v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 197;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __39__NFReaderSession_setECPPayload_error___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 202, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 202;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startPolling
{
  return [(NFReaderSession *)self startPollingWithError:0];
}

- (BOOL)startPollingWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "startPollingWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__16;
  uint64_t v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__NFReaderSession_startPollingWithError___block_invoke;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__NFReaderSession_startPollingWithError___block_invoke_102;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 startPollingForTags:1 sessionConfig:0 completion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __41__NFReaderSession_startPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 228, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 228;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __41__NFReaderSession_startPollingWithError___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 233, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 233;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startLPCDPollingWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "startPollingWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__16;
  uint64_t v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NFReaderSession_startLPCDPollingWithError___block_invoke;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__NFReaderSession_startLPCDPollingWithError___block_invoke_103;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 startPollingForTags:1 sessionConfig:2048 completion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __45__NFReaderSession_startLPCDPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 253, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 253;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFReaderSession_startLPCDPollingWithError___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 258, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 258;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startPollingForTechnology:(unsigned int)a3
{
  return [(NFReaderSession *)self startPollingForTechnology:*(void *)&a3 error:0];
}

- (BOOL)startPollingForTechnology:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  char v8 = _os_activity_create(&dword_19D636000, "startPollingForTechnology:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  int v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  int v25 = @"tech";
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v5];
  v26[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __51__NFReaderSession_startPollingForTechnology_error___block_invoke;
  v15[3] = &unk_1E595C6C0;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  char v11 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__NFReaderSession_startPollingForTechnology_error___block_invoke_104;
  v14[3] = &unk_1E595CA18;
  void v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  [v11 startPollingWithConfig:v10 completion:v14];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v12 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

void __51__NFReaderSession_startPollingForTechnology_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 289, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 289;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __51__NFReaderSession_startPollingForTechnology_error___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 293, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 293;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startPollingWithConfig:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "startPollingWithConfig:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__NFReaderSession_startPollingWithConfig_error___block_invoke;
  v14[3] = &unk_1E595C6C0;
  void v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v10 = [v7 asDictionary];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__NFReaderSession_startPollingWithConfig_error___block_invoke_105;
  v13[3] = &unk_1E595CA18;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  void v13[7] = a2;
  [v9 startPollingWithConfig:v10 completion:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __48__NFReaderSession_startPollingWithConfig_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 316, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 316;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __48__NFReaderSession_startPollingWithConfig_error___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 320, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 320;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)stopPolling
{
  return [(NFReaderSession *)self stopPollingWithError:0];
}

- (BOOL)stopPollingWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "stopPollingWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__16;
  uint64_t v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NFReaderSession_stopPollingWithError___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__NFReaderSession_stopPollingWithError___block_invoke_106;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 stopPollingWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __40__NFReaderSession_stopPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 347, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 347;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFReaderSession_stopPollingWithError___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 351, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 351;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)restartPollingWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "restartPollingWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__16;
  uint64_t v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFReaderSession_restartPollingWithError___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__NFReaderSession_restartPollingWithError___block_invoke_107;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 restartPollingWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __43__NFReaderSession_restartPollingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 373, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 373;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFReaderSession_restartPollingWithError___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 377, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 377;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)connectTag:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToNFTag:self->_connectedTag])
  {
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Tag is in connected state", v12, ClassName, Name, 393);
    }
    dispatch_get_specific(*v6);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v15;
      __int16 v21 = 2082;
      __int16 v22 = object_getClassName(self);
      __int16 v23 = 2082;
      __int16 v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 393;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is in connected state", buf, 0x22u);
    }

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = [(NFReaderSession *)self connectTag:v5 error:0];
  }

  return v16;
}

- (BOOL)connectTag:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "connectTag:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__16;
  __int16 v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FBA888]) initWithNFTag:v7];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__NFReaderSession_connectTag_error___block_invoke;
  v19[3] = &unk_1E595C6C0;
  v19[4] = self;
  v19[5] = &state;
  v19[6] = a2;
  uint64_t v10 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__NFReaderSession_connectTag_error___block_invoke_110;
  v14[3] = &unk_1E595E5D8;
  p_os_activity_scope_state_s state = &state;
  uint64_t v17 = &v25;
  void v14[4] = self;
  SEL v18 = a2;
  id v11 = v7;
  id v15 = v11;
  [v10 connect:v9 completion:v14];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __36__NFReaderSession_connectTag_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 410, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 410;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __36__NFReaderSession_connectTag_error___block_invoke_110(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 414, v5);
    }
    dispatch_get_specific(*v6);
    char v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      id v15 = object_getClassName(*(id *)(a1 + 32));
      BOOL v16 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v22 = v14;
      __int16 v23 = 2082;
      __int16 v24 = v15;
      __int16 v25 = 2082;
      __int16 v26 = v16;
      __int16 v27 = 1024;
      int v28 = 414;
      __int16 v29 = 2114;
      id v30 = v5;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    SEL v18 = *(void **)(v17 + 72);
    *(void *)(v17 + 72) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  }
}

- (BOOL)disconnectTag
{
  return [(NFReaderSession *)self disconnectTagWithError:0];
}

- (BOOL)disconnectTagWithError:(id *)a3
{
  return [(NFReaderSession *)self _disconnectTagWithCardRemoval:0 outError:a3];
}

- (BOOL)disconnectTagWithCardRemoval:(id *)a3
{
  return [(NFReaderSession *)self _disconnectTagWithCardRemoval:1 outError:a3];
}

- (BOOL)_disconnectTagWithCardRemoval:(BOOL)a3 outError:(id *)a4
{
  BOOL v5 = a3;
  if (a3) {
    char v8 = "_disconnectTagWithCardRemoval:Y outError:";
  }
  else {
    char v8 = "_disconnectTagWithCardRemoval:N outError:";
  }
  uint64_t v9 = _os_activity_create(&dword_19D636000, v8, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  SEL v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke;
  v14[3] = &unk_1E595C6C0;
  void v14[4] = self;
  void v14[5] = &state;
  v14[6] = a2;
  uint64_t v10 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke_112;
  v13[3] = &unk_1E595CA18;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  void v13[7] = a2;
  [v10 disconnectWithCardRemoval:v5 completion:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 458, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 458;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __58__NFReaderSession__disconnectTagWithCardRemoval_outError___block_invoke_112(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 462, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      id v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v21 = v13;
      __int16 v22 = 2082;
      char v23 = v14;
      __int16 v24 = 2082;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = 462;
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 72);
  *(void *)(v16 + 72) = 0;
}

- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4
{
  return [(NFReaderSession *)self checkNdefSupportsRead:a3 andWrite:a4 error:0];
}

- (BOOL)checkNdefSupportsRead:(BOOL *)a3 andWrite:(BOOL *)a4 error:(id *)a5
{
  uint64_t v10 = _os_activity_create(&dword_19D636000, "checkNdefSupportsRead:andWrite:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  SEL v18 = __Block_byref_object_copy__16;
  int v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke;
  v15[3] = &unk_1E595C6C0;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  char v11 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke_113;
  v14[3] = &unk_1E595E600;
  void v14[4] = self;
  void v14[5] = &state;
  void v14[8] = a3;
  v14[9] = a4;
  v14[6] = &v21;
  void v14[7] = a2;
  [v11 checkNdefSupportWithCompletion:v14];

  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  char v12 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 492, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 492;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __56__NFReaderSession_checkNdefSupportsRead_andWrite_error___block_invoke_113(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    char v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 496, v7);
    }
    dispatch_get_specific(*v8);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      SEL v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v27 = v16;
      __int16 v28 = 2082;
      id v29 = v17;
      __int16 v30 = 2082;
      uint64_t v31 = v18;
      __int16 v32 = 1024;
      int v33 = 496;
      __int16 v34 = 2114;
      id v35 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    switch(a2)
    {
      case 0:
      case 1:
        int v19 = *(unsigned char **)(a1 + 64);
        if (v19) {
          *int v19 = 0;
        }
        goto LABEL_21;
      case 2:
      case 4:
        __int16 v20 = *(unsigned char **)(a1 + 64);
        if (v20) {
          *__int16 v20 = 1;
        }
        uint64_t v21 = *(unsigned char **)(a1 + 72);
        if (v21) {
          unsigned char *v21 = 1;
        }
        break;
      case 3:
        __int16 v22 = *(unsigned char **)(a1 + 64);
        if (v22) {
          *__int16 v22 = 1;
        }
LABEL_21:
        uint64_t v23 = *(unsigned char **)(a1 + 72);
        if (v23) {
          unsigned char *v23 = 0;
        }
        break;
      default:
        break;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)checkPresence
{
  return [(NFReaderSession *)self checkPresenceWithError:0];
}

- (BOOL)checkPresenceWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "checkPresenceWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  SEL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__16;
  id v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NFReaderSession_checkPresenceWithError___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NFReaderSession_checkPresenceWithError___block_invoke_115;
  v10[3] = &unk_1E595E628;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  v10[7] = a2;
  [v7 checkPresenceWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __42__NFReaderSession_checkPresenceWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 539, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    id v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 539;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFReaderSession_checkPresenceWithError___block_invoke_115(uint64_t a1, void *a2, char a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 543, v6);
    }
    dispatch_get_specific(*v7);
    int v13 = NFSharedLogGetLogger();
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
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      uint64_t v23 = v16;
      __int16 v24 = 2082;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = 543;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

- (BOOL)formatNdefWithKey:(id)a3
{
  return [(NFReaderSession *)self formatNdefWithKey:a3 error:0];
}

- (BOOL)formatNdefWithKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "formatNdefWithKey:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__16;
  uint64_t v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__NFReaderSession_formatNdefWithKey_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NFReaderSession_formatNdefWithKey_error___block_invoke_117;
  v12[3] = &unk_1E595CA18;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  void v12[7] = a2;
  [v9 formatNdefWithKey:v7 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __43__NFReaderSession_formatNdefWithKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 570, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    int v25 = 570;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFReaderSession_formatNdefWithKey_error___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 574, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = 574;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)ndefWrite:(id)a3
{
  return [(NFReaderSession *)self ndefWrite:a3 error:0];
}

- (BOOL)ndefWrite:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "ndefWrite:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FBA860]) initWithNDEFMessage:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__NFReaderSession_ndefWrite_error___block_invoke;
  v14[3] = &unk_1E595C6C0;
  void v14[4] = self;
  void v14[5] = &state;
  v14[6] = a2;
  uint64_t v10 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__NFReaderSession_ndefWrite_error___block_invoke_119;
  v13[3] = &unk_1E595CA18;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  void v13[7] = a2;
  [v10 ndefWrite:v9 completion:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

void __35__NFReaderSession_ndefWrite_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 603, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 603;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __35__NFReaderSession_ndefWrite_error___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 607, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      int v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 607;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)ndefRead
{
  return [(NFReaderSession *)self ndefReadWithError:0];
}

- (id)ndefReadWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "ndefReadWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__16;
  __int16 v22 = __Block_byref_object_dispose__16;
  id v23 = 0;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__16;
  uint64_t v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__NFReaderSession_ndefReadWithError___block_invoke;
  v12[3] = &unk_1E595C6C0;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__NFReaderSession_ndefReadWithError___block_invoke_120;
  v11[3] = &unk_1E595E650;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  void v11[7] = a2;
  [v7 ndefReadWithCompletion:v11];

  if (a3) {
    *a3 = (id) v14[5];
  }
  char v8 = [NFNdefMessage alloc];
  uint64_t v9 = [(NFNdefMessage *)v8 initWithNDEFMessage:*(void *)(state.opaque[1] + 40)];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __37__NFReaderSession_ndefReadWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 635, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 1024;
    int v25 = 635;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __37__NFReaderSession_ndefReadWithError___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 639, v6);
    }
    dispatch_get_specific(*v8);
    int v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 639;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

- (id)transceive:(id)a3
{
  return [(NFReaderSession *)self transceive:a3 error:0];
}

- (id)transceive:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "transceive:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__16;
  __int16 v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__NFReaderSession_transceive_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  uint64_t v9 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__NFReaderSession_transceive_error___block_invoke_123;
  v12[3] = &unk_1E595E678;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  void v12[7] = a2;
  [v9 transceive:v7 completion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __36__NFReaderSession_transceive_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 666, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 666;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __36__NFReaderSession_transceive_error___block_invoke_123(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    uint64_t v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 670, v8);
    }
    dispatch_get_specific(*v9);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      id v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v23 = v17;
      __int16 v24 = 2082;
      int v25 = v18;
      __int16 v26 = 2082;
      id v27 = v19;
      __int16 v28 = 1024;
      int v29 = 670;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

- (id)felicaState
{
  return [(NFReaderSession *)self felicaStateWithError:0];
}

- (id)felicaStateWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "felicaStateWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__16;
  uint64_t v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__16;
  uint64_t v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NFReaderSession_felicaStateWithError___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a2;
  id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__NFReaderSession_felicaStateWithError___block_invoke_125;
  v10[3] = &unk_1E595CA40;
  v10[4] = self;
  v10[5] = &v12;
  v10[6] = &state;
  v10[7] = a2;
  [v7 felicaStateForSystemCode:0 withRequestService:MEMORY[0x1E4F1CBF0] performSearchServiceCode:1 completion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __40__NFReaderSession_felicaStateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 697, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    int v23 = v15;
    __int16 v24 = 1024;
    int v25 = 697;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFReaderSession_felicaStateWithError___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 701, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 701;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6
{
  return [(NFReaderSession *)self felicaStateForSystemCode:a3 withRequestService:a4 withBlockReadList:a5 performSearchServiceCode:a6 error:0];
}

- (id)felicaStateForSystemCode:(id)a3 withRequestService:(id)a4 withBlockReadList:(id)a5 performSearchServiceCode:(BOOL)a6 error:(id *)a7
{
  BOOL v36 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_19D636000, "felicaStateForSystemCode:withRequestService:withBlockReadList:performSearchServiceCode:error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  uint64_t state = 0;
  *(void *)state_8 = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  uint64_t v10 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    unint64_t v15 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = objc_msgSend(*(id *)(v15 + 2488), "NF_dataWithHexString:", v17);
          if (v18)
          {
            [v10 addObject:v18];
          }
          else
          {
            id v19 = v11;
            __int16 v20 = v10;
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v22 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v25 = 45;
              if (isMetaClass) {
                uint64_t v25 = 43;
              }
              v22(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v25, ClassName, Name, 731, v17);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            __int16 v26 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v27 = object_getClass(self);
              if (class_isMetaClass(v27)) {
                int v28 = 43;
              }
              else {
                int v28 = 45;
              }
              __int16 v29 = object_getClassName(self);
              id v30 = sel_getName(a2);
              LODWORD(state) = 67110146;
              HIDWORD(state) = v28;
              *(_WORD *)state_8 = 2082;
              *(void *)&state_8[2] = v29;
              *(_WORD *)&state_8[10] = 2082;
              *(void *)&state_8[12] = v30;
              *(_WORD *)&state_8[20] = 1024;
              *(_DWORD *)&state_8[22] = 731;
              *(_WORD *)&state_8[26] = 2114;
              *(void *)&state_8[28] = v17;
              _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", (uint8_t *)&state, 0x2Cu);
            }

            uint64_t v10 = v20;
            id v11 = v19;
            unint64_t v15 = 0x1E4F1C000;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 addObject:v17];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v13);
  }

  uint64_t state = 0;
  *(void *)state_8 = &state;
  *(void *)&state_8[8] = 0x3032000000;
  *(void *)&state_8[16] = __Block_byref_object_copy__16;
  *(void *)&state_8[24] = __Block_byref_object_dispose__16;
  *(void *)&state_8[32] = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__16;
  v47 = __Block_byref_object_dispose__16;
  id v48 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke;
  v42[3] = &unk_1E595C6C0;
  v42[4] = self;
  v42[5] = &v43;
  v42[6] = a2;
  uint64_t v31 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v42];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke_129;
  v41[3] = &unk_1E595CA40;
  v41[4] = self;
  v41[5] = &v43;
  v41[6] = &state;
  v41[7] = a2;
  [v31 felicaStateForSystemCode:v38 withRequestService:v10 performSearchServiceCode:v36 completion:v41];

  if (a7) {
    *a7 = (id) v44[5];
  }
  id v32 = *(id *)(*(void *)state_8 + 40);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&state, 8);
  return v32;
}

void __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 743, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    unint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 743;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __112__NFReaderSession_felicaStateForSystemCode_withRequestService_withBlockReadList_performSearchServiceCode_error___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 747, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 747;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (id)felicaRequestService:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _os_activity_create(&dword_19D636000, "felicaRequestService:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__16;
  long long v49 = __Block_byref_object_dispose__16;
  id v50 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__16;
  v44 = __Block_byref_object_dispose__16;
  id v45 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = objc_opt_new();
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v61 count:16];
  uint64_t v31 = v6;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v12);
          if (v13)
          {
            [v6 addObject:v13];
          }
          else
          {
            id v14 = v7;
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v16 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v19 = 45;
              if (isMetaClass) {
                uint64_t v19 = 43;
              }
              v16(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v19, ClassName, Name, 775, v12);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            __int16 v20 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = object_getClass(self);
              if (class_isMetaClass(v21)) {
                int v22 = 43;
              }
              else {
                int v22 = 45;
              }
              __int16 v23 = object_getClassName(self);
              __int16 v24 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v52 = v22;
              __int16 v53 = 2082;
              v54 = v23;
              __int16 v55 = 2082;
              uint64_t v56 = v24;
              __int16 v57 = 1024;
              int v58 = 775;
              __int16 v59 = 2114;
              uint64_t v60 = v12;
              _os_log_impl(&dword_19D636000, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", buf, 0x2Cu);
            }

            id v7 = v14;
            id v6 = v31;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v61 count:16];
    }
    while (v9);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__NFReaderSession_felicaRequestService_error___block_invoke;
  v35[3] = &unk_1E595CBD0;
  v35[4] = self;
  v35[5] = &v40;
  v35[6] = a2;
  __int16 v25 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v35];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __46__NFReaderSession_felicaRequestService_error___block_invoke_130;
  v34[3] = &unk_1E595E6A0;
  v34[4] = self;
  v34[5] = &v40;
  v34[6] = &state;
  v34[7] = a2;
  [v25 felicaRequestService:v31 completion:v34];

  if (a4) {
    *a4 = (id) v41[5];
  }
  id v26 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&state, 8);

  return v26;
}

void __46__NFReaderSession_felicaRequestService_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 783, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 783;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __46__NFReaderSession_felicaRequestService_error___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 787, v7);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 787;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

- (id)felicaRequestService:(id)a3 forSystemCode:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  id v7 = _os_activity_create(&dword_19D636000, "felicaRequestService:forSystemCode:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v52 = 0x3032000000;
  __int16 v53 = __Block_byref_object_copy__16;
  v54 = __Block_byref_object_dispose__16;
  id v55 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__16;
  long long v49 = __Block_byref_object_dispose__16;
  id v50 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v8 = objc_opt_new();
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v66 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    unint64_t v13 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v16 = objc_msgSend(*(id *)(v13 + 2488), "NF_dataWithHexString:", v15);
          if (v16)
          {
            [v8 addObject:v16];
          }
          else
          {
            uint64_t v17 = v8;
            id v18 = v9;
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v20 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              BOOL v23 = !isMetaClass;
              unint64_t v13 = 0x1E4F1C000;
              uint64_t v24 = 45;
              if (!v23) {
                uint64_t v24 = 43;
              }
              v20(5, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", v24, ClassName, Name, 817, v15);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            __int16 v25 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              int v26 = object_getClass(self);
              if (class_isMetaClass(v26)) {
                int v27 = 43;
              }
              else {
                int v27 = 45;
              }
              id v28 = object_getClassName(self);
              __int16 v29 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v57 = v27;
              __int16 v58 = 2082;
              __int16 v59 = v28;
              unint64_t v13 = 0x1E4F1C000;
              __int16 v60 = 2082;
              v61 = v29;
              __int16 v62 = 1024;
              int v63 = 817;
              __int16 v64 = 2114;
              uint64_t v65 = v15;
              _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid code found: %{public}@!", buf, 0x2Cu);
            }

            id v9 = v18;
            uint64_t v8 = v17;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v8 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v66 count:16];
    }
    while (v11);
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke;
  v40[3] = &unk_1E595CBD0;
  v40[4] = self;
  v40[5] = &v45;
  v40[6] = a2;
  int v30 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v40];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke_132;
  v39[3] = &unk_1E595E6A0;
  v39[4] = self;
  v39[5] = &v45;
  v39[6] = &state;
  v39[7] = a2;
  [v30 felicaRequestService:v8 forSystemCode:v36 completion:v39];

  if (a5) {
    *a5 = (id) v46[5];
  }
  id v31 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&state, 8);

  return v31;
}

void __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 825, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    unint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 825;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __60__NFReaderSession_felicaRequestService_forSystemCode_error___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 829, v7);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 829;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

- (id)updateUIAlertMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "updateUIAlertMessage:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  uint64_t state = 0;
  *(void *)state_8 = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)&state);
  os_activity_scope_leave((os_activity_scope_state_t)&state);

  if (self->_actionSheetUI)
  {
    uint64_t state = 0;
    *(void *)state_8 = &state;
    *(void *)&state_8[8] = 0x3032000000;
    *(void *)&state_8[16] = __Block_byref_object_copy__16;
    *(void *)&state_8[24] = __Block_byref_object_dispose__16;
    id v27 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__NFReaderSession_updateUIAlertMessage___block_invoke;
    v24[3] = &unk_1E595CBD0;
    v24[5] = &state;
    v24[6] = a2;
    v24[4] = self;
    id v7 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__NFReaderSession_updateUIAlertMessage___block_invoke_134;
    v23[3] = &unk_1E595CBD0;
    v23[5] = &state;
    v23[6] = a2;
    v23[4] = self;
    [v7 updateSharingUIScanText:v5 completion:v23];

    id v8 = *(id *)(*(void *)state_8 + 40);
    _Block_object_dispose(&state, 8);
  }
  else
  {
    uint64_t v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(5, "%c[%{public}s %{public}s]:%i Session does not support UI", v15, ClassName, Name, 849);
    }
    dispatch_get_specific(*v9);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      uint64_t v19 = object_getClassName(self);
      int v20 = sel_getName(a2);
      LODWORD(state) = 67109890;
      HIDWORD(state) = v18;
      *(_WORD *)state_8 = 2082;
      *(void *)&state_8[2] = v19;
      *(_WORD *)&state_8[10] = 2082;
      *(void *)&state_8[12] = v20;
      *(_WORD *)&state_8[20] = 1024;
      *(_DWORD *)&state_8[22] = 849;
      _os_log_impl(&dword_19D636000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session does not support UI", (uint8_t *)&state, 0x22u);
    }

    id v8 = 0;
  }

  return v8;
}

void __40__NFReaderSession_updateUIAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 856, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
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
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 856;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __40__NFReaderSession_updateUIAlertMessage___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 860, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 860;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)skipMifareClassification
{
  id v4 = _os_activity_create(&dword_19D636000, "skipMifareClassification:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__16;
  int v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__NFReaderSession_skipMifareClassification__block_invoke;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  v9[6] = a2;
  v9[4] = self;
  id v5 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NFReaderSession_skipMifareClassification__block_invoke_135;
  v8[3] = &unk_1E595CBD0;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 skipMifareClassificationWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __43__NFReaderSession_skipMifareClassification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 875, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 875;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __43__NFReaderSession_skipMifareClassification__block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 879, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 879;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)performVAS:(id)a3 error:(id *)a4
{
  int v18 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19D636000, "performVAS:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__16;
  __int16 v34 = __Block_byref_object_dispose__16;
  id v35 = 0;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__16;
  uint64_t v29 = __Block_byref_object_dispose__16;
  id v30 = 0;
  id v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "asDictionary", v18);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
    }
    while (v11);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__NFReaderSession_performVAS_error___block_invoke;
  v20[3] = &unk_1E595CBD0;
  v20[5] = &state;
  v20[6] = a2;
  v20[4] = self;
  uint64_t v15 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__NFReaderSession_performVAS_error___block_invoke_136;
  v19[3] = &unk_1E595E020;
  v19[4] = self;
  v19[5] = &state;
  v19[6] = &v25;
  void v19[7] = a2;
  [v15 performVAS:v8 completion:v19];

  if (v18) {
    *int v18 = *(id *)(state.opaque[1] + 40);
  }
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&state, 8);

  return v16;
}

void __36__NFReaderSession_performVAS_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 899, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    long long v22 = v13;
    __int16 v23 = 2082;
    long long v24 = v14;
    __int16 v25 = 1024;
    int v26 = 899;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __36__NFReaderSession_performVAS_error___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 903, v6);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v36 = v16;
      __int16 v37 = 2082;
      long long v38 = v17;
      __int16 v39 = 2082;
      uint64_t v40 = v18;
      __int16 v41 = 1024;
      int v42 = 903;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  if ([v7 count])
  {
    uint64_t v19 = objc_opt_new();
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v7;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = [[NFVASResponse alloc] initWithDictionary:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }
  }
}

- (BOOL)setPollingProfile:(int64_t)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__16;
  uint64_t v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  int64_t v7 = a3;
  switch(a3)
  {
    case 0:
      id v8 = "setPollingProfile:Default error:";
      goto LABEL_8;
    case 1:
      id v8 = "setPollingProfile:EMV error:";
      goto LABEL_8;
    case 2:
      id v8 = "setPollingProfile:EMVTransB error:";
      goto LABEL_8;
    case 3:
      id v8 = "setPollingProfile:EMVTransA error:";
      goto LABEL_8;
    case 4:
      id v8 = "setPollingPorfile:NoECP error:";
LABEL_8:
      uint64_t v9 = _os_activity_create(&dword_19D636000, v8, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v9, &state);
      os_activity_scope_leave(&state);

      break;
    default:
      int64_t v7 = 0;
      break;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__NFReaderSession_setPollingProfile_error___block_invoke;
  v14[3] = &unk_1E595CBD0;
  void v14[5] = &v16;
  v14[6] = a2;
  void v14[4] = self;
  uint64_t v10 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__NFReaderSession_setPollingProfile_error___block_invoke_139;
  v13[3] = &unk_1E595CF58;
  v13[4] = &v16;
  [v10 configurePollingProfile:v7 completion:v13];

  if (a4) {
    *a4 = (id) v17[5];
  }
  BOOL v11 = v17[5] == 0;
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __43__NFReaderSession_setPollingProfile_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 956, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    BOOL v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 956;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __43__NFReaderSession_setPollingProfile_error___block_invoke_139(uint64_t a1, void *a2)
{
}

- (int64_t)actionSheetUI
{
  return self->_actionSheetUI;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedTag, 0);
}

- (unsigned)runScript:(id)a3 parameters:(id)a4 results:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = _os_activity_create(&dword_19D636000, "runScript:parameters:results:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (v10)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v41 = 0x3032000000;
    int v42 = __Block_byref_object_copy__16;
    __int16 v43 = __Block_byref_object_dispose__16;
    id v44 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    __int16 v37 = __Block_byref_object_copy__16;
    long long v38 = __Block_byref_object_dispose__16;
    id v39 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __57__NFReaderSession_Private__runScript_parameters_results___block_invoke;
    v33[3] = &unk_1E595CBD0;
    v33[5] = &state;
    v33[6] = a2;
    v33[4] = self;
    int v12 = [(NFSession *)self synchronousRemoteObjectProxyWithErrorHandler:v33];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__NFReaderSession_Private__runScript_parameters_results___block_invoke_270;
    v29[3] = &unk_1E595E6C8;
    p_os_activity_scope_state_s state = &state;
    id v30 = v10;
    long long v32 = &v34;
    [v12 execRemoteAdminScript:v9 completion:v29];

    if (a5) {
      *a5 = (id) v35[5];
    }
    if (*(void *)(state.opaque[1] + 40))
    {
      uint64_t v13 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v15(3, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, Name, 998, *(void *)(state.opaque[1] + 40));
      }
      dispatch_get_specific(*v13);
      __int16 v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = object_getClass(self);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        uint64_t v24 = object_getClassName(self);
        __int16 v25 = sel_getName(a2);
        uint64_t v26 = *(void *)(state.opaque[1] + 40);
        *(_DWORD *)buf = 67110146;
        int v46 = v23;
        __int16 v47 = 2082;
        id v48 = v24;
        __int16 v49 = 2082;
        id v50 = v25;
        __int16 v51 = 1024;
        int v52 = 998;
        __int16 v53 = 2114;
        uint64_t v54 = v26;
        _os_log_impl(&dword_19D636000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      unsigned int v27 = [*(id *)(state.opaque[1] + 40) code];
    }
    else
    {
      unsigned int v27 = 0;
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&state, 8);
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    unsigned int v27 = 10;
  }

  return v27;
}

void __57__NFReaderSession_Private__runScript_parameters_results___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 984, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    BOOL v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v27 = v12;
    __int16 v28 = 2082;
    uint64_t v29 = v13;
    __int16 v30 = 2082;
    long long v31 = v14;
    __int16 v32 = 1024;
    int v33 = 984;
    __int16 v34 = 2114;
    id v35 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = [NSString stringWithUTF8String:"nfcd"];
  uint64_t v24 = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  __int16 v25 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  uint64_t v19 = [v15 initWithDomain:v16 code:7 userInfo:v18];
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void __57__NFReaderSession_Private__runScript_parameters_results___block_invoke_270(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v12 = a4;
  [*(id *)(a1 + 32) setOutTotalAPDUExecutionDuration:a5];
  [*(id *)(a1 + 32) setOutFinalSWStatus:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

@end