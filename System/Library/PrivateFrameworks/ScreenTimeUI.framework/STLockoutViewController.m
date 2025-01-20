@interface STLockoutViewController
+ (id)_applicationNameForBundleIdentifier:(id)a3;
+ (id)_applicationNameForWebsiteURL:(id)a3;
+ (id)_bundleIdentifierForWebsiteURL:(id)a3;
+ (id)_messageForCategoryIdentifier:(id)a3;
+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3;
+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4;
+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 contactNameByHandle:(id)a5;
+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5;
+ (id)lockoutViewControllerWithCategoryIdentifier:(id)a3;
+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6;
+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6 contactNameByHandle:(id)a7;
+ (id)lockoutViewControllerWithWebsiteURL:(id)a3;
+ (id)messageForApplicationName:(id)a3 style:(int64_t)a4;
+ (id)messageForBundleIdentifier:(id)a3 style:(int64_t)a4;
+ (id)messageForWebsiteURL:(id)a3;
- (BOOL)_actionDismiss;
- (BOOL)_actionUnlockedAskOrApproveActionSheet;
- (BOOL)_actionUnlockedEnterScreenTimePasscodeActionSheet;
- (BOOL)_authenticatedApproveActionSheet;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isShowingInitialAnimation;
- (BOOL)didFinishDismissing;
- (BOOL)isForSnapshot;
- (BOOL)mainButtonAlwaysHidden;
- (BOOL)okButtonAlwaysHidden;
- (NSDictionary)contactNameByHandle;
- (NSString)applicationName;
- (NSString)blockedContactsHandle;
- (NSString)bundleIdentifier;
- (STHourglassView)hourglassView;
- (STLockoutPolicyController)policyController;
- (STLockoutViewController)initWithBundleIdentifier:(id)a3;
- (STLockoutViewController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4;
- (STLockoutViewController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5;
- (STLockoutViewController)initWithWebsiteURL:(id)a3;
- (STLockoutViewControllerDelegate)viewControllerDelegate;
- (UIButton)mainButton;
- (UIButton)okButton;
- (UIImageView)communicationLimitView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIResponder)customNextResponder;
- (UIResponder)nextResponder;
- (UIVisualEffectView)view;
- (UIVisualEffectView)viewIfLoaded;
- (id)_updateMessageLabelAndReturnHandleWithPhoneNumberFormat:(id)a3 emailAddressFormat:(id)a4 contactNameFormat:(id)a5;
- (id)addBlockedContactHandler;
- (id)addContactHandler;
- (int64_t)okButtonAction;
- (void)_actionAddContact:(id)a3;
- (void)_actionAskOrApproveActionSheet:(id)a3;
- (void)_actionEnterScreenTimePasscodeActionSheet:(id)a3;
- (void)_actionIgnoreLimitActionSheet:(id)a3;
- (void)_actionOK:(id)a3;
- (void)_actionUnlockedAddContact;
- (void)_actionUnlockedAskOrApproveActionSheet;
- (void)_actionUnlockedEnterScreenTimePasscodeActionSheet;
- (void)_authenticatedApproveForAdditionalTime:(double)a3;
- (void)_changeMainButtonToAddContact:(id)a3;
- (void)_changeMainButtonToAskForMore;
- (void)_changeMainButtonToEnterScreenTimePasscode;
- (void)_changeMainButtonToIgnoreLimit;
- (void)_changeMessageToInitial;
- (void)_changeStateToApproved;
- (void)_changeStateToAsk;
- (void)_changeStateToContactBlocked;
- (void)_changeStateToContactBlockedDuringDowntime;
- (void)_changeStateToDisapproved;
- (void)_changeStateToDismissing;
- (void)_changeStateToPending;
- (void)_changeStateToWarn;
- (void)_doInitialAnimationExitingGroup:(id)a3;
- (void)_doInitialAnimationOfHourglassExitingGroup:(id)a3;
- (void)_fadeInBackdropWithCompletion:(id)a3;
- (void)_fadeInHourglass;
- (void)_fadeInTextAndButtons;
- (void)_fadeOutBackdropWithCompletion:(id)a3;
- (void)_fadeOutHourglass;
- (void)_fadeOutTextAndButtons;
- (void)_handleRestrictionsPINNotification:(id)a3;
- (void)_hideBackdrop;
- (void)_hideHourglass;
- (void)_hideTextAndButtons;
- (void)_presentAlertController:(id)a3;
- (void)_restoreBackdrop;
- (void)_restoreHourglass;
- (void)_restoreTextAndButtons;
- (void)_restrictionsPINControllerDidFinish:(BOOL)a3;
- (void)_setTextAndButtonsAlpha:(double)a3;
- (void)_setupCommon;
- (void)_showApprovalAnimationIfNeeded;
- (void)_showDismissingAnimationIfNeeded;
- (void)_showInitialAnimationIfNeeded;
- (void)_showRestrictionsPINControllerWithMainCompletion:(id)a3;
- (void)_startListeningForRestrictionsPINEntryNotification;
- (void)_stopListeningForRestrictionsPINEntryNotification;
- (void)_undoApprovalAnimationIfNeeded;
- (void)_unlockWithSuccessMainCompletion:(id)a3;
- (void)_updateMainButtonVisibility;
- (void)_updateMainButtonWithTitle:(id)a3 action:(SEL)a4;
- (void)_updateOKButtonVisibility;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setAddBlockedContactHandler:(id)a3;
- (void)setAddContactHandler:(id)a3;
- (void)setBlockedContactsHandle:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCommunicationLimitView:(id)a3;
- (void)setCustomNextResponder:(id)a3;
- (void)setDidFinishDismissing:(BOOL)a3;
- (void)setForSnapshot:(BOOL)a3;
- (void)setHourglassView:(id)a3;
- (void)setMainButton:(id)a3;
- (void)setMainButtonAlwaysHidden:(BOOL)a3;
- (void)setMessageLabel:(id)a3;
- (void)setOkButton:(id)a3;
- (void)setOkButtonAction:(int64_t)a3;
- (void)setOkButtonAlwaysHidden:(BOOL)a3;
- (void)setPolicyController:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setView:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)stateDidChange:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation STLockoutViewController

+ (id)lockoutViewControllerWithCategoryIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C9E8];
  id v4 = a3;
  v5 = +[STScreenTimeUIBundle bundle];
  v6 = [v3 storyboardWithName:@"BlockingUI-iOS" bundle:v5];

  v7 = [v6 instantiateInitialViewController];
  [v7 _setupCommon];
  v8 = [[STLockoutPolicyController alloc] initWithCategoryIdentifier:v4 delegate:v7];

  [v7 setPolicyController:v8];
  v7[122] = 4;

  return v7;
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C9E8];
  id v4 = a3;
  v5 = +[STScreenTimeUIBundle bundle];
  v6 = [v3 storyboardWithName:@"BlockingUI-iOS" bundle:v5];

  v7 = [v6 instantiateInitialViewController];
  v8 = [[STLockoutPolicyController alloc] initWithBundleIdentifier:v4 delegate:v7];
  [v7 setPolicyController:v8];

  v7[122] = 0;
  [v7 setBundleIdentifier:v4];

  uint64_t v9 = objc_opt_new();
  v10 = (void *)v7[126];
  v7[126] = v9;

  return v7;
}

+ (id)lockoutViewControllerWithWebsiteURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C9E8];
  id v4 = a3;
  v5 = +[STScreenTimeUIBundle bundle];
  v6 = [v3 storyboardWithName:@"BlockingUI-iOS" bundle:v5];

  v7 = [v6 instantiateInitialViewController];
  [v7 _setupCommon];
  v8 = [[STLockoutPolicyController alloc] initWithWebsiteURL:v4 delegate:v7];

  [v7 setPolicyController:v8];
  v7[122] = 1;

  return v7;
}

+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6 contactNameByHandle:(id)a7
{
  v11 = (void *)MEMORY[0x263F1C9E8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = +[STScreenTimeUIBundle bundle];
  v18 = [v11 storyboardWithName:@"BlockingUI-iOS" bundle:v17];

  v19 = [v18 instantiateInitialViewController];
  [v19 _setupCommon];
  v20 = [[STLockoutPolicyController alloc] initWithBundleIdentifier:v15 conversationContext:v16 contactStore:v14 delegate:v19];

  [v19 setPolicyController:v20];
  v19[122] = 3;
  uint64_t v21 = [v13 copy];

  v22 = (void *)v19[136];
  v19[136] = v21;

  uint64_t v23 = [v12 copy];
  v24 = (void *)v19[137];
  v19[137] = v23;

  uint64_t v25 = objc_opt_new();
  v26 = (void *)v19[126];
  v19[126] = v25;

  return v19;
}

+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6
{
  return (id)[a1 lockoutViewControllerWithConversationContext:a3 bundleIdentifier:a4 contactStore:a5 applicationName:a6 contactNameByHandle:0];
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 contactNameByHandle:(id)a5
{
  v7 = (void *)MEMORY[0x263F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[STScreenTimeUIBundle bundle];
  id v12 = [v7 storyboardWithName:@"BlockingUI-iOS" bundle:v11];

  id v13 = [v12 instantiateInitialViewController];
  [v13 _setupCommon];
  id v14 = [[STLockoutPolicyController alloc] initWithBundleIdentifier:v10 contactsHandles:v9 delegate:v13];

  [v13 setPolicyController:v14];
  v13[122] = 3;
  uint64_t v15 = [v8 copy];

  id v16 = (void *)v13[137];
  v13[137] = v15;

  uint64_t v17 = objc_opt_new();
  v18 = (void *)v13[126];
  v13[126] = v17;

  return v13;
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4
{
  return (id)[a1 lockoutViewControllerWithBundleIdentifier:a3 contactsHandles:a4 contactNameByHandle:0];
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5
{
  return (id)[a1 lockoutViewControllerWithConversationContext:a4 bundleIdentifier:a3 contactStore:a5 applicationName:0];
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() lockoutViewControllerWithBundleIdentifier:v4];

  return v5;
}

- (STLockoutViewController)initWithWebsiteURL:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() lockoutViewControllerWithWebsiteURL:v4];

  return v5;
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() lockoutViewControllerWithBundleIdentifier:v7 contactsHandles:v6];

  return v8;
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() lockoutViewControllerWithBundleIdentifier:v10 conversationContext:v9 contactStore:v8];

  return v11;
}

- (UIResponder)nextResponder
{
  v3 = [(STLockoutViewController *)self customNextResponder];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STLockoutViewController;
    id v5 = [(STLockoutViewController *)&v8 nextResponder];
  }
  id v6 = v5;

  return (UIResponder *)v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v8 viewDidLoad];
  [(STLockoutPolicyController *)self->_policyController _changeStateToInitial];
  v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2B0]];
  id v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  id v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];
  id v6 = [(STLockoutViewController *)self titleLabel];
  [v6 setFont:v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillDisappear", v7, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STLockoutViewController viewWillAppear:](v3);
  }

  if (self->_isHourglassStateInitialized)
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[STLockoutViewController viewWillAppear:]();
    }
  }
  else
  {
    self->_isHourglassStateInitialized = 1;
    if ([(STLockoutViewController *)self isForSnapshot] || !v3)
    {
      [(STLockoutViewController *)self _restoreBackdrop];
      objc_super v8 = [(STLockoutViewController *)self hourglassView];
      [v8 setStateName:0x26CF0D760];

      [(STLockoutViewController *)self _restoreHourglass];
      [(STLockoutViewController *)self _restoreTextAndButtons];
    }
    else
    {
      [(STLockoutViewController *)self _hideBackdrop];
      id v7 = [(STLockoutViewController *)self hourglassView];
      [v7 setInitialState];

      [(STLockoutViewController *)self _hideHourglass];
      [(STLockoutViewController *)self _hideTextAndButtons];
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillAppear", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v9 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STLockoutViewController viewDidAppear:](v3);
  }

  if ([(STLockoutViewController *)self isForSnapshot] || !v3)
  {
    id v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[STLockoutViewController viewDidAppear:]();
    }
  }
  else
  {
    [(STLockoutViewController *)self _showInitialAnimationIfNeeded];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewDidAppear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v7 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STLockoutViewController *)self isForSnapshot])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedAlertController);
    [WeakRetained dismissViewControllerAnimated:0 completion:0];

    objc_storeWeak((id *)&self->_presentedAlertController, 0);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E199000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillDisappear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v6 viewWillDisappear:v3];
}

- (UIVisualEffectView)view
{
  v4.receiver = self;
  v4.super_class = (Class)STLockoutViewController;
  v2 = [(STLockoutViewController *)&v4 view];

  return (UIVisualEffectView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"STLockoutViewController-iOS.m", 327, @"Invalid parameter not satisfying: %@", @"[view isKindOfClass:[UIVisualEffectView class]]" object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v7 setView:v5];
}

- (UIVisualEffectView)viewIfLoaded
{
  v4.receiver = self;
  v4.super_class = (Class)STLockoutViewController;
  v2 = [(STLockoutViewController *)&v4 viewIfLoaded];

  return (UIVisualEffectView *)v2;
}

- (void)dealloc
{
  [(SBSLockScreenService *)self->_sbsLockScreenService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewController;
  [(STLockoutViewController *)&v3 dealloc];
}

- (void)_setupCommon
{
  self->_isHourglassStateInitialized = 0;
  self->_didFinishDismissing = 0;
  self->_isApprovedAnimationWithApprovalPending = 0;
  objc_super v3 = (OS_dispatch_group *)dispatch_group_create();
  initialAnimationGroup = self->_initialAnimationGroup;
  self->_initialAnimationGroup = v3;

  id v5 = (OS_dispatch_group *)dispatch_group_create();
  approvalAnimationGroup = self->_approvalAnimationGroup;
  self->_approvalAnimationGroup = v5;

  objc_super v7 = (OS_dispatch_group *)dispatch_group_create();
  dismissingAnimationGroup = self->_dismissingAnimationGroup;
  self->_dismissingAnimationGroup = v7;

  self->_okButtonAction = 0;
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x263F1D158] object:0];
}

- (void)setForSnapshot:(BOOL)a3
{
  if (self->_forSnapshot != a3)
  {
    if ([(STLockoutViewController *)self isViewLoaded])
    {
      id v5 = +[STBlockingUILog log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[STLockoutViewController setForSnapshot:]();
      }
    }
    else
    {
      self->_forSnapshot = a3;
    }
  }
}

- (NSString)bundleIdentifier
{
  return [(STLockoutPolicyController *)self->_policyController bundleIdentifier];
}

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    ++self->_reuseIdentifier;
    [(STLockoutViewController *)self _setupCommon];
    if (self->_policyController)
    {
      id v5 = +[STBlockingUILog log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v6 = [NSNumber numberWithUnsignedInteger:self->_reuseIdentifier];
        objc_super v7 = [(STLockoutPolicyController *)self->_policyController bundleIdentifier];
        int v9 = 138413058;
        id v10 = self;
        __int16 v11 = 2112;
        id v12 = v6;
        __int16 v13 = 2112;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "Changing bundleIdentifier of %@ (id:%@) from %@ to %@", (uint8_t *)&v9, 0x2Au);
      }
      [(STLockoutPolicyController *)self->_policyController setBundleIdentifier:v4];
    }
  }
  else
  {
    objc_super v8 = +[STBlockingUILog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STLockoutViewController setBundleIdentifier:]();
    }
  }
}

- (void)setDidFinishDismissing:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_didFinishDismissing != v3)
  {
    NSStringFromSelector(sel_didFinishDismissing);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(STLockoutViewController *)self willChangeValueForKey:v8];
    self->_didFinishDismissing = v3;
    [(STLockoutViewController *)self didChangeValueForKey:v8];
    id v5 = [(STLockoutViewController *)self viewControllerDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      objc_super v7 = [(STLockoutViewController *)self viewControllerDelegate];
      [v7 lockoutViewControllerDidFinishDismissing:self];
    }
  }
}

+ (id)_applicationNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  char v6 = [v4 localizedName];
  if (!v4)
  {
    objc_super v7 = +[STBlockingUILog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[STLockoutViewController _applicationNameForBundleIdentifier:]();
    }
  }
  id v8 = +[STBlockingUILog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[STLockoutViewController _applicationNameForBundleIdentifier:]();
  }

  return v6;
}

+ (id)_bundleIdentifierForWebsiteURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  id v5 = (id)[v4 length];

  if (v5)
  {
    char v6 = [MEMORY[0x263F318B0] sharedCategories];
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__STLockoutViewController__bundleIdentifierForWebsiteURL___block_invoke;
    v10[3] = &unk_26449B978;
    __int16 v13 = &v14;
    id v11 = v3;
    id v8 = v7;
    id v12 = v8;
    [v6 categoryForDomainURL:v11 completionHandler:v10];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

void __58__STLockoutViewController__bundleIdentifierForWebsiteURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    char v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "website:%@ bundle identifier error:%@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [a2 bundleIdentifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_applicationNameForWebsiteURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _bundleIdentifierForWebsiteURL:v4];
  char v6 = +[STBlockingUILog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[STLockoutViewController _applicationNameForWebsiteURL:]();
  }

  if ([v5 length])
  {
    uint64_t v7 = [a1 _applicationNameForBundleIdentifier:v5];
  }
  else
  {
    uint64_t v7 = &stru_26CF0D240;
  }

  return v7;
}

+ (id)messageForApplicationName:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = +[STScreenTimeUIBundle bundle];
  switch(a4)
  {
    case 0:
    case 3:
      if ([v7 length])
      {
        uint64_t v9 = @"ReachedApplicationLimitMessageFormat";
        goto LABEL_8;
      }
      uint64_t v12 = @"ReachedApplicationLimitMessage";
      goto LABEL_13;
    case 1:
      if ([v7 length])
      {
        uint64_t v9 = @"ReachedWebsiteLimitMessageFormat";
        goto LABEL_8;
      }
      uint64_t v12 = @"ReachedWebsiteLimitMessage";
      goto LABEL_13;
    case 2:
      if ([v7 length])
      {
        uint64_t v9 = @"ReachedWidgetLimitMessageFormat";
LABEL_8:
        id v10 = [v8 localizedStringForKey:v9 value:&stru_26CF0D240 table:0];
        objc_msgSend(NSString, "localizedStringWithFormat:", v10, v7);
        a1 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v12 = @"ReachedWidgetLimitMessage";
LABEL_13:
        a1 = [v8 localizedStringForKey:v12 value:&stru_26CF0D240 table:0];
      }
LABEL_14:

      return a1;
    case 4:
      int v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"STLockoutViewController-iOS.m" lineNumber:497 description:@"Category style is not supported"];

      a1 = &stru_26CF0D240;
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

+ (id)_messageForCategoryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[STScreenTimeUIBundle bundle];
  id v5 = [MEMORY[0x263F318B8] localizedNameForIdentifier:v3];

  if ([v5 length])
  {
    char v6 = [v4 localizedStringForKey:@"ReachedCategoryLimitMessageFormat" value:&stru_26CF0D240 table:0];
    id v7 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v5);
  }
  else
  {
    id v7 = [v4 localizedStringForKey:@"ReachedCategoryLimitMessage" value:&stru_26CF0D240 table:0];
  }

  return v7;
}

+ (id)messageForBundleIdentifier:(id)a3 style:(int64_t)a4
{
  char v6 = [a1 _applicationNameForBundleIdentifier:a3];
  id v7 = [a1 messageForApplicationName:v6 style:a4];

  return v7;
}

+ (id)messageForWebsiteURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _applicationNameForWebsiteURL:v4];
  if (![v5 length])
  {
    char v6 = [v4 host];
    uint64_t v7 = objc_msgSend(v6, "_lp_userVisibleHost");

    id v5 = (void *)v7;
  }
  uint64_t v8 = [a1 messageForApplicationName:v5 style:1];

  return v8;
}

- (void)_actionOK:(id)a3
{
  int64_t v4 = [(STLockoutViewController *)self okButtonAction];
  if (v4 == 1)
  {
    [(STLockoutViewController *)self setDidFinishDismissing:1];
  }
  else if (!v4)
  {
    id v5 = +[STBlockingUILog log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "Triggering return to Springboard...", v7, 2u);
    }

    char v6 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    [v6 openApplication:@"com.apple.springboard" withOptions:0 completion:&__block_literal_global_4];
  }
}

void __37__STLockoutViewController__actionOK___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int64_t v4 = +[STBlockingUILog log];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__STLockoutViewController__actionOK___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "Returned to Springboard", v6, 2u);
  }
}

- (BOOL)_actionDismiss
{
  v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "dismiss not yet implemented", v4, 2u);
  }

  return 0;
}

- (void)_actionIgnoreLimitActionSheet:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int64_t v4 = (void *)MEMORY[0x263F1C3F8];
  id v5 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v6 = [v5 userInterfaceIdiom] == 1;

  uint64_t v7 = [v4 alertControllerWithTitle:0 message:0 preferredStyle:v6];
  uint64_t v8 = +[STScreenTimeUIBundle bundle];
  if ([(STLockoutPolicyController *)self->_policyController shouldAllowOneMoreMinute])
  {
    uint64_t v9 = [v8 localizedStringForKey:@"OneMoreMinuteButtonTitle" value:&stru_26CF0D240 table:0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke;
    v21[3] = &unk_26449B338;
    v21[4] = self;
    id v10 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:0 handler:v21];
    [v7 addAction:v10];
  }
  int v11 = [v8 localizedStringForKey:@"RemindMeIn15MinutesButtonTitle" value:&stru_26CF0D240 table:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_95;
  v20[3] = &unk_26449B338;
  v20[4] = self;
  uint64_t v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v11 style:0 handler:v20];
  [v7 addAction:v12];

  __int16 v13 = [v8 localizedStringForKey:@"IgnoreLimitForTodayButtonTitle" value:&stru_26CF0D240 table:0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_102;
  v19[3] = &unk_26449B338;
  v19[4] = self;
  id v14 = [MEMORY[0x263F1C3F0] actionWithTitle:v13 style:0 handler:v19];
  [v7 addAction:v14];

  uint64_t v15 = [v8 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
  uint64_t v16 = [MEMORY[0x263F1C3F0] actionWithTitle:v15 style:1 handler:&__block_literal_global_111];
  [v7 addAction:v16];

  uint64_t v17 = +[STBlockingUILog log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21E199000, v17, OS_LOG_TYPE_DEFAULT, "Presenting Ignore Limit action sheet", v18, 2u);
  }

  [(STLockoutViewController *)self _presentAlertController:v7];
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke(uint64_t a1)
{
  v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped One More Minute in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:6 withCompletionHandler:&__block_literal_global_90];
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_87(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_87_cold_1();
    }
  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_95(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Remind Me In 15 Minutes in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:4 withCompletionHandler:&__block_literal_global_98];
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_96(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_96_cold_1();
    }
  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_102(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Ignore Limit For Today in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:3 withCompletionHandler:&__block_literal_global_105];
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_103(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_103_cold_1();
    }
  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_109()
{
  v0 = +[STBlockingUILog log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21E199000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }
}

- (void)_actionAskOrApproveActionSheet:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__STLockoutViewController__actionAskOrApproveActionSheet___block_invoke;
  v3[3] = &unk_26449B298;
  v3[4] = self;
  [(STLockoutViewController *)self _unlockWithSuccessMainCompletion:v3];
}

uint64_t __58__STLockoutViewController__actionAskOrApproveActionSheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actionUnlockedAskOrApproveActionSheet];
}

- (BOOL)_actionUnlockedAskOrApproveActionSheet
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:v4 == 1];
  BOOL v6 = +[STScreenTimeUIBundle bundle];
  if ([(STLockoutPolicyController *)self->_policyController shouldAllowOneMoreMinute])
  {
    uint64_t v7 = [v6 localizedStringForKey:@"OneMoreMinuteButtonTitle" value:&stru_26CF0D240 table:0];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke;
    v23[3] = &unk_26449B338;
    v23[4] = self;
    uint64_t v8 = [MEMORY[0x263F1C3F0] actionWithTitle:v7 style:0 handler:v23];
    [v5 addAction:v8];
  }
  if ([(STLockoutPolicyController *)self->_policyController _shouldRequestMoreTime])
  {
    uint64_t v9 = [v6 localizedStringForKey:@"SendRequestButtonTitle" value:&stru_26CF0D240 table:0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_119;
    v22[3] = &unk_26449B338;
    v22[4] = self;
    id v10 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:0 handler:v22];
    [v5 addAction:v10];
  }
  if ([(STLockoutPolicyController *)self->_policyController _isRestrictionsPasscodeSet])
  {
    int v11 = [v6 localizedStringForKey:@"EnterScreenTimePasscodePromptButtonTitle" value:&stru_26CF0D240 table:0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_126;
    v21[3] = &unk_26449B338;
    v21[4] = self;
    uint64_t v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v11 style:0 handler:v21];
    [v5 addAction:v12];
  }
  __int16 v13 = [v5 actions];
  uint64_t v14 = [v13 count];

  if (v4 == 1 && v14 == 1)
  {
    uint64_t v15 = [v6 localizedStringForKey:@"AskForMoreTimeButtonTitle" value:&stru_26CF0D240 table:0];
    [v5 setTitle:v15];

LABEL_11:
    uint64_t v16 = [v6 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
    uint64_t v17 = [MEMORY[0x263F1C3F0] actionWithTitle:v16 style:1 handler:&__block_literal_global_132];
    [v5 addAction:v17];

    v18 = +[STBlockingUILog log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21E199000, v18, OS_LOG_TYPE_DEFAULT, "Presenting ask or approve action sheet", v20, 2u);
    }

    [(STLockoutViewController *)self _presentAlertController:v5];
    goto LABEL_14;
  }
  if (v14) {
    goto LABEL_11;
  }
  uint64_t v16 = +[STBlockingUILog log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[STLockoutViewController _actionUnlockedAskOrApproveActionSheet]();
  }
LABEL_14:

  return 1;
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped One More Minute in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:6 withCompletionHandler:&__block_literal_global_115];
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_113(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_113_cold_1();
    }
  }
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_119(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Send Request (Ask For More Time) in action sheet", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:2 withCompletionHandler:&__block_literal_global_122];
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_120(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_120_cold_1();
    }
  }
}

uint64_t __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_126(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Enter Screen Time Passcode in action sheet", v4, 2u);
  }

  return [*(id *)(a1 + 32) _actionEnterScreenTimePasscodeActionSheet:0];
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_130()
{
  v0 = +[STBlockingUILog log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21E199000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }
}

- (void)_actionEnterScreenTimePasscodeActionSheet:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__STLockoutViewController__actionEnterScreenTimePasscodeActionSheet___block_invoke;
  v4[3] = &unk_26449B298;
  v4[4] = self;
  [(STLockoutViewController *)self _unlockWithSuccessMainCompletion:v4];
}

uint64_t __69__STLockoutViewController__actionEnterScreenTimePasscodeActionSheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actionUnlockedEnterScreenTimePasscodeActionSheet];
}

- (BOOL)_actionUnlockedEnterScreenTimePasscodeActionSheet
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(STLockoutPolicyController *)self->_policyController _isRestrictionsPasscodeSet])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__STLockoutViewController__actionUnlockedEnterScreenTimePasscodeActionSheet__block_invoke;
    v5[3] = &unk_26449B9E0;
    v5[4] = self;
    [(STLockoutViewController *)self _showRestrictionsPINControllerWithMainCompletion:v5];
  }
  else
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[STLockoutViewController _actionUnlockedEnterScreenTimePasscodeActionSheet]();
    }
  }
  return 1;
}

uint64_t __76__STLockoutViewController__actionUnlockedEnterScreenTimePasscodeActionSheet__block_invoke(uint64_t result, int a2, uint64_t a3)
{
  if (!a3)
  {
    if (a2) {
      return [*(id *)(result + 32) _authenticatedApproveActionSheet];
    }
  }
  return result;
}

- (void)_actionAddContact:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__STLockoutViewController__actionAddContact___block_invoke;
  v4[3] = &unk_26449B298;
  v4[4] = self;
  [(STLockoutViewController *)self _unlockWithSuccessMainCompletion:v4];
}

uint64_t __45__STLockoutViewController__actionAddContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actionUnlockedAddContact];
}

- (void)_actionUnlockedAddContact
{
  v26[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(STLockoutViewController *)self blockedContactsHandle];
  uint64_t v4 = [(STLockoutViewController *)self addBlockedContactHandler];
  uint64_t v5 = [(STLockoutViewController *)self addContactHandler];
  BOOL v6 = (void (**)(void, void))v5;
  if (v4)
  {
    uint64_t v7 = [(STLockoutViewController *)self mainButton];
    ((void (**)(void, void *, void *))v4)[2](v4, v7, v3);
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    uint64_t v7 = [(STLockoutViewController *)self mainButton];
    ((void (**)(void, void *))v6)[2](v6, v7);
    goto LABEL_5;
  }
  uint64_t v8 = objc_opt_new();
  if ([v3 destinationIdIsPhoneNumber])
  {
    uint64_t v9 = TUNetworkCountryCode();
    id v10 = v9;
    if (!v9)
    {
      id v10 = TUHomeCountryCode();
    }
    uint64_t v11 = TUFormattedPhoneNumber();

    if (!v9) {
    uint64_t v12 = [objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v11];
    }
    id v13 = objc_alloc(MEMORY[0x263EFEAD0]);
    uint64_t v14 = (void *)[v13 initWithLabel:*MEMORY[0x263EFE8D0] value:v12];
    v26[0] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    [v8 setPhoneNumbers:v15];
  }
  else
  {
    if ([v3 destinationIdIsEmailAddress])
    {
      id v16 = objc_alloc(MEMORY[0x263EFEAD0]);
      uint64_t v12 = [v16 initWithLabel:*MEMORY[0x263EFE8B0] value:v3];
      uint64_t v25 = v12;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [v8 setEmailAddresses:v17];
    }
    else
    {
      uint64_t v12 = +[STBlockingUILog log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543362;
        v24 = v3;
        _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "Failed to identify handle type for: %{public}@, presenting view controller with an empty contact", (uint8_t *)&v23, 0xCu);
      }
    }
    uint64_t v11 = (uint64_t)v3;
  }

  v18 = [MEMORY[0x263EFEBF8] viewControllerForNewContact:v8];
  [v18 setDelegate:self];
  id v19 = [(STLockoutViewController *)self policyController];
  v20 = [v19 contactStore];
  [v18 setContactStore:v20];

  uint64_t v21 = [v19 iCloudContainer];
  [v18 setParentContainer:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v18];
  [(STLockoutViewController *)self presentViewController:v22 animated:1 completion:0];

  id v3 = (void *)v11;
LABEL_6:
}

- (void)_unlockWithSuccessMainCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = v4;
  sbsLockScreenService = self->_sbsLockScreenService;
  if (sbsLockScreenService)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke;
    v7[3] = &unk_26449B2C0;
    uint64_t v8 = v4;
    [(SBSLockScreenService *)sbsLockScreenService requestPasscodeUnlockUIWithOptions:0 withCompletion:v7];
  }
  else
  {
    v4[2](v4);
  }
}

void __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke_2;
    block[3] = &unk_26449B248;
    id v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_authenticatedApproveActionSheet
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v4 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v5 = [v4 userInterfaceIdiom] == 1;

  BOOL v6 = [v3 alertControllerWithTitle:0 message:0 preferredStyle:v5];
  uint64_t v7 = +[STScreenTimeUIBundle bundle];
  uint64_t v8 = [v7 localizedStringForKey:@"ApproveFor15MinutesButtonTitle" value:&stru_26CF0D240 table:0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke;
  v21[3] = &unk_26449B338;
  v21[4] = self;
  uint64_t v9 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:0 handler:v21];
  [v6 addAction:v9];

  id v10 = [v7 localizedStringForKey:@"ApproveForHourButtonTitle" value:&stru_26CF0D240 table:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_150;
  v20[3] = &unk_26449B338;
  v20[4] = self;
  uint64_t v11 = [MEMORY[0x263F1C3F0] actionWithTitle:v10 style:0 handler:v20];
  [v6 addAction:v11];

  uint64_t v12 = [v7 localizedStringForKey:@"ApproveAllDayButtonTitle" value:&stru_26CF0D240 table:0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_157;
  v19[3] = &unk_26449B338;
  v19[4] = self;
  id v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v12 style:0 handler:v19];
  [v6 addAction:v13];

  uint64_t v14 = [v7 localizedStringForKey:@"CancelButtonTitle" value:&stru_26CF0D240 table:0];
  uint64_t v15 = [MEMORY[0x263F1C3F0] actionWithTitle:v14 style:1 handler:&__block_literal_global_163];
  [v6 addAction:v15];

  id v16 = +[STBlockingUILog log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21E199000, v16, OS_LOG_TYPE_DEFAULT, "Presenting Approve action sheet", v18, 2u);
  }

  [(STLockoutViewController *)self _presentAlertController:v6];
  return 1;
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve for 15 minutes' in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:4 withCompletionHandler:&__block_literal_global_146];
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_144(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_144_cold_1();
    }
  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_150(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve for an hour' in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:5 withCompletionHandler:&__block_literal_global_153];
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_151(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_151_cold_1();
    }
  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_157(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E199000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve all day' in action sheet", v4, 2u);
  }

  [*(id *)(a1 + 32) _showApprovalAnimationIfNeeded];
  id v3 = [*(id *)(a1 + 32) policyController];
  [v3 handleAction:3 withCompletionHandler:&__block_literal_global_160];
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_158(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_158_cold_1();
    }
  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_161()
{
  v0 = +[STBlockingUILog log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21E199000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }
}

- (void)_authenticatedApproveForAdditionalTime:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutViewController *)self _showApprovalAnimationIfNeeded];
  self->_isApprovedAnimationWithApprovalPending = 1;
  uint64_t v4 = +[STBlockingUILog log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Approval animation shown; awaiting approval",
      (uint8_t *)buf,
      2u);
  }

  objc_initWeak(buf, self);
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke;
  block[3] = &unk_26449BA08;
  objc_copyWeak(&v11, buf);
  BOOL v6 = (void *)MEMORY[0x263EF83A0];
  dispatch_after(v5, MEMORY[0x263EF83A0], block);

  uint64_t v7 = [(STLockoutViewController *)self policyController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_164;
  v8[3] = &unk_26449BA30;
  objc_copyWeak(&v9, buf);
  [v7 handleAction:3 withCompletionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && WeakRetained[1033])
  {
    id v3 = +[STBlockingUILog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_cold_1();
    }

    v2[1033] = 0;
    [v2 _undoApprovalAnimationIfNeeded];
  }
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_164(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_2;
    block[3] = &unk_26449BA08;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v3);
  }
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _undoApprovalAnimationIfNeeded];
}

- (void)_presentAlertController:(id)a3
{
  p_presentedAlertController = &self->_presentedAlertController;
  id v5 = a3;
  objc_storeWeak((id *)p_presentedAlertController, v5);
  [(STLockoutViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_changeMessageToInitial
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int64_t style = self->_style;
  if (style == 4)
  {
    uint64_t v4 = [(STLockoutPolicyController *)self->_policyController categoryIdentifier];

    if (v4)
    {
      id v5 = objc_opt_class();
      id v14 = [(STLockoutPolicyController *)self->_policyController categoryIdentifier];
      uint64_t v6 = objc_msgSend(v5, "_messageForCategoryIdentifier:");
LABEL_10:
      id v11 = (void *)v6;
      uint64_t v12 = [(STLockoutViewController *)self messageLabel];
      [v12 setText:v11];
      goto LABEL_11;
    }
    int64_t style = self->_style;
  }
  if (style == 1)
  {
    uint64_t v7 = [(STLockoutPolicyController *)self->_policyController websiteURL];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      id v14 = [(STLockoutPolicyController *)self->_policyController websiteURL];
      uint64_t v6 = objc_msgSend(v8, "messageForWebsiteURL:");
      goto LABEL_10;
    }
  }
  id v14 = [(STLockoutViewController *)self applicationName];
  id v9 = objc_opt_class();
  id v10 = v9;
  if (v14)
  {
    uint64_t v6 = [v9 messageForApplicationName:v14 style:self->_style];
    goto LABEL_10;
  }
  id v11 = [(STLockoutPolicyController *)self->_policyController bundleIdentifier];
  uint64_t v12 = [v10 messageForBundleIdentifier:v11 style:self->_style];
  id v13 = [(STLockoutViewController *)self messageLabel];
  [v13 setText:v12];

LABEL_11:
}

- (void)setOkButtonAlwaysHidden:(BOOL)a3
{
  self->_okButtonAlwaysHidden = a3;
  [(STLockoutViewController *)self _updateOKButtonVisibility];
}

- (void)_updateOKButtonVisibility
{
  BOOL v3 = [(STLockoutViewController *)self okButtonAlwaysHidden];
  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v8 = [(STLockoutViewController *)self bundleIdentifier];
    if ([v8 length])
    {
      int64_t style = self->_style;
      if (style) {
        BOOL v6 = style == 3;
      }
      else {
        BOOL v6 = 1;
      }
      uint64_t v4 = !v6;
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  uint64_t v7 = [(STLockoutViewController *)self okButton];
  [v7 setHidden:v4];

  if (!v3)
  {
  }
}

- (void)setMainButtonAlwaysHidden:(BOOL)a3
{
  self->_mainButtonAlwaysHidden = a3;
  uint64_t v4 = [(STLockoutViewController *)self mainButton];
  id v5 = [v4 configuration];
  id v6 = [v5 title];

  if ([v6 length]) {
    [(STLockoutViewController *)self _updateMainButtonVisibility];
  }
}

- (void)_updateMainButtonVisibility
{
  id v5 = [(STLockoutViewController *)self policyController];
  if ([(STLockoutViewController *)self mainButtonAlwaysHidden]
    || ([v5 needsToSetRestrictionsPasscode] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = self->_style == 3 && [v5 state] == 8;
  }
  uint64_t v4 = [(STLockoutViewController *)self mainButton];
  [v4 setHidden:v3];
}

- (void)_updateMainButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v9 = [(STLockoutViewController *)self mainButton];
  uint64_t v7 = [MEMORY[0x263F1C490] plainButtonConfiguration];
  [v7 setTitle:v6];

  id v8 = [MEMORY[0x263F1C550] systemBlueColor];
  [v7 setBaseForegroundColor:v8];

  [v9 setPreferredBehavioralStyle:1];
  [v9 setConfiguration:v7];
  [v9 removeTarget:self action:0 forControlEvents:0x2000];
  [v9 addTarget:self action:a4 forControlEvents:0x2000];
  [(STLockoutViewController *)self _updateMainButtonVisibility];
}

- (void)_changeMainButtonToAskForMore
{
  id v4 = +[STScreenTimeUIBundle bundle];
  BOOL v3 = [v4 localizedStringForKey:@"AskForMoreTimeButtonTitle" value:&stru_26CF0D240 table:0];
  [(STLockoutViewController *)self _updateMainButtonWithTitle:v3 action:sel__actionAskOrApproveActionSheet_];
}

- (void)_changeMainButtonToIgnoreLimit
{
  id v4 = +[STScreenTimeUIBundle bundle];
  BOOL v3 = [v4 localizedStringForKey:@"IgnoreLimitButtonTitle" value:&stru_26CF0D240 table:0];
  [(STLockoutViewController *)self _updateMainButtonWithTitle:v3 action:sel__actionIgnoreLimitActionSheet_];
}

- (void)_changeMainButtonToEnterScreenTimePasscode
{
  id v4 = +[STScreenTimeUIBundle bundle];
  BOOL v3 = [v4 localizedStringForKey:@"EnterScreenTimePasscodePromptButtonTitle" value:&stru_26CF0D240 table:0];
  [(STLockoutViewController *)self _updateMainButtonWithTitle:v3 action:sel__actionEnterScreenTimePasscodeActionSheet_];
}

- (void)_changeMainButtonToAddContact:(id)a3
{
  id v4 = a3;
  id v9 = +[STScreenTimeUIBundle bundle];
  id v5 = [v9 localizedStringForKey:@"AddContactButtonFormat" value:&stru_26CF0D240 table:0];
  id v6 = [NSString alloc];
  uint64_t v7 = [MEMORY[0x263EFF960] currentLocale];
  id v8 = objc_msgSend(v6, "initWithFormat:locale:", v5, v7, v4);

  [(STLockoutViewController *)self _updateMainButtonWithTitle:v8 action:sel__actionAddContact_];
}

- (void)_changeStateToWarn
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Warn", v9, 2u);
  }

  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = [(STLockoutViewController *)self communicationLimitView];
  [v4 setHidden:1];

  id v5 = [(STLockoutViewController *)self hourglassView];
  [v5 setHidden:0];

  id v6 = +[STScreenTimeUIBundle bundle];
  uint64_t v7 = [v6 localizedStringForKey:@"TimeLimitTitle" value:&stru_26CF0D240 table:0];
  id v8 = [(STLockoutViewController *)self titleLabel];
  [v8 setText:v7];

  [(STLockoutViewController *)self _changeMessageToInitial];
  [(STLockoutViewController *)self _changeMainButtonToIgnoreLimit];
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (void)_changeStateToAsk
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Ask", v9, 2u);
  }

  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = [(STLockoutViewController *)self communicationLimitView];
  [v4 setHidden:1];

  id v5 = [(STLockoutViewController *)self hourglassView];
  [v5 setHidden:0];

  id v6 = +[STScreenTimeUIBundle bundle];
  uint64_t v7 = [v6 localizedStringForKey:@"TimeLimitTitle" value:&stru_26CF0D240 table:0];
  id v8 = [(STLockoutViewController *)self titleLabel];
  [v8 setText:v7];

  [(STLockoutViewController *)self _changeMessageToInitial];
  [(STLockoutViewController *)self _changeMainButtonToAskForMore];
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (void)_changeStateToPending
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Pending", v9, 2u);
  }

  self->_stateBeforePending = self->_state;
  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = +[STScreenTimeUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"RequestSentTitle" value:&stru_26CF0D240 table:0];
  id v6 = [(STLockoutViewController *)self titleLabel];
  [v6 setText:v5];

  uint64_t v7 = [v4 localizedStringForKey:@"RequestSentMessage" value:&stru_26CF0D240 table:0];
  id v8 = [(STLockoutViewController *)self messageLabel];
  [v8 setText:v7];

  [(STLockoutViewController *)self _changeMainButtonToEnterScreenTimePasscode];
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (void)_changeStateToApproved
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Approved", v4, 2u);
  }

  [(STLockoutViewController *)self _showApprovalAnimationIfNeeded];
  self->_isApprovedAnimationWithApprovalPending = 0;
  [(STLockoutViewController *)self _changeStateToDismissing];
}

- (void)_changeStateToDisapproved
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Disapproved", v7, 2u);
  }

  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = +[STScreenTimeUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"TimeLimitTitle" value:&stru_26CF0D240 table:0];
  id v6 = [(STLockoutViewController *)self titleLabel];
  [v6 setText:v5];

  [(STLockoutViewController *)self _changeMessageToInitial];
  [(STLockoutViewController *)self _changeMainButtonToEnterScreenTimePasscode];
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (void)_changeStateToContactBlocked
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Contact Blocked", v10, 2u);
  }

  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = [(STLockoutViewController *)self hourglassView];
  [v4 setHidden:1];

  id v5 = [(STLockoutViewController *)self communicationLimitView];
  [v5 setHidden:0];

  id v6 = +[STScreenTimeUIBundle bundle];
  uint64_t v7 = [v6 localizedStringForKey:@"RestrictedContactTitle" value:&stru_26CF0D240 table:0];
  id v8 = [(STLockoutViewController *)self titleLabel];
  [v8 setText:v7];

  id v9 = [(STLockoutViewController *)self _updateMessageLabelAndReturnHandleWithPhoneNumberFormat:@"BlockedPhoneNumberMessageFormat" emailAddressFormat:@"BlockedEmailAddressMessageFormat" contactNameFormat:@"BlockedContactNameMessageFormat"];
  [(STLockoutViewController *)self _changeMainButtonToAddContact:v9];
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (void)_changeStateToContactBlockedDuringDowntime
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Contact Blocked During Downtime", v11, 2u);
  }

  [(STLockoutViewController *)self _undoApprovalAnimationIfNeeded];
  id v4 = [(STLockoutViewController *)self communicationLimitView];
  [v4 setHidden:1];

  id v5 = [(STLockoutViewController *)self hourglassView];
  [v5 setHidden:0];

  id v6 = +[STScreenTimeUIBundle bundle];
  uint64_t v7 = [v6 localizedStringForKey:@"RestrictedContactTitle" value:&stru_26CF0D240 table:0];
  id v8 = [(STLockoutViewController *)self titleLabel];
  [v8 setText:v7];

  id v9 = [(STLockoutViewController *)self _updateMessageLabelAndReturnHandleWithPhoneNumberFormat:@"BlockedPhoneNumberDowntimeMessageFormat" emailAddressFormat:@"BlockedEmailAddressDowntimeMessageFormat" contactNameFormat:@"BlockedContactNameDowntimeMessageFormat"];
  id v10 = [(STLockoutViewController *)self policyController];
  LODWORD(v7) = [v10 _shouldRequestMoreTime];

  if (v7) {
    [(STLockoutViewController *)self _changeMainButtonToAskForMore];
  }
  else {
    [(STLockoutViewController *)self _changeMainButtonToIgnoreLimit];
  }
  [(STLockoutViewController *)self _restoreTextAndButtons];
}

- (id)_updateMessageLabelAndReturnHandleWithPhoneNumberFormat:(id)a3 emailAddressFormat:(id)a4 contactNameFormat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(STLockoutViewController *)self policyController];
  uint64_t v12 = [v11 blockedContactsHandles];

  id v13 = [v12 anyObject];
  [(STLockoutViewController *)self setBlockedContactsHandle:v13];
  id v14 = [(STLockoutViewController *)self contactNameByHandle];
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  v29 = v9;
  if (v15)
  {
    id v16 = v8;
    uint64_t v17 = +[STScreenTimeUIBundle bundle];
    v18 = [v17 localizedStringForKey:v10 value:&stru_26CF0D240 table:0];

    id v19 = v15;
    v20 = v13;
  }
  else if ([v13 destinationIdIsPhoneNumber])
  {
    uint64_t v21 = +[STScreenTimeUIBundle bundle];
    id v16 = v8;
    v18 = [v21 localizedStringForKey:v8 value:&stru_26CF0D240 table:0];

    v20 = TUNetworkCountryCode();
    v22 = v20;
    if (!v20)
    {
      v22 = TUHomeCountryCode();
    }
    TUFormattedPhoneNumber();
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20) {
  }
    }
  else
  {
    int v23 = [v13 destinationIdIsEmailAddress];
    v24 = +[STScreenTimeUIBundle bundle];
    v20 = v24;
    id v16 = v8;
    if (v23) {
      id v25 = v9;
    }
    else {
      id v25 = v10;
    }
    v18 = [v24 localizedStringForKey:v25 value:&stru_26CF0D240 table:0];
    id v19 = v13;
  }

  v26 = [NSString localizedStringWithValidatedFormat:v18, @"%lu %@", 0, objc_msgSend(v12, "count") - 1, v19 validFormatSpecifiers error];
  v27 = [(STLockoutViewController *)self messageLabel];
  [v27 setText:v26];

  return v19;
}

- (void)_changeStateToDismissing
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = +[STBlockingUILog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E199000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Dismissing", (uint8_t *)buf, 2u);
  }

  [(STLockoutViewController *)self _showDismissingAnimationIfNeeded];
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(buf, self);
  id v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "Waiting for dismissing animation", v13, 2u);
  }

  dismissingAnimationGroup = self->_dismissingAnimationGroup;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __51__STLockoutViewController__changeStateToDismissing__block_invoke;
  id v11 = &unk_26449B860;
  objc_copyWeak(v12, buf);
  v12[1] = reuseIdentifier;
  uint64_t v7 = (void *)MEMORY[0x263EF83A0];
  dispatch_group_notify(dismissingAnimationGroup, MEMORY[0x263EF83A0], &v8);

  [(STLockoutViewController *)self _actionDismiss];
  objc_destroyWeak(v12);
  objc_destroyWeak(buf);
}

void __51__STLockoutViewController__changeStateToDismissing__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 125) == *(void *)(a1 + 40))
  {
    id v4 = +[STBlockingUILog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21E199000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing animation complete — notifying clients", v5, 2u);
    }

    [v3 setDidFinishDismissing:1];
  }
}

- (BOOL)_isShowingInitialAnimation
{
  return dispatch_group_wait((dispatch_group_t)self->_initialAnimationGroup, 0) != 0;
}

- (void)_showInitialAnimationIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [(STLockoutViewController *)self hourglassView];
  if ([v11 isInitialState])
  {
    BOOL v3 = [(STLockoutViewController *)self _isShowingInitialAnimation];

    if (!v3)
    {
      id v4 = self->_initialAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v4);
      unint64_t style = self->_style;
      BOOL v6 = style > 4;
      uint64_t v7 = (1 << style) & 0x1A;
      if (v6 || v7 == 0)
      {
        objc_initWeak(&location, self);
        dispatch_time_t v9 = dispatch_time(0, 300000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__STLockoutViewController__showInitialAnimationIfNeeded__block_invoke;
        block[3] = &unk_26449B5C0;
        objc_copyWeak(&v14, &location);
        id v13 = v4;
        id v10 = (void *)MEMORY[0x263EF83A0];
        dispatch_after(v9, MEMORY[0x263EF83A0], block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      else
      {
        [(STLockoutViewController *)self _doInitialAnimationExitingGroup:v4];
      }
    }
  }
  else
  {
  }
}

void __56__STLockoutViewController__showInitialAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doInitialAnimationExitingGroup:*(void *)(a1 + 32)];
}

- (void)_doInitialAnimationExitingGroup:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_initWeak(&location, self);
  id v5 = [(STLockoutViewController *)self view];
  [v5 alpha];
  double v7 = v6;

  if (v7 == 0.0)
  {
    [(STLockoutViewController *)self _fadeInHourglass];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke;
    v8[3] = &unk_26449BA58;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [(STLockoutViewController *)self _fadeInBackdropWithCompletion:v8];

    objc_destroyWeak(&v10);
  }
  else
  {
    [(STLockoutViewController *)self _restoreHourglass];
    [(STLockoutViewController *)self _doInitialAnimationOfHourglassExitingGroup:v4];
  }
  objc_destroyWeak(&location);
}

void __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doInitialAnimationOfHourglassExitingGroup:*(void *)(a1 + 32)];
}

- (void)_doInitialAnimationOfHourglassExitingGroup:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(STLockoutViewController *)self _fadeInTextAndButtons];
  id v5 = [(STLockoutViewController *)self hourglassView];
  if ([v5 isInitialState])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke;
    v7[3] = &unk_26449B298;
    uint64_t v8 = v4;
    [v5 animateToStateName:0x26CF0D760 completionHandler:v7];
  }
  else
  {
    double v6 = +[STBlockingUILog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[STLockoutViewController _doInitialAnimationOfHourglassExitingGroup:]();
    }

    dispatch_group_leave(v4);
  }
}

void __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke(uint64_t a1)
{
  id v2 = +[STBlockingUILog log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke_cold_1();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_showApprovalAnimationIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  id v4 = [(STLockoutViewController *)self hourglassView];
  if ([(STLockoutViewController *)self isForSnapshot])
  {
    [v4 setStateName:0x26CF0D780];
    [(STLockoutViewController *)self _hideTextAndButtons];
  }
  else
  {
    id v5 = [v4 stateName];
    int v6 = [v5 isEqualToString:0x26CF0D760];

    if (v6)
    {
      double v7 = self->_approvalAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v7);
      initialAnimationGroup = self->_initialAnimationGroup;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke;
      block[3] = &unk_26449BA80;
      objc_copyWeak(v14, &location);
      v14[1] = reuseIdentifier;
      id v12 = v4;
      id v13 = v7;
      id v9 = v7;
      id v10 = (void *)MEMORY[0x263EF83A0];
      dispatch_group_notify(initialAnimationGroup, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(v14);
    }
  }

  objc_destroyWeak(&location);
}

void __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 125) == *(void *)(a1 + 56))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke_2;
    v5[3] = &unk_26449B298;
    id v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 animateToStateName:0x26CF0D780 completionHandler:v5];
    [v3 _fadeOutTextAndButtons];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
}

- (void)_undoApprovalAnimationIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  self->_isApprovedAnimationWithApprovalPending = 0;
  id v5 = [(STLockoutViewController *)self hourglassView];
  if ([(STLockoutViewController *)self isForSnapshot])
  {
    [v5 setStateName:0x26CF0D760];
    [(STLockoutViewController *)self _restoreTextAndButtons];
  }
  else
  {
    BOOL v3 = [v5 stateName];
    int v4 = [v3 isEqualToString:0x26CF0D780];

    if (v4)
    {
      [v5 animateToStateName:0x26CF0D760 completionHandler:&__block_literal_global_216];
      [(STLockoutViewController *)self _fadeInTextAndButtons];
    }
  }
}

- (void)_showDismissingAnimationIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  self->_isApprovedAnimationWithApprovalPending = 0;
  if ([(STLockoutViewController *)self isForSnapshot])
  {
    [(STLockoutViewController *)self _hideHourglass];
    [(STLockoutViewController *)self _hideTextAndButtons];
    [(STLockoutViewController *)self _hideBackdrop];
  }
  else
  {
    int v4 = [(STLockoutViewController *)self view];
    [v4 alpha];
    double v6 = v5;

    if (v6 == 1.0)
    {
      initialAnimationGroup = self->_initialAnimationGroup;
      uint64_t v8 = self->_approvalAnimationGroup;
      id v9 = self->_dismissingAnimationGroup;
      id v10 = initialAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v9);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      id v14[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke;
      v14[3] = &unk_26449BAD0;
      uint64_t v15 = v8;
      id v11 = v8;
      objc_copyWeak(v18, &location);
      v18[1] = reuseIdentifier;
      id v16 = self;
      uint64_t v17 = v9;
      id v12 = v9;
      id v13 = (void *)MEMORY[0x263EF83A0];
      dispatch_group_notify(v10, MEMORY[0x263EF83A0], v14);

      objc_destroyWeak(v18);
    }
  }
  objc_destroyWeak(&location);
}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_2;
  v5[3] = &unk_26449BA80;
  objc_copyWeak(v7, (id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(a1 + 48);
  v7[1] = *(id *)(a1 + 64);
  void v5[4] = v3;
  id v6 = v4;
  dispatch_group_notify(v2, MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(v7);
}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && WeakRetained[125] == *(void *)(a1 + 56))
  {
    [WeakRetained _fadeOutHourglass];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_3;
    v5[3] = &unk_26449BAA8;
    int v4 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v4 _fadeOutBackdropWithCompletion:v5];
    [v3 _fadeOutTextAndButtons];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
}

- (void)_fadeOutBackdropWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__STLockoutViewController__fadeOutBackdropWithCompletion___block_invoke;
  v6[3] = &unk_26449BA08;
  objc_copyWeak(&v7, &location);
  [v5 animateWithDuration:v6 animations:v4 completion:0.25];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__STLockoutViewController__fadeOutBackdropWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBackdrop];
}

- (void)_fadeInBackdropWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__STLockoutViewController__fadeInBackdropWithCompletion___block_invoke;
  v6[3] = &unk_26449BA08;
  objc_copyWeak(&v7, &location);
  [v5 animateWithDuration:v6 animations:v4 completion:0.2];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__STLockoutViewController__fadeInBackdropWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restoreBackdrop];
}

- (void)_fadeOutHourglass
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__STLockoutViewController__fadeOutHourglass__block_invoke;
  v3[3] = &unk_26449BA08;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v3 animations:0.25];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __44__STLockoutViewController__fadeOutHourglass__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideHourglass];
}

- (void)_fadeInHourglass
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__STLockoutViewController__fadeInHourglass__block_invoke;
  v3[3] = &unk_26449BA08;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v3 animations:0.2];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__STLockoutViewController__fadeInHourglass__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restoreHourglass];
}

- (void)_fadeOutTextAndButtons
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__STLockoutViewController__fadeOutTextAndButtons__block_invoke;
  v3[3] = &unk_26449BA08;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v3 animations:0.25];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__STLockoutViewController__fadeOutTextAndButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideTextAndButtons];
}

- (void)_fadeInTextAndButtons
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__STLockoutViewController__fadeInTextAndButtons__block_invoke;
  v3[3] = &unk_26449BA08;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v3 animations:0.2];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__STLockoutViewController__fadeInTextAndButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restoreTextAndButtons];
}

- (void)_hideBackdrop
{
  id v2 = [(STLockoutViewController *)self view];
  [v2 setAlpha:0.0];
}

- (void)_restoreBackdrop
{
  id v2 = [(STLockoutViewController *)self view];
  [v2 setAlpha:1.0];
}

- (void)_hideHourglass
{
  id v2 = [(STLockoutViewController *)self hourglassView];
  [v2 setAlpha:0.0];
}

- (void)_restoreHourglass
{
  id v2 = [(STLockoutViewController *)self hourglassView];
  [v2 setAlpha:1.0];
}

- (void)_hideTextAndButtons
{
}

- (void)_restoreTextAndButtons
{
  [(STLockoutViewController *)self _setTextAndButtonsAlpha:1.0];

  [(STLockoutViewController *)self _updateOKButtonVisibility];
}

- (void)_setTextAndButtonsAlpha:(double)a3
{
  double v5 = [(STLockoutViewController *)self titleLabel];
  [v5 setAlpha:a3];

  id v6 = [(STLockoutViewController *)self messageLabel];
  [v6 setAlpha:a3];

  id v7 = [(STLockoutViewController *)self mainButton];
  [v7 setAlpha:a3];

  id v8 = [(STLockoutViewController *)self okButton];
  [v8 setAlpha:a3];
}

- (void)stateDidChange:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    unint64_t v15 = a3;
    _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "stateDidChange STLockoutState : %ld", (uint8_t *)&v14, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(STLockoutViewController *)self isViewLoaded])
  {
    switch(a3)
    {
      case 2uLL:
        id v6 = +[STBlockingUILog log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v6, OS_LOG_TYPE_DEFAULT, "change state to Warn", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToWarn];
        break;
      case 3uLL:
        id v7 = +[STBlockingUILog log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v7, OS_LOG_TYPE_DEFAULT, "change state to Ask", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToAsk];
        break;
      case 4uLL:
        id v8 = +[STBlockingUILog log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v8, OS_LOG_TYPE_DEFAULT, "change state to Ask Pending", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToPending];
        break;
      case 5uLL:
        id v9 = +[STBlockingUILog log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v9, OS_LOG_TYPE_DEFAULT, "change state to Approved", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToApproved];
        break;
      case 6uLL:
        id v10 = +[STBlockingUILog log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v10, OS_LOG_TYPE_DEFAULT, "change state to Blocked", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToDisapproved];
        break;
      case 7uLL:
        id v11 = +[STBlockingUILog log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v11, OS_LOG_TYPE_DEFAULT, "change to policy Contact Blocked", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToContactBlocked];
        break;
      case 8uLL:
        id v12 = +[STBlockingUILog log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v12, OS_LOG_TYPE_DEFAULT, "change to policy Contact Blocked During Downtime", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToContactBlockedDuringDowntime];
        break;
      case 9uLL:
        id v13 = +[STBlockingUILog log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21E199000, v13, OS_LOG_TYPE_DEFAULT, "change state to OK", (uint8_t *)&v14, 2u);
        }

        [(STLockoutViewController *)self _changeStateToDismissing];
        break;
      default:
        return;
    }
  }
}

- (void)_showRestrictionsPINControllerWithMainCompletion:(id)a3
{
  id v4 = a3;
  double v5 = +[STBlockingUILog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, "presenting restrictions PIN controller", v8, 2u);
  }

  id v6 = (void *)[v4 copy];
  id restrictionsPINControllerCompletion = self->_restrictionsPINControllerCompletion;
  self->_id restrictionsPINControllerCompletion = v6;

  [(STLockoutViewController *)self _startListeningForRestrictionsPINEntryNotification];
  +[STRemotePasscodeController activateRemotePINUI];
}

- (void)_startListeningForRestrictionsPINEntryNotification
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "Listening for restrictions notification...", v2, v3, v4, v5, v6);
}

- (void)_stopListeningForRestrictionsPINEntryNotification
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "No longer listening for restrictions notification.", v2, v3, v4, v5, v6);
}

- (void)_handleRestrictionsPINNotification:(id)a3
{
  id v4 = a3;
  [(STLockoutViewController *)self _stopListeningForRestrictionsPINEntryNotification];
  uint64_t v5 = [v4 userInfo];

  uint8_t v6 = [v5 objectForKeyedSubscript:@"success"];
  uint64_t v7 = [v6 BOOLValue];

  [(STLockoutViewController *)self _restrictionsPINControllerDidFinish:v7];
}

- (void)_restrictionsPINControllerDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[STBlockingUILog log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "user successfully authenticated with restrictions PIN controller";
LABEL_6:
      _os_log_impl(&dword_21E199000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    uint64_t v7 = "user canceled restrictions PIN controller";
    goto LABEL_6;
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__STLockoutViewController__restrictionsPINControllerDidFinish___block_invoke;
  v8[3] = &unk_26449BAF8;
  void v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __63__STLockoutViewController__restrictionsPINControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1016);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40), 0);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1016);
    *(void *)(v3 + 1016) = 0;
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3 = [(STLockoutViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (BOOL)okButtonAlwaysHidden
{
  return self->_okButtonAlwaysHidden;
}

- (BOOL)mainButtonAlwaysHidden
{
  return self->_mainButtonAlwaysHidden;
}

- (UIResponder)customNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);

  return (UIResponder *)WeakRetained;
}

- (void)setCustomNextResponder:(id)a3
{
}

- (STLockoutPolicyController)policyController
{
  return self->_policyController;
}

- (void)setPolicyController:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (NSDictionary)contactNameByHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 1096, 1);
}

- (NSString)blockedContactsHandle
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setBlockedContactsHandle:(id)a3
{
}

- (STHourglassView)hourglassView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hourglassView);

  return (STHourglassView *)WeakRetained;
}

- (void)setHourglassView:(id)a3
{
}

- (UIImageView)communicationLimitView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_communicationLimitView);

  return (UIImageView *)WeakRetained;
}

- (void)setCommunicationLimitView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIButton)mainButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainButton);

  return (UIButton *)WeakRetained;
}

- (void)setMainButton:(id)a3
{
}

- (UIButton)okButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_okButton);

  return (UIButton *)WeakRetained;
}

- (void)setOkButton:(id)a3
{
}

- (BOOL)isForSnapshot
{
  return self->_forSnapshot;
}

- (BOOL)didFinishDismissing
{
  return self->_didFinishDismissing;
}

- (int64_t)okButtonAction
{
  return self->_okButtonAction;
}

- (void)setOkButtonAction:(int64_t)a3
{
  self->_okButtonAction = a3;
}

- (id)addContactHandler
{
  return objc_getProperty(self, a2, 1168, 1);
}

- (void)setAddContactHandler:(id)a3
{
}

- (id)addBlockedContactHandler
{
  return objc_getProperty(self, a2, 1176, 1);
}

- (void)setAddBlockedContactHandler:(id)a3
{
}

- (STLockoutViewControllerDelegate)viewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerDelegate);

  return (STLockoutViewControllerDelegate *)WeakRetained;
}

- (void)setViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong(&self->_addBlockedContactHandler, 0);
  objc_storeStrong(&self->_addContactHandler, 0);
  objc_destroyWeak((id *)&self->_okButton);
  objc_destroyWeak((id *)&self->_mainButton);
  objc_destroyWeak((id *)&self->_messageLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_communicationLimitView);
  objc_destroyWeak((id *)&self->_hourglassView);
  objc_storeStrong((id *)&self->_blockedContactsHandle, 0);
  objc_storeStrong((id *)&self->_contactNameByHandle, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_policyController, 0);
  objc_destroyWeak((id *)&self->_customNextResponder);
  objc_storeStrong((id *)&self->_dismissingAnimationGroup, 0);
  objc_storeStrong((id *)&self->_approvalAnimationGroup, 0);
  objc_storeStrong((id *)&self->_initialAnimationGroup, 0);
  objc_destroyWeak((id *)&self->_presentedAlertController);
  objc_storeStrong(&self->_restrictionsPINControllerCompletion, 0);

  objc_storeStrong((id *)&self->_sbsLockScreenService, 0);
}

- (void)viewWillAppear:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "skipping initalization of hourglass state", v2, v3, v4, v5, v6);
}

- (void)viewWillAppear:(char)a1 .cold.2(char a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21E199000, v2, v3, "lock out view will appear animated:%@", v4, v5, v6, v7, v8);
}

- (void)viewDidAppear:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "skipping animation of hourglass state to filled", v2, v3, v4, v5, v6);
}

- (void)viewDidAppear:(char)a1 .cold.2(char a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_21E199000, v2, v3, "lock out view did appear animated:%@", v4, v5, v6, v7, v8);
}

- (void)setForSnapshot:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Unable to change forSnapshot property after view is loaded; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)setBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Attempt to change bundleIdentifier to nil; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
}

+ (void)_applicationNameForBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "bundle identifier %@ -> application name '%@'");
}

+ (void)_applicationNameForBundleIdentifier:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21E199000, v1, OS_LOG_TYPE_ERROR, "Failed to get application record for %{public}@ %{public}@", v2, 0x16u);
}

+ (void)_applicationNameForWebsiteURL:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_21E199000, v0, v1, "website URL %@ -> bundle identifier %@");
}

void __37__STLockoutViewController__actionOK___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed to return to Springboard: %@", v2, v3, v4, v5, v6);
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_87_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed ignoring 1 more minute with error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed ignoring 15 more minute with error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed ignoring all day with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_actionUnlockedAskOrApproveActionSheet
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Ask or Approve action sheet has no actions; dropping request on the floor",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed requesting 1 more minute with error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed requesting 15 more minute with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_actionUnlockedEnterScreenTimePasscodeActionSheet
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Enter Screen Time Passcode attempted without restrictions passcode being set", v2, v3, v4, v5, v6);
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_144_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed approving 15 minutes with error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_151_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed approving 1 hour with error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_158_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21E199000, v0, v1, "Failed approving all day with error: %{public}@", v2, v3, v4, v5, v6);
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_21E199000, v0, v1, "Approval not received within timeout, restoring UI", v2, v3, v4, v5, v6);
}

void __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "finished animation of backdrop state to timesUp", v2, v3, v4, v5, v6);
}

- (void)_doInitialAnimationOfHourglassExitingGroup:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "hourglass is not in base state - skipping initial animation", v2, v3, v4, v5, v6);
}

void __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_21E199000, v0, v1, "finished animation of hourglass state to filled", v2, v3, v4, v5, v6);
}

@end