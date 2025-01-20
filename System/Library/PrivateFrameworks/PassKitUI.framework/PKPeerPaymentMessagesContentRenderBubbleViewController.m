@interface PKPeerPaymentMessagesContentRenderBubbleViewController
- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4;
- (BOOL)_isMessageFromMe:(id)a3;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (id)bubbleView;
- (id)generatedSnapshot;
- (void)_bubbleViewDoubleTapped;
- (void)_bubbleViewLongPressed;
- (void)_bubbleViewPanned;
- (void)_bubbleViewSelected;
- (void)_fetchStatus;
- (void)_resizeBubbleViewToReferenceSizeAnimated;
- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4;
- (void)loadView;
- (void)reloadContent;
@end

@implementation PKPeerPaymentMessagesContentRenderBubbleViewController

- (void)loadView
{
  bubbleView = self->_bubbleView;
  if (!bubbleView)
  {
    v4 = objc_alloc_init(PKPeerPaymentBubbleView);
    v5 = self->_bubbleView;
    self->_bubbleView = v4;

    [(PKPeerPaymentBubbleView *)self->_bubbleView setDisplaysApplePayLogo:1];
    [(PKPeerPaymentBubbleView *)self->_bubbleView setLiveRenderingEnabled:1];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__bubbleViewPanned];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v6];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__bubbleViewDoubleTapped];
    [v7 setNumberOfTapsRequired:2];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v7];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__bubbleViewLongPressed];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v8];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__bubbleViewSelected];
    [v9 setNumberOfTapsRequired:1];
    [v9 requireGestureRecognizerToFail:v6];
    [v9 requireGestureRecognizerToFail:v7];
    [v9 requireGestureRecognizerToFail:v8];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v9];
    objc_initWeak(&location, self);
    v10 = self->_bubbleView;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke;
    v14 = &unk_1E59D7148;
    objc_copyWeak(&v15, &location);
    [(PKPeerPaymentBubbleView *)v10 setActionHandler:&v11];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    bubbleView = self->_bubbleView;
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController setView:](self, "setView:", bubbleView, v11, v12, v13, v14);
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3 == 2)
    {
      [v5 setShowsActionSpinner:1];
      v9 = [WeakRetained appController];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_4;
      v10[3] = &unk_1E59CB268;
      objc_copyWeak(&v12, v6);
      id v11 = v5;
      [v9 handleAction:4 sender:v11 completion:v10];

      objc_destroyWeak(&v12);
    }
    else if (a3 == 1)
    {
      [v5 setShowsActionSpinner:1];
      v8 = [WeakRetained appController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_2;
      v13[3] = &unk_1E59CB6D8;
      id v14 = v5;
      [v8 handleAction:3 sender:v14 completion:v13];
    }
  }
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowsActionSpinner:0];
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_4(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_5;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_5(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setShowsActionSpinner:0];
    if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) updateWithPeerPaymentStatus:1 animated:1];
      dispatch_time_t v4 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_6;
      block[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v6, v2);
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v6);
    }
  }
}

void __66__PKPeerPaymentMessagesContentRenderBubbleViewController_loadView__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resizeBubbleViewToReferenceSizeAnimated];
    id WeakRetained = v2;
  }
}

- (void)reloadContent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  dispatch_time_t v4 = [v3 activeConversation];
  id v5 = [v4 selectedMessage];
  id v6 = [v5 peerPaymentMessage];

  currentMessage = self->_currentMessage;
  if (!currentMessage
    || ([(PKPeerPaymentMessage *)currentMessage identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v6 identifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqual:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentMessage, v6);
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: rendering message : %@", (uint8_t *)&v12, 0x16u);
    }

    [(PKPeerPaymentBubbleView *)self->_bubbleView updateWithPeerPaymentMessage:v6 animated:0];
    if ([v6 type] == 2
      && ![(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v6])
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setAction:1 animated:0];
    }
    [(PKPeerPaymentBubbleView *)self->_bubbleView sizeToFit];
  }
  [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _fetchStatus];
}

- (BOOL)_isMessageFromMe:(id)a3
{
  dispatch_time_t v4 = [a3 underlyingMessage];
  id v5 = [v4 senderParticipantIdentifier];

  id v6 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  char v7 = [v6 activeConversation];
  v8 = [v7 localParticipantIdentifier];

  char v9 = 0;
  if (v5 && v8) {
    char v9 = [v5 isEqual:v8];
  }

  return v9;
}

- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 peerPaymentMessageReceivedDate];
  char v9 = [v6 underlyingMessage];
  char v10 = [v9 time];

  if ([(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v6])
  {
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 1;
    if ([v6 hasBeenSent])
    {
      if (v8)
      {
        if (v10)
        {
          [v8 timeIntervalSinceDate:v10];
          if (fabs(v12) >= 1.0)
          {
            v13 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v15 = 134219010;
              uint64_t v16 = self;
              __int16 v17 = 2112;
              id v18 = v6;
              __int16 v19 = 2112;
              id v20 = v7;
              __int16 v21 = 2114;
              v22 = v10;
              __int16 v23 = 2114;
              v24 = v8;
              _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Message: %@ is not valid for Transaction: %@. (%{public}@ != %{public}@)", (uint8_t *)&v15, 0x34u);
            }

            BOOL v11 = 0;
          }
        }
      }
    }
  }

  return v11;
}

- (id)bubbleView
{
  return self->_bubbleView;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self loadViewIfNeeded];
  if (!self->_currentMessage) {
    [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self reloadContent];
  }
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v7 = self->_pendingBubbleViewSize.width;
  double v8 = self->_pendingBubbleViewSize.height;
  if (*MEMORY[0x1E4F1DB30] == v7 && v6 == v8) {
    -[PKPeerPaymentBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", width, height, *MEMORY[0x1E4F1DB30], v6);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)generatedSnapshot
{
  return [(PKPeerPaymentBubbleView *)self->_bubbleView generatedSnapshot];
}

- (void)_fetchStatus
{
  objc_initWeak(&location, self);
  v3 = self->_currentMessage;
  if (PKUseMockSURFServer())
  {
    if ([(PKPeerPaymentMessage *)v3 type] == 1)
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setAction:0 animated:0];
      [(PKPeerPaymentBubbleView *)self->_bubbleView setState:5 animated:0];
    }
    [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _resizeBubbleViewToReferenceSizeAnimated];
    bubbleView = self->_bubbleView;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke;
    v18[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [(PKPeerPaymentBubbleView *)bubbleView performPostRender:v18];
    id v5 = &v19;
  }
  else
  {
    if (!v3 || [(PKPeerPaymentMessage *)v3 type] != 1)
    {
      char v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      [v9 noteReadyForDisplay];

      goto LABEL_11;
    }
    double v6 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    int v7 = [v6 peerPaymentRequiresEnablement];

    if (v7)
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setState:10 animated:0];
      double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      [v8 noteReadyForDisplay];

      [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _resizeBubbleViewToReferenceSizeAnimated];
      goto LABEL_11;
    }
    if ([(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v3]
      && ![(PKPeerPaymentMessage *)v3 hasBeenSent])
    {
      BOOL v11 = self->_bubbleView;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_363;
      v12[3] = &unk_1E59CB010;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      [(PKPeerPaymentBubbleView *)v11 performPostRender:v12];
      id v5 = &v13;
    }
    else
    {
      char v10 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2;
      v14[3] = &unk_1E59D7198;
      objc_copyWeak(&v17, &location);
      int v15 = v3;
      uint64_t v16 = self;
      [v10 localStatusForMessage:v15 completion:v14];

      id v5 = &v17;
    }
  }
  objc_destroyWeak(v5);
LABEL_11:

  objc_destroyWeak(&location);
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained appController];
    [v2 noteReadyForDisplay];

    id WeakRetained = v3;
  }
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2(id *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3;
    block[3] = &unk_1E59CB378;
    objc_copyWeak(&v16, a1 + 6);
    id v14 = a1[4];
    id v4 = v3;
    id v15 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v16);
    id v5 = a1 + 5;
    if (*((unsigned char *)a1[5] + 1008) || [v4 peerPaymentStatus]) {
      goto LABEL_9;
    }
    double v6 = (unsigned char *)*v5;
  }
  else
  {
    id v5 = a1 + 5;
    double v6 = a1[5];
    if (v6[1008]) {
      goto LABEL_9;
    }
  }
  v6[1008] = 1;
  int v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = (unsigned char *)*v5;
    *(_DWORD *)buf = 134217984;
    id v18 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Fetching remote status.", buf, 0xCu);
  }

  char v9 = [a1[5] appController];
  id v10 = a1[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_356;
  v11[3] = &unk_1E59D7170;
  objc_copyWeak(&v12, a1 + 6);
  v11[4] = a1[5];
  [v9 remoteStatusForMessage:v10 completion:v11];

  objc_destroyWeak(&v12);
LABEL_9:
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained _isMessage:*(void *)(a1 + 32) validForTransaction:*(void *)(a1 + 40)];
    id v5 = v3[124];
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = [v3 appController];
      objc_msgSend(v5, "updateWithPaymentTransaction:animated:", v6, objc_msgSend(v7, "appReadyForDisplay"));
    }
    else
    {
      int v7 = [v3 appController];
      objc_msgSend(v5, "setState:animated:", 9, objc_msgSend(v7, "appReadyForDisplay"));
    }

    if ([v3[124] state] != 4)
    {
      id v8 = v3[124];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4;
      v9[3] = &unk_1E59CA7D0;
      v9[4] = v3;
      [v8 performPostRender:v9];
    }
  }
}

uint64_t __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appController];
  [v2 noteReadyForDisplay];

  id v3 = *(void **)(a1 + 32);

  return [v3 _resizeBubbleViewToReferenceSizeAnimated];
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_356(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_357;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_357(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1008) = 0;
    id v5 = WeakRetained[124];
    if (*(void *)(a1 + 32))
    {
      [(id)objc_opt_class() referenceSizeForPeerPaymentStatusResponse:*(void *)(a1 + 32)];
      double v7 = v6;
      double v9 = v8;
      [v4[124] frame];
      if (v9 <= v10)
      {
        id v13 = v4[124];
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = [v4 appController];
        objc_msgSend(v13, "updateWithPeerPaymentStatusResponse:animated:", v14, objc_msgSend(v15, "appReadyForDisplay"));

        dispatch_time_t v16 = dispatch_time(0, 300000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4_359;
        block[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v21, v2);
        dispatch_after(v16, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v21);
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3_358;
        v22[3] = &unk_1E59CA870;
        v22[4] = v4;
        id v23 = *(id *)(a1 + 32);
        objc_msgSend(v4, "_resizeBubbleViewToSize:completion:", v22, v7, v9);
      }
    }
    else
    {
      [v5 setState:10 animated:1];
      BOOL v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = v12;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Failed to get remote status.", buf, 0xCu);
      }

      [v4 _resizeBubbleViewToReferenceSizeAnimated];
    }
    id v17 = v4[124];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_360;
    v18[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v19, v2);
    [v17 performPostRender:v18];
    objc_destroyWeak(&v19);
  }
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_3_358(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 992);
  id v3 = [*(id *)(a1 + 32) appController];
  objc_msgSend(v2, "updateWithPeerPaymentStatusResponse:animated:", v1, objc_msgSend(v3, "appReadyForDisplay"));
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_4_359(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resizeBubbleViewToReferenceSizeAnimated];
    id WeakRetained = v2;
  }
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_360(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained appController];
    [v2 noteReadyForDisplay];

    id WeakRetained = v3;
  }
}

void __70__PKPeerPaymentMessagesContentRenderBubbleViewController__fetchStatus__block_invoke_2_363(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) appController];
    [v3 noteReadyForDisplay];

    id WeakRetained = v4;
  }
}

- (void)_resizeBubbleViewToReferenceSizeAnimated
{
  [(PKPeerPaymentBubbleView *)self->_bubbleView referenceSize];

  -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToSize:completion:](self, "_resizeBubbleViewToSize:completion:", 0);
}

- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v7 = (void (**)(void))a4;
  objc_initWeak(&location, self);
  double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v8 contentSize];
  double v10 = v9;
  double v12 = v11;

  id v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (width == v10 && height == v12)
  {
    if (v14)
    {
      v31.double width = width;
      v31.double height = height;
      id v15 = NSStringFromSize(v31);
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v15;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: No bubble view resize needed. Size: %{public}@.", buf, 0x16u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v14)
    {
      v32.double width = width;
      v32.double height = height;
      NSStringFromSize(v32);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v33.double width = v10;
      v33.double height = v12;
      id v17 = NSStringFromSize(v33);
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v16;
      __int16 v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Resize bubble view to size: %{public}@ content size: %{public}@.", buf, 0x20u);
    }
    self->_pendingBubbleViewSize.double width = width;
    self->_pendingBubbleViewSize.double height = height;
    id v18 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v18 noteContentSizeNeedsUpdate];

    dispatch_time_t v19 = dispatch_time(0, 800000000);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__PKPeerPaymentMessagesContentRenderBubbleViewController__resizeBubbleViewToSize_completion___block_invoke;
    v20[3] = &unk_1E59D71C0;
    objc_copyWeak(v22, &location);
    v20[4] = self;
    v22[1] = *(id *)&width;
    v22[2] = *(id *)&height;
    id v21 = v7;
    dispatch_after(v19, MEMORY[0x1E4F14428], v20);

    objc_destroyWeak(v22);
  }
  objc_destroyWeak(&location);
}

void __93__PKPeerPaymentMessagesContentRenderBubbleViewController__resizeBubbleViewToSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_OWORD *)(*(void *)(a1 + 32) + 1016) = *MEMORY[0x1E4F1DB30];
    id v2 = *(void **)(*(void *)(a1 + 32) + 992);
    [v2 frame];
    objc_msgSend(v2, "setFrame:");
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
}

- (void)_bubbleViewSelected
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  id v4 = [v3 activeConversation];
  id v5 = [v4 selectedMessage];
  double v6 = [v5 peerPaymentMessage];

  if (!v6) {
    goto LABEL_11;
  }
  if ([v6 type] == 1
    && [v6 hasBeenSent]
    && [(PKPeerPaymentBubbleView *)self->_bubbleView state] != 9)
  {
    double v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v9 handleAction:6 sender:self completion:0];
LABEL_13:

    goto LABEL_14;
  }
  if ([v6 type] != 3 || !objc_msgSend(v6, "hasBeenSent"))
  {
LABEL_11:
    double v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      double v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Ignoring bubble tap on message: %@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_13;
  }
  if ([v6 isFromMe]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 5;
  }
  double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v8 handleAction:v7 sender:self completion:0];

LABEL_14:
}

- (void)_bubbleViewPanned
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Pan gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_bubbleViewDoubleTapped
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Double tap gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_bubbleViewLongPressed
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Long press gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);

  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end