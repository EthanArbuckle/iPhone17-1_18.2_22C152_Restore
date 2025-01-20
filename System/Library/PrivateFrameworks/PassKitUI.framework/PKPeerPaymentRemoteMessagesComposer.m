@interface PKPeerPaymentRemoteMessagesComposer
- (BOOL)_recipientFoundInContacts;
- (PKPeerPaymentController)peerPaymentController;
- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6;
- (int64_t)actionType;
- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4;
- (void)_handleError:(id)a3;
- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4;
- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4;
- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5;
- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3;
- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8;
- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5;
- (void)setActionType:(int64_t)a3;
- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentRemoteMessagesComposer

- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRemoteMessagesComposer;
  v13 = [(PKPeerPaymentRemoteMessagesComposer *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peerPaymentController, a3);
    objc_storeWeak((id *)&v14->_presentingViewController, v12);
    v14->_actionType = a5;
    v14->_sourceType = a6;
  }

  return v14;
}

- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke;
  v10[3] = &unk_1E59D0E40;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(PKPeerPaymentRemoteMessagesComposer *)self _showAlertForInvalidStateIfNeededWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke(void **a1, int a2)
{
  v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = [WeakRetained[9] webService];
      id v8 = [v7 _appleAccountInformation];

      id v9 = PKPeerPaymentSenderAddressForRecipientAddress(a1[4]);
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v8 primaryEmailAddress];
      }
      id v13 = v11;

      [v6[9] reset];
      id v14 = v6[9];
      v15 = a1[4];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_2;
      v16[3] = &unk_1E59D7210;
      objc_copyWeak(&v19, v4);
      id v18 = a1[5];
      id v17 = a1[4];
      [v14 identifyRecipientWithAddress:v15 senderAddress:v13 completion:v16];

      objc_destroyWeak(&v19);
    }
    else
    {
      id v12 = (void (**)(void *, void))a1[5];
      if (v12) {
        v12[2](v12, 0);
      }
    }
  }
}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_3;
  v12[3] = &unk_1E59D71E8;
  objc_copyWeak(v17, a1 + 6);
  id v13 = v8;
  id v9 = a1[5];
  v17[1] = a2;
  id v16 = v9;
  id v14 = v7;
  id v15 = a1[4];
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(v17);
}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_17;
  }
  if (*(void *)(a1 + 32))
  {
    v4 = objc_msgSend(MEMORY[0x1E4F843E0], "pageTagForAppleCashSenderError:");
    v5 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_4;
    v16[3] = &unk_1E59CA7D0;
    id v6 = v4;
    id v17 = v6;
    id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, v16, 0);
    if (v7)
    {
      [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:v6];
      id v8 = objc_loadWeakRetained(v3 + 4);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_5;
      v14[3] = &unk_1E59CAA98;
      id v15 = *(id *)(a1 + 56);
      [v8 presentViewController:v7 animated:1 completion:v14];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 56);
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }
    }

    goto LABEL_17;
  }
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9 == 2)
  {
LABEL_8:
    id v10 = [*(id *)(a1 + 40) displayName];
    if ([v10 length]) {
      [*(id *)(a1 + 40) displayName];
    }
    else {
    id v13 = [v3[9] displayNameForRecipientAddress:*(void *)(a1 + 48)];
    }

    objc_msgSend(v3, "_showAlertForInvalidRecipientWithName:statusReason:completion:", v13, objc_msgSend(*(id *)(a1 + 40), "statusReason"), *(void *)(a1 + 56));
    goto LABEL_17;
  }
  if (v9 != 1)
  {
    if (v9) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 40));
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
  }
LABEL_17:
}

uint64_t __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_4(uint64_t a1)
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:*MEMORY[0x1E4F866D8]];
}

uint64_t __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_storeStrong((id *)&self->_memo, a5);
  objc_storeStrong((id *)&self->_requestToken, a4);
  objc_storeWeak((id *)&self->_presentingViewController, v18);
  if (v17)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F35168]);
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
    v22 = (MSSession *)[v20 initWithIdentifier:v21];
    session = self->_session;
    self->_session = v22;
  }
  objc_initWeak(&location, self);
  int64_t actionType = self->_actionType;
  if (actionType)
  {
    if (actionType == 1)
    {
      [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
      unint64_t v25 = self->_sourceType - 1;
      if (v25 > 2) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = qword_1A04445C8[v25];
      }
      peerPaymentController = self->_peerPaymentController;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke;
      v35[3] = &unk_1E59CAF70;
      objc_copyWeak(&v37, &location);
      id v36 = v19;
      [(PKPeerPaymentController *)peerPaymentController quoteWithAmount:v14 source:v26 requestToken:v15 alternateFundingSource:0 preserveCurrentBalance:0 recurringPaymentIdentifier:0 frequency:0 startDate:0 threshold:0 completion:v35];

      objc_destroyWeak(&v37);
    }
    else
    {
      v29 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v40 = actionType;
        _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for action type: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    [(PKPeerPaymentController *)self->_peerPaymentController selectMode:3];
    v27 = self->_peerPaymentController;
    if (self->_sourceType - 1 >= 3) {
      unint64_t sourceType = 0;
    }
    else {
      unint64_t sourceType = self->_sourceType;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_3;
    v31[3] = &unk_1E59D7260;
    objc_copyWeak(&v34, &location);
    id v32 = v14;
    id v33 = v19;
    [(PKPeerPaymentController *)v27 formalRequestTokenForAmount:v32 source:sourceType completion:v31];

    objc_destroyWeak(&v34);
  }
  objc_destroyWeak(&location);
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_2;
  block[3] = &unk_1E59D6B68;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  char v17 = a2;
  id v13 = v7;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (*(unsigned char *)(a1 + 64))
    {
      [WeakRetained _confirmPaymentMessageInsertionWithQuote:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
LABEL_11:
      id WeakRetained = v11;
      goto LABEL_12;
    }
    id v3 = *(id *)(a1 + 40);
    v4 = [v3 userInfo];
    v5 = [v4 objectForKey:*MEMORY[0x1E4F28A50]];

    id v6 = [v5 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F87CD8]])
    {
      uint64_t v7 = [v5 code];

      if (v7)
      {
LABEL_8:
        [v11 _handleError:v3];
        uint64_t v10 = *(void *)(a1 + 48);
        if (v10) {
          (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
        }

        goto LABEL_11;
      }
      id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSen.isa);
      id v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSen_0.isa);
      uint64_t v9 = PKDisplayableErrorCustom();

      id v3 = (id)v9;
    }

    goto LABEL_8;
  }
LABEL_12:
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_3(id *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_4;
  v12[3] = &unk_1E59D7238;
  objc_copyWeak(&v17, a1 + 6);
  char v18 = a2;
  id v13 = v7;
  id v14 = a1[4];
  id v9 = a1[5];
  id v15 = v8;
  id v16 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v17);
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    if (*(unsigned char *)(a1 + 72))
    {
      id v3 = *(void **)(a1 + 32);
      if (v3)
      {
        objc_storeStrong(WeakRetained + 7, v3);
        [v12 _insertRequestMessageWithAmount:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
LABEL_12:
        id WeakRetained = v12;
        goto LABEL_13;
      }
    }
    id v4 = *(id *)(a1 + 48);
    v5 = [v4 userInfo];
    id v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

    id v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F87CD8]])
    {
      uint64_t v8 = [v6 code];

      if (v8)
      {
LABEL_9:
        [v12 _handleError:v4];
        uint64_t v11 = *(void *)(a1 + 56);
        if (v11) {
          (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
        }

        goto LABEL_12;
      }
      id v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentReq.isa);
      id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentReq_0.isa);
      uint64_t v10 = PKDisplayableErrorCustom();

      id v4 = (id)v10;
    }

    goto LABEL_9;
  }
LABEL_13:
}

- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v25 = a4;
  id v26 = a5;
  objc_storeWeak((id *)&self->_presentingViewController, v25);
  objc_initWeak(&location, self);
  int64_t actionType = self->_actionType;
  if (actionType == 2)
  {
    objc_storeStrong((id *)&self->_recurringPayment, a3);
    uint64_t v11 = [v9 amount];
    uint64_t v12 = [v9 currency];
    id v13 = PKCurrencyAmountMake();

    id v14 = [MEMORY[0x1E4F84898] sharedInstance];
    id v15 = [v9 fundingSource];
    id v16 = [v15 fpanIdentifier];
    v24 = [v14 passWithFPANIdentifier:v16];

    if ([v9 usesAppleCashBalance]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
    unint64_t v18 = self->_sourceType - 1;
    if (v18 > 2) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = qword_1A04445C8[v18];
    }
    peerPaymentController = self->_peerPaymentController;
    id v20 = [v9 identifier];
    uint64_t v21 = [v9 frequency];
    v22 = [v9 startDate];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke;
    v27[3] = &unk_1E59D72B0;
    objc_copyWeak(&v30, &location);
    v27[4] = self;
    id v28 = v9;
    id v29 = v26;
    [(PKPeerPaymentController *)peerPaymentController quoteWithAmount:v13 source:v23 requestToken:0 alternateFundingSource:v24 preserveCurrentBalance:v17 recurringPaymentIdentifier:v20 frequency:v21 startDate:v22 threshold:0 completion:v27];

    objc_destroyWeak(&v30);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v33 = actionType;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for non-recurring payment action type: %ld", buf, 0xCu);
    }
  }

  objc_destroyWeak(&location);
}

void __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke_2;
  block[3] = &unk_1E59D7288;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  char v19 = a2;
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = v9;
  id v10 = *(id *)(a1 + 48);
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v21 = WeakRetained;
    if (*(unsigned char *)(a1 + 80))
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 64) identifier];

      if (!v3)
      {
        id v4 = *(void **)(*(void *)(a1 + 32) + 64);
        v5 = [*(id *)(a1 + 40) recurringPaymentIdentifier];
        [v4 setIdentifier:v5];
      }
      id v6 = objc_alloc(MEMORY[0x1E4F35168]);
      id v7 = objc_alloc(MEMORY[0x1E4F29128]);
      id v8 = [*(id *)(a1 + 48) identifier];
      id v9 = (void *)[v7 initWithUUIDString:v8];
      uint64_t v10 = [v6 initWithIdentifier:v9];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v10;

      [v21 _confirmPaymentMessageInsertionWithQuote:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
LABEL_13:
      id WeakRetained = v21;
      goto LABEL_14;
    }
    id v13 = *(id *)(a1 + 56);
    id v14 = [v13 userInfo];
    id v15 = [v14 objectForKey:*MEMORY[0x1E4F28A50]];

    id v16 = [v15 domain];
    if ([v16 isEqualToString:*MEMORY[0x1E4F87CD8]])
    {
      uint64_t v17 = [v15 code];

      if (v17)
      {
LABEL_10:
        [v21 _handleError:v13];
        uint64_t v20 = *(void *)(a1 + 64);
        if (v20) {
          (*(void (**)(uint64_t, void))(v20 + 16))(v20, 0);
        }

        goto LABEL_13;
      }
      id v16 = PKLocalizedPeerPaymentRecurringString(&cfstr_SetupGenericEr.isa);
      id v18 = PKLocalizedPeerPaymentRecurringString(&cfstr_SetupGenericEr_0.isa);
      uint64_t v19 = PKDisplayableErrorCustom();

      id v13 = (id)v19;
    }

    goto LABEL_10;
  }
LABEL_14:
}

- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!PKNetworkConnectivityAvailable())
  {
    id v6 = @"PEER_PAYMENT_INTERNET_CONNECTION_ERROR_MESSAGE";
    id v7 = @"PEER_PAYMENT_INTERNET_CONNECTION_ERROR_TITLE";
LABEL_7:
    id v8 = PKLocalizedPeerPaymentString(&v7->isa);
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    v5 = (void *)MEMORY[0x1E4F1D9A8];
    goto LABEL_8;
  }
  if (![MEMORY[0x1E4F350F8] isiMessageEnabled])
  {
    id v6 = @"PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_MESSAGE";
    id v7 = @"PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_TITLE";
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F350F8] canSendText]) {
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1E4F1D990];
  id v6 = @"PEER_PAYMENT_MESSAGES_UNAVAILABLE_ERROR_TITLE";
LABEL_8:
  id v9 = PKLocalizedPeerPaymentString(&v6->isa);
  [v4 setObject:v9 forKeyedSubscript:*v5];

  uint64_t v10 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

LABEL_9:
  if ([v4 count])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F850F0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidStateIfNeededWithCompletion___block_invoke;
    v12[3] = &unk_1E59CBD50;
    id v13 = v3;
    [v11 presentNotificationWithParameters:v4 responseHandler:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

uint64_t __87__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidStateIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a4 < 2)
  {
    uint64_t v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv.isa);
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv_0.isa, &stru_1EF1B4C70.isa, v7);
    id v12 = &__block_literal_global_507;
    id v13 = (void *)MEMORY[0x1E4F869D8];
LABEL_6:
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

    id v15 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

    [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*v13];
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    id v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv.isa);
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    uint64_t v11 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentMes_31.isa);
    id v12 = &__block_literal_global_509;
    id v13 = (void *)MEMORY[0x1E4F869D0];
    goto LABEL_6;
  }
  id v12 = &__block_literal_global_125;
LABEL_7:
  id v16 = (void *)MEMORY[0x1E4F850F0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke_4;
  v18[3] = &unk_1E59D72D8;
  id v19 = v12;
  id v20 = v8;
  id v17 = v8;
  [v16 presentNotificationWithParameters:v9 responseHandler:v18];
}

uint64_t __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke_2()
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869D8] buttonTag:*MEMORY[0x1E4F866D8]];
}

uint64_t __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke_3()
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869D0] buttonTag:*MEMORY[0x1E4F866D8]];
}

uint64_t __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (BOOL)_recipientFoundInContacts
{
  BOOL v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  id v3 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  id v4 = (id)[(PKPeerPaymentController *)peerPaymentController displayNameForRecipientAddress:v3 foundInContacts:&v6];

  return v6;
}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if ([(PKPeerPaymentRemoteMessagesComposer *)self _recipientFoundInContacts]
    || ([(PKPeerPaymentController *)self->_peerPaymentController account],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [v9 sendRestrictionType] == 2,
        v9,
        !v10))
  {
    if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3
      || [(PKPeerPaymentRemoteMessagesComposer *)self _recipientFoundInContacts])
    {
      goto LABEL_11;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88050]];
    id v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_3.isa);
    [v11 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    id v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_4.isa);
    [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

    id v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_5.isa);
    [v11 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

    id v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_6.isa);
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
    uint64_t v17 = 0;
    id v15 = &__block_literal_global_532;
    id v16 = (void *)MEMORY[0x1E4F869E0];
    id v18 = &__block_literal_global_530;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88050]];
    id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInv.isa);
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

    id v13 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentMes_30.isa);
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

    id v14 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
    id v15 = &__block_literal_global_513;
    id v16 = (void *)MEMORY[0x1E4F869C8];
    uint64_t v17 = 3;
    id v18 = &__block_literal_global_515;
  }

  [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*v16];
  if (!v11)
  {
LABEL_11:
    [(PKPeerPaymentRemoteMessagesComposer *)self _insertPaymentMessageWithQuote:v6 completion:v7];
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v22 = (void *)MEMORY[0x1E4F850F0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke_6;
  v23[3] = &unk_1E59D7300;
  objc_copyWeak(v28, (id *)buf);
  id v25 = v18;
  id v26 = v15;
  v28[1] = (id)v17;
  id v24 = v6;
  id v27 = v7;
  [v22 presentNotificationWithParameters:v11 responseHandler:v23];

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

uint64_t __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke_3()
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869C8] buttonTag:*MEMORY[0x1E4F866D8]];
}

uint64_t __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke_4()
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869E0] buttonTag:*MEMORY[0x1E4F861B8]];
}

uint64_t __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke_5()
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*MEMORY[0x1E4F869E0] buttonTag:*MEMORY[0x1E4F86148]];
}

void __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  if (a3 == 2)
  {
    uint64_t v6 = a1 + 48;
  }
  else
  {
    if (a3) {
      goto LABEL_7;
    }
    uint64_t v6 = a1 + 40;
  }
  (*(void (**)(void))(*(void *)v6 + 16))();
LABEL_7:
  if (*(void *)(a1 + 72) == a3)
  {
    [WeakRetained _insertPaymentMessageWithQuote:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: User does not want to insert payment message.", v9, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
LABEL_13:
}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert payment message with peer payment quote: %@", (uint8_t *)&v21, 0xCu);
  }

  id v9 = [v6 totalReceiveAmount];
  BOOL v10 = [v6 totalReceiveAmountCurrency];
  id v11 = PKCurrencyAmountCreate(v9, v10);

  int v12 = [v6 isRecurringPayment];
  if (v12) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F84DB0]);
  [v14 setSource:1];
  id v15 = [MEMORY[0x1E4F843E0] archivedSessionTokenForSubject:*MEMORY[0x1E4F87000]];
  [v14 setAnalyticsSessionToken:v15];

  id v16 = [[PKPeerPaymentMessage alloc] initWithType:v13 session:self->_session];
  [(PKPeerPaymentMessage *)v16 setCurrencyAmount:v11];
  uint64_t v17 = [(PKPeerPaymentController *)self->_peerPaymentController senderPhoneOrEmail];
  [(PKPeerPaymentMessage *)v16 setSenderAddress:v17];

  id v18 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  [(PKPeerPaymentMessage *)v16 setRecipientAddress:v18];

  [(PKPeerPaymentMessage *)v16 setLocalProperties:v14];
  if (self->_memo) {
    -[PKPeerPaymentMessage setMemo:](v16, "setMemo:");
  }
  if (self->_requestToken) {
    -[PKPeerPaymentMessage setRequestToken:](v16, "setRequestToken:");
  }
  if (v12)
  {
    id v19 = [v6 startDate];
    [(PKPeerPaymentMessage *)v16 setRecurringPaymentStartDate:v19];

    -[PKPeerPaymentMessage setRecurringPaymentFrequency:](v16, "setRecurringPaymentFrequency:", [v6 frequency]);
    id v20 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment memo];
    [(PKPeerPaymentMessage *)v16 setRecurringPaymentMemo:v20];
  }
  [(PKPeerPaymentRemoteMessagesComposer *)self _presentPeerPaymentMessage:v16 completion:v7];
}

- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    requestToken = self->_requestToken;
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = requestToken;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert request with amount: %@ requestToken: %@", (uint8_t *)&v15, 0x16u);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F84DB0]);
  [v10 setSource:1];
  id v11 = [MEMORY[0x1E4F843E0] archivedSessionTokenForSubject:*MEMORY[0x1E4F87000]];
  [v10 setAnalyticsSessionToken:v11];

  int v12 = [[PKPeerPaymentMessage alloc] initWithType:2 session:self->_session];
  [(PKPeerPaymentMessage *)v12 setCurrencyAmount:v6];
  [(PKPeerPaymentMessage *)v12 setRequestToken:self->_requestToken];
  uint64_t v13 = [(PKPeerPaymentController *)self->_peerPaymentController senderPhoneOrEmail];
  [(PKPeerPaymentMessage *)v12 setSenderAddress:v13];

  id v14 = [(PKPeerPaymentRecipient *)self->_recipient phoneOrEmail];
  [(PKPeerPaymentMessage *)v12 setRecipientAddress:v14];

  [(PKPeerPaymentMessage *)v12 setLocalProperties:v10];
  if (self->_memo) {
    -[PKPeerPaymentMessage setMemo:](v12, "setMemo:");
  }
  [(PKPeerPaymentRemoteMessagesComposer *)self _presentPeerPaymentMessage:v12 completion:v7];
}

- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PKMessagesAppSharedContext sharedContext];
  id v9 = [(PKPeerPaymentController *)self->_peerPaymentController externalizedControllerState];
  id v10 = [v6 identifier];
  [v8 persistExternalizedControllerState:v9 forMessageIdentifier:v10];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke;
  v13[3] = &unk_1E59CB038;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = [PKPeerPaymentMessageComposeController alloc];
    v5 = [a1[4] underlyingMessage];
    id v6 = [a1[4] recipientAddress];
    uint64_t v7 = [(PKPeerPaymentMessageComposeController *)v4 initWithMessage:v5 recipientAddress:v6];
    uint64_t v8 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v7;

    id v9 = (void *)*((void *)WeakRetained + 3);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_2;
    id v15 = &unk_1E59D7328;
    objc_copyWeak(&v17, v2);
    id v16 = a1[5];
    [v9 setCompletionHandler:&v12];
    id v10 = (void *)*((void *)WeakRetained + 3);
    id v11 = objc_loadWeakRetained((id *)WeakRetained + 4);
    objc_msgSend(v10, "presentMessageOverController:presentationHandler:", v11, 0, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
  }
}

void __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || a2 == 2)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v8) {
        goto LABEL_10;
      }
      id v9 = *(void (**)(void))(v8 + 16);
      goto LABEL_9;
    }
    if (a2 == 1)
    {
      if (WeakRetained[8])
      {
        id v6 = [MEMORY[0x1E4F84E00] sharedInstance];
        v13[0] = v5[8];
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_3;
        v11[3] = &unk_1E59CAA98;
        id v12 = *(id *)(a1 + 32);
        [v6 insertOrUpdateRecurringPayments:v7 completion:v11];

        goto LABEL_10;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_10;
      }
      id v9 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v9();
    }
  }
LABEL_10:
}

uint64_t __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_handleError:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F84D80];
  id v4 = a3;
  v5 = [v3 displayableErrorForError:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [MEMORY[0x1E4F843E0] pageTagForAppleCashSenderError:v4];

  [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:v7];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F88050]];
  id v9 = PKTitleForDisplayableError();
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

  uint64_t v10 = MEMORY[0x1A6221F20](v5);
  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

  id v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  uint64_t v12 = *MEMORY[0x1E4F1D9E0];
  [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  id v13 = v7;
  id v30 = v13;
  id v14 = _Block_copy(aBlock);
  id v15 = [v5 localizedRecoveryOptions];
  id v16 = [v15 firstObject];

  id v17 = [v5 userInfo];
  id v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F87210]];

  if (v16 && v18)
  {
    uint64_t v19 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
    [v6 setObject:v19 forKeyedSubscript:v12];

    [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke_2;
    v27[3] = &unk_1E59CA7D0;
    id v28 = v13;
    id v20 = _Block_copy(v27);

    id v14 = v20;
  }
  int v21 = (void *)MEMORY[0x1E4F850F0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke_3;
  v24[3] = &unk_1E59D7350;
  id v25 = v18;
  id v26 = v14;
  id v22 = v14;
  id v23 = v18;
  [v21 presentNotificationWithParameters:v6 responseHandler:v24];
}

uint64_t __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:*MEMORY[0x1E4F866D8]];
}

uint64_t __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:*MEMORY[0x1E4F86148]];
}

void __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a3 == 2 && *(void *)(a1 + 32))
    {
      id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v5 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
    }
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (PKPeerPaymentController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_int64_t actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_composeController, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end