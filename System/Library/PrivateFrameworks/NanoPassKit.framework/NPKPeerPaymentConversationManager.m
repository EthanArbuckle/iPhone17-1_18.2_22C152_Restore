@interface NPKPeerPaymentConversationManager
+ (id)sharedInstance;
- (BOOL)recipientFoundInContacts;
- (MSConversation)activeConversation;
- (NPKPeerPaymentConversationContext)conversationContext;
- (NPKPeerPaymentConversationManager)init;
- (NPKPeerPaymentConversationManagerDelegate)delegate;
- (NSString)currentRecipientAddressLookup;
- (NSString)recipientDisplayName;
- (NSString)recipientPhoneOrEmail;
- (NSString)senderPhoneOrEmail;
- (PKPeerPaymentController)currentPeerPaymentController;
- (PKPeerPaymentRecipient)recipient;
- (PKPeerPaymentService)peerPaymentService;
- (id)_ambiguousSenderAddressErrorWithUnderlyingError:(id)a3;
- (id)_displayableErrorWithError:(id)a3;
- (id)_lockedOrRestrictedAccountErrorWithUnderlyingError:(id)a3;
- (id)_negativeBalanceErrorWithUnderlyingError:(id)a3;
- (id)_newPeerPaymentController;
- (id)_newPeerPaymentControllerWithQueue:(id)a3;
- (id)_sharedPeerPaymentWebService;
- (id)_skeletonPeerPaymentQuoteWithPeerPaymentController:(id)a3 selectedAmount:(id)a4 recipient:(id)a5;
- (id)_unknownPaymentErrorWithUnderlyingError:(id)a3;
- (void)_accountDidChange;
- (void)_internalQueue_forceLookupRecipientInformation;
- (void)_internalQueue_lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4;
- (void)_internalQueue_performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5;
- (void)_internalQueue_performRequestWithAmount:(id)a3 completion:(id)a4;
- (void)_postNotificationWithRecipient:(id)a3 error:(id)a4;
- (void)lookupRecipientInformationIfNecessary;
- (void)lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4;
- (void)performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5;
- (void)performRequestWithAmount:(id)a3 completion:(id)a4;
- (void)setActiveConversation:(id)a3;
- (void)setConversationContext:(id)a3;
- (void)setCurrentPeerPaymentController:(id)a3;
- (void)setCurrentRecipientAddressLookup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPeerPaymentService:(id)a3;
@end

@implementation NPKPeerPaymentConversationManager

- (NPKPeerPaymentConversationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)NPKPeerPaymentConversationManager;
  v2 = [(NPKPeerPaymentConversationManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    conversationContext = v2->_conversationContext;
    v2->_conversationContext = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.passkit.peerpayment.conversationmanager", 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = (PKPeerPaymentService *)objc_alloc_init(MEMORY[0x263F5C168]);
    peerPaymentService = v3->_peerPaymentService;
    v3->_peerPaymentService = v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel__accountDidChange name:*MEMORY[0x263F5C7D0] object:v3->_peerPaymentService];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;
  return v2;
}

void __51__NPKPeerPaymentConversationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NPKPeerPaymentConversationManager);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;
}

- (void)setActiveConversation:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__NPKPeerPaymentConversationManager_setActiveConversation___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __59__NPKPeerPaymentConversationManager_setActiveConversation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16) != *(void *)(a1 + 40))
  {
    v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v5 = *(void **)(a1 + 40);
        id v6 = [v5 senderAddress];
        v7 = [*(id *)(a1 + 40) recipientAddresses];
        int v14 = 138412802;
        v15 = v5;
        __int16 v16 = 2112;
        v17 = v6;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Set new conversation:%@ sender address:%@ recipient addresses:%@", (uint8_t *)&v14, 0x20u);
      }
    }
    id v8 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
    v9 = [*(id *)(a1 + 40) identifier];
    char v10 = [v8 isEqual:v9];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    if ((v10 & 1) == 0)
    {
      objc_super v11 = *(void **)(a1 + 32);
      v12 = recipientPhoneOrEmailWithConversation(*(void **)(a1 + 40));
      v13 = [*(id *)(a1 + 40) senderAddress];
      objc_msgSend(v11, "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", v12, v13);
    }
  }
}

- (MSConversation)activeConversation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  char v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__NPKPeerPaymentConversationManager_activeConversation__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MSConversation *)v3;
}

void __55__NPKPeerPaymentConversationManager_activeConversation__block_invoke(uint64_t a1)
{
}

- (NSString)senderPhoneOrEmail
{
  v2 = [(NPKPeerPaymentConversationManager *)self activeConversation];
  id v3 = [v2 senderAddress];

  return (NSString *)v3;
}

- (NSString)recipientPhoneOrEmail
{
  v2 = [(NPKPeerPaymentConversationManager *)self activeConversation];
  id v3 = recipientPhoneOrEmailWithConversation(v2);

  return (NSString *)v3;
}

- (NSString)recipientDisplayName
{
  id v3 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentController];
  id v4 = [(NPKPeerPaymentConversationManager *)self recipientPhoneOrEmail];
  dispatch_queue_t v5 = [v3 displayNameForRecipientAddress:v4];

  return (NSString *)v5;
}

- (BOOL)recipientFoundInContacts
{
  BOOL v7 = 0;
  id v3 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentController];
  id v4 = [(NPKPeerPaymentConversationManager *)self recipientPhoneOrEmail];
  id v5 = (id)[v3 displayNameForRecipientAddress:v4 foundInContacts:&v7];

  return v7;
}

- (PKPeerPaymentRecipient)recipient
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  char v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NPKPeerPaymentConversationManager_recipient__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKPeerPaymentRecipient *)v3;
}

void __46__NPKPeerPaymentConversationManager_recipient__block_invoke(uint64_t a1)
{
}

- (void)lookupRecipientInformationIfNecessary
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NPKPeerPaymentConversationManager_lookupRecipientInformationIfNecessary__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __74__NPKPeerPaymentConversationManager_lookupRecipientInformationIfNecessary__block_invoke(uint64_t a1)
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Requested Lookup recipient Information if necessary", v9, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 24))
  {
    id v6 = *(id *)(v5 + 16);
    BOOL v7 = recipientPhoneOrEmailWithConversation(v6);
    uint64_t v8 = [v6 senderAddress];
    objc_msgSend((id)v5, "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", v7, v8);
  }
}

- (void)performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__NPKPeerPaymentConversationManager_performPaymentWithAmount_requestToken_completion___block_invoke;
  v15[3] = &unk_2644D3540;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

uint64_t __86__NPKPeerPaymentConversationManager_performPaymentWithAmount_requestToken_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_performPaymentWithAmount:requestToken:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_internalQueue_performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v32 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v33 = [(NPKPeerPaymentConversationManager *)self currentPeerPaymentController];
  if (v33)
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: We already have a current peer payment controller. Resetting.", buf, 2u);
      }
    }
    [v33 reset];
  }
  id v12 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentControllerWithQueue:self->_internalQueue];
  [(NPKPeerPaymentConversationManager *)self setCurrentPeerPaymentController:v12];
  id v13 = objc_alloc_init(NPKRemoteInterfacePresenter);
  *(void *)buf = 0;
  v50 = buf;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__19;
  v53 = __Block_byref_object_dispose__19;
  id v54 = 0;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke;
  v44[3] = &unk_2644D6AC8;
  v44[4] = self;
  v48 = buf;
  id v14 = v13;
  v45 = v14;
  id v15 = v8;
  id v47 = v15;
  id v16 = v12;
  id v46 = v16;
  id v17 = (void *)MEMORY[0x223C37380](v44);
  id v18 = self->_activeConversation;
  v19 = recipientPhoneOrEmailWithConversation(v18);
  uint64_t v20 = [(MSConversation *)v18 senderAddress];
  v21 = pk_General_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v23 = pk_General_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 138413058;
      id v56 = v31;
      __int16 v57 = 2112;
      id v58 = v32;
      __int16 v59 = 2112;
      v60 = v19;
      __int16 v61 = 2112;
      v62 = v20;
      _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: perform Payment with amount:%@ requestToken:%@, recipient:%@, sender:%@", v55, 0x2Au);
    }
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_69;
  v34[3] = &unk_2644D6B90;
  id v24 = v16;
  v43 = buf;
  id v35 = v24;
  v36 = self;
  id v25 = v31;
  id v37 = v25;
  v26 = v14;
  v38 = v26;
  id v27 = v32;
  id v39 = v27;
  v28 = v18;
  v40 = v28;
  id v29 = v17;
  id v42 = v29;
  id v30 = v19;
  id v41 = v30;
  [v24 identifyRecipientWithAddress:v30 senderAddress:v20 completion:v34];

  _Block_object_dispose(buf, 8);
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v13 = a3;
  id v9 = a4;
  BOOL v10 = [*(id *)(a1 + 32) _displayableErrorWithError:a5];
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v11) {
    [*(id *)(a1 + 40) clearInAppInterfaceForSkeletonPeerPaymentQuote:v11 withError:v10];
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v12 + 16))(v12, a2, v13, v9, v10);
  }
  [*(id *)(a1 + 48) reset];
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2 == 1)
  {
    id v9 = dispatch_group_create();
    BOOL v10 = [v7 receiveCurrency];
    uint64_t v11 = [*(id *)(a1 + 32) account];
    uint64_t v12 = [v11 currentBalance];
    id v13 = [v12 currency];
    int v14 = [v10 isEqual:v13];

    id v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      if (v16)
      {
        id v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Send and receive currencies match. Showing skeleton peer payment quote", buf, 2u);
        }
      }
      uint64_t v18 = [*(id *)(a1 + 40) _skeletonPeerPaymentQuoteWithPeerPaymentController:*(void *)(a1 + 32) selectedAmount:*(void *)(a1 + 48) recipient:v7];
      uint64_t v19 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      dispatch_group_enter(v9);
      v21 = *(void **)(a1 + 56);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_70;
      v52[3] = &unk_2644D4590;
      v53 = v9;
      [v21 showInAppInterfaceWithSkeletonPeerPaymentQuote:v22 completion:v52];
      v23 = v53;
    }
    else
    {
      if (!v16)
      {
LABEL_17:
        dispatch_group_enter(v9);
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v55 = __Block_byref_object_copy__19;
        id v56 = __Block_byref_object_dispose__19;
        id v57 = 0;
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x3032000000;
        v50[3] = __Block_byref_object_copy__19;
        v50[4] = __Block_byref_object_dispose__19;
        id v51 = 0;
        [*(id *)(a1 + 32) selectMode:1];
        id v32 = *(void **)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v34 = *(void *)(a1 + 64);
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_72;
        v46[3] = &unk_2644D6AF0;
        v48 = buf;
        v49 = v50;
        id v35 = v9;
        id v47 = v35;
        [v32 quoteWithAmount:v33 source:1 requestToken:v34 completion:v46];
        uint64_t v36 = *(void *)(a1 + 40);
        id v37 = *(NSObject **)(v36 + 8);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_2;
        v38[3] = &unk_2644D6B68;
        v44 = buf;
        v38[4] = v36;
        id v39 = *(id *)(a1 + 32);
        id v40 = *(id *)(a1 + 48);
        id v41 = *(id *)(a1 + 64);
        id v42 = *(id *)(a1 + 72);
        id v43 = *(id *)(a1 + 88);
        v45 = v50;
        dispatch_group_notify(v35, v37, v38);

        _Block_object_dispose(v50, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_18;
      }
      v23 = pk_Payment_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [*(id *)(a1 + 32) account];
        id v29 = [v28 currentBalance];
        id v30 = [v29 currency];
        id v31 = [v7 receiveCurrency];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Send and receive currencies differ (%@ vs %@). Not using skeleton peer payment quote.", buf, 0x16u);
      }
    }

    goto LABEL_17;
  }
  id v24 = pk_General_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

  if (v25)
  {
    v26 = pk_General_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_ERROR, "Error: Could not identify recipient %@ with error %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_18:
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_70(uint64_t a1)
{
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v13 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) currentPeerPaymentController];
    if (v2 == *(void **)(a1 + 40))
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) riskLevel])
      {
        uint64_t v11 = [*(id *)(a1 + 32) delegate];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_3;
        v23[3] = &unk_2644D6B40;
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(id *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 80);
        id v24 = v13;
        uint64_t v29 = v14;
        id v25 = *(id *)(a1 + 48);
        id v26 = *(id *)(a1 + 56);
        id v27 = *(id *)(a1 + 64);
        id v28 = *(id *)(a1 + 72);
        [v11 peerPaymentConversationManager:v12 shouldDisplayRiskAlertWithCompletion:v23];

        id v15 = v24;
      }
      else
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_75;
        v18[3] = &unk_2644D6B18;
        id v17 = *(void **)(a1 + 40);
        id v19 = *(id *)(a1 + 48);
        id v20 = *(id *)(a1 + 56);
        id v21 = *(id *)(a1 + 64);
        id v22 = *(id *)(a1 + 72);
        [v17 performQuote:v16 completion:v18];

        id v15 = v19;
      }
    }
    else
    {
      BOOL v3 = pk_General_log();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

      if (v4)
      {
        uint64_t v5 = pk_General_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          id v31 = v2;
          __int16 v32 = 2112;
          uint64_t v33 = v6;
          _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Not performing payment because we are no longer the current peer payment controller (current %@ vs ours %@)", buf, 0x16u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        id v31 = v10;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Error fetching quote: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_4;
    v9[3] = &unk_2644D6B18;
    BOOL v4 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    [v4 performQuote:v3 completion:v9];
  }
  else
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Not performing payment because non-zero risk level detected for payment, user chose to cancel transaction.", v8, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_4(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[5];
      uint64_t v14 = a1[6];
      int v15 = 138413570;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 1024;
      int v26 = a2;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform Payment with amount:%@ requestToken:%@, conversation:%@ response:%@, error:%@ success:%d", (uint8_t *)&v15, 0x3Au);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_75(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[5];
      uint64_t v14 = a1[6];
      int v15 = 138413570;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 1024;
      int v26 = a2;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform Payment with amount:%@ requestToken:%@, conversation:%@ response:%@, error:%@ success:%d", (uint8_t *)&v15, 0x3Au);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__NPKPeerPaymentConversationManager_lookupRecipientInformationWithAddress_senderAddress___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __89__NPKPeerPaymentConversationManager_lookupRecipientInformationWithAddress_senderAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_internalQueue_lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (PKPeerPaymentRecipient *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v8 = [(NPKPeerPaymentConversationManager *)self currentRecipientAddressLookup];
  id v9 = v8;
  if (v8 && [v8 isEqualToString:v6])
  {
    id v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        id v13 = "Notice: Currently performing a look up for given recipient address:%@";
        uint64_t v14 = v12;
        uint32_t v15 = 12;
LABEL_20:
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v16 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
    int v17 = [v16 isEqualToString:v6];

    if (v17)
    {
      uint64_t v18 = pk_General_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        uint64_t v20 = pk_General_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          recipient = self->_recipient;
          *(_DWORD *)buf = 138412546;
          id v30 = v6;
          __int16 v31 = 2112;
          __int16 v32 = recipient;
          _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: We already lookup for recipient with address:%@ recipient:%@", buf, 0x16u);
        }
      }
    }
    else
    {
      [(NPKPeerPaymentConversationManager *)self setCurrentRecipientAddressLookup:v6];
      id v22 = self->_recipient;
      self->_recipient = 0;

      __int16 v23 = pk_General_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        if (v24)
        {
          __int16 v25 = pk_General_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = v6;
            __int16 v31 = 2112;
            __int16 v32 = v7;
            _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Start lookup recipient information with with recipientAddress:%@ senderAddress:%@", buf, 0x16u);
          }
        }
        id v26 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentControllerWithQueue:self->_internalQueue];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke;
        v27[3] = &unk_2644D6BB8;
        v27[4] = self;
        id v28 = v6;
        [v26 identifyRecipientWithAddress:v28 senderAddress:v7 completion:v27];
      }
      else if (v24)
      {
        id v12 = pk_General_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v13 = "Notice: Will not lookup recipient information with nil recipient Address";
          uint64_t v14 = v12;
          uint32_t v15 = 2;
          goto LABEL_20;
        }
LABEL_21:
      }
    }
  }
}

void __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  id v15 = v7;
  uint64_t v19 = a2;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, block);
}

uint64_t __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = PKPeerPaymentRecipientStatusToString();
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finish lookup information with recipient:%@ status:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  id v7 = [*(id *)(a1 + 32) phoneOrEmail];

  if (!v7) {
    [*(id *)(a1 + 32) setPhoneOrEmail:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 24), *(id *)(a1 + 32));
  [*(id *)(a1 + 48) _postNotificationWithRecipient:*(void *)(a1 + 32) error:*(void *)(a1 + 56)];
  return [*(id *)(a1 + 48) setCurrentRecipientAddressLookup:0];
}

- (void)_internalQueue_forceLookupRecipientInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      activeConversation = self->_activeConversation;
      recipient = self->_recipient;
      int v12 = 138412546;
      uint64_t v13 = activeConversation;
      __int16 v14 = 2112;
      id v15 = recipient;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forcing recipient lookup (conversation %@ current recipient %@)", (uint8_t *)&v12, 0x16u);
    }
  }
  [(NPKPeerPaymentConversationManager *)self setCurrentRecipientAddressLookup:0];
  id v8 = self->_recipient;
  self->_recipient = 0;

  int v9 = self->_activeConversation;
  uint64_t v10 = recipientPhoneOrEmailWithConversation(v9);
  __int16 v11 = [(MSConversation *)v9 senderAddress];
  [(NPKPeerPaymentConversationManager *)self _internalQueue_lookupRecipientInformationWithAddress:v10 senderAddress:v11];
}

- (void)performRequestWithAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NPKPeerPaymentConversationManager_performRequestWithAmount_completion___block_invoke;
  block[3] = &unk_2644D3388;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __73__NPKPeerPaymentConversationManager_performRequestWithAmount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_performRequestWithAmount:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_internalQueue_performRequestWithAmount:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v8 = [(NPKPeerPaymentConversationManager *)self currentPeerPaymentController];
  if (v8)
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      __int16 v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: We already have a current peer payment controller. Resetting.", buf, 2u);
      }
    }
    [v8 reset];
  }
  id v12 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentControllerWithQueue:self->_internalQueue];
  [(NPKPeerPaymentConversationManager *)self setCurrentPeerPaymentController:v12];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke;
  v33[3] = &unk_2644D6BE0;
  v33[4] = self;
  id v13 = v7;
  id v35 = v13;
  id v14 = v12;
  id v34 = v14;
  id v15 = (void *)MEMORY[0x223C37380](v33);
  uint64_t v16 = self->_activeConversation;
  uint64_t v17 = recipientPhoneOrEmailWithConversation(v16);
  id v18 = [(MSConversation *)v16 senderAddress];
  uint64_t v19 = pk_General_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    __int16 v21 = pk_General_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v17;
      __int16 v40 = 2112;
      id v41 = v18;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: perform Request with amount:%@, recipient:%@, sender:%@", buf, 0x20u);
    }
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_78;
  v27[3] = &unk_2644D6C30;
  id v28 = v14;
  id v29 = v6;
  id v31 = v17;
  id v32 = v15;
  id v30 = v16;
  id v22 = v17;
  id v23 = v15;
  BOOL v24 = v16;
  id v25 = v6;
  id v26 = v14;
  [v26 identifyRecipientWithAddress:v22 senderAddress:v18 completion:v27];
}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v12 = a3;
  id v9 = a4;
  BOOL v10 = [*(id *)(a1 + 32) _displayableErrorWithError:a5];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v11 + 16))(v11, a2, v12, v9, v10);
  }
  [*(id *)(a1 + 40) reset];
}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_78(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) selectMode:3];
    id v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_2;
    v13[3] = &unk_2644D6C08;
    id v14 = v7;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 64);
    [v8 formalRequestTokenForAmount:v14 source:2 completion:v13];
  }
  else
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      uint64_t v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v12;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: Could not identify request recipient %@ with error %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_2(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    uint64_t v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[5];
      int v14 = 138413570;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 1024;
      int v25 = a2;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform request with amount:%@ requestToken:%@, conversation:%@ requestToken:%@, error:%@ success:%d", (uint8_t *)&v14, 0x3Au);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_accountDidChange
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKPeerPaymentConversationManager__accountDidChange__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__NPKPeerPaymentConversationManager__accountDidChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) account];
  if ([v2 role] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_forceLookupRecipientInformation");
  }
}

- (id)_displayableErrorWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x263F5C7E0];
    id v7 = objc_msgSend(v4, "npk_errorWithDomain:code:", *MEMORY[0x263F5C7E0], 40316);

    if (v7)
    {
      uint64_t v8 = [(NPKPeerPaymentConversationManager *)self _negativeBalanceErrorWithUnderlyingError:v5];
    }
    else
    {
      id v9 = objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 40312);

      if (v9)
      {
        uint64_t v8 = [(NPKPeerPaymentConversationManager *)self _ambiguousSenderAddressErrorWithUnderlyingError:v5];
      }
      else
      {
        BOOL v10 = objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 40309);

        if (v10)
        {
          uint64_t v8 = [(NPKPeerPaymentConversationManager *)self _lockedOrRestrictedAccountErrorWithUnderlyingError:v5];
        }
        else
        {
          uint64_t v11 = objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 0);

          if (!v11) {
            goto LABEL_11;
          }
          uint64_t v8 = [(NPKPeerPaymentConversationManager *)self _unknownPaymentErrorWithUnderlyingError:v5];
        }
      }
    }
    uint64_t v12 = (void *)v8;

    uint64_t v5 = v12;
  }
LABEL_11:
  return v5;
}

- (id)_negativeBalanceErrorWithUnderlyingError:(id)a3
{
  internalQueue = self->_internalQueue;
  id v5 = a3;
  id v6 = [(NPKPeerPaymentConversationManager *)self _newPeerPaymentControllerWithQueue:internalQueue];
  id v7 = [v6 account];
  uint64_t v8 = [v7 currentBalance];

  id v9 = [v8 amount];
  BOOL v10 = [MEMORY[0x263F087B0] zero];
  uint64_t v11 = [v9 compare:v10];

  if (v11 == -1)
  {
    int v14 = [v8 currency];
    uint64_t v12 = NPKPeerPaymentDecimalNumberFormatterForCurrencyCode();

    uint64_t v15 = NSString;
    __int16 v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_BODY" value:&stru_26CFEBA18 table:@"PeerPayment"];
    __int16 v18 = [v8 amount];
    uint64_t v19 = [v12 stringFromNumber:v18];
    uint64_t v13 = objc_msgSend(v15, "stringWithFormat:", v17, v19);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_BODY_NO_VALUE" value:&stru_26CFEBA18 table:@"PeerPayment"];
  }

  __int16 v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v21 = [v20 localizedStringForKey:@"PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_TITLE" value:&stru_26CFEBA18 table:@"PeerPayment"];
  __int16 v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v23 = [v22 localizedStringForKey:@"PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_COMPACT_BODY" value:&stru_26CFEBA18 table:@"PeerPayment"];
  __int16 v24 = NPKDisplayableError(v21, v13, v23, v5, @"NPKPeerPaymentConversationManagerErrorDomain", 0, 0);

  return v24;
}

- (id)_ambiguousSenderAddressErrorWithUnderlyingError:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"PEER_PAYMENT_UNAVAILABLE_ERROR_TITLE" value:&stru_26CFEBA18 table:@"PeerPayment"];

  id v7 = NSString;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"PEER_PAYMENT_SEND_ERROR_MESSAGE_AMBIGUOUS_SENDER_ADDRESS" value:&stru_26CFEBA18 table:@"PeerPayment"];
  BOOL v10 = PKPrimaryAppleAccountFormattedUsername();
  uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  uint64_t v12 = NPKDisplayableError(v6, v11, &stru_26CFEBA18, v4, @"NPKPeerPaymentConversationManagerErrorDomain", 0, 0);

  return v12;
}

- (id)_lockedOrRestrictedAccountErrorWithUnderlyingError:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"PEER_PAYMENT_SEND_ERROR_TITLE_CLOSED_OR_LOCKED" value:&stru_26CFEBA18 table:@"PeerPayment"];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"PEER_PAYMENT_SEND_ERROR_MESSAGE_CLOSED_OR_LOCKED" value:&stru_26CFEBA18 table:@"PeerPayment"];

  id v9 = NPKDisplayableError(v6, v8, &stru_26CFEBA18, v4, @"NPKPeerPaymentConversationManagerErrorDomain", 0, 0);

  return v9;
}

- (id)_unknownPaymentErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSen_2.isa);
  id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSen_3.isa);
  id v6 = NPKDisplayableError(v4, v5, &stru_26CFEBA18, v3, @"NPKPeerPaymentConversationManagerErrorDomain", 0, 0);

  return v6;
}

- (id)_skeletonPeerPaymentQuoteWithPeerPaymentController:(id)a3 selectedAmount:(id)a4 recipient:(id)a5
{
  v63[13] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v52 = a5;
  uint64_t v8 = [a3 account];
  id v9 = [v8 currentBalance];
  BOOL v10 = [v9 amount];
  v53 = [v10 stringValue];

  uint64_t v11 = [v8 currentBalance];
  uint64_t v12 = [v11 currency];

  id v57 = [v8 countryCode];
  uint64_t v13 = [v7 amount];
  int v14 = [v13 stringValue];

  uint64_t v15 = [v7 currency];
  id v51 = v14;
  id v16 = v15;
  id v17 = v12;
  __int16 v18 = [v8 sendToUserFeatureDescriptor];
  uint64_t v19 = [v18 supportedNetworks];
  id v54 = [v18 merchantIdentifier];
  v50 = v18;
  [v18 merchantCapabilities];
  __int16 v20 = [v7 amount];
  id v21 = [v8 currentBalance];
  __int16 v22 = [v21 amount];
  uint64_t v23 = [v20 compare:v22];

  __int16 v24 = [v8 currentBalance];
  int v25 = [v24 amount];
  uint64_t v26 = [MEMORY[0x263F087B0] zero];
  uint64_t v49 = [v25 compare:v26];

  uint64_t v27 = [MEMORY[0x263EFF980] array];
  id v28 = [MEMORY[0x263F087B0] zero];
  v55 = v16;
  id v56 = v7;
  if (v23 == 1)
  {
    id v29 = [v7 amount];
    [v8 currentBalance];
    id v30 = v48 = v27;
    id v31 = [v30 amount];
    id v47 = [v29 decimalNumberBySubtracting:v31];

    id v32 = [v47 stringValue];
    v62[0] = @"type";
    id v33 = v16;
    id v34 = PKPeerPaymentQuoteItemTypeToString();
    v63[0] = v34;
    v63[1] = v32;
    v62[1] = @"sendAmount";
    v62[2] = @"sendAmountCurrency";
    v63[2] = v33;
    v63[3] = v32;
    v62[3] = @"receiveAmount";
    v62[4] = @"receiveAmountCurrency";
    v63[4] = v33;
    v63[5] = v32;
    v62[5] = @"totalAmount";
    v62[6] = @"totalAmountCurrency";
    v63[6] = v33;
    v63[7] = @"0";
    v62[7] = @"fees";
    v62[8] = @"feesCurrency";
    v63[8] = v17;
    v63[9] = v57;
    v62[9] = @"countryCode";
    v62[10] = @"supportedNetworks";
    v63[10] = v19;
    v63[11] = v54;
    v62[11] = @"merchantIdentifier";
    v62[12] = @"merchantCapabilities";
    id v35 = PKMerchantCapabilityToStrings();
    v63[12] = v35;
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:13];

    uint64_t v27 = v48;
    [v48 addObject:v36];

    id v28 = v47;
  }
  if (v49 == 1)
  {
    id v37 = [v56 amount];
    __int16 v38 = [v37 decimalNumberBySubtracting:v28];

    id v39 = [v38 stringValue];
    v60[0] = @"type";
    id v40 = v16;
    PKPeerPaymentQuoteItemTypeToString();
    v42 = id v41 = v27;
    v61[0] = v42;
    v61[1] = v39;
    v60[1] = @"sendAmount";
    v60[2] = @"sendAmountCurrency";
    v61[2] = v40;
    v61[3] = v39;
    v60[3] = @"receiveAmount";
    v60[4] = @"receiveAmountCurrency";
    v61[4] = v40;
    v61[5] = v39;
    v60[5] = @"totalAmount";
    v60[6] = @"totalAmountCurrency";
    v61[6] = v40;
    v61[7] = @"0";
    v60[7] = @"fees";
    v60[8] = @"feesCurrency";
    v60[9] = @"countryCode";
    v61[8] = v17;
    v61[9] = v57;
    id v43 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:10];

    uint64_t v27 = v41;
    [v41 addObject:v43];
  }
  v58[0] = @"currentBalance";
  v58[1] = @"currentBalanceCurrency";
  v59[0] = v53;
  v59[1] = v17;
  v58[2] = @"quoteItems";
  v58[3] = @"totalFees";
  v59[2] = v27;
  v59[3] = @"0";
  v58[4] = @"feesCurrency";
  v58[5] = @"totalReceiveAmount";
  v59[4] = v17;
  v59[5] = v51;
  v58[6] = @"totalReceiveAmountCurrency";
  v59[6] = v55;
  v44 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:7];
  v45 = (void *)[objc_alloc(MEMORY[0x263F5C160]) initWithDictionary:v44];
  [v45 setRecipient:v52];

  return v45;
}

- (void)_postNotificationWithRecipient:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NPKPeerPaymentConversationManager__postNotificationWithRecipient_error___block_invoke;
  block[3] = &unk_2644D31B0;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__NPKPeerPaymentConversationManager__postNotificationWithRecipient_error___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = v2;
  uint64_t v4 = a1[4];
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"kNPKPeerPaymentConversationManagerRecipient"];
  }
  uint64_t v5 = a1[5];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"kNPKPeerPaymentConversationManagerError"];
  }
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: %@: post Recipient Updated Notification notification", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"NPKPeerPaymentConversationManagerRecipientUpdatedNotification" object:a1[6] userInfo:v3];
}

- (id)_sharedPeerPaymentWebService
{
  return (id)[MEMORY[0x263F5C178] sharedService];
}

- (id)_newPeerPaymentController
{
  return [(NPKPeerPaymentConversationManager *)self _newPeerPaymentControllerWithQueue:MEMORY[0x263EF83A0]];
}

- (id)_newPeerPaymentControllerWithQueue:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F5C148];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [(NPKPeerPaymentConversationManager *)self _sharedPeerPaymentWebService];
  id v8 = (void *)[v6 initWithPeerPaymentWebService:v7 queue:v5];

  return v8;
}

- (NPKPeerPaymentConversationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPeerPaymentConversationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPeerPaymentConversationContext)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
}

- (NSString)currentRecipientAddressLookup
{
  return self->_currentRecipientAddressLookup;
}

- (void)setCurrentRecipientAddressLookup:(id)a3
{
}

- (PKPeerPaymentController)currentPeerPaymentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPeerPaymentController);
  return (PKPeerPaymentController *)WeakRetained;
}

- (void)setCurrentPeerPaymentController:(id)a3
{
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (void)setPeerPaymentService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_destroyWeak((id *)&self->_currentPeerPaymentController);
  objc_storeStrong((id *)&self->_currentRecipientAddressLookup, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end