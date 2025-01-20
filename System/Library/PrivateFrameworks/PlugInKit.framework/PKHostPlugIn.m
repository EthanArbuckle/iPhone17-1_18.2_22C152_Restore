@interface PKHostPlugIn
- (BOOL)active;
- (BOOL)beginUsingRequest:(id)a3 error:(id *)a4;
- (BOOL)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 error:(id *)a5;
- (BOOL)beginUsingWithError:(id *)a3;
- (BOOL)beginUsingWithSubsystemOptions:(id)a3 error:(id *)a4;
- (BOOL)endUsingRequest:(id)a3 error:(id *)a4;
- (BOOL)endUsingWithError:(id *)a3;
- (BOOL)isSandboxed;
- (BOOL)loadExtensions:(id)a3 error:(id *)a4;
- (BOOL)spent;
- (BOOL)terminating;
- (BOOL)useBundle:(id)a3 error:(id *)a4;
- (NSArray)preferredLanguages;
- (NSArray)sandboxExtensions;
- (NSBundle)embeddedBundle;
- (NSDate)beganUsingAt;
- (NSDictionary)discoveryExtensions;
- (NSDictionary)environment;
- (NSDictionary)extensionState;
- (NSDictionary)sourceForm;
- (NSMutableSet)requests;
- (NSString)description;
- (NSString)sandboxProfile;
- (NSString)serviceExtension;
- (NSUUID)effectiveUUID;
- (NSUUID)multipleInstanceUUID;
- (NSUUID)supersedingUUID;
- (NSUserDefaults)defaults;
- (NSXPCConnection)pluginConnection;
- (OS_dispatch_queue)_replyQueue;
- (OS_dispatch_queue)_startQueue;
- (OS_dispatch_queue)_syncQueue;
- (PKCorePlugInProtocol)service;
- (PKCorePlugInProtocol)syncService;
- (PKHost)host;
- (PKHostPlugIn)initWithForm:(id)a3 host:(id)a4;
- (PKPlugIn)supersededBy;
- (Protocol)queuedHostProtocol;
- (id)createInstanceWithUUID:(id)a3;
- (id)embeddedPrincipal;
- (id)notificationBlock;
- (id)plugInPrincipal;
- (id)queuedHostPrincipal;
- (int64_t)userElection;
- (unint64_t)state;
- (unsigned)useCount;
- (void)_validatePersona;
- (void)addRequestUUID:(id)a3;
- (void)beginUsing:(id)a3;
- (void)beginUsingRequest:(id)a3 completion:(id)a4;
- (void)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 completion:(id)a5;
- (void)beginUsingWithSubsystemOptions:(id)a3 completion:(id)a4;
- (void)changeState:(unint64_t)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)endUsing:(id)a3;
- (void)endUsingRequest:(id)a3 completion:(id)a4;
- (void)preparePlugInUsingService:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setBeganUsingAt:(id)a3;
- (void)setBootstrapWithSubsystemOptions:(id)a3;
- (void)setDiscoveryExtensions:(id)a3;
- (void)setEmbeddedBundle:(id)a3;
- (void)setEmbeddedPrincipal:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setExtensionState:(id)a3;
- (void)setHost:(id)a3;
- (void)setHostPrincipal:(id)a3 withProtocol:(id)a4;
- (void)setMultipleInstanceUUID:(id)a3;
- (void)setNotificationBlock:(id)a3;
- (void)setPlugInPrincipal:(id)a3;
- (void)setPluginConnection:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setQueuedHostPrincipal:(id)a3;
- (void)setQueuedHostProtocol:(id)a3;
- (void)setSandboxExtensions:(id)a3;
- (void)setSandboxProfile:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceExtension:(id)a3;
- (void)setSourceForm:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSupersededBy:(id)a3;
- (void)setSupersedingUUID:(id)a3;
- (void)setSyncService:(id)a3;
- (void)setTerminating:(BOOL)a3;
- (void)setUseCount:(unsigned int)a3;
- (void)setUserElection:(int64_t)a3;
- (void)set_replyQueue:(id)a3;
- (void)set_startQueue:(id)a3;
- (void)set_syncQueue:(id)a3;
- (void)startPlugInRequest:(id)a3 synchronously:(BOOL)a4 subsystemOptions:(id)a5 completion:(id)a6;
- (void)suspend;
- (void)unwind:(unint64_t)a3 force:(BOOL)a4;
- (void)updateFromForm:(id)a3 host:(id)a4;
@end

@implementation PKHostPlugIn

- (void)updateFromForm:(id)a3 host:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKHostPlugIn;
  id v6 = a4;
  [(PKPlugInCore *)&v11 updateFromForm:a3];
  v7 = [(PKHostPlugIn *)self sourceForm];
  v8 = [(PKPlugInCore *)self annotations];
  v9 = (void *)[v8 copy];
  v10 = [v7 dictionaryChanging:@"annotations" to:v9];
  [(PKHostPlugIn *)self setSourceForm:v10];

  [(PKHostPlugIn *)self setHost:v6];
}

- (int64_t)userElection
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v3 = [(PKHostPlugIn *)self _syncQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B38B29FC;
  v11[3] = &unk_1E6058C78;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v3, v11);

  v4 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(PKPlugInCore *)self uuid];
    v8 = [(PKPlugInCore *)self identifier];
    v9 = [(PKPlugInCore *)self version];
    uint64_t v10 = v13[3];
    *(_DWORD *)buf = 138544386;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2080;
    v23 = "-[PKHostPlugIn userElection]";
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    _os_log_debug_impl(&dword_1B38B0000, v4, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);
  }
  int64_t v5 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (OS_dispatch_queue)_syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 272, 1);
}

- (NSUUID)supersedingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSupersededBy:(id)a3
{
}

- (PKHostPlugIn)initWithForm:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 external];
  v28.receiver = self;
  v28.super_class = (Class)PKHostPlugIn;
  v9 = [(PKPlugInCore *)&v28 initWithForm:v6 externalProviders:v8];

  if (v9)
  {
    [(PKHostPlugIn *)v9 setSourceForm:v6];
    [(PKHostPlugIn *)v9 setHost:v7];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"overrider"];
    if (v10)
    {
      objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      [(PKHostPlugIn *)v9 setSupersedingUUID:v11];
    }
    uint64_t v12 = +[PKCapabilities frameworkQueueAttr];
    id v13 = [NSString alloc];
    uint64_t v14 = [(PKPlugInCore *)v9 identifier];
    uint64_t v15 = (void *)[v13 initWithFormat:@"PKPlugIn sync (%@)", v14];

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v12);
    [(PKHostPlugIn *)v9 set_syncQueue:v17];

    id v18 = [NSString alloc];
    v19 = [(PKPlugInCore *)v9 identifier];
    __int16 v20 = (void *)[v18 initWithFormat:@"PKPlugIn start (%@)", v19];

    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], v12);
    [(PKHostPlugIn *)v9 set_startQueue:v22];

    v23 = [v6 objectForKeyedSubscript:@"extensions"];
    [(PKHostPlugIn *)v9 setDiscoveryExtensions:v23];

    __int16 v24 = [v6 objectForKeyedSubscript:@"service-extension"];
    [(PKHostPlugIn *)v9 setServiceExtension:v24];

    uint64_t v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requests = v9->_requests;
    v9->_requests = v25;
  }
  return v9;
}

- (void)set_syncQueue:(id)a3
{
}

- (void)set_startQueue:(id)a3
{
}

- (void)setSourceForm:(id)a3
{
}

- (void)setServiceExtension:(id)a3
{
}

- (void)setHost:(id)a3
{
}

- (void)setDiscoveryExtensions:(id)a3
{
}

- (NSDictionary)sourceForm
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)PKHostPlugIn;
  v4 = [(PKPlugInCore *)&v8 description];
  int64_t v5 = [(PKHostPlugIn *)self multipleInstanceUUID];
  id v6 = objc_msgSend(v3, "initWithFormat:", @"<id<PKPlugIn>: %p; core = %@, instance = [%@], state = %lu, useCount = %d>",
                 self,
                 v4,
                 v5,
                 [(PKHostPlugIn *)self state],
                 [(PKHostPlugIn *)self useCount]);

  return (NSString *)v6;
}

- (NSUserDefaults)defaults
{
  if (!self->_defaults)
  {
    id v3 = [[PKHostDefaults alloc] initWithPlugIn:self];
    defaults = self->_defaults;
    self->_defaults = &v3->super;
  }
  int64_t v5 = self->_defaults;
  return v5;
}

- (void)setUserElection:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v5 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PKPlugInCore *)self uuid];
    id v7 = [(PKPlugInCore *)self identifier];
    objc_super v8 = [(PKPlugInCore *)self version];
    *(_DWORD *)buf = 138544386;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    dispatch_queue_t v17 = v8;
    __int16 v18 = 2080;
    v19 = "-[PKHostPlugIn setUserElection:]";
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);
  }
  v9 = [(PKHostPlugIn *)self _syncQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B38B8620;
  v11[3] = &unk_1E6058CA0;
  v11[4] = self;
  v11[5] = a3;
  dispatch_sync(v9, v11);

  uint64_t v10 = [(PKHostPlugIn *)self host];
  [v10 setElection:a3 forPlugIn:self];
}

- (NSDictionary)extensionState
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1B38B788C;
  objc_super v11 = sub_1B38B7864;
  id v12 = 0;
  id v3 = [(PKHostPlugIn *)self _syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B38B87C0;
  v6[3] = &unk_1E6058C78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (!v8[5])
  {
    v8[5] = MEMORY[0x1E4F1CC08];
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setExtensionState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PKHostPlugIn *)self _syncQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1B38B8900;
  objc_super v11 = &unk_1E6058CC8;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);

  uint64_t v7 = [(PKHostPlugIn *)self host];
  [v7 setExtensionState:v6 forPlugIn:self];
}

- (void)suspend
{
}

- (void)resume
{
}

- (BOOL)active
{
  return [(PKHostPlugIn *)self state] == 1;
}

- (BOOL)spent
{
  return [(PKHostPlugIn *)self state] == 4;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F292F8]];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"synchronous"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    [v6 invoke];
  }
  else
  {
    [v6 retainArguments];
    objc_super v11 = [(PKHostPlugIn *)self _replyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38B8A90;
    block[3] = &unk_1E6058CF0;
    id v13 = v6;
    dispatch_async(v11, block);
  }
}

- (void)setHostPrincipal:(id)a3 withProtocol:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(PKHostPlugIn *)self plugInPrincipal];

  if (!v7)
  {
    [(PKHostPlugIn *)self setQueuedHostPrincipal:v8];
    [(PKHostPlugIn *)self setQueuedHostProtocol:v6];
  }
}

- (id)createInstanceWithUUID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1B38B788C;
  __int16 v16 = sub_1B38B7864;
  id v17 = 0;
  int64_t v5 = [(PKHostPlugIn *)self _syncQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B38B8CA8;
  v11[3] = &unk_1E6058C78;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v5, v11);

  id v6 = [PKHostPlugIn alloc];
  uint64_t v7 = v13[5];
  id v8 = [(PKHostPlugIn *)self host];
  uint64_t v9 = [(PKHostPlugIn *)v6 initWithForm:v7 host:v8];

  [(PKHostPlugIn *)v9 setMultipleInstanceUUID:v4];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (NSUUID)effectiveUUID
{
  id v3 = [(PKHostPlugIn *)self multipleInstanceUUID];

  if (v3) {
    [(PKHostPlugIn *)self multipleInstanceUUID];
  }
  else {
  id v4 = [(PKPlugInCore *)self uuid];
  }
  return (NSUUID *)v4;
}

- (void)_validatePersona
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([(PKPlugInCore *)self usesHostPersona])
  {
    int current_persona = voucher_get_current_persona();
    if (current_persona != -1)
    {
      int v4 = current_persona;
      long long v41 = 0u;
      memset(v42, 0, sizeof(v42));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      LODWORD(v22) = 1;
      if ((kpersona_info() & 0x80000000) != 0)
      {
        int v12 = *__error();
        int64_t v5 = pklog_handle_for_category(13);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          id v13 = [(PKPlugInCore *)self uuid];
          uint64_t v14 = [(PKHostPlugIn *)self multipleInstanceUUID];
          uint64_t v15 = [(PKPlugInCore *)self identifier];
          __int16 v16 = [(PKPlugInCore *)self version];
          int v17 = 138544642;
          *(void *)__int16 v18 = v13;
          *(_WORD *)&v18[8] = 2114;
          *(void *)&v18[10] = v14;
          *(_WORD *)&v18[18] = 2112;
          uint64_t v19 = (uint64_t)v15;
          LOWORD(v20) = 2112;
          *(void *)((char *)&v20 + 2) = v16;
          WORD5(v20) = 1024;
          HIDWORD(v20) = v4;
          LOWORD(v21) = 2080;
          *(void *)((char *)&v21 + 2) = strerror(v12);
          _os_log_error_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Could not get current persona info for id:%d with error:%s", (uint8_t *)&v17, 0x3Au);
        }
        goto LABEL_10;
      }
      if (DWORD2(v22) != 2 && DWORD2(v22) != 5)
      {
        int64_t v5 = pklog_handle_for_category(13);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          sub_1B38D1D0C((uint64_t)self, (uint64_t)v5, v6, v7, v8, v9, v10, v11, v17, *(uint64_t *)&v18[4], *(uint64_t *)&v18[12], v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23,
        }
            *((uint64_t *)&v23 + 1),
            v24,
            *((uint64_t *)&v24 + 1),
            v25,
            *((uint64_t *)&v25 + 1));
LABEL_10:
      }
    }
  }
}

- (void)beginUsing:(id)a3
{
}

- (void)beginUsingWithSubsystemOptions:(id)a3 completion:(id)a4
{
}

- (void)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PKHostPlugIn *)self _validatePersona];
  int v11 = PKGetThreadPriority();
  int v12 = pklog_handle_for_category(0);
  uint64_t v13 = os_signpost_id_generate(v12);

  uint64_t v14 = pklog_handle_for_category(7);
  uint64_t v15 = v14;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    __int16 v16 = [(PKPlugInCore *)self identifier];
    int v17 = [(PKPlugInCore *)self uuid];
    *(_DWORD *)buf = 138478339;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    __int16 v47 = 1026;
    int v48 = v11;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority=%{public, signpost.description:attribute}d ", buf, 0x1Cu);
  }
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = sub_1B38B9240;
  uint64_t v43 = &unk_1E6058D18;
  id v44 = v10;
  uint64_t v45 = v13;
  id v18 = v10;
  uint64_t v19 = (void *)MEMORY[0x1B3EBB710](&v40);
  uint64_t v20 = _CFXPCCreateXPCObjectFromCFObject();
  long long v21 = (void *)v20;
  if (v9 && !v20)
  {
    long long v22 = pklog_handle_for_category(8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_1B38D1DCC((uint64_t)self, (uint64_t)v9, (uint64_t)v22, v23, v24, v25, v26, v27, v32, v33, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v42,
    }
        (uint64_t)v43,
        (uint64_t)v44,
        v45,
        *(uint64_t *)buf,
        *(uint64_t *)&buf[8]);
  }
  long long v28 = [(PKHostPlugIn *)self _startQueue];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  long long v34 = sub_1B38B9328;
  long long v35 = &unk_1E6058D40;
  long long v36 = self;
  id v37 = v8;
  id v38 = v21;
  id v39 = v19;
  id v29 = v19;
  id v30 = v21;
  id v31 = v8;
  dispatch_async(v28, &v32);
}

- (void)beginUsingRequest:(id)a3 completion:(id)a4
{
}

- (BOOL)beginUsingWithError:(id *)a3
{
  return MEMORY[0x1F4181798](self, sel_beginUsingWithSubsystemOptions_error_);
}

- (BOOL)beginUsingWithSubsystemOptions:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_beginUsingRequest_withSubsystemOptions_error_);
}

- (BOOL)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(PKHostPlugIn *)self _validatePersona];
  int v10 = PKGetThreadPriority();
  int v11 = pklog_handle_for_category(0);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = pklog_handle_for_category(7);
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v15 = [(PKPlugInCore *)self identifier];
    __int16 v16 = [(PKPlugInCore *)self uuid];
    *(_DWORD *)buf = 138478339;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&unsigned char buf[22] = 1026;
    LODWORD(v34) = v10;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority=%{public, signpost.description:attribute}d ", buf, 0x1Cu);
  }
  uint64_t v17 = _CFXPCCreateXPCObjectFromCFObject();
  id v18 = (void *)v17;
  if (v9 && !v17)
  {
    uint64_t v19 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1B38D1E98((uint64_t)v9, v19);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v34 = sub_1B38B788C;
  long long v35 = sub_1B38B7864;
  id v36 = 0;
  uint64_t v20 = [(PKHostPlugIn *)self _startQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1B38B96A0;
  v27[3] = &unk_1E6058D90;
  v27[4] = self;
  id v21 = v8;
  id v28 = v21;
  id v22 = v18;
  id v29 = v22;
  id v30 = buf;
  dispatch_sync(v20, v27);

  uint64_t v23 = *(void **)(*(void *)&buf[8] + 40);
  if (a5 && v23) {
    *a5 = v23;
  }
  uint64_t v24 = pklog_handle_for_category(7);
  uint64_t v25 = v24;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)id v31 = 67240192;
    BOOL v32 = v23 == 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v25, OS_SIGNPOST_INTERVAL_END, v12, "HostBeginUsing", " success=%{public, signpost.description:attribute}d ", v31, 8u);
  }

  _Block_object_dispose(buf, 8);
  return v23 == 0;
}

- (BOOL)beginUsingRequest:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_beginUsingRequest_withSubsystemOptions_error_);
}

- (void)addRequestUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(PKHostPlugIn *)self _syncQueue];
    dispatch_assert_queue_V2(v5);

    uint64_t v6 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(PKPlugInCore *)self uuid];
      id v8 = [(PKHostPlugIn *)self multipleInstanceUUID];
      id v9 = [(PKPlugInCore *)self identifier];
      int v10 = [(PKPlugInCore *)self version];
      int v19 = 138544386;
      *(void *)uint64_t v20 = v7;
      *(_WORD *)&v20[8] = 2114;
      *(void *)&v20[10] = v8;
      *(_WORD *)&v20[18] = 2112;
      id v21 = v9;
      *(_WORD *)id v22 = 2112;
      *(void *)&v22[2] = v10;
      *(_WORD *)&v22[10] = 2112;
      *(void *)&v22[12] = v4;
      _os_log_impl(&dword_1B38B0000, v6, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] adding request: %@", (uint8_t *)&v19, 0x34u);
    }
    int v11 = [(PKHostPlugIn *)self requests];
    [v11 addObject:v4];

    os_signpost_id_t v12 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D1F10((uint64_t)self, (uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, *(uint64_t *)&v20[4], *(uint64_t *)&v20[12], v21, *(uint64_t *)v22, *(uint64_t *)&v22[8], *(uint64_t *)&v22[16], v23, v24, v25, v26,
    }
        v27,
        v28,
        v29,
        v30,
        v31);
  }
}

- (void)startPlugInRequest:(id)a3 synchronously:(BOOL)a4 subsystemOptions:(id)a5 completion:(id)a6
{
  BOOL v86 = a4;
  v155[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v90 = a5;
  id v11 = a6;
  os_signpost_id_t v12 = [(PKHostPlugIn *)self _startQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(PKHostPlugIn *)self _replyQueue];

  if (!v13)
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [(PKPlugInCore *)self identifier];
    id v16 = [v14 stringWithFormat:@"PlugInKit reply:%@", v15];
    uint64_t v17 = (const char *)[v16 UTF8String];
    uint64_t v18 = +[PKCapabilities frameworkQueueAttr];
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    [(PKHostPlugIn *)self set_replyQueue:v19];
  }
  uint64_t v20 = [v10 uuid];
  v89 = [v10 launchPersona];
  id v21 = [(PKHostPlugIn *)self host];
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 0;
  id v22 = [(PKHostPlugIn *)self _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38BA660;
  block[3] = &unk_1E6058DB8;
  void block[4] = self;
  id v23 = v20;
  id v112 = v23;
  id v24 = v11;
  id v113 = v24;
  v114 = &v115;
  dispatch_sync(v22, block);

  if (*((unsigned char *)v116 + 24))
  {
    uint64_t v25 = pklog_handle_for_category(7);
    if (os_signpost_enabled(v25))
    {
      uint64_t v26 = [(PKPlugInCore *)self identifier];
      uint64_t v27 = [(PKPlugInCore *)self uuid];
      unsigned int v28 = [(PKHostPlugIn *)self useCount];
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      *(_WORD *)&unsigned char buf[22] = 2050;
      *(void *)&unsigned char buf[24] = v28;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HostStartBypass", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  count=%{public, signpost.description:attribute}lu ", buf, 0x20u);
    }
    goto LABEL_29;
  }
  uint64_t v25 = [(PKPlugInCore *)self diagnose];
  if (!v25)
  {
    uint64_t v30 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v85 = [(PKPlugInCore *)self uuid];
      v83 = [(PKHostPlugIn *)self multipleInstanceUUID];
      v79 = [(PKPlugInCore *)self identifier];
      id v39 = [(PKPlugInCore *)self version];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v85;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v83;
      *(_WORD *)&unsigned char buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v79;
      LOWORD(v138[0]) = 2112;
      *(void *)((char *)v138 + 2) = v39;
      _os_log_debug_impl(&dword_1B38B0000, v30, OS_LOG_TYPE_DEBUG, "[u %{public}@:m %{public}@] [%@(%@)] suspending startQueue", buf, 0x2Au);
    }
    uint64_t v31 = [(PKHostPlugIn *)self _startQueue];
    dispatch_suspend(v31);

    v109[0] = 0;
    v109[1] = v109;
    v109[2] = 0x3032000000;
    v109[3] = sub_1B38B788C;
    v109[4] = sub_1B38B7864;
    id v110 = 0;
    objc_initWeak(&location, self);
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_1B38BA940;
    v103[3] = &unk_1E6058DE0;
    objc_copyWeak(&v107, &location);
    id v78 = v21;
    id v104 = v78;
    id v105 = v24;
    v106 = v109;
    v82 = (void (**)(void, void, void))MEMORY[0x1B3EBB710](v103);
    [(PKHostPlugIn *)self setTerminating:0];
    BOOL v32 = [v78 activatePlugIn:self];
    v84 = v32;
    if (v32 == self)
    {
      uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2, self, @"PKHostPlugIn.m", 521, @"inactive/activating self %@ not in active dictionary", self object file lineNumber description];

      if (v84) {
        goto LABEL_14;
      }
    }
    else if (v32)
    {
LABEL_14:
      uint64_t v33 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v88 = [(PKPlugInCore *)self uuid];
        v80 = [(PKHostPlugIn *)self multipleInstanceUUID];
        spida = [(PKPlugInCore *)self identifier];
        v72 = [(PKPlugInCore *)self version];
        v70 = [(PKPlugInCore *)v84 uuid];
        uint64_t v40 = [(PKHostPlugIn *)v84 multipleInstanceUUID];
        uint64_t v41 = [(PKPlugInCore *)v84 identifier];
        v42 = [(PKPlugInCore *)v84 version];
        *(_DWORD *)buf = 138545154;
        *(void *)&uint8_t buf[4] = v88;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v80;
        *(_WORD *)&unsigned char buf[22] = 2112;
        *(void *)&unsigned char buf[24] = spida;
        LOWORD(v138[0]) = 2112;
        *(void *)((char *)v138 + 2) = v72;
        HIWORD(v138[2]) = 2114;
        *(void *)&v138[3] = v70;
        LOWORD(v138[5]) = 2114;
        *(void *)((char *)&v138[5] + 2) = v40;
        HIWORD(v138[7]) = 2112;
        v139[0] = v41;
        LOWORD(v139[1]) = 2112;
        *(void *)((char *)&v139[1] + 2) = v42;
        _os_log_error_impl(&dword_1B38B0000, v33, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; different plugin with same identifier already act"
          "ive: [u %{public}@:m %{public}@] [%@(%@)] ",
          buf,
          0x52u);
      }
      long long v34 = [NSString stringWithFormat:@"other version in use: %@", v84];
      long long v35 = pkError(16, v34);
      ((void (**)(void, void *, void))v82)[2](v82, v35, 0);

LABEL_28:
      objc_destroyWeak(&v107);
      objc_destroyWeak(&location);
      _Block_object_dispose(v109, 8);

      goto LABEL_29;
    }
    id v44 = [(PKHostPlugIn *)self _syncQueue];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = sub_1B38BAC3C;
    v102[3] = &unk_1E6058CF0;
    v102[4] = self;
    dispatch_sync(v44, v102);

    MEMORY[0x1B3EBBCA0]();
    v155[0] = self;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:1];
    long long v153 = 0u;
    memset(v154, 0, sizeof(v154));
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v140 = 0u;
    memset(v139, 0, sizeof(v139));
    memset(v138, 0, sizeof(v138));
    memset(buf, 0, sizeof(buf));
    v100 = 0;
    v101 = 0;
    uint64_t current_persona = voucher_get_current_persona();
    int v46 = current_persona;
    memset(buf, 0, sizeof(buf));
    memset(v138, 0, sizeof(v138));
    memset(v139, 0, sizeof(v139));
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    memset(v154, 0, sizeof(v154));
    *(_DWORD *)buf = 1;
    pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v101, &v100);
    __int16 v47 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      int v68 = v46;
      spidb = [(PKPlugInCore *)self uuid];
      v71 = [(PKHostPlugIn *)self multipleInstanceUUID];
      v69 = [(PKPlugInCore *)self identifier];
      int v48 = [(PKPlugInCore *)self version];
      uid_t v49 = geteuid();
      uid_t v50 = getuid();
      *(_DWORD *)v119 = 138545410;
      v120 = spidb;
      __int16 v121 = 2114;
      v122 = v71;
      __int16 v123 = 2112;
      v124 = v69;
      __int16 v125 = 2112;
      v126 = v48;
      __int16 v127 = 1024;
      uid_t v128 = v49;
      __int16 v129 = 1024;
      uid_t v130 = v50;
      __int16 v131 = 1024;
      int v132 = v68;
      __int16 v133 = 2080;
      v134 = v101;
      __int16 v135 = 2080;
      v136 = v100;
      _os_log_impl(&dword_1B38B0000, v47, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Ready plugins sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v119, 0x50u);
    }
    v51 = pklog_handle_for_category(7);
    os_signpost_id_t spid = os_signpost_id_make_with_pointer(v51, self);

    v52 = pklog_handle_for_category(7);
    v53 = v52;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      v54 = [(PKPlugInCore *)self identifier];
      v55 = [(PKPlugInCore *)self uuid];
      *(_DWORD *)buf = 138478083;
      *(void *)&uint8_t buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v55;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v53, OS_SIGNPOST_INTERVAL_BEGIN, spid, "HostToDaemonReadyPlugIns", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);
    }
    id v56 = objc_alloc(MEMORY[0x1E4F29268]);
    v57 = [(PKPlugInCore *)self infoKey:@"CFBundleIdentifier"];
    v58 = (void *)[v56 initWithServiceName:v57];

    [(PKHostPlugIn *)self setPluginConnection:v58];
    [(PKHostPlugIn *)self setBootstrapWithSubsystemOptions:v90];
    v59 = [(PKHostPlugIn *)self preferredLanguages];
    v60 = v59;
    if (!v59)
    {
      v60 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    }
    id v61 = v60;
    if (!v59) {

    }
    v62 = [(PKHostPlugIn *)self environment];
    uint64_t v63 = [(PKHostPlugIn *)self sandboxProfile];
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = sub_1B38BAC48;
    v91[3] = &unk_1E6058EF8;
    os_signpost_id_t v98 = spid;
    v91[4] = self;
    v96 = v82;
    id v64 = v78;
    v81 = (void *)v63;
    v65 = v61;
    id v66 = v64;
    id v92 = v64;
    v97 = v109;
    id spidc = v58;
    id v93 = spidc;
    id v67 = v73;
    id v94 = v67;
    BOOL v99 = v86;
    id v95 = v23;
    [v66 readyPlugIns:v67 synchronously:v86 environment:v62 languages:v65 persona:v89 sandbox:v81 ready:v91];

    goto LABEL_28;
  }
  uint64_t v29 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v87 = [(PKPlugInCore *)self uuid];
    id v36 = [(PKHostPlugIn *)self multipleInstanceUUID];
    uint64_t v37 = [(PKPlugInCore *)self identifier];
    id v38 = [(PKPlugInCore *)self version];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v87;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v36;
    *(_WORD *)&unsigned char buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v37;
    LOWORD(v138[0]) = 2112;
    *(void *)((char *)v138 + 2) = v38;
    HIWORD(v138[2]) = 2112;
    *(void *)&v138[3] = v25;
    _os_log_error_impl(&dword_1B38B0000, v29, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; failed pre-screen: %@",
      buf,
      0x34u);
  }
  (*((void (**)(id, NSObject *))v24 + 2))(v24, v25);
LABEL_29:

  _Block_object_dispose(&v115, 8);
}

- (void)preparePlugInUsingService:(id)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKHostPlugIn *)self queuedHostProtocol];

  if (v8)
  {
    id v9 = NSString;
    id v10 = [(PKHostPlugIn *)self queuedHostProtocol];
    id v8 = [v9 stringWithUTF8String:protocol_getName(v10)];

    id v11 = (void *)MEMORY[0x1E4F29280];
    os_signpost_id_t v12 = [(PKHostPlugIn *)self queuedHostProtocol];
    uint64_t v13 = [v11 interfaceWithProtocol:v12];

    uint64_t v14 = [(PKHostPlugIn *)self pluginConnection];
    uint64_t v15 = [v14 remoteObjectInterface];
    [v15 setInterface:v13 forSelector:sel_beginUsingPlugIn_ready_ argumentIndex:0 ofReply:0];
  }
  unint64_t v16 = [(PKPlugInCore *)self hubProtocolVersion];
  if (v16 == 2)
  {
    id v23 = objc_opt_new();
    id v24 = [(PKPlugInCore *)self identifier];
    [v23 setObject:v24 forKeyedSubscript:@"identifier"];

    uint64_t v25 = [(PKPlugInCore *)self uuid];
    uint64_t v26 = [v25 UUIDString];
    [v23 setObject:v26 forKeyedSubscript:@"uuid"];

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
    [v23 setObject:v27 forKeyedSubscript:@"version"];

    unsigned int v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PKPlugInCore isRBManaged](self, "isRBManaged"));
    [v23 setObject:v28 forKeyedSubscript:@"isRBManaged"];

    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[PKPlugInCore extensionPointPlatform](self, "extensionPointPlatform"));
    [v23 setObject:v29 forKeyedSubscript:@"epPlatform"];

    if (v8) {
      [v23 setObject:v8 forKeyedSubscript:@"hostProtocol"];
    }
    uint64_t v30 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(PKPlugInCore *)self uuid];
      BOOL v32 = [(PKPlugInCore *)self identifier];
      uint64_t v33 = [(PKPlugInCore *)self version];
      BOOL v34 = [(PKPlugInCore *)self isRBManaged];
      long long v35 = "non-";
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v31;
      __int16 v42 = 2112;
      uint64_t v43 = v32;
      if (v34) {
        long long v35 = (const char *)&unk_1B38D959D;
      }
      __int16 v44 = 2112;
      uint64_t v45 = v33;
      __int16 v46 = 2080;
      __int16 v47 = v35;
      _os_log_impl(&dword_1B38B0000, v30, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Sending prepareUsing to %smanaged extension; this should launch it if not already running.",
        buf,
        0x2Au);
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1B38BD62C;
    v36[3] = &unk_1E6058F48;
    id v37 = v7;
    [v6 prepareUsing:v23 reply:v36];
  }
  else if (v16 == 1)
  {
    uint64_t v17 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(PKPlugInCore *)self uuid];
      dispatch_queue_t v19 = [(PKHostPlugIn *)self multipleInstanceUUID];
      uint64_t v20 = [(PKPlugInCore *)self identifier];
      id v21 = [(PKPlugInCore *)self version];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v18;
      __int16 v42 = 2114;
      uint64_t v43 = v19;
      __int16 v44 = 2112;
      uint64_t v45 = v20;
      __int16 v46 = 2112;
      __int16 v47 = v21;
      _os_log_impl(&dword_1B38B0000, v17, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Sending legacy prepareUsingPlugIn to extension; this should launch it if no"
        "t already running.",
        buf,
        0x2Au);
    }
    id v22 = [(PKPlugInCore *)self identifier];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1B38BD598;
    v38[3] = &unk_1E6058F20;
    id v39 = v7;
    [v6 prepareUsingPlugIn:v22 hostProtocol:v8 reply:v38];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"unexpected hub protocol version:%ld", -[PKPlugInCore hubProtocolVersion](self, "hubProtocolVersion"));
  }
}

- (void)setBootstrapWithSubsystemOptions:(id)a3
{
  xpc_object_t value = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  int64_t v5 = getenv("CLASSIC");
  if (v5) {
    xpc_dictionary_set_string(v4, "CLASSIC", v5);
  }
  if (value) {
    xpc_dictionary_set_value(v4, "SubsystemOptions", value);
  }
  if (xpc_dictionary_get_count(v4))
  {
    id v6 = [(PKHostPlugIn *)self pluginConnection];
    id v7 = [v6 _xpcConnection];
    xpc_connection_set_bootstrap();
  }
}

- (BOOL)loadExtensions:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v6;
    id v7 = v6;
    unint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        if (v8 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v8;
        }
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
          uint64_t v15 = [PKSandboxExtension alloc];
          uint64_t v16 = [(PKPlugInCore *)self external];
          uint64_t v17 = [(id)v16 sandbox];
          uint64_t v18 = [(PKSandboxExtension *)v15 initWithExtension:v14 provider:v17];

          dispatch_queue_t v19 = [(PKHostPlugIn *)self sandboxExtensions];
          LOBYTE(v16) = [v19 containsObject:v18];

          if ((v16 & 1) == 0)
          {
            [(PKSandboxExtension *)v18 consume];
            uint64_t v20 = [(PKHostPlugIn *)self sandboxExtensions];

            if (v20)
            {
              os_signpost_id_t v12 = [(PKHostPlugIn *)self sandboxExtensions];
              uint64_t v13 = [v12 arrayByAddingObject:v18];
              [(PKHostPlugIn *)self setSandboxExtensions:v13];
            }
            else
            {
              os_signpost_id_t v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
              [(PKHostPlugIn *)self setSandboxExtensions:v12];
            }
          }
          ++v10;
        }
        while (v11 != v10);
        unint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    id v6 = v22;
  }

  return 1;
}

- (BOOL)isSandboxed
{
  if (qword_1E9CD2B48 != -1) {
    dispatch_once(&qword_1E9CD2B48, &unk_1F0C15410);
  }
  return byte_1E9CD2B40;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PKHostPlugIn *)self discoveryExtensions];
  if (v7)
  {
    unint64_t v8 = [(PKHostPlugIn *)self discoveryExtensions];
    BOOL v9 = [v8 count] == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  if (!v9)
  {
    uint64_t v10 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1B38D3194((uint64_t)self, (uint64_t)v6, (uint64_t)v10, v11, v12, v13, v14, v15, v29, v30, v31, v32, v34, v35, v36, v37, v38, v39, v40,
    }
        v41,
        v42,
        v43,
        v44,
        v45);

    uint64_t v16 = [(PKHostPlugIn *)self discoveryExtensions];
    uint64_t v17 = v16;
    if (v6)
    {
      uint64_t v18 = [v16 objectForKeyedSubscript:v6];

      if (v18)
      {
        uint64_t v36 = (uint64_t)v18;
        dispatch_queue_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        LOBYTE(a4) = [(PKHostPlugIn *)self loadExtensions:v19 error:a4];
      }
      else
      {
        if (!a4)
        {
LABEL_16:

          goto LABEL_17;
        }
        dispatch_queue_t v19 = [(PKPlugInCore *)self uuid];
        uint64_t v20 = [(PKHostPlugIn *)self multipleInstanceUUID];
        id v21 = [(PKPlugInCore *)self identifier];
        uint64_t v33 = [(PKPlugInCore *)self version];
        pkErrorf(11, @"[u %@:m %@] [%@(%@)] sandbox extensions for relative path [%@] not vended by plugin", v22, v23, v24, v25, v26, v27, (uint64_t)v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
      uint64_t v17 = v18;
    }
    else
    {
      dispatch_queue_t v19 = [v16 allValues];
      LOBYTE(a4) = [(PKHostPlugIn *)self loadExtensions:v19 error:a4];
    }

    uint64_t v18 = v17;
    goto LABEL_16;
  }
  LOBYTE(a4) = 1;
LABEL_17:

  return (char)a4;
}

- (void)endUsing:(id)a3
{
}

- (void)endUsingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1B38B788C;
  dispatch_queue_t v19 = sub_1B38B7864;
  id v20 = 0;
  unint64_t v8 = [v6 uuid];
  BOOL v9 = [(PKHostPlugIn *)self _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38BDD28;
  block[3] = &unk_1E6058F90;
  id v10 = v8;
  id v12 = v10;
  uint64_t v13 = self;
  uint64_t v14 = &v15;
  dispatch_sync(v9, block);

  v7[2](v7, v16[5]);
  _Block_object_dispose(&v15, 8);
}

- (BOOL)endUsingWithError:(id *)a3
{
  return MEMORY[0x1F4181798](self, sel_endUsingRequest_error_);
}

- (BOOL)endUsingRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1B38B788C;
  uint64_t v14 = sub_1B38B7864;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B38BE178;
  v9[3] = &unk_1E6058D68;
  v9[4] = &v10;
  [(PKHostPlugIn *)self endUsingRequest:v6 completion:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  BOOL v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)unwind:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ([(PKHostPlugIn *)self state] != 1) {
      return;
    }
    if (!a4 && ![(PKHostPlugIn *)self useCount]) {
      sub_1B38D33E4();
    }
  }
  if (a3 != 2)
  {
    uint64_t v6 = [(PKHostPlugIn *)self useCount] - 1;
    [(PKHostPlugIn *)self setUseCount:v6];
    if (v6)
    {
      BOOL v7 = pklog_handle_for_category(7);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_31:

        return;
      }
      unint64_t v8 = [(PKPlugInCore *)self uuid];
      BOOL v9 = [(PKHostPlugIn *)self multipleInstanceUUID];
      uint64_t v10 = [(PKPlugInCore *)self identifier];
      uint64_t v11 = [(PKPlugInCore *)self version];
      *(_DWORD *)buf = 138544386;
      uint64_t v42 = v8;
      __int16 v43 = 2114;
      uint64_t v44 = v9;
      __int16 v45 = 2112;
      __int16 v46 = v10;
      __int16 v47 = 2112;
      uint64_t v48 = v11;
      __int16 v49 = 1024;
      unsigned int v50 = [(PKHostPlugIn *)self useCount];
      _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] plugin still active after removing one ref count, remaining = %u", buf, 0x30u);
      goto LABEL_23;
    }
  }
  uint64_t v12 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(PKPlugInCore *)self uuid];
    uint64_t v14 = [(PKHostPlugIn *)self multipleInstanceUUID];
    id v15 = [(PKPlugInCore *)self identifier];
    uint64_t v16 = [(PKPlugInCore *)self version];
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v13;
    __int16 v43 = 2114;
    uint64_t v44 = v14;
    __int16 v45 = 2112;
    __int16 v46 = v15;
    __int16 v47 = 2112;
    uint64_t v48 = v16;
    _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] all extension sessions ended", buf, 0x2Au);
  }
  [(PKHostPlugIn *)self messageTraceUsage];
  uint64_t v17 = [(PKHostPlugIn *)self host];
  [v17 deactivatePlugIn:self];

  if (a3 != 2)
  {
    uint64_t v18 = [(PKHostPlugIn *)self service];
    [v18 shutdownPlugIn];
  }
  [(PKHostPlugIn *)self changeState:a3];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  dispatch_queue_t v19 = [(PKHostPlugIn *)self sandboxExtensions];
  unint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v38;
    do
    {
      uint64_t v22 = 0;
      if (v20 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v20;
      }
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v22++) expel];
      }
      while (v23 != v22);
      unint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v20);
  }

  [(PKHostPlugIn *)self setSandboxExtensions:0];
  [(PKHostPlugIn *)self setUseCount:0];
  [(PKHostPlugIn *)self setPlugInPrincipal:0];
  [(PKHostPlugIn *)self setEmbeddedPrincipal:0];
  [(PKHostPlugIn *)self setService:0];
  [(PKHostPlugIn *)self setSyncService:0];
  uint64_t v24 = [(PKHostPlugIn *)self pluginConnection];
  [v24 invalidate];

  [(PKHostPlugIn *)self setPluginConnection:0];
  uint64_t v25 = [(PKHostPlugIn *)self multipleInstanceUUID];
  [(PKHostPlugIn *)self changeState:4 * (v25 != 0)];

  uint64_t v26 = [(PKPlugInCore *)self launchPersonas];
  unint64_t v27 = [v26 count];

  if (v27 >= 2)
  {
    uint64_t v28 = [PKManager alloc];
    uint8_t v29 = [(PKPlugInCore *)self external];
    uint64_t v30 = [(PKManager *)v28 initWithExternalProviders:v29];
    uint64_t v31 = [(PKPlugInCore *)self url];
    id v36 = 0;
    BOOL v32 = [(PKManager *)v30 terminatePlugInAtURL:v31 withError:&v36];
    BOOL v7 = v36;

    uint64_t v33 = pklog_handle_for_category(7);
    unint64_t v8 = v33;
    if (!v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1B38D3334(self, (uint64_t)v7, v8);
      }
      goto LABEL_30;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
LABEL_30:

      goto LABEL_31;
    }
    BOOL v9 = [(PKPlugInCore *)self uuid];
    uint64_t v10 = [(PKHostPlugIn *)self multipleInstanceUUID];
    uint64_t v11 = [(PKPlugInCore *)self identifier];
    uint64_t v34 = [(PKPlugInCore *)self version];
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v9;
    __int16 v43 = 2114;
    uint64_t v44 = v10;
    __int16 v45 = 2112;
    __int16 v46 = v11;
    __int16 v47 = 2112;
    uint64_t v48 = v34;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] terminated multi-persona plugin", buf, 0x2Au);

LABEL_23:
    goto LABEL_30;
  }
}

- (void)changeState:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKHostPlugIn *)self _syncQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [(PKPlugInCore *)self uuid];
    unint64_t v8 = [(PKHostPlugIn *)self multipleInstanceUUID];
    BOOL v9 = [(PKPlugInCore *)self identifier];
    uint64_t v10 = [(PKPlugInCore *)self version];
    *(_DWORD *)buf = 138544386;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    unint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_1B38B0000, v6, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] state := %lu", buf, 0x34u);
  }
  if ([(PKHostPlugIn *)self state] != a3)
  {
    [(PKHostPlugIn *)self setState:a3];
    uint64_t v11 = [(PKHostPlugIn *)self notificationBlock];
    if (v11)
    {
      uint64_t v12 = [(PKHostPlugIn *)self _replyQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1B38BE8D0;
      v13[3] = &unk_1E6058FB8;
      v13[4] = self;
      id v14 = v11;
      dispatch_async(v12, v13);
    }
  }
}

- (id)notificationBlock
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setNotificationBlock:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPreferredLanguages:(id)a3
{
}

- (NSString)sandboxProfile
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSandboxProfile:(id)a3
{
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPluginConnection:(id)a3
{
}

- (OS_dispatch_queue)_replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)set_replyQueue:(id)a3
{
}

- (OS_dispatch_queue)_startQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280, 1);
}

- (PKCorePlugInProtocol)service
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 288, 1);
}

- (void)setService:(id)a3
{
}

- (PKCorePlugInProtocol)syncService
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSyncService:(id)a3
{
}

- (void)setSupersedingUUID:(id)a3
{
}

- (PKPlugIn)supersededBy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supersededBy);
  return (PKPlugIn *)WeakRetained;
}

- (NSUUID)multipleInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMultipleInstanceUUID:(id)a3
{
}

- (NSString)serviceExtension
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSDictionary)discoveryExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (NSArray)sandboxExtensions
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSandboxExtensions:(id)a3
{
}

- (id)queuedHostPrincipal
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setQueuedHostPrincipal:(id)a3
{
}

- (Protocol)queuedHostProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 360, 1);
}

- (void)setQueuedHostProtocol:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unsigned)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unsigned int)a3
{
  self->_useCount = a3;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 376, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 384, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
}

- (NSBundle)embeddedBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 392, 1);
}

- (void)setEmbeddedBundle:(id)a3
{
}

- (BOOL)terminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (NSDate)beganUsingAt
{
  return (NSDate *)objc_getProperty(self, a2, 400, 1);
}

- (void)setBeganUsingAt:(id)a3
{
}

- (NSDictionary)environment
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableSet)requests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 424, 1);
}

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 432, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sourceForm, 0);
  objc_storeStrong((id *)&self->_beganUsingAt, 0);
  objc_storeStrong((id *)&self->_embeddedBundle, 0);
  objc_storeStrong(&self->_embeddedPrincipal, 0);
  objc_storeStrong(&self->_plugInPrincipal, 0);
  objc_storeStrong((id *)&self->_queuedHostProtocol, 0);
  objc_storeStrong(&self->_queuedHostPrincipal, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_discoveryExtensions, 0);
  objc_storeStrong((id *)&self->_serviceExtension, 0);
  objc_storeStrong((id *)&self->_multipleInstanceUUID, 0);
  objc_destroyWeak((id *)&self->_supersededBy);
  objc_storeStrong((id *)&self->_supersedingUUID, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->__startQueue, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
  objc_storeStrong((id *)&self->__replyQueue, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
  objc_storeStrong((id *)&self->_sandboxProfile, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end