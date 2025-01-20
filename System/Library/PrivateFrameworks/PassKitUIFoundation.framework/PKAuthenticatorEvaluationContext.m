@interface PKAuthenticatorEvaluationContext
- (BOOL)_delegateSupportsPasscodeDismissal;
- (BOOL)_delegateSupportsPasscodePresentation;
- (BOOL)_delegateSupportsPassphraseDismissal;
- (BOOL)_delegateSupportsPassphrasePresentation;
- (BOOL)_presentPasscodeIfNecessary;
- (BOOL)biometricMatch;
- (BOOL)fingerPresent;
- (BOOL)forceApplePayCheck;
- (BOOL)forceSkipUserIntent;
- (BOOL)isInvalidated;
- (BOOL)isPolicySupported;
- (BOOL)isSupported;
- (BOOL)passcodeActive;
- (BOOL)passphraseActive;
- (BOOL)updateCompletedMechanismsForPushButtonEventParams:(id)a3;
- (PKAuthenticatorDelegate)delegate;
- (PKAuthenticatorEvaluationContext)init;
- (PKAuthenticatorEvaluationContext)initWithRequest:(id)a3 completionHandler:(id)a4 forAuthenticator:(id)a5;
- (PKAuthenticatorEvaluationRequest)request;
- (id)hoistCompletionHandler;
- (int64_t)coachingState;
- (int64_t)evaluationState;
- (int64_t)policy;
- (unint64_t)presentationFlags;
- (void)_clearFingerOnTimer;
- (void)_clearLiftFingerTimer;
- (void)_createContextWithExternalizedContext:(id)a3;
- (void)_dismissAuthenticatorViewOfType:(int64_t)a3;
- (void)_handleLiftFinger;
- (void)_presentAuthenticatorViewOfType:(int64_t)a3 withParams:(id)a4;
- (void)_requestRemoteAuthenticatorViewControllerOfType:(int64_t)a3 withClassName:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)_setCoachingState:(int64_t)a3;
- (void)_setEvaluationStateWithEvent:(id)a3;
- (void)_setFingerOnTimer;
- (void)_setLiftFingerTimer;
- (void)_updateActiveState:(BOOL)a3 forEvent:(int64_t)a4 withParameters:(id)a5;
- (void)_updateCoachingState;
- (void)_updateEvaluationState;
- (void)accessLAContext:(id)a3;
- (void)dealloc;
- (void)evaluateWithOptions:(id)a3 completion:(id)a4;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)fallbackToPasscode;
- (void)handlePasscodeEventWithParameters:(id)a3;
- (void)handlePearlEventWithParameters:(id)a3;
- (void)handlePushButtonEventWithParameters:(id)a3;
- (void)handlePushButtonSecondaryEventWithParameters:(id)a3;
- (void)handleTouchIDEventWithParameters:(id)a3;
- (void)invalidate;
- (void)invalidateWithIntent:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 resetPriorDelegate:(BOOL)a4;
@end

@implementation PKAuthenticatorEvaluationContext

- (PKAuthenticatorEvaluationContext)init
{
  return [(PKAuthenticatorEvaluationContext *)self initWithRequest:0 completionHandler:0 forAuthenticator:0];
}

- (PKAuthenticatorEvaluationContext)initWithRequest:(id)a3 completionHandler:(id)a4 forAuthenticator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v56.receiver = self;
  v56.super_class = (Class)PKAuthenticatorEvaluationContext;
  v12 = [(PKAuthenticatorEvaluationContext *)&v56 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_57;
  }
  objc_storeWeak((id *)&v12->_authenticator, v11);
  uint64_t v14 = [v9 policy];
  uint64_t v15 = _LAPolicyContainerForPKPolicy(v14);
  int v17 = v16;
  p_request = (id *)&v13->_request;
  objc_storeStrong((id *)&v13->_request, a3);
  uint64_t v19 = v17 & 0x100;
  if ((v17 & 0x10000) != 0)
  {
    BOOL v21 = 0;
  }
  else if ((v17 & 0x100) != 0)
  {
    BOOL v21 = 1;
  }
  else
  {
    uint64_t v20 = [v9 accessControlRef];
    uint64_t v19 = 0;
    BOOL v21 = v20 != 0;
  }
  v13->_supported = v21;
  if (v19) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = 0;
  }
  v13->_policySupported = v22;
  v13->_forceApplePayCheck = v17 & 1;
  v13->_forceSkipUserIntent = HIBYTE(v17) & 1;
  v13->_int64_t policy = v15;
  uint64_t v23 = [v10 copy];
  id completionHandler = v13->_completionHandler;
  v13->_id completionHandler = (id)v23;

  v13->_presentationFlags = 0;
  v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  accessHandlers = v13->_accessHandlers;
  v13->_accessHandlers = v25;

  v13->_externalContextInvalidationPolicy = 0;
  v13->_externalContextOptions = 0;
  p_externalContextInvalidationPolicy = &v13->_externalContextInvalidationPolicy;
  if ([(PKAuthenticatorEvaluationRequest *)v13->_request useLegacyAuthenticator])
  {
    int v28 = 0;
    char v29 = 0;
  }
  else
  {
    int v28 = [v9 hasInitialAuthenticatorState];
    char v29 = [v9 initialAuthenticatorState];
  }
  int IsAvailable = PKUserIntentIsAvailable();
  BOOL v31 = 0;
  if (v14 != 1 && IsAvailable) {
    BOOL v31 = !v13->_forceSkipUserIntent;
  }
  v13->_BOOL acquireUserIntent = v31;
  int v32 = PKUserIntentIsAvailable();
  BOOL acquireUserIntent = v13->_acquireUserIntent;
  if (v32) {
    BOOL v35 = v14 == 8 && acquireUserIntent;
  }
  else {
    BOOL v35 = 0;
  }
  v13->_acquireSecondaryUserIntent = v35;
  if (acquireUserIntent)
  {
    int v36 = [*p_request assumeUserIntentAvailable];
    int v37 = v36;
    if (v14 == 8 || (v36 & 1) != 0 || (PKPearlIsAvailable() & 1) != 0)
    {
      if (!v37) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if ((v29 & 6) != 0) {
      char v39 = 0;
    }
    else {
      char v39 = v28;
    }
    if ((v39 & 1) == 0) {
LABEL_29:
    }
      v13->_completedMechanisms |= 0x10uLL;
  }
LABEL_30:
  if ([*p_request assumeBiometricOrPasscodeAvailable]) {
    v13->_completedMechanisms |= 1uLL;
  }
  v13->_coachingStatus = 1;
  if ([(PKAuthenticatorEvaluationRequest *)v13->_request useLegacyAuthenticator]) {
    goto LABEL_47;
  }
  v13->_coachingState = 0;
  if (v13->_acquireUserIntent)
  {
    uint64_t v38 = 3;
    if ((v13->_completedMechanisms & 0x10) != 0) {
      uint64_t v38 = 0;
    }
    if ((v28 & (v13->_completedMechanisms >> 4) & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (!v28)
  {
    uint64_t v38 = 0;
    goto LABEL_46;
  }
  uint64_t v38 = 4 * ((v29 & 6) == 0);
LABEL_46:
  v13->_evaluationState = v38;
LABEL_47:
  uint64_t v40 = [v9 externalizedContext];
  if (v40)
  {
    v41 = (void *)v40;
    unint64_t *p_externalContextInvalidationPolicy = 2;
LABEL_56:
    objc_initWeak(&location, v13);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_3;
    block[3] = &unk_2644F9040;
    objc_copyWeak(&v51, &location);
    id v50 = v41;
    id v47 = v41;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

    goto LABEL_57;
  }
  int v42 = PKUserIntentIsAvailable();
  int64_t policy = v13->_policy;
  if (v42)
  {
    if (policy == 1004)
    {
      unint64_t *p_externalContextInvalidationPolicy = 1;
      v44 = +[PKAuthenticatorSharedRootContext sharedInstance];
      v41 = [v44 externalizedContext];

      goto LABEL_56;
    }
LABEL_55:
    v41 = 0;
    goto LABEL_56;
  }
  if (policy != 1004 || !PKRunningInViewService()) {
    goto LABEL_55;
  }
  v13->_externalContextOptions |= 1uLL;
  objc_initWeak(&location, v13);
  id v45 = objc_alloc_init(MEMORY[0x263F79358]);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke;
  v52[3] = &unk_2644F90B8;
  objc_copyWeak(&v54, &location);
  id v46 = v45;
  id v53 = v46;
  [v46 fetchUnlockCredentialSetWithCompletion:v52];

  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
LABEL_57:

  return v13;
}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_2;
  v8 = &unk_2644F9040;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v4 = v3;
  id v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], &v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v5, v6, v7, v8);

  objc_destroyWeak(&v10);
}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createContextWithExternalizedContext:*(void *)(a1 + 32)];
}

void __87__PKAuthenticatorEvaluationContext_initWithRequest_completionHandler_forAuthenticator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createContextWithExternalizedContext:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(PKAuthenticatorEvaluationContext *)self invalidate];
  id v4 = [(PKAuthenticatorEvaluationContext *)self hoistCompletionHandler];
  uint64_t v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__PKAuthenticatorEvaluationContext_dealloc__block_invoke;
    block[3] = &unk_2644F8C80;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKAuthenticatorEvaluationContext;
  [(PKAuthenticatorEvaluationContext *)&v6 dealloc];
}

void __43__PKAuthenticatorEvaluationContext_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F5BD98] responseWithResult:2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)hoistCompletionHandler
{
  id v3 = (void *)MEMORY[0x223C3D8D0](self->_completionHandler, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  uint64_t v5 = (void *)MEMORY[0x223C3D8D0](v3);
  return v5;
}

- (void)invalidate
{
}

- (void)invalidateWithIntent:(int64_t)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
    [(PKAuthenticatorEvaluationContext *)self _clearFingerOnTimer];
  }
  [(PKAuthenticatorEvaluationContext *)self _clearLiftFingerTimer];
  [(PKAuthenticatorEvaluationContext *)self _dismissAuthenticatorViewOfType:0];
  [(PKAuthenticatorEvaluationContext *)self _dismissAuthenticatorViewOfType:1];
  [(PKAuthenticatorEvaluationContext *)self setDelegate:0];
  objc_storeWeak((id *)&self->_authenticator, 0);
  uint64_t v5 = self->_LAContext;
  LAContext = self->_LAContext;
  self->_LAContext = 0;

  if (v5)
  {
    if (self->_usingExternalContext)
    {
      if (a3 == 1 && self->_externalContextInvalidationPolicy == 2) {
        self->_unint64_t externalContextInvalidationPolicy = 0;
      }
      *(void *)&long long v56 = 0;
      *((void *)&v56 + 1) = &v56;
      uint64_t v57 = 0x2020000000;
      uint64_t v58 = 0;
      v7 = [MEMORY[0x263F1C408] sharedApplication];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke;
      v52[3] = &unk_2644F90E0;
      void v52[4] = &v56;
      uint64_t v8 = [v7 beginBackgroundTaskWithExpirationHandler:v52];

      *(void *)(*((void *)&v56 + 1) + 24) = v8;
      char v9 = self->_externalContextOptions & 1;
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_2;
      v48[3] = &unk_2644F9108;
      char v51 = v9;
      BOOL v31 = v5;
      v49 = v31;
      id v50 = &v56;
      char v29 = (void (**)(void))MEMORY[0x223C3D8D0](v48);
      unint64_t externalContextInvalidationPolicy = self->_externalContextInvalidationPolicy;
      if (externalContextInvalidationPolicy == 2)
      {
        v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v55 = v31;
          _os_log_impl(&dword_21EEBD000, v24, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Invalidating and not resetting external context.", buf, 0xCu);
        }

        v29[2]();
      }
      else
      {
        if (externalContextInvalidationPolicy == 1)
        {
          id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v11 addObject:&unk_26D086890];
          [v11 addObject:&unk_26D0868A8];
          if (PKPearlIsAvailable()) {
            v12 = &unk_26D0868C0;
          }
          else {
            v12 = &unk_26D0868D8;
          }
          [v11 addObject:v12];
          v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v55 = v31;
            _os_log_impl(&dword_21EEBD000, v13, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Attempting to partially reset external context due to invalidation.", buf, 0xCu);
          }

          uint64_t v14 = dispatch_group_create();
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v15 = (LAContext *)v11;
          uint64_t v16 = [(LAContext *)v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
          obj = v15;
          if (v16)
          {
            uint64_t v17 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v45 != v17) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                dispatch_group_enter(v14);
                uint64_t v20 = [v19 integerValue];
                v40[0] = MEMORY[0x263EF8330];
                v40[1] = 3221225472;
                v40[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_168;
                v40[3] = &unk_2644F9130;
                BOOL v21 = v31;
                v41 = v21;
                int v42 = v19;
                v43 = v14;
                [(LAContext *)v21 resetProcessedEvent:v20 reply:v40];
              }
              uint64_t v15 = obj;
              uint64_t v16 = [(LAContext *)obj countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v16);
          }

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_169;
          block[3] = &unk_2644F8D20;
          uint64_t v38 = v31;
          char v39 = v29;
          dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);

          BOOL v22 = obj;
        }
        else
        {
          v25 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v55 = v31;
            _os_log_impl(&dword_21EEBD000, v25, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Attempting to reset external context due to invalidation.", buf, 0xCu);
          }

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_170;
          v34[3] = &unk_2644F9090;
          BOOL v35 = v31;
          int v36 = v29;
          [(LAContext *)v35 resetWithReply:v34];

          BOOL v22 = v35;
        }
      }
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      uint64_t v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v56) = 134349056;
        *(void *)((char *)&v56 + 4) = v5;
        _os_log_impl(&dword_21EEBD000, v23, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): Invalidating context.", (uint8_t *)&v56, 0xCu);
      }

      [(LAContext *)v5 invalidate];
    }
  }
  self->_invalidated = 1;
  self->_usingExternalContext = 0;
  banner = self->_banner;
  if (banner)
  {
    [(PKBannerHandle *)banner invalidate];
    v27 = self->_banner;
    self->_banner = 0;
  }
  int v28 = (void *)[(NSMutableArray *)self->_accessHandlers copy];
  [(NSMutableArray *)self->_accessHandlers removeAllObjects];
  if ([v28 count])
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_171;
    v32[3] = &unk_2644F8CF8;
    id v33 = v28;
    dispatch_async(MEMORY[0x263EF83A0], v32);
  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48)) {
    atomic_store(0, EvaluatingWithSingletonExternalContext);
  }
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134349056;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21EEBD000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): Invalidating context.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *MEMORY[0x263F1D108];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *MEMORY[0x263F1D108])
  {
    uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
    [v5 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_168(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 134218498;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Failed partial reset of external context for event %@ - %@.", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_169(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21EEBD000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Finished attempting partial reset of external context.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_170(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || !a2)
  {
    if (v7)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 134218242;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v5;
      int v9 = "PKAuthenticator (%p): Could not reset external context - %@.";
      uint64_t v10 = v6;
      uint32_t v11 = 22;
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v16 = 134217984;
    uint64_t v17 = v8;
    int v9 = "PKAuthenticator (%p): reset external context.";
    uint64_t v10 = v6;
    uint32_t v11 = 12;
LABEL_7:
    _os_log_impl(&dword_21EEBD000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v13, v14, v15);
}

void __57__PKAuthenticatorEvaluationContext_invalidateWithIntent___block_invoke_171(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)fallbackToPasscode
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke;
  v2[3] = &unk_2644F9180;
  v2[4] = self;
  [(PKAuthenticatorEvaluationContext *)self accessLAContext:v2];
}

void __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  if (([*(id *)(a1 + 32) _presentPasscodeIfNecessary] & 1) == 0)
  {
    if (PKPearlIsAvailable()) {
      uint64_t v4 = 7;
    }
    else {
      uint64_t v4 = 1;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke_2;
    v5[3] = &unk_2644F9158;
    id v6 = v3;
    [v6 failProcessedEvent:v4 failureError:0 reply:v5];
  }
}

void __54__PKAuthenticatorEvaluationContext_fallbackToPasscode__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134218242;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%p): Passcode Fallback Failed - %@.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)_presentPasscodeIfNecessary
{
  if (!self->_passcodePresentationParameters
    || (self->_activeMechanisms & 1) == 0
    || ![(PKAuthenticatorEvaluationRequest *)self->_request passcodeOnly]
    && !self->_passcodePresentationRequested
    && !self->_automaticallyPresentPasscodeOnce
    && (self->_activeMechanisms & 0xC) == 0)
  {
    return 0;
  }
  *(_WORD *)&self->_passcodePresentationRequested = 0;
  passcodePresentationParameters = self->_passcodePresentationParameters;
  self->_passcodePresentationParameters = 0;
  id v5 = passcodePresentationParameters;

  [(PKAuthenticatorEvaluationContext *)self _presentAuthenticatorViewOfType:0 withParams:v5];
  return 1;
}

- (void)_createContextWithExternalizedContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!self->_invalidated)
  {
    if (v4 && (self->_externalContextOptions & 1) != 0)
    {
      char v13 = 0;
      int v6 = 1;
      atomic_compare_exchange_strong((atomic_uchar *volatile)EvaluatingWithSingletonExternalContext, (unsigned __int8 *)&v13, 1u);
      if (v13)
      {
        uint64_t v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21EEBD000, v14, OS_LOG_TYPE_DEFAULT, "PKAuthenticator: ignoring external context because singleton context is outstanding.", buf, 2u);
        }

        int v6 = 0;
        id v5 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    if (self->_supported)
    {
      if (!v5)
      {
        uint64_t v15 = (LAContext *)objc_alloc_init(MEMORY[0x263F10468]);
        LAContext = self->_LAContext;
        self->_LAContext = v15;

        uint64_t v9 = self->_LAContext;
        if (v9) {
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      uint64_t v7 = (LAContext *)[objc_alloc(MEMORY[0x263F10468]) initWithExternalizedContext:v5];
      int v8 = self->_LAContext;
      self->_LAContext = v7;
    }
    uint64_t v9 = self->_LAContext;
    if (v9)
    {
      if (v5)
      {
        __int16 v10 = PKLogFacilityTypeGetObject();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v6)
        {
          if (v11)
          {
            *(_DWORD *)buf = 134349056;
            int v32 = v9;
            uint64_t v12 = "PKAuthenticator (%{public}p): creating evaluation with external context and singleton semantics.";
LABEL_29:
            _os_log_impl(&dword_21EEBD000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
          }
        }
        else if (v11)
        {
          *(_DWORD *)buf = 134349056;
          int v32 = v9;
          uint64_t v12 = "PKAuthenticator (%{public}p): creating evaluation with external context.";
          goto LABEL_29;
        }
        BOOL v17 = 1;
LABEL_31:

        if (![(PKAuthenticatorEvaluationRequest *)self->_request useStockAuthInterface]) {
          [self->_LAContext setUiDelegate:self];
        }
        self->_usingExternalContext = v17;
        BOOL v21 = (void *)[(NSMutableArray *)self->_accessHandlers copy];
        [(NSMutableArray *)self->_accessHandlers removeAllObjects];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v20 = v21;
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v27 != v24) {
                objc_enumerationMutation(v20);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v26 + 1) + 8 * i));
            }
            uint64_t v23 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v23);
        }
        id v19 = (void (**)(id, id))v20;
        goto LABEL_41;
      }
LABEL_18:
      __int16 v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        int v32 = v9;
        _os_log_impl(&dword_21EEBD000, v10, OS_LOG_TYPE_DEFAULT, "PKAuthenticator (%{public}p): creating evaluation.", buf, 0xCu);
      }
      BOOL v17 = 0;
      goto LABEL_31;
    }
LABEL_21:
    __int16 v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EEBD000, v18, OS_LOG_TYPE_DEFAULT, "PKAuthenticator: failed to create LAContext.", buf, 2u);
    }

    if (v6) {
      atomic_store(0, EvaluatingWithSingletonExternalContext);
    }
    [(PKAuthenticatorEvaluationContext *)self invalidate];
    id v19 = [(PKAuthenticatorEvaluationContext *)self hoistCompletionHandler];
    if (!v19) {
      goto LABEL_42;
    }
    id v20 = [MEMORY[0x263F5BD98] responseWithResult:5];
    v19[2](v19, v20);
LABEL_41:

LABEL_42:
  }
}

- (void)accessLAContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    if (self->_invalidated)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    else
    {
      LAContext = self->_LAContext;
      if (LAContext)
      {
        (*((void (**)(id, LAContext *))v4 + 2))(v4, LAContext);
      }
      else
      {
        accessHandlers = self->_accessHandlers;
        uint64_t v7 = (void *)[v4 copy];
        int v8 = (void *)MEMORY[0x223C3D8D0]();
        [(NSMutableArray *)accessHandlers addObject:v8];
      }
    }
    id v4 = v9;
  }
}

- (void)evaluateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke;
  v10[3] = &unk_2644F9220;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v11 = v9;
  [(PKAuthenticatorEvaluationContext *)self accessLAContext:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!v3 || !WeakRetained)
  {
    if (*(void *)(a1 + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_5;
      block[3] = &unk_2644F8C80;
      id v10 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    goto LABEL_10;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_2;
  v11[3] = &unk_2644F91F8;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v12 = *(id *)(a1 + 40);
  uint64_t v6 = MEMORY[0x223C3D8D0](v11);
  char v7 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)v5 + 66, (unsigned __int8 *)&v7, 1u);
  if (!v7)
  {
    id v8 = (void *)v6;
    if ([*((id *)v5 + 22) accessControlRef]) {
      objc_msgSend(v3, "evaluateAccessControl:operation:options:reply:", objc_msgSend(*((id *)v5 + 22), "accessControlRef"), 3, *(void *)(a1 + 32), v8);
    }
    else {
      [v3 evaluatePolicy:*((void *)v5 + 23) options:*(void *)(a1 + 32) reply:v8];
    }

    objc_destroyWeak(&v13);
LABEL_10:

    return;
  }
  __break(1u);
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_3;
  v10[3] = &unk_2644F91D0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v14);
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_3(id *a1)
{
  uint64_t v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_4;
    v5[3] = &unk_2644F91A8;
    objc_copyWeak(&v9, v2);
    id v8 = a1[6];
    id v6 = a1[4];
    id v7 = a1[5];
    [WeakRetained accessLAContext:v5];

    objc_destroyWeak(&v9);
  }
  else
  {
    id v4 = a1[6];
    if (v4) {
      (*((void (**)(id, void, void, void, void))v4 + 2))(v4, 0, 0, 0, 0);
    }
  }
}

void __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = (atomic_uchar *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = 1;
    atomic_compare_exchange_strong(WeakRetained + 66, (unsigned __int8 *)&v5, 0);
    if (v5 != 1)
    {
      __break(1u);
      return;
    }
    id v6 = (void *)*((void *)WeakRetained + 12);
    if (v6)
    {
      [v6 invalidate];
      id v7 = (void *)*((void *)v4 + 12);
      *((void *)v4 + 12) = 0;
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      BOOL v9 = v4[168] != 0;
LABEL_9:
      uint64_t v10 = 0;
      if (v16) {
        BOOL v11 = *(void *)(a1 + 32) == 0;
      }
      else {
        BOOL v11 = 0;
      }
      int v12 = v11;
      int v13 = v12 & !v9;
      if (v13) {
        id v14 = v16;
      }
      else {
        id v14 = 0;
      }
      if (v13) {
        uint64_t v10 = *(void *)(a1 + 40);
      }
      if (v9) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = *(void *)(a1 + 32);
      }
      (*(void (**)(uint64_t, void, id, uint64_t, uint64_t))(v8 + 16))(v8, v13 & 1, v14, v10, v15);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
  }
}

uint64_t __67__PKAuthenticatorEvaluationContext_evaluateWithOptions_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_dismissAuthenticatorViewOfType:(int64_t)a3
{
  uint64_t v3 = 4 * (a3 == 1);
  if (!a3) {
    uint64_t v3 = 2;
  }
  uint64_t v4 = 16 * (a3 == 1);
  if (!a3) {
    uint64_t v4 = 8;
  }
  unint64_t v5 = (unint64_t)(a3 == 1) << 6;
  if (!a3) {
    unint64_t v5 = 32;
  }
  unint64_t presentationFlags = self->_presentationFlags;
  if ((presentationFlags & v3) != 0)
  {
    self->_unint64_t presentationFlags = presentationFlags | v5;
    if ((presentationFlags & v4) == 0)
    {
      self->_unint64_t presentationFlags = presentationFlags & ~(v3 | v4 | v5);
      uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v10 = WeakRetained;
      if (a3 == 1)
      {
        BOOL v11 = (void *)WeakRetained;
        uint64_t WeakRetained = [(PKAuthenticatorEvaluationContext *)self _delegateSupportsPassphraseDismissal];
        uint64_t v10 = (uint64_t)v11;
        if (WeakRetained)
        {
          uint64_t WeakRetained = [v11 dismissPassphraseViewController];
          goto LABEL_16;
        }
      }
      else if (!a3)
      {
        BOOL v11 = (void *)WeakRetained;
        uint64_t WeakRetained = [(PKAuthenticatorEvaluationContext *)self _delegateSupportsPasscodeDismissal];
        uint64_t v10 = (uint64_t)v11;
        if (WeakRetained)
        {
          uint64_t WeakRetained = [v11 dismissPasscodeViewController];
LABEL_16:
          uint64_t v10 = (uint64_t)v11;
        }
      }
      MEMORY[0x270F9A758](WeakRetained, v10);
    }
  }
}

- (void)_presentAuthenticatorViewOfType:(int64_t)a3 withParams:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    BOOL v7 = [(PKAuthenticatorEvaluationContext *)self _delegateSupportsPassphrasePresentation];
  }
  else if (a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(PKAuthenticatorEvaluationContext *)self _delegateSupportsPasscodePresentation];
  }
  if (a3) {
    uint64_t v8 = 4 * (a3 == 1);
  }
  else {
    uint64_t v8 = 2;
  }
  if (a3) {
    uint64_t v9 = 16 * (a3 == 1);
  }
  else {
    uint64_t v9 = 8;
  }
  if (a3) {
    unint64_t v10 = (unint64_t)(a3 == 1) << 6;
  }
  else {
    unint64_t v10 = 32;
  }
  if (v7)
  {
    self->_presentationFlags |= v9 | v8;
    banner = self->_banner;
    if (banner)
    {
      [(PKBannerHandle *)banner invalidate];
      int v12 = self->_banner;
      self->_banner = 0;
    }
    int v13 = [v6 objectForKey:&unk_26D0868F0];
    id v14 = [v6 objectForKey:&unk_26D086908];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke;
    v16[3] = &unk_2644F92B8;
    v16[4] = self;
    v16[5] = a3;
    v16[6] = v9;
    v16[7] = v8;
    v16[8] = v10;
    [(PKAuthenticatorEvaluationContext *)self _requestRemoteAuthenticatorViewControllerOfType:a3 withClassName:v13 bundleIdentifier:v14 completion:v16];
  }
  else
  {
    unint64_t v15 = (unint64_t)(a3 == 1) << 10;
    if (!a3) {
      unint64_t v15 = 256;
    }
    self->_presentationFlags |= v15;
  }
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    unint64_t v5 = (unint64_t)(v4 == 1) << 9;
  }
  else {
    unint64_t v5 = 128;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2;
  v27[3] = &unk_2644F9248;
  uint64_t v7 = *(void *)(a1 + 40);
  v27[4] = *(void *)(a1 + 32);
  long long v28 = *(_OWORD *)(a1 + 48);
  uint64_t v29 = *(void *)(a1 + 64);
  unint64_t v30 = v5;
  uint64_t v31 = v7;
  uint64_t v8 = MEMORY[0x223C3D8D0](v27);
  uint64_t v9 = (void *)v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if ((*(void *)(a1 + 64) & *(void *)(v10 + 208)) != 0 || !v3)
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  else
  {
    objc_initWeak(&location, *(id *)(v10 + 144));
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11 == 1)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_183;
      v22[3] = &unk_2644F9290;
      objc_copyWeak(&v23, &location);
      [WeakRetained presentPassphraseViewController:v3 completionHandler:v9 reply:v22];
      objc_destroyWeak(&v23);
    }
    else if (!v11)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      int v13 = [v12 clientAnalyticsParameters];

      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v14 setObject:*MEMORY[0x263F5C398] forKeyedSubscript:*MEMORY[0x263F5C378]];
      unint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F5C468]];

      id v16 = (void *)MEMORY[0x263F5BD40];
      id v17 = v13;
      __int16 v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5C778]];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v20 = (void *)*MEMORY[0x263F5C4B0];
      if (isKindOfClass) {
        id v20 = v18;
      }
      id v21 = v20;

      [v16 subject:v21 sendEvent:v14];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_3;
      v24[3] = &unk_2644F9290;
      objc_copyWeak(&v25, &location);
      [WeakRetained presentPasscodeViewController:v3 completionHandler:v9 reply:v24];
      objc_destroyWeak(&v25);
    }
    objc_destroyWeak(&location);
  }
}

uint64_t __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2(uint64_t result, char a2)
{
  *(void *)(*(void *)(result + 32) + 208) &= ~*(void *)(result + 40);
  if (a2)
  {
    *(void *)(*(void *)(result + 32) + 208) |= *(void *)(result + 64);
    if ((*(void *)(result + 56) & *(void *)(*(void *)(result + 32) + 208)) != 0) {
      return [*(id *)(result + 32) _dismissAuthenticatorViewOfType:*(void *)(result + 72)];
    }
  }
  else
  {
    *(void *)(*(void *)(result + 32) + 208) &= ~(*(void *)(result + 56) | *(void *)(result + 48));
  }
  return result;
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCredential:v3 forProcessedEvent:2 credentialType:-1 reply:&__block_literal_global_182];
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_21EEBD000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set credential for passcode event: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_183(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCredential:v3 forProcessedEvent:3 credentialType:-2 reply:&__block_literal_global_186];
}

void __79__PKAuthenticatorEvaluationContext__presentAuthenticatorViewOfType_withParams___block_invoke_2_184(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_21EEBD000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set credential for passphrase event: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_requestRemoteAuthenticatorViewControllerOfType:(int64_t)a3 withClassName:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t))a6;
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (a3 == 1)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v14 = [WeakRetained passphraseViewController];
    }
    else
    {
      if (a3 || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v14 = [WeakRetained passcodeViewController];
    }
    unint64_t v15 = (void *)v14;
    if (v14)
    {
      v12[2](v12, v14);

LABEL_16:
      goto LABEL_17;
    }
LABEL_10:
    if (v10 && v11)
    {
      id v16 = (void *)MEMORY[0x263F1CD10];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __126__PKAuthenticatorEvaluationContext__requestRemoteAuthenticatorViewControllerOfType_withClassName_bundleIdentifier_completion___block_invoke;
      v19[3] = &unk_2644F92E0;
      int64_t v21 = a3;
      id v20 = v12;
      id v17 = (id)[v16 requestViewController:v10 fromServiceWithBundleIdentifier:v11 connectionHandler:v19];
    }
    else
    {
      __int16 v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v23 = a3;
        _os_log_impl(&dword_21EEBD000, v18, OS_LOG_TYPE_DEFAULT, "Failed to Remote Authenticator VC of Type:%ld", buf, 0xCu);
      }

      v12[2](v12, 0);
    }
    goto LABEL_16;
  }
LABEL_17:
}

void __126__PKAuthenticatorEvaluationContext__requestRemoteAuthenticatorViewControllerOfType_withClassName_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 134218242;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      int v13 = v7;
      _os_log_impl(&dword_21EEBD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to present Remote Authenticator VC of Type:%ld withError: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handlePasscodeEventWithParameters:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:&unk_26D086920];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = (void *)[v4 BOOLValue];
    id v5 = v6;
    if (v4)
    {
      self->_completedMechanisms |= 1uLL;
      if (self->_acquireSecondaryUserIntent)
      {
        [(PKAuthenticatorEvaluationContext *)self _dismissAuthenticatorViewOfType:0];
        id v4 = (void *)[(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
        id v5 = v6;
      }
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)handlePearlEventWithParameters:(id)a3
{
  v49[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_authenticator);
  id v7 = v6;
  if (WeakRetained && v6)
  {
    int64_t coachingStatus = self->_coachingStatus;
    uint64_t v9 = [v4 objectForKeyedSubscript:&unk_26D086938];
    int v10 = v9;
    if (v9) {
      self->_int64_t coachingStatus = [v9 integerValue];
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:&unk_26D086950];
    __int16 v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 integerValue];
      switch(v13)
      {
        case 0:
          self->_evaluationFlags |= 2uLL;
          [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
          id v31 = objc_loadWeakRetained((id *)&self->_authenticator);
          int v32 = [v31 clientAnalyticsParameters];

          id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v33 setObject:*MEMORY[0x263F5C3E8] forKeyedSubscript:*MEMORY[0x263F5C378]];
          [v33 setObject:*MEMORY[0x263F5C320] forKeyedSubscript:*MEMORY[0x263F5C448]];
          [v33 setObject:*MEMORY[0x263F5C390] forKeyedSubscript:*MEMORY[0x263F5C428]];
          long long v46 = v32;
          v34 = [v32 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
          [v33 setObject:v34 forKeyedSubscript:*MEMORY[0x263F5C468]];

          BOOL v35 = (void *)MEMORY[0x263F5BD40];
          uint64_t v36 = *MEMORY[0x263F5C4C8];
          v49[0] = *MEMORY[0x263F5C4A8];
          v49[1] = v36;
          int v37 = [v32 objectForKeyedSubscript:*MEMORY[0x263F5C778]];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          char v39 = (void *)*MEMORY[0x263F5C4B0];
          if (isKindOfClass) {
            char v39 = v37;
          }
          id v40 = v39;

          v49[2] = v40;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
          [v35 subjects:v41 sendEvent:v33];

          break;
        case 1:
          unint64_t v29 = self->_evaluationFlags & 0xFFFFFFFFFFFFFFFDLL;
          goto LABEL_25;
        case 2:
          self->_completedMechanisms |= 4uLL;
          banner = self->_banner;
          if (banner)
          {
            long long v28 = (void *)[MEMORY[0x263F5BE80] createForGlyphState:3];
            [(PKBannerHandle *)banner setState:v28];
          }
          goto LABEL_27;
        case 3:
        case 13:
          uint64_t v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21EEBD000, v14, OS_LOG_TYPE_DEFAULT, "Biometric Match Miss Event Encountered", buf, 2u);
          }

          self->_evaluationFlags |= 8uLL;
          if (v13 == 13)
          {
            id v15 = objc_loadWeakRetained((id *)&self->_authenticator);
            id v16 = [v15 clientAnalyticsParameters];

            id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [v17 setObject:*MEMORY[0x263F5C3E8] forKeyedSubscript:*MEMORY[0x263F5C378]];
            [v17 setObject:*MEMORY[0x263F5C320] forKeyedSubscript:*MEMORY[0x263F5C448]];
            [v17 setObject:*MEMORY[0x263F5C358] forKeyedSubscript:*MEMORY[0x263F5C360]];
            long long v45 = v16;
            __int16 v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
            [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C468]];

            id v19 = (void *)MEMORY[0x263F5BD40];
            uint64_t v20 = *MEMORY[0x263F5C4C8];
            v48[0] = *MEMORY[0x263F5C4A8];
            v48[1] = v20;
            int64_t v21 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C778]];
            objc_opt_class();
            char v22 = objc_opt_isKindOfClass();
            int64_t v23 = (void *)*MEMORY[0x263F5C4B0];
            if (v22) {
              int64_t v23 = v21;
            }
            id v24 = v23;

            v48[2] = v24;
            id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:3];
            [v19 subjects:v25 sendEvent:v17];

            uint64_t v26 = 2;
          }
          else
          {
            uint64_t v26 = 1;
          }
          unint64_t v30 = self;
          goto LABEL_31;
        case 4:
          self->_completedMechanisms &= ~4uLL;
          goto LABEL_27;
        case 10:
          unint64_t v29 = self->_evaluationFlags | 1;
LABEL_25:
          self->_unint64_t evaluationFlags = v29;
LABEL_27:
          [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
          break;
        case 11:
          self->_evaluationFlags &= ~1uLL;
          [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
          self->_int64_t coachingStatus = 1;
          break;
        case 12:
          unint64_t evaluationFlags = self->_evaluationFlags;
          v43 = [(PKAuthenticatorEvaluationRequest *)self->_request accessControlRef];
          unint64_t v44 = self->_evaluationFlags;
          self->_unint64_t evaluationFlags = v44 | 0x80;
          if (!v43 && evaluationFlags & 0x80 | v44 & 0x20)
          {
            [(PKAuthenticatorEvaluationContext *)self fallbackToPasscode];
          }
          else
          {
            self->_unint64_t evaluationFlags = v44 | 0x88;
            unint64_t v30 = self;
            uint64_t v26 = 3;
LABEL_31:
            -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](v30, "_setEvaluationStateWithEvent:", 0, v26);
          }
          break;
        default:
          break;
      }
    }
    else if (coachingStatus == self->_coachingStatus)
    {
      goto LABEL_33;
    }
    [(PKAuthenticatorEvaluationContext *)self _updateCoachingState];
LABEL_33:
  }
}

- (void)handleTouchIDEventWithParameters:(id)a3
{
  v36[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:&unk_26D086968];
  if ([v5 BOOLValue]) {
    self->_touchIDBeginTime = CFAbsoluteTimeGetCurrent();
  }
  id v6 = [v4 objectForKeyedSubscript:&unk_26D086980];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = objc_loadWeakRetained((id *)&self->_authenticator);
  if (v6)
  {
    uint64_t v9 = [v6 integerValue];
    switch(v9)
    {
      case 0:
        uint64_t v11 = PKLogFacilityTypeGetObject();
        PKTimeProfileBegin();

        self->_evaluationFlags |= 2uLL;
        if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
          [(PKAuthenticatorEvaluationContext *)self _setFingerOnTimer];
        }
        if ([(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator])
        {
          if (WeakRetained && v8 && (objc_opt_respondsToSelector() & 1) != 0) {
            [WeakRetained authenticatorDidEncounterFingerOn:v8];
          }
        }
        else
        {
          [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
        }
        id v27 = objc_loadWeakRetained((id *)&self->_authenticator);
        id v16 = [v27 clientAnalyticsParameters];

        id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v17 setObject:*MEMORY[0x263F5C3E8] forKeyedSubscript:*MEMORY[0x263F5C378]];
        [v17 setObject:*MEMORY[0x263F5C320] forKeyedSubscript:*MEMORY[0x263F5C448]];
        [v17 setObject:*MEMORY[0x263F5C3A8] forKeyedSubscript:*MEMORY[0x263F5C428]];
        long long v28 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
        [v17 setObject:v28 forKeyedSubscript:*MEMORY[0x263F5C468]];

        id v19 = (void *)MEMORY[0x263F5BD40];
        uint64_t v29 = *MEMORY[0x263F5C4C8];
        v36[0] = *MEMORY[0x263F5C4A8];
        v36[1] = v29;
        unint64_t v30 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C778]];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int v32 = (void *)*MEMORY[0x263F5C4B0];
        if (isKindOfClass) {
          int v32 = v30;
        }
        id v24 = v32;

        v36[2] = v24;
        id v25 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v26 = v36;
        goto LABEL_45;
      case 1:
        self->_evaluationFlags &= ~2uLL;
        if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
          [(PKAuthenticatorEvaluationContext *)self _clearFingerOnTimer];
        }
        [(PKAuthenticatorEvaluationContext *)self _clearLiftFingerTimer];
        if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
          goto LABEL_30;
        }
        if (WeakRetained && v8 && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained authenticatorDidEncounterFingerOff:v8];
        }
        break;
      case 2:
        self->_completedMechanisms |= 8uLL;
        __int16 v12 = PKLogFacilityTypeGetObject();
        id v13 = (id)PKTimeProfileEnd();

        [(PKAuthenticatorEvaluationContext *)self _clearLiftFingerTimer];
        if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
LABEL_30:
        }
          [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
        break;
      case 3:
      case 10:
        int v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_21EEBD000, v10, OS_LOG_TYPE_DEFAULT, "Biometric Match Miss Event Encountered", v34, 2u);
        }

        if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
          [(PKAuthenticatorEvaluationContext *)self _clearFingerOnTimer];
        }
        [(PKAuthenticatorEvaluationContext *)self _clearLiftFingerTimer];
        if ([(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator])
        {
          if (v9 != 10 && WeakRetained && v8)
          {
            if (objc_opt_respondsToSelector()) {
              [WeakRetained authenticatorDidEncounterMatchMiss:v8];
            }
            break;
          }
        }
        else
        {
          self->_evaluationFlags |= 8uLL;
          if (v9 == 10) {
            uint64_t v14 = 2;
          }
          else {
            uint64_t v14 = 1;
          }
          -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", 0, v14);
        }
        if (v9 == 10)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_authenticator);
          id v16 = [v15 clientAnalyticsParameters];

          id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v17 setObject:*MEMORY[0x263F5C3E8] forKeyedSubscript:*MEMORY[0x263F5C378]];
          [v17 setObject:*MEMORY[0x263F5C320] forKeyedSubscript:*MEMORY[0x263F5C448]];
          [v17 setObject:*MEMORY[0x263F5C368] forKeyedSubscript:*MEMORY[0x263F5C360]];
          __int16 v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
          [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C468]];

          id v19 = (void *)MEMORY[0x263F5BD40];
          uint64_t v20 = *MEMORY[0x263F5C4C8];
          v35[0] = *MEMORY[0x263F5C4A8];
          v35[1] = v20;
          int64_t v21 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5C778]];
          objc_opt_class();
          char v22 = objc_opt_isKindOfClass();
          int64_t v23 = (void *)*MEMORY[0x263F5C4B0];
          if (v22) {
            int64_t v23 = v21;
          }
          id v24 = v23;

          v35[2] = v24;
          id v25 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v26 = v35;
LABEL_45:
          id v33 = [v25 arrayWithObjects:v26 count:3];
          [v19 subjects:v33 sendEvent:v17];
        }
        break;
      case 4:
        if ((self->_evaluationFlags & 2) != 0) {
          [(PKAuthenticatorEvaluationContext *)self _setLiftFingerTimer];
        }
        break;
      default:
        break;
    }
  }
}

- (void)handlePushButtonEventWithParameters:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(PKAuthenticatorEvaluationContext *)self updateCompletedMechanismsForPushButtonEventParams:v4];
  id v6 = [v4 objectForKeyedSubscript:&unk_26D086998];

  if (v6)
  {
    unsigned int v7 = [v6 BOOLValue];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticator);
      uint64_t v9 = [WeakRetained clientAnalyticsParameters];

      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v10 setObject:*MEMORY[0x263F5C3C8] forKeyedSubscript:*MEMORY[0x263F5C378]];
      [v10 setObject:*MEMORY[0x263F5C330] forKeyedSubscript:*MEMORY[0x263F5C330]];
      uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5C768]];
      [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F5C448]];

      __int16 v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5C770]];
      [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F5C468]];

      id v13 = (void *)MEMORY[0x263F5BD40];
      uint64_t v14 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x263F5C778], *MEMORY[0x263F5C4A8], *MEMORY[0x263F5C4C8]);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v16 = (void *)*MEMORY[0x263F5C4B0];
      if (isKindOfClass) {
        id v16 = v14;
      }
      id v17 = v16;

      v21[2] = v17;
      __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
      [v13 subjects:v18 sendEvent:v10];

      self->_completedMechanisms |= 0x10uLL;
      unint64_t evaluationFlags = self->_evaluationFlags;
      self->_unint64_t evaluationFlags = evaluationFlags | 0x40;
      if ((evaluationFlags & 0x20) != 0)
      {
        self->_automaticallyPresentPasscodeOnce = 1;
        [(PKAuthenticatorEvaluationContext *)self _presentPasscodeIfNecessary];
      }
    }
    else
    {
      self->_completedMechanisms &= ~0x10uLL;
      if (self->_acquireUserIntent) {
        self->_evaluationFlags |= 0x20uLL;
      }
    }
    if (self->_usingExternalContext && self->_externalContextInvalidationPolicy)
    {
      uint64_t v20 = +[PKAuthenticatorSharedRootContext sharedInstance];
      [v20 setUserIntentAvailabilityState:v7];
    }
  }
  else if (!v5)
  {
    goto LABEL_16;
  }
  [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
LABEL_16:
}

- (BOOL)updateCompletedMechanismsForPushButtonEventParams:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:&unk_26D086968];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    unsigned int v7 = [v4 objectForKeyedSubscript:&unk_26D0869B0];
    unint64_t completedMechanisms = self->_completedMechanisms;
    if (v7)
    {
      if ((completedMechanisms & 0xF) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      self->_unint64_t completedMechanisms = completedMechanisms & 0xFFFFFFFFFFFFFFF0;
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        id v10 = "PKAuthenticator: Removing completed authentication mechanisms because push button is parent";
        uint64_t v11 = (uint8_t *)&v14;
LABEL_8:
        _os_log_impl(&dword_21EEBD000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      self->_unint64_t completedMechanisms = completedMechanisms | 1;
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v10 = "PKAuthenticator: Adding completed authentication mechanism because push button is parent of nothing";
        uint64_t v11 = (uint8_t *)&v13;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (void)handlePushButtonSecondaryEventWithParameters:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:&unk_26D086998];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v8 = v4;
    int v6 = [(id)v4 BOOLValue];
    uint64_t v7 = 32;
    if (!v6) {
      uint64_t v7 = 0;
    }
    self->_unint64_t completedMechanisms = self->_completedMechanisms & 0xFFFFFFFFFFFFFFDFLL | v7;
    uint64_t v4 = [(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator];
    uint64_t v5 = v8;
    if ((v4 & 1) == 0)
    {
      uint64_t v4 = [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
      uint64_t v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PKAuthenticatorEvaluationContext_event_params_reply___block_invoke;
  block[3] = &unk_2644F9308;
  id v12 = v8;
  int64_t v13 = a3;
  void block[4] = self;
  id v9 = v8;
  id v10 = a5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x263EFFA78], 0);
}

void __55__PKAuthenticatorEvaluationContext_event_params_reply___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 1:
      [*(id *)(a1 + 32) handleTouchIDEventWithParameters:*(void *)(a1 + 40)];
      break;
    case 2:
      [*(id *)(a1 + 32) handlePasscodeEventWithParameters:*(void *)(a1 + 40)];
      break;
    case 5:
      [*(id *)(a1 + 32) handlePushButtonEventWithParameters:*(void *)(a1 + 40)];
      break;
    case 7:
      [*(id *)(a1 + 32) handlePearlEventWithParameters:*(void *)(a1 + 40)];
      break;
    case 9:
      [*(id *)(a1 + 32) handlePushButtonSecondaryEventWithParameters:*(void *)(a1 + 40)];
      break;
    default:
      break;
  }
  uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:&unk_26D086968];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveState:forEvent:withParameters:", objc_msgSend(v2, "BOOLValue"), *(void *)(a1 + 48), *(void *)(a1 + 40));
    uint64_t v2 = v3;
  }
}

- (void)_updateActiveState:(BOOL)a3 forEvent:(int64_t)a4 withParameters:(id)a5
{
  BOOL v6 = a3;
  id v29 = a5;
  uint64_t v8 = 16;
  switch(a4)
  {
    case 1:
      unint64_t activeMechanisms = self->_activeMechanisms;
      unint64_t v10 = activeMechanisms & 0xFFFFFFFFFFFFFFF7;
      uint64_t v11 = 8;
      if (!v6) {
        uint64_t v11 = 0;
      }
      LOBYTE(v12) = v10 | v11;
      self->_unint64_t activeMechanisms = v10 | v11;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = objc_loadWeakRetained((id *)&self->_authenticator);
      id v15 = v14;
      if (WeakRetained && v14)
      {
        if (v6)
        {
          if (objc_opt_respondsToSelector()) {
            [WeakRetained authenticatorDidActivateTouchID:v15];
          }
        }
        else
        {
          id v27 = [v29 objectForKeyedSubscript:&unk_26D0869C8];
          if (objc_opt_respondsToSelector()) {
            [WeakRetained authenticatorDidDeactivateTouchID:v15 status:v27 != 0];
          }
        }
      }

      goto LABEL_29;
    case 2:
      unint64_t activeMechanisms = self->_activeMechanisms;
      unint64_t v12 = activeMechanisms & 0xFFFFFFFFFFFFFFFELL | v6;
      self->_unint64_t activeMechanisms = v12;
      if (v6)
      {
        id v16 = (NSDictionary *)[v29 copy];
        passcodePresentationParameters = self->_passcodePresentationParameters;
        self->_passcodePresentationParameters = v16;

        [(PKAuthenticatorEvaluationContext *)self _presentPasscodeIfNecessary];
      }
      else
      {
        uint64_t v26 = self->_passcodePresentationParameters;
        self->_passcodePresentationParameters = 0;

        uint64_t v20 = self;
        uint64_t v21 = 0;
LABEL_24:
        [(PKAuthenticatorEvaluationContext *)v20 _dismissAuthenticatorViewOfType:v21];
      }
      goto LABEL_29;
    case 3:
      unint64_t activeMechanisms = self->_activeMechanisms;
      unint64_t v18 = activeMechanisms & 0xFFFFFFFFFFFFFFFDLL;
      uint64_t v19 = 2;
      if (!v6) {
        uint64_t v19 = 0;
      }
      LOBYTE(v12) = v18 | v19;
      self->_unint64_t activeMechanisms = v18 | v19;
      uint64_t v20 = self;
      uint64_t v21 = 1;
      if (!v6) {
        goto LABEL_24;
      }
      [(PKAuthenticatorEvaluationContext *)self _presentAuthenticatorViewOfType:1 withParams:v29];
      goto LABEL_29;
    case 5:
      goto LABEL_16;
    case 7:
      unint64_t activeMechanisms = self->_activeMechanisms;
      unint64_t v24 = activeMechanisms & 0xFFFFFFFFFFFFFFFBLL;
      uint64_t v25 = 4;
      if (!v6) {
        uint64_t v25 = 0;
      }
      LOBYTE(v12) = v24 | v25;
      self->_unint64_t activeMechanisms = v24 | v25;
      self->_int64_t coachingStatus = 1;
      [(PKAuthenticatorEvaluationContext *)self _updateCoachingState];
      goto LABEL_29;
    case 9:
      uint64_t v8 = 32;
LABEL_16:
      unint64_t activeMechanisms = self->_activeMechanisms;
      unint64_t v22 = activeMechanisms & ~v8;
      unint64_t v23 = activeMechanisms | v8;
      if (v6) {
        unint64_t v12 = v23;
      }
      else {
        unint64_t v12 = v22;
      }
      self->_unint64_t activeMechanisms = v12;
LABEL_29:
      if ((activeMechanisms & 0xC) != 0 && (v12 & 0xC) == 0)
      {
        self->_automaticallyPresentPasscodeOnce = 1;
        [(PKAuthenticatorEvaluationContext *)self _presentPasscodeIfNecessary];
      }
      if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator]) {
        [(PKAuthenticatorEvaluationContext *)self _updateEvaluationState];
      }
      break;
    default:
      break;
  }
}

- (void)_setLiftFingerTimer
{
  self->_evaluationFlags |= 0x10uLL;
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    uint64_t v4 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;
  }
  double v5 = fmax(self->_touchIDBeginTime - CFAbsoluteTimeGetCurrent() + 1.0, 0.0);
  if (v5 <= 0.0)
  {
    [(PKAuthenticatorEvaluationContext *)self _handleLiftFinger];
  }
  else if (!self->_liftFingerTimeout)
  {
    BOOL v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    uint64_t v7 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = v6;

    uint64_t v8 = self->_liftFingerTimeout;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    unint64_t v10 = self->_liftFingerTimeout;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__PKAuthenticatorEvaluationContext__setLiftFingerTimer__block_invoke;
    v11[3] = &unk_2644F9330;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v10, v11);
    dispatch_resume((dispatch_object_t)self->_liftFingerTimeout);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __55__PKAuthenticatorEvaluationContext__setLiftFingerTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLiftFinger];
}

- (void)_handleLiftFinger
{
  unint64_t evaluationFlags = self->_evaluationFlags;
  if ((evaluationFlags & 0x10) != 0)
  {
    self->_unint64_t evaluationFlags = evaluationFlags & 0xFFFFFFFFFFFFFFEFLL;
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v9 = 0;
      _os_log_impl(&dword_21EEBD000, v4, OS_LOG_TYPE_DEFAULT, "Biometric Match requests lift finger.", v9, 2u);
    }

    if ([(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v6 = objc_loadWeakRetained((id *)&self->_authenticator);
      if (objc_opt_respondsToSelector())
      {
        [WeakRetained authenticator:v6 didRequestUserAction:0];
      }
      else if (objc_opt_respondsToSelector())
      {
        [WeakRetained authenticatorDidEncounterMatchMiss:v6];
      }
    }
    else
    {
      [(PKAuthenticatorEvaluationContext *)self _clearFingerOnTimer];
      self->_evaluationFlags |= 8uLL;
      -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", 0, 1);
    }
  }
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    uint64_t v8 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;
  }
}

- (void)_clearLiftFingerTimer
{
  self->_evaluationFlags &= ~0x10uLL;
  liftFingerTimeout = self->_liftFingerTimeout;
  if (liftFingerTimeout)
  {
    dispatch_source_cancel(liftFingerTimeout);
    uint64_t v4 = self->_liftFingerTimeout;
    self->_liftFingerTimeout = 0;
  }
}

- (void)_setFingerOnTimer
{
  self->_evaluationFlags |= 4uLL;
  matchingDelayTimeout = self->_matchingDelayTimeout;
  if (matchingDelayTimeout)
  {
    dispatch_source_cancel(matchingDelayTimeout);
    uint64_t v4 = self->_matchingDelayTimeout;
    self->_matchingDelayTimeout = 0;
  }
  double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  id v6 = self->_matchingDelayTimeout;
  self->_matchingDelayTimeout = v5;

  uint64_t v7 = self->_matchingDelayTimeout;
  dispatch_time_t v8 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  dispatch_time_t v9 = self->_matchingDelayTimeout;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__PKAuthenticatorEvaluationContext__setFingerOnTimer__block_invoke;
  v10[3] = &unk_2644F9330;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_matchingDelayTimeout);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__PKAuthenticatorEvaluationContext__setFingerOnTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[9];
    if ((v2 & 4) != 0)
    {
      WeakRetained[9] = v2 & 0xFFFFFFFFFFFFFFFBLL;
      id v3 = WeakRetained;
      [WeakRetained _updateEvaluationState];
      id WeakRetained = v3;
    }
  }
}

- (void)_clearFingerOnTimer
{
  self->_evaluationFlags &= ~4uLL;
  matchingDelayTimeout = self->_matchingDelayTimeout;
  if (matchingDelayTimeout)
  {
    dispatch_source_cancel(matchingDelayTimeout);
    uint64_t v4 = self->_matchingDelayTimeout;
    self->_matchingDelayTimeout = 0;
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3 resetPriorDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_invalidated)
  {
    id obj = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained != obj)
    {
      if (WeakRetained)
      {
        [(PKAuthenticatorEvaluationContext *)self _dismissAuthenticatorViewOfType:0];
        [(PKAuthenticatorEvaluationContext *)self _dismissAuthenticatorViewOfType:1];
      }
      objc_storeWeak((id *)&self->_delegate, obj);
      if (![(PKAuthenticatorEvaluationRequest *)self->_request useLegacyAuthenticator])
      {
        char delegateResponderCache = (char)self->_delegateResponderCache;
        if (obj)
        {
          char v9 = objc_opt_respondsToSelector();
          if (objc_opt_respondsToSelector()) {
            char v10 = 2;
          }
          else {
            char v10 = 0;
          }
          char v11 = v10 & 0xFE | v9 & 1;
        }
        else
        {
          char v11 = 0;
        }
        *(unsigned char *)&self->_char delegateResponderCache = v11;
        id v12 = objc_loadWeakRetained((id *)&self->_authenticator);
        id v13 = obj;
        if (WeakRetained && v4)
        {
          if (self->_evaluationState && (delegateResponderCache & 1) != 0)
          {
            objc_msgSend(WeakRetained, "authenticator:didTransitionToEvaluationStateWithEvent:", v12, 0, 0);
            id v13 = obj;
          }
          if (self->_coachingState && (delegateResponderCache & 2) != 0)
          {
            [WeakRetained authenticator:v12 didTransitionToCoachingState:0];
            id v13 = obj;
          }
        }
        if (v13)
        {
          char v14 = (char)self->_delegateResponderCache;
          if (v14)
          {
            objc_msgSend(obj, "authenticator:didTransitionToEvaluationStateWithEvent:", v12, self->_evaluationState, self->_lastAnnotation);
            char v14 = (char)self->_delegateResponderCache;
          }
          if ((v14 & 2) != 0) {
            [obj authenticator:v12 didTransitionToCoachingState:self->_coachingState];
          }
        }
      }
    }

    id v6 = obj;
  }
}

- (BOOL)_delegateSupportsPasscodePresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegateSupportsPasscodeDismissal
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

- (BOOL)_delegateSupportsPassphraseDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)_updateEvaluationState
{
  BOOL v3 = self->_acquireUserIntent && (self->_completedMechanisms & 0x10) == 0;
  if (v3 || (self->_acquireSecondaryUserIntent ? (BOOL v4 = (self->_completedMechanisms & 0x21) == 1) : (BOOL v4 = 0), v4))
  {
    uint64_t v6 = 3;
    goto LABEL_14;
  }
  unint64_t v5 = self->_completedMechanisms & 0xC;
  if ([(PKAuthenticatorEvaluationRequest *)self->_request assumeBiometricOrPasscodeAvailable])
  {
    if (v5 || (self->_completedMechanisms & 3) != 0)
    {
      uint64_t v6 = 5;
      goto LABEL_14;
    }
    unint64_t evaluationFlags = self->_evaluationFlags;
    if ((evaluationFlags & 0xE) != 2) {
      goto LABEL_24;
    }
LABEL_22:
    uint64_t v6 = 2;
    goto LABEL_14;
  }
  unint64_t evaluationFlags = self->_evaluationFlags;
  if ((evaluationFlags & 0xE) == 2 || v5 && (evaluationFlags & 4) == 0) {
    goto LABEL_22;
  }
LABEL_24:
  if ((evaluationFlags & 9) == 1)
  {
    if (self->_evaluationState == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    unint64_t activeMechanisms = self->_activeMechanisms;
    if ((activeMechanisms & 0xC) != 0)
    {
      uint64_t v6 = 0;
    }
    else if ((self->_presentationFlags & 2) != 0 {
           || self->_passcodePresentationRequested
    }
           || !activeMechanisms
           || self->_automaticallyPresentPasscodeOnce)
    {
      uint64_t v6 = 4 * (self->_evaluationState != 0);
    }
    else
    {
      uint64_t v6 = 4;
    }
  }
LABEL_14:
  if ((self->_evaluationFlags & 0xB) == 8) {
    self->_evaluationFlags &= ~8uLL;
  }

  -[PKAuthenticatorEvaluationContext _setEvaluationStateWithEvent:](self, "_setEvaluationStateWithEvent:", v6, 0);
}

- (void)_setEvaluationStateWithEvent:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  int64_t evaluationState = self->_evaluationState;
  if (a3.var0)
  {
    if (evaluationState == a3.var0) {
      return;
    }
  }
  else
  {
    unint64_t v7 = a3.var1 - 1;
    if (evaluationState) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v7 >= 2;
    }
    if (v8 && (self->_lastAnnotation || v7 >= 3)) {
      return;
    }
  }
  self->_int64_t evaluationState = a3.var0;
  self->_lastAnnotation = a3.var1;
  if (!self->_invalidated)
  {
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_evaluating);
    if (v10)
    {
      if (PKSystemApertureIsAvailable())
      {
        int64_t v11 = self->_evaluationState;
        if (v11 == 2)
        {
          id v13 = (void *)MEMORY[0x263F5BE80];
          uint64_t v14 = 2;
        }
        else
        {
          if (v11 != 1)
          {
            if (v11)
            {
              id v15 = 0;
              goto LABEL_35;
            }
            if (self->_lastAnnotation) {
              uint64_t v12 = 4;
            }
            else {
              uint64_t v12 = 0;
            }
            id v15 = (void *)[MEMORY[0x263F5BE80] createForGlyphState:v12];
            int v16 = 1;
            if (!v15)
            {
LABEL_35:
              banner = self->_banner;
              if (banner)
              {
                [(PKBannerHandle *)banner invalidate];
                unint64_t v23 = self->_banner;
                self->_banner = 0;
              }
              goto LABEL_37;
            }
LABEL_30:
            id v17 = self->_banner;
            if (v17 && ![(PKBannerHandle *)v17 isInvalidated])
            {
              [(PKBannerHandle *)self->_banner setState:v15];
            }
            else
            {
              unint64_t v18 = (void *)MEMORY[0x263F5BDB8];
              uint64_t v19 = (void *)[MEMORY[0x263F5BE78] create];
              uint64_t v20 = (PKBannerHandle *)[v18 createHandleForRequest:v19 queue:MEMORY[0x263EF83A0]];
              uint64_t v21 = self->_banner;
              self->_banner = v20;

              [(PKBannerHandle *)self->_banner setState:v15];
              [(PKBannerHandle *)self->_banner displayWithCompletion:0];
            }
            if (!v16)
            {
LABEL_37:

              goto LABEL_38;
            }
            goto LABEL_35;
          }
          id v13 = (void *)MEMORY[0x263F5BE80];
          uint64_t v14 = 1;
        }
        id v15 = (void *)[v13 createForGlyphState:v14];
        int v16 = 0;
        if (!v15) {
          goto LABEL_35;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_38:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (*(unsigned char *)&self->_delegateResponderCache & 1) != 0)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_authenticator);
    objc_msgSend(WeakRetained, "authenticator:didTransitionToEvaluationStateWithEvent:", v24, var0, var1);
  }
  [(PKAuthenticatorEvaluationContext *)self _updateCoachingState];
}

- (void)_updateCoachingState
{
  if ((self->_completedMechanisms & 4) != 0 || (unint64_t)(self->_evaluationState - 1) > 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    switch(self->_coachingStatus)
    {
      case 3:
        uint64_t v3 = 1;
        break;
      case 4:
        uint64_t v3 = 2;
        break;
      case 8:
        if (PKIsPad()) {
          uint64_t v3 = 4;
        }
        else {
          uint64_t v3 = 0;
        }
        break;
      case 0xBLL:
        uint64_t v3 = 3;
        break;
      default:
        break;
    }
  }

  [(PKAuthenticatorEvaluationContext *)self _setCoachingState:v3];
}

- (void)_setCoachingState:(int64_t)a3
{
  int64_t coachingState = self->_coachingState;
  if (coachingState == a3) {
    return;
  }
  self->_int64_t coachingState = a3;
  if (!a3 || coachingState)
  {
    if (a3 || !coachingState) {
      goto LABEL_9;
    }
    LAContext = self->_LAContext;
    uint64_t v6 = &__block_literal_global_247;
    uint64_t v7 = 0;
  }
  else
  {
    LAContext = self->_LAContext;
    uint64_t v6 = &__block_literal_global_245;
    uint64_t v7 = 1;
  }
  [LAContext setShowingCoachingHint:v7 event:7 reply:v6];
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (*(unsigned char *)&self->_delegateResponderCache & 2) != 0)
  {
    id v10 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_authenticator);
    [v10 authenticator:v9 didTransitionToCoachingState:self->_coachingState];

    id WeakRetained = v10;
  }
}

- (BOOL)fingerPresent
{
  if (PKPearlIsAvailable()) {
    LOBYTE(v3) = 0;
  }
  else {
    return (LOBYTE(self->_evaluationFlags) >> 1) & 1;
  }
  return v3;
}

- (BOOL)biometricMatch
{
  return (self->_completedMechanisms & 0xC) != 0;
}

- (BOOL)passcodeActive
{
  return self->_activeMechanisms & 1;
}

- (BOOL)passphraseActive
{
  return (LOBYTE(self->_activeMechanisms) >> 1) & 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (PKAuthenticatorEvaluationRequest)request
{
  return self->_request;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (BOOL)isPolicySupported
{
  return self->_policySupported;
}

- (BOOL)forceApplePayCheck
{
  return self->_forceApplePayCheck;
}

- (BOOL)forceSkipUserIntent
{
  return self->_forceSkipUserIntent;
}

- (int64_t)policy
{
  return self->_policy;
}

- (int64_t)evaluationState
{
  return self->_evaluationState;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (unint64_t)presentationFlags
{
  return self->_presentationFlags;
}

- (PKAuthenticatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAuthenticatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_accessHandlers, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_passcodePresentationParameters, 0);
  objc_storeStrong((id *)&self->_liftFingerTimeout, 0);
  objc_storeStrong((id *)&self->_matchingDelayTimeout, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_destroyWeak((id *)&self->_authenticator);
}

@end