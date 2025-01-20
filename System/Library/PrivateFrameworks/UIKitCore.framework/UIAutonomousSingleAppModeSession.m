@interface UIAutonomousSingleAppModeSession
+ (id)__gaxTrampoline_currentlyActiveSession;
+ (id)currentlyActiveSession;
+ (void)__gaxTrampoline_requestSessionWithConfiguration:(id)a3 completion:(id)a4;
+ (void)requestSessionWithConfiguration:(id)a3 completion:(id)a4;
- (BOOL)isActive;
- (UIAutonomousSingleAppModeConfiguration)effectiveConfiguration;
- (UIAutonomousSingleAppModeSession)initWithEffectiveConfiguration:(id)a3;
- (void)__gaxTrampoline_endSessionWithCompletion:(id)a3;
- (void)_guidedAccessStateDidChange:(id)a3;
- (void)dealloc;
- (void)endWithCompletion:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setEffectiveConfiguration:(id)a3;
@end

@implementation UIAutonomousSingleAppModeSession

- (UIAutonomousSingleAppModeSession)initWithEffectiveConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAutonomousSingleAppModeSession;
  v5 = [(UIAutonomousSingleAppModeSession *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(UIAutonomousSingleAppModeSession *)v5 setEffectiveConfiguration:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__guidedAccessStateDidChange_ name:@"UIAccessibilityGuidedAccessStateChanged" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityGuidedAccessStateChanged" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIAutonomousSingleAppModeSession;
  [(UIAutonomousSingleAppModeSession *)&v4 dealloc];
}

- (void)_guidedAccessStateDidChange:(id)a3
{
  if (!UIAccessibilityIsGuidedAccessEnabled())
  {
    [(UIAutonomousSingleAppModeSession *)self setActive:0];
  }
}

- (UIAutonomousSingleAppModeConfiguration)effectiveConfiguration
{
  v2 = (void *)[(UIAutonomousSingleAppModeConfiguration *)self->_effectiveConfiguration copy];
  return (UIAutonomousSingleAppModeConfiguration *)v2;
}

+ (id)currentlyActiveSession
{
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded];
  return (id)objc_msgSend(a1, "__gaxTrampoline_currentlyActiveSession");
}

+ (id)__gaxTrampoline_currentlyActiveSession
{
  return 0;
}

+ (void)requestSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded];
  objc_msgSend(a1, "__gaxTrampoline_requestSessionWithConfiguration:completion:", v7, v6);
}

+ (void)__gaxTrampoline_requestSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__UIAutonomousSingleAppModeSession___gaxTrampoline_requestSessionWithConfiguration_completion___block_invoke;
  block[3] = &unk_1E52DA040;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __95__UIAutonomousSingleAppModeSession___gaxTrampoline_requestSessionWithConfiguration_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _UINSLocalizedStringWithDefaultValue(@"The application is not configured properly for Autonomous Single App Mode.", @"The application is not configured properly for Autonomous Single App Mode.");
    v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v3 errorWithDomain:@"UIAutonomousSingleAppModeErrorDomain" code:0 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)endWithCompletion:(id)a3
{
  id v4 = a3;
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded];
  [(UIAutonomousSingleAppModeSession *)self __gaxTrampoline_endSessionWithCompletion:v4];
}

- (void)__gaxTrampoline_endSessionWithCompletion:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__UIAutonomousSingleAppModeSession___gaxTrampoline_endSessionWithCompletion___block_invoke;
  block[3] = &unk_1E52DA040;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__UIAutonomousSingleAppModeSession___gaxTrampoline_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = _UINSLocalizedStringWithDefaultValue(@"Ending the guided access session failed with an unknown internal error.", @"Ending the guided access session failed with an unknown internal error.");
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v3 errorWithDomain:@"UIAutonomousSingleAppModeErrorDomain" code:0x7FFFFFFFFFFFFFFFLL userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setEffectiveConfiguration:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end