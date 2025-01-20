@interface UIKeyboardInputManagerMux
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)sharedInstance;
- (BOOL)_systemHasKbd;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasSystemInputManager;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (TIKeyboardInputManager)systemInputManager;
- (_UIIVCResponseDelegateImpl)responseDelegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addClient:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)releaseConnectedClients;
- (void)removeAllClients;
- (void)removeClient:(id)a3;
- (void)setResponseDelegate:(id)a3;
- (void)setSystemInputManager:(id)a3;
- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5;
- (void)updateClientResponseDelegatesWithDelegate:(id)a3;
@end

@implementation UIKeyboardInputManagerMux

+ (id)sharedInstance
{
  if (qword_1EB261BF0 != -1) {
    dispatch_once(&qword_1EB261BF0, &__block_literal_global_356);
  }
  v2 = (void *)_MergedGlobals_1141;
  return v2;
}

void __43__UIKeyboardInputManagerMux_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardInputManagerMux);
  v1 = (void *)_MergedGlobals_1141;
  _MergedGlobals_1141 = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = *(void **)(_MergedGlobals_1141 + 8);
  *(void *)(_MergedGlobals_1141 + 8) = v2;
}

- (BOOL)_systemHasKbd
{
  if (_systemHasKbd_onceToken != -1) {
    dispatch_once(&_systemHasKbd_onceToken, &__block_literal_global_115_0);
  }
  return _systemHasKbd__hasKbd;
}

void __42__UIKeyboardInputManagerMux__systemHasKbd__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v0 = _TextInputBundlesRoot();
  v1 = [v0 stringByAppendingPathComponent:@"kbd"];
  _systemHasKbd__hasKbd = [v2 fileExistsAtPath:v1];
}

- (BOOL)hasSystemInputManager
{
  id v2 = [(UIKeyboardInputManagerMux *)self systemInputManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  if (([v20 isDevicePasscodeEntry] & 1) != 0
    || [v20 isSecureTextEntry]
    && ((unsigned int v11 = [v20 keyboardType], v11 <= 0xB) && ((1 << v11) & 0x930) != 0 || v11 == 127)
    && a4 != 3)
  {
    v9 = [(UIKeyboardInputManagerMux *)self systemInputManager];
    char v10 = [v9 isMemberOfClass:objc_opt_class()];

    if (v10) {
      goto LABEL_16;
    }
LABEL_14:
    v18 = (UIKeyboardInputManagerClient *)objc_opt_new();
    goto LABEL_15;
  }
  v12 = [(UIKeyboardInputManagerMux *)self systemInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_16;
  }
  [(UIKeyboardInputManagerMux *)self setSystemInputManager:0];
  v14 = +[UIKeyboardInputModeController sharedInputModeController];
  v15 = [v14 currentInputMode];
  v16 = +[UIKeyboardInputMode dictationInputMode];
  int v17 = [v15 isEqual:v16];

  if (v17 || ![(UIKeyboardInputManagerMux *)self _systemHasKbd]) {
    goto LABEL_14;
  }
  v18 = [[UIKeyboardInputManagerClient alloc] initWithImplProxy:v8];
LABEL_15:
  v19 = v18;
  [(UIKeyboardInputManagerMux *)self setSystemInputManager:v18];

LABEL_16:
}

- (void)setSystemInputManager:(id)a3
{
  v4 = (TIKeyboardInputManager *)a3;
  systemInputManager = self->_systemInputManager;
  self->_systemInputManager = v4;
  v7 = v4;
  v6 = systemInputManager;

  [(UIKeyboardInputManagerMux *)self removeClient:v6];
  [(UIKeyboardInputManagerMux *)self addClient:self->_systemInputManager];
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9 = v4;
    char v5 = [(NSMutableArray *)self->_clients containsObject:v4];
    id v4 = v9;
    if ((v5 & 1) == 0)
    {
      [(NSMutableArray *)self->_clients addObject:v9];
      int v6 = [v9 conformsToProtocol:&unk_1ED5AEAC0];
      id v4 = v9;
      if (v6)
      {
        v7 = [(UIKeyboardInputManagerMux *)self responseDelegate];
        [v9 setResponseDelegate:v7];

        id v8 = [(UIKeyboardInputManagerMux *)self responseDelegate];
        [v8 _requestInputManagerSync];

        id v4 = v9;
      }
    }
  }
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([v4 conformsToProtocol:&unk_1ED5AEAC0]) {
      [v5 setResponseDelegate:0];
    }
    [(NSMutableArray *)self->_clients removeObject:v5];
    id v4 = v5;
  }
}

- (void)removeAllClients
{
  [(UIKeyboardInputManagerMux *)self setSystemInputManager:0];
  [(UIKeyboardInputManagerMux *)self updateClientResponseDelegatesWithDelegate:0];
  clients = self->_clients;
  [(NSMutableArray *)clients removeAllObjects];
}

- (void)releaseConnectedClients
{
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
        char v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1ED5AEAC0, (void)v11)) {
          [v10 setResponseDelegate:v4];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setResponseDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_responseDelegate, a3);
  id v5 = a3;
  [(UIKeyboardInputManagerMux *)self updateClientResponseDelegatesWithDelegate:self->_responseDelegate];
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIKeyboardInputManagerMux;
  if (objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerMux;
  if (-[UIKeyboardInputManagerMux respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerMux;
  if (-[UIKeyboardInputManagerMux isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardInputManagerMux;
  if ([(UIKeyboardInputManagerMux *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [MEMORY[0x1E4FAE348] conformsToProtocol:v4];
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputManagerMux;
  id v4 = -[UIKeyboardInputManagerMux methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAE348] instanceMethodSignatureForSelector:a3];
  }
  objc_super v7 = v6;

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UIKeyboardInputManagerMux *)self systemInputManager];
  [v4 invokeWithTarget:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_clients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [(UIKeyboardInputManagerMux *)self systemInputManager];

        if (v11 != v12)
        {
          long long v13 = +[UIKeyboardInputManagerClientRequest untargetedInvocationWithInvocation:v4 withCompletion:0];
          [v13 invokeWithTarget:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (_UIIVCResponseDelegateImpl)responseDelegate
{
  return self->_responseDelegate;
}

- (TIKeyboardInputManager)systemInputManager
{
  return self->_systemInputManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputManager, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end