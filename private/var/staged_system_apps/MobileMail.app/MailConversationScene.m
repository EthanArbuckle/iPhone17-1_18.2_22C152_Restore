@interface MailConversationScene
+ (id)log;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4;
- (BOOL)conversationViewControllerAllowsCategorizationAction:(id)a3;
- (BOOL)conversationViewControllerAllowsRemindMeAction:(id)a3;
- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3;
- (BOOL)conversationViewControllerIsResultOfSearch:(id)a3;
- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3;
- (BOOL)displayMessage:(id)a3;
- (BOOL)isComposeWindowActive;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldUpdateWidgetWhenSceneResignsActive;
- (ConversationViewController)conversationViewController;
- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler;
- (MFMailPopoverManager)popoverManager;
- (MailDetailNavigationController)navigationController;
- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager;
- (id)_createURLRoutes;
- (id)activeViewController;
- (id)composeAccountIsDefault:(BOOL *)a3;
- (id)composeCompletionBlock;
- (id)stateRestorationActivityForMailScene;
- (int64_t)currentlySelectedBucketForConversationViewController:(id)a3;
- (void)_composeCommandInvoked:(id)a3;
- (void)_doneButtonPressed;
- (void)_escapeShortcutInvoked:(id)a3;
- (void)_sheetPresentationControllerDidTearOff:(id)a3;
- (void)conversationViewControllerWantsDismissal:(id)a3;
- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5;
- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5;
- (void)mailSceneDidConnectWithOptions:(id)a3;
- (void)mailSceneDidDisconnect;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)referenceMessageNoLongerAvailableInConversationView:(id)a3;
- (void)setComposeCompletionBlock:(id)a3;
- (void)setComposeViewDelegateHandler:(id)a3;
- (void)setConversationViewController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7;
- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4;
@end

@implementation MailConversationScene

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001077D0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699658 != -1) {
    dispatch_once(&qword_100699658, block);
  }
  v2 = (void *)qword_100699650;

  return v2;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  v32.receiver = self;
  v32.super_class = (Class)MailConversationScene;
  id v31 = a3;
  -[MailScene mailSceneDidConnectWithOptions:](&v32, "mailSceneDidConnectWithOptions:");
  v4 = [ConversationViewController alloc];
  v5 = +[UIApplication sharedApplication];
  v6 = [v5 contactStore];
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 avatarGenerator];
  v9 = [(ConversationViewController *)v4 initWithScene:self contactStore:v6 avatarGenerator:v8];

  [(ConversationViewControllerBase *)v9 setIsPrimary:1];
  [(ConversationViewControllerBase *)v9 setIsStandalone:1];
  [(ConversationViewControllerBase *)v9 setDelegate:self];
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonPressed"];
  [(ConversationViewControllerBase *)v9 setDoneButton:v10];

  v11 = [[MailDetailNavigationController alloc] initWithRootViewController:v9];
  v12 = [MFMailComposeControllerViewDelegateHandler alloc];
  v13 = [(MailScene *)self daemonInterface];
  v14 = [(MFMailComposeControllerViewDelegateHandler *)v12 initWithUICoordinator:self daemonInterface:v13];
  [(MailConversationScene *)self setComposeViewDelegateHandler:v14];

  [(MailConversationScene *)self setConversationViewController:v9];
  [(MailConversationScene *)self setNavigationController:v11];
  v15 = [(MailConversationScene *)self session];
  v16 = [v15 stateRestorationActivity];

  if (!v16)
  {
    v17 = [v31 userActivities];
    v16 = [v17 ef_anyPassingTest:&stru_1006083D8];
  }
  v18 = [v16 userInfo];
  v19 = [v18 objectForKeyedSubscript:MSMailActivityHandoffDisplayMessageKeyRestorationState];

  v20 = +[NSPredicate predicateWithValue:0];
  v21 = [(MailConversationScene *)self activationConditions];
  [v21 setCanActivateForTargetContentIdentifierPredicate:v20];

  v22 = +[MailConversationScene log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(MailConversationScene *)self session];
    v24 = [v23 persistentIdentifier];
    v25 = [(MailConversationScene *)self session];
    v26 = [v25 stateRestorationActivity];
    *(_DWORD *)buf = 138412546;
    v34 = v24;
    __int16 v35 = 1024;
    BOOL v36 = v26 != 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Connection conditions: sessionID=%@ hasRestorationActivity=%{BOOL}d", buf, 0x12u);
  }
  if (v19)
  {
    v27 = [(MailScene *)self daemonInterface];
    v28 = [v27 messageRepository];
    v29 = +[ConversationViewRestorationState loadFromDictionary:v19 usingRepository:v28];

    v30 = [(MailConversationScene *)self conversationViewController];
    [v30 restoreState:v29];
  }
}

- (id)stateRestorationActivityForMailScene
{
  v3 = [(MailConversationScene *)self conversationViewController];
  id v4 = [v3 newBackgroundMonitor];
  [v4 setAction:1];
  [(MailScene *)self addBackgroundMonitor:v4];
  v5 = [v3 captureRestorationState];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSUserActivity);
    uint64_t v7 = MSMailActivityHandoffTypeDisplayMessage;
    id v8 = [v6 initWithActivityType:MSMailActivityHandoffTypeDisplayMessage];
    v13[0] = v7;
    v12[0] = MSMailActivityHandoffTypeKey;
    v12[1] = MSMailActivityHandoffDisplayMessageKeyRestorationState;
    v9 = [v5 dictionaryRepresentation];
    v13[1] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v8 setUserInfo:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)mailSceneDidDisconnect
{
  v7.receiver = self;
  v7.super_class = (Class)MailConversationScene;
  [(MailScene *)&v7 mailSceneDidDisconnect];
  if ([(MailConversationScene *)self isComposeWindowActive])
  {
    v3 = [(MailConversationScene *)self navigationController];
    id v4 = [v3 presentedViewController];

    if (![v4 resolution])
    {
      [v4 _setCompositionContext:0];
      v5 = +[UIApplication sharedApplication];
      id v6 = [v5 dockPersistence];
      [v6 recoverAbandonedDrafts];
    }
  }
}

- (id)_createURLRoutes
{
  v3 = [[MFComposeURLRoute alloc] initWithScene:self];
  v7.receiver = self;
  v7.super_class = (Class)MailConversationScene;
  id v4 = [(MailScene *)&v7 _createURLRoutes];
  v5 = [v4 arrayByAddingObject:v3];

  return v5;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 1;
}

- (MFMailPopoverManager)popoverManager
{
  if (pthread_main_np() != 1)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MailConversationScene.m" lineNumber:141 description:@"Current thread must be main"];
  }
  id v4 = [(MailConversationScene *)self delegate];
  v5 = [v4 window];
  if (v5)
  {
    id v6 = +[MFMailPopoverManager managerForWindow:v5 createIfNeeded:1];
  }
  else
  {
    id v6 = 0;
  }

  return (MFMailPopoverManager *)v6;
}

- (BOOL)displayMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSError errorWithDomain:EMErrorDomain code:2050 userInfo:0];
  [v3 requestAbortedWithError:v4];

  return 0;
}

- (BOOL)isComposeWindowActive
{
  v2 = [(MailConversationScene *)self navigationController];
  id v3 = [v2 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [[ComposeNavigationController alloc] initWithComposition:v12];
  v17 = [(ComposeNavigationController *)v16 presentationController];
  [v17 setDelegate:self];

  if (v16)
  {
    v18 = [(ComposeNavigationController *)v16 presentationController];
    id v35 = v15;
    id v36 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v19 = +[UIDevice mf_isPad];

      if (!v19) {
        goto LABEL_6;
      }
      v18 = [(ComposeNavigationController *)v16 presentationController];
      [v18 _setAllowsTearOff:1];
      [v18 setPrefersGrabberVisible:1];
    }

LABEL_6:
    v20 = [(MailConversationScene *)self composeViewDelegateHandler];
    [(ComposeNavigationController *)v16 setMailComposeDelegate:v20];

    if (v13 || ([v12 draftSubject], (id v13 = (id)objc_claimAutoreleasedReturnValue()) != 0)) {
      [(ComposeNavigationController *)v16 setInitialTitle:v13];
    }
    v21 = [(MailConversationScene *)self composeCompletionBlock];

    if (v21)
    {
      v22 = [(MailConversationScene *)self composeCompletionBlock];
      v22[2]();
    }
    [(MailConversationScene *)self setComposeCompletionBlock:v15];
    BOOL v34 = v10;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100108748;
    v37[3] = &unk_100604618;
    v37[4] = self;
    v23 = v16;
    v38 = v23;
    v24 = objc_retainBlock(v37);
    v25 = [(MailConversationScene *)self navigationController];
    v26 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
    unsigned int v27 = [v26 isClarityBoardEnabled];

    if ((+[UIDevice mf_isPad] ^ 1 | v27))
    {
      v28 = [v12 attachmentToMarkupContentID];
      if (!v28) {
        goto LABEL_19;
      }
      v29 = [(MailConversationScene *)self navigationController];
      v30 = [v29 presentedViewController];
      off_10068DF58();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        objc_super v32 = [v25 presentedViewController];
        [v32 presentViewController:v23 animated:v34 completion:v24];
      }
      else
      {
LABEL_19:
        [v25 presentViewController:v23 animated:v34 completion:v24];
      }
    }
    else
    {
      +[MFBayAdoption openComposeWithContext:v12 presentationSource:v36 requestingScene:self];
    }

    id v15 = v35;
    id v14 = v36;
    goto LABEL_21;
  }
  v33 = +[MailConversationScene log];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10045A6C8(v33);
  }

LABEL_21:
}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  *a3 = 0;
  v5 = [(MailConversationScene *)self conversationViewController];
  id v6 = [v5 referenceMessageListItem];
  objc_super v7 = [v6 mailboxes];
  id v8 = [v7 firstObject];

  if (!v8) {
    goto LABEL_3;
  }
  v9 = [(MailScene *)self mailboxProvider];
  BOOL v10 = [v8 objectID];
  v11 = [v9 legacyMailboxForObjectID:v10];

  id v12 = [v11 account];

  if (!v12)
  {
LABEL_3:
    *a3 = 1;
    id v12 = +[MailAccount defaultMailAccountForDelivery];
  }

  return v12;
}

- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4
{
}

- (void)_composeCommandInvoked:(id)a3
{
  id v4 = +[MailConversationScene log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Created invocation to update aliases.", buf, 2u);
  }

  v5 = +[MFInvocationQueue sharedInvocationQueue];
  id v6 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliasesForActiveAccounts" target:objc_opt_class()];
  [v5 addInvocation:v6];

  unsigned __int8 v13 = -86;
  id v7 = objc_alloc_init((Class)_MFMailCompositionContext);
  [v7 setShowKeyboardImmediately:1];
  id v8 = [(MailConversationScene *)self composeAccountIsDefault:&v13];
  v9 = +[MailConversationScene log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [v8 ef_publicDescription];
    *(_DWORD *)buf = 138412546;
    id v15 = v10;
    __int16 v16 = 1024;
    int v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Compose using account:%@, isDefault: %{BOOL}d.", buf, 0x12u);
  }
  v11 = [v8 defaultEmailAddress];
  id v12 = v11;
  if (!v11)
  {
    id v12 = [v8 firstEmailAddress];
  }
  [v7 setPreferredSendingEmailAddress:v12];
  if (!v11) {

  }
  [v7 setIsUsingDefaultAccount:v13];
  [v7 setPrefersFirstLineSelection:1];
  [(MailConversationScene *)self showComposeWithContext:v7 animated:1 initialTitle:0 presentationSource:0 completionBlock:0];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_composeCommandInvoked:" == a3)
  {
    id v8 = [(MailConversationScene *)self mf_rootViewController];
    v9 = [v8 presentedViewController];
    unsigned __int8 v7 = v9 == 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MailConversationScene;
    unsigned __int8 v7 = [(MailScene *)&v11 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (BOOL)conversationViewControllerIsResultOfSearch:(id)a3
{
  return 0;
}

- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4
{
  return 0;
}

- (void)referenceMessageNoLongerAvailableInConversationView:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108DC0;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  id v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)conversationViewControllerWantsDismissal:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108E70;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  id v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3
{
  return 1;
}

- (BOOL)conversationViewControllerAllowsRemindMeAction:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [v3 referenceMessageListItem];
    v5 = [v4 mailboxes];
    unsigned __int8 v6 = [v5 ef_all:&stru_1006083F8];
  }
  else
  {
    id v4 = [v3 referenceMessageListItem];
    v5 = [v4 mailboxes];
    unsigned __int8 v6 = [v5 ef_any:&stru_100608418];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)conversationViewControllerAllowsCategorizationAction:(id)a3
{
  return 0;
}

- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3
{
  return 1;
}

- (int64_t)currentlySelectedBucketForConversationViewController:(id)a3
{
  return 0;
}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (((unint64_t)[v9 status] & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    BOOL v10 = [v12 error];
    objc_super v11 = [v8 account];
    [(MailScene *)self displayError:v10 forAccount:v11 mode:2];
  }
}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MailConversationScene *)self activeViewController];
  id v10 = [(MailConversationScene *)self activeViewController];

  if (v10 == v8)
  {
    id v12 = [(MailConversationScene *)self session];
    [v12 mf_setActiveDraft:0];

    if (v6 && v5)
    {
      unsigned __int8 v13 = [(MailConversationScene *)self navigationController];
      [v13 dismissViewControllerWithTransition:3 completion:0];
    }
    else
    {
      unsigned __int8 v13 = [(MailConversationScene *)self navigationController];
      [v13 dismissViewControllerAnimated:v6 completion:0];
    }
  }
  else
  {
    objc_super v11 = +[MailConversationScene log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10045A70C((uint64_t)v8, (uint64_t)v9, v11);
    }
  }
}

- (id)activeViewController
{
  v2 = [(MailConversationScene *)self navigationController];
  id v3 = [v2 visibleViewController];

  return v3;
}

- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[UIApplication sharedApplication];
    id v3 = [v2 appStoreReviewManager];
  }
  else
  {
    id v3 = 0;
  }

  return (_TtC10MobileMail21AppStoreReviewManager *)v3;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3 = [a3 presentedViewController];
  char v4 = [v3 isDirty] ^ 1;

  return v4;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v3 = a3;
  char v4 = [v3 presentedViewController];
  [v4 _mailComposeController];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010941C;
  block[3] = &unk_1006047A0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v3 = [(MailConversationScene *)self session];
  [v3 mf_setActiveDraft:0];
}

- (void)_doneButtonPressed
{
}

- (void)_escapeShortcutInvoked:(id)a3
{
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
}

- (ConversationViewController)conversationViewController
{
  return self->_conversationViewController;
}

- (void)setConversationViewController:(id)a3
{
}

- (MailDetailNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler
{
  return self->_composeViewDelegateHandler;
}

- (void)setComposeViewDelegateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_conversationViewController, 0);

  objc_storeStrong(&self->composeCompletionBlock, 0);
}

@end