@interface MFMailComposeControllerViewDelegateHandler
+ (id)log;
+ (id)signpostLog;
- (BOOL)mailComposeControllerIsActiveComposeController:(id)a3;
- (EMDaemonInterface)daemonInterface;
- (MFMailComposeControllerViewDelegateHandler)initWithUICoordinator:(id)a3 daemonInterface:(id)a4;
- (MSDEntitledOpenComposeProtocolDelegate)entitledDelegate;
- (MSDOpenComposeProtocolDelegate)delegate;
- (MailComposeDeliveryUICoordinator)coordinator;
- (unint64_t)signpostID;
- (void)_presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:(id)a3;
- (void)mailComposeController:(id)a3 failedToHandoffCompositionWithError:(id)a4;
- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6;
- (void)mailComposeControllerCompositionFinished:(id)a3;
- (void)mailComposeControllerCompositionFinished:(id)a3 prepareForDismissalHandler:(id)a4;
- (void)mailComposeControllerCompositionHandoffFinished:(id)a3;
- (void)mailComposeControllerWantsToBackUpDraft:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntitledDelegate:(id)a3;
@end

@implementation MFMailComposeControllerViewDelegateHandler

- (MFMailComposeControllerViewDelegateHandler)initWithUICoordinator:(id)a3 daemonInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeControllerViewDelegateHandler;
  v8 = [(MFMailComposeControllerViewDelegateHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v9->_daemonInterface, a4);
  }

  return v9;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A3EEC;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699B10 != -1) {
    dispatch_once(&qword_100699B10, block);
  }
  v2 = (void *)qword_100699B08;

  return v2;
}

+ (id)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4010;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699B20 != -1) {
    dispatch_once(&qword_100699B20, block);
  }
  v2 = (void *)qword_100699B18;

  return v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)mailComposeControllerWantsToBackUpDraft:(id)a3
{
  id v4 = a3;
  v5 = [MFMailComposeDeliveryController alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A42B4;
  v13[3] = &unk_100604550;
  id v6 = v4;
  id v14 = v6;
  id v7 = [(MFMailComposeDeliveryController *)v5 initWithComposeController:v6 backupCompletionHandler:v13];
  if (v7)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"SAVING" value:&stru_100619928 table:@"Main"];

    v10 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
    [(MFMailComposeDeliveryController *)v7 setDelegate:v10];

    objc_super v11 = +[MFInvocationQueue sharedInvocationQueue];
    v12 = +[MFMonitoredInvocation invocationWithSelector:"deliverMessage" target:v7 taskName:v9 priority:9 canBeCancelled:1];
    [v11 addInvocation:v12];
  }
}

- (void)mailComposeControllerCompositionFinished:(id)a3
{
}

- (void)mailComposeControllerCompositionFinished:(id)a3 prepareForDismissalHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = +[MFMailComposeControllerViewDelegateHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting up delivery controller", buf, 2u);
  }

  v9 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
  v10 = [[MFMailComposeDeliveryController alloc] initWithComposeController:v6];
  if (v10)
  {
    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"SENDING" value:&stru_100619928 table:@"Main"];

    [(MFMailComposeDeliveryController *)v10 setDelegate:v9];
    v13 = +[MFMailComposeControllerViewDelegateHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Triggering deliverMessage on the delivery controller", v26, 2u);
    }

    id v14 = +[MFInvocationQueue sharedInvocationQueue];
    v15 = +[MFMonitoredInvocation invocationWithSelector:"deliverMessage" target:v10 taskName:v12 priority:9 canBeCancelled:1];
    [v14 addInvocation:v15];
  }
  if (_os_feature_enabled_impl()) {
    [(MFMailComposeControllerViewDelegateHandler *)self _presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:v6];
  }
  v16 = [v6 composeWebView];
  unsigned int v17 = [v16 isQuickReply];

  if ([v6 needsDelivery]) {
    uint64_t v18 = [v6 isSavingAsDraft] ^ 1;
  }
  else {
    uint64_t v18 = 0;
  }
  [v9 dismissComposeViewController:v6 animated:v17 ^ 1 afterSending:v18];
  v19 = [v9 composeCompletionBlock];

  if (v19)
  {
    v20 = [v9 composeCompletionBlock];
    v20[2]();

    [v9 setComposeCompletionBlock:0];
  }
  id v21 = [v6 resolution];
  if ((unint64_t)v21 <= 3) {
    uint64_t v22 = 3 - (void)v21;
  }
  else {
    uint64_t v22 = 0;
  }
  if (v7) {
    v7[2](v7, v22);
  }
  v23 = [(MFMailComposeControllerViewDelegateHandler *)self delegate];
  [v23 composeFinishedWithResult:v22];

  [(MFMailComposeControllerViewDelegateHandler *)self setDelegate:0];
  [(MFMailComposeControllerViewDelegateHandler *)self setEntitledDelegate:0];
  v24 = +[MFMailComposeControllerViewDelegateHandler log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Finished sending message", v25, 2u);
  }
}

- (void)_presentAppStoreReviewPromptAndNotifyCriterionIfNecessary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 didUseOmittedAttachmentsOrRecipients];
  id v6 = [v4 compositionContext];
  id v7 = [v6 sendLaterDate];

  v8 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
  v9 = v8;
  if (v7) {
    int v10 = 1;
  }
  else {
    int v10 = v5;
  }
  if (v10 == 1)
  {
    objc_super v11 = [v8 windowSceneForAppStoreReviewPrompt];
    if (v11)
    {
      if (v5) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 3;
      }
      BOOL v13 = v7 == 0;
      uint64_t v14 = v5 ^ 1;
      if (v13) {
        unsigned int v15 = 0;
      }
      else {
        unsigned int v15 = v5;
      }
      if (v15 == 1)
      {
        v16 = +[MFMailComposeControllerViewDelegateHandler log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134217984;
          uint64_t v20 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App Store Review prompt: multiple reasons apply, but reporting %ld", (uint8_t *)&v19, 0xCu);
        }
      }
      unsigned int v17 = [v9 appStoreReviewManager];
      [v17 notifyCriterionMet:v12];

      uint64_t v18 = [v9 appStoreReviewManager];
      [v18 attemptToShowPromptIn:v11 reason:v14];
    }
    else
    {
      uint64_t v18 = +[MFMailComposeControllerViewDelegateHandler log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10045CBEC(v18);
      }
    }
  }
}

- (void)mailComposeControllerCompositionHandoffFinished:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 lastDraftMessage];
  id v6 = [v5 objectID];

  id v7 = [v4 autosaveIdentifier];
  v8 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4A0C;
  block[3] = &unk_100604668;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = self;
  id v10 = v7;
  id v15 = v10;
  dispatch_async(v8, block);

  objc_super v11 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
  [v11 dismissComposeViewController:v4 animated:1 afterSending:0];
}

- (void)mailComposeController:(id)a3 failedToHandoffCompositionWithError:(id)a4
{
  id v6 = a4;
  unsigned int v5 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
  [v5 didFailToContinueUserActivityWithType:MSMailActivityHandoffTypeComposeWithStreams error:v6];
}

- (BOOL)mailComposeControllerIsActiveComposeController:(id)a3
{
  id v4 = [a3 navigationController];
  if (v4)
  {
    unsigned int v5 = [(MFMailComposeControllerViewDelegateHandler *)self coordinator];
    id v6 = [v5 activeViewController];

    BOOL v7 = v6 == v4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MFMailComposeControllerViewDelegateHandler *)self entitledDelegate];
  if (v12)
  {
    id v13 = +[MFMailComposeControllerViewDelegateHandler signpostLog];
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    id v15 = +[MFMailComposeControllerViewDelegateHandler signpostLog];
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MFMailComposeControllerViewDelegateHandlerShouldSendMail", "", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001A4DC4;
    v17[3] = &unk_10060BAD0;
    os_signpost_id_t v19 = v14;
    id v18 = v11;
    [v12 composeShouldSendMail:v9 toRecipients:v10 completion:v17];
  }
  else
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }
}

- (MSDOpenComposeProtocolDelegate)delegate
{
  return (MSDOpenComposeProtocolDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
}

- (MSDEntitledOpenComposeProtocolDelegate)entitledDelegate
{
  return (MSDEntitledOpenComposeProtocolDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntitledDelegate:(id)a3
{
}

- (MailComposeDeliveryUICoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (MailComposeDeliveryUICoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_entitledDelegate, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end