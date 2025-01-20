@interface PAAccessReader
+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 error:(id *)a5;
+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 withCancellationToken:(id)a5 error:(id *)a6;
+ (id)fileNameForExport;
+ (id)sharedInstance;
- (BOOL)lockedEnsureSandboxExtensionWithError:(id *)a3;
- (BOOL)loggingEnabled;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4;
- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5;
- (PAAccessReader)initWithQueue:(id)a3;
- (PAAccessReaderDelegate)delegate;
- (id)_accessRecordsForReportFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (id)getOrCreateStreamsWithError:(id *)a3;
- (id)publisherForAll;
- (id)publisherForAllSince:(double)a3 error:(id *)a4;
- (id)publisherForAllSince:(id)a3 until:(id)a4 reversed:(BOOL)a5 error:(id *)a6;
- (id)publisherForReportWithError:(id *)a3;
- (id)requestSandboxExtensionWithError:(id *)a3;
- (void)dealloc;
- (void)exportToFileHandle:(id)a3 completion:(id)a4;
- (void)handleEnabledChangeNotification;
- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3;
- (void)lockedSetEnabledStateForLoggingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledStateForLoggingEnabled:(BOOL)a3;
- (void)setLoggingEnabled:(BOOL)a3;
@end

@implementation PAAccessReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_instance_2;

  return v2;
}

uint64_t __32__PAAccessReader_sharedInstance__block_invoke()
{
  sharedInstance_instance_2 = [[PAAccessReader alloc] initWithQueue:0];

  return MEMORY[0x1F41817F8]();
}

- (PAAccessReader)initWithQueue:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.privacyaccountingd" options:4096];
  }
  else {
    v5 = 0;
  }
  v6 = [(PAAccessReader *)self initWithConnection:v5 queue:v4];
  v7 = v6;
  if (v6) {
    [(NSXPCConnection *)v6->_connection resume];
  }

  return v7;
}

- (BOOL)loggingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(PAAccessReader *)v2 lockedEnsureSandboxExtensionWithError:0];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PAAccessReader setEnabledStateForLoggingEnabled:](self, "setEnabledStateForLoggingEnabled:");
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v5 setLoggingEnabled:v3];
}

+ (id)fileNameForExport
{
  if (fileNameForExport_onceToken[0] != -1) {
    dispatch_once(fileNameForExport_onceToken, &__block_literal_global_27);
  }
  v2 = NSString;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v4 = (__CFDateFormatter *)fileNameForExport_formatter;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v3, v4, Current);
  v7 = [v2 stringWithFormat:@"App_Privacy_Report_v%ld_%@.ndjson", 4, StringWithAbsoluteTime];

  return v7;
}

void __35__PAAccessReader_fileNameForExport__block_invoke()
{
  ISO8601Formatter = CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  fileNameForExport_formatter = (uint64_t)ISO8601Formatter;

  CFDateFormatterSetFormat(ISO8601Formatter, @"yyyy-MM-dd'T'HH_mm_ss");
}

+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 error:(id *)a5
{
  return [a1 exportFromPublisher:a3 toStream:a4 withCancellationToken:0 error:a5];
}

+ (BOOL)exportFromPublisher:(id)a3 toStream:(id)a4 withCancellationToken:(id)a5 error:(id *)a6
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v13 = [MEMORY[0x1E4F1CA48] array];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke;
  v32[3] = &unk_1E5D71180;
  id v33 = v13;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_38;
  v27 = &unk_1E5D711A8;
  id v14 = v11;
  id v28 = v14;
  id v15 = v33;
  id v29 = v15;
  id v16 = v12;
  id v30 = v16;
  id v17 = v10;
  id v31 = v17;
  id v18 = (id)[v9 sinkWithCompletion:v32 shouldContinue:&v24];
  uint64_t v19 = objc_msgSend(v15, "count", v24, v25, v26, v27);
  if (a6 && v19)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28750];
    v35[0] = v15;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    *a6 = [v20 errorWithDomain:@"PAErrorDomain" code:13 userInfo:v21];
  }
  BOOL v22 = [v15 count] == 0;

  return v22;
}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1)
  {
    id v4 = logger_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_cold_1(v3, v4);
    }

    id v5 = *(void **)(a1 + 32);
    v6 = [v3 error];
    [v5 addObject:v6];
  }
}

BOOL __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1AD0EAC00]();
  if ([*(id *)(a1 + 32) cancelled])
  {
    id v5 = *(void **)(a1 + 40);
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:15 userInfo:0];
    [v5 addObject:v6];

    BOOL v7 = 0;
  }
  else
  {
    v8 = [v3 eventBody];
    id v9 = [v8 JSONObject];
    id v10 = (void *)[v9 mutableCopy];

    [v3 timestamp];
    double v12 = v11;
    v13 = [v3 eventBody];
    [v13 timestampAdjustment];
    double v15 = v12 + v14;
    id v16 = *(id *)(a1 + 48);
    id v17 = objc_opt_new();
    [v17 setFormatOptions:3955];
    [v17 setTimeZone:v16];

    id v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
    uint64_t v19 = [v17 stringFromDate:v18];

    [v10 setObject:v19 forKeyedSubscript:@"timeStamp"];
    v20 = *(void **)(a1 + 56);
    id v30 = 0;
    id v21 = v20;
    BOOL v22 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:2 error:&v30];
    v23 = v22;
    if (v22
      && (id v24 = v22,
          id v25 = v21,
          LODWORD(v24) = writeBytesToStream(v25, [v24 bytes], objc_msgSend(v24, "length"), &v30),
          v25,
          v24))
    {
      id v26 = v25;
      BOOL v7 = writeBytesToStream(v26, [@"\n" UTF8String], objc_msgSend(@"\n", "lengthOfBytesUsingEncoding:", 4), &v30);
    }
    else
    {
      BOOL v7 = 0;
    }

    id v27 = v30;
    if (!v7)
    {
      id v28 = logger_0();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_38_cold_1((uint64_t)v10, (uint64_t)v27, v28);
      }

      [*(id *)(a1 + 40) addObject:v27];
    }
  }

  return v7;
}

- (id)publisherForReportWithError:(id *)a3
{
  id v5 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() + -604800.0];
  v6 = [(PAAccessReader *)self publisherForAllSince:v5 until:0 reversed:1 error:a3];

  if (v6)
  {
    BOOL v7 = +[PAAccessPublisherPipelines accessPublisherWithoutOutOfProcessPickerAccesses:v6];

    v8 = +[PAAccessPublisherPipelines accessPublisherWithoutUnknownCategoryAccesses:v7];

    id v9 = +[PAAccessPublisherPipelines accessPublisherWithoutHiddenOrMissingApps:v8];

    v6 = +[PAAccessPublisherPipelines accessRecordsFromPublisher:v9 reversed:1];
  }

  return v6;
}

- (id)publisherForAll
{
  return [(PAAccessReader *)self publisherForAllSince:0 error:0.0];
}

- (id)publisherForAllSince:(double)a3 error:(id *)a4
{
  v6 = [NSNumber numberWithDouble:a3];
  BOOL v7 = [(PAAccessReader *)self publisherForAllSince:v6 until:0 reversed:0 error:a4];

  return v7;
}

- (id)publisherForAllSince:(id)a3 until:(id)a4 reversed:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  double v12 = [(PAAccessReader *)self getOrCreateStreamsWithError:a6];
  v13 = v12;
  if (v12)
  {
    id v26 = v11;
    id v27 = v10;
    double v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      if (v7) {
        id v19 = v11;
      }
      else {
        id v19 = v27;
      }
      if (v7) {
        id v20 = v27;
      }
      else {
        id v20 = v11;
      }
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v22 = [*(id *)(*((void *)&v30 + 1) + 8 * i) publisherWithStartTime:v19 endTime:v20 maxEvents:0 lastN:0 reversed:v7];
          [v14 addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    id v23 = objc_alloc(MEMORY[0x1E4F50220]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __60__PAAccessReader_publisherForAllSince_until_reversed_error___block_invoke;
    v28[3] = &__block_descriptor_33_e39_q24__0__BMStoreEvent_8__BMStoreEvent_16l;
    BOOL v29 = v7;
    id v24 = (void *)[v23 initWithPublishers:v14 comparator:v28];

    id v11 = v26;
    id v10 = v27;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

uint64_t __60__PAAccessReader_publisherForAllSince_until_reversed_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 timestamp];
  double v8 = v7;
  [v6 timestamp];
  if (v8 <= v9)
  {
    [v5 timestamp];
    double v13 = v12;
    [v6 timestamp];
    if (v13 >= v14)
    {
      uint64_t v15 = 0;
      goto LABEL_9;
    }
    BOOL v10 = *(unsigned char *)(a1 + 32) == 0;
    uint64_t v11 = -1;
  }
  else
  {
    BOOL v10 = *(unsigned char *)(a1 + 32) == 0;
    uint64_t v11 = 1;
  }
  if (v10) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = -v11;
  }
LABEL_9:

  return v15;
}

- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4
{
  return [(PAAccessReader *)self initWithConnection:a3 queue:a4 enablementChangedNotificationName:@"com.apple.PrivacyAccounting.toggled"];
}

- (PAAccessReader)initWithConnection:(id)a3 queue:(id)a4 enablementChangedNotificationName:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  dispatch_queue_t v10 = (dispatch_queue_t)a4;
  id v24 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PAAccessReader;
  uint64_t v11 = [(PAAccessReader *)&v30 init];
  if (v11)
  {
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v10)
    {
      double v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      double v13 = dispatch_get_global_queue(21, 0);
      dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.privacyaccounting.PAAccessReader", v12, v13);
    }
    objc_storeStrong((id *)&v11->_queue, v10);
    [v9 _setQueue:v11->_queue];
    double v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFF87D48];
    [v9 setRemoteObjectInterface:v14];
    objc_initWeak(&location, v11);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke;
    v27[3] = &unk_1E5D70E00;
    objc_copyWeak(&v28, &location);
    [v9 setInvalidationHandler:v27];
    objc_storeStrong((id *)&v11->_connection, a3);
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_enabledState = 0;
    id v15 = v24;
    uint64_t v16 = (const char *)[v15 UTF8String];
    queue = v11->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke_112;
    handler[3] = &unk_1E5D71130;
    objc_copyWeak(&v26, &location);
    p_enablementChangedNotificationToken = &v11->_enablementChangedNotificationToken;
    uint32_t v19 = notify_register_dispatch(v16, &v11->_enablementChangedNotificationToken, queue, handler);
    id v20 = logger_0();
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PAAccessReader initWithConnection:queue:enablementChangedNotificationName:]((uint64_t)v15, v19, v21);
      }

      int *p_enablementChangedNotificationToken = -1;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = *p_enablementChangedNotificationToken;
        *(_DWORD *)buf = 138543618;
        id v32 = v15;
        __int16 v33 = 1024;
        int v34 = v22;
        _os_log_impl(&dword_1A8FA5000, v21, OS_LOG_TYPE_INFO, "Registered for %{public}@ notifications with token=%d", buf, 0x12u);
      }
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke(uint64_t a1)
{
  v2 = logger_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A8FA5000, v2, OS_LOG_TYPE_INFO, "XPC connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEnabledStateForLoggingEnabled:0];
}

void __77__PAAccessReader_initWithConnection_queue_enablementChangedNotificationName___block_invoke_112(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = logger_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1A8FA5000, v4, OS_LOG_TYPE_INFO, "Received enablement changed notification with token=%d", (uint8_t *)v6, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleEnabledChangeNotification];
}

- (void)handleEnabledChangeNotification
{
  objc_initWeak(&location, self);
  id v3 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PAAccessReader_handleEnabledChangeNotification__block_invoke;
  v4[3] = &unk_1E5D711F0;
  objc_copyWeak(&v5, &location);
  [v3 loggingEnabledWithReply:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__PAAccessReader_handleEnabledChangeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEnabledStateForLoggingEnabled:a2];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  notify_cancel(self->_enablementChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PAAccessReader;
  [(PAAccessReader *)&v3 dealloc];
}

- (id)requestSandboxExtensionWithError:(id *)a3
{
  connection = self->_connection;
  if (connection)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint32_t v19 = __Block_byref_object_copy__1;
    id v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    double v13 = __Block_byref_object_copy__1;
    double v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke;
    v9[3] = &unk_1E5D71218;
    v9[4] = &v10;
    id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke_2;
    v8[3] = &unk_1E5D71240;
    v8[4] = &v10;
    v8[5] = &v16;
    [v5 requestSandboxExtensionForStoreBasePathWithReply:v8];

    if (a3) {
      *a3 = (id) v11[5];
    }
    id v6 = (id)v17[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:1 userInfo:0];
    id v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __51__PAAccessReader_requestSandboxExtensionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    uint64_t v11 = [PAAccessReaderSandboxExtension alloc];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = [(PAAccessReaderSandboxExtension *)v11 initWithToken:v9 forPath:v10 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)getOrCreateStreamsWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(PAAccessReader *)self lockedEnsureSandboxExtensionWithError:a3])
  {
    streams = self->_streams;
    if (streams)
    {
      id v6 = streams;
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F50278];
      id v8 = [(PAAccessReaderSandboxExtension *)self->_sandboxExtension path];
      id v9 = (void *)[v7 newPrivateStreamDefaultConfigurationWithStoreBasePath:v8 protectionClass:2];

      id v10 = +[PAAccess allAccessClasses];
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v17 = objc_alloc(MEMORY[0x1E4F50490]);
            uint64_t v18 = [v16 eventStreamIdentifier];
            uint32_t v19 = (void *)[v17 initWithPrivateStreamIdentifier:v18 storeConfig:v9];

            [v11 addObject:v19];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      uint64_t v20 = [v11 copy];
      int v22 = self->_streams;
      p_streams = (id *)&self->_streams;
      id *p_streams = (id)v20;

      id v6 = (NSArray *)*p_streams;
    }
  }
  else
  {
    id v6 = 0;
  }
  os_unfair_lock_unlock(lock);

  return v6;
}

- (void)setEnabledStateForLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PAAccessReader *)self lockedSetEnabledStateForLoggingEnabled:v3];

  os_unfair_lock_unlock(p_lock);
}

- (void)lockedNotifyDidSetLoggingEnabled:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(PAAccessReader *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PAAccessReader_lockedNotifyDidSetLoggingEnabled___block_invoke;
    block[3] = &unk_1E5D710E0;
    objc_copyWeak(&v9, &location);
    BOOL v10 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __51__PAAccessReader_lockedNotifyDidSetLoggingEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 reader:WeakRetained didSetLoggingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)exportToFileHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PAAccessReader_exportToFileHandle_completion___block_invoke;
  aBlock[3] = &unk_1E5D70E48;
  id v8 = v7;
  id v13 = v8;
  id v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    uint64_t v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
    [v11 exportToFileHandle:v6 reply:v9];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:1 userInfo:0];
    v9[2](v9, v11);
  }
}

uint64_t __48__PAAccessReader_exportToFileHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)lockedEnsureSandboxExtensionWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  [(PAAccessReader *)self lockedAssertValidEnabledState];
  switch(self->_enabledState)
  {
    case 0:
      id v18 = 0;
      id v5 = [(PAAccessReader *)self requestSandboxExtensionWithError:&v18];
      id v6 = v18;
      id v7 = v6;
      BOOL v8 = v5 != 0;
      if (v5) {
        goto LABEL_9;
      }
      id v9 = v6;
      BOOL v10 = [v9 domain];
      if ([v10 isEqualToString:@"PAErrorDomain"])
      {
        if ([v9 code] == 2)
        {

LABEL_21:
          char v15 = 3;
LABEL_23:
          self->_enabledState = v15;
          goto LABEL_24;
        }
        uint64_t v14 = [v9 code];

        if (v14 == 9) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      char v15 = 1;
      goto LABEL_23;
    case 1:
      goto LABEL_8;
    case 2:
      if (self->_sandboxExtension) {
        return 1;
      }
LABEL_8:
      id v17 = 0;
      id v5 = [(PAAccessReader *)self requestSandboxExtensionWithError:&v17];
      id v11 = v17;
      id v7 = v11;
      BOOL v8 = v5 != 0;
      if (v5)
      {
LABEL_9:
        [(PAAccessReader *)self lockedSetEnabledStateForLoggingEnabled:1];
        objc_storeStrong((id *)&self->_sandboxExtension, v5);
        goto LABEL_26;
      }
      id v9 = v11;
      id v12 = [v9 domain];
      if (([v12 isEqualToString:@"PAErrorDomain"] & 1) == 0)
      {

        goto LABEL_24;
      }
      if ([v9 code] == 2)
      {
      }
      else
      {
        uint64_t v13 = [v9 code];

        if (v13 != 9) {
          goto LABEL_24;
        }
      }
      [(PAAccessReader *)self lockedSetEnabledStateForLoggingEnabled:0];
LABEL_24:
      if (a3) {
        *a3 = v9;
      }
LABEL_26:

      return v8;
    case 3:
      if (!a3) {
        return 0;
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v8;
    default:
      return 0;
  }
}

- (void)lockedSetEnabledStateForLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(PAAccessReader *)self lockedAssertValidEnabledState];
  switch(self->_enabledState)
  {
    case 0:
      if (v3) {
        char v7 = 2;
      }
      else {
        char v7 = 3;
      }
      self->_enabledState = v7;
      break;
    case 1:
    case 3:
      if (v3)
      {
        self->_enabledState = 2;
        id v5 = self;
        uint64_t v6 = 1;
        goto LABEL_11;
      }
      break;
    case 2:
      if (!v3)
      {
        self->_enabledState = 3;
        sandboxExtension = self->_sandboxExtension;
        self->_sandboxExtension = 0;

        streams = self->_streams;
        self->_streams = 0;

        id v5 = self;
        uint64_t v6 = 0;
LABEL_11:
        [(PAAccessReader *)v5 lockedNotifyDidSetLoggingEnabled:v6];
      }
      break;
    default:
      return;
  }
}

- (PAAccessReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PAAccessReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streams, 0);

  objc_storeStrong((id *)&self->_sandboxExtension, 0);
}

- (id)_accessRecordsForReportFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v5 = sub_1A8FC7548();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5, v7);
  BOOL v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8, v11);
  uint64_t v13 = &v17[-v12];
  sub_1A8FC7538();
  sub_1A8FC7538();
  uint64_t v14 = (void *)sub_1A8FC3DD0((uint64_t)v13, (uint64_t)v10);
  char v15 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v15(v10, v5);
  v15(v13, v5);

  return v14;
}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 error];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_ERROR, "Export publisher completed with error=%{public}@", (uint8_t *)&v4, 0xCu);
}

void __75__PAAccessReader_exportFromPublisher_toStream_withCancellationToken_error___block_invoke_38_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_ERROR, "Failed to export entry=%@ with error=%{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithConnection:(uint64_t)a1 queue:(int)a2 enablementChangedNotificationName:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A8FA5000, log, OS_LOG_TYPE_ERROR, "Failed to register for %{public}@ notifications with code=%u", (uint8_t *)&v3, 0x12u);
}

@end