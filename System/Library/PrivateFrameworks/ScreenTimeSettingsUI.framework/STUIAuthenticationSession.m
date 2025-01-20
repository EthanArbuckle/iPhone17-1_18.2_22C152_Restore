@interface STUIAuthenticationSession
+ (id)shared;
- (BOOL)hasAlreadyEnteredPINForSession;
- (STUIAuthenticationSession)init;
- (void)_passcodeSessionHasEnded:(id)a3;
- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3;
@end

@implementation STUIAuthenticationSession

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__STUIAuthenticationSession_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_singleton;

  return v2;
}

uint64_t __35__STUIAuthenticationSession_shared__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = shared_singleton;
  shared_singleton = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (STUIAuthenticationSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIAuthenticationSession;
  v2 = [(STUIAuthenticationSession *)&v5 init];
  v2->_hasAlreadyEnteredPINForSession = 0;
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v2 selector:sel__passcodeSessionHasEnded_ name:*MEMORY[0x263F833C0] object:0];

  return v2;
}

- (void)_passcodeSessionHasEnded:(id)a3
{
}

- (BOOL)hasAlreadyEnteredPINForSession
{
  return self->_hasAlreadyEnteredPINForSession;
}

- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3
{
  self->_hasAlreadyEnteredPINForSession = a3;
}

@end