@interface PKAuthenticator
+ (BOOL)_isAccessibilityUserIntentEnabled;
+ (BOOL)canPerformPSD2StyleBuyForAccessControlRef:(__SecAccessControl *)a3;
+ (BOOL)isUserIntentAvailableWithStyle:(int64_t)a3;
+ (id)viewServiceBundleID;
+ (int64_t)userIntentStyle;
+ (unint64_t)_currentStateForMechanisms:(id)a3;
+ (unint64_t)cachedStateForPolicy:(int64_t)a3;
+ (unint64_t)currentStateForAccessControl:(__SecAccessControl *)a3;
+ (unint64_t)currentStateForPolicy:(int64_t)a3;
+ (void)currentStateForRequest:(id)a3 completion:(id)a4;
+ (void)preheatAuthenticator;
+ (void)removeUserIntentAvailable;
+ (void)resetSharedRootContextWithCompletion:(id)a3;
- (BOOL)_delegateSupportsPasscodePresentation;
- (BOOL)_delegateSupportsPassphrasePresentation;
- (BOOL)fingerPresent;
- (BOOL)passcodeActive;
- (BOOL)passcodeWasPresented;
- (BOOL)passphraseActive;
- (NSDictionary)clientAnalyticsParameters;
- (PKAuthenticator)init;
- (PKAuthenticator)initWithDelegate:(id)a3;
- (PKAuthenticatorDelegate)delegate;
- (id)_context;
- (id)_optionsForEvaluationRequest:(id)a3 withEvaluationContext:(id)a4;
- (id)_swapContext:(id)a3;
- (id)_swapContext:(id)a3 withOptions:(unint64_t)a4;
- (int64_t)coachingState;
- (int64_t)evaluationState;
- (unint64_t)authenticationIdentifier;
- (void)_evaluateEvaluationContext:(id)a3;
- (void)_handleInstructionsForRequest:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)accessExternalizedContextWithCompletion:(id)a3;
- (void)cancelEvaluation;
- (void)cancelEvaluationWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)evaluateRequest:(id)a3 withCompletion:(id)a4;
- (void)fallbackToSystemPasscodeUI;
- (void)invalidate;
- (void)restartEvaluation;
- (void)setClientAnalyticsParameters:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKAuthenticator

- (PKAuthenticator)init
{
  return [(PKAuthenticator *)self initWithDelegate:0];
}

- (PKAuthenticator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAuthenticator;
  v5 = [(PKAuthenticator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(PKAuthenticatorEvaluationContext *)self->_context invalidate];
  id v3 = [(PKAuthenticatorEvaluationContext *)self->_context hoistCompletionHandler];
  id v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__PKAuthenticator_dealloc__block_invoke;
    block[3] = &unk_2644F8C80;
    id v7 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKAuthenticator;
  [(PKAuthenticator *)&v5 dealloc];
}

void __26__PKAuthenticator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F5BD98] responseWithResult:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (void)preheatAuthenticator
{
}

+ (void)resetSharedRootContextWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[PKAuthenticatorSharedRootContext sharedInstance];
  [v4 resetWithCompletion:v3];
}

+ (BOOL)isUserIntentAvailableWithStyle:(int64_t)a3
{
  id v4 = +[PKAuthenticatorSharedRootContext sharedInstance];
  uint64_t v5 = [v4 userIntentAvailabilityState];

  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1) {
      return 0;
    }
    return ((v5 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    return v5 == 1;
  }
}

+ (BOOL)_isAccessibilityUserIntentEnabled
{
  int IsAvailable = PKUserIntentIsAvailable();
  if (IsAvailable)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F10490]) initWithDomain:0 authenticationContext:0];
    char v4 = [v3 BOOLForKey:1 error:0];

    LOBYTE(IsAvailable) = v4;
  }
  return IsAvailable;
}

+ (int64_t)userIntentStyle
{
  if (!PKUserIntentIsAvailable()) {
    return 0;
  }
  if (![a1 _isAccessibilityUserIntentEnabled]) {
    return 1;
  }
  if (_AXSAssistiveTouchEnabled()) {
    return 2;
  }
  if (UIAccessibilityIsSwitchControlRunning()) {
    return 3;
  }
  return -1;
}

+ (void)removeUserIntentAvailable
{
  id v2 = +[PKAuthenticatorSharedRootContext sharedInstance];
  if ([v2 userIntentAvailabilityState] == 3) {
    [v2 setUserIntentAvailabilityState:2];
  }
}

+ (unint64_t)currentStateForPolicy:(int64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = _LAPolicyContainerForPKPolicy(a3);
  unint64_t v7 = v6;
  if ((v6 & 0x100) != 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__PKAuthenticator_currentStateForPolicy___block_invoke;
    v12[3] = &unk_2644F9358;
    v12[4] = &v13;
    v12[5] = v5;
    v12[6] = v6;
    _AccessPreflightContext(HIDWORD(v6) & 1, v12);
  }
  unint64_t v8 = [a1 _currentStateForMechanisms:v14[5]];
  if ((v7 & 0x100000000) == 0)
  {
    CFTimeInterval v9 = CACurrentMediaTime();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__PKAuthenticator_currentStateForPolicy___block_invoke_443;
    v11[3] = &__block_descriptor_56_e29_v16__0__NSMutableDictionary_8l;
    v11[4] = v8;
    *(CFTimeInterval *)&v11[5] = v9;
    v11[6] = a3;
    _AccessAuthenticatorStateCache(v11);
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__PKAuthenticator_currentStateForPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v7 = [a2 evaluationMechanismsForPolicy:v6 error:&v12];
  id v8 = v12;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (v8)
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_21EEBD000, v11, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }
  }
  v5[2](v5);
}

void __41__PKAuthenticator_currentStateForPolicy___block_invoke_443(void *a1, void *a2)
{
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v3 = (void *)MEMORY[0x263F08D40];
  id v4 = a2;
  uint64_t v5 = [v3 valueWithBytes:&v7 objCType:"{?=Qd}"];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", a1[6], v7, v8);
  [v4 setObject:v5 forKeyedSubscript:v6];
}

+ (void)currentStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _LAPolicyContainerForPKPolicy([a3 policy]);
  if ((v8 & 0x100) != 0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__PKAuthenticator_currentStateForRequest_completion___block_invoke;
    v9[3] = &unk_2644F93C8;
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    id v10 = v6;
    id v13 = a1;
    _AccessPreflightContext(0, v9);
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __53__PKAuthenticator_currentStateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__PKAuthenticator_currentStateForRequest_completion___block_invoke_2;
  v10[3] = &unk_2644F93A0;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  id v7 = v5;
  id v8 = a2;
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x223C3D8D0](v10);
  ((void (**)(void, id, void))v9)[2](v9, v8, 0);
}

void __53__PKAuthenticator_currentStateForRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = a3;
  id v6 = a3;
  id v7 = [a2 evaluationMechanismsForPolicy:v5 error:&v10];
  id v8 = v10;

  if (v8)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_21EEBD000, v9, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 64) _currentStateForMechanisms:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (unint64_t)currentStateForAccessControl:(__SecAccessControl *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PKAuthenticator_currentStateForAccessControl___block_invoke;
  v6[3] = &unk_2644F93F0;
  v6[4] = &v7;
  v6[5] = a3;
  _AccessPreflightContext(0, v6);
  unint64_t v4 = [a1 _currentStateForMechanisms:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__PKAuthenticator_currentStateForAccessControl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v7 = [a2 evaluationMechanismsForAccessControl:v6 operation:3 error:&v12];
  id v8 = v12;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (v8)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_21EEBD000, v11, OS_LOG_TYPE_DEFAULT, "Authentication Mechanism Error: %@", buf, 0xCu);
    }
  }
  v5[2](v5);
}

+ (BOOL)canPerformPSD2StyleBuyForAccessControlRef:(__SecAccessControl *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CFRetain(a3);
    int v4 = +[PKAuthenticator currentStateForAccessControl:a3];
    uint64_t v5 = v4 & +[PKAuthenticator currentStateForPolicy:2] & 0xELL;
    BOOL v6 = v5 != 0;
    CFRelease(a3);
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "+[PKAuthenticator canPerformPSD2StyleBuyForAccessControlRef:]";
      __int16 v11 = 1024;
      BOOL v12 = v5 != 0;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "ACL is missing, cannot determine if a buy is possible.", (uint8_t *)&v9, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

+ (unint64_t)_currentStateForMechanisms:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 containsObject:&unk_26D0868C0]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    if ([v3 containsObject:&unk_26D0868A8]) {
      v4 |= 8uLL;
    }
    int v5 = [v3 containsObject:&unk_26D0868D8];
    uint64_t v6 = v4 | 4;
    if (!v5) {
      uint64_t v6 = v4;
    }
    if (v6) {
      unint64_t v7 = v6 | 1;
    }
    else {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)cachedStateForPolicy:(int64_t)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  _LAPolicyContainerForPKPolicy(a3);
  if ((v5 & 0x100000000) == 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__PKAuthenticator_cachedStateForPolicy___block_invoke;
    v12[3] = &unk_2644F9418;
    v12[4] = &v13;
    v12[5] = a3;
    _AccessAuthenticatorStateCache(v12);
  }
  if (!v14[5])
  {
    uint64_t v8 = [a1 currentStateForPolicy:a3];
LABEL_8:
    unint64_t v7 = v8;
    goto LABEL_9;
  }
  double v6 = CACurrentMediaTime();
  unint64_t v10 = 0;
  double v11 = 0.0;
  [(id)v14[5] getValue:&v10];
  if (v6 - v11 >= 0.2)
  {
    uint64_t v8 = objc_msgSend(a1, "currentStateForPolicy:", a3, v6 - v11);
    goto LABEL_8;
  }
  unint64_t v7 = v10;
LABEL_9:
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __40__PKAuthenticator_cachedStateForPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v9 = [v3 numberWithInteger:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:v9];

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (id)viewServiceBundleID
{
  return @"com.apple.CoreAuthUI";
}

- (id)_context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_context;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)_swapContext:(id)a3
{
  return [(PKAuthenticator *)self _swapContext:a3 withOptions:0];
}

- (id)_swapContext:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  p_context = &self->_context;
  context = self->_context;
  v33 = v7;
  if (self->_invalidated)
  {
    if ((unint64_t)v7 | (unint64_t)context)
    {
      unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
      double v11 = v10;
      if (*p_context)
      {
        objc_msgSend(v10, "addObject:");
        BOOL v12 = *p_context;
        if (!v7) {
          goto LABEL_5;
        }
      }
      else
      {
        BOOL v12 = 0;
        if (!v7)
        {
LABEL_5:
          if (!v12) {
            goto LABEL_10;
          }
          goto LABEL_14;
        }
      }
      BOOL v17 = v12 == v7;
      BOOL v12 = (PKAuthenticatorEvaluationContext *)v7;
      if (!v17)
      {
        [v11 addObject:v7];
        BOOL v12 = *p_context;
        if (!*p_context) {
          goto LABEL_10;
        }
      }
LABEL_14:
      *p_context = 0;

      id WeakRetained = 0;
      unint64_t v14 = 0;
      uint64_t v13 = 0;
      goto LABEL_15;
    }
LABEL_9:
    double v11 = 0;
LABEL_10:
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    v16 = 0;
    goto LABEL_25;
  }
  if (context == v7) {
    goto LABEL_9;
  }
  uint64_t v13 = context;
  unint64_t v14 = (unint64_t)v7;
  objc_storeStrong((id *)&self->_context, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v11 = 0;
LABEL_15:
  ++self->_authenticationIdentifier;
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    [(PKAuthenticatorEvaluationContext *)v13 setDelegate:0 resetPriorDelegate:v14 == 0];
    [(PKAuthenticatorEvaluationContext *)v13 invalidateWithIntent:(v4 & 2 | v14) != 0];
    uint64_t v18 = [(PKAuthenticatorEvaluationContext *)v13 hoistCompletionHandler];
    v19 = (void (**)(void, void))v18;
    if ((v4 & 1) == 0 && v18)
    {
      v20 = [MEMORY[0x263F5BD98] responseWithResult:2];
      ((void (**)(void, void *))v19)[2](v19, v20);
    }
  }
  if (v14)
  {
    v21 = [(id)v14 request];
    char v22 = [v21 useLegacyAuthenticator];

    if ((v22 & 1) == 0) {
      [(id)v14 _updateEvaluationState];
    }
    v16 = WeakRetained;
    [(id)v14 setDelegate:WeakRetained];
  }
  else
  {
    v16 = WeakRetained;
  }
LABEL_25:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = v11;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v28 invalidate];
        v29 = (void (**)(void, void))[v28 hoistCompletionHandler];
        if (v29)
        {
          v30 = [MEMORY[0x263F5BD98] responseWithResult:2];
          ((void (**)(void, void *))v29)[2](v29, v30);
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v25);
  }

  v31 = v13;
  return v31;
}

- (id)_optionsForEvaluationRequest:(id)a3 withEvaluationContext:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:&unk_26D086968];
  if (([v6 passcodeOnly] & 1) == 0)
  {
    if (PKPearlIsAvailable()) {
      id v9 = &unk_26D0868C0;
    }
    else {
      id v9 = &unk_26D0868D8;
    }
    [v8 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:v9];
  }
  if (PKUserIntentIsAvailable()) {
    [v8 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:&unk_26D0868F0];
  }
  BOOL v10 = [(PKAuthenticator *)self _delegateSupportsPasscodePresentation];
  uint64_t v11 = MEMORY[0x263EFFA88];
  if (v10)
  {
    long long v37 = &unk_26D086968;
    v38[0] = MEMORY[0x263EFFA88];
    BOOL v12 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v8 setObject:v12 forKeyedSubscript:&unk_26D0868A8];
  }
  if ([(PKAuthenticator *)self _delegateSupportsPassphrasePresentation])
  {
    long long v35 = &unk_26D086968;
    uint64_t v36 = v11;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v8 setObject:v13 forKeyedSubscript:&unk_26D086890];
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v14 setObject:v8 forKeyedSubscript:&unk_26D0869E0];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "maxBiometryFailures"));
  [v14 setObject:v15 forKeyedSubscript:&unk_26D0869F8];

  uint64_t v16 = MEMORY[0x263EFFA88];
  [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086A10];
  [v14 setObject:&unk_26D086968 forKeyedSubscript:&unk_26D086A28];
  [v14 setObject:v16 forKeyedSubscript:&unk_26D086A40];
  BOOL v17 = [v6 processName];

  if (v17)
  {
    uint64_t v18 = [v6 processName];
    [v14 setObject:v18 forKeyedSubscript:&unk_26D086A58];
  }
  v19 = [v6 reason];

  if (v19)
  {
    v20 = [v6 reason];
    [v14 setObject:v20 forKeyedSubscript:&unk_26D0868A8];
  }
  v21 = [v6 processIdentifier];

  if (v21)
  {
    char v22 = [v6 processIdentifier];
    [v14 setObject:v22 forKeyedSubscript:&unk_26D086A70];
  }
  if ([v7 isPolicySupported])
  {
    uint64_t v23 = [v7 policy];
    if (v23 == 1017 || v23 == 1006)
    {
      uint64_t v24 = [v6 PINTitle];
      if ([v24 length]) {
        [v14 setObject:v24 forKeyedSubscript:&unk_26D086A88];
      }
      uint64_t v25 = [v6 PINLength];
      if (v25) {
        [v14 setObject:v25 forKeyedSubscript:&unk_26D086AA0];
      }
    }
  }
  if ([v7 forceApplePayCheck]) {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086AB8];
  }
  if ([v7 forceSkipUserIntent]) {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086AD0];
  }
  if ((unint64_t)([v6 policy] - 2) <= 7) {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086AE8];
  }
  uint64_t v26 = [v6 physicalButtonTitle];

  if (v26)
  {
    v27 = [v6 physicalButtonTitle];
    [v14 setObject:v27 forKeyedSubscript:&unk_26D086B00];
  }
  v28 = [v6 passcodeTitle];

  if (v28)
  {
    v29 = [v6 passcodeTitle];
    [v14 setObject:v29 forKeyedSubscript:&unk_26D086B18];
  }
  v30 = [v6 fallbackOptionTitle];
  uint64_t v31 = [v30 length];

  if (v31)
  {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086B30];
    v32 = [v6 fallbackOptionTitle];
    [v14 setObject:v32 forKeyedSubscript:&unk_26D0868D8];
  }
  if ([v6 useLocationBasedAuthorization]) {
    [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D086B48];
  }
  v33 = (void *)[v14 copy];

  return v33;
}

- (void)_handleInstructionsForRequest:(id)a3 withContext:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (void)_evaluateEvaluationContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 request];
  id v6 = [(PKAuthenticator *)self _optionsForEvaluationRequest:v5 withEvaluationContext:v4];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__PKAuthenticator__evaluateEvaluationContext___block_invoke;
  v9[3] = &unk_2644F9440;
  objc_copyWeak(&v12, &location);
  id v7 = v5;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [v8 evaluateWithOptions:v6 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__PKAuthenticator__evaluateEvaluationContext___block_invoke(id *a1, unsigned __int8 a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v11 = 0;
  int v12 = a2 & (WeakRetained != 0);
  if (v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 5;
  }
  if (v12 == 1)
  {
    if ([a1[4] policy] != 1)
    {
      id v11 = [v8 externalizedContext];
      if (!v9) {
        goto LABEL_30;
      }
      goto LABEL_8;
    }
    id v11 = 0;
  }
  if (!v9) {
    goto LABEL_30;
  }
LABEL_8:
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v9;
    _os_log_impl(&dword_21EEBD000, v14, OS_LOG_TYPE_DEFAULT, "Authentication Error: %@", (uint8_t *)&v26, 0xCu);
  }

  uint64_t v15 = [v9 domain];
  int v16 = [v15 isEqualToString:*MEMORY[0x263F10440]];

  if (v16)
  {
    uint64_t v17 = [v9 code];
    switch(v17)
    {
      case -9:
        uint64_t v13 = 2;
        break;
      case -8:
        uint64_t v13 = 6;
        break;
      case -7:
        uint64_t v13 = 3;
        break;
      case -6:
      case -5:
        break;
      case -4:
        uint64_t v18 = [v9 userInfo];
        v19 = [v18 objectForKeyedSubscript:*MEMORY[0x263F10450]];

        if (v19)
        {
          uint64_t v20 = [v19 integerValue];
          uint64_t v21 = 4;
          if (v20 == 9) {
            uint64_t v21 = 1;
          }
          if (v20 == 18) {
            uint64_t v13 = 3;
          }
          else {
            uint64_t v13 = v21;
          }
        }
        else
        {
          uint64_t v13 = 4;
        }

        break;
      case -3:
        goto LABEL_18;
      case -2:
        uint64_t v13 = 1;
        break;
      default:
        if (v17 == -1023)
        {
          if ([a1[4] policy] == 10) {
            uint64_t v13 = 0;
          }
          else {
LABEL_18:
          }
            uint64_t v13 = 7;
        }
        break;
    }
  }
LABEL_30:
  if (v12)
  {
    __int16 v22 = [a1[5] presentationFlags];
    uint64_t v23 = (void *)MEMORY[0x263F5C310];
    if ((v22 & 0x180) == 0) {
      uint64_t v23 = (void *)MEMORY[0x263F5C318];
    }
    MEMORY[0x223C3D2A0](*v23, 0);
  }
  uint64_t v24 = (void (**)(void, void))[a1[5] hoistCompletionHandler];
  if (v24)
  {
    uint64_t v25 = objc_msgSend(MEMORY[0x263F5BD98], "responseWithResult:biometricMatch:credential:", v13, objc_msgSend(a1[5], "biometricMatch"), v11);
    ((void (**)(void, void *))v24)[2](v24, v25);
  }
}

- (void)evaluateRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PKAuthenticatorEvaluationContext alloc] initWithRequest:v6 completionHandler:v7 forAuthenticator:self];
  if (![(PKAuthenticatorEvaluationContext *)v8 isInvalidated])
  {
    id v9 = [(PKAuthenticator *)self _swapContext:v8];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__PKAuthenticator_evaluateRequest_withCompletion___block_invoke;
    v10[3] = &unk_2644F9468;
    objc_copyWeak(&v12, &location);
    id v11 = v8;
    [(PKAuthenticator *)self _handleInstructionsForRequest:v6 withContext:v11 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__PKAuthenticator_evaluateRequest_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  id v8 = WeakRetained;
  if (WeakRetained && a2)
  {
    [WeakRetained _evaluateEvaluationContext:v5];
  }
  else
  {
    [v5 invalidate];
    id v6 = (void (**)(void, void))[*(id *)(a1 + 32) hoistCompletionHandler];
    if (v6)
    {
      id v7 = [MEMORY[0x263F5BD98] responseWithResult:5];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
  }
}

- (void)fallbackToSystemPasscodeUI
{
  id v2 = [(PKAuthenticator *)self _context];
  [v2 fallbackToPasscode];
}

- (void)cancelEvaluation
{
}

- (void)cancelEvaluationWithOptions:(unint64_t)a3
{
  id v3 = [(PKAuthenticator *)self _swapContext:0 withOptions:a3];
}

- (void)restartEvaluation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  if (context)
  {
    id v7 = [(PKAuthenticatorEvaluationContext *)context request];
    id v5 = [(PKAuthenticatorEvaluationContext *)self->_context hoistCompletionHandler];
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      if ([v7 useLegacyAuthenticator])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector()) {
          [WeakRetained authenticatorWillRestartEvaluation:self];
        }
      }
      [(PKAuthenticator *)self evaluateRequest:v7 withCompletion:v5];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v7 = 0;
    id v5 = 0;
  }
}

- (void)accessExternalizedContextWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAuthenticator *)self _context];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__PKAuthenticator_accessExternalizedContextWithCompletion___block_invoke;
  v7[3] = &unk_2644F9490;
  id v8 = v4;
  id v6 = v4;
  [v5 accessLAContext:v7];
}

void __59__PKAuthenticator_accessExternalizedContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 externalizedContext];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);

  [(PKAuthenticator *)self cancelEvaluation];
}

- (unint64_t)authenticationIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t authenticationIdentifier = self->_authenticationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return authenticationIdentifier;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_delegate, obj);
  if (self->_invalidated) {
    context = 0;
  }
  else {
    context = self->_context;
  }
  id v6 = context;
  os_unfair_lock_unlock(p_lock);
  [(PKAuthenticatorEvaluationContext *)v6 setDelegate:obj];
}

- (int64_t)evaluationState
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  int64_t v3 = [v2 evaluationState];

  return v3;
}

- (int64_t)coachingState
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  int64_t v3 = [v2 coachingState];

  return v3;
}

- (BOOL)fingerPresent
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  char v3 = [v2 fingerPresent];

  return v3;
}

- (BOOL)passcodeActive
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  char v3 = [v2 passcodeActive];

  return v3;
}

- (BOOL)passphraseActive
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  char v3 = [v2 passphraseActive];

  return v3;
}

- (BOOL)passcodeWasPresented
{
  uint64_t v2 = [(PKAuthenticator *)self _context];
  __int16 v3 = [v2 presentationFlags];

  return (v3 & 0x180) != 0;
}

- (BOOL)_delegateSupportsPasscodePresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPassphrasePresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (PKAuthenticatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAuthenticatorDelegate *)WeakRetained;
}

- (NSDictionary)clientAnalyticsParameters
{
  return self->_clientAnalyticsParameters;
}

- (void)setClientAnalyticsParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAnalyticsParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

@end