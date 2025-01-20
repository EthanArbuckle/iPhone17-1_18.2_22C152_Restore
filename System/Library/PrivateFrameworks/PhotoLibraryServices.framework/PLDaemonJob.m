@interface PLDaemonJob
+ (BOOL)supportsSecureCoding;
+ (void)runDaemonSideWithXPCEvent:(id)a3 libraryServicesManager:(id)a4;
- (BOOL)shouldArchiveXPCToDisk;
- (BOOL)shouldRunOnDaemonSerialQueue;
- (NSXPCConnection)clientConnection;
- (OS_xpc_object)xpcReply;
- (PLAssetsdClient)assetsdClient;
- (PLDaemonJob)init;
- (PLDaemonJob)initWithAssetsdClient:(id)a3;
- (PLDaemonJob)initWithCoder:(id)a3;
- (PLLibraryServicesManager)libraryServicesManager;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (id)newDictionaryReplyForObject:(id)a3;
- (id)replyHandler;
- (int64_t)daemonOperation;
- (void)encodeToXPCObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runDaemonSide;
- (void)sendToAssetsd;
- (void)sendToAssetsdWithCompletionHandler:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setLibraryServicesManager:(id)a3;
- (void)setReplyHandler:(id)a3;
- (void)setXpcReply:(id)a3;
@end

@implementation PLDaemonJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_xpcReply, 0);
}

- (PLAssetsdClient)assetsdClient
{
  return self->_assetsdClient;
}

- (void)setClientConnection:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PLDaemonJob *)self daemonOperation];
  unint64_t v6 = [(PLDaemonJob *)self daemonOperation];
  if (v6 > 0x12) {
    v7 = @"ERR";
  }
  else {
    v7 = off_1E586E250[v6];
  }
  v8 = v7;
  v9 = [v3 stringWithFormat:@"%@[%ld:%@]", v4, v5, v8];

  return v9;
}

- (void)setXpcReply:(id)a3
{
}

- (OS_xpc_object)xpcReply
{
  return self->_xpcReply;
}

- (PLDaemonJob)initWithAssetsdClient:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDaemonJob;
  int64_t v5 = [(PLDaemonJob *)&v11 init];
  if (v5 && (PLIsAssetsd() & 1) == 0)
  {
    if (v4)
    {
      unint64_t v6 = (PLAssetsdClient *)v4;
      assetsdClient = v5->_assetsdClient;
      v5->_assetsdClient = v6;
    }
    else
    {
      assetsdClient = [MEMORY[0x1E4F8B980] systemLibraryURL];
      uint64_t v8 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:assetsdClient];
      v9 = v5->_assetsdClient;
      v5->_assetsdClient = (PLAssetsdClient *)v8;
    }
  }

  return v5;
}

- (PLDaemonJob)init
{
  return [(PLDaemonJob *)self initWithAssetsdClient:0];
}

- (void)setReplyHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id replyHandler = self->_replyHandler;
  self->_id replyHandler = v4;
}

- (id)replyHandler
{
  v2 = (void *)MEMORY[0x19F38D650](self->_replyHandler, a2);
  return v2;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  id v5 = xpc_dictionary_create(0, 0, 0);
  [(PLDaemonJob *)self encodeToXPCObject:v5];
  [v4 encodeXPCObject:v5 forKey:@"PL.job"];

  if ([(PLDaemonJob *)self shouldArchiveXPCToDisk]) {
    [(PLDaemonJob *)self archiveXPCToDisk:v5];
  }
}

- (PLDaemonJob)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  id v5 = v4;
  unint64_t v6 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"PL.job"];
  PLStringFromXPCDictionary();
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7
    && (v9 = NSClassFromString(v7),
        [(objc_class *)v9 isSubclassOfClass:objc_opt_class()]))
  {
    v10 = [v5 userInfo];
    objc_super v11 = [v10 libraryServicesManager];
    v12 = (PLDaemonJob *)[[v9 alloc] initFromXPCObject:v6 libraryServicesManager:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)newDictionaryReplyForObject:(id)a3
{
  id result = xpc_dictionary_create_reply(a3);
  if (!result)
  {
    return xpc_dictionary_create(0, 0, 0);
  }
  return result;
}

- (void)encodeToXPCObject:(id)a3
{
  id v4 = a3;
  xpc_dictionary_set_int64(v4, "operation", [(PLDaemonJob *)self daemonOperation]);
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v4, "daemonJobClass", (const char *)[v6 UTF8String]);
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {
LABEL_12:

    self = 0;
    goto LABEL_13;
  }
  v24.receiver = self;
  v24.super_class = (Class)PLDaemonJob;
  v9 = [(PLDaemonJob *)&v24 init];
  self = v9;
  if (!v9) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v9->_libraryServicesManager, a4);
  int64_t int64 = xpc_dictionary_get_int64(v6, "operation");
  if (int64 != [(PLDaemonJob *)self daemonOperation])
  {
    v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      int64_t v22 = [(PLDaemonJob *)self daemonOperation];
      *(_DWORD *)buf = 138412802;
      v26 = v20;
      __int16 v27 = 2048;
      int64_t v28 = v22;
      __int16 v29 = 2048;
      int64_t v30 = int64;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Daemon operation invalid for %@. Expected %lld, got %lld", buf, 0x20u);
    }
    goto LABEL_12;
  }
  objc_super v11 = [MEMORY[0x1E4F8BA48] transaction:"-[PLDaemonJob(DaemonCommunication) initFromXPCObject:libraryServicesManager:]"];
  transaction = self->_transaction;
  self->_transaction = v11;

  v13 = PLDaemonJobsGetLog();
  self->_os_signpost_id_t signpostId = os_signpost_id_generate(v13);
  v14 = v13;
  v15 = v14;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v17 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v26 = v17;
    __int16 v27 = 2048;
    int64_t v28 = int64;
    id v18 = v17;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "DaemonJob", "jobClass: %@, op: %lld", buf, 0x16u);
  }
LABEL_13:

  return self;
}

- (void)runDaemonSide
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PLDaemonJob *)self xpcReply];
  id v4 = PLDaemonJobsGetLog();
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = [(PLDaemonJob *)self replyHandler];
    if (v6)
    {
      id v7 = [(PLDaemonJob *)self xpcReply];
      if (v7)
      {
        uint64_t v8 = [[PLDaemonJobReply alloc] initWithReply:v7];
        (*(void (**)(uint64_t, void, PLDaemonJobReply *))(v6 + 16))(v6, 0, v8);
      }
      else
      {
        objc_super v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v20[0] = @"No reply created.";
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        uint64_t v8 = [v11 errorWithDomain:@"PLDaemonJob" code:-1 userInfo:v12];

        (*(void (**)(uint64_t, PLDaemonJobReply *, void))(v6 + 16))(v6, v8, 0);
      }
    }
    v13 = v5;
    v14 = v13;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v16 = [v3 description];
      int v17 = 138412290;
      id v18 = v16;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, signpostId, "DaemonJob", "reply: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v9 = v4;
    uint64_t v6 = (uint64_t)v9;
    os_signpost_id_t v10 = self->_signpostId;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, (os_log_t)v6, OS_SIGNPOST_INTERVAL_END, v10, "DaemonJob", "", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)sendToAssetsdWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PLDaemonJob *)self assetsdClient];
  BOOL v6 = [(PLDaemonJob *)self shouldRunOnDaemonSerialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PLDaemonJob_DaemonCommunication__sendToAssetsdWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E586E230;
  id v9 = v4;
  id v7 = v4;
  [v5 sendDaemonJob:self shouldRunSerially:v6 replyHandler:v8];
}

uint64_t __71__PLDaemonJob_DaemonCommunication__sendToAssetsdWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 != 0, a2);
  }
  return result;
}

- (void)sendToAssetsd
{
  id v3 = [(PLDaemonJob *)self assetsdClient];
  objc_msgSend(v3, "sendDaemonJob:shouldRunSerially:replyHandler:", self, -[PLDaemonJob shouldRunOnDaemonSerialQueue](self, "shouldRunOnDaemonSerialQueue"), 0);
}

- (PLLibraryServicesManager)libraryServicesManager
{
  libraryServicesManager = self->_libraryServicesManager;
  if (!libraryServicesManager)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLDaemonJob.m", 120, @"Invalid parameter not satisfying: %@", @"_libraryServicesManager" object file lineNumber description];

    libraryServicesManager = self->_libraryServicesManager;
  }
  return libraryServicesManager;
}

- (void)setLibraryServicesManager:(id)a3
{
}

- (BOOL)shouldRunOnDaemonSerialQueue
{
  return 1;
}

- (int64_t)daemonOperation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)runDaemonSideWithXPCEvent:(id)a3 libraryServicesManager:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  PLStringFromXPCDictionary();
  BOOL v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6
    && (uint64_t v8 = NSClassFromString(v6),
        [(objc_class *)v8 isSubclassOfClass:objc_opt_class()]))
  {
    id v9 = (void *)[[v8 alloc] initFromXPCObject:v10 libraryServicesManager:v5];
  }
  else
  {
    id v9 = 0;
  }
  [v9 runDaemonSide];
}

@end