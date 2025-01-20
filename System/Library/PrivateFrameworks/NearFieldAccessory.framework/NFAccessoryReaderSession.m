@interface NFAccessoryReaderSession
+ (BOOL)supportsSecureCoding;
- (BOOL)checkNdefSupport:(BOOL *)a3 andWrite:(BOOL *)a4 error:(id *)a5;
- (BOOL)checkPresence:(id *)a3;
- (BOOL)connectTag:(id)a3 error:(id *)a4;
- (BOOL)disconnectTag:(id *)a3;
- (BOOL)startLpcdPolling:(id *)a3;
- (BOOL)startPolling:(id *)a3;
- (BOOL)startPollingForTechnology:(unsigned int)a3 error:(id *)a4;
- (BOOL)stopPolling:(id *)a3;
- (NFAccessoryReaderSessionDelegate)delegate;
- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4;
- (id)readNDEF:(id *)a3;
- (id)readTypeIdentifier:(id *)a3;
- (id)sendAccessoryProtocolCommand:(id)a3 outError:(id *)a4;
- (id)sendAuthProtocolCommand:(id)a3 error:(id *)a4;
- (id)setTagDataRate:(int)a3;
- (id)transceive:(id)a3 error:(id *)a4;
- (void)didDetectTags:(id)a3;
- (void)didEndUnexpectedly;
- (void)didTerminate:(id)a3;
- (void)endSessionWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NFAccessoryReaderSession

- (id)enableContinuousWave:(BOOL)a3 withFrequencySweep:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__NFAccessoryReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke;
  v12[3] = &unk_2644EC668;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  v8 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__NFAccessoryReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_2;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = a2;
  [v8 enableContinuousWave:v5 withFrequencySweep:v4 callback:v11];

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __82__NFAccessoryReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 21, v4);
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
    int v25 = 21;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __82__NFAccessoryReaderSession_InternalTest__enableContinuousWave_withFrequencySweep___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 25, v4);
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
      int v25 = 25;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFAccessoryReaderSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFAccessoryReaderSessionDelegate *)WeakRetained;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NFAccessoryReaderSession *)self setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)NFAccessoryReaderSession;
  [(NFAccessorySession *)&v5 endSessionWithCompletion:v4];
}

- (void)didTerminate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v8(5, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", v11, ClassName, Name, 72, v5);
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
    int v25 = 72;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl(&dword_21ECDA000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session has terminated due to: %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = [(NFAccessoryReaderSession *)self delegate];
  [(NFAccessoryReaderSession *)self endSessionWithCompletion:0];
  if (objc_opt_respondsToSelector()) {
    [v15 readerSessionDidEndUnexpectedly:self];
  }
}

- (void)didEndUnexpectedly
{
  v5.receiver = self;
  v5.super_class = (Class)NFAccessoryReaderSession;
  v3 = [(NFAccessorySession *)&v5 callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NFAccessoryReaderSession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_2644EC770;
  block[4] = self;
  dispatch_async(v3, block);
}

id __46__NFAccessoryReaderSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 readerSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NFAccessoryReaderSession;
  return objc_msgSendSuper2(&v6, sel_didEndUnexpectedly);
}

- (void)didDetectTags:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFAccessoryReaderSession;
  objc_super v5 = [(NFAccessorySession *)&v10 callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__NFAccessoryReaderSession_didDetectTags___block_invoke;
  v7[3] = &unk_2644EC798;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__NFAccessoryReaderSession_didDetectTags___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = [NFACTag alloc];
        objc_super v10 = -[NFACTag initWithInternalTag:](v9, "initWithInternalTag:", v8, (void)v14);
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [*(id *)(a1 + 40) delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    int v13 = [*(id *)(a1 + 40) delegate];
    [v13 readerSession:*(void *)(a1 + 40) didDetectTags:v2];
  }
}

- (BOOL)startLpcdPolling:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  long long v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__NFAccessoryReaderSession_startLpcdPolling___block_invoke;
  v10[3] = &unk_2644EC7C0;
  v10[5] = &v11;
  v10[6] = a2;
  v10[4] = self;
  uint64_t v6 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__NFAccessoryReaderSession_startLpcdPolling___block_invoke_13;
  v9[3] = &unk_2644EC7E8;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = &v17;
  v9[7] = a2;
  [v6 startPollingForTechnology:0 lpcd:1 callback:v9];

  if (a3) {
    *a3 = (id) v12[5];
  }
  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __45__NFAccessoryReaderSession_startLpcdPolling___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 116, v3);
  }
  dispatch_get_specific(*v4);
  objc_super v10 = NFSharedLogGetLogger();
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
    long long v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 116;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFAccessoryReaderSession_startLpcdPolling___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 121, v4);
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
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 121;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startPolling:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__NFAccessoryReaderSession_startPolling___block_invoke;
  v10[3] = &unk_2644EC7C0;
  v10[5] = &v11;
  v10[6] = a2;
  v10[4] = self;
  uint64_t v6 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__NFAccessoryReaderSession_startPolling___block_invoke_14;
  v9[3] = &unk_2644EC7E8;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = &v17;
  v9[7] = a2;
  [v6 startPollingForTechnology:0 lpcd:0 callback:v9];

  if (a3) {
    *a3 = (id) v12[5];
  }
  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __41__NFAccessoryReaderSession_startPolling___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 140, v3);
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
    long long v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 140;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __41__NFAccessoryReaderSession_startPolling___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 145, v4);
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
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 145;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)startPollingForTechnology:(unsigned int)a3 error:(id *)a4
{
  uint64_t v8 = _os_activity_create(&dword_21ECDA000, "startPollingForTechnology:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v9 = a3 & 0xF0 | (a3 >> 1) & 7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__NFAccessoryReaderSession_startPollingForTechnology_error___block_invoke;
  v14[3] = &unk_2644EC7C0;
  v14[5] = &state;
  v14[6] = a2;
  v14[4] = self;
  uint64_t v10 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__NFAccessoryReaderSession_startPollingForTechnology_error___block_invoke_15;
  v13[3] = &unk_2644EC7E8;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  [v10 startPollingForTechnology:v9 lpcd:0 callback:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __60__NFAccessoryReaderSession_startPollingForTechnology_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 189, v3);
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
    int v13 = object_getClassName(*(id *)(a1 + 32));
    long long v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 189;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_21ECDA000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __60__NFAccessoryReaderSession_startPollingForTechnology_error___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 194, v4);
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
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 194;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)stopPolling:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_21ECDA000, "stopPolling:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
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
  long long v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__NFAccessoryReaderSession_stopPolling___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  char v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__NFAccessoryReaderSession_stopPolling___block_invoke_16;
  v10[3] = &unk_2644EC7E8;
  v10[4] = self;
  v10[5] = &state;
  v10[6] = &v17;
  void v10[7] = a2;
  [v7 stopPolling:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __40__NFAccessoryReaderSession_stopPolling___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 216, v4);
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
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 216;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFAccessoryReaderSession_stopPolling___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      char v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 220, v4);
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
      long long v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 220;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)connectTag:(id)a3 error:(id *)a4
{
  id v7 = a3;
  char v8 = _os_activity_create(&dword_21ECDA000, "connectTag:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = objc_alloc(MEMORY[0x263F8C6A8]);
  uint64_t v10 = [v7 asDictionary];

  char v11 = (void *)[v9 initWithDictionary:v10];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy__0;
  __int16 v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__NFAccessoryReaderSession_connectTag_error___block_invoke;
  v16[3] = &unk_2644EC668;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  int v12 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __45__NFAccessoryReaderSession_connectTag_error___block_invoke_18;
  v15[3] = &unk_2644EC810;
  v15[4] = &state;
  v15[5] = &v22;
  [v12 connectTag:v11 callback:v15];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v13 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __45__NFAccessoryReaderSession_connectTag_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 243, v4);
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
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 243;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __45__NFAccessoryReaderSession_connectTag_error___block_invoke_18(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)disconnectTag:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_21ECDA000, "disconnectTag:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__NFAccessoryReaderSession_disconnectTag___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__NFAccessoryReaderSession_disconnectTag___block_invoke_19;
  v10[3] = &unk_2644EC810;
  v10[4] = &state;
  v10[5] = &v17;
  [v7 disconnectTag:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __42__NFAccessoryReaderSession_disconnectTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 269, v4);
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
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 269;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFAccessoryReaderSession_disconnectTag___block_invoke_19(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)checkPresence:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_21ECDA000, "checkPresence:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__NFAccessoryReaderSession_checkPresence___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__NFAccessoryReaderSession_checkPresence___block_invoke_20;
  v10[3] = &unk_2644EC838;
  v10[4] = &state;
  v10[5] = &v17;
  [v7 checkPresence:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __42__NFAccessoryReaderSession_checkPresence___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 295, v4);
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
    long long v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 295;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFAccessoryReaderSession_checkPresence___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)readNDEF:(id *)a3
{
  id v6 = _os_activity_create(&dword_21ECDA000, "readNDEF:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__NFAccessoryReaderSession_readNDEF___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a2;
  id v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__NFAccessoryReaderSession_readNDEF___block_invoke_22;
  v10[3] = &unk_2644EC860;
  v10[4] = &v12;
  v10[5] = &state;
  [v7 readRawNdef:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __37__NFAccessoryReaderSession_readNDEF___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 319, v4);
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
    id v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 319;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __37__NFAccessoryReaderSession_readNDEF___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)checkNdefSupport:(BOOL *)a3 andWrite:(BOOL *)a4 error:(id *)a5
{
  uint64_t v10 = _os_activity_create(&dword_21ECDA000, "checkNdefSupport:andWrite:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  int v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__NFAccessoryReaderSession_checkNdefSupport_andWrite_error___block_invoke;
  v15[3] = &unk_2644EC668;
  v15[4] = self;
  v15[5] = &state;
  void v15[6] = a2;
  char v11 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__NFAccessoryReaderSession_checkNdefSupport_andWrite_error___block_invoke_24;
  v14[3] = &unk_2644EC888;
  v14[4] = &v25;
  v14[5] = &v21;
  v14[6] = &state;
  [v11 checkNdefSupport:v14];

  if (a3) {
    *a3 = *((unsigned char *)v26 + 24);
  }
  if (a4) {
    *a4 = *((unsigned char *)v22 + 24);
  }
  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  BOOL v12 = *(void *)(state.opaque[1] + 40) == 0;
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v12;
}

void __60__NFAccessoryReaderSession_checkNdefSupport_andWrite_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 343, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 343;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __60__NFAccessoryReaderSession_checkNdefSupport_andWrite_error___block_invoke_24(void *a1, char a2, char a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

- (id)transceive:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_21ECDA000, "transceive:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__NFAccessoryReaderSession_transceive_error___block_invoke;
  v13[3] = &unk_2644EC668;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__NFAccessoryReaderSession_transceive_error___block_invoke_26;
  v12[3] = &unk_2644EC860;
  v12[4] = &v14;
  v12[5] = &state;
  [v9 transceive:v7 callback:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __45__NFAccessoryReaderSession_transceive_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 371, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 371;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __45__NFAccessoryReaderSession_transceive_error___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)sendAuthProtocolCommand:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  id v9 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(3, "%c[%{public}s %{public}s]:%i API has been deprecated!!!!", v15, ClassName, Name, 387);
  }
  dispatch_get_specific(*v8);
  uint64_t v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v23 = v18;
    __int16 v24 = 2082;
    int v25 = object_getClassName(self);
    __int16 v26 = 2082;
    id v27 = sel_getName(a2);
    __int16 v28 = 1024;
    int v29 = 387;
    _os_log_impl(&dword_21ECDA000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API has been deprecated!!!!", buf, 0x22u);
  }

  int v19 = [(NFAccessoryReaderSession *)self sendAccessoryProtocolCommand:v9 outError:a4];

  return v19;
}

- (id)sendAccessoryProtocolCommand:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_21ECDA000, "sendAccessoryProtocolCommand:outError:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__0;
  int v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  int v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__NFAccessoryReaderSession_sendAccessoryProtocolCommand_outError___block_invoke;
  v13[3] = &unk_2644EC668;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  id v9 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__NFAccessoryReaderSession_sendAccessoryProtocolCommand_outError___block_invoke_28;
  v12[3] = &unk_2644EC860;
  v12[4] = &v14;
  v12[5] = &state;
  [v9 transceiveAccessoryCommand:v7 callback:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __66__NFAccessoryReaderSession_sendAccessoryProtocolCommand_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 401, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = object_getClass(*(id *)(a1 + 32));
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
    int v25 = 401;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __66__NFAccessoryReaderSession_sendAccessoryProtocolCommand_outError___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)readTypeIdentifier:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_21ECDA000, "readTypeIdentifier:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__NFAccessoryReaderSession_readTypeIdentifier___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a2;
  id v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__NFAccessoryReaderSession_readTypeIdentifier___block_invoke_29;
  v10[3] = &unk_2644EC860;
  v10[4] = &v12;
  v10[5] = &state;
  [v7 readTypeIdentifier:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __47__NFAccessoryReaderSession_readTypeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 424, v4);
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
    int v25 = 424;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __47__NFAccessoryReaderSession_readTypeIdentifier___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)setTagDataRate:(int)a3
{
  uint64_t v6 = _os_activity_create(&dword_21ECDA000, "setTagDataRate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__NFAccessoryReaderSession_setTagDataRate___block_invoke;
  v11[3] = &unk_2644EC668;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFAccessorySession *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__NFAccessoryReaderSession_setTagDataRate___block_invoke_30;
  v10[3] = &unk_2644EC668;
  v10[4] = self;
  v10[5] = &state;
  void v10[6] = a2;
  [v7 setTagDataRate:a3 callback:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __43__NFAccessoryReaderSession_setTagDataRate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 446, v4);
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
    int v25 = 446;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFAccessoryReaderSession_setTagDataRate___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v5 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 450, v4);
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
      int v25 = 450;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21ECDA000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (void).cxx_destruct
{
}

@end