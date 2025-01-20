@interface TUIKeyboardInputManagerMux
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)sharedInstance;
- (BOOL)_systemHasKbd;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasSystemInputManager;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSMutableArray)clients;
- (TIKeyboardInputManager)systemInputManager;
- (TIKeyboardInputManagerToImplProtocol)implProxy;
- (TUICandidateInterceptor)candidateMultiplexer;
- (TUIKeyboardInputManagerMux)init;
- (TUIKeyboardInputManagerProviding)inputManagerProvider;
- (_UIIVCResponseDelegateImpl)responseDelegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)newInputManagerStub;
- (id)newSystemInputManagerWithImplProxy:(id)a3;
- (void)addClient:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)processPayloadInfo:(id)a3;
- (void)pushAutocorrections:(id)a3 requestToken:(id)a4;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)releaseConnectedClients;
- (void)removeAllClients;
- (void)removeClient:(id)a3;
- (void)setCandidateMultiplexer:(id)a3;
- (void)setClients:(id)a3;
- (void)setImplProxy:(id)a3;
- (void)setInputManagerProvider:(id)a3;
- (void)setResponseDelegate:(id)a3;
- (void)setSystemInputManager:(id)a3;
- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5;
- (void)updateClientResponseDelegatesWithDelegate:(id)a3;
@end

@implementation TUIKeyboardInputManagerMux

- (void)setResponseDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_responseDelegate, a3);
  id v5 = a3;
  [(TUIKeyboardInputManagerMux *)self updateClientResponseDelegatesWithDelegate:self->_responseDelegate];
}

- (void)updateClientResponseDelegatesWithDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDCCC0B0, (void)v11)) {
          [v10 setResponseDelegate:v4];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5
{
  id v24 = a3;
  id v8 = a5;
  if ([v24 isDevicePasscodeEntry])
  {
    int v9 = 1;
  }
  else if ([v24 isSecureTextEntry])
  {
    [v24 keyboardType];
    int IsNumberPad = UIKeyboardTypeIsNumberPad();
    if (a4 == 3) {
      int v9 = 0;
    }
    else {
      int v9 = IsNumberPad;
    }
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v11 = [(TUIKeyboardInputManagerMux *)self inputManagerProvider];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (TUIKeyboardInputManagerMux *)v11;
  }
  else {
    long long v13 = self;
  }
  long long v14 = v13;

  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_19;
    }
    systemInputManager = self->_systemInputManager;
    self->_systemInputManager = 0;

    uint64_t v16 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    v17 = [v16 currentInputMode];
    v18 = [MEMORY[0x1E4FB1908] dictationInputMode];
    int v19 = [v17 isEqual:v18];

    if (!v19)
    {
      BOOL v23 = [(TUIKeyboardInputManagerMux *)v14 _systemHasKbd];
      p_implProxy = &self->_implProxy;
      if (v23)
      {
        objc_storeWeak((id *)p_implProxy, v8);
        v21 = [(TUIKeyboardInputManagerMux *)v14 newSystemInputManagerWithImplProxy:self];
        goto LABEL_18;
      }
LABEL_17:
      objc_storeWeak((id *)p_implProxy, 0);
      v21 = [(TUIKeyboardInputManagerMux *)v14 newInputManagerStub];
LABEL_18:
      v22 = self->_systemInputManager;
      self->_systemInputManager = v21;

      goto LABEL_19;
    }
LABEL_16:
    p_implProxy = &self->_implProxy;
    goto LABEL_17;
  }
  if (([(TIKeyboardInputManager *)self->_systemInputManager isMemberOfClass:objc_opt_class()] & 1) == 0) {
    goto LABEL_16;
  }
LABEL_19:
}

- (TUIKeyboardInputManagerProviding)inputManagerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputManagerProvider);
  return (TUIKeyboardInputManagerProviding *)WeakRetained;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3168 != -1) {
    dispatch_once(&sharedInstance_onceToken_3168, &__block_literal_global_3169);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implProxy);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_systemInputManager, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
  objc_destroyWeak((id *)&self->_candidateMultiplexer);
  objc_destroyWeak((id *)&self->_inputManagerProvider);
}

- (void)setImplProxy:(id)a3
{
}

- (TIKeyboardInputManagerToImplProtocol)implProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implProxy);
  return (TIKeyboardInputManagerToImplProtocol *)WeakRetained;
}

- (void)setClients:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setSystemInputManager:(id)a3
{
}

- (TIKeyboardInputManager)systemInputManager
{
  return self->_systemInputManager;
}

- (_UIIVCResponseDelegateImpl)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setCandidateMultiplexer:(id)a3
{
}

- (TUICandidateInterceptor)candidateMultiplexer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_candidateMultiplexer);
  return (TUICandidateInterceptor *)WeakRetained;
}

- (void)setInputManagerProvider:(id)a3
{
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUIKeyboardInputManagerMux *)self implProxy];
  [v8 pushCandidateResultSet:v7 requestToken:v6];
}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(TUIKeyboardInputManagerMux *)self candidateMultiplexer];
  char v8 = [v7 willHandleDeliveryForCandidates:v10 requestToken:v6];

  if ((v8 & 1) == 0)
  {
    int v9 = [(TUIKeyboardInputManagerMux *)self implProxy];
    [v9 pushAutocorrections:v10 requestToken:v6];
  }
}

- (void)processPayloadInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardInputManagerMux *)self implProxy];
  [v5 processPayloadInfo:v4];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 invokeWithTarget:self->_systemInputManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(TIKeyboardInputManager **)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 != self->_systemInputManager)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4FAE338], "untargetedInvocationWithInvocation:withCompletion:", v4, 0, (void)v12);
          [v11 invokeWithTarget:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUIKeyboardInputManagerMux;
  id v4 = -[TUIKeyboardInputManagerMux methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAE348] instanceMethodSignatureForSelector:a3];
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardInputManagerMux;
  if ([(TUIKeyboardInputManagerMux *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [MEMORY[0x1E4FAE348] conformsToProtocol:v4];
  }

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputManagerMux;
  if (-[TUIKeyboardInputManagerMux isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputManagerMux;
  if (-[TUIKeyboardInputManagerMux respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

- (void)releaseConnectedClients
{
  self->_systemInputManager = 0;
  MEMORY[0x1F41817F8]();
}

- (void)removeAllClients
{
  systemInputManager = self->_systemInputManager;
  self->_systemInputManager = 0;

  [(TUIKeyboardInputManagerMux *)self updateClientResponseDelegatesWithDelegate:0];
  clients = self->_clients;
  [(NSMutableArray *)clients removeAllObjects];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([v4 conformsToProtocol:&unk_1EDCCC0B0]) {
      [v6 setResponseDelegate:0];
    }
    objc_super v5 = [(TUIKeyboardInputManagerMux *)self clients];
    [v5 removeObject:v6];

    id v4 = v6;
  }
}

- (void)addClient:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(TUIKeyboardInputManagerMux *)self clients];
    char v5 = [v4 containsObject:v9];

    if ((v5 & 1) == 0)
    {
      id v6 = [(TUIKeyboardInputManagerMux *)self clients];
      [v6 addObject:v9];

      if ([v9 conformsToProtocol:&unk_1EDCCC0B0])
      {
        objc_super v7 = [(TUIKeyboardInputManagerMux *)self responseDelegate];
        [v9 setResponseDelegate:v7];

        uint64_t v8 = [(TUIKeyboardInputManagerMux *)self responseDelegate];
        [v8 _requestInputManagerSync];
      }
    }
  }
}

- (BOOL)hasSystemInputManager
{
  return self->_systemInputManager != 0;
}

- (id)newInputManagerStub
{
  return (id)objc_opt_new();
}

- (id)newSystemInputManagerWithImplProxy:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FAE330];
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithImplProxy:v4];

  return v5;
}

- (BOOL)_systemHasKbd
{
  if (_systemHasKbd_onceToken != -1) {
    dispatch_once(&_systemHasKbd_onceToken, &__block_literal_global_3);
  }
  return _systemHasKbd__hasKbd;
}

void __43__TUIKeyboardInputManagerMux__systemHasKbd__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v0 = _TextInputBundlesRoot();
  v1 = [v0 stringByAppendingPathComponent:@"kbd"];
  _systemHasKbd__hasKbd = [v2 fileExistsAtPath:v1];
}

- (TUIKeyboardInputManagerMux)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIKeyboardInputManagerMux;
  id v2 = [(TUIKeyboardInputManagerMux *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clients = v2->_clients;
    v2->_clients = v3;
  }
  return v2;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TUIKeyboardInputManagerMux;
  if (objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

uint64_t __44__TUIKeyboardInputManagerMux_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TUIKeyboardInputManagerMux);
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end