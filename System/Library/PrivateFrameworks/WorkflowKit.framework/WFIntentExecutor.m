@interface WFIntentExecutor
- (BOOL)continueInApp;
- (BOOL)forceExecutionOnPhone;
- (BOOL)skipResolveAndConfirm;
- (INCExtensionConnection)connection;
- (INCExtensionProxy)getRideStatusUpdatingExtensionProxy;
- (INIntent)intent;
- (NSProgress)progress;
- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5;
- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5 requiresTrustCheck:(BOOL)a6;
- (WFIntentExecutorDelegate)delegate;
- (id)completionHandler;
- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4;
- (id)errorFromExtensionError:(id)a3;
- (id)errorFromHandleResponse:(id)a3 intent:(id)a4;
- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
- (id)extensionInputItemsWithIntent:(id)a3;
- (void)autoreleaseSelf;
- (void)configureConnection;
- (void)confirmIntent:(id)a3 withExtensionProxy:(id)a4;
- (void)failWithError:(id)a3;
- (void)finish;
- (void)finishWithInteraction:(id)a3;
- (void)finishWithInteraction:(id)a3 error:(id)a4;
- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4;
- (void)getDynamicOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4;
- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4 completionHandler:(id)a5;
- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4;
- (void)resolveIntent:(id)a3 withExtensionProxy:(id)a4;
- (void)resolveIntentResolutionResults:(id)a3 slotDescription:(id)a4 intent:(id)a5 completion:(id)a6;
- (void)resumeConnectionWithCompletionHandler:(id)a3;
- (void)retainSelf;
- (void)setDelegate:(id)a3;
- (void)setForceExecutionOnPhone:(BOOL)a3;
- (void)setGetRideStatusUpdatingExtensionProxy:(id)a3;
- (void)setSkipResolveAndConfirm:(BOOL)a3;
- (void)showConfirmationForInteraction:(id)a3 confirmationRequired:(BOOL)a4 authenticationRequired:(BOOL)a5 completionHandler:(id)a6;
- (void)startConnectionForParameterName:(id)a3 completionHandler:(id)a4;
- (void)startConnectionForParameterName:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)startConnectionWithCompletionHandler:(id)a3;
- (void)startReceivingRideStatusUpdates;
- (void)startWithCompletionHandler:(id)a3;
- (void)stopReceivingRideStatusUpdates;
- (void)updateIntentWithItemToConfirm:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
@end

@implementation WFIntentExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getRideStatusUpdatingExtensionProxy, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

- (void)setSkipResolveAndConfirm:(BOOL)a3
{
  self->_skipResolveAndConfirm = a3;
}

- (BOOL)skipResolveAndConfirm
{
  return self->_skipResolveAndConfirm;
}

- (void)setForceExecutionOnPhone:(BOOL)a3
{
  self->_forceExecutionOnPhone = a3;
}

- (BOOL)forceExecutionOnPhone
{
  return self->_forceExecutionOnPhone;
}

- (void)setGetRideStatusUpdatingExtensionProxy:(id)a3
{
}

- (INCExtensionProxy)getRideStatusUpdatingExtensionProxy
{
  return self->_getRideStatusUpdatingExtensionProxy;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setDelegate:(id)a3
{
}

- (WFIntentExecutorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFIntentExecutorDelegate *)WeakRetained;
}

- (INCExtensionConnection)connection
{
  return self->_connection;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)autoreleaseSelf
{
  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, self->_strongSelf);
  v3 = *p_strongSelf;
  *p_strongSelf = 0;
}

- (void)retainSelf
{
}

- (void)showConfirmationForInteraction:(id)a3 confirmationRequired:(BOOL)a4 authenticationRequired:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v16 = a3;
  id v10 = a6;
  v11 = [(WFIntentExecutor *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(WFIntentExecutor *)self delegate];
    [v13 intentExecutor:self showConfirmationForInteraction:v16 confirmationRequired:v8 authenticationRequired:v7 completionHandler:v10];
  }
  else
  {
    if (v8 || v7)
    {
      id v14 = v10;
      uint64_t v15 = 0;
    }
    else
    {
      id v14 = v10;
      uint64_t v15 = 1;
    }
    (*((void (**)(id, uint64_t, void))v10 + 2))(v14, v15, 0);
  }
}

- (BOOL)continueInApp
{
  v3 = [(WFIntentExecutor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(WFIntentExecutor *)self delegate];
    [v5 intentExecutorRequestsContinueInApp:self];
  }
  return v4 & 1;
}

- (void)finish
{
  v3 = [(WFIntentExecutor *)self connection];
  [v3 reset];

  [(WFIntentExecutor *)self autoreleaseSelf];
}

- (void)failWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    BOOL v7 = "-[WFIntentExecutor failWithError:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Executing intent failed with error %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFIntentExecutor *)self finishWithInteraction:0 error:v4];
}

- (void)finishWithInteraction:(id)a3
{
}

- (void)finishWithInteraction:(id)a3 error:(id)a4
{
  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);
    id v6 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  [(WFIntentExecutor *)self finish];
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"WFIntentExecutorSlotResolutionResultErrorKey";
  v14[1] = @"WFIntentExecutorSlotDescriptionErrorKey";
  v15[0] = a3;
  v15[1] = a4;
  v14[2] = @"WFIntentExecutorIntentErrorKey";
  v15[2] = a5;
  BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 dictionaryWithObjects:v15 forKeys:v14 count:3];
  char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFIntentExecutorErrorDomain" code:101 userInfo:v11];

  return v12;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 _intentResponseCode];
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    v13[0] = @"WFIntentExecutorIntentErrorKey";
    v13[1] = @"WFIntentExecutorIntentResponseErrorKey";
    v14[0] = v6;
    v14[1] = v5;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v9 = [v10 errorWithDomain:@"WFIntentExecutorErrorDomain" code:103 userInfo:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 _intentResponseCode];
  if ((unint64_t)(v7 - 1) < 8 && ((0x8Du >> (v7 - 1)) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    v12[0] = @"WFIntentExecutorIntentErrorKey";
    v12[1] = @"WFIntentExecutorIntentResponseErrorKey";
    v13[0] = v6;
    v13[1] = v5;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v8 = [v10 errorWithDomain:@"WFIntentExecutorErrorDomain" code:102 userInfo:v11];
  }
  return v8;
}

- (id)errorFromExtensionError:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(WFIntentExecutor *)self intent];
  [v5 setObject:v6 forKey:@"WFIntentExecutorIntentErrorKey"];

  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFIntentExecutorErrorDomain" code:100 userInfo:v5];

  return v7;
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v12;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  id v9 = [(WFIntentExecutor *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(WFIntentExecutor *)self delegate];
    [v11 intentExecutor:self receivingRideStatusDidReceiveUpdate:v8];
  }
}

- (void)stopReceivingRideStatusUpdates
{
  v3 = [(WFIntentExecutor *)self intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(WFIntentExecutor *)self getRideStatusUpdatingExtensionProxy];
    [v5 stopSendingUpdates];

    [(WFIntentExecutor *)self setGetRideStatusUpdatingExtensionProxy:0];
    [(WFIntentExecutor *)self finish];
  }
}

- (void)startReceivingRideStatusUpdates
{
  id v6 = [(WFIntentExecutor *)self intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(WFIntentExecutor *)self getRideStatusUpdatingExtensionProxy];

    if (!v3)
    {
      id v4 = [(WFIntentExecutor *)self connection];
      id v5 = [v4 _transaction];
      [v5 setShouldResetRequestAfterHandle:0];

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke;
      v7[3] = &unk_1E65523E8;
      v7[4] = self;
      [(WFIntentExecutor *)self startConnectionWithCompletionHandler:v7];
    }
  }
  else
  {
  }
}

void __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) setGetRideStatusUpdatingExtensionProxy:v5];
    id v8 = *(void **)(a1 + 32);
    id v9 = [v8 intent];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke_2;
    void v13[3] = &unk_1E6552728;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v5;
    [v8 handleIntent:v9 withExtensionProxy:v14 completionHandler:v13];
  }
  else if (v6)
  {
    char v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) delegate];
      [v12 intentExecutor:*(void *)(a1 + 32) receivingRideStatusDidReceiveError:v7];
    }
  }
}

void __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    id v6 = [v15 intentResponse];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v11 = v7;

    [*(id *)(a1 + 40) startSendingUpdatesToObserver:*(void *)(a1 + 32)];
    id v12 = [*(id *)(a1 + 32) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [*(id *)(a1 + 32) delegate];
      [v14 intentExecutor:*(void *)(a1 + 32) receivingRideStatusDidReceiveUpdate:v11];
    }
  }
  else
  {
    if (v5)
    {
      id v8 = [*(id *)(a1 + 32) delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        char v10 = [*(id *)(a1 + 32) delegate];
        [v10 intentExecutor:*(void *)(a1 + 32) receivingRideStatusDidReceiveError:v5];
      }
    }
    [*(id *)(a1 + 32) setGetRideStatusUpdatingExtensionProxy:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) finish];
  }
}

- (void)updateIntentWithItemToConfirm:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v8 isEnum])
  {
    if ([v8 valueStyle] == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!v7)
      {
        char v10 = 0;
        goto LABEL_14;
      }
      v15[0] = v7;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      if ([v8 valueStyle] == 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        char v10 = [v8 facadePropertyName];
        id v12 = v9;
        id v11 = v7;
        goto LABEL_9;
      }
      uint64_t v13 = [v7 firstObject];
    }
    char v10 = (void *)v13;
LABEL_14:
    id v14 = [v8 facadePropertyName];
    [v9 setValue:v10 forKey:v14];

    goto LABEL_15;
  }
  char v10 = [v8 facadePropertyName];
  id v11 = &unk_1F2316A40;
  id v12 = v9;
LABEL_9:
  [v12 setValue:v11 forKey:v10];
LABEL_15:
}

- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFIntentExecutor handleIntent:withExtensionProxy:completionHandler:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling %@ with extension proxy %@", buf, 0x20u);
  }

  id v12 = [WFAutoIncrementingProgress alloc];
  uint64_t v13 = [(WFIntentExecutor *)self progress];
  id v14 = [(WFAutoIncrementingProgress *)v12 initWithParent:v13 pendingUnitCount:1 duration:5.0];

  [(WFAutoIncrementingProgress *)v14 start];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__WFIntentExecutor_handleIntent_withExtensionProxy_completionHandler___block_invoke;
  v18[3] = &unk_1E6552700;
  v18[4] = self;
  id v19 = v8;
  v20 = v14;
  id v21 = v10;
  id v15 = v14;
  id v16 = v10;
  id v17 = v8;
  [v9 handleIntentWithCompletionHandler:v18];
}

void __70__WFIntentExecutor_handleIntent_withExtensionProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (v18)
  {
    uint64_t v6 = [v18 _intentResponseCode];
    if (v6 != 7)
    {
      if (v6 == 4)
      {
        if (![*(id *)(a1 + 40) _shouldForwardToAppOnSucccess])
        {
LABEL_9:
          id v10 = *(void **)(a1 + 32);
          id v11 = [v10 connection];
          id v12 = [v11 intent];
          id v8 = [v10 errorFromHandleResponse:v18 intent:v12];

          if (v8)
          {
            id v9 = 0;
          }
          else
          {
            id v13 = objc_alloc(MEMORY[0x1E4F30508]);
            char v14 = objc_opt_respondsToSelector();
            uint64_t v15 = *(void *)(a1 + 40);
            if (v14) {
              uint64_t v16 = [v13 _initWithIntent:v15 response:v18];
            }
            else {
              uint64_t v16 = [v13 initWithIntent:v15 response:v18];
            }
            id v9 = (void *)v16;
          }
          uint64_t v17 = *(void *)(a1 + 56);
          if (v17) {
            (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v9, v8);
          }
          [*(id *)(a1 + 48) finish];
          goto LABEL_18;
        }
      }
      else if (v6 != 2)
      {
        goto LABEL_9;
      }
    }
    if ([*(id *)(a1 + 32) continueInApp]) {
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 underlyingError];
  id v9 = [v7 errorFromExtensionError:v8];
  [v7 failWithError:v9];
LABEL_18:

LABEL_19:
}

- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__WFIntentExecutor_handleIntent_withExtensionProxy___block_invoke;
  v4[3] = &unk_1E65526D8;
  v4[4] = self;
  [(WFIntentExecutor *)self handleIntent:a3 withExtensionProxy:a4 completionHandler:v4];
}

uint64_t __52__WFIntentExecutor_handleIntent_withExtensionProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "failWithError:");
  }
  else {
    return [v3 finishWithInteraction:a2];
  }
}

- (void)confirmIntent:(id)a3 withExtensionProxy:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[WFIntentExecutor confirmIntent:withExtensionProxy:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Confirming %@ with extension proxy %@", buf, 0x20u);
  }

  id v9 = [WFAutoIncrementingProgress alloc];
  id v10 = [(WFIntentExecutor *)self progress];
  id v11 = [(WFAutoIncrementingProgress *)v9 initWithParent:v10 pendingUnitCount:1 duration:1.0];

  [(WFAutoIncrementingProgress *)v11 start];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke;
  v15[3] = &unk_1E65526B0;
  void v15[4] = self;
  id v16 = v6;
  uint64_t v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v6;
  [v12 confirmIntentWithCompletionHandler:v15];
}

void __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    id v12 = a1[4];
    id v11 = [v6 underlyingError];
    id v13 = [v12 errorFromExtensionError:v11];
    [v12 failWithError:v13];

LABEL_21:
    goto LABEL_22;
  }
  if ([v5 _intentResponseCode] != 2 || (objc_msgSend(a1[4], "continueInApp") & 1) == 0)
  {
    id v8 = a1[4];
    id v9 = [v8 connection];
    id v10 = [v9 intent];
    id v11 = [v8 errorFromConfirmResponse:v5 intent:v10];

    if (v11)
    {
      [a1[4] failWithError:v11];
    }
    else
    {
      BOOL v14 = ([a1[5] _isUserConfirmationRequired] & 1) != 0
         || ([v5 _userConfirmationRequired] & 1) != 0
         || [v5 _intentResponseCode] == 8;
      char v15 = [v5 _requiresAuthentication];
      uint64_t v16 = [a1[5] _intentCategory];
      uint64_t v17 = 1;
      uint64_t v18 = v16 == 4 || v14;
      if (v16 != 4 && (v15 & 1) == 0)
      {
        id v19 = [a1[5] launchId];
        uint64_t v36 = 0;
        INExtractAppInfoFromSiriLaunchId();
        id v20 = 0;

        __int16 v21 = +[ICAppRegistry sharedRegistry];
        [v21 appWithBundleIdentifier:v20];
        id v22 = v32 = v18;

        __int16 v23 = [v22 appInfo];
        id v24 = [v23 actionsRestrictedWhileLocked];
        uint64_t v25 = [a1[5] _className];

        uint64_t v17 = [v24 containsObject:v25];
        uint64_t v18 = v32;
      }
      [a1[6] finish];
      id v26 = objc_alloc(MEMORY[0x1E4F30508]);
      char v27 = objc_opt_respondsToSelector();
      id v28 = a1[5];
      if (v27) {
        uint64_t v29 = [v26 _initWithIntent:v28 response:v5];
      }
      else {
        uint64_t v29 = [v26 initWithIntent:v28 response:v5];
      }
      v30 = (void *)v29;
      id v31 = a1[4];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke_2;
      v33[3] = &unk_1E6552688;
      v33[4] = v31;
      id v34 = a1[5];
      id v35 = a1[7];
      [v31 showConfirmationForInteraction:v30 confirmationRequired:v18 authenticationRequired:v17 completionHandler:v33];
    }
    goto LABEL_21;
  }
LABEL_22:
}

void __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke_2(void *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)a1[4];
  id v8 = v5;
  if (a2)
  {
    [v6 handleIntent:a1[5] withExtensionProxy:a1[6]];
  }
  else if (v5)
  {
    [v6 failWithError:v5];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] userCancelledError];
    [v6 failWithError:v7];
  }
}

- (void)resolveIntentResolutionResults:(id)a3 slotDescription:(id)a4 intent:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__36831;
  v32[4] = __Block_byref_object_dispose__36832;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__36831;
  v30[4] = __Block_byref_object_dispose__36832;
  id v31 = (id)[v12 copy];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke;
  v22[3] = &unk_1E6552638;
  v22[4] = self;
  id v14 = v11;
  id v23 = v14;
  id v15 = v12;
  id v24 = v15;
  uint64_t v25 = v28;
  id v26 = v30;
  char v27 = v32;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_3;
  v17[3] = &unk_1E6552660;
  id v16 = v13;
  id v18 = v16;
  id v19 = v28;
  id v20 = v30;
  __int16 v21 = v32;
  objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v22, v17);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

void __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = [v9 resolutionResultCode];
  if (v11 == 5) {
    goto LABEL_8;
  }
  if (v11 != 3)
  {
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v12 = [*(id *)(a1 + 32) delegate];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    *a5 = 1;
LABEL_8:
    v10[2](v10, 0);
    goto LABEL_9;
  }
  id v14 = [*(id *)(a1 + 32) delegate];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = [v9 itemToConfirm];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_2;
  v23[3] = &unk_1E6552610;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(a1 + 40);
  uint64_t v26 = *(void *)(a1 + 56);
  v23[4] = v19;
  id v21 = v20;
  uint64_t v22 = *(void *)(a1 + 64);
  id v24 = v21;
  uint64_t v27 = v22;
  uint64_t v25 = v10;
  [v14 intentExecutor:v15 showConfirmationForSlot:v16 item:v17 intent:v18 completion:v23];

LABEL_9:
}

uint64_t __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
}

void __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  [*(id *)(a1 + 32) updateIntentWithItemToConfirm:a2 forSlot:*(void *)(a1 + 40) onIntent:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!a2)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v8 = @"WFIntentExecutorIntentErrorKey";
    v9[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [v4 errorWithDomain:@"WFIntentExecutorErrorDomain" code:104 userInfo:v6];

    [*(id *)(a1 + 32) failWithError:v7];
  }
}

- (void)resolveIntent:(id)a3 withExtensionProxy:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[WFIntentExecutor resolveIntent:withExtensionProxy:]";
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Resolving %@ with extension proxy %@", buf, 0x20u);
  }

  id v9 = [v6 _intentInstanceDescription];
  id v10 = [v9 slotDescriptions];
  uint64_t v11 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_36838);

  if ([v11 count])
  {
    id v12 = [WFAutoIncrementingProgress alloc];
    char v13 = [(WFIntentExecutor *)self progress];
    id v14 = [(WFAutoIncrementingProgress *)v12 initWithParent:v13 pendingUnitCount:1 duration:0.5];

    [(WFAutoIncrementingProgress *)v14 start];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2;
    v17[3] = &unk_1E65525E8;
    void v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v20 = v14;
    uint64_t v15 = v14;
    [v19 resolveIntentSlotKeyPaths:v11 completionHandler:v17];
  }
  else
  {
    uint64_t v16 = [(WFIntentExecutor *)self progress];
    objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);

    [(WFIntentExecutor *)self confirmIntent:v6 withExtensionProxy:v7];
  }
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__36831;
  v47 = __Block_byref_object_dispose__36832;
  id v9 = v7;
  id v48 = v9;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__36831;
  v41 = __Block_byref_object_dispose__36832;
  id v42 = 0;
  uint64_t v31 = 0;
  unsigned int v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__36831;
  id v35 = __Block_byref_object_dispose__36832;
  id v36 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_192;
  aBlock[3] = &unk_1E6552548;
  aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = &v43;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (a2)
  {
    (*((void (**)(void *, uint64_t, void, uint64_t, uint64_t, void))v10 + 2))(v10, v44[5], *(void *)(a1 + 48), v38[5], v32[5], *(void *)(a1 + 56));
  }
  else
  {
    id v12 = [v8 allKeys];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2_194;
    v22[3] = &unk_1E6552598;
    id v23 = v8;
    uint64_t v27 = &v37;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v24 = v13;
    uint64_t v25 = v14;
    id v28 = &v43;
    id v26 = *(id *)(a1 + 48);
    char v29 = &v31;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_4;
    v15[3] = &unk_1E65525C0;
    id v18 = v11;
    id v19 = &v43;
    id v16 = *(id *)(a1 + 48);
    id v20 = &v37;
    id v21 = &v31;
    id v17 = *(id *)(a1 + 56);
    objc_msgSend(v12, "if_enumerateAsynchronouslyInSequence:completionHandler:", v22, v15);
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_192(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  [a6 finish];
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v11)
  {
    uint64_t v14 = [*(id *)(a1 + 32) errorFromResolutionResult:v11 forSlot:v10 onIntent:*(void *)(v13 + 40)];
    [v12 failWithError:v14];
  }
  else
  {
    [*(id *)(a1 + 32) confirmIntent:*(void *)(v13 + 40) withExtensionProxy:v15];
  }
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2_194(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if ([v8 result] == 1)
  {
    id v9 = [*(id *)(a1 + 40) _intentInstanceDescription];
    uint64_t v10 = [v9 slotByName:v6];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) resolutionResultClass];
    uint64_t v14 = [v8 data];
    id v15 = [v13 _resolutionResultWithData:v14 slotDescription:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25[0] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v17 = 0;
        goto LABEL_9;
      }
      id v16 = v15;
    }
    id v17 = v16;
LABEL_9:
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_3;
    v21[3] = &unk_1E6552570;
    id v20 = *(void **)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    int8x16_t v24 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    id v23 = v7;
    [v20 resolveIntentResolutionResults:v17 slotDescription:v18 intent:v19 completion:v21];

    goto LABEL_10;
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_10:
}

uint64_t __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], *(void *)(*(void *)(a1[7] + 8) + 40), a1[4], *(void *)(*(void *)(a1[8] + 8) + 40), *(void *)(*(void *)(a1[9] + 8) + 40), a1[5]);
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v13 = a3;
  id v8 = a4;
  if (v13 && a2)
  {
    id v9 = *(id *)(a1 + 32);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    id v12 = [v11 _connection];
    [v12 setIntent:v13];
  }
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  if (v13) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resolveSelector])
  {
    v3 = [v2 name];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)resumeConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFIntentExecutor *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6552500;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 resumeWithCompletionHandler:v7];
}

void __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5
    && [v6 code] == 1320
    && ([*(id *)(a1 + 32) delegate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = [*(id *)(a1 + 32) delegate];
    uint64_t v11 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E65524D8;
    v12[4] = v11;
    id v15 = *(id *)(a1 + 40);
    id v13 = 0;
    id v14 = v7;
    [v10 intentExecutor:v11 needsAppProtectionUnlockWithCompletionHandler:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) connection];
    [v3 setAppProtectionPolicy:1];

    id v5 = [*(id *)(a1 + 32) connection];
    [v5 resumeWithCompletionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

- (void)startConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(WFIntentExecutor *)self configureConnection];
  id v5 = [WFAutoIncrementingProgress alloc];
  id v6 = [(WFIntentExecutor *)self progress];
  id v7 = [(WFAutoIncrementingProgress *)v5 initWithParent:v6 pendingUnitCount:1 duration:1.0];

  [(WFAutoIncrementingProgress *)v7 start];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__WFIntentExecutor_startConnectionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E65524B0;
  uint64_t v11 = v7;
  id v12 = v4;
  v10[4] = self;
  id v8 = v7;
  id v9 = v4;
  [(WFIntentExecutor *)self resumeConnectionWithCompletionHandler:v10];
}

void __57__WFIntentExecutor_startConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    a3 = [*(id *)(a1 + 32) errorFromExtensionError:a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) finish];
}

- (void)configureConnection
{
  v3 = [(WFIntentExecutor *)self connection];
  id v4 = [(WFIntentExecutor *)self intent];
  id v5 = [v4 extensionBundleId];
  int v6 = [v5 isEqualToString:@"com.apple.PassKit.PassKitIntentsExtension"];

  if (v6) {
    [v3 setRequestTimeoutInterval:60.0];
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __39__WFIntentExecutor_configureConnection__block_invoke;
  v9[3] = &unk_1E6552488;
  objc_copyWeak(&v10, &location);
  [v3 setTimeoutHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__WFIntentExecutor_configureConnection__block_invoke_2;
  v7[3] = &unk_1E6552488;
  objc_copyWeak(&v8, &location);
  [v3 setInterruptionHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__WFIntentExecutor_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v9[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F70BD8] code:1307 userInfo:v5];
  id v7 = [WeakRetained errorFromExtensionError:v6];
  [WeakRetained failWithError:v7];
}

void __39__WFIntentExecutor_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v9[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F70BD8] code:1301 userInfo:v5];
  id v7 = [WeakRetained errorFromExtensionError:v6];
  [WeakRetained failWithError:v7];
}

- (void)getDynamicOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  [(WFIntentExecutor *)self retainSelf];
  id v10 = [(WFIntentExecutor *)self connection];
  [v10 setAppProtectionPolicy:1];

  [(WFIntentExecutor *)self startConnectionForParameterName:v11 searchTerm:v9 completionHandler:v8];
}

- (void)startConnectionForParameterName:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke;
  void v14[3] = &unk_1E6552460;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(WFIntentExecutor *)self startConnectionWithCompletionHandler:v14];
}

void __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6552438;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = v6;
    void v9[4] = v7;
    id v10 = *(id *)(a1 + 32);
    [a2 getOptionsForParameterNamed:v4 searchTerm:v5 completionHandler:v9];
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
}

void __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) intent];
    id v8 = [v7 _codableDescription];
    id v9 = [v8 attributeByName:*(void *)(a1 + 40)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_3;
    v12[3] = &unk_1E6552410;
    id v15 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    objc_msgSend(v5, "wf_transformValueForCodableAttribute:completionHandler:", v9, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finish];
  }
}

uint64_t __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);
  return [v2 finish];
}

- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [(WFIntentExecutor *)self retainSelf];
  uint64_t v7 = [(WFIntentExecutor *)self connection];
  [v7 setAppProtectionPolicy:1];

  [(WFIntentExecutor *)self startConnectionForParameterName:v8 completionHandler:v6];
}

- (void)startConnectionForParameterName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke;
  v10[3] = &unk_1E65524B0;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(WFIntentExecutor *)self startConnectionWithCompletionHandler:v10];
}

void __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6555C08;
    id v10 = *(id *)(a1 + 48);
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    id v5 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    [a2 getDefaultValueForParameterNamed:v4 completionHandler:v8];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int8x16_t v7 = [*(id *)(a1 + 32) intent];
    id v8 = [v7 _codableDescription];
    int8x16_t v9 = [v8 attributeByName:*(void *)(a1 + 40)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_3;
    v12[3] = &unk_1E6552410;
    id v15 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    objc_msgSend(v5, "wf_transformValueForCodableAttribute:completionHandler:", v9, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finish];
  }
}

uint64_t __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);
  return [v2 finish];
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  [(WFIntentExecutor *)self retainSelf];
  id v6 = [(WFIntentExecutor *)self progress];
  [v6 setCompletedUnitCount:0];

  if ([(WFIntentExecutor *)self skipResolveAndConfirm]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 4;
  }
  id v8 = [(WFIntentExecutor *)self progress];
  [v8 setTotalUnitCount:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __47__WFIntentExecutor_startWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E65523E8;
  void v9[4] = self;
  [(WFIntentExecutor *)self startConnectionWithCompletionHandler:v9];
}

void __47__WFIntentExecutor_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v10)
  {
    int v7 = [v6 skipResolveAndConfirm];
    id v8 = *(void **)(a1 + 32);
    int8x16_t v9 = [v8 intent];
    if (v7) {
      [v8 handleIntent:v9 withExtensionProxy:v10];
    }
    else {
      [v8 resolveIntent:v9 withExtensionProxy:v10];
    }
  }
  else
  {
    [v6 failWithError:v5];
  }
}

- (INIntent)intent
{
  return (INIntent *)[(INCExtensionConnection *)self->_connection intent];
}

- (id)extensionInputItemsWithIntent:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28C80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v7 = [v4 _executionContext];

  if (v7 <= 9 && ((1 << v7) & 0x206) != 0)
  {
    id v8 = [MEMORY[0x1E4F305E0] siriLanguageCode];
  }
  else
  {
    int8x16_t v9 = (void *)_CFLocaleCopyPreferred();
    id v8 = [v9 languageIdentifier];
  }
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, *MEMORY[0x1E4F308A0]);

  [v5 setUserInfo:v6];
  v12[0] = v5;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5 requiresTrustCheck:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFIntentExecutor;
  id v12 = [(WFIntentExecutor *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F70BF8]) initWithIntent:v10 supportedExtensionTypes:7 donateInteraction:v8 groupIdentifier:v11 remoteProxyProvider:0];
    connection = v12->_connection;
    v12->_connection = (INCExtensionConnection *)v13;

    [(INCExtensionConnection *)v12->_connection setRequiresTCC:0];
    [(INCExtensionConnection *)v12->_connection setRequiresTrustCheck:v6];
    id v15 = [(WFIntentExecutor *)v12 extensionInputItemsWithIntent:v10];
    [(INCExtensionConnection *)v12->_connection setExtensionInputItems:v15];

    uint64_t v16 = objc_opt_new();
    progress = v12->_progress;
    v12->_progress = (NSProgress *)v16;

    id v18 = v12;
  }

  return v12;
}

- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5
{
  return [(WFIntentExecutor *)self initWithIntent:a3 donateInteraction:a4 groupIdentifier:a5 requiresTrustCheck:1];
}

@end