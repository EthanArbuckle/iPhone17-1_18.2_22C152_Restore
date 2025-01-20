@interface MailMainScene
+ (BOOL)wantsDeferredConnectionActions;
+ (NSArray)menuCommands;
+ (id)log;
- (AccountSetupController)accountSetupController;
- (BOOL)_isAccountCreationRestricted;
- (BOOL)_isDisplayingAccountSetup;
- (BOOL)_isMailboxListVisible;
- (BOOL)_presentAccountRestrictionAlertIfNecessary;
- (BOOL)_presentInitialSetupControllersIfNecessary;
- (BOOL)_sheetDropInteraction:(id)a3 canHandleUserActivityOfType:(id)a4;
- (BOOL)_shouldPresentMailTrackingProtectionOnboarding;
- (BOOL)_shouldPresentOnboarding;
- (BOOL)_shouldPresentWelcomeOnboarding;
- (BOOL)accountSetupFinished;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)displayMessage:(id)a3;
- (BOOL)displayMessage:(id)a3 fromUserActivityRouter:(id)a4;
- (BOOL)isComposeWindowActive;
- (BOOL)isOpenMailboxQuicklyViewVisible;
- (BOOL)presentAccountSetupControllerIfNecessary;
- (BOOL)presentNextOnboardingIfNecessary;
- (BOOL)presentOnboardingIfNecessary;
- (BOOL)shouldDeferUserNotificationAuthorizationRequests;
- (BOOL)shouldRequestContactAccess;
- (BOOL)shouldRequestUserNotificationAuthorization;
- (BOOL)shouldSelectDefaultMailboxOnResume;
- (BOOL)shouldUpdateWidgetWhenSceneResignsActive;
- (ComposeNavigationController)dummySnapshotComposeViewController;
- (DockContainerViewController)dockContainer;
- (EFFuture)draftRestorationFuture;
- (EFInvocable)postAccountSetupInvocation;
- (FavoritesManager)favoritesManager;
- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler;
- (MFMailPopoverManager)popoverManager;
- (MFUserActivityRouter)userActivityRouter;
- (MUIAppleIntelligenceOnboardingViewController)mailAppleIntelligenceWelcomeOnboardingViewController;
- (MailDetailNavigationController)detailNavigationController;
- (MailErrorHandler)errorHandler;
- (MailNavigationController)masterNavigationController;
- (MailSplitViewController)splitViewController;
- (MailTrackingProtectionOnboardingViewController)mailTrackingProtectionOnboardingViewController;
- (MailboxPickerOutlineController)mailboxPickerController;
- (MessageDisplayRequest)currentMessageDisplayRequest;
- (MessageListContainerViewController)messageListContainerViewController;
- (NSArray)openMailboxQuicklyItems;
- (NSSet)selectedAccounts;
- (NSSet)statusMailboxes;
- (NSSet)suppressionMailboxes;
- (NSSet)visibleMailboxes;
- (NSString)lastSelectedAccountID;
- (PreviousDraftPickerPopoverPresentationDelegate)previousDraftPickerPopoverPresentationDelegate;
- (UINavigationController)onboardingNavigationController;
- (UIViewController)openMailboxQuicklyViewController;
- (_TtC10MobileMail18ComposeUndoHandler)composeUndoHandler;
- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager;
- (id)_createAppleIntelligenceWelcomeOnboardingController;
- (id)_createMailTrackingProtectionOnboardingController;
- (id)_createURLRoutes;
- (id)_defaultAccountsToSelect;
- (id)_nextOnboardingController;
- (id)_sheetDropInteraction:(id)a3 presentingViewControllerForDroppingUserActivityOfType:(id)a4;
- (id)_sheetDropInteraction:(id)a3 viewControllerForDroppingUserActivityOfType:(id)a4;
- (id)_statusStringForCNAuthorizationStatus:(int64_t)a3;
- (id)activeViewController;
- (id)alertOverlayControllerForActivityRouter:(id)a3;
- (id)composeAccountIsDefault:(BOOL *)a3;
- (id)composeCompletionBlock;
- (id)composeControllerForCompositionContext:(id)a3;
- (id)composeControllerForCompositionContext:(id)a3 forActivityRouter:(id)a4;
- (id)extendedLaunchTracker;
- (id)mailboxPickerControllerForActivityRouter:(id)a3;
- (id)messageListViewControllerForActivityRouter:(id)a3;
- (id)newComposeButtonItem;
- (id)splitViewControllerForActivityRouter:(id)a3;
- (id)stateRestorationActivityForMailScene;
- (int64_t)appleIntelligenceOnboardingState;
- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4;
- (void)_beginRestoringPreviousDraftIfPossible;
- (void)_cleanUpDeprecatedOnboarding;
- (void)_composeCommandInvoked:(id)a3;
- (void)_dismissAccountSetupControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3;
- (void)_handleAccountsChanged:(id)a3;
- (void)_mailAppleIntelligenceWelcomeViewControllerDidFinish:(id)a3;
- (void)_mailTrackingProtectionViewControllerDidFinish:(id)a3;
- (void)_openMailboxQuicklyInvoked:(id)a3;
- (void)_prepareForAppleIntelligenceOnboardingIfNecessary;
- (void)_presentAccountSetupController;
- (void)_presentOnboarding;
- (void)_requestContactStoreAccessIfNeeded;
- (void)_requestUserNotificationAuthorization;
- (void)_resetSelectedAccounts;
- (void)_saveCompositionAsDraft:(id)a3;
- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4;
- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4 optedIn:(BOOL)a5;
- (void)_setupMailViewHierarchyWithState:(id)a3;
- (void)_sheetDropInteraction:(id)a3 handleUserActivity:(id)a4 forPresentedViewController:(id)a5;
- (void)_showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 draftOriginalMessageID:(id)a7 completionBlock:(id)a8;
- (void)accountSetupControllerDidChange:(id)a3 finished:(BOOL)a4;
- (void)closeOpenMailboxQuicklyViewController;
- (void)composeButtonLongPressed:(id)a3;
- (void)composeButtonPressed:(id)a3;
- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)dismissComposeController:(id)a3 forUserActivityRouter:(id)a4;
- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5;
- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (void)displayMessageListWithMode:(int64_t)a3;
- (void)dockContainer:(id)a3 didRestoreViewController:(id)a4;
- (void)dockContainer:(id)a3 dockedViewControllerWithIdentifier:(id)a4;
- (void)dockContainer:(id)a3 dockedViewWasTornOffWithIdentifier:(id)a4;
- (void)hasDelayedMessagesDidChange:(BOOL)a3;
- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5;
- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5;
- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5;
- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3;
- (void)mailSceneContinueUserActivity:(id)a3;
- (void)mailSceneDidBecomeActive;
- (void)mailSceneDidConnectWithOptions:(id)a3;
- (void)mailSceneDidDisconnect;
- (void)mailSceneDidEnterBackground;
- (void)mailSceneDidFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)mailScenePerformActionForShortcutItem:(id)a3 completionHandler:(id)a4;
- (void)mailSceneWillContinueUserActivityWithType:(id)a3;
- (void)mailSceneWillEnterForeground;
- (void)mailSceneWillResignActive;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)openMailboxQuicklyDidSelectMailboxWithIdentifier:(id)a3;
- (void)openURL:(id)a3 fromUserActivityRouter:(id)a4 completionHandler:(id)a5;
- (void)presentComposeController:(id)a3 forUserActivityRouter:(id)a4;
- (void)refreshOpenMailboxQuicklyItems;
- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4;
- (void)selectDefaultMailbox;
- (void)setAccountSetupController:(id)a3;
- (void)setAccountSetupFinished:(BOOL)a3;
- (void)setAppleIntelligenceOnboardingState:(int64_t)a3;
- (void)setComposeCompletionBlock:(id)a3;
- (void)setComposeUndoHandler:(id)a3;
- (void)setComposeViewDelegateHandler:(id)a3;
- (void)setCurrentMessageDisplayRequest:(id)a3;
- (void)setDetailNavigationController:(id)a3;
- (void)setDockContainer:(id)a3;
- (void)setDraftRestorationFuture:(id)a3;
- (void)setDummySnapshotComposeViewController:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFavoritesManager:(id)a3;
- (void)setLastSelectedAccountID:(id)a3;
- (void)setMailAppleIntelligenceWelcomeOnboardingViewController:(id)a3;
- (void)setMailTrackingProtectionOnboardingViewController:(id)a3;
- (void)setMailboxPickerController:(id)a3;
- (void)setMasterNavigationController:(id)a3;
- (void)setOnboardingNavigationController:(id)a3;
- (void)setOpenMailboxQuicklyViewController:(id)a3;
- (void)setPostAccountSetupInvocation:(id)a3;
- (void)setPreviousDraftPickerPopoverPresentationDelegate:(id)a3;
- (void)setSelectedAccounts:(id)a3;
- (void)setShouldDeferUserNotificationAuthorizationRequests:(BOOL)a3;
- (void)setShouldRequestContactAccess:(BOOL)a3;
- (void)setShouldRequestUserNotificationAuthorization:(BOOL)a3;
- (void)setShouldSelectDefaultMailboxOnResume:(BOOL)a3;
- (void)setSplitViewController:(id)a3;
- (void)setUserActivityRouter:(id)a3;
- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7;
- (void)showComposeWithContext:(id)a3 fromActivityRouter:(id)a4;
- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4;
@end

@implementation MailMainScene

- (BOOL)_isDisplayingAccountSetup
{
  v3 = [(MailMainScene *)self accountSetupController];
  if (v3)
  {
    v4 = [(MailMainScene *)self dockContainer];
    v5 = [v4 presentedViewController];
    v6 = [(MailMainScene *)self accountSetupController];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (MessageListContainerViewController)messageListContainerViewController
{
  v2 = [(MailMainScene *)self mailboxPickerController];
  v3 = [v2 messageListContainerViewController];

  return (MessageListContainerViewController *)v3;
}

- (void)_requestContactStoreAccessIfNeeded
{
  CNAuthorizationStatus v3 = +[CNContactStore authorizationStatusForEntityType:0];
  v4 = +[MailMainScene log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MailMainScene *)self _statusStringForCNAuthorizationStatus:v3];
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current contact store access status: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v3 == CNAuthorizationStatusNotDetermined)
  {
    if ([(MailMainScene *)self activationState] == (id)2)
    {
      [(MailMainScene *)self setShouldRequestContactAccess:1];
    }
    else
    {
      [(MailMainScene *)self setShouldRequestContactAccess:0];
      v6 = +[MailMainScene log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting Contact Store access", (uint8_t *)&v8, 2u);
      }

      id v7 = objc_alloc_init((Class)CNContactStore);
      [v7 requestAccessForEntityType:0 completionHandler:&stru_1006087F8];
    }
  }
}

- (void)mailSceneWillEnterForeground
{
  v9.receiver = self;
  v9.super_class = (Class)MailMainScene;
  [(MailScene *)&v9 mailSceneWillEnterForeground];
  CNAuthorizationStatus v3 = [(MailMainScene *)self errorHandler];
  [v3 reset];

  if ([(MailMainScene *)self shouldSelectDefaultMailboxOnResume])
  {
    +[UIView setAnimationsEnabled:0];
    [(MailMainScene *)self setShouldSelectDefaultMailboxOnResume:0];
    [(MailMainScene *)self selectDefaultMailbox];
    +[UIView setAnimationsEnabled:1];
  }
  if ((id)[(MailMainScene *)self appleIntelligenceOnboardingState] == (id)2)
  {
    id v4 = +[MUIAppleIntelligenceOnboardingViewController currentAppleIntelligenceOnboardingState];
    [(MailMainScene *)self setAppleIntelligenceOnboardingState:v4];
    if (v4 == (id)3)
    {
      v5 = [(MailMainScene *)self onboardingNavigationController];
      if (v5)
      {
      }
      else
      {
        v6 = [(MailMainScene *)self mailAppleIntelligenceWelcomeOnboardingViewController];

        if (!v6)
        {
          id v7 = +[MailMainScene log];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v8 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will enter foreground and attempt to display Apple Intelligence Onboarding.", v8, 2u);
          }

          [(MailMainScene *)self presentNextOnboardingIfNecessary];
        }
      }
    }
  }
}

- (void)_beginRestoringPreviousDraftIfPossible
{
  CNAuthorizationStatus v3 = [(MailMainScene *)self session];
  id v4 = [v3 mf_activeDraft];

  v5 = [v4 identifier];
  v6 = [v4 originalMessageIdentifier];
  if (v5)
  {
    id v7 = +[MailMainScene log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v4 ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning validation of prevously presented draft: %{public}@", buf, 0xCu);
    }
    objc_super v9 = +[EFPromise promise];
    v10 = +[EFScheduler globalAsyncScheduler];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10010D574;
    v27[3] = &unk_100604668;
    id v28 = v5;
    id v11 = v4;
    id v29 = v11;
    id v12 = v9;
    id v30 = v12;
    [v10 performBlock:v27];

    v13 = [v12 future];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v14 = +[EFScheduler mainThreadScheduler];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10010D720;
    v23[3] = &unk_100608598;
    id v24 = v11;
    v25 = self;
    id v26 = v6;
    [v13 onScheduler:v14 addSuccessBlock:v23];

    v15 = +[EFScheduler mainThreadScheduler];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010D9F8;
    v21[3] = &unk_100605D10;
    objc_copyWeak(&v22, (id *)buf);
    [v13 onScheduler:v15 addFailureBlock:v21];

    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10010DA74;
    v19 = &unk_100604FE8;
    objc_copyWeak(&v20, (id *)buf);
    [v13 always:&v16];
    -[MailMainScene setDraftRestorationFuture:](self, "setDraftRestorationFuture:", v13, v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak((id *)buf);
  }
}

- (id)extendedLaunchTracker
{
  v2 = +[UIApplication sharedApplication];
  CNAuthorizationStatus v3 = [v2 extendedLaunchTracker];

  return v3;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v7 = a4;
  int v8 = [v11 mf_viewControllerBefore:v7];
  objc_super v9 = sub_100021CA4(v8, v7, v5);

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:MailNavigationControllerDidShowViewControllerNotification object:v11 userInfo:v9];
}

+ (NSArray)menuCommands
{
  v2 = (void *)qword_100699698;
  if (!qword_100699698)
  {
    CNAuthorizationStatus v3 = objc_opt_new();
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 localizedStringForKey:@"TITLE_NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
    v6 = +[MFMailMenuCommand shortcutWithInput:@"n" flags:0x100000 repeatable:1 menu:0 action:"_composeCommandInvoked:" title:v5 plist:0];
    [v3 addObject:v6];

    if (_os_feature_enabled_impl())
    {
      id v7 = _EFLocalizedString();
      int v8 = +[MFMailMenuCommand shortcutWithInput:@"o" flags:1179648 repeatable:1 menu:1 action:"_openMailboxQuicklyInvoked:" title:v7 plist:0];
      [v3 addObject:v8];
    }
    objc_super v9 = +[EFDevice currentDevice];
    unsigned int v10 = [v9 isInternal];

    if (v10)
    {
      id v11 = +[UIKeyCommand keyCommandWithInput:@"d" modifierFlags:1966080 action:"debugShortcutInvoked:"];
      id v12 = [v11 _nonRepeatableKeyCommand];
      v13 = +[MFMailMenuCommand shortcutWithCommand:v12 menu:0];
      [v3 addObject:v13];
    }
    id v14 = [v3 copy];
    v15 = (void *)qword_100699698;
    qword_100699698 = (uint64_t)v14;

    v2 = (void *)qword_100699698;
  }

  return (NSArray *)v2;
}

- (void)mailSceneDidBecomeActive
{
  v10.receiver = self;
  v10.super_class = (Class)MailMainScene;
  [(MailScene *)&v10 mailSceneDidBecomeActive];
  CNAuthorizationStatus v3 = +[UIApplication sharedApplication];
  id v4 = [v3 accountsProvider];
  BOOL v5 = [v4 displayedAccounts];
  id v6 = [v5 count];

  unsigned __int8 v7 = [(MailMainScene *)self _shouldPresentOnboarding];
  unsigned int v8 = 0;
  if (v6 && (v7 & 1) == 0) {
    unsigned int v8 = ![(MailMainScene *)self shouldDeferUserNotificationAuthorizationRequests];
  }
  if ([(MailMainScene *)self shouldRequestContactAccess])
  {
    [(MailMainScene *)self setShouldRequestContactAccess:0];
    [(MailMainScene *)self _requestContactStoreAccessIfNeeded];
  }
  if (([(MailMainScene *)self shouldRequestUserNotificationAuthorization] | v8) == 1)
  {
    [(MailMainScene *)self setShouldRequestUserNotificationAuthorization:0];
    [(MailMainScene *)self _requestUserNotificationAuthorization];
  }
  objc_super v9 = [(MailMainScene *)self messageListContainerViewController];
  [v9 resumeRefreshAnimationIfNecessary];
}

- (void)selectDefaultMailbox
{
  id v19 = [(MailMainScene *)self mailboxPickerController];
  unsigned int v3 = [(MailMainScene *)self _shouldPresentOnboarding];
  id v4 = [(MailMainScene *)self _defaultAccountsToSelect];
  if ([v4 count])
  {
    id v5 = [(MailMainScene *)self activationState];
    if (v5 != (id)2) {
      [(MailMainScene *)self _requestContactStoreAccessIfNeeded];
    }
    id v6 = [(MailMainScene *)self accountSetupController];
    if (v6)
    {
      unsigned int v7 = ![(MailMainScene *)self accountSetupFinished];
      if (v5 == (id)2) {
        LOBYTE(v7) = 0;
      }
      if ((v7 & 1) == 0)
      {

LABEL_15:
        id v11 = [(MailMainScene *)self accountSetupController];
        [(MailMainScene *)self accountSetupControllerDidChange:v11 finished:[(MailMainScene *)self accountSetupFinished]];

LABEL_17:
        if (v5 != (id)2) {
          goto LABEL_20;
        }
        id v12 = [(MailMainScene *)self favoritesManager];
        v13 = [v12 lastSelectedItem];

        if (!v13
          || ([(MailMainScene *)self favoritesManager],
              id v14 = objc_claimAutoreleasedReturnValue(),
              [v14 setLastSelectedItem:0],
              v14,
              unsigned __int8 v15 = [v19 selectFavoriteItem:v13 animated:0],
              v13,
              (v15 & 1) == 0))
        {
LABEL_20:
          if ((unint64_t)[v4 count] < 2)
          {
            v16 = [v4 anyObject];
            uint64_t v17 = [v19 favoriteItemSelectionTarget];
            v18 = [v16 primaryMailboxUid];
            [v17 selectMailbox:v18 item:0 animated:0];
          }
          else
          {
            v16 = [v19 favoriteItemSelectionTarget];
            [v16 selectCombinedMailboxWithType:7 item:0 animated:0];
          }
        }
        goto LABEL_24;
      }
      objc_super v9 = [(MailMainScene *)self accountSetupController];
      unsigned __int8 v10 = [v9 accountSetupInProgress];

      if ((v10 & 1) == 0) {
        goto LABEL_15;
      }
    }
    if (![(MailMainScene *)self _isDisplayingAccountSetup])
    {
      if (v3) {
        [(MailMainScene *)self presentOnboardingIfNecessary];
      }
      else {
        [(MailMainScene *)self _requestUserNotificationAuthorization];
      }
    }
    goto LABEL_17;
  }
  if (![(MailMainScene *)self _isDisplayingAccountSetup])
  {
    unsigned int v8 = [v19 favoriteItemSelectionTarget];
    [v8 selectAccount:0 item:0 indexPath:0 animated:0];

    [(MailMainScene *)self _dismissAnyModalViewControllerOrPopoverAnimated:0];
    [(MailMainScene *)self _presentAccountSetupController];
  }
LABEL_24:
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  objc_super v9 = objc_msgSend(v14, "mf_viewControllerBefore:", v8);
  unsigned __int8 v10 = sub_100021CA4(v9, v8, v5);
  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:MailNavigationControllerWillShowViewControllerNotification object:v14 userInfo:v10];

  id v12 = [v8 title];
  v13 = [(MailMainScene *)self splitViewController];
  [v13 _setDisplayModeButtonItemTitle:v12];
}

- (void)_handleAccountsChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers];

  unsigned int v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:ECMailAccountsDidChangeNotificationKeyAccountIdentifiers];

  uint64_t v14 = 0;
  unsigned __int8 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  objc_super v9 = [(MailMainScene *)self selectedAccounts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000088FC;
  v13[3] = &unk_100608870;
  v13[4] = &v14;
  unsigned __int8 v10 = [v9 ef_compactMap:v13];

  id v11 = [v6 count];
  id v12 = [v8 count];
  if (!*((unsigned char *)v15 + 24) && (v11 == v12 || v11 && v12))
  {
    if ([v10 count]) {
      [(MailMainScene *)self setSelectedAccounts:v10];
    }
  }
  else
  {
    [(MailMainScene *)self _resetSelectedAccounts];
  }

  _Block_object_dispose(&v14, 8);
}

- (id)_defaultAccountsToSelect
{
  unsigned int v3 = +[UIApplication sharedApplication];
  id v4 = [v3 accountsProvider];

  BOOL v5 = [v4 displayedAccounts];
  if (![v5 count])
  {
    id v8 = objc_alloc_init((Class)NSSet);
    goto LABEL_12;
  }
  id v6 = [(MailMainScene *)self favoritesManager];
  unsigned int v7 = [v6 lastSelectedItem];

  if (!v7) {
    goto LABEL_10;
  }
  if (((unint64_t)[v7 type] & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    objc_super v9 = [v7 account];
    if (v9)
    {
      unsigned __int8 v10 = [v7 account];
      unsigned int v11 = [v5 containsObject:v10];

      if (v11)
      {
        id v12 = [v7 account];
        id v8 = +[NSSet setWithObject:v12];

        if (v8) {
          goto LABEL_11;
        }
      }
    }
    goto LABEL_10;
  }
  id v8 = v5;
  if (!v8)
  {
LABEL_10:
    v13 = [v4 orderedAccounts];
    uint64_t v14 = [v13 firstObject];
    id v8 = +[NSSet setWithObject:v14];
  }
LABEL_11:

LABEL_12:

  return v8;
}

- (BOOL)_shouldPresentOnboarding
{
  unsigned int v3 = +[UIApplication sharedApplication];
  if (([v3 launchedToTest] & 1) != 0 || objc_msgSend(v3, "isRunningTest"))
  {
    id v4 = +[MailMainScene log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Onboarding not presented -- test is running", v7, 2u);
    }

    BOOL v5 = 0;
  }
  else if ([(MailMainScene *)self _shouldPresentWelcomeOnboarding])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(MailMainScene *)self _shouldPresentMailTrackingProtectionOnboarding];
  }

  return v5;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007FD0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699690 != -1) {
    dispatch_once(&qword_100699690, block);
  }
  v2 = (void *)qword_100699688;

  return v2;
}

- (void)setSelectedAccounts:(id)a3
{
  id v8 = (NSSet *)a3;
  if (self->_selectedAccounts != v8)
  {
    BOOL v5 = [(MailMainScene *)self errorHandler];
    [v5 reset];

    objc_storeStrong((id *)&self->_selectedAccounts, a3);
    [(MailMainScene *)self setLastSelectedAccountID:0];
    if ((id)[(NSSet *)v8 count] == (id)1)
    {
      id v6 = [(NSSet *)v8 anyObject];
      unsigned int v7 = [v6 uniqueID];
      [(MailMainScene *)self setLastSelectedAccountID:v7];
    }
  }
}

- (void)setLastSelectedAccountID:(id)a3
{
}

- (MailErrorHandler)errorHandler
{
  errorHandler = self->_errorHandler;
  if (!errorHandler)
  {
    id v4 = objc_alloc_init(MailErrorHandler);
    BOOL v5 = self->_errorHandler;
    self->_errorHandler = v4;

    id v6 = [(MailMainScene *)self errorHandler];
    [v6 setPresentationDelegate:self];

    errorHandler = self->_errorHandler;
  }

  return errorHandler;
}

- (void)_requestUserNotificationAuthorization
{
  if ([(MailMainScene *)self activationState] == (id)2)
  {
    [(MailMainScene *)self setShouldRequestUserNotificationAuthorization:1];
    unsigned int v3 = MSUserNotificationsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Postponing authorization check.", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v4 = +[UNUserNotificationCenter currentNotificationCenter];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100018550;
    v5[3] = &unk_100608848;
    objc_copyWeak(&v6, (id *)buf);
    [v4 getNotificationSettingsWithCompletionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (id)newComposeButtonItem
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  v72.receiver = self;
  v72.super_class = (Class)MailMainScene;
  id v71 = a3;
  -[MailScene mailSceneDidConnectWithOptions:](&v72, "mailSceneDidConnectWithOptions:");
  id v4 = [(MailMainScene *)self extendedLaunchTracker];
  [v4 observeScene:self];

  BOOL v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleAccountsChanged:" name:ECMailAccountsDidChangeNotification object:0];

  id v6 = [MFMailComposeControllerViewDelegateHandler alloc];
  unsigned int v7 = [(MailScene *)self daemonInterface];
  id v8 = [(MFMailComposeControllerViewDelegateHandler *)v6 initWithUICoordinator:self daemonInterface:v7];
  [(MailMainScene *)self setComposeViewDelegateHandler:v8];

  objc_super v9 = [MFUserActivityRouter alloc];
  unsigned __int8 v10 = [(MailScene *)self daemonInterface];
  unsigned int v11 = [v10 messageRepository];
  id v12 = [(MFUserActivityRouter *)v9 initWithDelegate:self messageRepository:v11];
  [(MailMainScene *)self setUserActivityRouter:v12];

  if (_os_feature_enabled_impl())
  {
    v13 = [_TtC10MobileMail18ComposeUndoHandler alloc];
    uint64_t v14 = [(MailScene *)self daemonInterface];
    unsigned __int8 v15 = [v14 outgoingMessageRepository];
    uint64_t v16 = [(ComposeUndoHandler *)v13 initWithOutgoingMessageRepository:v15];
    [(MailMainScene *)self setComposeUndoHandler:v16];
  }
  char v17 = [(MailMainScene *)self session];
  v69 = [v17 stateRestorationActivity];

  if (+[EMInternalPreferences preferenceEnabled:16])
  {
    v18 = +[MailMainScene log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10045A7EC();
    }

    id v19 = 0;
  }
  else
  {
    id v19 = v69;
  }
  v70 = v19;
  id v20 = [v19 activityType];
  unsigned int v21 = [v20 isEqualToString:@"com.apple.mobilemail.state.mailmainscene"];

  id v22 = [v71 userActivities];
  id v23 = [v22 count];

  id v24 = [v71 URLContexts];
  id v25 = [v24 count];

  id v26 = [v71 shortcutItem];
  BOOL v67 = v23 != 0;
  BOOL v68 = v25 != 0;
  BOOL v66 = v26 != 0;

  v27 = +[UIApplication sharedApplication];
  id v28 = [v27 accountsProvider];
  id v29 = [v28 displayedAccounts];
  id v30 = [v29 count];

  unsigned int v31 = [(MailMainScene *)self _shouldPresentOnboarding];
  v32 = +[MailMainScene log];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    [(MailMainScene *)self session];
    v62 = unsigned int v64 = v21;
    v65 = [v62 persistentIdentifier];
    id v63 = v30;
    BOOL v33 = v30 != 0;
    BOOL v34 = v26 != 0;
    BOOL v35 = v25 != 0;
    BOOL v36 = v23 != 0;
    v37 = [(MailMainScene *)self session];
    v38 = [v37 mf_activeDraft];
    v39 = [v38 ef_publicDescription];
    *(_DWORD *)buf = 138414082;
    v75 = v65;
    __int16 v76 = 1024;
    unsigned int v77 = v64;
    __int16 v78 = 1024;
    BOOL v79 = v36;
    __int16 v80 = 1024;
    BOOL v81 = v35;
    __int16 v82 = 1024;
    BOOL v83 = v34;
    __int16 v84 = 1024;
    BOOL v85 = v33;
    unsigned int v21 = v64;
    __int16 v86 = 2112;
    v87 = v39;
    __int16 v88 = 1024;
    int v89 = v31 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Connection conditions: sessionID=%@ hasRestorationActivity=%d isExpectingOtherActivity=%d isExpectingURLs=%d isExpectingAppShortcut=%d hasAccounts=%d activeDraft=%@ hasShownOnboarding=%{BOOL}d", buf, 0x3Au);

    id v30 = v63;
  }
  BOOL v40 = v30 != 0;

  int v41 = v67 || v68 || v66;
  if ((v40 & v21 ^ 1 | v41 | v31))
  {
    v42 = 0;
  }
  else
  {
    v43 = [MailMainSceneState alloc];
    v44 = [v70 userInfo];
    v45 = [(MailScene *)self daemonInterface];
    v42 = [(MailMainSceneState *)v43 initWithDictionary:v44 daemonInterface:v45];
  }
  [(MailMainScene *)self _setupMailViewHierarchyWithState:v42];
  v46 = [(MailMainScene *)self session];
  v47 = [v46 mf_activeDraft];

  if ((v41 | !v40))
  {
    v48 = [v47 identifier];

    if (v48)
    {
      v49 = +[MailMainScene log];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = [v47 ef_publicDescription];
        *(_DWORD *)buf = 138412290;
        v75 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "A draft (%@) was previously presented in this scene but we're launching to some action. Will recover to the dock...", buf, 0xCu);
      }
      v51 = [(MailMainScene *)self session];
      [v51 mf_setActiveDraft:0];

      v52 = +[UIApplication sharedApplication];
      v53 = [v52 dockPersistence];
      [v53 recoverAbandonedDrafts];
    }
  }
  else
  {
    [(MailMainScene *)self _beginRestoringPreviousDraftIfPossible];
  }
  v54 = +[NSPredicate predicateWithFormat:@"NOT (self BEGINSWITH %@)", MSMailActivityHandoffTypeQuickLook];
  v73[0] = v54;
  v55 = +[NSPredicate predicateWithFormat:@"NOT (self BEGINSWITH %@)", MSMailActivityHandoffTypeComposeWithStreams];
  v73[1] = v55;
  v56 = +[NSArray arrayWithObjects:v73 count:2];
  v57 = +[NSCompoundPredicate andPredicateWithSubpredicates:v56];
  v58 = [(MailMainScene *)self activationConditions];
  [v58 setCanActivateForTargetContentIdentifierPredicate:v57];

  v59 = +[EFScheduler globalAsyncScheduler];
  [v59 performBlock:&stru_100608548];

  v60 = [(MailScene *)self daemonInterface];
  v61 = [v60 outgoingMessageRepository];
  [v61 addOutgoingMessageRepositoryObserver:self];
}

- (void)_setupMailViewHierarchyWithState:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 persistence];
  v46 = [v6 conversationPersistence];

  unsigned int v7 = +[UIApplication sharedApplication];
  v47 = [v7 accountsProvider];

  id v8 = [FavoritesManager alloc];
  objc_super v9 = +[UIApplication sharedApplication];
  unsigned __int8 v10 = [v9 favoritesPersistence];
  unsigned int v11 = [v4 favoritesManagerState];
  id v12 = [(FavoritesManager *)v8 initWithFavoritesPersistence:v10 collections:v11 conversationSubscriptionProvider:v46];
  [(MailMainScene *)self setFavoritesManager:v12];

  v13 = [MailboxPickerOutlineController alloc];
  uint64_t v14 = [(MailMainScene *)self favoritesManager];
  unsigned __int8 v15 = [(MailboxPickerOutlineController *)v13 initWithMainScene:self favoritesManager:v14 accountsProvider:v47];
  [(MailMainScene *)self setMailboxPickerController:v15];

  uint64_t v16 = [[MailNavigationController alloc] initWithNavigationBarClass:0 toolbarClass:objc_opt_class()];
  char v17 = [(MailMainScene *)self mailboxPickerController];
  v54 = v17;
  v18 = +[NSArray arrayWithObjects:&v54 count:1];
  [(MailNavigationController *)v16 setViewControllers:v18];

  [(MailNavigationController *)v16 setToolbarHidden:1];
  id v19 = [(MailNavigationController *)v16 navigationBar];
  [v19 setPrefersLargeTitles:1];

  id v20 = [[MailNavigationController alloc] initWithNavigationBarClass:0 toolbarClass:objc_opt_class()];
  unsigned int v21 = [(MailMainScene *)self mailboxPickerController];
  id v22 = [v21 messageListContainerViewController];
  v53 = v22;
  id v23 = +[NSArray arrayWithObjects:&v53 count:1];
  [(MailNavigationController *)v20 setViewControllers:v23];

  [(MailNavigationController *)v20 setDelegate:self];
  [(MailNavigationController *)v20 configureBarsForMessageList];
  [(MailMainScene *)self setMasterNavigationController:v20];
  id v24 = [(MailMainScene *)self mailboxPickerController];
  id v25 = [v24 messageListContainerViewController];

  v44 = [v25 conversationViewController];
  v45 = [[MailDetailNavigationController alloc] initWithRootViewController:v44];
  id v26 = [[MailSplitViewController alloc] initWithMailboxPickerNavigationController:v16 messageListNavigationController:v20 mailDetailNavigationController:v45 scene:self];
  [(MailMainScene *)self setSplitViewController:v26];

  v27 = [DockContainerViewController alloc];
  id v28 = +[UIApplication sharedApplication];
  id v29 = [v28 dockPersistence];
  id v30 = [(MailMainScene *)self splitViewController];
  unsigned int v31 = [(DockContainerViewController *)v27 initWithPersistence:v29 scene:self rootViewController:v30];

  [(DockContainerViewController *)v31 setDelegate:self];
  [(MailMainScene *)self setDockContainer:v31];
  [(MailMainScene *)self setShouldSelectDefaultMailboxOnResume:v4 == 0];
  if (v4)
  {
    v32 = +[MailMainScene log];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Restoration state is available, beginning restoration...", buf, 2u);
    }

    BOOL v33 = +[MailMainScene log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      BOOL v34 = [v4 ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "State: %{public}@", buf, 0xCu);
    }
    BOOL v35 = [v4 messageListStateFuture];
    [v25 restoreState:v35];
    BOOL v36 = +[EFScheduler mainThreadScheduler];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10010D3C0;
    v51[3] = &unk_100604F70;
    v51[4] = self;
    [v35 onScheduler:v36 addFailureBlock:v51];

    v37 = [(MailMainScene *)self splitViewController];
    [v37 restorePrimaryNavigationState:[v4 primaryNavState]];

    if ([v4 detailNavState])
    {
      v38 = [v4 conversationViewStateFuture];
      v39 = [v25 conversationViewController];
      [v39 restoreState:v38];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      BOOL v40 = +[EFScheduler mainThreadScheduler];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10010D428;
      v48[3] = &unk_100608570;
      objc_copyWeak(&v50, (id *)buf);
      id v49 = v25;
      [v38 onScheduler:v40 addFailureBlock:v48];

      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);
    }
  }
  id v41 = [objc_alloc((Class)_UISheetDropInteraction) initWithDelegate:self];
  v42 = [(MailMainScene *)self delegate];
  v43 = [v42 window];

  [v43 addInteraction:v41];
}

- (NSSet)suppressionMailboxes
{
  v2 = [(MailMainScene *)self mailboxPickerController];
  unsigned int v3 = [v2 messageListContainerViewController];

  id v4 = [v3 view];
  BOOL v5 = [v4 window];

  if (v5)
  {
    uint64_t v6 = [v3 mailboxes];
    unsigned int v7 = (void *)v6;
    id v8 = &__NSArray0__struct;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    unsigned __int8 v10 = +[NSSet setWithArray:v9];
  }
  else
  {
    unsigned __int8 v10 = +[NSSet set];
  }

  return (NSSet *)v10;
}

- (NSSet)visibleMailboxes
{
  v2 = [(MailMainScene *)self mailboxPickerController];
  unsigned int v3 = [v2 messageListContainerViewController];
  uint64_t v4 = [v3 mailboxes];
  BOOL v5 = (void *)v4;
  uint64_t v6 = &__NSArray0__struct;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = +[NSSet setWithArray:v7];

  return (NSSet *)v8;
}

- (MailboxPickerOutlineController)mailboxPickerController
{
  return self->_mailboxPickerController;
}

- (MailSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (BOOL)shouldSelectDefaultMailboxOnResume
{
  return self->_shouldSelectDefaultMailboxOnResume;
}

- (BOOL)shouldRequestUserNotificationAuthorization
{
  return self->_shouldRequestUserNotificationAuthorization;
}

- (BOOL)shouldRequestContactAccess
{
  return self->_shouldRequestContactAccess;
}

- (BOOL)shouldDeferUserNotificationAuthorizationRequests
{
  return self->_shouldDeferUserNotificationAuthorizationRequests;
}

- (void)setUserActivityRouter:(id)a3
{
}

- (void)setSplitViewController:(id)a3
{
}

- (void)setShouldSelectDefaultMailboxOnResume:(BOOL)a3
{
  self->_shouldSelectDefaultMailboxOnResume = a3;
}

- (void)setShouldRequestUserNotificationAuthorization:(BOOL)a3
{
  self->_shouldRequestUserNotificationAuthorization = a3;
}

- (void)setMasterNavigationController:(id)a3
{
}

- (void)setMailboxPickerController:(id)a3
{
}

- (void)setFavoritesManager:(id)a3
{
}

- (void)setDockContainer:(id)a3
{
}

- (void)setComposeViewDelegateHandler:(id)a3
{
}

- (void)setComposeUndoHandler:(id)a3
{
}

- (NSSet)selectedAccounts
{
  selectedAccounts = self->_selectedAccounts;
  if (!selectedAccounts)
  {
    uint64_t v4 = (NSSet *)objc_alloc_init((Class)NSSet);
    BOOL v5 = self->_selectedAccounts;
    self->_selectedAccounts = v4;

    selectedAccounts = self->_selectedAccounts;
  }

  return selectedAccounts;
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (DockContainerViewController)dockContainer
{
  return self->_dockContainer;
}

- (int64_t)appleIntelligenceOnboardingState
{
  return self->_appleIntelligenceOnboardingState;
}

- (AccountSetupController)accountSetupController
{
  return self->_accountSetupController;
}

- (id)_statusStringForCNAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1006088F0[a3];
  }
}

+ (BOOL)wantsDeferredConnectionActions
{
  return 1;
}

- (BOOL)displayMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailMainScene *)self currentMessageDisplayRequest];
  if (v5)
  {
    uint64_t v6 = [(MailMainScene *)self currentMessageDisplayRequest];
    unsigned __int8 v7 = [v6 hasFinished];

    if ((v7 & 1) == 0)
    {
      id v8 = +[MFError errorWithDomain:MFMessageErrorDomain code:1028 localizedDescription:0];
      id v9 = [(MailMainScene *)self currentMessageDisplayRequest];
      [v9 requestAbortedWithError:v8];
    }
  }
  unsigned __int8 v10 = [(MailMainScene *)self messageListContainerViewController];
  unsigned int v11 = [v10 conversationViewController];

  id v12 = [v4 message];
  unsigned int v13 = [v11 containsMessage:v12];

  if (!v13)
  {
    [(MailMainScene *)self setCurrentMessageDisplayRequest:v4];
    id v19 = [v4 finishFuture];
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10010E5C8;
    v88[3] = &unk_100604FE8;
    objc_copyWeak(&v89, location);
    BOOL v67 = v19;
    [v19 always:v88];
    [v4 message];
    uint64_t v84 = 0;
    BOOL v85 = &v84;
    uint64_t v86 = 0x2020000000;
    v70 = char v87 = 0;
    id v20 = [v70 mailboxes];
    BOOL v68 = v20;
    unsigned int v21 = [v20 ef_firstObjectPassingTest:&stru_1006085B8];
    BOOL v66 = v21;
    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      id v22 = [v20 firstObject];
    }
    id v23 = v22;
    v69 = [(MailMainScene *)self mailboxPickerController];
    uint64_t v24 = [v23 account];
    v65 = (void *)v24;
    if (!v70 || !v23 || !v24)
    {
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_10010E914;
      v71[3] = &unk_100607680;
      v73 = &v84;
      id v72 = v4;
      v32 = +[EFScheduler mainThreadScheduler];
      [v32 performBlock:v71];

LABEL_51:
      BOOL v18 = *((unsigned char *)v85 + 24) != 0;

      _Block_object_dispose(&v84, 8);
      objc_destroyWeak(&v89);
      objc_destroyWeak(location);

      goto LABEL_52;
    }
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10010E630;
    v83[3] = &unk_1006047A0;
    v83[4] = self;
    +[UIViewController _performWithoutDeferringTransitions:v83];
    [v69 dismissAndUnfocus];
    if ([v23 type] == (id)5)
    {
      id v25 = +[UIApplication sharedApplication];
      id v26 = [v25 mailboxProvider];
      v27 = [v70 mailboxObjectIDs];
      id v28 = [v27 firstObject];
      id v29 = [v26 legacyMailboxForObjectID:v28];
      unsigned int v64 = +[MFComposeMailMessage legacyMessageWithMessage:v70 mailboxUid:v29];

      id v63 = [objc_alloc((Class)_MFMailCompositionContext) initDraftRestoreOfMessage:v70 legacyMessage:v64];
      -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:");
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_10010E63C;
      v81[3] = &unk_1006047A0;
      id v82 = v4;
      id v30 = +[EFScheduler mainThreadScheduler];
      [v30 performBlock:v81];

      unsigned int v31 = v82;
LABEL_50:

      *((unsigned char *)v85 + 24) = 1;
      goto LABEL_51;
    }
    BOOL v33 = [(MailMainScene *)self selectedAccounts];
    id v34 = [v33 count];

    BOOL v35 = [v68 ef_firstObjectPassingTest:&stru_1006085D8];

    BOOL v37 = (unint64_t)v34 > 1 && v35 != 0;
    unsigned __int8 v61 = v37;
    unsigned int v64 = [v70 flags];
    unsigned int v38 = [v70 isVIP];
    unsigned int v39 = [v64 flagged];
    BOOL v40 = [(MailMainScene *)self favoritesManager];
    id v63 = [v40 lastSelectedItem];

    id v41 = [(MailMainScene *)self favoritesManager];
    v62 = [v41 mailboxesCollection];

    id v42 = [v63 sourceType];
    v43 = [(MailMainScene *)self splitViewController];
    v44 = [v43 viewControllerForColumn:0];

    uint64_t v45 = 0;
    if (!v35 || !(v38 | v39))
    {
LABEL_45:
      id v56 = [v44 popViewControllerAnimated:0];
      unsigned __int8 v57 = v61;
      char v58 = v61 ^ 1;
      if (v45) {
        char v58 = 1;
      }
      if ((v58 & 1) == 0) {
        unsigned __int8 v57 = [v62 isShowingAllInboxes];
      }
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10010E71C;
      v74[3] = &unk_100608600;
      id v75 = v69;
      unsigned __int8 v80 = v57;
      id v76 = v70;
      uint64_t v79 = v45;
      id v23 = v23;
      id v77 = v23;
      id v78 = v4;
      v59 = +[EFScheduler mainThreadScheduler];
      [v59 performBlock:v74];

      unsigned int v31 = v62;
      goto LABEL_50;
    }
    if (v38)
    {
      unsigned int v46 = [v62 isShowingSharedMailboxOfType:1];
      if ((v46 | v39 ^ 1))
      {
        uint64_t v45 = v46;
        goto LABEL_31;
      }
    }
    else if (!v39)
    {
      LOBYTE(v46) = 0;
      uint64_t v45 = 0;
      goto LABEL_31;
    }
    unsigned int v46 = [v62 isShowingSharedMailboxOfType:2];
    if (v46) {
      uint64_t v45 = 2;
    }
    else {
      uint64_t v45 = 0;
    }
LABEL_31:
    if ((unint64_t)v34 >= 2 && v42) {
      goto LABEL_45;
    }
    if ((unint64_t)v34 >= 2 && !v42)
    {
      uint64_t v45 = 0;
      goto LABEL_45;
    }
    char v47 = v46 ^ 1;
    if (v42) {
      char v47 = 1;
    }
    if (v47) {
      goto LABEL_45;
    }
    v48 = [v63 representingMailbox];
    id v49 = [v44 viewControllers];
    id v50 = [v69 messageListContainerViewController];
    id v51 = [v49 containsObject:v50];
    if (v51)
    {
      unsigned int v52 = sub_10010E64C((uint64_t)v51, v48, v68);

      if (v52)
      {
        v53 = +[UIApplication sharedApplication];
        v54 = [v53 mailboxProvider];
        uint64_t v55 = [v54 mailboxFromLegacyMailbox:v48];

        uint64_t v45 = 0;
        id v23 = (id)v55;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
    }
    v53 = +[UIApplication sharedApplication];
    v54 = [v53 accountsProvider];
    unsigned __int8 v61 = [v54 isDisplayingMultipleAccounts];
    goto LABEL_44;
  }
  id v14 = [(MailMainScene *)self activationState];
  unsigned __int8 v15 = [(MailMainScene *)self splitViewController];
  [v15 showConversationViewControllerAnimated:v14 == 0 completion:0];

  uint64_t v16 = [v4 message];
  [v11 scrollToMessageIfPossible:v16 animated:v14 == 0 pin:1];

  char v17 = +[NSError ef_cancelledError];
  [v4 requestAbortedWithError:v17];

  BOOL v18 = 1;
LABEL_52:

  return v18;
}

- (NSSet)statusMailboxes
{
  if ([(MailMainScene *)self _isMailboxListVisible])
  {
    unsigned int v3 = [(MailMainScene *)self favoritesManager];
    id v4 = [v3 visibleItemsOfType:3];
    BOOL v5 = [v4 ef_flatMap:&stru_100608640];
    uint64_t v6 = [v5 ef_filter:EFIsNotNull];

    unsigned __int8 v7 = +[UIApplication sharedApplication];
    id v8 = [v7 mailboxProvider];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10010EC30;
    v19[3] = &unk_100607B28;
    id v9 = v8;
    id v20 = v9;
    unsigned __int8 v10 = [v6 ef_compactMap:v19];
    unsigned int v11 = +[NSSet setWithArray:v10];
  }
  else
  {
    id v12 = [(MailMainScene *)self mailboxPickerController];
    unsigned int v13 = [v12 messageListContainerViewController];
    uint64_t v14 = [v13 mailboxes];
    unsigned __int8 v15 = (void *)v14;
    uint64_t v16 = &__NSArray0__struct;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    id v17 = v16;

    unsigned int v11 = +[NSSet setWithArray:v17];
  }

  return (NSSet *)v11;
}

- (void)mailSceneWillResignActive
{
  v9.receiver = self;
  v9.super_class = (Class)MailMainScene;
  [(MailScene *)&v9 mailSceneWillResignActive];
  if ([(MailMainScene *)self isComposeWindowActive])
  {
    unsigned int v3 = [(MailMainScene *)self dockContainer];
    id v4 = [v3 activeViewController];

    id v5 = v4;
    uint64_t v6 = [v5 _mailComposeController];
    [v6 finishEnteringRecipients];

    if ([v5 isQuickReply])
    {
      unsigned __int8 v7 = [v5 _mailComposeController];
      [v7 backUpDraft];
    }
  }
  id v8 = [(MailMainScene *)self messageListContainerViewController];
  [v8 suspendRefreshAnimationIfNecessary];
}

- (void)mailSceneDidEnterBackground
{
  v4.receiver = self;
  v4.super_class = (Class)MailMainScene;
  [(MailScene *)&v4 mailSceneDidEnterBackground];
  [(MailMainScene *)self setShouldDeferUserNotificationAuthorizationRequests:0];
  unsigned int v3 = [(MailMainScene *)self errorHandler];
  [v3 reset];
}

- (void)mailSceneDidDisconnect
{
  v6.receiver = self;
  v6.super_class = (Class)MailMainScene;
  [(MailScene *)&v6 mailSceneDidDisconnect];
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = [(MailScene *)self daemonInterface];
  id v5 = [v4 outgoingMessageRepository];
  [v5 removeOutgoingMessageRepositoryObserver:self];
}

- (void)mailSceneWillContinueUserActivityWithType:(id)a3
{
  id v8 = a3;
  objc_super v4 = +[UIApplication sharedApplication];
  id v5 = [v4 freeSpaceMonitor];
  if ([v5 isFreeSpaceCritical])
  {
  }
  else
  {
    unsigned __int8 v6 = [(MailMainScene *)self _presentInitialSetupControllersIfNecessary];

    if (v6) {
      goto LABEL_6;
    }
    unsigned __int8 v7 = [(MailMainScene *)self dockContainer];
    [v7 popToRootViewControllerAnimated:1];

    objc_super v4 = [(MailMainScene *)self userActivityRouter];
    [v4 routeWillContinueUserActivityWithType:v8];
  }

LABEL_6:
}

- (void)mailSceneContinueUserActivity:(id)a3
{
  id v7 = a3;
  objc_super v4 = +[UIApplication sharedApplication];
  id v5 = [v4 freeSpaceMonitor];
  if ([v5 isFreeSpaceCritical])
  {
  }
  else
  {
    unsigned __int8 v6 = [(MailMainScene *)self _presentInitialSetupControllersIfNecessary];

    if (v6) {
      goto LABEL_6;
    }
    objc_super v4 = [(MailMainScene *)self userActivityRouter];
    [v4 routeUserActivity:v7];
  }

LABEL_6:
}

- (void)mailSceneDidFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MailMainScene *)self userActivityRouter];
  [v7 routeUserActivityFailedWithType:v8 error:v6];
}

- (void)mailScenePerformActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIApplication sharedApplication];
  objc_super v9 = [v8 freeSpaceMonitor];
  if ([v9 isFreeSpaceCritical]) {
    goto LABEL_12;
  }
  unsigned __int8 v10 = [(MailMainScene *)self _presentInitialSetupControllersIfNecessary];

  if ((v10 & 1) == 0)
  {
    id v8 = [v6 type];
    unsigned int v11 = [(MailMainScene *)self mailboxPickerController];
    id v12 = [v11 messageListContainerViewController];
    objc_super v9 = [v12 messageListViewController];

    if ([v8 isEqualToString:@"com.apple.mobilemail.NewMessageApplicationShortcut"])
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10010F464;
      v22[3] = &unk_100608690;
      v22[4] = self;
      id v23 = v7;
      +[UIViewController _performWithoutDeferringTransitions:v22];
      unsigned int v13 = &v23;
    }
    else
    {
      if ([v8 isEqualToString:@"com.apple.mobilemail.SearchApplicationShortcut"])
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10010F700;
        v19[3] = &unk_1006061A0;
        void v19[4] = self;
        id v20 = v9;
        id v21 = v7;
        +[UIViewController _performWithoutDeferringTransitions:v19];
        unsigned int v13 = &v20;
        uint64_t v14 = &v21;
      }
      else
      {
        if (![v8 isEqualToString:@"com.apple.mobilemail.FavoriteItemApplicationShortcut"])
        {
LABEL_11:
          (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_12:

          goto LABEL_13;
        }
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10010F7B4;
        v15[3] = &unk_1006086B8;
        v15[4] = self;
        id v16 = v9;
        id v17 = v6;
        id v18 = v7;
        +[UIViewController _performWithoutDeferringTransitions:v15];
        unsigned int v13 = &v16;
        uint64_t v14 = &v17;
      }
    }

    goto LABEL_11;
  }
LABEL_13:
}

- (id)stateRestorationActivityForMailScene
{
  unsigned int v3 = +[MailMainScene log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(MailMainScene *)self _sceneIdentifier];
    *(_DWORD *)buf = 138412290;
    id v50 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restoration state was requested for MailMainScene with identifier %@. Starting state capture...", buf, 0xCu);
  }
  id v5 = [(MailMainScene *)self favoritesManager];
  id v41 = [v5 dictionaryRepresentation];

  id v6 = [(MailMainScene *)self splitViewController];
  unsigned int v40 = [v6 isCollapsed];
  BOOL v37 = [v6 viewControllerForColumn:0];
  uint64_t v7 = [v37 topViewController];
  unsigned int v38 = (void *)v7;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v9 = [v6 messageListNavController];
    BOOL v10 = v7 == (void)v9;

    if (v10) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  BOOL v35 = [v6 viewControllerForColumn:2];
  unsigned int v11 = [v35 topViewController];
  BOOL v36 = v11;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = v11;
    if ([v12 isPrimary]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    uint64_t v14 = [v12 captureRestorationState];
    id v15 = [v12 newBackgroundMonitor];
    unsigned int v39 = (void *)v14;
    [(MailScene *)self addBackgroundMonitor:v15];
  }
  else
  {
    unsigned int v39 = 0;
    uint64_t v13 = 0;
  }
  id v16 = [(MailMainScene *)self mailboxPickerController];
  id v17 = [v16 messageListContainerViewController];
  id v18 = [v17 captureRestorationState];

  if (v18)
  {
    id v19 = [MailSceneBackgroundQueryMonitor alloc];
    id v20 = [v18 visibleItems];
    id v21 = [v18 messageList];
    id v22 = [(MailScene *)self daemonInterface];
    id v23 = [v22 messageRepository];
    uint64_t v24 = [(MailSceneBackgroundQueryMonitor *)v19 initWithMessageListItems:v20 messageList:v21 messageRepository:v23 changeTypes:8];

    [(MailScene *)self addBackgroundMonitor:v24];
  }
  id v25 = [MailMainSceneState alloc];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10010FF54;
  v42[3] = &unk_1006086E0;
  id v26 = v41;
  id v43 = v26;
  uint64_t v46 = v8;
  uint64_t v47 = v40 ^ 1;
  uint64_t v48 = v13;
  id v27 = v39;
  id v44 = v27;
  id v28 = v18;
  id v45 = v28;
  id v29 = [(MailMainSceneState *)v25 initWithBuilder:v42];
  id v30 = +[MailMainScene log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v31 = [(MailMainSceneState *)v29 ef_publicDescription];
    *(_DWORD *)buf = 138543362;
    id v50 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Restoration state capture complete: %{public}@", buf, 0xCu);
  }
  id v32 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.mobilemail.state.mailmainscene"];
  BOOL v33 = [(MailMainSceneState *)v29 dictionaryRepresentation];
  [v32 setUserInfo:v33];

  return v32;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 1;
}

- (id)_createURLRoutes
{
  v12.receiver = self;
  v12.super_class = (Class)MailMainScene;
  unsigned int v3 = [(MailScene *)&v12 _createURLRoutes];
  id v4 = [v3 mutableCopy];

  id v5 = [[MFMessageDisplayURLRoute alloc] initWithScene:self];
  [v4 addObject:v5];

  id v6 = [[MFComposeURLRoute alloc] initWithScene:self];
  [v4 addObject:v6];

  uint64_t v7 = [[MFVIPURLRoute alloc] initWithScene:self];
  [v4 addObject:v7];

  uint64_t v8 = [[MFFileURLRoute alloc] initWithScene:self];
  [v4 addObject:v8];

  objc_super v9 = [[MFMailboxURLRoute alloc] initWithScene:self];
  [v4 addObject:v9];

  id v10 = [v4 copy];

  return v10;
}

- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 URL];
  if (objc_msgSend(v8, "mf_isOAuthRedirectURL"))
  {

LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)MailMainScene;
    unint64_t v11 = [(MailScene *)&v13 urlRouter:v6 decidePolicyForRoutingRequest:v7];
    goto LABEL_6;
  }
  unsigned int v9 = [(MailMainScene *)self _presentInitialSetupControllersIfNecessary];

  if (!v9) {
    goto LABEL_5;
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011033C;
  v14[3] = &unk_100604C00;
  objc_copyWeak(&v16, &location);
  id v15 = v7;
  id v10 = +[EFInvocationToken tokenWithLabel:@"Post account setup action" invocationBlock:v14];
  [(MailMainScene *)self setPostAccountSetupInvocation:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  unint64_t v11 = 1;
LABEL_6:

  return v11;
}

- (void)dockContainer:(id)a3 didRestoreViewController:(id)a4
{
  id v12 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v12;
    id v6 = [(MailMainScene *)self composeViewDelegateHandler];
    [v5 setMailComposeDelegate:v6];

    id v7 = [MFActiveDraft alloc];
    uint64_t v8 = [v5 autosaveIdentifier];
    unsigned int v9 = [v5 originalMessageObjectID];
    id v10 = [(MFActiveDraft *)v7 initWithIdentifier:v8 andOriginalMessageIdentifier:v9];
    unint64_t v11 = [(MailMainScene *)self session];
    [v11 mf_setActiveDraft:v10];
  }
}

- (void)dockContainer:(id)a3 dockedViewControllerWithIdentifier:(id)a4
{
  id v10 = a4;
  id v5 = [(MailMainScene *)self session];
  id v6 = [v5 mf_activeDraft];
  id v7 = [v6 identifier];
  unsigned int v8 = [v10 isEqualToString:v7];

  if (v8)
  {
    unsigned int v9 = [(MailMainScene *)self session];
    [v9 mf_setActiveDraft:0];
  }
}

- (void)dockContainer:(id)a3 dockedViewWasTornOffWithIdentifier:(id)a4
{
  id v10 = a4;
  id v5 = [(MailMainScene *)self session];
  id v6 = [v5 mf_activeDraft];
  id v7 = [v6 identifier];
  unsigned int v8 = [v10 isEqualToString:v7];

  if (v8)
  {
    unsigned int v9 = [(MailMainScene *)self session];
    [v9 mf_setActiveDraft:0];
  }
}

- (BOOL)_isMailboxListVisible
{
  v2 = [(MailMainScene *)self splitViewController];
  unsigned int v3 = (char *)[v2 displayMode];

  return (unint64_t)(v3 - 4) < 3;
}

- (BOOL)isComposeWindowActive
{
  v2 = [(MailMainScene *)self dockContainer];
  unsigned int v3 = [v2 activeViewController];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v4 = [v3 isBeingDismissed] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)composeControllerForCompositionContext:(id)a3
{
  id v4 = a3;
  id v5 = [[ComposeNavigationController alloc] initWithComposition:v4];
  id v6 = [(MailMainScene *)self composeViewDelegateHandler];
  [(ComposeNavigationController *)v5 setMailComposeDelegate:v6];

  return v5;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
}

- (void)_showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 draftOriginalMessageID:(id)a7 completionBlock:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v42 = a7;
  id v17 = a8;
  id v41 = v17;
  id v18 = [(MailMainScene *)self composeControllerForCompositionContext:v14];
  if (v18)
  {
    id v19 = [v14 originalMessage];

    if (v19 && [v14 composeType] != (id)4) {
      [v14 composeType];
    }
    if (v15) {
      [v18 setInitialTitle:v15];
    }
    id v20 = [(MailMainScene *)self composeCompletionBlock];

    if (v20)
    {
      id v21 = [(MailMainScene *)self composeCompletionBlock];
      v21[2]();
    }
    [(MailMainScene *)self setComposeCompletionBlock:v17];
    id v22 = [v18 autosaveIdentifier];
    unsigned int v39 = [v18 originalMessageObjectID];
    if (v22)
    {
      id v23 = +[UIApplication sharedApplication];
      uint64_t v24 = [v23 dockPersistence];
      [v24 removeDockedStateWithIdentifier:v22 sender:0];
    }
    BOOL v38 = v12;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100110D60;
    v43[3] = &unk_100608708;
    v43[4] = self;
    id v25 = v22;
    id v44 = v25;
    id v45 = v42;
    id v26 = v39;
    id v46 = v26;
    id v27 = v18;
    id v47 = v27;
    unsigned int v40 = objc_retainBlock(v43);
    id v28 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
    unsigned int v29 = [v28 isClarityBoardEnabled];

    if ((+[UIDevice mf_isPad] ^ 1 | v29))
    {
      id v30 = [v14 attachmentToMarkupContentID];
      id v36 = v16;
      id v37 = v15;
      if (!v30) {
        goto LABEL_18;
      }
      unsigned int v31 = [(MailMainScene *)self dockContainer];
      id v32 = [v31 presentedViewController];
      off_10068E140();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v16 = v36;
        id v15 = v37;
        id v34 = [(MailMainScene *)self dockContainer];
        BOOL v35 = [v34 presentedViewController];
        [v35 presentViewController:v27 animated:v38 completion:v40];
      }
      else
      {
LABEL_18:
        id v16 = v36;
        id v15 = v37;
        id v34 = [(MailMainScene *)self dockContainer];
        [v34 presentViewController:v27 animated:v38 completion:v40];
      }
    }
    else
    {
      +[MFBayAdoption openComposeWithContext:v14 presentationSource:v16 requestingScene:self];
    }
  }
  else
  {
    id v25 = +[MailMainScene log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10045A8CC();
    }
  }
}

- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    id v7 = [objc_alloc((Class)_MFMailCompositionContext) initDraftRestoreOfMessage:v8 legacyMessage:v6];
  }
  else
  {
    id v7 = objc_alloc_init((Class)_MFMailCompositionContext);
    [v7 setShowKeyboardImmediately:1];
  }
  [(MailMainScene *)self showComposeWithContext:v7 animated:1 initialTitle:0 presentationSource:0 completionBlock:0];
}

- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4
{
}

- (void)_saveCompositionAsDraft:(id)a3
{
  id v6 = [a3 _mailComposeController];
  [v6 forceSaveAsDraft];
  unsigned int v3 = [[MFMailComposeDeliveryController alloc] initWithComposeController:v6];
  if (v3)
  {
    id v4 = +[MFInvocationQueue sharedInvocationQueue];
    id v5 = +[MFMonitoredInvocation invocationWithSelector:"deliverMessage" target:v3 taskName:0 priority:6 canBeCancelled:1];
    [v4 addInvocation:v5];
  }
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  LOBYTE(v5) = a3;
  unsigned int v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:&v4];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_composeCommandInvoked:" == a3 || "debugShortcutInvoked:" == a3)
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MailMainScene;
    BOOL v8 = [(MailScene *)&v10 canPerformAction:a3 withSender:v6];
  }

  return v8;
}

- (void)_composeCommandInvoked:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_100111348;
  objc_super v10 = &unk_100607958;
  unint64_t v11 = self;
  id v4 = a3;
  id v12 = v4;
  uint64_t v5 = objc_retainBlock(&v7);
  if ([(MailMainScene *)self isComposeWindowActive])
  {
    id v6 = [(MailMainScene *)self dockContainer];
    [v6 dockPresentedViewControllerWithCompletion:v5];
  }
  else
  {
    ((void (*)(void ***, uint64_t))v5[2])(v5, 1);
  }
}

- (void)_openMailboxQuicklyInvoked:(id)a3
{
  if (![(MailMainScene *)self isOpenMailboxQuicklyViewVisible])
  {
    id v6 = [(MailMainScene *)self mailboxPickerController];
    unsigned int v4 = [v6 isEditing];

    if (v4)
    {
      id v7 = [(MailMainScene *)self mailboxPickerController];
      [v7 setEditing:0 animated:1];
    }
    [(MailMainScene *)self refreshOpenMailboxQuicklyItems];
    id v8 = [(MailMainScene *)self dockContainer];
    uint64_t v5 = [(MailMainScene *)self openMailboxQuicklyViewController];
    [v8 presentViewController:v5 animated:1 completion:0];
  }
}

- (BOOL)isOpenMailboxQuicklyViewVisible
{
  if (!self->_openMailboxQuicklyViewController) {
    return 0;
  }
  v2 = [(MailMainScene *)self openMailboxQuicklyViewController];
  unsigned int v3 = [v2 viewIfLoaded];
  unsigned int v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (UIViewController)openMailboxQuicklyViewController
{
  openMailboxQuicklyViewController = self->_openMailboxQuicklyViewController;
  if (!openMailboxQuicklyViewController)
  {
    unsigned int v4 = [(MailMainScene *)self favoritesManager];
    BOOL v5 = +[OpenMailboxQuicklyFactory createOpenMailboxQuicklyViewControllerWithFavoritesManager:v4 delegate:self];
    id v6 = self->_openMailboxQuicklyViewController;
    self->_openMailboxQuicklyViewController = v5;

    openMailboxQuicklyViewController = self->_openMailboxQuicklyViewController;
  }

  return openMailboxQuicklyViewController;
}

- (void)refreshOpenMailboxQuicklyItems
{
  unsigned int v3 = (NSArray *)objc_opt_new();
  unsigned int v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = self;
  BOOL v5 = [(MailMainScene *)self favoritesManager];
  id v6 = [v5 visibleMailboxCollections];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      id v21 = v7;
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        objc_super v10 = [v9 itemsIncludingSubItems];
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v23;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
              id v15 = [v14 itemURLString];
              if (v15 && ([v4 containsObject:v15] & 1) == 0)
              {
                id v16 = +[OpenMailboxQuicklyFactory createOpenMailboxQuicklyItemWithFavoriteItem:v14];
                if (v16)
                {
                  [(NSArray *)v3 addObject:v16];
                  [v4 addObject:v15];
                }
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  openMailboxQuicklyItems = v18->_openMailboxQuicklyItems;
  v18->_openMailboxQuicklyItems = v3;
}

- (void)openMailboxQuicklyDidSelectMailboxWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailMainScene *)self favoritesManager];
  id v16 = v4;
  id v6 = +[NSArray arrayWithObjects:&v16 count:1];
  id v7 = [v5 itemsMatchingItemURLStrings:v6];

  id v8 = [v7 firstObject];
  if (v8)
  {
    unsigned int v9 = [(MailMainScene *)self mailboxPickerController];
    objc_super v10 = [v8 smartMailbox];

    if (v10)
    {
      id v11 = [v9 favoriteItemSelectionTarget];
      -[NSObject selectCombinedInboxWithSourceType:item:animated:](v11, "selectCombinedInboxWithSourceType:item:animated:", [v8 sourceType], v8, 0);
    }
    else
    {
      uint64_t v12 = [v8 representingMailbox];

      if (v12)
      {
        id v11 = [v8 representingMailbox];
        objc_super v13 = [v9 favoriteItemSelectionTarget];
        [v13 selectMailbox:v11 item:v8 animated:0];
      }
      else
      {
        id v11 = +[MailMainScene log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to select mailbox since no mailbox was found for FavoriteItem", v15, 2u);
        }
      }
    }
  }
  else
  {
    unsigned int v9 = +[MailMainScene log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to select mailbox since no matching FavoriteItem with identifier was found", v15, 2u);
    }
  }

  id v14 = [(MailMainScene *)self dockContainer];
  [v14 dismissViewControllerAnimated:1 completion:0];
}

- (void)closeOpenMailboxQuicklyViewController
{
  id v2 = [(MailMainScene *)self dockContainer];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)composeButtonPressed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailMainScene *)self dockContainer];
  id v6 = [v5 presentedViewController];

  if (v6 && [v6 modalPresentationStyle] == (id)7)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    id v7 = [(MailMainScene *)self dockContainer];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100112010;
    v18[3] = &unk_100604C00;
    objc_copyWeak(&v20, (id *)location);
    id v19 = v4;
    [v7 dismissViewControllerAnimated:1 completion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v8 = +[MailMainScene log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id location = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Created invocation to update aliases.", location, 2u);
    }

    unsigned int v9 = +[MFInvocationQueue sharedInvocationQueue];
    objc_super v10 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliasesForActiveAccounts" target:objc_opt_class()];
    [v9 addInvocation:v10];

    unsigned __int8 v17 = -86;
    id v11 = objc_alloc_init((Class)_MFMailCompositionContext);
    [v11 setShowKeyboardImmediately:1];
    uint64_t v12 = [(MailMainScene *)self composeAccountIsDefault:&v17];
    objc_super v13 = +[MailMainScene log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 ef_publicDescription];
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v14;
      __int16 v22 = 1024;
      int v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Compose using account:%@, isDefault: %{BOOL}d.", location, 0x12u);
    }
    id v15 = [v12 defaultEmailAddress];
    id v16 = v15;
    if (!v15)
    {
      id v16 = [v12 firstEmailAddress];
    }
    [v11 setPreferredSendingEmailAddress:v16];
    if (!v15) {

    }
    [v11 setIsUsingDefaultAccount:v17];
    [v11 setPrefersFirstLineSelection:1];
    [(MailMainScene *)self showComposeWithContext:v11 animated:1 initialTitle:0 presentationSource:0 completionBlock:0];
  }
}

- (void)composeButtonLongPressed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [PreviousDraftPickerController alloc];
  id v6 = [(MailScene *)self daemonInterface];
  id v7 = [v6 messageRepository];
  id v8 = [(PreviousDraftPickerController *)v5 initWithMessageRepository:v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001122B0;
  v15[3] = &unk_100608730;
  v15[4] = self;
  [(PreviousDraftPickerController *)v8 setActionBlock:v15];
  unsigned int v9 = [(MailMainScene *)self previousDraftPickerPopoverPresentationDelegate];

  if (!v9)
  {
    objc_super v10 = objc_alloc_init(PreviousDraftPickerPopoverPresentationDelegate);
    [(MailMainScene *)self setPreviousDraftPickerPopoverPresentationDelegate:v10];
  }
  [(PreviousDraftPickerController *)v8 setModalPresentationStyle:7];
  id v11 = [(PreviousDraftPickerController *)v8 popoverPresentationController];
  uint64_t v12 = [(MailMainScene *)self previousDraftPickerPopoverPresentationDelegate];
  [v11 setDelegate:v12];

  [v11 setPermittedArrowDirections:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setBarButtonItem:v4];
  }
  else
  {
    id v13 = v4;
    [v11 setSourceView:v13];
    [v13 bounds];
    [v11 setSourceRect:];
  }
  id v14 = [(MailMainScene *)self dockContainer];
  [v14 presentViewController:v8 animated:1 completion:0];
}

- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001125D0;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  unsigned int v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (((unint64_t)[v9 status] & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    objc_super v10 = +[MFNetworkController sharedInstance];
    unsigned int v11 = [v10 isDataAvailable];

    if (v11)
    {
      uint64_t v12 = [v15 error];
      id v13 = [v8 account];
      [(MailMainScene *)self displayError:v12 forAccount:v13 mode:2];
    }
  }
  id v14 = +[MFActivityMonitor currentMonitor];
  [v14 reset];
}

- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  if (!a5)
  {
    id v9 = +[MFNetworkController sharedInstance];
    unsigned int v10 = [v9 isDataAvailable];

    if (v10)
    {
      unsigned int v11 = [v12 error];
      [(MailMainScene *)self displayError:v11 forAccount:v8 mode:2];
    }
  }
}

- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  id v8 = objc_alloc((Class)_MFMailCompositionContext);
  id v9 = [v15 objectID];
  unsigned int v10 = [(MailScene *)self daemonInterface];
  unsigned int v11 = [v10 messageRepository];
  id v12 = +[UIApplication sharedApplication];
  id v13 = [v12 mailboxProvider];
  id v14 = [v8 initWithComposeType:2 objectID:v9 mailboxID:v7 subject:0 autosaveID:0 messageRepository:v11 mailboxProvider:v13];

  [(MailMainScene *)self showComposeWithContext:v14 animated:1 initialTitle:0 presentationSource:0 completionBlock:0];
}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MailMainScene *)self session];
  [v9 mf_setActiveDraft:0];

  unsigned int v10 = [v8 navigationController];
  unsigned int v11 = [(MailMainScene *)self mailboxPickerController];
  id v12 = [v11 messageListContainerViewController];

  id v13 = [v12 mailboxes];
  unsigned __int8 v14 = [v13 ef_any:&stru_100608750];

  id v15 = [(MailMainScene *)self dockContainer];
  id v16 = [v15 activeViewController];

  if (([v8 isQuickReply] & 1) == 0)
  {
    if ([v16 isEqual:v10])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100112D98;
      v20[3] = &unk_100608778;
      id v21 = v10;
      __int16 v22 = self;
      unsigned __int8 v23 = v14;
      BOOL v24 = v5;
      unsigned __int8 v17 = objc_retainBlock(v20);
      if (v6 && v5)
      {
        id v18 = [(MailMainScene *)self dockContainer];
        [v18 dismissViewControllerWithTransition:3 completion:v17];
      }
      else
      {
        id v18 = [(MailMainScene *)self dockContainer];
        [v18 dismissViewControllerAnimated:v6 completion:v17];
      }

      id v19 = v21;
    }
    else
    {
      id v19 = +[MailMainScene log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10045A70C((uint64_t)v8, (uint64_t)v16, v19);
      }
    }
  }
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MailMainScene log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v6 ef_publicDescription];
    sub_10045A900((uint64_t)v5, v8, v9, v7);
  }
}

- (id)activeViewController
{
  id v2 = [(MailMainScene *)self dockContainer];
  unsigned int v3 = [v2 activeViewController];

  return v3;
}

- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager
{
  if (_os_feature_enabled_impl())
  {
    id v2 = +[UIApplication sharedApplication];
    unsigned int v3 = [v2 appStoreReviewManager];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return (_TtC10MobileMail21AppStoreReviewManager *)v3;
}

- (BOOL)_presentInitialSetupControllersIfNecessary
{
  if ([(MailMainScene *)self presentAccountSetupControllerIfNecessary]
    || [(MailMainScene *)self presentOnboardingIfNecessary])
  {
    return 1;
  }
  [(MailMainScene *)self _requestUserNotificationAuthorization];
  return 0;
}

- (void)_cleanUpDeprecatedOnboarding
{
  id v2 = +[NSUserDefaults em_userDefaults];
  [v2 removeObjectForKey:@"PresentedWhatsNewInSydro"];

  id v3 = +[NSUserDefaults em_userDefaults];
  [v3 removeObjectForKey:@"LastWelcomeOnboardingUpdate"];
}

- (BOOL)presentOnboardingIfNecessary
{
  id v3 = [(MailMainScene *)self onboardingNavigationController];

  if (v3)
  {
    id v4 = +[MailMainScene log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Onboarding is already in progress. Aborting onboarding.", v6, 2u);
    }

    return 1;
  }
  else
  {
    return [(MailMainScene *)self presentNextOnboardingIfNecessary];
  }
}

- (BOOL)presentNextOnboardingIfNecessary
{
  BOOL v3 = [(MailMainScene *)self _shouldPresentOnboarding];
  if (v3)
  {
    [(MailMainScene *)self _presentOnboarding];
  }
  else
  {
    id v4 = [(MailMainScene *)self onboardingNavigationController];

    if (v4)
    {
      id v5 = [(MailMainScene *)self onboardingNavigationController];
      [v5 dismissViewControllerAnimated:1 completion:0];

      [(MailMainScene *)self setOnboardingNavigationController:0];
      [(MailMainScene *)self setMailTrackingProtectionOnboardingViewController:0];
      id v6 = [(MailMainScene *)self postAccountSetupInvocation];

      if (v6)
      {
        id v7 = [(MailMainScene *)self postAccountSetupInvocation];
        [v7 invoke];

        [(MailMainScene *)self setPostAccountSetupInvocation:0];
      }
      [(MailMainScene *)self _requestUserNotificationAuthorization];
      [(MailMainScene *)self _cleanUpDeprecatedOnboarding];
    }
  }
  return v3;
}

- (void)_presentOnboarding
{
  id v7 = [(MailMainScene *)self _nextOnboardingController];
  if (v7)
  {
    BOOL v3 = [(MailMainScene *)self onboardingNavigationController];

    if (v3)
    {
      id v4 = [(MailMainScene *)self onboardingNavigationController];
      [v4 pushViewController:v7 animated:1];
    }
    else
    {
      id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
      [(MailMainScene *)self setOnboardingNavigationController:v5];

      id v4 = [(MailMainScene *)self dockContainer];
      id v6 = [(MailMainScene *)self onboardingNavigationController];
      [v4 presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (id)_nextOnboardingController
{
  if (![(MailMainScene *)self _shouldPresentWelcomeOnboarding]
    || ([(MailMainScene *)self _createAppleIntelligenceWelcomeOnboardingController], (BOOL v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(MailMainScene *)self _shouldPresentMailTrackingProtectionOnboarding])
    {
      BOOL v3 = [(MailMainScene *)self _createMailTrackingProtectionOnboardingController];
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (BOOL)_shouldPresentWelcomeOnboarding
{
  if (![(MailMainScene *)self appleIntelligenceOnboardingState]) {
    [(MailMainScene *)self _prepareForAppleIntelligenceOnboardingIfNecessary];
  }
  return (id)[(MailMainScene *)self appleIntelligenceOnboardingState] == (id)3;
}

- (BOOL)_shouldPresentMailTrackingProtectionOnboarding
{
  BOOL v3 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v4 = [v3 integerForKey:EMUserDefaultLoadRemoteContentKey];

  if ((v4 & 2) != 0)
  {
    unsigned int v10 = +[MailMainScene log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tracking prevention onboarding not presented -- blocking remote content", buf, 2u);
    }

    unsigned int v11 = self;
    uint64_t v12 = 1;
    goto LABEL_16;
  }
  if (v4)
  {
    id v7 = +[MailMainScene log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      id v13 = "Tracking prevention onboarding not presented -- already set by user";
      unsigned __int8 v14 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
LABEL_15:

    unsigned int v11 = self;
    uint64_t v12 = 0;
LABEL_16:
    [(MailMainScene *)v11 _sendOnboardingAnalyticsDidShowOnboarding:0 wasPreviouslyBlockingRemoteContent:v12];
    return 0;
  }
  id v5 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v6 = [v5 isMailPrivacyProtectionAllowed];

  id v7 = +[MailMainScene log];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      *(_WORD *)id v16 = 0;
      id v13 = "Tracking prevention onboarding not presented -- prohibited by MDM";
      unsigned __int8 v14 = v16;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v8)
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tracking prevention onboarding should be presented", v15, 2u);
  }

  return 1;
}

- (void)_prepareForAppleIntelligenceOnboardingIfNecessary
{
  id v3 = +[MUIAppleIntelligenceOnboardingViewController currentAppleIntelligenceOnboardingState];
  [(MailMainScene *)self setAppleIntelligenceOnboardingState:v3];
  unsigned __int8 v4 = +[MailMainScene log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple Intelligence onboarding state=%ld", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_createAppleIntelligenceWelcomeOnboardingController
{
  id v3 = +[MailMainScene log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Create Apple Intelligence welcome onboarding", v10, 2u);
  }

  unsigned __int8 v4 = [(MailMainScene *)self mailAppleIntelligenceWelcomeOnboardingViewController];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)MUIAppleIntelligenceOnboardingViewController);
    [(MailMainScene *)self setMailAppleIntelligenceWelcomeOnboardingViewController:v5];
    uint64_t v6 = kAppleIntelligenceOnboardingViewControllerDidCompleteNotification;

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_mailAppleIntelligenceWelcomeViewControllerDidFinish:" name:v6 object:0];
  }
  BOOL v8 = [(MailMainScene *)self mailAppleIntelligenceWelcomeOnboardingViewController];

  return v8;
}

- (id)_createMailTrackingProtectionOnboardingController
{
  id v3 = +[MailMainScene log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = [(MailMainScene *)self mailTrackingProtectionOnboardingViewController];
    id v5 = [(MailMainScene *)self accountSetupController];
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Create tracking prevention onboarding (onboarding: %{public}@, account setup: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v6 = [(MailMainScene *)self mailTrackingProtectionOnboardingViewController];
  if (v6) {
    goto LABEL_4;
  }
  id v7 = [(MailMainScene *)self accountSetupController];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    uint64_t v6 = objc_alloc_init(MailTrackingProtectionOnboardingViewController);
    [(MailMainScene *)self setMailTrackingProtectionOnboardingViewController:v6];
    unsigned int v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_mailTrackingProtectionViewControllerDidFinish:" name:@"MailTrackingProtectionOnboardingViewControllerDidCompleteNotification" object:0];

LABEL_4:
  }
  id v9 = [(MailMainScene *)self mailTrackingProtectionOnboardingViewController];

  return v9;
}

- (void)_mailAppleIntelligenceWelcomeViewControllerDidFinish:(id)a3
{
  unsigned __int8 v4 = [(MailMainScene *)self mailAppleIntelligenceWelcomeOnboardingViewController];
  id v5 = +[MailMainScene log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2048;
    unsigned int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Onboarding did finish", (uint8_t *)&v8, 0x16u);
  }
  [(MailMainScene *)self setAppleIntelligenceOnboardingState:4];
  if (v4) {
    [(MailMainScene *)self presentNextOnboardingIfNecessary];
  }
}

- (void)_mailTrackingProtectionViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(MailMainScene *)self mailTrackingProtectionOnboardingViewController];
  uint64_t v6 = +[MailMainScene log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    int v13 = 138543618;
    __int16 v14 = v8;
    __int16 v15 = 2048;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Onboarding did finish", (uint8_t *)&v13, 0x16u);
  }
  if (v5) {
    [(MailMainScene *)self presentNextOnboardingIfNecessary];
  }
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:@"MailTrackingProtectionOnboardingViewControllerDidCompleteNotification" object:0];

  __int16 v10 = [v4 userInfo];
  unsigned int v11 = [v10 objectForKeyedSubscript:@"MailTrackingProtectionOnboardingViewControllerUserInfoKeyOptedIn"];
  int v12 = v11;
  if (v11) {
    -[MailMainScene _sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:](self, "_sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:", 1, 0, [v11 BOOLValue]);
  }
  else {
    [(MailMainScene *)self _sendOnboardingAnalyticsDidShowOnboarding:0 wasPreviouslyBlockingRemoteContent:0];
  }
}

- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a4)
  {
    BOOL v7 = 0;
  }
  else
  {
    int v8 = +[NSUserDefaults em_userDefaults];
    unsigned __int8 v9 = [v8 integerForKey:EMUserDefaultLoadRemoteContentKey];

    BOOL v7 = (v9 & 8) == 0;
  }

  [(MailMainScene *)self _sendOnboardingAnalyticsDidShowOnboarding:v5 wasPreviouslyBlockingRemoteContent:v4 optedIn:v7];
}

- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4 optedIn:(BOOL)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113E98;
  block[3] = &unk_1006087B8;
  BOOL v6 = a3;
  BOOL v7 = a4;
  BOOL v8 = a5;
  if (qword_1006996A0 != -1) {
    dispatch_once(&qword_1006996A0, block);
  }
}

- (void)_resetSelectedAccounts
{
  id v3 = +[MailMainScene log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reset Selected Accounts", v14, 2u);
  }

  BOOL v4 = [(MailMainScene *)self mailboxPickerController];
  BOOL v5 = [v4 messageListContainerViewController];
  BOOL v6 = [v5 conversationViewController];

  if (v6) {
    [v6 setReferenceMessageListItem:0 referenceMessageList:0 showAsConversation:0 animated:0];
  }
  BOOL v7 = [(MailMainScene *)self favoritesManager];
  [v7 setLastSelectedItem:0];

  [(MailMainScene *)self selectDefaultMailbox];
  if ([(MailMainScene *)self activationState] == (id)2)
  {
    BOOL v8 = +[UIApplication sharedApplication];
    unsigned __int8 v9 = [(MailMainScene *)self session];
    [v8 requestSceneSessionRefresh:v9];
  }
  else
  {
    __int16 v10 = [(MailMainScene *)self postAccountSetupInvocation];
    if (v10)
    {
      if ([(MailMainScene *)self _isDisplayingAccountSetup])
      {
        unsigned int v11 = [(MailMainScene *)self accountSetupController];
        unsigned __int8 v12 = [v11 accountSetupInProgress];

        if (v12) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      int v13 = [(MailMainScene *)self postAccountSetupInvocation];
      [v13 invoke];

      [(MailMainScene *)self setPostAccountSetupInvocation:0];
    }
  }
LABEL_13:
}

- (BOOL)presentAccountSetupControllerIfNecessary
{
  id v3 = [(MailMainScene *)self _defaultAccountsToSelect];
  BOOL v4 = [v3 anyObject];
  BOOL v5 = [v4 primaryMailboxUid];

  if (!v5) {
    [(MailMainScene *)self _presentAccountSetupController];
  }

  return v5 == 0;
}

- (void)_presentAccountSetupController
{
  if (![(MailMainScene *)self _presentAccountRestrictionAlertIfNecessary])
  {
    id v3 = [(MailMainScene *)self accountSetupController];

    if (!v3)
    {
      BOOL v4 = +[MailMainScene log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Presenting account setup controller", v8, 2u);
      }

      BOOL v5 = [[AccountSetupController alloc] initWithTitle:0 identifier:@"NEW_ACCOUNT"];
      [(AccountSetupController *)v5 setAccountSetupDelegate:self];
      [(AccountSetupController *)v5 setScene:self];
      [(AccountSetupController *)v5 setModalPresentationStyle:0];
      [(MailMainScene *)self setAccountSetupController:v5];
      BOOL v6 = [(MailMainScene *)self dockContainer];
      BOOL v7 = [(MailMainScene *)self accountSetupController];
      [v6 presentViewController:v7 animated:0 completion:0];
    }
  }
}

- (void)_dismissAccountSetupControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(MailMainScene *)self accountSetupController];

  if (v7)
  {
    BOOL v8 = +[MailMainScene log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing account setup controller", v12, 2u);
    }

    unsigned __int8 v9 = [(MailMainScene *)self accountSetupController];
    [v9 setAccountSetupDelegate:0];

    __int16 v10 = [(MailMainScene *)self accountSetupController];
    [v10 setScene:0];

    [(MailMainScene *)self setAccountSetupController:0];
    [(MailMainScene *)self setAccountSetupFinished:0];
    unsigned int v11 = [(MailMainScene *)self dockContainer];
    [v11 dismissViewControllerAnimated:v4 completion:v6];
  }
}

- (BOOL)_isAccountCreationRestricted
{
  id v3 = +[UIApplication sharedApplication];
  BOOL v4 = [v3 accountsProvider];
  BOOL v5 = [v4 displayedAccounts];
  id v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = +[MailMainScene log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = +[UIApplication sharedApplication];
      id v16 = [v15 accountsProvider];
      __int16 v17 = [v16 displayedAccounts];
      *(_DWORD *)buf = 67109120;
      unsigned int v20 = [v17 count];
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Displayed account count is %u.", buf, 8u);
    }
    return 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100114B50;
  block[3] = &unk_1006047A0;
  void block[4] = self;
  if (qword_1006996A8 != -1) {
    dispatch_once(&qword_1006996A8, block);
  }
  unsigned __int8 v9 = +[MCProfileConnection sharedConnection];
  unsigned int v10 = [v9 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  if (v10 == 2)
  {
    unsigned int v11 = +[MailMainScene log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10045AA6C();
    }
LABEL_11:
    BOOL v8 = 1;
LABEL_17:

    return v8;
  }
  unsigned int v11 = +[UMUserManager sharedManager];
  if (![v11 isMultiUser])
  {
    BOOL v8 = 0;
    goto LABEL_17;
  }
  unsigned __int8 v12 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v13 = [v12 BOOLForKey:@"MultiUserAllowAccountSetup"];

  if ((v13 & 1) == 0)
  {
    unsigned int v11 = +[MailMainScene log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10045AAAC();
    }
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)_presentAccountRestrictionAlertIfNecessary
{
  BOOL v3 = [(MailMainScene *)self _isAccountCreationRestricted];
  if (v3)
  {
    BOOL v4 = [(MailMainScene *)self accountSetupController];

    if (v4)
    {
      BOOL v5 = [(MailMainScene *)self accountSetupController];
      [(MailMainScene *)self setAccountSetupController:0];
      [v5 dismissViewControllerAnimated:0 completion:0];
    }
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"ACCOUNT_RESTRICTION" value:&stru_100619928 table:@"Main"];

    BOOL v8 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACCOUNT_RESTRICTION_DESCRIPTION"];
    unsigned int v10 = [v8 localizedStringForKey:v9 value:&stru_100619928 table:@"Main"];

    unsigned int v11 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:1];
    unsigned __int8 v12 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v13 = [v12 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100114EEC;
    v19[3] = &unk_1006079A8;
    void v19[4] = self;
    __int16 v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v19];
    [v11 addAction:v14];

    for (i = [(MailMainScene *)self dockContainer];
    {
      id v16 = [i presentedViewController];

      if (!v16) {
        break;
      }
      uint64_t v17 = [i presentedViewController];
    }
    [i presentViewController:v11 animated:1 completion:0];
  }
  return v3;
}

- (void)accountSetupControllerDidChange:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[MailMainScene log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account setup controller did change. Finished %{BOOL}d", buf, 8u);
  }

  if (v4) {
    [(MailMainScene *)self setAccountSetupFinished:1];
  }
  BOOL v7 = +[UIApplication sharedApplication];
  BOOL v8 = [v7 accountsProvider];
  unsigned __int8 v9 = [v8 displayedAccounts];
  BOOL v10 = [v9 count] == 0;

  if (!v10)
  {
    unsigned int v11 = [(MailMainScene *)self postAccountSetupInvocation];

    if (v11)
    {
      unsigned __int8 v12 = [(MailMainScene *)self postAccountSetupInvocation];
      [v12 invoke];

      [(MailMainScene *)self setPostAccountSetupInvocation:0];
      [(MailMainScene *)self _requestUserNotificationAuthorization];
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001150F8;
      v13[3] = &unk_1006058A8;
      BOOL v14 = v4;
      v13[4] = self;
      [(MailMainScene *)self _dismissAccountSetupControllerAnimated:1 completion:v13];
    }
  }
}

- (id)mailboxPickerControllerForActivityRouter:(id)a3
{
  BOOL v3 = [(MailMainScene *)self mailboxPickerController];

  return v3;
}

- (id)splitViewControllerForActivityRouter:(id)a3
{
  BOOL v3 = [(MailMainScene *)self splitViewController];

  return v3;
}

- (BOOL)displayMessage:(id)a3 fromUserActivityRouter:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[MessageDisplayRequest alloc] initWithMessage:v5];
    BOOL v7 = [(MailMainScene *)self displayMessage:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)openURL:(id)a3 fromUserActivityRouter:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  BOOL v8 = +[MFURLRoutingRequest requestWithURL:a3];
  unsigned __int8 v9 = v8;
  if (v7)
  {
    BOOL v10 = [v8 future];
    unsigned int v11 = +[EFScheduler mainThreadScheduler];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10011548C;
    v21[3] = &unk_100608668;
    id v12 = v7;
    id v22 = v12;
    [v10 onScheduler:v11 addSuccessBlock:v21];

    unsigned __int8 v13 = [v9 future];
    BOOL v14 = +[EFScheduler mainThreadScheduler];
    BOOL v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_1001154A0;
    id v19 = &unk_100604DB8;
    id v20 = v12;
    [v13 onScheduler:v14 addFailureBlock:&v16];
  }
  __int16 v15 = [(MailScene *)self urlRouter];
  [v15 routeRequest:v9];
}

- (void)showComposeWithContext:(id)a3 fromActivityRouter:(id)a4
{
}

- (id)composeControllerForCompositionContext:(id)a3 forActivityRouter:(id)a4
{
  BOOL v4 = -[MailMainScene composeControllerForCompositionContext:](self, "composeControllerForCompositionContext:", a3, a4);

  return v4;
}

- (void)presentComposeController:(id)a3 forUserActivityRouter:(id)a4
{
  id v6 = a3;
  [(MailMainScene *)self _dismissAnyModalViewControllerOrPopoverAnimated:1];
  id v5 = [(MailMainScene *)self dockContainer];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)dismissComposeController:(id)a3 forUserActivityRouter:(id)a4
{
  id v9 = a3;
  id v5 = [(MailMainScene *)self dockContainer];
  id v6 = [v5 presentedViewController];

  id v7 = v9;
  if (v6 == v9)
  {
    BOOL v8 = [(MailMainScene *)self dockContainer];
    [v8 dismissViewControllerAnimated:1 completion:0];

    id v7 = v9;
  }
}

- (id)messageListViewControllerForActivityRouter:(id)a3
{
  BOOL v3 = [(MailMainScene *)self messageListContainerViewController];
  BOOL v4 = [v3 messageListViewController];

  return v4;
}

- (id)alertOverlayControllerForActivityRouter:(id)a3
{
  BOOL v3 = [(MailScene *)self alertOverlayController];

  return v3;
}

- (void)displayMessageListWithMode:(int64_t)a3
{
  id v3 = [(MailMainScene *)self splitViewController];
  [v3 showMessageListViewController:1 animated:0 completion:0];
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v14 = self;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  int64_t v17 = a5;
  id v12 = +[EFScheduler mainThreadScheduler];
  [v12 performSyncBlock:&v13];
}

- (void)_dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MailMainScene *)self accountSetupController];

  if (v5) {
    [(MailMainScene *)self _dismissAccountSetupControllerAnimated:v3 completion:0];
  }
  id v6 = [(MailMainScene *)self dockContainer];
  [v6 popToRootViewControllerAnimated:v3];
}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  id v5 = [(MailMainScene *)self lastSelectedAccountID];

  if (v5)
  {
    id v6 = [(MailMainScene *)self lastSelectedAccountID];
    id v7 = +[MailAccount accountWithUniqueId:v6];

    id v8 = +[MailMainScene log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 ef_publicDescription];
      int v27 = 138543362;
      uint64_t v28 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using lastSelectedAccount: %{public}@ for compose.", (uint8_t *)&v27, 0xCu);
    }
    if (v7)
    {
LABEL_13:
      BOOL v23 = 0;
      if (!a3) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  id v10 = [(MailMainScene *)self mailboxPickerController];
  id v11 = [v10 messageListContainerViewController];
  id v12 = [v11 conversationViewController];

  uint64_t v13 = [v12 viewIfLoaded];
  BOOL v14 = [v13 window];

  if (v14)
  {
    id v15 = [v12 targetMessageForBarButtonTriage];
    id v16 = [v15 mailboxes];
    int64_t v17 = [v16 ef_map:&stru_1006088B0];
    id v18 = [v17 ef_filter:EFIsNotNull];
    id v19 = [v18 ef_notEmpty];

    id v7 = [v19 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = +[MailMainScene log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v7 ef_publicDescription];
        int v27 = 138543362;
        uint64_t v28 = (uint64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using account: %{public}@ from referenceMessage for compose.", (uint8_t *)&v27, 0xCu);
      }
    }
    else
    {
      id v20 = +[MailMainScene log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        int v27 = 138543362;
        uint64_t v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using account type is %{public}@.", (uint8_t *)&v27, 0xCu);
      }
    }

    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v7 = +[MailAccount defaultMailAccountForDelivery];
  long long v25 = +[MailMainScene log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = [v7 ef_publicDescription];
    int v27 = 138543362;
    uint64_t v28 = (uint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Using default account: %{public}@ for compose.", (uint8_t *)&v27, 0xCu);
  }
  BOOL v23 = 1;
  if (a3) {
LABEL_14:
  }
    *a3 = v23;
LABEL_15:

  return v7;
}

- (BOOL)_sheetDropInteraction:(id)a3 canHandleUserActivityOfType:(id)a4
{
  id v5 = a4;
  if (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", MSMailActivityHandoffTypeComposeWithStreams)) {
    unsigned int v6 = ![(MailMainScene *)self isComposeWindowActive];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_sheetDropInteraction:(id)a3 presentingViewControllerForDroppingUserActivityOfType:(id)a4
{
  BOOL v4 = [(MailMainScene *)self dockContainer];

  return v4;
}

- (id)_sheetDropInteraction:(id)a3 viewControllerForDroppingUserActivityOfType:(id)a4
{
  id v5 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:1];
  unsigned int v6 = [(MailMainScene *)self composeControllerForCompositionContext:v5];

  return v6;
}

- (void)_sheetDropInteraction:(id)a3 handleUserActivity:(id)a4 forPresentedViewController:(id)a5
{
  id v18 = a5;
  id v7 = [a4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:MSMailActivityHandoffTypeKey];
  id v9 = [v7 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyMessageData];
  id v10 = [v7 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyAutosaveID];
  id v11 = [v7 objectForKeyedSubscript:MSMailActivityHandoffComposeKeySubject];
  if ([v9 length]
    && [v8 isEqualToString:MSMailActivityHandoffTypeComposeSansStreams])
  {
    id v12 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:2 RFC822Data:v9];
    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v10)
    {
      id v12 = 0;
      goto LABEL_10;
    }
    uint64_t v13 = [v7 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyOriginalMessageObjectID];
    BOOL v14 = +[EMObjectID objectIDFromSerializedRepresentation:v13];
    id v15 = objc_alloc((Class)_MFMailCompositionContext);
    id v16 = [(MailScene *)self daemonInterface];
    int64_t v17 = [v16 messageRepository];
    id v12 = [v15 initRecoveredAutosavedMessageWithIdentifier:v10 draftSubject:v11 messageRepository:v17 originalMessageObjectID:v14];

    if (!v12) {
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v18 _setCompositionContext:v12];
  }
LABEL_10:
}

- (MFMailPopoverManager)popoverManager
{
  if (pthread_main_np() != 1)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MailMainScene.m" lineNumber:2088 description:@"Current thread must be main"];
  }
  BOOL v4 = [(MailMainScene *)self delegate];
  id v5 = [v4 window];
  if (v5)
  {
    unsigned int v6 = +[MFMailPopoverManager managerForWindow:v5 createIfNeeded:1];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return (MFMailPopoverManager *)v6;
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
}

- (NSArray)openMailboxQuicklyItems
{
  return self->_openMailboxQuicklyItems;
}

- (MailNavigationController)masterNavigationController
{
  return self->_masterNavigationController;
}

- (MailDetailNavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (void)setDetailNavigationController:(id)a3
{
}

- (void)setAccountSetupController:(id)a3
{
}

- (BOOL)accountSetupFinished
{
  return self->_accountSetupFinished;
}

- (void)setAccountSetupFinished:(BOOL)a3
{
  self->_accountSetupFinished = a3;
}

- (void)setShouldRequestContactAccess:(BOOL)a3
{
  self->_shouldRequestContactAccess = a3;
}

- (void)setShouldDeferUserNotificationAuthorizationRequests:(BOOL)a3
{
  self->_shouldDeferUserNotificationAuthorizationRequests = a3;
}

- (ComposeNavigationController)dummySnapshotComposeViewController
{
  return self->_dummySnapshotComposeViewController;
}

- (void)setDummySnapshotComposeViewController:(id)a3
{
}

- (PreviousDraftPickerPopoverPresentationDelegate)previousDraftPickerPopoverPresentationDelegate
{
  return self->_previousDraftPickerPopoverPresentationDelegate;
}

- (void)setPreviousDraftPickerPopoverPresentationDelegate:(id)a3
{
}

- (void)setErrorHandler:(id)a3
{
}

- (NSString)lastSelectedAccountID
{
  return self->_lastSelectedAccountID;
}

- (EFInvocable)postAccountSetupInvocation
{
  return self->_postAccountSetupInvocation;
}

- (void)setPostAccountSetupInvocation:(id)a3
{
}

- (MFUserActivityRouter)userActivityRouter
{
  return self->_userActivityRouter;
}

- (EFFuture)draftRestorationFuture
{
  return self->_draftRestorationFuture;
}

- (void)setDraftRestorationFuture:(id)a3
{
}

- (MessageDisplayRequest)currentMessageDisplayRequest
{
  return self->_currentMessageDisplayRequest;
}

- (void)setCurrentMessageDisplayRequest:(id)a3
{
}

- (UINavigationController)onboardingNavigationController
{
  return self->_onboardingNavigationController;
}

- (void)setOnboardingNavigationController:(id)a3
{
}

- (MailTrackingProtectionOnboardingViewController)mailTrackingProtectionOnboardingViewController
{
  return self->_mailTrackingProtectionOnboardingViewController;
}

- (void)setMailTrackingProtectionOnboardingViewController:(id)a3
{
}

- (_TtC10MobileMail18ComposeUndoHandler)composeUndoHandler
{
  return self->_composeUndoHandler;
}

- (void)setOpenMailboxQuicklyViewController:(id)a3
{
}

- (MUIAppleIntelligenceOnboardingViewController)mailAppleIntelligenceWelcomeOnboardingViewController
{
  return self->_mailAppleIntelligenceWelcomeOnboardingViewController;
}

- (void)setMailAppleIntelligenceWelcomeOnboardingViewController:(id)a3
{
}

- (void)setAppleIntelligenceOnboardingState:(int64_t)a3
{
  self->_appleIntelligenceOnboardingState = a3;
}

- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler
{
  return self->_composeViewDelegateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, 0);
  objc_storeStrong((id *)&self->_mailAppleIntelligenceWelcomeOnboardingViewController, 0);
  objc_storeStrong((id *)&self->_openMailboxQuicklyViewController, 0);
  objc_storeStrong((id *)&self->_composeUndoHandler, 0);
  objc_storeStrong((id *)&self->_mailTrackingProtectionOnboardingViewController, 0);
  objc_storeStrong((id *)&self->_onboardingNavigationController, 0);
  objc_storeStrong((id *)&self->_currentMessageDisplayRequest, 0);
  objc_storeStrong((id *)&self->_draftRestorationFuture, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_userActivityRouter, 0);
  objc_storeStrong((id *)&self->_postAccountSetupInvocation, 0);
  objc_storeStrong((id *)&self->_lastSelectedAccountID, 0);
  objc_storeStrong((id *)&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_previousDraftPickerPopoverPresentationDelegate, 0);
  objc_storeStrong((id *)&self->_dummySnapshotComposeViewController, 0);
  objc_storeStrong((id *)&self->_accountSetupController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_detailNavigationController, 0);
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
  objc_storeStrong((id *)&self->_masterNavigationController, 0);
  objc_storeStrong((id *)&self->_dockContainer, 0);
  objc_storeStrong((id *)&self->_openMailboxQuicklyItems, 0);
  objc_storeStrong(&self->composeCompletionBlock, 0);

  objc_storeStrong((id *)&self->_selectedAccounts, 0);
}

@end