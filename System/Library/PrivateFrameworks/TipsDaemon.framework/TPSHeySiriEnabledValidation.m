@interface TPSHeySiriEnabledValidation
- (BOOL)getCurrentState;
- (uint64_t)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHeySiriEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(TPSHeySiriEnabledValidation *)self getCurrentState];
  uint64_t v6 = v5 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v7];
  }

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFAssistantRestrictedSymbolLoc_ptr;
  v11 = getAFAssistantRestrictedSymbolLoc_ptr;
  if (!getAFAssistantRestrictedSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getAFAssistantRestrictedSymbolLoc_block_invoke;
    v7[3] = &unk_1E6E6AE20;
    v7[4] = &v8;
    __getAFAssistantRestrictedSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (uint64_t (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    uint64_t v6 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  if (v2()) {
    return 0;
  }
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"VoiceTrigger Enabled", @"com.apple.voicetrigger");
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3 == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
  CFRelease(v3);
  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  BOOL v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSHeySiriEnabledValidation getCurrentState](self, "getCurrentState"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v6, v7, 0);
}

- (uint64_t)getCurrentState
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[TPSMedicalIDEnabledValidation validateWithCompletion:](v0);
}

@end