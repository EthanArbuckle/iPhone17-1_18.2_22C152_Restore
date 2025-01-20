@interface TPSApplePayPeerValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSApplePayPeerValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v5 = (uint64_t (*)(void))getPKPeerPaymentIsAvailableSymbolLoc_ptr;
  v14 = getPKPeerPaymentIsAvailableSymbolLoc_ptr;
  if (!getPKPeerPaymentIsAvailableSymbolLoc_ptr)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getPKPeerPaymentIsAvailableSymbolLoc_block_invoke;
    v10[3] = &unk_1E6E6AE20;
    v10[4] = &v11;
    __getPKPeerPaymentIsAvailableSymbolLoc_block_invoke((uint64_t)v10);
    v5 = (uint64_t (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v5)
  {
    v9 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v9);
  }
  int v6 = v5();
  uint64_t v7 = v6 ^ [(TPSTargetingValidation *)self BOOLValue] ^ 1;
  v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(TPSApplePayPeerValidation *)self validateWithCompletion:v8];
  }

  v4[2](v4, v7, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.2(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 name];
  uint64_t v7 = [a1 targetContext];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end