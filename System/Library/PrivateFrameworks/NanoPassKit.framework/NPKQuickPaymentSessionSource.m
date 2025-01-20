@interface NPKQuickPaymentSessionSource
- (NPKQuickPaymentSessionSource)initWithDelegate:(id)a3 buttonListener:(id)a4 callbackQueue:(id)a5;
- (void)_handleAuthIntentEventFromSource:(unint64_t)a3;
- (void)_performDelegateCallback:(id)a3;
- (void)setDeferAuthorization:(BOOL)a3;
- (void)setDelegateHandlingButtonEvents:(BOOL)a3;
- (void)setInitialPass:(id)a3;
- (void)setLocalAuthenticationCoordinator:(id)a3;
- (void)setPreconditionState:(unint64_t)a3;
- (void)setRequireFirstInQueue:(BOOL)a3;
- (void)setVasPasses:(id)a3;
@end

@implementation NPKQuickPaymentSessionSource

- (NPKQuickPaymentSessionSource)initWithDelegate:(id)a3 buttonListener:(id)a4 callbackQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKQuickPaymentSessionSource;
  v11 = [(NPKQuickPaymentSessionSource *)&v20 init];
  if (v11)
  {
    if (v10)
    {
      v12 = (OS_dispatch_queue *)v10;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callbackQueue = v11->_callbackQueue;
    v11->_callbackQueue = v12;

    v14 = NPKElevatedPriorityDispatchQueueCreate("NPKQuickPaymentSessionSource", 0);
    sessionSourceQueue = v11->_sessionSourceQueue;
    v11->_sessionSourceQueue = (OS_dispatch_queue *)v14;

    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_initWeak(&location, v11);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke;
    v17[3] = &unk_2644D3880;
    objc_copyWeak(&v18, &location);
    [v9 setButtonHandler:v17];
    objc_storeStrong((id *)&v11->_buttonListener, a4);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke_2;
    v6[3] = &unk_2644D3160;
    v7 = WeakRetained;
    uint64_t v8 = a2;
    dispatch_async(v5, v6);
  }
}

uint64_t __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthIntentEventFromSource:*(void *)(a1 + 40)];
}

- (void)setDelegateHandlingButtonEvents:(BOOL)a3
{
  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__NPKQuickPaymentSessionSource_setDelegateHandlingButtonEvents___block_invoke;
  v4[3] = &unk_2644D2938;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __64__NPKQuickPaymentSessionSource_setDelegateHandlingButtonEvents___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDeferAuthorization:(BOOL)a3
{
  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__NPKQuickPaymentSessionSource_setDeferAuthorization___block_invoke;
  v4[3] = &unk_2644D2938;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __54__NPKQuickPaymentSessionSource_setDeferAuthorization___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRequireFirstInQueue:(BOOL)a3
{
  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__NPKQuickPaymentSessionSource_setRequireFirstInQueue___block_invoke;
  v4[3] = &unk_2644D2938;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __55__NPKQuickPaymentSessionSource_setRequireFirstInQueue___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 42) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setPreconditionState:(unint64_t)a3
{
  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__NPKQuickPaymentSessionSource_setPreconditionState___block_invoke;
  v4[3] = &unk_2644D3160;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __53__NPKQuickPaymentSessionSource_setPreconditionState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

- (void)setInitialPass:(id)a3
{
  id v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__NPKQuickPaymentSessionSource_setInitialPass___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionSourceQueue, v7);
}

void __47__NPKQuickPaymentSessionSource_setInitialPass___block_invoke(uint64_t a1)
{
}

- (void)setVasPasses:(id)a3
{
  id v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__NPKQuickPaymentSessionSource_setVasPasses___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionSourceQueue, v7);
}

void __45__NPKQuickPaymentSessionSource_setVasPasses___block_invoke(uint64_t a1)
{
}

- (void)setLocalAuthenticationCoordinator:(id)a3
{
  id v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__NPKQuickPaymentSessionSource_setLocalAuthenticationCoordinator___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionSourceQueue, v7);
}

void __66__NPKQuickPaymentSessionSource_setLocalAuthenticationCoordinator___block_invoke(uint64_t a1)
{
}

- (void)_handleAuthIntentEventFromSource:(unint64_t)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  BOOL v5 = [MEMORY[0x263EFF910] date];
  if (a3 == 1)
  {
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11) {
      goto LABEL_11;
    }
    id v8 = pk_Payment_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v9 = "Notice: Session source received an assistive touch gesture event";
    goto LABEL_9;
  }
  if (!a3)
  {
    id v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      id v9 = "Notice: Session source received PMU button event";
LABEL_9:
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_10;
    }
  }
LABEL_11:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionSourceQueue);
  unint64_t preconditionState = self->_preconditionState;
  v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (preconditionState - 1 > 7) {
        v16 = @"Proceed";
      }
      else {
        v16 = off_2644D38C8[preconditionState - 1];
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v67 = (uint64_t)v16;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Session source initial precondition state is %@", buf, 0xCu);
    }
  }
  if (preconditionState == 6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v18 = [WeakRetained paymentSessionSourceIsWalletInstalledRequiredToStartPaymentSession:self];

    if (v18)
    {
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke;
      v65[3] = &unk_2644D2910;
      v65[4] = self;
      v19 = v65;
LABEL_74:
      -[NPKQuickPaymentSessionSource _performDelegateCallback:](self, "_performDelegateCallback:", v19, v50, v51, v52, v53, v54, v55);
      goto LABEL_75;
    }
  }
  unsigned int v20 = NPKIsAssistiveTouchEnabled();
  uint64_t v21 = v20;
  if (!self->_delegateHandlingButtonEvents)
  {
    v25 = pk_Payment_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      v27 = pk_Payment_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Session source is NOT delegating auth intent event", buf, 2u);
      }
    }
    if (v21 != a3)
    {
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_78;
      v60[3] = &unk_2644D2910;
      v60[4] = self;
      v19 = v60;
      goto LABEL_74;
    }
    if (+[NPKQuickPaymentSession hasOutstandingSessions])
    {
      v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (!v29) {
        goto LABEL_75;
      }
      v30 = pk_Payment_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Notice: Outstanding payment sessions; ignoring";
        v32 = v30;
        uint32_t v33 = 2;
LABEL_48:
        _os_log_impl(&dword_21E92F000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
LABEL_49:

      goto LABEL_75;
    }
    if (!preconditionState)
    {
      if (self->_initialPass)
      {
        localAuthenticationCoordinator = self->_localAuthenticationCoordinator;
        if (localAuthenticationCoordinator) {
          [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)localAuthenticationCoordinator beginLocalAuthenticationWithCompletion:0];
        }
        v41 = +[NPKQuickPaymentSession sessionWithQueue:MEMORY[0x263EF83A0]];
        [v41 setCurrentPass:self->_initialPass];
        [v41 setVasPasses:self->_vasPasses];
        [v41 setRequireFirstInQueue:self->_requireFirstInQueue];
        if (self->_deferAuthorization) {
          [v41 setDeferAuthorization:1];
        }
        int v42 = [v41 startSession];
        v43 = pk_Payment_log();
        BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

        if (v42)
        {
          if (v44)
          {
            v45 = pk_Payment_log();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21E92F000, v45, OS_LOG_TYPE_DEFAULT, "Notice: Session source providing session to delegate", buf, 2u);
            }
          }
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_80;
          v56[3] = &unk_2644D38A8;
          v56[4] = self;
          v57 = v41;
          id v58 = v5;
          unint64_t v59 = a3;
          v46 = v41;
          [(NPKQuickPaymentSessionSource *)self _performDelegateCallback:v56];

          goto LABEL_75;
        }
        if (v44)
        {
          v49 = pk_Payment_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v49, OS_LOG_TYPE_DEFAULT, "Notice: Payment session failed to start; session source reporting busy",
              buf,
              2u);
          }
        }
        [(NPKQuickPaymentSessionLocalAuthenticationCoordinator *)self->_localAuthenticationCoordinator invalidateLocalAuthenticationContexts];
        unint64_t preconditionState = 7;
      }
      else
      {
        v47 = pk_Payment_log();
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

        if (!v48)
        {
          unint64_t preconditionState = 3;
          goto LABEL_73;
        }
        v41 = pk_Payment_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v41, OS_LOG_TYPE_DEFAULT, "Notice: No initial pass; session source reporting no cards",
            buf,
            2u);
        }
        unint64_t preconditionState = 3;
      }
    }
LABEL_73:
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_81;
    v53 = &unk_2644D3160;
    v54 = self;
    unint64_t v55 = preconditionState;
    v19 = &v50;
    goto LABEL_74;
  }
  if (v20 == a3)
  {
    v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Session source is delegating auth intent event", buf, 2u);
      }
    }
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_76;
    v62[3] = &unk_2644D3288;
    v62[4] = self;
    id v63 = v5;
    unint64_t v64 = a3;
    [(NPKQuickPaymentSessionSource *)self _performDelegateCallback:v62];

    goto LABEL_75;
  }
  if (a3 == 1)
  {
    v37 = pk_Payment_log();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

    if (!v38) {
      goto LABEL_75;
    }
    v30 = pk_Payment_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v39 = NPKIsAssistiveTouchEnabled();
      *(_DWORD *)buf = 134218240;
      uint64_t v67 = 1;
      __int16 v68 = 1024;
      BOOL v69 = v39;
      v31 = "Warning: Received unexpected auth intent source: %lu, is double click disabled: %i";
      v32 = v30;
      uint32_t v33 = 18;
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  if (!a3)
  {
    v34 = pk_Payment_log();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      v36 = pk_Payment_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Session source is requesting AssistiveTouch enabled alert presentation", buf, 2u);
      }
    }
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_77;
    v61[3] = &unk_2644D2910;
    v61[4] = self;
    v19 = v61;
    goto LABEL_74;
  }
LABEL_75:
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@ Declining to handle button event. Wallet is not installed", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained paymentSessionSource:*(void *)(a1 + 32) declinedToStartPaymentSessionDueToPreconditionState:6];
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_76(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained paymentSessionSource:a1[4] receivedDelegatedButtonEventAtDate:a1[5] authIntentSource:a1[6]];
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_77(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained paymentSessionSourceRequestsAssistiveTouchAlertPresentation:*(void *)(a1 + 32)];
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained paymentSessionSourceRequestsAssistiveTouchAlertPresentation:*(void *)(a1 + 32)];
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_80(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained paymentSessionSource:a1[4] startedPaymentSession:a1[5] dueToButtonEventAtDate:a1[6] authIntentSource:a1[7]];
}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_81(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained paymentSessionSource:*(void *)(a1 + 32) declinedToStartPaymentSessionDueToPreconditionState:*(void *)(a1 + 40)];
}

- (void)_performDelegateCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_vasPasses, 0);
  objc_storeStrong((id *)&self->_initialPass, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionSourceQueue, 0);
  objc_storeStrong((id *)&self->_buttonListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end