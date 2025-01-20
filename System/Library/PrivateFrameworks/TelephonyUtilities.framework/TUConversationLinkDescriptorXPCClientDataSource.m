@interface TUConversationLinkDescriptorXPCClientDataSource
+ (NSXPCInterface)clientXPCInterface;
+ (NSXPCInterface)serverXPCInterface;
+ (TUConversationLinkDescriptorXPCServer)asynchronousServer;
+ (TUConversationLinkDescriptorXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5;
- (NSXPCConnection)xpcConnection;
- (TUConversationLinkDescriptorDataSourceDelegate)conversationLinkDescriptorDataSourceDelegate;
- (TUConversationLinkDescriptorXPCClientDataSource)init;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int64_t)integerForKey:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5;
- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorsDidChange;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6;
- (void)dealloc;
- (void)integerForKey:(id)a3 completion:(id)a4;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setConversationLinkDescriptorDataSourceDelegate:(id)a3;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)stringForKey:(id)a3 completion:(id)a4;
@end

@implementation TUConversationLinkDescriptorXPCClientDataSource

uint64_t __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke_114(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke;
  v17[3] = &unk_1E58E5CC8;
  id v11 = v10;
  id v18 = v11;
  id v12 = a3;
  v13 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke_114;
  v15[3] = &unk_1E58E5D90;
  id v16 = v11;
  id v14 = v11;
  [v13 conversationLinkDescriptorsWithPredicate:v12 limit:a4 offset:a5 reply:v15];
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    v8 = [(TUConversationLinkDescriptorXPCClientDataSource *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (NSXPCConnection)xpcConnection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FaceTime.FTConversationService"];
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    id v7 = [(id)objc_opt_class() serverXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    v8 = [(id)objc_opt_class() clientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v8];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke;
    id v14 = &unk_1E58E5C50;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:&v11];
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_102, v11, v12, v13, v14);
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  v9 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);

  return v9;
}

- (TUConversationLinkDescriptorXPCClientDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUConversationLinkDescriptorXPCClientDataSource;
  uint64_t result = [(TUConversationLinkDescriptorXPCClientDataSource *)&v3 init];
  if (result) {
    result->_accessorLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUConversationLinkDescriptorXPCClientDataSource;
  [(TUConversationLinkDescriptorXPCClientDataSource *)&v3 dealloc];
}

+ (TUConversationLinkDescriptorXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer);

  return (TUConversationLinkDescriptorXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer);

  id v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&sAsynchronousServer, obj);
    id v4 = obj;
  }
}

+ (TUConversationLinkDescriptorXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer);

  return (TUConversationLinkDescriptorXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer);

  id v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&sSynchronousServer, obj);
    id v4 = obj;
  }
}

+ (NSXPCInterface)clientXPCInterface
{
  if (clientXPCInterface_onceToken != -1) {
    dispatch_once(&clientXPCInterface_onceToken, &__block_literal_global);
  }
  v2 = (void *)clientXPCInterface_sClientXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __69__TUConversationLinkDescriptorXPCClientDataSource_clientXPCInterface__block_invoke()
{
  clientXPCInterface_sClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED25EA0];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)serverXPCInterface
{
  if (serverXPCInterface_onceToken != -1) {
    dispatch_once(&serverXPCInterface_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)serverXPCInterface_sServerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __69__TUConversationLinkDescriptorXPCClientDataSource_serverXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61908];
  v1 = (void *)serverXPCInterface_sServerXPCInterface;
  serverXPCInterface_sServerXPCInterface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  [(id)serverXPCInterface_sServerXPCInterface setClasses:v6 forSelector:sel_addConversationLinkDescriptors_reply_ argumentIndex:0 ofReply:0];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v11 forSelector:sel_addOrUpdateConversationLinkDescriptors_reply_ argumentIndex:0 ofReply:0];
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v12 forSelector:sel_removeConversationLinkDescriptorsWithPredicate_deleteReason_reply_ argumentIndex:0 ofReply:0];
  v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v13 forSelector:sel_conversationLinkDescriptorCountWithPredicate_reply_ argumentIndex:0 ofReply:0];
  id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v14 forSelector:sel_conversationLinkDescriptorsWithPredicate_limit_offset_reply_ argumentIndex:0 ofReply:0];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v19 forSelector:sel_conversationLinkDescriptorsWithPredicate_limit_offset_reply_ argumentIndex:0 ofReply:1];
  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v20 forSelector:sel_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:2 ofReply:0];
  v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v21 forSelector:sel_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:0 ofReply:0];
  v22 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v22 forSelector:sel_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:2 ofReply:0];
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v25 forSelector:sel_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:0 ofReply:0];
  v26 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v26 forSelector:sel_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:2 ofReply:0];
  v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v27 forSelector:sel_setName_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:0 ofReply:0];
  id v28 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  [(id)serverXPCInterface_sServerXPCInterface setClasses:v28 forSelector:sel_setName_withRevision_forConversationLinkDescriptorsWithPredicate_reply_ argumentIndex:2 ofReply:0];
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    uint64_t v8 = [(TUConversationLinkDescriptorXPCClientDataSource *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

void __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setXpcConnection:0];
  }
}

void __64__TUConversationLinkDescriptorXPCClientDataSource_xpcConnection__block_invoke_100()
{
  uint64_t v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v1, 2u);
  }
}

- (void)setXpcConnection:(id)a3
{
  uint64_t v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8) {
    objc_storeStrong((id *)p_xpcConnection, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (TUConversationLinkDescriptorDataSourceDelegate)conversationLinkDescriptorDataSourceDelegate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = self->_conversationLinkDescriptorDataSourceDelegate;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setConversationLinkDescriptorDataSourceDelegate:(id)a3
{
  uint64_t v8 = (TUConversationLinkDescriptorDataSourceDelegate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  conversationLinkDescriptorDataSourceDelegate = self->_conversationLinkDescriptorDataSourceDelegate;
  p_conversationLinkDescriptorDataSourceDelegate = &self->_conversationLinkDescriptorDataSourceDelegate;
  if (conversationLinkDescriptorDataSourceDelegate != v8) {
    objc_storeStrong((id *)p_conversationLinkDescriptorDataSourceDelegate, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  id v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_104;
  v11[3] = &unk_1E58E5CA0;
  v11[4] = &v19;
  v11[5] = &v13;
  [v7 addConversationLinkDescriptors:v6 reply:v11];

  if (a4)
  {
    uint64_t v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_104(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  char v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_106;
  v11[3] = &unk_1E58E5CF0;
  id v12 = v7;
  id v10 = v7;
  [v9 addConversationLinkDescriptors:v8 reply:v11];
}

void __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_106(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  id v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_107;
  v11[3] = &unk_1E58E5CA0;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 addOrUpdateConversationLinkDescriptors:v6 reply:v11];

  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_107(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  char v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_108;
  v11[3] = &unk_1E58E5CF0;
  id v12 = v7;
  id v10 = v7;
  [v9 addOrUpdateConversationLinkDescriptors:v8 reply:v11];
}

void __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_108(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  id v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_109;
  v11[3] = &unk_1E58E5D18;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 conversationLinkDescriptorCountWithPredicate:v6 reply:v11];

  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  unint64_t v9 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_109(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  unint64_t v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke_111;
  v11[3] = &unk_1E58E5D40;
  id v12 = v7;
  id v10 = v7;
  [v9 conversationLinkDescriptorCountWithPredicate:v8 reply:v11];
}

void __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __107__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_completion___block_invoke_111(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke;
  v16[3] = &unk_1E58E5C78;
  v16[4] = &v17;
  uint64_t v11 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_112;
  v15[3] = &unk_1E58E5D68;
  void v15[4] = &v23;
  v15[5] = &v17;
  [v11 conversationLinkDescriptorsWithPredicate:v10 limit:a4 offset:a5 reply:v15];

  if (a6)
  {
    id v12 = (void *)v18[5];
    if (v12) {
      *a6 = v12;
    }
  }
  id v13 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __116__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke;
  v14[3] = &unk_1E58E5C78;
  v14[4] = &v15;
  uint64_t v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_115;
  v13[3] = &unk_1E58E5D18;
  void v13[4] = &v21;
  v13[5] = &v15;
  [v9 removeConversationLinkDescriptorsWithPredicate:v8 deleteReason:a4 reply:v13];

  if (a5)
  {
    id v10 = (void *)v16[5];
    if (v10) {
      *a5 = v10;
    }
  }
  unint64_t v11 = v22[3];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_115(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke;
  v15[3] = &unk_1E58E5CC8;
  id v9 = v8;
  id v16 = v9;
  id v10 = a3;
  unint64_t v11 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke_116;
  v13[3] = &unk_1E58E5D40;
  id v14 = v9;
  id v12 = v9;
  [v11 removeConversationLinkDescriptorsWithPredicate:v10 deleteReason:a4 reply:v13];
}

void __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __122__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_completion___block_invoke_116(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  uint64_t v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke_117;
  v11[3] = &unk_1E58E5D18;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 removeLinkDescriptorsFromDataSourceWithPredicate:v6 reply:v11];

  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  unint64_t v9 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __106__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_error___block_invoke_117(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  unint64_t v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_118;
  v11[3] = &unk_1E58E5D40;
  id v12 = v7;
  id v10 = v7;
  [v9 removeLinkDescriptorsFromDataSourceWithPredicate:v8 reply:v11];
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_118(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v16[3] = &unk_1E58E5C78;
  v16[4] = &v17;
  unint64_t v11 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_119;
  v15[3] = &unk_1E58E5D18;
  void v15[4] = &v23;
  v15[5] = &v17;
  [v11 setActivated:v8 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v10 reply:v15];

  if (a6)
  {
    id v12 = (void *)v18[5];
    if (v12) {
      *a6 = v12;
    }
  }
  unint64_t v13 = v24[3];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_119(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v17[3] = &unk_1E58E5CC8;
  id v11 = v10;
  id v18 = v11;
  id v12 = a5;
  unint64_t v13 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_120;
  v15[3] = &unk_1E58E5D40;
  id v16 = v11;
  id v14 = v11;
  [v13 setActivated:v8 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v15];
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __132__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_120(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v17[3] = &unk_1E58E5C78;
  void v17[4] = &v18;
  id v12 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_121;
  v16[3] = &unk_1E58E5D18;
  v16[4] = &v24;
  void v16[5] = &v18;
  [v12 setExpirationDate:v10 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 reply:v16];

  if (a6)
  {
    unint64_t v13 = (void *)v19[5];
    if (v13) {
      *a6 = v13;
    }
  }
  unint64_t v14 = v25[3];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_121(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v18[3] = &unk_1E58E5CC8;
  id v11 = v10;
  id v19 = v11;
  id v12 = a5;
  id v13 = a3;
  unint64_t v14 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_122;
  v16[3] = &unk_1E58E5D40;
  id v17 = v11;
  id v15 = v11;
  [v14 setExpirationDate:v13 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v16];
}

void __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __137__TUConversationLinkDescriptorXPCClientDataSource_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_122(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v17[3] = &unk_1E58E5C78;
  void v17[4] = &v18;
  id v12 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_123;
  v16[3] = &unk_1E58E5D18;
  void v16[4] = &v24;
  void v16[5] = &v18;
  [v12 setInvitedHandles:v10 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 reply:v16];

  if (a6)
  {
    id v13 = (void *)v19[5];
    if (v13) {
      *a6 = v13;
    }
  }
  unint64_t v14 = v25[3];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __132__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_123(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v18[3] = &unk_1E58E5CC8;
  id v11 = v10;
  id v19 = v11;
  id v12 = a5;
  id v13 = a3;
  unint64_t v14 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_124;
  v16[3] = &unk_1E58E5D40;
  id v17 = v11;
  id v15 = v11;
  [v14 setInvitedHandles:v13 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v16];
}

void __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __137__TUConversationLinkDescriptorXPCClientDataSource_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_124(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke;
  v17[3] = &unk_1E58E5C78;
  void v17[4] = &v18;
  id v12 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_125;
  v16[3] = &unk_1E58E5D18;
  void v16[4] = &v24;
  void v16[5] = &v18;
  [v12 setName:v10 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 reply:v16];

  if (a6)
  {
    id v13 = (void *)v19[5];
    if (v13) {
      *a6 = v13;
    }
  }
  unint64_t v14 = v25[3];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __122__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_125(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke;
  v18[3] = &unk_1E58E5CC8;
  id v11 = v10;
  id v19 = v11;
  id v12 = a5;
  id v13 = a3;
  unint64_t v14 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_126;
  v16[3] = &unk_1E58E5D40;
  id v17 = v11;
  id v15 = v11;
  [v14 setName:v13 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v16];
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __127__TUConversationLinkDescriptorXPCClientDataSource_setName_withRevision_forConversationLinkDescriptorsWithPredicate_completion___block_invoke_126(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke;
  v14[3] = &unk_1E58E5C78;
  v14[4] = &v15;
  unint64_t v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke_127;
  v13[3] = &unk_1E58E5CA0;
  void v13[4] = &v21;
  v13[5] = &v15;
  [v9 setInteger:a3 forKey:v8 reply:v13];

  if (a5)
  {
    id v10 = (void *)v16[5];
    if (v10) {
      *a5 = v10;
    }
  }
  char v11 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __75__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_error___block_invoke_127(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke;
  v15[3] = &unk_1E58E5CC8;
  id v9 = v8;
  id v16 = v9;
  id v10 = a4;
  char v11 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_128;
  v13[3] = &unk_1E58E5CF0;
  id v14 = v9;
  id v12 = v9;
  [v11 setInteger:a3 forKey:v10 reply:v13];
}

void __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_128(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)integerForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_129;
  v11[3] = &unk_1E58E5DB8;
  id v12 = v7;
  id v10 = v7;
  [v9 integerForKey:v8 reply:v11];
}

void __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 0x7FFFFFFFFFFFFFFFLL, v3);
  }
}

uint64_t __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_129(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  id v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_131;
  v11[3] = &unk_1E58E5DE0;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 integerForKey:v6 reply:v11];

  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  int64_t v9 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_131(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke;
  v15[3] = &unk_1E58E5C78;
  void v15[4] = &v16;
  id v10 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke_132;
  v14[3] = &unk_1E58E5CA0;
  v14[4] = &v22;
  void v14[5] = &v16;
  [v10 setString:v8 forKey:v9 reply:v14];

  if (a5)
  {
    char v11 = (void *)v17[5];
    if (v11) {
      *a5 = v11;
    }
  }
  char v12 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __74__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_error___block_invoke_132(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke;
  v16[3] = &unk_1E58E5CC8;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  char v12 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke_133;
  v14[3] = &unk_1E58E5CF0;
  id v15 = v9;
  id v13 = v9;
  [v12 setString:v11 forKey:v10 reply:v14];
}

void __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __79__TUConversationLinkDescriptorXPCClientDataSource_setString_forKey_completion___block_invoke_133(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke;
  v13[3] = &unk_1E58E5CC8;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(TUConversationLinkDescriptorXPCClientDataSource *)self asynchronousServerWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke_134;
  v11[3] = &unk_1E58E5E08;
  id v12 = v7;
  id v10 = v7;
  [v9 stringForKey:v8 reply:v11];
}

void __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __75__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_completion___block_invoke_134(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke;
  v12[3] = &unk_1E58E5C78;
  v12[4] = &v13;
  id v7 = [(TUConversationLinkDescriptorXPCClientDataSource *)self synchronousServerWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke_136;
  v11[3] = &unk_1E58E5E30;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 stringForKey:v6 reply:v11];

  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __70__TUConversationLinkDescriptorXPCClientDataSource_stringForKey_error___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)conversationLinkDescriptorsDidChange
{
  id v3 = [(TUConversationLinkDescriptorXPCClientDataSource *)self conversationLinkDescriptorDataSourceDelegate];
  [v3 conversationLinkDescriptorsDidChangeForDataSource:self];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_conversationLinkDescriptorDataSourceDelegate, 0);
}

void __88__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not add converation links due to connection error %@", v2, v3, v4, v5, v6);
}

void __93__TUConversationLinkDescriptorXPCClientDataSource_addConversationLinkDescriptors_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not add conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

void __96__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not add or update converation links due to connection error %@", v2, v3, v4, v5, v6);
}

void __101__TUConversationLinkDescriptorXPCClientDataSource_addOrUpdateConversationLinkDescriptors_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not add or update conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

void __102__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorCountWithPredicate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not retrieve conversation link count due to connection error %@", v2, v3, v4, v5, v6);
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_conversationLinkDescriptorsWithPredicate_limit_offset_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not retrieve conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

void __117__TUConversationLinkDescriptorXPCClientDataSource_removeConversationLinkDescriptorsWithPredicate_deleteReason_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not remove conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

void __111__TUConversationLinkDescriptorXPCClientDataSource_removeLinkDescriptorsFromDataSourceWithPredicate_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not remove conversation link descriptors from data source due to connection error %@", v2, v3, v4, v5, v6);
}

void __127__TUConversationLinkDescriptorXPCClientDataSource_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not update conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

void __80__TUConversationLinkDescriptorXPCClientDataSource_setInteger_forKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not update TU KV due to connection error %@", v2, v3, v4, v5, v6);
}

void __76__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not fetch TU KV due to connection error %@", v2, v3, v4, v5, v6);
}

void __71__TUConversationLinkDescriptorXPCClientDataSource_integerForKey_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Could not synch fetch conversation link descriptors due to connection error %@", v2, v3, v4, v5, v6);
}

@end