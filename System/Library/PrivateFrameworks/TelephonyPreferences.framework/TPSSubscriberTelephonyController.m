@interface TPSSubscriberTelephonyController
- (BOOL)isSIMPasscodeLockEnabled;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSString)SIMStatus;
- (TPSSubscriberTelephonyController)init;
- (TPSSubscriberTelephonyController)initWithSubscriptionContext:(id)a3;
- (id)getSIMPasscodeLockEnabledValue;
- (id)getSIMPasscodeLockEnabledValueWithError:(id *)a3;
- (id)getSIMPasscodeRemainingAttemptsValue;
- (id)getSIMPasscodeRemainingAttemptsValueWithError:(id *)a3;
- (id)getSIMStatus;
- (id)getSIMStatusWithError:(id *)a3;
- (int64_t)SIMPasscodeRemainingAttempts;
- (void)changePIN:(id)a3 newPin:(id)a4;
- (void)changePIN:(id)a3 newPin:(id)a4 completion:(id)a5;
- (void)fetchSIMPasscodeLockEnabled;
- (void)fetchSIMPasscodeLockEnabledWithCompletion:(id)a3;
- (void)fetchSIMPasscodeRemainingAttempts;
- (void)fetchSIMPasscodeRemainingAttemptsWithCompletion:(id)a3;
- (void)fetchSIMStatus;
- (void)fetchSIMStatusWithCompletion:(id)a3;
- (void)getSIMPasscodeRemainingAttemptsValue;
- (void)getSIMStatus;
- (void)presentSIMPasscodeAlert;
- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4;
- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4 completion:(id)a5;
- (void)setSIMPasscodeLockEnabled:(BOOL)a3;
- (void)setSIMPasscodeRemainingAttempts:(int64_t)a3;
- (void)setSIMStatus:(id)a3;
- (void)simLockSaveRequestDidComplete:(id)a3 success:(BOOL)a4;
- (void)simPinChangeRequestDidComplete:(id)a3 success:(BOOL)a4;
- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4;
- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation TPSSubscriberTelephonyController

- (TPSSubscriberTelephonyController)init
{
  return 0;
}

- (TPSSubscriberTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSSubscriberTelephonyController;
  v6 = [(TPSTelephonyController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_SIMPasscodeRemainingAttempts = 0x7FFFFFFFFFFFFFFFLL;
    v8 = [(TPSSubscriberTelephonyController *)v7 getSIMStatus];
    uint64_t v9 = [v8 copy];
    SIMStatus = v7->_SIMStatus;
    v7->_SIMStatus = (NSString *)v9;

    [(TPSSubscriberTelephonyController *)v7 fetchSIMPasscodeLockEnabled];
    [(TPSSubscriberTelephonyController *)v7 fetchSIMPasscodeRemainingAttempts];
  }

  return v7;
}

- (BOOL)isSIMPasscodeLockEnabled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__TPSSubscriberTelephonyController_isSIMPasscodeLockEnabled__block_invoke;
  v4[3] = &unk_1E6EB2280;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __60__TPSSubscriberTelephonyController_isSIMPasscodeLockEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)setSIMPasscodeLockEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke;
  v3[3] = &unk_1E6EB2650;
  v3[4] = self;
  BOOL v4 = a3;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v3];
}

uint64_t __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 72) != v2)
  {
    *(unsigned char *)(v1 + 72) = v2;
    v3 = *(void **)(result + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_2;
    v4[3] = &unk_1E6EB2650;
    v4[4] = v3;
    char v5 = *(unsigned char *)(result + 40);
    return [v3 performAtomicDelegateBlock:v4];
  }
  return result;
}

void __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          char v8 = [*(id *)(a1 + 32) delegateToQueue];
          uint64_t v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_3;
          block[3] = &unk_1E6EB2628;
          uint64_t v10 = *(void *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          char v12 = *(unsigned char *)(a1 + 40);
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriberController:*(void *)(a1 + 40) SIMPasscodeLockEnabledDidChange:*(unsigned __int8 *)(a1 + 48)];
}

- (int64_t)SIMPasscodeRemainingAttempts
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__TPSSubscriberTelephonyController_SIMPasscodeRemainingAttempts__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  void v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __64__TPSSubscriberTelephonyController_SIMPasscodeRemainingAttempts__block_invoke(uint64_t a1)
{
  int64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 getSIMPasscodeRemainingAttemptsValue];
    *(void *)(*(void *)(a1 + 32) + 80) = [v4 integerValue];

    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void)setSIMPasscodeRemainingAttempts:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke;
  v3[3] = &unk_1E6EB2408;
  v3[4] = self;
  void v3[5] = a3;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v3];
}

uint64_t __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 80) != v2)
  {
    *(void *)(v1 + 80) = v2;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_2;
    v4[3] = &unk_1E6EB2408;
    uint64_t v3 = *(void *)(result + 40);
    id v5 = *(id *)(result + 32);
    uint64_t v6 = v3;
    return [v5 performAtomicDelegateBlock:v4];
  }
  return result;
}

void __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          uint64_t v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_3;
          block[3] = &unk_1E6EB23E0;
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          void block[6] = v11;
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriberController:*(void *)(a1 + 40) SIMPasscodeRemainingAttemptsDidChange:*(void *)(a1 + 48)];
}

- (NSString)SIMStatus
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__TPSSubscriberTelephonyController_SIMStatus__block_invoke;
  v4[3] = &unk_1E6EB2280;
  void v4[4] = self;
  void v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__TPSSubscriberTelephonyController_SIMStatus__block_invoke(uint64_t a1)
{
}

- (void)setSIMStatus:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 88) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_2;
    v8[3] = &unk_1E6EB22C8;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 40);
    [v7 performAtomicDelegateBlock:v8];
  }
}

void __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_3;
          block[3] = &unk_1E6EB2180;
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriberController:*(void *)(a1 + 40) SIMStatusDidChange:*(void *)(a1 + 48)];
}

- (void)changePIN:(id)a3 newPin:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke;
  v4[3] = &unk_1E6EB2340;
  void v4[4] = self;
  [(TPSSubscriberTelephonyController *)self changePIN:a3 newPin:a4 completion:v4];
}

void __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 domain];

    if (v4)
    {
      uint64_t v5 = TPSLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1();
      }
    }
  }
}

- (void)changePIN:(id)a3 newPin:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v11 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  [v12 changePIN:v11 oldPin:v10 newPin:v9 completion:v8];
}

- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke;
  v7[3] = &unk_1E6EB2678;
  objc_copyWeak(&v8, &location);
  BOOL v9 = v4;
  [(TPSSubscriberTelephonyController *)self setSIMLockEnabled:v4 pin:v6 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];

    if (v5)
    {
      id v6 = TPSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke_cold_1(a1);
      }
    }
  }
}

- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = [(TPSTelephonyController *)self telephonyClient];
  id v10 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  [v11 saveSIMLockValue:v10 enabled:v6 pin:v9 completion:v8];
}

- (void)presentSIMPasscodeAlert
{
  BOOL v4 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v5 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke;
  v6[3] = &unk_1E6EB26A0;
  v6[4] = self;
  void v6[5] = a2;
  [v4 promptForSIMUnlock:v5 completion:v6];
}

void __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];

    if (v5)
    {
      BOOL v6 = TPSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke_cold_1(a1);
      }
    }
  }
}

- (id)getSIMPasscodeLockEnabledValue
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v3 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeLockEnabledValueWithError:&v12];
  id v4 = v12;
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 domain];

    if (v6)
    {
      uint64_t v7 = TPSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = objc_opt_class();
        id v10 = v9;
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        long long v14 = v9;
        __int16 v15 = 2112;
        long long v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
      }
    }
  }

  return v3;
}

- (id)getSIMPasscodeLockEnabledValueWithError:(id *)a3
{
  uint64_t v5 = [(TPSTelephonyController *)self telephonyClient];
  BOOL v6 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  uint64_t v7 = [v5 fetchSIMLockValue:v6 error:a3];

  return v7;
}

- (void)fetchSIMPasscodeLockEnabled
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__TPSSubscriberTelephonyController_fetchSIMPasscodeLockEnabled__block_invoke;
  v2[3] = &unk_1E6EB26C8;
  v2[4] = self;
  v2[5] = a2;
  [(TPSSubscriberTelephonyController *)self fetchSIMPasscodeLockEnabledWithCompletion:v2];
}

void __63__TPSSubscriberTelephonyController_fetchSIMPasscodeLockEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSIMPasscodeLockEnabled:", objc_msgSend(a2, "BOOLValue"));
  if (v5)
  {
    BOOL v6 = [v5 domain];

    if (v6)
    {
      uint64_t v7 = TPSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_opt_class();
        id v9 = *(const char **)(a1 + 40);
        id v10 = v8;
        id v11 = NSStringFromSelector(v9);
        int v12 = 138412802;
        id v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v11;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (void)fetchSIMPasscodeLockEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  id v5 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  [v6 fetchSIMLockValue:v5 completion:v4];
}

- (id)getSIMPasscodeRemainingAttemptsValue
{
  id v8 = 0;
  id v2 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeRemainingAttemptsValueWithError:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];

    if (v5)
    {
      id v6 = TPSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue]();
      }
    }
  }

  return v2;
}

- (id)getSIMPasscodeRemainingAttemptsValueWithError:(id *)a3
{
  id v5 = [(TPSTelephonyController *)self telephonyClient];
  id v6 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  uint64_t v7 = [v5 getRemainingPINAttemptCount:v6 error:a3];

  return v7;
}

- (void)fetchSIMPasscodeRemainingAttempts
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__TPSSubscriberTelephonyController_fetchSIMPasscodeRemainingAttempts__block_invoke;
  v2[3] = &unk_1E6EB26C8;
  v2[4] = self;
  v2[5] = a2;
  [(TPSSubscriberTelephonyController *)self fetchSIMPasscodeRemainingAttemptsWithCompletion:v2];
}

void __69__TPSSubscriberTelephonyController_fetchSIMPasscodeRemainingAttempts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSIMPasscodeRemainingAttempts:", objc_msgSend(a2, "integerValue"));
  if (v5)
  {
    id v6 = [v5 domain];

    if (v6)
    {
      uint64_t v7 = TPSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_opt_class();
        id v9 = *(const char **)(a1 + 40);
        id v10 = v8;
        id v11 = NSStringFromSelector(v9);
        int v12 = 138412802;
        id v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v11;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (void)fetchSIMPasscodeRemainingAttemptsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  id v5 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  [v6 getRemainingPINAttemptCount:v5 completion:v4];
}

- (id)getSIMStatus
{
  id v8 = 0;
  id v2 = [(TPSSubscriberTelephonyController *)self getSIMStatusWithError:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];

    if (v5)
    {
      id v6 = TPSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TPSSubscriberTelephonyController getSIMStatus]();
      }
    }
  }

  return v2;
}

- (id)getSIMStatusWithError:(id *)a3
{
  id v5 = [(TPSTelephonyController *)self telephonyClient];
  id v6 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  uint64_t v7 = [v5 getSIMStatus:v6 error:a3];

  return v7;
}

- (void)fetchSIMStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__TPSSubscriberTelephonyController_fetchSIMStatus__block_invoke;
  v2[3] = &unk_1E6EB26F0;
  v2[4] = self;
  v2[5] = a2;
  [(TPSSubscriberTelephonyController *)self fetchSIMStatusWithCompletion:v2];
}

void __50__TPSSubscriberTelephonyController_fetchSIMStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setSIMStatus:a2];
  if (v5)
  {
    id v6 = [v5 domain];

    if (v6)
    {
      uint64_t v7 = TPSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_opt_class();
        id v9 = *(const char **)(a1 + 40);
        id v10 = v8;
        id v11 = NSStringFromSelector(v9);
        int v12 = 138412802;
        id v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v11;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_error_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (void)fetchSIMStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  id v5 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  [v6 getSIMStatus:v5 completion:v4];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  id v10 = [v9 uuid];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    int v12 = TPSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "SIM status changed to %@ for subscription context %@.", (uint8_t *)&v15, 0x16u);
    }

    id v13 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeLockEnabledValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeLockEnabled:](self, "setSIMPasscodeLockEnabled:", [v13 BOOLValue]);

    __int16 v14 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeRemainingAttemptsValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", [v14 integerValue]);

    [(TPSSubscriberTelephonyController *)self setSIMStatus:v7];
  }
}

- (void)simLockSaveRequestDidComplete:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 uuid];
  id v8 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  id v9 = [v8 uuid];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    int v11 = TPSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = @"unsuccessful";
      if (v4) {
        int v12 = @"successful";
      }
      *(_DWORD *)buf = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1E4DD4000, v11, OS_LOG_TYPE_DEFAULT, "SIM lock save request was %@ for subscription context %@.", buf, 0x16u);
    }

    id v13 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeLockEnabledValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeLockEnabled:](self, "setSIMPasscodeLockEnabled:", [v13 BOOLValue]);

    __int16 v14 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeRemainingAttemptsValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", [v14 integerValue]);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke;
    v15[3] = &unk_1E6EB2650;
    v15[4] = self;
    BOOL v16 = v4;
    [(TPSController *)self performAtomicDelegateBlock:v15];
  }
}

void __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          id v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke_2;
          block[3] = &unk_1E6EB2628;
          uint64_t v10 = *(void *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          char v12 = *(unsigned char *)(a1 + 40);
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriberController:*(void *)(a1 + 40) SIMLockDidCompleteWithResult:*(unsigned __int8 *)(a1 + 48)];
}

- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 uuid];
  uint64_t v7 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  id v8 = [v7 uuid];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "SIM PIN entry attempt failed for subscription context %@.", buf, 0xCu);
    }

    int v11 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeRemainingAttemptsValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", [v11 integerValue]);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke;
    v12[3] = &unk_1E6EB2258;
    v12[4] = self;
    [(TPSController *)self performAtomicDelegateBlock:v12];
  }
}

void __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          int v9 = [v8 objectForKey:v7];

          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke_2;
          v11[3] = &unk_1E6EB22C8;
          uint64_t v10 = *(void *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) SIMPasscodeEntryDidFailForSubscriberController:*(void *)(a1 + 40)];
}

- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 uuid];
  uint64_t v7 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  id v8 = [v7 uuid];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "SIM PUK entry attempt failed for subscription context %@.", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke;
    v11[3] = &unk_1E6EB2258;
    v11[4] = self;
    [(TPSController *)self performAtomicDelegateBlock:v11];
  }
}

void __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          int v9 = [v8 objectForKey:v7];

          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke_2;
          v11[3] = &unk_1E6EB22C8;
          uint64_t v10 = *(void *)(a1 + 32);
          v11[4] = v7;
          void v11[5] = v10;
          dispatch_async(v9, v11);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) SIMPUKEntryDidFailForSubscriberController:*(void *)(a1 + 40)];
}

- (void)simPinChangeRequestDidComplete:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 uuid];
  id v8 = [(TPSSubscriberTelephonyController *)self subscriptionContext];
  int v9 = [v8 uuid];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    int v11 = TPSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = @"unsuccessful";
      if (v4) {
        long long v12 = @"successful";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1E4DD4000, v11, OS_LOG_TYPE_DEFAULT, "SIM PIN change was %@ for %@.", buf, 0x16u);
    }

    long long v13 = [(TPSSubscriberTelephonyController *)self getSIMPasscodeRemainingAttemptsValue];
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", [v13 integerValue]);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke;
    v14[3] = &unk_1E6EB2650;
    v14[4] = self;
    BOOL v15 = v4;
    [(TPSController *)self performAtomicDelegateBlock:v14];
  }
}

void __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [*(id *)(a1 + 32) delegateToQueue];
          int v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke_2;
          block[3] = &unk_1E6EB2628;
          uint64_t v10 = *(void *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          char v12 = *(unsigned char *)(a1 + 40);
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriberController:*(void *)(a1 + 40) SIMPasscodeChangeDidCompleteWithResult:*(unsigned __int8 *)(a1 + 48)];
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_SIMStatus, 0);
}

void __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_1(&dword_1E4DD4000, v2, v3, "%@ SIM PIN change failed with error %@.", v4, v5, v6, v7, v8);
}

void __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_2(&dword_1E4DD4000, v2, v3, "%@ set SIM lock %@ failed with error %@.", v4, v5, v6, v7, 2u);
}

void __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(const char **)(a1 + 40);
  id v4 = v2;
  int v11 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_2(&dword_1E4DD4000, v5, v6, "-[%@ %@] failed with error %@.", v7, v8, v9, v10, 2u);
}

- (void)getSIMPasscodeRemainingAttemptsValue
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_1(&dword_1E4DD4000, v2, v3, "%@ get remaining PIN attempt count failed with error %@.", v4, v5, v6, v7, v8);
}

- (void)getSIMStatus
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_1(&dword_1E4DD4000, v2, v3, "%@ get SIM status failed with error %@.", v4, v5, v6, v7, v8);
}

@end