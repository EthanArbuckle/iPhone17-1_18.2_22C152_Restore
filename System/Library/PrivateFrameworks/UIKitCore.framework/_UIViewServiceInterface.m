@interface _UIViewServiceInterface
+ (id)connectToViewService:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5;
+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken;
- (id)_initWithConnectionInfo:(id)a3 service:(id)a4 deputyInterfaces:(id)a5;
- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 deputyInterfaces:(id)a5;
- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 service:(id)a5 deputyInterfaces:(id)a6;
- (id)_terminateWithError:(id)a3;
- (id)connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 connectionHandler:(id)a5;
- (id)disconnect;
- (int)servicePID;
- (void)_objc_initiateDealloc;
- (void)_terminateUnconditionallyThen:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)setTerminationHandler:(id)a3;
@end

@implementation _UIViewServiceInterface

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_objc_initiateDealloc
{
  id v3 = [(_UIViewServiceInterface *)self disconnect];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48___UIViewServiceInterface__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  [v3 whenCompleteDo:v4];
}

+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103___UIViewServiceInterface_connectToViewServiceWithBundleIdentifier_deputyInterfaces_connectionHandler___block_invoke;
  v6[3] = &unk_1E530D568;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  return +[_UIViewServiceInterfaceConnectionRequest connectToViewServiceWithBundleIdentifier:a3 connectionHandler:v6];
}

+ (id)connectToViewService:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83___UIViewServiceInterface_connectToViewService_deputyInterfaces_connectionHandler___block_invoke;
  v6[3] = &unk_1E530D568;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  return +[_UIViewServiceInterfaceConnectionRequest connectToViewService:a3 connectionHandler:v6];
}

- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 service:(id)a5 deputyInterfaces:(id)a6
{
  id var1 = a3.var1;
  id var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_UIViewServiceInterface;
  v11 = [(_UIViewServiceInterface *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [a5 identifier];
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = (uint64_t)a4;
    }
    _UIViewServiceInterfaceLogAssertionInfo(@"Initialized service interface", v13, (uint64_t)var0);
    if (var0 && var1)
    {
      v11->_serviceProcessAssertion = (BKSProcessAssertion *)var0;
      v11->_serviceConnection = (NSXPCConnection *)var1;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke;
      v18[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
      v18[4] = v11;
      v11->_terminateInvocation = +[_UIAsyncInvocation invocationWithBlock:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_2;
      v17[3] = &__block_descriptor_40_e5_v8__0ls32l8;
      v17[4] = v11;
      [(NSXPCConnection *)v11->_serviceConnection setInvalidationHandler:v17];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_3;
      v16[3] = &__block_descriptor_40_e5_v8__0ls32l8;
      v16[4] = v11;
      [(NSXPCConnection *)v11->_serviceConnection setInterruptionHandler:v16];
      [(NSXPCConnection *)v11->_serviceConnection setDelegate:v11];
      if (a6) {
        [(NSXPCConnection *)v11->_serviceConnection setRemoteObjectInterface:+[_UIViewServiceDeputyManager exportedInterfaceSupportingDeputyInterfaces:a6]];
      }
      if (a4) {
        v11->_serviceBundleIdentifier = (NSString *)[a4 copy];
      }
      if (a5) {
        v11->_service = (_UIRemoteViewService *)a5;
      }
    }
    else
    {
      v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceAssertion", &_initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces____s_category)+ 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v21 = var0;
        __int16 v22 = 2048;
        id v23 = var1;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "<rdar://22970009>: Failed to load remote view service due to either missing process assertion (%p) or missing service connection (%p)", buf, 0x16u);
      }
      [var0 invalidate];
      [var1 invalidate];
      return 0;
    }
  }
  return v11;
}

- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 deputyInterfaces:(id)a5
{
  return -[_UIViewServiceInterface _initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:](self, "_initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:", a3.var0, a3.var1, a4, 0, a5);
}

- (id)_initWithConnectionInfo:(id)a3 service:(id)a4 deputyInterfaces:(id)a5
{
  return -[_UIViewServiceInterface _initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:](self, "_initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:", a3.var0, a3.var1, 0, a4, a5);
}

- (id)connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 connectionHandler:(id)a5
{
  id v33 = a4;
  service = self->_service;
  if (service) {
    serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)service identifier];
  }
  else {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  }
  os_unfair_lock_lock(&self->_terminationStateLock);
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_isTerminated);
  if (v10)
  {
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke;
    block[3] = &unk_1E530D5B0;
    block[5] = v19;
    block[6] = a5;
    block[4] = serviceBundleIdentifier;
    dispatch_async(global_queue, block);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_2;
    v31[3] = &unk_1E530D5D8;
    v31[4] = v19;
    return +[_UIAsyncInvocation invocationWithBlock:v31];
  }
  else
  {
    os_unfair_lock_unlock(&self->_terminationStateLock);
    v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = (const char *)[(id)objc_msgSend(v11 stringWithFormat:@"com.apple.uikit.%@ %@ %@ %p", NSStringFromClass(v12), serviceBundleIdentifier, a3, self), "UTF8String"];
    dispatch_queue_t v14 = dispatch_queue_create(v13, 0);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_3;
    v28[3] = &unk_1E530D6A0;
    v28[4] = v14;
    v28[5] = v29;
    serviceConnection = self->_serviceConnection;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_5;
    v27[3] = &unk_1E530D650;
    v27[4] = v28;
    v27[5] = a5;
    uint64_t v16 = [(NSXPCConnection *)serviceConnection remoteObjectProxyWithErrorHandler:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_7;
    v25[3] = &unk_1E530D678;
    v25[4] = v28;
    v25[5] = a5;
    v26 = v25;
    v17 = (void *)[a3 connectionInvocation];
    if ([a3 hostObjectInterface])
    {
      v18 = &v33;
    }
    else
    {
      uint64_t v24 = 0;
      v18 = (id *)&v24;
    }
    [v17 setArgument:v18 atIndex:2];
    [v17 setArgument:&v26 atIndex:3];
    objc_msgSend(v17, "setSelector:", objc_msgSend(a3, "connectionSelector"));
    [v17 invokeWithTarget:v16];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_9;
    v23[3] = &unk_1E530D6A0;
    v23[4] = v14;
    v23[5] = v29;
    id v21 = +[_UIAsyncInvocation invocationWithBlock:v23];
    _Block_object_dispose(v29, 8);
  }
  return v21;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  if (a5
    && (id AssociatedObject = objc_getAssociatedObject((id)objc_msgSend(a4, "target", a3), &_UIViewServiceIncomingReplyHandlerKey)) != 0)
  {
    v7 = (void (*)(void))*((void *)AssociatedObject + 2);
    v7();
  }
  else
  {
    objc_msgSend(a4, "retainArguments", a3);
    v8 = (void *)[(id)UIApp _systemAnimationFenceExemptQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63___UIViewServiceInterface_connection_handleInvocation_isReply___block_invoke;
    v9[3] = &unk_1E52DC580;
    v9[4] = a4;
    [v8 performAsync:v9];
  }
}

- (id)_terminateWithError:(id)a3
{
  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  if (!self->_terminationError) {
    self->_terminationError = (NSError *)a3;
  }
  os_unfair_lock_unlock(p_terminationStateLock);
  terminateInvocation = self->_terminateInvocation;
  return [(_UIAsyncInvocation *)terminateInvocation invoke];
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  v6 = (void (**)(void, void))[self->_terminationHandler copy];
  v7 = self->_terminationError;
  os_unfair_lock_unlock(p_terminationStateLock);
  if (v6) {
    ((void (**)(void, NSError *))v6)[2](v6, v7);
  }

  if ([(_UIRemoteViewService *)self->_service identifier]) {
    serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)self->_service identifier];
  }
  else {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  }
  _UIViewServiceInterfaceLogAssertionInfo(@"Terminating interface and invalidating assertion", (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
  [(BKSProcessAssertion *)self->_serviceProcessAssertion invalidate];

  self->_serviceProcessAssertion = 0;
  if ((atomic_fetch_or((atomic_uchar *volatile)&self->_isTerminated, 1u) & 1) != 0
    || (serviceConnection = self->_serviceConnection) == 0)
  {
    v11 = (void (*)(id))*((void *)a3 + 2);
    v11(a3);
  }
  else
  {
    [(NSXPCConnection *)serviceConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_serviceConnection setInterruptionHandler:0];
    _UIViewServiceInterfaceLogAssertionInfo(@"Terminating interface and invalidating connection", (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
    [(NSXPCConnection *)self->_serviceConnection invalidate];
    unsigned __int8 v10 = [(NSXPCConnection *)self->_serviceConnection _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___UIViewServiceInterface__terminateUnconditionallyThen___block_invoke;
    block[3] = &unk_1E52D9B58;
    block[4] = a3;
    dispatch_async(v10, block);
  }
}

- (void)setTerminationHandler:(id)a3
{
  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  id terminationHandler = self->_terminationHandler;
  if (terminationHandler != a3)
  {

    self->_id terminationHandler = (id)[a3 copy];
    os_unfair_lock_unlock(p_terminationStateLock);
  }
}

- (id)disconnect
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(_UIRemoteViewService *)self->_service identifier]) {
    serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)self->_service identifier];
  }
  else {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  }
  _UIViewServiceInterfaceLogAssertionInfo(@"Disconnecting", (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
  v5 = @"Message";
  v6[0] = [NSString stringWithFormat:@"Disconnecting %@", serviceBundleIdentifier];
  return -[_UIViewServiceInterface _terminateWithError:](self, "_terminateWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
}

- (void)dealloc
{
  self->_service = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceInterface;
  [(_UIViewServiceInterface *)&v3 dealloc];
}

- (int)servicePID
{
  return [(NSXPCConnection *)self->_serviceConnection processIdentifier];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_serviceConnection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->id var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

@end