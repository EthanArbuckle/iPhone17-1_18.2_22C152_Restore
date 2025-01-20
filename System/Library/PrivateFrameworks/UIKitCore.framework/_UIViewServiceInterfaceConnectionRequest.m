@interface _UIViewServiceInterfaceConnectionRequest
+ (id)_connectToViewServiceWithBundleIdentifier:(id)a3 service:(id)a4 connectionHandler:(id)a5;
+ (id)connectToViewService:(id)a3 connectionHandler:(id)a4;
+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 connectionHandler:(id)a4;
+ (void)initialize;
- (void)_cancelUnconditionallyThen:(id)a3;
- (void)_cancelWithError:(id)a3;
- (void)_createAndEstablishConnection;
- (void)_createPlugInProcessAssertion;
- (void)_createProcessAssertion;
- (void)_createProcessAssertionForPID:(int)a3 orBundleIdentifier:(id)a4 acquiredHandler:(id)a5;
- (void)_didConnectToService;
- (void)_establishConnection;
- (void)_launchService;
- (void)_objc_initiateDealloc;
- (void)dealloc;
@end

@implementation _UIViewServiceInterfaceConnectionRequest

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_objc_initiateDealloc
{
  id v3 = [(_UIAsyncInvocation *)self->_cancellationInvocation invoke];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___UIViewServiceInterfaceConnectionRequest__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  [v3 whenCompleteDo:v4];
}

+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 connectionHandler:(id)a4
{
  return (id)[a1 _connectToViewServiceWithBundleIdentifier:a3 service:0 connectionHandler:a4];
}

+ (id)_connectToViewServiceWithBundleIdentifier:(id)a3 service:(id)a4 connectionHandler:(id)a5
{
  if (!a5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s is nil", "connectionHandler");
  }
  v9 = objc_alloc_init((Class)a1);
  if (!v9) {
    abort();
  }
  v10 = v9;
  if (a3)
  {
    v9[2] = [a3 copy];
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = (void *)[v11 stringWithFormat:@"com.apple.UIKit.%@ %@", NSStringFromClass(v12), a3];
  }
  else
  {
    v9[3] = a4;
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v13 = (void *)[v14 stringWithFormat:@"com.apple.UIKit.%@ %@", NSStringFromClass(v15), objc_msgSend((id)v10[3], "identifier")];
  }
  v10[4] = dispatch_queue_create((const char *)[v13 UTF8String], 0);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3810000000;
  v25[3] = &unk_186D7DBA7;
  char v26 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke;
  v24[3] = &unk_1E530D478;
  v24[4] = a5;
  v24[5] = v25;
  v24[6] = v10;
  v10[1] = [v24 copy];
  id v16 = a3;
  if (!a3) {
    id v16 = (id)[(id)v10[3] identifier];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2;
  v23[3] = &unk_1E530D4A0;
  v23[4] = v16;
  v23[5] = v10;
  v10[7] = +[_UIAsyncInvocation invocationWithBlock:v23];
  if (a3)
  {
    v17 = v10[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_4;
    block[3] = &unk_1E52DC580;
    block[4] = v10;
    dispatch_async(v17, block);
  }
  else
  {
    v18 = (void *)v10[3];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_5;
    v21[3] = &unk_1E530D4C8;
    v21[4] = v10;
    [v18 beginUsing:v21];
  }
  id v19 = (id)v10[7];
  _Block_object_dispose(v25, 8);
  return v19;
}

+ (id)connectToViewService:(id)a3 connectionHandler:(id)a4
{
  return (id)[a1 _connectToViewServiceWithBundleIdentifier:0 service:a3 connectionHandler:a4];
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  if (!self->_serviceSessionConnectionResumed)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "For some reason, we got deallocated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    else
    {
      id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_12) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "For some reason, we got deallocated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    [(NSXPCConnection *)self->_serviceSessionConnection resume];
    self->_serviceSessionConnectionResumed = 1;
  }

  self->_service = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceInterfaceConnectionRequest;
  [(_UIViewServiceInterfaceConnectionRequest *)&v5 dealloc];
}

- (void)_launchService
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_createProcessAssertion
{
  if (!self->_isCancelled)
  {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke;
    v3[3] = &unk_1E530D518;
    v3[4] = self;
    [(_UIViewServiceInterfaceConnectionRequest *)self _createProcessAssertionForPID:0xFFFFFFFFLL orBundleIdentifier:serviceBundleIdentifier acquiredHandler:v3];
  }
}

- (void)_createProcessAssertionForPID:(int)a3 orBundleIdentifier:(id)a4 acquiredHandler:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = objc_alloc(MEMORY[0x1E4F4E280]);
  if (a4) {
    v10 = (BKSProcessAssertion *)[v9 initWithBundleIdentifier:a4 flags:15 reason:9 name:@"com.apple.viewservice.session" withHandler:a5];
  }
  else {
    v10 = (BKSProcessAssertion *)[v9 initWithPID:v7 flags:15 reason:9 name:@"com.apple.viewservice.session" withHandler:a5];
  }
  self->_serviceProcessAssertion = v10;
  if ([(_UIRemoteViewService *)self->_service identifier]) {
    serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)self->_service identifier];
  }
  else {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  }
  serviceProcessAssertion = self->_serviceProcessAssertion;
  _UIViewServiceInterfaceLogAssertionInfo(@"Assertion created", (uint64_t)serviceBundleIdentifier, (uint64_t)serviceProcessAssertion);
}

- (void)_createPlugInProcessAssertion
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!self->_isCancelled)
  {
    uint64_t v3 = [(_UIRemoteViewService *)self->_service processIdentifier];
    if (v3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke;
      v5[3] = &unk_1E530D518;
      v5[4] = self;
      [(_UIViewServiceInterfaceConnectionRequest *)self _createProcessAssertionForPID:v3 orBundleIdentifier:0 acquiredHandler:v5];
    }
    else
    {
      uint64_t v4 = [NSString stringWithFormat:@"Unable to find pid for %@", self->_serviceBundleIdentifier];
      v6 = @"Message";
      v7[0] = v4;
      -[_UIViewServiceInterfaceConnectionRequest _cancelWithError:](self, "_cancelWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceInterfaceErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
    }
  }
}

- (void)_createAndEstablishConnection
{
  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  uint64_t v4 = (void *)[@"com.apple.uikit.viewservice." stringByAppendingString:self->_serviceBundleIdentifier];
  unint64_t v5 = [v4 length];
  if (v5 >= 0x3F) {
    uint64_t v6 = 63;
  }
  else {
    uint64_t v6 = v5;
  }
  self->_serviceSessionConnection = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", objc_msgSend(v4, "substringToIndex:", v6), 0);
  self->_serviceSessionConnectionResumed = 0;
  [(_UIViewServiceInterfaceConnectionRequest *)self _establishConnection];
  [(_UIViewServiceInterfaceConnectionRequest *)self _didConnectToService];
}

- (void)_establishConnection
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = __Block_byref_object_copy__226;
  v4[4] = __Block_byref_object_dispose__226;
  void v4[5] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64___UIViewServiceInterfaceConnectionRequest__establishConnection__block_invoke;
  v3[3] = &unk_1E52D9900;
  v3[4] = v4;
  [(NSXPCConnection *)self->_serviceSessionConnection _setQueue:self->_queue];
  [(NSXPCConnection *)self->_serviceSessionConnection setInterruptionHandler:v3];
  [(NSXPCConnection *)self->_serviceSessionConnection setInvalidationHandler:v3];
  [(NSXPCConnection *)self->_serviceSessionConnection resume];
  self->_serviceSessionConnectionResumed = 1;
  _Block_object_dispose(v4, 8);
}

- (void)_didConnectToService
{
  if (!self->_isCancelled)
  {
    serviceProcessAssertion = self->_serviceProcessAssertion;
    uint64_t v4 = serviceProcessAssertion;
    self->_serviceProcessAssertion = 0;
    unint64_t v5 = self->_serviceSessionConnection;
    self->_serviceSessionConnection = 0;
    if ([(_UIRemoteViewService *)self->_service identifier]) {
      serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)self->_service identifier];
    }
    else {
      serviceBundleIdentifier = self->_serviceBundleIdentifier;
    }
    _UIViewServiceInterfaceLogAssertionInfo(@"Did connect to service", (uint64_t)serviceBundleIdentifier, (uint64_t)serviceProcessAssertion);
    (*((void (**)(void))self->_connectionHandler + 2))();
    self->_successfullyHandledConnection = 1;
  }
}

- (void)_cancelWithError:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceConnectionRequest", &_cancelWithError____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled view service connection request with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (!self->_cancellationError) {
    self->_cancellationError = (NSError *)a3;
  }
  [(_UIAsyncInvocation *)self->_cancellationInvocation invoke];
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  self->_isCancelled = 1;
  if ([(_UIRemoteViewService *)self->_service identifier]) {
    serviceBundleIdentifier = (NSString *)[(_UIRemoteViewService *)self->_service identifier];
  }
  else {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  }
  serviceProcessAssertion = self->_serviceProcessAssertion;
  if (!self->_successfullyHandledConnection || serviceProcessAssertion) {
    _UIViewServiceInterfaceLogAssertionInfo(@"Cancelled active service request", (uint64_t)serviceBundleIdentifier, (uint64_t)serviceProcessAssertion);
  }
  if (!self->_serviceSessionConnectionResumed)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Connection request invalidated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    else
    {
      id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_cancelUnconditionallyThen____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Connection request invalidated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke;
  block[3] = &unk_1E530D540;
  void block[5] = a3;
  block[6] = self;
  block[4] = serviceBundleIdentifier;
  dispatch_async(queue, block);
}

@end