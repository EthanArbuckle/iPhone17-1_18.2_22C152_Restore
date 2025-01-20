@interface TUIKTLearnMorePresenter
- (TUIKTLearnMorePresenter)init;
- (void)dealloc;
- (void)init;
- (void)presentWithPresentingViewController:(id)a3;
@end

@implementation TUIKTLearnMorePresenter

- (TUIKTLearnMorePresenter)init
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3, &__block_literal_global_3);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTLearnMorePresenter init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)TUIKTLearnMorePresenter;
  v3 = [(TUIKTLearnMorePresenter *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.contactkey"];
    privacyPresenter = v3->_privacyPresenter;
    v3->_privacyPresenter = (OBPrivacyPresenter *)v4;
  }
  return v3;
}

uint64_t __31__TUIKTLearnMorePresenter_init__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

uint64_t __34__TUIKTLearnMorePresenter_dealloc__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)presentWithPresentingViewController:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_3, &__block_literal_global_9);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTLearnMorePresenter presentWithPresentingViewController:]();
  }
  [(OBPrivacyPresenter *)self->_privacyPresenter setPresentingViewController:v4];
  [(OBPrivacyPresenter *)self->_privacyPresenter present];
}

uint64_t __63__TUIKTLearnMorePresenter_presentWithPresentingViewController___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)presentWithPresentingViewController:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_260338000, v2, OS_LOG_TYPE_DEBUG, "%s presentingViewController = %{public}@ on %{public}@", (uint8_t *)v3, 0x20u);
}

@end