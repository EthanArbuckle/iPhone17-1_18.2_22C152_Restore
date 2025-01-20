@interface NPKQuickPaymentSession
+ (BOOL)hasOutstandingSessions;
+ (NPKQuickPaymentSession)sessionWithQueue:(id)a3;
+ (id)_outstandingSessionHashTable;
+ (void)_handleNewContactlessSession:(id)a3;
- (BOOL)_invokeStateUpdateForReason:(unint64_t)a3 shouldCleanupSession:(BOOL)a4;
- (BOOL)_sessionQueue_authorizeWithUseCredential:(BOOL)a3 deferAuthorizationIfCredentialUsed:(BOOL)a4;
- (BOOL)_sessionQueue_enablePersistentCardEmulation;
- (BOOL)_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:(id)a3;
- (BOOL)_sessionQueue_updateContactlessSessionForPass:(id)a3 paymentApplications:(id)a4 vasPasses:(id)a5 sessionConfirmed:(BOOL)a6 deferAuthorization:(BOOL)a7;
- (BOOL)deferAuthorization;
- (BOOL)endSessionWhenAuthorizationIsConsumed;
- (BOOL)hasPerformedFirstActivation;
- (BOOL)inServiceMode;
- (BOOL)isConfirmed;
- (BOOL)isDeactivated;
- (BOOL)isDeactivating;
- (BOOL)isSwitchingSessionType;
- (BOOL)requireFirstInQueue;
- (BOOL)sessionStarted;
- (BOOL)startSession;
- (BOOL)startSessionWithCompletion:(id)a3;
- (NPKQuickPaymentSession)initWithQueue:(id)a3;
- (NPKQuickPaymentSessionDelegate)delegate;
- (NSDictionary)vasPasses;
- (NSMutableArray)deactivationCompletionBlocks;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)paymentSessionQueue;
- (PKContactlessInterfaceSession)contactlessSession;
- (PKFieldDetector)fieldDetector;
- (PKPass)currentPass;
- (PKPaymentSessionHandle)contactlessSessionHandle;
- (unint64_t)authorizationValidity;
- (unint64_t)contactlessValidity;
- (unint64_t)sessionType;
- (void)_callbackQueue_invokeDidCompleteForReason:(unint64_t)a3 withTransactionContext:(id)a4 shouldCleanupSession:(BOOL)a5;
- (void)_checkContactlessValidity:(unint64_t)a3 authorizationValidity:(unint64_t)a4 performWork:(id)a5;
- (void)_checkContactlessValidity:(unint64_t)a3 performWork:(id)a4;
- (void)_handleConventionalTransactionWithContext:(id)a3;
- (void)_handleTransactionCompleteWithContext:(id)a3;
- (void)_internalQueue_deactivateSessionWithCompletion:(id)a3;
- (void)_internalQueue_getContactlessAndAuthorizationValidityAndPerformWork:(id)a3;
- (void)_internalQueue_invokeDeactivationCompletionBlocks;
- (void)_internalQueue_setCurrentPass:(id)a3;
- (void)_internalQueue_updateContactlessSessionForPass:(id)a3 vasPasses:(id)a4 deferAuthorization:(BOOL)a5;
- (void)_internalQueue_updateContactlessValidityAndPerformWork:(id)a3;
- (void)_internalQueue_updateSessionWithCurrentPassAndLoyaltyState;
- (void)_loyaltyEngineConfigurationChanged:(id)a3;
- (void)_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:(BOOL)a3 invokeOnSuccess:(BOOL)a4 contactlessValidity:(unint64_t)a5 forPass:(id)a6;
- (void)_updateAuthorizationValidity;
- (void)_updateSessionWithCredentialAndActivate;
- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4;
- (void)confirmSessionExpectingCredential:(BOOL)a3;
- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5;
- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4;
- (void)contactlessInterfaceSessionDidExitField:(id)a3;
- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6;
- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3;
- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5;
- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3;
- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3;
- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3;
- (void)contactlessInterfaceSessionDidSelectValueAddedService:(id)a3;
- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4;
- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6;
- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3;
- (void)deactivateSessionWithCompletion:(id)a3;
- (void)dealloc;
- (void)executeRKEActionForPass:(id)a3 function:(id)a4 action:(id)a5 withCompletion:(id)a6;
- (void)setAuthorizationValidity:(unint64_t)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setContactlessSession:(id)a3;
- (void)setContactlessSessionHandle:(id)a3;
- (void)setContactlessValidity:(unint64_t)a3;
- (void)setCredential:(id)a3;
- (void)setCurrentPass:(id)a3;
- (void)setDeactivated:(BOOL)a3;
- (void)setDeactivating:(BOOL)a3;
- (void)setDeactivationCompletionBlocks:(id)a3;
- (void)setDeferAuthorization:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEndSessionWhenAuthorizationIsConsumed:(BOOL)a3;
- (void)setFieldDetector:(id)a3;
- (void)setInServiceMode:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPaymentSessionQueue:(id)a3;
- (void)setPerformedFirstActivation:(BOOL)a3;
- (void)setRequireFirstInQueue:(BOOL)a3;
- (void)setVasPasses:(id)a3;
@end

@implementation NPKQuickPaymentSession

+ (NPKQuickPaymentSession)sessionWithQueue:(id)a3
{
  id v3 = a3;
  v4 = off_2644D0CB0;
  if ((NPKIsRunningInUIOnlyDemoMode() & 1) == 0 && !NPKIsRunningInStoreDemoMode()) {
    v4 = off_2644D19B8;
  }
  v5 = (void *)[objc_alloc(*v4) initWithQueue:v3];

  return (NPKQuickPaymentSession *)v5;
}

+ (id)_outstandingSessionHashTable
{
  if (_outstandingSessionHashTable_onceToken != -1) {
    dispatch_once(&_outstandingSessionHashTable_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_outstandingSessionHashTable_hashTable;
  return v2;
}

void __54__NPKQuickPaymentSession__outstandingSessionHashTable__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  v1 = (void *)_outstandingSessionHashTable_hashTable;
  _outstandingSessionHashTable_hashTable = v0;
}

+ (BOOL)hasOutstandingSessions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [a1 _outstandingSessionHashTable];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v7 = pk_Payment_log();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

        if (v8)
        {
          v9 = pk_Payment_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = [v6 isDeactivated];
            *(_DWORD *)buf = 138412546;
            v17 = v6;
            __int16 v18 = 1024;
            int v19 = v10;
            _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: session: %@ deactivated %d", buf, 0x12u);
          }
        }
        if (v6 && ![v6 isDeactivated])
        {
          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v3;
}

+ (void)_handleNewContactlessSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling new contactless session: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v8 = [a1 _outstandingSessionHashTable];
  [v8 addObject:v4];
}

- (NPKQuickPaymentSession)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKQuickPaymentSession;
  BOOL v6 = [(NPKQuickPaymentSession *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("NPKQuickPaymentSessionInternalQueue", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("NPKQuickPaymentSessionQueue", v7);
    paymentSessionQueue = v6->_paymentSessionQueue;
    v6->_paymentSessionQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v6->_requireFirstInQueue = 1;
    v6->_endSessionWhenAuthorizationIsConsumed = 1;
    atomic_store(0, &v6->_atomicIsSwitchingSessionTypeCount);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(NPKQuickPaymentSession *)self contactlessSession];
  uint64_t v5 = [v4 lifecycleState];

  if (v5 != 2)
  {
    BOOL v6 = [(NPKQuickPaymentSession *)self contactlessSession];
    [v6 invalidateSessionWithCompletion:&__block_literal_global_105_0];
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v7.receiver = self;
  v7.super_class = (Class)NPKQuickPaymentSession;
  [(NPKQuickPaymentSession *)&v7 dealloc];
}

void __33__NPKQuickPaymentSession_dealloc__block_invoke()
{
  uint64_t v0 = pk_Payment_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    id v2 = pk_Payment_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_DEFAULT, "Warning: Quick payment session: invalidated session we left open", v3, 2u);
    }
  }
}

- (BOOL)startSession
{
  return [(NPKQuickPaymentSession *)self startSessionWithCompletion:0];
}

- (BOOL)isSwitchingSessionType
{
  unsigned int v2 = atomic_load(&self->_atomicIsSwitchingSessionTypeCount);
  return v2 != 0;
}

- (BOOL)startSessionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  [(id)objc_opt_class() _handleNewContactlessSession:self];
  paymentSessionQueue = self->_paymentSessionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke;
  block[3] = &unk_2644D5050;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(paymentSessionQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_2;
  v5[3] = &unk_2644D5028;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:", v5);
}

void __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
  kdebug_trace();
  unsigned int v2 = [*(id *)(a1 + 32) currentPass];
  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
  }
  if ([*(id *)(a1 + 32) inServiceMode])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 64);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_3;
    block[3] = &unk_2644D2910;
    block[4] = v3;
    dispatch_async(v4, block);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
}

uint64_t __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enablePersistentCardEmulation");
}

- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    dispatch_queue_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Authorizing ISO18013 Request with dataToRelease:%@ credential:%@", buf, 0x16u);
    }
  }
  uint64_t v11 = [(NPKQuickPaymentSession *)self paymentSessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__NPKQuickPaymentSession_authorize18013RequestWithDataToRelease_credential___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);
}

void __76__NPKQuickPaymentSession_authorize18013RequestWithDataToRelease_credential___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactlessSession];
  [v2 authorize18013RequestWithDataToRelease:*(void *)(a1 + 40) credential:*(void *)(a1 + 48)];
}

- (void)executeRKEActionForPass:(id)a3 function:(id)a4 action:(id)a5 withCompletion:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  dispatch_queue_t v10 = (char *)a3;
  uint64_t v11 = (char *)a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x223C37380](v13);
      *(_DWORD *)buf = 138413058;
      v29 = v10;
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v12;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Executing RKE action for pass:%@ function:%@ action:%@ with completion:%@", buf, 0x2Au);
    }
  }
  if ([(NPKQuickPaymentSession *)self requireFirstInQueue])
  {
    id v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      id v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v29 = "-[NPKQuickPaymentSession executeRKEActionForPass:function:action:withCompletion:]";
        __int16 v30 = 2082;
        v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKQuickPaymentSession.m";
        __int16 v32 = 2048;
        uint64_t v33 = 233;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: We don't need to require first in queue when executing RKE actions.)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke;
  v24[3] = &unk_2644D50C8;
  v24[4] = self;
  v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v21 = v13;
  id v22 = v12;
  v23 = v11;
  [(NPKQuickPaymentSession *)self startSessionWithCompletion:v24];
}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 64);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_2;
    v7[3] = &unk_2644D3540;
    v7[4] = v3;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    dispatch_async(v4, v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactlessSession];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_3;
  v5[3] = &unk_2644D50A0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  [v2 sendRKEFunction:v3 action:v4 withAuthorization:0 completion:v5];
}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_4;
  v4[3] = &unk_2644D5078;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)setCurrentPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueID];
      *(_DWORD *)buf = 138412290;
      char v14 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment session: setting current pass to %@", buf, 0xCu);
    }
  }
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke;
  v11[3] = &unk_2644D2E08;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(internalQueue, v11);
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) uniqueID];
  uint64_t v3 = [*(id *)(a1 + 40) uniqueID];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*(id *)(a1 + 40) uniqueID];
        id v9 = [*(id *)(*(void *)(a1 + 32) + 32) uniqueID];
        *(_DWORD *)buf = 138412546;
        *(void *)v37 = v8;
        *(_WORD *)&v37[8] = 2112;
        *(void *)&v37[10] = v9;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment session: new pass: (%@) is same as current pass in session (%@), returning.", buf, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v10 = NPKQuickPaymentSessionTypeForPass(*(void **)(*(void *)(a1 + 32) + 32));
    unint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v12 = NPKQuickPaymentSessionTypeForPass(*(void **)(a1 + 40));
    unint64_t v13 = v12;
    if (*(void *)(a1 + 40))
    {
      BOOL v16 = v10 != 1 || v11 != 1 || v11 != v12;
      if (*(void *)(*(void *)(a1 + 32) + 96)) {
        BOOL v17 = v16;
      }
      else {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
    id v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      id v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = NSStringFromNPKQuickPaymentSessionType(v10);
        id v22 = NSStringFromNPKQuickPaymentSessionType(v11);
        v23 = NSStringFromNPKQuickPaymentSessionType(v13);
        uint64_t v24 = *(void *)(a1 + 40);
        BOOL v25 = *(void *)(*(void *)(a1 + 32) + 96) != 0;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v37 = v17;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v21;
        *(_WORD *)&v37[14] = 2112;
        *(void *)&v37[16] = v22;
        __int16 v38 = 2112;
        v39 = v23;
        __int16 v40 = 2112;
        uint64_t v41 = v24;
        __int16 v42 = 1024;
        BOOL v43 = v25;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Needs to refresh session:%d, current pass sessionType:%@ current session:%@ expected:%@ currentPass:%@ hasContactLessSession:%d", buf, 0x36u);
      }
    }
    id v26 = *(atomic_uint **)(a1 + 32);
    if (v17)
    {
      unsigned int add = atomic_fetch_add(v26 + 4, 1u);
      *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
      v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        __int16 v30 = pk_Payment_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [*(id *)(a1 + 40) uniqueID];
          *(_DWORD *)buf = 138412546;
          *(void *)v37 = v31;
          *(_WORD *)&v37[8] = 2048;
          *(void *)&v37[10] = add + 1;
          _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: refreshing session for pass with uniqueID:%@ count:%lu", buf, 0x16u);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 96) setDelegate:0];
      objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateSessionWithCompletion:", &__block_literal_global_112);
      objc_msgSend(*(id *)(a1 + 32), "_internalQueue_setCurrentPass:", *(void *)(a1 + 40));
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v33 = *(NSObject **)(v32 + 64);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_113;
      v34[3] = &unk_2644D2E08;
      v34[4] = v32;
      id v35 = *(id *)(a1 + 40);
      dispatch_async(v33, v34);
    }
    else
    {
      [(atomic_uint *)v26 _internalQueue_setCurrentPass:*(void *)(a1 + 40)];
    }
  }
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_110()
{
  uint64_t v0 = pk_Payment_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    id v2 = pk_Payment_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_DEFAULT, "Notice: Old session deactivated", v3, 2u);
    }
  }
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_113(uint64_t a1)
{
  BOOL v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_2;
  v2[3] = &unk_2644D2E08;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:", v2);
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 16), 0xFFFFFFFF);
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = add - 1;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: finish refresh session count:%lu", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
  }
}

- (void)_internalQueue_setCurrentPass:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = (PKPass *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  currentPass = self->_currentPass;
  objc_storeStrong((id *)&self->_currentPass, a3);
  if (currentPass != v5)
  {
    unint64_t v7 = NPKQuickPaymentSessionTypeForPass(v5);
    if ([(NPKQuickPaymentSession *)self sessionStarted])
    {
      if (v7 != self->_sessionType)
      {
        uint64_t v8 = pk_General_log();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

        if (v9)
        {
          unint64_t v10 = pk_General_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            unint64_t v11 = NSStringFromNPKQuickPaymentSessionType(v7);
            uint64_t v12 = NSStringFromNPKQuickPaymentSessionType(self->_sessionType);
            *(_DWORD *)buf = 138412802;
            id v21 = v11;
            __int16 v22 = 2112;
            v23 = v5;
            __int16 v24 = 2112;
            BOOL v25 = v12;
            _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: expected session type:%@ for pass:%@, current session type:%@ doesn't match. Expect bad thing to happen.", buf, 0x20u);
          }
        }
      }
    }
    callbackQueue = self->_callbackQueue;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    BOOL v16 = __56__NPKQuickPaymentSession__internalQueue_setCurrentPass___block_invoke;
    BOOL v17 = &unk_2644D2E08;
    id v18 = self;
    BOOL v19 = v5;
    dispatch_async(callbackQueue, &v14);
    if (self->_contactlessSession) {
      [(NPKQuickPaymentSession *)self _internalQueue_updateSessionWithCurrentPassAndLoyaltyState];
    }
  }
}

void __56__NPKQuickPaymentSession__internalQueue_setCurrentPass___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) didMakePassCurrent:*(void *)(a1 + 40)];
  }
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setVasPasses:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NPKQuickPaymentSession_setVasPasses___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void *__39__NPKQuickPaymentSession_setVasPasses___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t result = *(void **)(a1 + 32);
  if (result[12])
  {
    return objc_msgSend(result, "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
  }
  return result;
}

- (void)setCredential:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: requested to set credential:%@", buf, 0xCu);
    }
  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__NPKQuickPaymentSession_setCredential___block_invoke;
  v10[3] = &unk_2644D2E08;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  dispatch_async(internalQueue, v10);
}

void __40__NPKQuickPaymentSession_setCredential___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: setting credential:%@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v6 + 24))
  {
    [(id)v6 _updateSessionWithCredentialAndActivate];
    uint64_t v6 = *(void *)(a1 + 40);
  }
  unint64_t v7 = *(NSObject **)(v6 + 80);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NPKQuickPaymentSession_setCredential___block_invoke_116;
  block[3] = &unk_2644D2910;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __40__NPKQuickPaymentSession_setCredential___block_invoke_116(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: paymentSessionDidReceiveCredential callback", v8, 2u);
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 paymentSessionDidReceiveCredential:*(void *)(a1 + 32)];
  }
}

- (void)confirmSessionExpectingCredential:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__NPKQuickPaymentSession_confirmSessionExpectingCredential___block_invoke;
  v4[3] = &unk_2644D2938;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __60__NPKQuickPaymentSession_confirmSessionExpectingCredential___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = 1;
  if (!v2 && (*(void *)(*(void *)(result + 32) + 8) || !*(unsigned char *)(result + 40))) {
    return [*(id *)(result + 32) _updateSessionWithCredentialAndActivate];
  }
  return result;
}

- (NSDictionary)vasPasses
{
  return self->_vasPasses;
}

- (void)setDeferAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"no";
      if (v3) {
        id v8 = @"yes";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v13 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Setting defer authorization on quick payment session: %@", buf, 0xCu);
    }
  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__NPKQuickPaymentSession_setDeferAuthorization___block_invoke;
  v10[3] = &unk_2644D2938;
  void v10[4] = self;
  BOOL v11 = v3;
  dispatch_sync(internalQueue, v10);
}

void __48__NPKQuickPaymentSession_setDeferAuthorization___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 128);
  if (*(unsigned char *)(a1 + 40))
  {
    if (v2) {
      return;
    }
    id v4 = objc_alloc_init(MEMORY[0x263F5BE98]);
    uint64_t v5 = *(void *)(a1 + 32);
    int v2 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;
  }
  else
  {
    if (!v2) {
      return;
    }
    *(void *)(v1 + 128) = 0;
  }
}

- (BOOL)deferAuthorization
{
  return self->_deferAuthorization;
}

- (BOOL)sessionStarted
{
  return self->_contactlessSession != 0;
}

- (void)setInServiceMode:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke;
  v4[3] = &unk_2644D2938;
  BOOL v5 = a3;
  void v4[4] = self;
  dispatch_sync(internalQueue, v4);
}

void __43__NPKQuickPaymentSession_setInServiceMode___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 22))
  {
    *(unsigned char *)(v2 + 22) = v1;
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(NSObject **)(v3 + 64);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_2;
      block[3] = &unk_2644D2910;
      block[4] = v3;
      dispatch_async(v4, block);
    }
    else
    {
      BOOL v5 = pk_Payment_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        unint64_t v7 = pk_Payment_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Cannot disable persistent card emulation on a session!", v8, 2u);
        }
      }
    }
  }
}

void __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enablePersistentCardEmulation"))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_3;
    block[3] = &unk_2644D2910;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  else
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v7 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Failed to enable service mode!", v7, 2u);
      }
    }
  }
}

uint64_t __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
}

- (void)_updateSessionWithCredentialAndActivate
{
  kdebug_trace();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 25);
  *(unsigned char *)(v2 + 25) = 1;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = &stru_26CFEBA18;
      if (!v3) {
        unint64_t v7 = @" (first activation)";
      }
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: updating session%@", buf, 0xCu);
    }
  }
  id v8 = [*(id *)(a1 + 32) contactlessSession];
  char v9 = [*(id *)(a1 + 32) deferAuthorization];
  uint64_t v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_132;
  v12[3] = &unk_2644D5140;
  char v14 = v3 ^ 1;
  v12[4] = v10;
  id v13 = v8;
  char v15 = v9;
  id v11 = v8;
  objc_msgSend(v10, "_internalQueue_getContactlessAndAuthorizationValidityAndPerformWork:", v12);
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_132(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(NSObject **)(v6 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_2;
    block[3] = &unk_2644D2910;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_3;
  v11[3] = &unk_2644D5118;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  char v16 = *(unsigned char *)(a1 + 49);
  dispatch_async(v8, v11);
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    id v4 = *(void **)(a1 + 32);
    BOOL v5 = [v4 currentPass];
    [v6 paymentSession:v4 willActivatePass:v5];
  }
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  char v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v2;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Confirm or renew quick payment session state is %u", buf, 8u);
    }
  }
  if ((unint64_t)(v2 - 1) <= 1) {
    objc_msgSend(*(id *)(a1 + 40), "_checkContactlessValidity:authorizationValidity:performWork:");
  }
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_135(uint64_t a1, int a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    BOOL v4 = [v3 contactlessSession];
    BOOL v5 = [v4 activatedPaymentApplications];
    uint64_t v6 = objc_msgSend(v3, "_sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:", objc_msgSend(v5, "count") != 0, *(unsigned __int8 *)(a1 + 48));

    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = [v8 currentPass];
    objc_msgSend(v8, "_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:invokeOnSuccess:contactlessValidity:forPass:", v6, 1, v7, v9);
  }
}

- (void)deactivateSessionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: deactivating session", buf, 2u);
    }
  }
  *(void *)buf = 0;
  char v16 = buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = [(NPKQuickPaymentSession *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke;
  block[3] = &unk_2644D5050;
  uint64_t v14 = buf;
  block[4] = self;
  id v9 = v4;
  id v13 = v9;
  dispatch_sync(v8, block);

  if (!v16[24])
  {
    callbackQueue = self->_callbackQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke_2;
    v11[3] = &unk_2644D2910;
    void v11[4] = self;
    dispatch_async(callbackQueue, v11);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDeactivating]) {
    char v2 = 1;
  }
  else {
    char v2 = [*(id *)(a1 + 32) isDeactivated];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return objc_msgSend(v3, "_internalQueue_deactivateSessionWithCompletion:", v4);
}

uint64_t __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 1, 0, 1);
}

- (void)_internalQueue_deactivateSessionWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NPKQuickPaymentSession *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v13 = [(NPKQuickPaymentSession *)self isDeactivating];
      __int16 v14 = 1024;
      BOOL v15 = [(NPKQuickPaymentSession *)self isDeactivated];
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Deactivate quick payment session: deactivating %d deactivated %d", buf, 0xEu);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke;
  v10[3] = &unk_2644D5168;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(NPKQuickPaymentSession *)self _internalQueue_updateContactlessValidityAndPerformWork:v10];
}

void __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) contactlessSession];
  char v3 = [*(id *)(a1 + 32) contactlessSessionHandle];
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) deactivationCompletionBlocks];

    if (!v4)
    {
      BOOL v5 = [MEMORY[0x263EFF980] array];
      [*(id *)(a1 + 32) setDeactivationCompletionBlocks:v5];
    }
    BOOL v6 = [*(id *)(a1 + 32) deactivationCompletionBlocks];
    BOOL v7 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
    [v6 addObject:v7];
  }
  if (([*(id *)(a1 + 32) isDeactivating] & 1) == 0)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2;
    v17[3] = &unk_2644D2E08;
    v17[4] = *(void *)(a1 + 32);
    id v8 = v2;
    id v18 = v8;
    id v9 = (void *)MEMORY[0x223C37380](v17);
    kdebug_trace();
    if (v8)
    {
      uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 64);
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      BOOL v13 = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2_139;
      __int16 v14 = &unk_2644D2E58;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(v10, &v11);
    }
    else
    {
      [v3 invalidateSessionWithCompletion:v9];
    }
    objc_msgSend(*(id *)(a1 + 32), "setContactlessSessionHandle:", 0, v11, v12, v13, v14);
    [*(id *)(a1 + 32) setContactlessSession:0];
    [*(id *)(a1 + 32) setFieldDetector:0];
    [*(id *)(a1 + 32) setDeactivating:1];
  }
}

void __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  char v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deactivate quick payment session: underlying session deactivated", buf, 2u);
    }
  }
  BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_138;
  v8[3] = &unk_2644D2E08;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  dispatch_async(v5, v8);
}

uint64_t __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_138(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 40) setDeactivating:0];
  [*(id *)(a1 + 40) setDeactivated:1];
  char v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "_internalQueue_invokeDeactivationCompletionBlocks");
}

uint64_t __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2_139(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateSessionWithCompletion:*(void *)(a1 + 40)];
}

- (void)_internalQueue_updateContactlessSessionForPass:(id)a3 vasPasses:(id)a4 deferAuthorization:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [v8 uniqueID];
      __int16 v14 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_143);
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      __int16 v24 = 2112;
      BOOL v25 = v14;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Internal queue: updating contactless session for pass %@ auto-select VAS passes %@", buf, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_147;
  v17[3] = &unk_2644D51E0;
  id v18 = v8;
  BOOL v19 = self;
  id v20 = v9;
  BOOL v21 = a5;
  id v15 = v9;
  id v16 = v8;
  [(NPKQuickPaymentSession *)self _internalQueue_updateContactlessValidityAndPerformWork:v17];
}

id __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke(uint64_t a1, void *a2)
{
  char v2 = NSString;
  id v3 = a2;
  id v4 = [v3 passTypeIdentifier];
  BOOL v5 = [v3 uniqueID];

  id v6 = [v2 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_147(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) paymentPass];
  BOOL v5 = [v4 npkPreferredContactlessPaymentApplications];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(NSObject **)(v6 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_2;
  v9[3] = &unk_2644D51B8;
  v9[4] = v6;
  uint64_t v13 = a2;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 56);
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_3;
  v8[3] = &unk_2644D5190;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  id v12 = v6;
  uint64_t v13 = v7;
  [v3 _checkContactlessValidity:v2 performWork:v8];
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) paymentPass];
    if (!v3
      || ([*(id *)(a1 + 32) paymentPass],
          id v4 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v4 contactlessActivationState],
          v4,
          v3,
          !v5))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(NSObject **)(v6 + 80);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_4;
      block[3] = &unk_2644D2E08;
      block[4] = v6;
      id v28 = *(id *)(a1 + 32);
      dispatch_async(v7, block);
    }
    uint64_t v23 = 0;
    __int16 v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(NSObject **)(v8 + 72);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_5;
    v22[3] = &unk_2644D2960;
    v22[4] = v8;
    v22[5] = &v23;
    dispatch_sync(v9, v22);
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "_sessionQueue_updateContactlessSessionForPass:paymentApplications:vasPasses:sessionConfirmed:deferAuthorization:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *((unsigned __int8 *)v24 + 24), *(unsigned __int8 *)(a1 + 72));
    id v11 = [*(id *)(a1 + 40) contactlessSession];
    id v12 = [v11 activatedPaymentApplications];
    if ([v12 count])
    {
      BOOL v13 = 1;
    }
    else
    {
      char v14 = [*(id *)(a1 + 40) contactlessSession];
      id v15 = [v14 activatedValueAddedServicePasses];
      BOOL v13 = [v15 count] != 0;
    }
    id v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      id v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *((unsigned __int8 *)v24 + 24);
        *(_DWORD *)buf = 67109632;
        int v30 = v10;
        __int16 v31 = 1024;
        BOOL v32 = v13;
        __int16 v33 = 1024;
        int v34 = v19;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Internal queue update contactless session: success %d now activated %d session confirmed %d", buf, 0x14u);
      }

      id v20 = *(void **)(a1 + 40);
      if (!v13) {
        goto LABEL_12;
      }
    }
    else
    {
      id v20 = *(void **)(a1 + 40);
      if (!v13)
      {
LABEL_12:
        BOOL v21 = 0;
LABEL_15:
        objc_msgSend(v20, "_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:invokeOnSuccess:contactlessValidity:forPass:", v10, v21, *(void *)(a1 + 64), *(void *)(a1 + 32));
        _Block_object_dispose(&v23, 8);
        return;
      }
    }
    BOOL v21 = *((unsigned char *)v24 + 24) != 0;
    goto LABEL_15;
  }
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSession:*(void *)(a1 + 32) willActivatePass:*(void *)(a1 + 40)];
  }
}

uint64_t __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConfirmed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_sessionQueue_updateContactlessSessionForPass:(id)a3 paymentApplications:(id)a4 vasPasses:(id)a5 sessionConfirmed:(BOOL)a6 deferAuthorization:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = pk_Payment_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    BOOL v17 = pk_Payment_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v12 uniqueID];
      int v19 = objc_msgSend(v14, "pk_arrayByApplyingBlock:", &__block_literal_global_149);
      id v20 = [(NPKQuickPaymentSession *)self contactlessSession];
      *(_DWORD *)buf = 138412802;
      v53 = v18;
      __int16 v54 = 2112;
      *(void *)v55 = v19;
      *(_WORD *)&v55[8] = 2112;
      v56 = v20;
      _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Session queue update contactless session: pass %@ auto-select VAS passes %@ (session %@)", buf, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  BOOL v21 = [v12 paymentPass];
  __int16 v22 = [(NPKQuickPaymentSession *)self contactlessSession];

  if (!v22)
  {
    LOBYTE(v26) = 1;
    goto LABEL_38;
  }
  uint64_t v23 = (void *)MEMORY[0x263EFFA68];
  if (v14) {
    uint64_t v23 = v14;
  }
  id v24 = v23;
  BOOL v47 = v7;
  if (!v12) {
    goto LABEL_15;
  }
  if (!v21)
  {
    id v27 = [v12 nfcPayload];

    if (v27)
    {
      id v51 = v12;
      uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];

      id v25 = 0;
      id v24 = (id)v28;
      goto LABEL_16;
    }
LABEL_15:
    id v25 = 0;
    goto LABEL_16;
  }
  if ([v21 contactlessActivationState]) {
    goto LABEL_15;
  }
  id v25 = v13;
LABEL_16:
  BOOL v29 = pk_Payment_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    __int16 v31 = pk_Payment_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v32 = objc_msgSend(v24, "pk_arrayByApplyingBlock:", &__block_literal_global_153);
      *(_DWORD *)buf = 138412290;
      v53 = v32;
      _os_log_impl(&dword_21E92F000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Using VAS passes when updating contactless session: %@", buf, 0xCu);
    }
  }
  id v48 = v12;
  BOOL v49 = v8;
  id v50 = v14;
  id v33 = v13;
  kdebug_trace();
  int v34 = [(NPKQuickPaymentSession *)self contactlessSession];
  uint64_t v35 = [v34 activatedValueAddedServicePasses];
  char v36 = PKEqualObjects();

  id v37 = v24;
  if (v36) {
    int v38 = 1;
  }
  else {
    int v38 = [v34 activateValueAddedServicePasses:v24];
  }
  if ([v25 count]) {
    v39 = v21;
  }
  else {
    v39 = 0;
  }
  int v40 = [v34 activatePaymentApplications:v25 forPaymentPass:v39];
  kdebug_trace();
  uint64_t v41 = pk_Payment_log();
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

  if (v42)
  {
    BOOL v43 = pk_Payment_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v53 = v34;
      __int16 v54 = 1024;
      *(_DWORD *)v55 = v38;
      *(_WORD *)&v55[4] = 1024;
      *(_DWORD *)&v55[6] = v40;
      LOWORD(v56) = 1024;
      *(_DWORD *)((char *)&v56 + 2) = v49;
      _os_log_impl(&dword_21E92F000, v43, OS_LOG_TYPE_DEFAULT, "Notice: Session queue update contactless session::%@ VAS success %d payment success %d session confirmed %d", buf, 0x1Eu);
    }
  }
  int v26 = v38 | v40;
  id v13 = v33;
  if (v26 == 1)
  {
    id v14 = v50;
    uint64_t v44 = v37;
    id v12 = v48;
    if (v49)
    {
      if ([v25 count] || objc_msgSend(v44, "count"))
      {
        v45 = [v34 activatedPaymentApplications];
        LOBYTE(v26) = -[NPKQuickPaymentSession _sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:](self, "_sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:", [v45 count] != 0, v47);
      }
      else
      {
        LOBYTE(v26) = 1;
      }
    }
  }
  else
  {
    id v14 = v50;
    uint64_t v44 = v37;
    id v12 = v48;
  }

LABEL_38:
  return v26;
}

uint64_t __138__NPKQuickPaymentSession__sessionQueue_updateContactlessSessionForPass_paymentApplications_vasPasses_sessionConfirmed_deferAuthorization___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __138__NPKQuickPaymentSession__sessionQueue_updateContactlessSessionForPass_paymentApplications_vasPasses_sessionConfirmed_deferAuthorization___block_invoke_151(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

- (void)_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:(BOOL)a3 invokeOnSuccess:(BOOL)a4 contactlessValidity:(unint64_t)a5 forPass:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      BOOL v22 = v8;
      __int16 v23 = 1024;
      BOOL v24 = v7;
      __int16 v25 = 1024;
      int v26 = a5;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Invoking callback for activation: success %d invokeOnSuccess %d contactlessValidity %u pass %@", buf, 0x1Eu);
    }
  }
  callbackQueue = self->_callbackQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke;
  v16[3] = &unk_2644D5230;
  BOOL v19 = v8;
  BOOL v20 = v7;
  id v17 = v10;
  unint64_t v18 = a5;
  v16[4] = self;
  id v15 = v10;
  dispatch_async(callbackQueue, v16);
}

void __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 56);
  if (v1)
  {
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v2 = *(void **)(a1 + 32);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke_2;
      v6[3] = &unk_2644D5208;
      char v8 = v1;
      v6[4] = v2;
      uint64_t v3 = *(void *)(a1 + 48);
      id v7 = *(id *)(a1 + 40);
      [v2 _checkContactlessValidity:v3 performWork:v6];
    }
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 endSessionWhenAuthorizationIsConsumed];
    objc_msgSend(v4, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, v5);
  }
}

void __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v3 = [*(id *)(a1 + 32) delegate];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = [*(id *)(a1 + 32) delegate];
        [v5 paymentSession:*(void *)(a1 + 32) didActivatePass:*(void *)(a1 + 40)];
      }
    }
  }
}

- (BOOL)_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Starting contactless session on session queue", buf, 2u);
    }
  }
  char v8 = dispatch_group_create();
  *(void *)buf = 0;
  v52 = buf;
  uint64_t v53 = 0x3032000000;
  __int16 v54 = __Block_byref_object_copy__11;
  v55 = __Block_byref_object_dispose__11;
  id v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__11;
  v49[4] = __Block_byref_object_dispose__11;
  id v50 = 0;
  dispatch_group_enter(v8);
  dispatch_group_enter(v8);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke;
  v45[3] = &unk_2644D5258;
  BOOL v47 = buf;
  id v48 = v49;
  id v9 = v8;
  v46 = v9;
  id v10 = (void *)MEMORY[0x223C37380](v45);
  id v11 = dispatch_get_global_queue(33, 0);
  switch(NPKQuickPaymentSessionTypeForPass(self->_currentPass))
  {
    case 1:
      goto LABEL_10;
    case 2:
      id v17 = [MEMORY[0x263F5C0B0] startDigitalCarKeySessionWithCompletion:v10 targetQueue:v11];
      unint64_t v18 = 2;
      break;
    case 3:
      id v17 = [MEMORY[0x263F5C0B0] startSTSContactlessInterfaceSessionWithDelegate:self completion:v10];
      unint64_t v18 = 3;
      break;
    default:
      BOOL v12 = pk_General_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        id v14 = pk_General_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = NSStringFromNPKQuickPaymentSessionType(0);
          currentPass = self->_currentPass;
          *(_DWORD *)uint64_t v57 = 138412802;
          v58 = v15;
          __int16 v59 = 2112;
          v60 = @"NPKQuickPaymentSessionContactlessType";
          __int16 v61 = 2112;
          v62 = currentPass;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: falling back from session type:%@ to:%@ for pass:%@.", v57, 0x20u);
        }
      }
LABEL_10:
      id v17 = [MEMORY[0x263F5C0B0] startContactlessInterfaceSessionWithCompletion:v10 targetQueue:v11];
      unint64_t v18 = 1;
      break;
  }
  self->_sessionType = v18;
  BOOL v19 = pk_General_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    BOOL v21 = pk_General_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKQuickPaymentSessionType(v18);
      BOOL v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __int16 v23 = self->_currentPass;
      *(_DWORD *)uint64_t v57 = 138412802;
      v58 = v17;
      __int16 v59 = 2112;
      v60 = v22;
      __int16 v61 = 2112;
      v62 = v23;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Obtain session handler:%@ for sessionType:%@ pass:%@", v57, 0x20u);
    }
  }
  int v24 = [v17 isFirstInQueue];
  int v25 = ![(NPKQuickPaymentSession *)self requireFirstInQueue] | v24;
  if (v25 == 1)
  {
    if ((v24 & 1) == 0)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_158;
      block[3] = &unk_2644D2910;
      block[4] = self;
      dispatch_async(callbackQueue, block);
    }
    internalQueue = self->_internalQueue;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2;
    v42[3] = &unk_2644D2E08;
    v42[4] = self;
    id v43 = v17;
    dispatch_sync(internalQueue, v42);
  }
  else
  {
    id v28 = pk_Payment_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      BOOL v30 = pk_Payment_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v57 = 0;
        _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Was not first in queue; tearing down and invalidating session",
          v57,
          2u);
      }
    }
    [v17 invalidateSession];
    __int16 v31 = self->_internalQueue;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_161;
    v41[3] = &unk_2644D2910;
    v41[4] = self;
    dispatch_sync(v31, v41);
  }
  dispatch_group_leave(v9);
  BOOL v32 = [(NPKQuickPaymentSession *)self internalQueue];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2_162;
  v35[3] = &unk_2644D5280;
  char v39 = v25;
  char v40 = v24;
  v35[4] = self;
  id v36 = v4;
  id v37 = buf;
  int v38 = v49;
  id v33 = v4;
  dispatch_group_notify(v9, v32, v35);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(buf, 8);

  return v25;
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_158(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionIsWaitingToStart:*(void *)(a1 + 32)];
  }
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContactlessSessionHandle:*(void *)(a1 + 40)];
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_161(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeactivating:1];
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2_162(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 64))
    {
      objc_msgSend(v2, "setContactlessSession:");
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
      if (!*(unsigned char *)(a1 + 65))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        id v4 = *(NSObject **)(v3 + 80);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_3;
        block[3] = &unk_2644D2910;
        block[4] = v3;
        dispatch_async(v4, block);
      }
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        (*(void (**)(void))(v5 + 16))();
      }
    }
    else
    {
      objc_msgSend(v2, "_internalQueue_deactivateSessionWithCompletion:", 0);
    }
  }
  else
  {
    id v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      char v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: No contactless session; marking as deactivated (error: %@)",
          buf,
          0xCu);
      }
    }
    [*(id *)(a1 + 32) setContactlessSession:0];
    [*(id *)(a1 + 32) setContactlessSessionHandle:0];
    [*(id *)(a1 + 32) setFieldDetector:0];
    [*(id *)(a1 + 32) setDeactivating:0];
    [*(id *)(a1 + 32) setDeactivated:1];
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(NSObject **)(v10 + 80);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_165;
      v12[3] = &unk_2644D2910;
      v12[4] = v10;
      dispatch_async(v11, v12);
    }
  }
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidStart:*(void *)(a1 + 32)];
  }
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, 1);
}

- (BOOL)_sessionQueue_enablePersistentCardEmulation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  char v3 = [(NPKQuickPaymentSession *)self contactlessSession];

  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Enabling persistent card emulation", buf, 2u);
      }
    }
    BOOL v7 = [(NPKQuickPaymentSession *)self contactlessSession];
    char v8 = [v7 queuePersistentCardEmulation];
  }
  else
  {
    if (!v5) {
      return 1;
    }
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: No contactless session; not yet enabling persistent card emulation",
        v10,
        2u);
    }
    char v8 = 1;
  }

  return v8;
}

- (BOOL)_sessionQueue_authorizeWithUseCredential:(BOOL)a3 deferAuthorizationIfCredentialUsed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__11;
  BOOL v29 = __Block_byref_object_dispose__11;
  id v30 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (a3)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__NPKQuickPaymentSession__sessionQueue_authorizeWithUseCredential_deferAuthorizationIfCredentialUsed___block_invoke;
    block[3] = &unk_2644D52A8;
    block[4] = self;
    void block[5] = &v25;
    block[6] = v24;
    block[7] = &v20;
    BOOL v19 = a4;
    dispatch_sync(internalQueue, block);
    if (*((unsigned char *)v21 + 24))
    {
      if (!v26[5] && self->_sessionType == 1)
      {
        char v8 = pk_Payment_log();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

        if (v9)
        {
          uint64_t v10 = pk_Payment_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: No credential to activate: setting deferAuthorization to NO to present VAS pass", buf, 2u);
          }
        }
        BOOL v4 = 0;
      }
    }
  }
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    BOOL v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v26[5];
      *(_DWORD *)buf = 67109634;
      BOOL v32 = v4;
      __int16 v33 = 1024;
      BOOL v34 = v5;
      __int16 v35 = 2112;
      uint64_t v36 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Authorizing deferred authorization: %d use credential: %d credential: %@", buf, 0x18u);
    }
  }
  kdebug_trace();
  uint64_t v15 = [(NPKQuickPaymentSession *)self contactlessSession];
  char v16 = [v15 authorizeAndStartCardEmulationWithCredential:v26[5] deferAuthorization:v4];

  kdebug_trace();
  [(NPKQuickPaymentSession *)self _updateAuthorizationValidity];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __102__NPKQuickPaymentSession__sessionQueue_authorizeWithUseCredential_deferAuthorizationIfCredentialUsed___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 40) count] != 0;
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    char v3 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
  }
}

- (void)_internalQueue_updateSessionWithCurrentPassAndLoyaltyState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  char v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: updating with current pass and loyalty state", v8, 2u);
    }
  }
  currentPass = self->_currentPass;
  BOOL v7 = [(NSDictionary *)self->_vasPasses allValues];
  [(NPKQuickPaymentSession *)self _internalQueue_updateContactlessSessionForPass:currentPass vasPasses:v7 deferAuthorization:[(NPKQuickPaymentSession *)self deferAuthorization]];
}

- (void)_internalQueue_updateContactlessValidityAndPerformWork:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v4 = v5;
  ++self->_contactlessValidity;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)_updateAuthorizationValidity
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKQuickPaymentSession__updateAuthorizationValidity__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __54__NPKQuickPaymentSession__updateAuthorizationValidity__block_invoke(uint64_t result)
{
  return result;
}

- (void)_internalQueue_getContactlessAndAuthorizationValidityAndPerformWork:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id, unint64_t, unint64_t))v5 + 2))(v5, self->_contactlessValidity, self->_authorizationValidity);
    BOOL v4 = v5;
  }
}

- (void)_checkContactlessValidity:(unint64_t)a3 performWork:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__NPKQuickPaymentSession__checkContactlessValidity_performWork___block_invoke;
    block[3] = &unk_2644D52D0;
    void block[5] = &v9;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(internalQueue, block);
    v6[2](v6, *((unsigned __int8 *)v10 + 24));
    _Block_object_dispose(&v9, 8);
  }
}

void *__64__NPKQuickPaymentSession__checkContactlessValidity_performWork___block_invoke(void *result)
{
  if (result[6] == *(void *)(result[4] + 104)) {
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_checkContactlessValidity:(unint64_t)a3 authorizationValidity:(unint64_t)a4 performWork:(id)a5
{
  char v8 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __86__NPKQuickPaymentSession__checkContactlessValidity_authorizationValidity_performWork___block_invoke;
    v10[3] = &unk_2644D52F8;
    v10[6] = a3;
    v10[7] = a4;
    void v10[4] = self;
    void v10[5] = &v11;
    dispatch_sync(internalQueue, v10);
    v8[2](v8, *((unsigned __int8 *)v12 + 24));
    _Block_object_dispose(&v11, 8);
  }
}

void *__86__NPKQuickPaymentSession__checkContactlessValidity_authorizationValidity_performWork___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (result[6] == *(void *)(v1 + 104) && result[7] == *(void *)(v1 + 112)) {
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did enter field", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  uint64_t v9 = [(NPKQuickPaymentSession *)self currentPass];
  if ([v9 style] != 8)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v10 setObject:*MEMORY[0x263F5C3D8] forKeyedSubscript:*MEMORY[0x263F5C378]];
    id v11 = v10;
    id v12 = v9;
    uint64_t v13 = v12;
    if (!v12 || !v11)
    {
LABEL_32:

      uint64_t v36 = (void *)MEMORY[0x263F5BD40];
      uint64_t v37 = *MEMORY[0x263F5C4C8];
      v41[0] = *MEMORY[0x263F5C4A8];
      v41[1] = v37;
      int v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      [v36 subjects:v38 sendEvent:v11];

      goto LABEL_33;
    }
    uint64_t v14 = [v12 passType];
    uint64_t v15 = (id *)MEMORY[0x263F5C4A0];
    if ((unint64_t)(v14 + 1) >= 3) {
      char v16 = (__CFString *)(id)*MEMORY[0x263F5C4A0];
    }
    else {
      char v16 = off_2644D53D8[v14 + 1];
    }
    [v11 setObject:v16 forKeyedSubscript:*MEMORY[0x263F5C478]];

    unint64_t v17 = [v13 style];
    if (v17 < 0xD && ((0x13FFu >> v17) & 1) != 0) {
      unint64_t v18 = off_2644D53F0[v17];
    }
    else {
      unint64_t v18 = (__CFString *)*v15;
    }
    [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C470]];

    BOOL v19 = [v13 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x263F5C458]];

    id v21 = v13;
    if ([v21 passType] == 1)
    {
      uint64_t v22 = [v21 secureElementPass];
      unint64_t v23 = [v22 cardType];
      if (v23 <= 4) {
        uint64_t v20 = (__CFString *)**((id **)&unk_2644D5458 + v23);
      }
    }
    else
    {
      uint64_t v20 = @"other";
    }

    [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x263F5C468]];
    int v24 = [v21 secureElementPass];
    if ([v24 isIdentityPass])
    {
      uint64_t v25 = [v24 identityType];
      if ((unint64_t)(v25 - 1) < 3)
      {
        int v26 = off_2644D5480[v25 - 1];
        goto LABEL_27;
      }
    }
    else if ([v24 isAccessPass])
    {
      unint64_t v27 = [v24 accessType];
      if (v27 < 7)
      {
        int v26 = off_2644D5498[v27];
        goto LABEL_27;
      }
    }
    int v26 = (__CFString *)*v15;
LABEL_27:

    [v11 setObject:v26 forKeyedSubscript:*MEMORY[0x263F5C460]];
    id v28 = [v21 secureElementPass];
    BOOL v29 = [v28 devicePaymentApplications];
    [v29 count];

    id v30 = PKAnalyticsReportSwitchToggleResultValue();

    [v11 setObject:v30 forKeyedSubscript:*MEMORY[0x263F5C340]];
    __int16 v31 = [v21 secureElementPass];
    id v32 = *v15;
    __int16 v33 = [v31 organizationName];
    if ([v33 length])
    {
      unint64_t v34 = [v31 cardType];
      if (v34 <= 4 && ((1 << v34) & 0x16) != 0)
      {
        id v35 = v33;

        id v32 = v35;
      }
    }

    [v11 setObject:v32 forKeyedSubscript:*MEMORY[0x263F5C420]];
    goto LABEL_32;
  }
LABEL_33:
}

void __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidEnterField:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSessionDidExitField:(id)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did exit field", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidExitField___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  char v8 = [(NPKQuickPaymentSession *)self currentPass];
  if ([v8 style] != 8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v9 setObject:*MEMORY[0x263F5C3E0] forKeyedSubscript:*MEMORY[0x263F5C378]];
    id v10 = v9;
    id v11 = v8;
    id v12 = v11;
    if (!v11 || !v10)
    {
LABEL_32:

      id v35 = (void *)MEMORY[0x263F5BD40];
      uint64_t v36 = *MEMORY[0x263F5C4C8];
      v40[0] = *MEMORY[0x263F5C4A8];
      v40[1] = v36;
      uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
      [v35 subjects:v37 sendEvent:v10];

      goto LABEL_33;
    }
    uint64_t v13 = [v11 passType];
    uint64_t v14 = (id *)MEMORY[0x263F5C4A0];
    if ((unint64_t)(v13 + 1) >= 3) {
      uint64_t v15 = (__CFString *)(id)*MEMORY[0x263F5C4A0];
    }
    else {
      uint64_t v15 = off_2644D53D8[v13 + 1];
    }
    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F5C478]];

    unint64_t v16 = [v12 style];
    if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0) {
      unint64_t v17 = off_2644D53F0[v16];
    }
    else {
      unint64_t v17 = (__CFString *)*v14;
    }
    [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x263F5C470]];

    unint64_t v18 = [v12 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    BOOL v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F5C458]];

    id v20 = v12;
    if ([v20 passType] == 1)
    {
      id v21 = [v20 secureElementPass];
      unint64_t v22 = [v21 cardType];
      if (v22 <= 4) {
        BOOL v19 = (__CFString *)**((id **)&unk_2644D5458 + v22);
      }
    }
    else
    {
      BOOL v19 = @"other";
    }

    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F5C468]];
    unint64_t v23 = [v20 secureElementPass];
    if ([v23 isIdentityPass])
    {
      uint64_t v24 = [v23 identityType];
      if ((unint64_t)(v24 - 1) < 3)
      {
        uint64_t v25 = off_2644D5480[v24 - 1];
        goto LABEL_27;
      }
    }
    else if ([v23 isAccessPass])
    {
      unint64_t v26 = [v23 accessType];
      if (v26 < 7)
      {
        uint64_t v25 = off_2644D5498[v26];
        goto LABEL_27;
      }
    }
    uint64_t v25 = (__CFString *)*v14;
LABEL_27:

    [v10 setObject:v25 forKeyedSubscript:*MEMORY[0x263F5C460]];
    unint64_t v27 = [v20 secureElementPass];
    id v28 = [v27 devicePaymentApplications];
    [v28 count];

    BOOL v29 = PKAnalyticsReportSwitchToggleResultValue();

    [v10 setObject:v29 forKeyedSubscript:*MEMORY[0x263F5C340]];
    id v30 = [v20 secureElementPass];
    id v31 = *v14;
    id v32 = [v30 organizationName];
    if ([v32 length])
    {
      unint64_t v33 = [v30 cardType];
      if (v33 <= 4 && ((1 << v33) & 0x16) != 0)
      {
        id v34 = v32;

        id v31 = v34;
      }
    }

    [v10 setObject:v31 forKeyedSubscript:*MEMORY[0x263F5C420]];
    goto LABEL_32;
  }
LABEL_33:
}

void __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidExitField___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidExitField:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v7 applicationIdentifier];
      uint64_t v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412546;
      unint64_t v17 = v12;
      __int16 v18 = 2112;
      BOOL v19 = v13;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did fail transaction for AID %@ and pass with unique ID %@", buf, 0x16u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __106__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 endSessionWhenAuthorizationIsConsumed];
  return objc_msgSend(v1, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, v2);
}

- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = objc_msgSend(a4, "pk_createArrayByApplyingBlock:", &__block_literal_global_174);
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412546;
      unint64_t v17 = v9;
      __int16 v18 = 2112;
      BOOL v19 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Session timed out for AID(s) %@ and pass with unique ID %@", buf, 0x16u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_175;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationIdentifier];
}

void __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_175(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 22))
  {
    uint64_t v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring timeout for service mode (should get persistent card emulation event instead)", buf, 2u);
      }
    }
  }
  else
  {
    BOOL v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_176;
    block[3] = &unk_2644D2910;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

uint64_t __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_176(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 endSessionWhenAuthorizationIsConsumed];
  return objc_msgSend(v1, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 2, 0, v2);
}

- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = objc_msgSend(a4, "pk_createArrayByApplyingBlock:", &__block_literal_global_178);
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412546;
      unint64_t v17 = v9;
      __int16 v18 = 2112;
      BOOL v19 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Session failed for AID(s) %@ and pass with unique ID %@", buf, 0x16u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_179;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationIdentifier];
}

uint64_t __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_179(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, 1);
}

- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4
{
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received Start Transaction", buf, 2u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 22))
  {
    uint64_t v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In service mode; ignoring Start Transaction",
          buf,
          2u);
      }
    }
  }
  else
  {
    BOOL v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke_180;
    block[3] = &unk_2644D2910;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

void __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke_180(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidReceiveStartTransaction:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did received ISO18013 Requests %@", buf, 0xCu);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__NPKQuickPaymentSession_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(callbackQueue, block);
}

void __92__NPKQuickPaymentSession_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 48));
    [v4 paymentSession:a1[4] didReceive18013Request:a1[5] readerAuthInfo:a1[6]];
  }
}

- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received activity timeout", buf, 2u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 22))
  {
    uint64_t v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In service mode; ignoring activity timeout",
          buf,
          2u);
      }
    }
  }
  else
  {
    BOOL v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke_185;
    block[3] = &unk_2644D2910;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

void __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke_185(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidReceiveActivityTimeout:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received Finish Transaction", (uint8_t *)&v23, 2u);
    }
  }
  id v9 = [v5 transitHistory];
  if (v9)
  {
    BOOL v10 = [v5 transaction];

    if (!v10)
    {
      __int16 v18 = pk_Payment_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        uint64_t v15 = pk_Payment_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          id v16 = "Notice: Handling truth-on-card transit transaction";
          goto LABEL_19;
        }
LABEL_20:
      }
LABEL_21:
      -[NPKQuickPaymentSession _handleTransactionCompleteWithContext:](self, "_handleTransactionCompleteWithContext:", v5, v23);
      goto LABEL_22;
    }
  }
  BOOL v11 = [v5 paymentPass];
  int v12 = [v11 isTransitPass];

  id v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    if (v14)
    {
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        id v16 = "Notice: Handling transit transaction";
LABEL_19:
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v14)
  {
    id v17 = pk_Payment_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Handling conventional transaction", (uint8_t *)&v23, 2u);
    }
  }
  [(NPKQuickPaymentSession *)self _handleConventionalTransactionWithContext:v5];
LABEL_22:
  uint64_t v20 = (void *)MEMORY[0x263F5BD40];
  uint64_t v21 = *MEMORY[0x263F5C4A8];
  uint64_t v24 = *MEMORY[0x263F5C430];
  v25[0] = *MEMORY[0x263F5C438];
  unint64_t v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [v20 subject:v21 sendEvent:v22];
}

- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidReceiveUntrustedTerminal:%@", buf, 0xCu);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  id v9 = (void *)MEMORY[0x263F5BD40];
  uint64_t v10 = *MEMORY[0x263F5C4A8];
  v18[0] = *MEMORY[0x263F5C4C8];
  v18[1] = v10;
  BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  uint64_t v12 = *MEMORY[0x263F5C360];
  v16[0] = *MEMORY[0x263F5C378];
  v16[1] = v12;
  uint64_t v13 = *MEMORY[0x263F5C370];
  v17[0] = *MEMORY[0x263F5C3F8];
  v17[1] = v13;
  BOOL v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v9 subjects:v11 sendEvent:v14];
}

uint64_t __81__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 10, 0, 1);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2048;
      unint64_t v15 = a4;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidTerminate:%@ with error code:%lu", buf, 0x16u);
    }
  }
  callbackQueue = self->_callbackQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke;
  v11[3] = &unk_2644D3160;
  void v11[4] = self;
  void v11[5] = a4;
  dispatch_async(callbackQueue, v11);
}

uint64_t __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  uint64_t v4 = 5;
  if (v2 == 2) {
    uint64_t v4 = 9;
  }
  if (v2 == 1) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = v4;
  }
  return objc_msgSend(v1, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", v5, 0, 1);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidTerminate:%@", buf, 0xCu);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, 1);
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: ended persistent card emulation with contexts: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v11 = [v6 firstObject];
  [(NPKQuickPaymentSession *)self contactlessInterfaceSession:v7 didFinishTransactionWithContext:v11];
}

- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: selected payment", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectPayment___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __70__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectPayment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidSelectPayment:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSessionDidSelectValueAddedService:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: selected VAS", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectValueAddedService___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectValueAddedService___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 paymentSessionDidSelectValueAddedService:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: failed deferred authorization", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, 1);
}

- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: has pending server request, sending timeout event", buf, 2u);
    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__NPKQuickPaymentSession_contactlessInterfaceSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __77__NPKQuickPaymentSession_contactlessInterfaceSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 2, 0, 1);
}

- (void)_handleTransactionCompleteWithContext:(id)a3
{
  id v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__NPKQuickPaymentSession__handleTransactionCompleteWithContext___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

uint64_t __64__NPKQuickPaymentSession__handleTransactionCompleteWithContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [v1 endSessionWhenAuthorizationIsConsumed];
  return objc_msgSend(v1, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 3, v2, v3);
}

- (void)_handleConventionalTransactionWithContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 paymentApplication];
  id v6 = [v4 paymentPass];
  id v7 = [v4 transaction];
  id v8 = [v4 valueAddedServicePasses];
  BOOL v9 = [v4 valueAddedServiceTransactions];
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v5 applicationIdentifier];
      id v13 = [v6 uniqueID];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      unint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 1024;
      int v30 = [v4 success];
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Transaction: %@ AID: %@ UniqueID: %@ valueAddedServiceTransactions: %@ valueAddedServicePasses: %@ success: %u", buf, 0x3Au);
    }
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v24) = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke;
  v22[3] = &unk_2644D4798;
  v22[4] = buf;
  [v9 enumerateObjectsUsingBlock:v22];
  uint64_t v14 = [v4 paymentPass];
  if ([v14 isAccessPass]) {
    int v15 = [v4 success];
  }
  else {
    int v15 = 0;
  }

  if (v7 || (*(unsigned char *)(*(void *)&buf[8] + 24) ? (int v16 = 1) : (int v16 = v15), v16 == 1))
  {
    kdebug_trace();
    [(NPKQuickPaymentSession *)self _handleTransactionCompleteWithContext:v4];
  }
  else
  {
    kdebug_trace();
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke_2;
    block[3] = &unk_2644D31B0;
    block[4] = self;
    id v20 = v9;
    id v21 = v8;
    dispatch_async(callbackQueue, block);
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 didSucceed];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    id v4 = *(void **)(a1 + 32);
    BOOL v5 = [v4 currentPass];
    [v6 paymentSession:v4 didFailTransactionForPass:v5 withValueAddedServiceTransactions:*(void *)(a1 + 40) forValueAddedServicePasses:*(void *)(a1 + 48)];
  }
}

- (void)_loyaltyEngineConfigurationChanged:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NPKQuickPaymentSession__loyaltyEngineConfigurationChanged___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __61__NPKQuickPaymentSession__loyaltyEngineConfigurationChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Loyalty engine configuration changed", v6, 2u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
}

- (void)_callbackQueue_invokeDidCompleteForReason:(unint64_t)a3 withTransactionContext:(id)a4 shouldCleanupSession:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (a3 - 1 <= 9 && ((0x39Fu >> (a3 - 1)) & 1) != 0) {
    kdebug_trace();
  }
  if (![(NPKQuickPaymentSession *)self _invokeStateUpdateForReason:a3 shouldCleanupSession:v5])
  {
    id v8 = [(NPKQuickPaymentSession *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(NPKQuickPaymentSession *)self delegate];
      [v10 paymentSession:self didCompleteTransactionForReason:a3 withTransactionContext:v11 shouldCleanupSession:v5];
    }
  }
}

- (BOOL)_invokeStateUpdateForReason:(unint64_t)a3 shouldCleanupSession:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  switch(a3)
  {
    case 2uLL:
      char v9 = [(NPKQuickPaymentSession *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v8 = [(NPKQuickPaymentSession *)self delegate];
        [v8 paymentSessionDidReceiveAuthorizationTimeout:self];
        goto LABEL_12;
      }
      break;
    case 4uLL:
      id v11 = [(NPKQuickPaymentSession *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v8 = [(NPKQuickPaymentSession *)self delegate];
        [v8 paymentSessionDidReceiveActivationError:self];
        goto LABEL_12;
      }
      break;
    case 5uLL:
      id v6 = [(NPKQuickPaymentSession *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(NPKQuickPaymentSession *)self delegate];
        [v8 paymentSessionDidReceiveTransactionError:self];
LABEL_12:

        return 1;
      }
      break;
  }
  return 0;
}

- (void)_internalQueue_invokeDeactivationCompletionBlocks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v3 = [(NPKQuickPaymentSession *)self deactivationCompletionBlocks];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__NPKQuickPaymentSession__internalQueue_invokeDeactivationCompletionBlocks__block_invoke;
  v5[3] = &unk_2644D5340;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = [(NPKQuickPaymentSession *)self deactivationCompletionBlocks];
  [v4 removeAllObjects];
}

void __75__NPKQuickPaymentSession__internalQueue_invokeDeactivationCompletionBlocks__block_invoke(uint64_t a1, void *a2)
{
}

- (NPKQuickPaymentSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKQuickPaymentSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (BOOL)requireFirstInQueue
{
  return self->_requireFirstInQueue;
}

- (void)setRequireFirstInQueue:(BOOL)a3
{
  self->_requireFirstInQueue = a3;
}

- (BOOL)inServiceMode
{
  return self->_inServiceMode;
}

- (BOOL)endSessionWhenAuthorizationIsConsumed
{
  return self->_endSessionWhenAuthorizationIsConsumed;
}

- (void)setEndSessionWhenAuthorizationIsConsumed:(BOOL)a3
{
  self->_endSessionWhenAuthorizationIsConsumed = a3;
}

- (OS_dispatch_queue)paymentSessionQueue
{
  return self->_paymentSessionQueue;
}

- (void)setPaymentSessionQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (PKPaymentSessionHandle)contactlessSessionHandle
{
  return self->_contactlessSessionHandle;
}

- (void)setContactlessSessionHandle:(id)a3
{
}

- (PKContactlessInterfaceSession)contactlessSession
{
  return self->_contactlessSession;
}

- (void)setContactlessSession:(id)a3
{
}

- (unint64_t)contactlessValidity
{
  return self->_contactlessValidity;
}

- (void)setContactlessValidity:(unint64_t)a3
{
  self->_contactlessValidity = a3;
}

- (unint64_t)authorizationValidity
{
  return self->_authorizationValidity;
}

- (void)setAuthorizationValidity:(unint64_t)a3
{
  self->_authorizationValidity = a3;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)hasPerformedFirstActivation
{
  return self->_performedFirstActivation;
}

- (void)setPerformedFirstActivation:(BOOL)a3
{
  self->_performedFirstActivation = a3;
}

- (BOOL)isDeactivating
{
  return self->_deactivating;
}

- (void)setDeactivating:(BOOL)a3
{
  self->_deactivating = a3;
}

- (BOOL)isDeactivated
{
  return self->_deactivated;
}

- (void)setDeactivated:(BOOL)a3
{
  self->_deactivated = a3;
}

- (NSMutableArray)deactivationCompletionBlocks
{
  return self->_deactivationCompletionBlocks;
}

- (void)setDeactivationCompletionBlocks:(id)a3
{
}

- (PKFieldDetector)fieldDetector
{
  return self->_fieldDetector;
}

- (void)setFieldDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetector, 0);
  objc_storeStrong((id *)&self->_deactivationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_contactlessSession, 0);
  objc_storeStrong((id *)&self->_contactlessSessionHandle, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_paymentSessionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vasPasses, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end