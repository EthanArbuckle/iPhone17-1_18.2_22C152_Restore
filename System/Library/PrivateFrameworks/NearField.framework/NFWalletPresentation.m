@interface NFWalletPresentation
- (NFWalletPresentation)init;
- (void)dealloc;
- (void)didInterrupt:(id)a3;
- (void)didInvalidate;
- (void)invalidateXPCClient;
- (void)present;
@end

@implementation NFWalletPresentation

- (NFWalletPresentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFWalletPresentation;
  v2 = [(NFWalletPresentation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_xpcClientLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(NFXPCServiceClient *)self->_xpcClient removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)NFWalletPresentation;
  [(NFWalletPresentation *)&v3 dealloc];
}

void __33__NFWalletPresentation_xpcClient__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46720];
    v2 = [[NFXPCServiceClient alloc] initWithService:@"com.apple.nfcd.wallet.presentation" remoteObjectInterface:v5 exportedInterface:0 exportedObject:0];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addDelegate:");
  }
}

- (void)invalidateXPCClient
{
  if (a1)
  {
    v1 = a1 + 4;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __43__NFWalletPresentation_invalidateXPCClient__block_invoke;
    v2[3] = &unk_1E595CC98;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 4);
    __43__NFWalletPresentation_invalidateXPCClient__block_invoke((uint64_t)v2);
    os_unfair_lock_unlock(v1);
  }
}

void __43__NFWalletPresentation_invalidateXPCClient__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeDelegate:");
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)didInterrupt:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(4, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 68);
  }
  dispatch_get_specific(*v5);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v14;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 68;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)didInvalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(4, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 72);
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v13;
    __int16 v18 = 2082;
    v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 72;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__NFWalletPresentation_didInvalidate__block_invoke;
  v15[3] = &unk_1E595CC98;
  v15[4] = self;
  os_unfair_lock_lock(&self->_xpcClientLock);
  __37__NFWalletPresentation_didInvalidate__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(&self->_xpcClientLock);
}

void __37__NFWalletPresentation_didInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)present
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __33__NFWalletPresentation_xpcClient__block_invoke;
    v15 = &unk_1E595CC98;
    v16 = self;
    os_unfair_lock_lock(&self->_xpcClientLock);
    __33__NFWalletPresentation_xpcClient__block_invoke((uint64_t)buf);
    os_unfair_lock_unlock(&self->_xpcClientLock);
    v4 = self->_xpcClient;
  }
  else
  {
    v4 = 0;
  }
  if (self->_xpcClient)
  {
    id v5 = [(NFXPCServiceClient *)v4 connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__NFWalletPresentation_present__block_invoke;
    v11[3] = &unk_1E595C648;
    v11[4] = self;
    v11[5] = a2;
    objc_super v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
    v7 = NFSharedSignpostLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D636000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[NFWalletPresentation present]", "", buf, 2u);
    }

    int v17 = @"SignpostBeginTime";
    v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:mach_continuous_time()];
    v18[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__NFWalletPresentation_present__block_invoke_15;
    v10[3] = &unk_1E595CC98;
    v10[4] = self;
    [v6 presentWithUserInfo:v9 completion:v10];
  }
  else
  {
    id v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19D636000, v5, OS_LOG_TYPE_FAULT, "Unable to acquire XPC service", buf, 2u);
    }
  }
}

void __31__NFWalletPresentation_present__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    objc_super v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 92, v3);
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
    int v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 92;
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }

  -[NFWalletPresentation invalidateXPCClient](*(os_unfair_lock_s **)(a1 + 32));
}

void __31__NFWalletPresentation_present__block_invoke_15(uint64_t a1)
{
}

- (void).cxx_destruct
{
}

@end