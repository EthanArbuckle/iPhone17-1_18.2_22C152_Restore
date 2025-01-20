@interface PKSharingMessageExtensionAppViewController
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (NSString)presentationSceneIdentifier;
- (PKSharingMessageExtensionAppViewController)init;
- (id)_viewControllerForPresentationStyle:(unint64_t)a3 withConversation:(id)a4;
- (id)presenterForMessage:(id)a3;
- (void)_configureCurrentStateForMessage:(id)a3;
- (void)_requestResizeIfNeeded;
- (void)_setContentViewController:(id)a3;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6;
- (void)messageDidUpdate;
- (void)messageExtensionMessageBubbleViewControllerDidTapMessage:(id)a3;
- (void)openAppURL:(id)a3;
- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5;
- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 destructiveButton:(id)a6 completion:(id)a7;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
@end

@implementation PKSharingMessageExtensionAppViewController

- (PKSharingMessageExtensionAppViewController)init
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionAppViewController;
  v3 = [(MSMessagesAppViewController *)&v8 init];
  if (v3) {
    BOOL v4 = _messageBubbleViewControllers == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_copiedToWeakObjectsMapTable");
    v6 = (void *)_messageBubbleViewControllers;
    _messageBubbleViewControllers = v5;
  }
  return v3;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  if (self->_messageBubbleViewController)
  {
    [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
    PKFloatRoundToPixel();
    double v5 = fmin(v4, 600.0);
    [(PKMessageExtensionMessageBubbleViewController *)self->_messageBubbleViewController heightThatFitsWidth:v5];
    double v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSharingMessageExtensionAppViewController;
    -[MSMessagesAppViewController contentSizeThatFits:](&v10, sel_contentSizeThatFits_, a3.width, a3.height);
    double v5 = v8;
  }
  double v9 = v5;
  result.height = v7;
  result.width = v9;
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 recipientAddresses];
    *(_DWORD *)buf = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Will become active with conversation: %@, recipientAddresses:%@", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionAppViewController;
  [(MSMessagesAppViewController *)&v8 willBecomeActiveWithConversation:v4];
  double v7 = [(PKSharingMessageExtensionAppViewController *)self _viewControllerForPresentationStyle:[(MSMessagesAppViewController *)self presentationStyle] withConversation:v4];
  if (v7) {
    [(PKSharingMessageExtensionAppViewController *)self _setContentViewController:v7];
  }
  [(PKSharingMessageExtensionPresenter *)self->_presenter extensionWillAppear];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSharingMessageExtensionAppViewController;
  [(MSMessagesAppViewController *)&v4 viewWillAppear:a3];
  [(PKSharingMessageExtensionAppViewController *)self _requestResizeIfNeeded];
}

- (id)_viewControllerForPresentationStyle:(unint64_t)a3 withConversation:(id)a4
{
  if (a3 == 2)
  {
    double v5 = [a4 selectedMessage];
    [(PKSharingMessageExtensionAppViewController *)self _configureCurrentStateForMessage:v5];

    double v6 = [[PKMessageExtensionMessageBubbleViewController alloc] initWithDelegate:self];
    messageBubbleViewController = self->_messageBubbleViewController;
    self->_messageBubbleViewController = v6;

    objc_super v8 = (void *)_messageBubbleViewControllers;
    double v9 = self->_messageBubbleViewController;
    id v10 = [(MSMessage *)self->_currentMessage URL];
    [v8 setObject:v9 forKey:v10];

    [(MSMessagesAppViewController *)self _balloonMaskEdgeInsets];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    int v19 = [(MSMessage *)self->_currentMessage isFromMe];
    if (v19) {
      double v20 = 0.0;
    }
    else {
      double v20 = v14;
    }
    double v21 = -0.0;
    if (v19) {
      double v21 = v14;
    }
    double v22 = v18 + v21;
    v23 = [(PKMessageExtensionMessageBubbleViewController *)self->_messageBubbleViewController bubbleView];
    objc_msgSend(v23, "setContentInset:", v12, v20, v16, v22);
    v24 = objc_opt_class();
    v25 = [(PKSharingMessageExtensionPresenter *)self->_presenter message];
    v26 = [v24 propertiesForMessage:v25];
    [v23 setProperties:v26];

    v27 = self->_messageBubbleViewController;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_setContentViewController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(PKSharingMessageExtensionAppViewController *)self addChildViewController:v4];
    id v6 = [(PKSharingMessageExtensionAppViewController *)self view];
    double v5 = [v4 view];
    [v6 bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setAutoresizingMask:18];
    [v6 addSubview:v5];
    [v4 didMoveToParentViewController:self];
  }
}

- (void)_requestResizeIfNeeded
{
  messageBubbleViewController = self->_messageBubbleViewController;
  if (messageBubbleViewController)
  {
    id v4 = [(PKMessageExtensionMessageBubbleViewController *)messageBubbleViewController view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    [(PKMessageExtensionMessageBubbleViewController *)self->_messageBubbleViewController heightThatFitsWidth:v6];
    if (round(vabdd_f64(v8, v9)) > 0.0)
    {
      [(MSMessagesAppViewController *)self requestResize];
    }
  }
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validating message for sending", buf, 2u);
  }

  double v13 = [v10 recipientAddresses];
  double v14 = v13;
  if (v13 && [v13 count])
  {
    [(PKSharingMessageExtensionAppViewController *)self _configureCurrentStateForMessage:v9];
    double v15 = [(PKMessageExtensionMessageBubbleViewController *)self->_messageBubbleViewController bubbleView];
    [v15 beginValidateMessage];
    presenter = self->_presenter;
    double v17 = [v10 senderAddress];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __119__PKSharingMessageExtensionAppViewController__validateMessageForSending_conversation_associatedText_completionHandler___block_invoke;
    v19[3] = &unk_1E59CBD08;
    id v20 = v15;
    id v21 = v11;
    id v18 = v15;
    [(PKSharingMessageExtensionPresenter *)presenter validateForRecipients:v14 senderAddress:v17 completion:v19];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: no recipients to validate", buf, 2u);
    }

    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __119__PKSharingMessageExtensionAppViewController__validateMessageForSending_conversation_associatedText_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 completeValidateMessage];
  double v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      __int16 v12 = 0;
      id v9 = "iMessage Extension: Message sending!";
      id v10 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    id v9 = "iMessage Extension: Message failed validation, not sending";
    id v10 = buf;
    goto LABEL_6;
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F87168], 0, 0, 1u);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (void)_configureCurrentStateForMessage:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_currentMessage, a3);
  double v5 = [(PKSharingMessageExtensionAppViewController *)self presenterForMessage:v20];
  presenter = self->_presenter;
  self->_presenter = v5;

  double v7 = self->_presenter;
  if (!v7)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    id v10 = [v20 URL];
    [v8 raise:v9, @"Sharing message URL must always resolve to presenter! URL: %@", v10 format];

    double v7 = self->_presenter;
  }
  [(PKSharingMessageExtensionPresenter *)v7 setRenderer:self];
  uint64_t v11 = [v20 isPending];
  if (v11) {
    goto LABEL_6;
  }
  __int16 v12 = +[PKMessagesAppSharedContext sharedContext];
  double v13 = [v20 session];
  double v14 = [v13 identifier];
  double v15 = [v12 externalizedControllerStateForMessageIdentifier:v14];

  if (!v15
    || (double v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithDataRepresentation:v15 relativeToURL:0], v15, !v16))
  {
LABEL_6:
    double v16 = [(MSMessage *)self->_currentMessage URL];
  }
  double v17 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "messageClass")), "initWithURL:", v16);
  objc_msgSend(v17, "setIsFromMe:", objc_msgSend(v20, "isFromMe"));
  [v17 setIsPending:v11];
  [(PKSharingMessageExtensionPresenter *)self->_presenter setMessage:v17];
  if (!self->_messageBubbleViewController)
  {
    id v18 = [(id)_messageBubbleViewControllers objectForKey:v16];
    messageBubbleViewController = self->_messageBubbleViewController;
    self->_messageBubbleViewController = v18;
  }
}

- (id)presenterForMessage:(id)a3
{
  v3 = [a3 URL];
  id v4 = PKSharingMessageExtensionPresenterForURL(v3);

  return v4;
}

- (void)messageExtensionMessageBubbleViewControllerDidTapMessage:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Subcredential invitation message view controller: %@ did tap message", (uint8_t *)&v6, 0xCu);
  }

  [(PKSharingMessageExtensionPresenter *)self->_presenter didTapMessage];
}

- (NSString)presentationSceneIdentifier
{
  v2 = [(PKSharingMessageExtensionAppViewController *)self view];
  v3 = [v2 window];
  id v4 = [v3 windowScene];
  double v5 = [v4 _sceneIdentifier];

  return (NSString *)v5;
}

- (void)messageDidUpdate
{
  v3 = (void *)_messageBubbleViewControllers;
  messageBubbleViewController = self->_messageBubbleViewController;
  double v5 = [(MSMessage *)self->_currentMessage URL];
  [v3 setObject:messageBubbleViewController forKey:v5];

  id v15 = [(PKSharingMessageExtensionPresenter *)self->_presenter message];
  int v6 = [(id)objc_opt_class() propertiesForMessage:v15];
  id v7 = [(PKMessageExtensionMessageBubbleViewController *)self->_messageBubbleViewController bubbleView];
  [v7 setProperties:v6];
  [(PKSharingMessageExtensionAppViewController *)self _requestResizeIfNeeded];
  uint64_t v8 = (void *)_messageBubbleViewControllers;
  uint64_t v9 = [(MSMessage *)self->_currentMessage URL];
  [v8 removeObjectForKey:v9];

  id v10 = [v15 urlRepresentation];
  [(MSMessage *)self->_currentMessage setURL:v10];
  if (![(MSMessage *)self->_currentMessage isPending])
  {
    uint64_t v11 = +[PKMessagesAppSharedContext sharedContext];
    __int16 v12 = [v10 dataRepresentation];
    double v13 = [(MSMessage *)self->_currentMessage session];
    double v14 = [v13 identifier];
    [v11 persistExternalizedControllerState:v12 forMessageIdentifier:v14];
  }
  [(id)_messageBubbleViewControllers setObject:self->_messageBubbleViewController forKey:v10];
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      id v11 = v7;
    }
    else {
      id v11 = v8;
    }
    int v14 = 138412290;
    id v15 = v11;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "iMessage Extension: showing alert with title \"%@\"", (uint8_t *)&v14, 0xCu);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F88050]];
  [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  [MEMORY[0x1E4F850F0] presentNotificationWithParameters:v12 responseHandler:&__block_literal_global_10];
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 destructiveButton:(id)a6 completion:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      id v17 = v11;
    }
    else {
      id v17 = v12;
    }
    *(_DWORD *)buf = 138412290;
    id v25 = v17;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "iMessage Extension: showing confirmation alert with title \"%@\"", buf, 0xCu);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F88058]];
  [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F88050]];
  [v18 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  [v18 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  [v18 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
  id v20 = (void *)MEMORY[0x1E4F850F0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__PKSharingMessageExtensionAppViewController_showAlertWithTitle_message_button_destructiveButton_completion___block_invoke;
  v22[3] = &unk_1E59CBD50;
  id v23 = v15;
  id v21 = v15;
  [v20 presentNotificationWithParameters:v18 responseHandler:v22];
}

uint64_t __109__PKSharingMessageExtensionAppViewController_showAlertWithTitle_message_button_destructiveButton_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 != 0);
}

- (void)openAppURL:(id)a3
{
  id v4 = a3;
  double v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: opening url", v10, 2u);
  }

  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    int v6 = PKLocalizedDeletableString(&cfstr_WalletUninstal.isa);
    id v7 = PKLocalizedDeletableString(&cfstr_WalletUninstal_0.isa);
    id v8 = PKLocalizedDeletableString(&cfstr_WalletUninstal_1.isa);
    id v9 = PKLocalizedDeletableString(&cfstr_WalletUninstal_2.isa);
    [(PKSharingMessageExtensionAppViewController *)self showAlertWithTitle:v6 message:v7 button:v8 destructiveButton:v9 completion:&__block_literal_global_55];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 openSensitiveURL:v4 withOptions:0];
  }
}

uint64_t __57__PKSharingMessageExtensionAppViewController_openAppURL___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return PKOpenInstallWallet();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_messageBubbleViewController, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end