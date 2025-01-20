@interface PKAuthenticatorSharedRootContext
+ (id)sharedInstance;
- (PKAuthenticatorSharedRootContext)init;
- (id)externalizedContext;
- (int64_t)_initialUserIntentAvailabilityState;
- (int64_t)userIntentAvailabilityState;
- (void)dealloc;
- (void)resetWithCompletion:(id)a3;
- (void)setUserIntentAvailabilityState:(int64_t)a3;
@end

@implementation PKAuthenticatorSharedRootContext

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_context;

  return v2;
}

uint64_t __50__PKAuthenticatorSharedRootContext_sharedInstance__block_invoke()
{
  sharedInstance_context = objc_alloc_init(PKAuthenticatorSharedRootContext);

  return MEMORY[0x270F9A758]();
}

- (PKAuthenticatorSharedRootContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKAuthenticatorSharedRootContext;
  v2 = [(PKAuthenticatorSharedRootContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_userIntentAvailabilityState = [(PKAuthenticatorSharedRootContext *)v2 _initialUserIntentAvailabilityState];
  }
  return v3;
}

- (void)dealloc
{
  [(PKAuthenticatorSharedRootContext *)self resetWithCompletion:0];
  v3.receiver = self;
  v3.super_class = (Class)PKAuthenticatorSharedRootContext;
  [(PKAuthenticatorSharedRootContext *)&v3 dealloc];
}

- (int64_t)_initialUserIntentAvailabilityState
{
  if (!PKUserIntentIsAvailable()) {
    return 2;
  }
  if (!PKPearlIsAvailable()) {
    return 3;
  }
  if (PKRunningInViewService()) {
    return 3;
  }
  return 2;
}

- (void)resetWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  objc_super v5 = self->_LAContext;
  LAContext = self->_LAContext;
  self->_LAContext = 0;

  self->_userIntentAvailabilityState = [(PKAuthenticatorSharedRootContext *)self _initialUserIntentAvailabilityState];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v12 = v5;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "PKAuthenticatorSharedRootContext (%{public}p): shared context cleared and attempting reset...", buf, 0xCu);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__PKAuthenticatorSharedRootContext_resetWithCompletion___block_invoke;
    v8[3] = &unk_2644F9090;
    v9 = v5;
    v10 = v4;
    [(LAContext *)v9 resetWithReply:v8];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __56__PKAuthenticatorSharedRootContext_resetWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) invalidate];
  v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    int v17 = 134349314;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    v9 = "PKAuthenticatorSharedRootContext (%{public}p): failed to reset former shared context - %@.";
    v10 = v6;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v17 = 134349056;
    uint64_t v18 = v8;
    v9 = "PKAuthenticatorSharedRootContext (%{public}p): former context reset and invalidated.";
    v10 = v6;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_21EEBD000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
LABEL_8:

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v13, v14, v15);
  }
}

- (id)externalizedContext
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LAContext = self->_LAContext;
  if (!LAContext)
  {
    id v5 = (LAContext *)objc_alloc_init(MEMORY[0x263F10468]);
    v6 = self->_LAContext;
    self->_LAContext = v5;

    BOOL v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_LAContext;
      int v12 = 134349056;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "PKAuthenticatorSharedRootContext (%{public}p): creating shared root.", (uint8_t *)&v12, 0xCu);
    }

    LAContext = self->_LAContext;
  }
  v9 = LAContext;
  os_unfair_lock_unlock(p_lock);
  v10 = [(LAContext *)v9 externalizedContext];

  return v10;
}

- (int64_t)userIntentAvailabilityState
{
  return self->_userIntentAvailabilityState;
}

- (void)setUserIntentAvailabilityState:(int64_t)a3
{
  self->_userIntentAvailabilityState = a3;
}

- (void).cxx_destruct
{
}

@end