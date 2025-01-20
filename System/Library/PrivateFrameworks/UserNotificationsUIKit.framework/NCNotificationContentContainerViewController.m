@interface NCNotificationContentContainerViewController
+ (id)_defaultUIExtensionForNotificationRequest:(id)a3 visibleAttachment:(id *)a4;
+ (id)_visibleAttachmentForNotificationRequest:(id)a3;
+ (id)extensionForNotificationRequest:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowManualDismiss;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)defaultContentHidden;
- (BOOL)didReceiveNotificationRequest:(id)a3;
- (BOOL)overridesDefaultTitle;
- (BOOL)performAction:(id)a3 forNotification:(id)a4;
- (BOOL)performAction:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5;
- (BOOL)restoreInputViews;
- (BOOL)userInteractionEnabled;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NCNotificationContentContainerViewController)initWithNotificationRequest:(id)a3;
- (NCNotificationCustomContentDelegate)delegate;
- (NCNotificationRequest)notificationRequest;
- (NCNotificationTextInputView)inputAccessoryView;
- (NSMutableArray)updatedActions;
- (NSString)contentExtensionIdentifier;
- (NSString)title;
- (_UNNotificationContentExtensionHostContainerViewController)extensionContainerViewController;
- (id)_responseForAction:(id)a3 notification:(id)a4 userInfo:(id)a5;
- (id)_textInputActionInNotification:(id)a3;
- (id)cancelTouches;
- (unint64_t)customContentLocation;
- (void)_forwardActionToExtension:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5;
- (void)_loadExtensionContainerViewControllerForNotificationRequest:(id)a3;
- (void)_removeInputAccessoryView:(id)a3;
- (void)_setupExtensionContainerViewControllerController:(id)a3;
- (void)_setupQuickReplyForNotificationAction:(id)a3;
- (void)_setupQuickReplyForNotificationRequest:(id)a3;
- (void)extensionViewControllerDidLoadExtension:(id)a3;
- (void)extensionViewControllerDidUpdateActions:(id)a3;
- (void)extensionViewControllerDidUpdateTitle:(id)a3;
- (void)extensionViewControllerRequestsDefaultAction:(id)a3;
- (void)extensionViewControllerRequestsDismiss:(id)a3;
- (void)notificationTextInputView:(id)a3 didConfirmText:(id)a4 forAction:(id)a5;
- (void)playMedia;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preserveInputViews;
- (void)setCustomContentLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionContainerViewController:(id)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setUpdatedActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NCNotificationContentContainerViewController

+ (id)extensionForNotificationRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F44778] sharedInstance];
    v6 = [v4 sectionIdentifier];
    v7 = [v4 categoryIdentifier];
    v8 = [v5 extensionForNotificationSourceIdentifier:v6 categoryIdentifier:v7];

    if (!v8)
    {
      v8 = [a1 _defaultUIExtensionForNotificationRequest:v4 visibleAttachment:0];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NCNotificationContentContainerViewController)initWithNotificationRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  v6 = [(NCNotificationContentContainerViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationRequest, a3);
    [(NCNotificationContentContainerViewController *)v7 _loadExtensionContainerViewControllerForNotificationRequest:v5];
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  char v3 = [v2 canBecomeFirstResponder] ^ 1;

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  BOOL v3 = [(NCNotificationContentContainerViewController *)&v9 becomeFirstResponder];
  if (v3)
  {
    id v4 = [(NCNotificationContentContainerViewController *)self notificationRequest];
    int v5 = [v4 showsTextInputOnAppearance];

    if (v5)
    {
      v6 = [(NCNotificationContentContainerViewController *)self notificationRequest];
      [(NCNotificationContentContainerViewController *)self _setupQuickReplyForNotificationRequest:v6];

      v7 = [(NCNotificationContentContainerViewController *)self inputAccessoryView];
      [v7 becomeFirstResponder];
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v4 viewDidLoad];
  BOOL v3 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  [(NCNotificationContentContainerViewController *)self _setupExtensionContainerViewControllerController:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewWillAppear:]";
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v6 viewWillAppear:v3];
  [(NCNotificationContentContainerViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = "-[NCNotificationContentContainerViewController viewWillDisappear:]";
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v7 viewWillDisappear:v3];
  objc_super v6 = [(NCNotificationContentContainerViewController *)self firstResponder];
  [v6 resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewDidAppear:]";
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v6 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[NCNotificationContentContainerViewController viewDidDisappear:]";
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v6 viewDidDisappear:v3];
}

- (NSString)title
{
  v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationContentContainerViewController;
  [(NCNotificationContentContainerViewController *)&v12 preferredContentSizeDidChangeForChildContentContainer:v4];
  [(NCNotificationContentContainerViewController *)self preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  [v4 preferredContentSize];
  if (v6 != v10 || v8 != v9)
  {
    [v4 preferredContentSize];
    -[NCNotificationContentContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];

  if (v7)
  {
    double v8 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
    double v9 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v9, width, height);
    double width = v10;
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }
  double v13 = width;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationContentContainerViewController;
  id v7 = a4;
  -[NCNotificationContentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)extensionViewControllerDidLoadExtension:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 customContentDidLoadExtension:self];
  }
}

- (void)extensionViewControllerDidUpdateTitle:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 customContentDidUpdateTitle:self];
  }
}

- (void)extensionViewControllerDidUpdateActions:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v5 = [(NCNotificationContentContainerViewController *)self notificationRequest];
  double v6 = [v4 actions];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __88__NCNotificationContentContainerViewController_extensionViewControllerDidUpdateActions___block_invoke;
  v16 = &unk_1E6A93AB0;
  id v7 = v5;
  id v17 = v7;
  v18 = &v19;
  [v6 enumerateObjectsUsingBlock:&v13];
  updatedActions = self->_updatedActions;
  if (updatedActions)
  {
    -[NSMutableArray addObjectsFromArray:](updatedActions, "addObjectsFromArray:", v20[5], v13, v14, v15, v16);
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    double v10 = (NSMutableArray *)objc_msgSend(v9, "initWithArray:", v20[5], v13, v14, v15, v16);
    double v11 = self->_updatedActions;
    self->_updatedActions = v10;
  }
  double v12 = [(NCNotificationContentContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 customContent:self didUpdateUserNotificationActions:v20[5]];
  }

  _Block_object_dispose(&v19, 8);
}

void __88__NCNotificationContentContainerViewController_extensionViewControllerDidUpdateActions___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4FB37D8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = [v4 bulletin];
  id v7 = [*(id *)(a1 + 32) observer];
  id v8 = [v3 notificationActionForUNNotificationAction:v5 bulletin:v6 observer:v7];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
}

- (void)extensionViewControllerRequestsDefaultAction:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 customContentRequestsDefaultAction:self];
  }
}

- (void)extensionViewControllerRequestsDismiss:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 customContentRequestsDismiss:self];
  }
}

- (BOOL)didReceiveNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    id v7 = [v4 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");
    id v9 = [v4 threadIdentifier];
    double v10 = objc_msgSend(v9, "un_logDigest");
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Content container received additional notification %{public}@ for thread %{public}@", (uint8_t *)&v14, 0x16u);
  }
  double v11 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  double v12 = [v4 userNotification];
  [v11 didReceiveNotification:v12];

  return v11 != 0;
}

- (BOOL)performAction:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 identifier];
  char v12 = [v11 isEqual:*MEMORY[0x1E4F446D0]];

  if ((v12 & 1) != 0
    || (-[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController"), uint64_t v13 = objc_claimAutoreleasedReturnValue(), v14 = [v13 extensionWantsToReceiveActionResponses], v13, !v14))
  {
    BOOL v21 = 0;
  }
  else
  {
    v15 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v15;
      id v17 = [v8 identifier];
      uint64_t v18 = [v9 notificationIdentifier];
      uint64_t v19 = objc_msgSend(v18, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "Sending action %{public}@ for notification %{public}@ to extension container", buf, 0x16u);
    }
    if ([v8 requiresAuthentication])
    {
      v20 = [(NCNotificationContentContainerViewController *)self delegate];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __91__NCNotificationContentContainerViewController_performAction_forNotification_withUserInfo___block_invoke;
      v23[3] = &unk_1E6A93AD8;
      v23[4] = self;
      id v24 = v8;
      id v25 = v9;
      id v26 = v10;
      [v20 customContent:self requestPermissionToExecuteAction:v24 forNotification:v25 withUserInfo:v26 completionHandler:v23];
    }
    else
    {
      [(NCNotificationContentContainerViewController *)self _forwardActionToExtension:v8 forNotification:v9 withUserInfo:v10];
    }
    BOOL v21 = 1;
  }

  return v21;
}

void __91__NCNotificationContentContainerViewController_performAction_forNotification_withUserInfo___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    [v3 _forwardActionToExtension:v4 forNotification:v5 withUserInfo:v6];
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = v7;
      id v10 = [v8 identifier];
      double v11 = [*(id *)(a1 + 48) notificationIdentifier];
      char v12 = objc_msgSend(v11, "un_logDigest");
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Not allowing action %{public}@ for notification %{public}@ to extension container due to passcode failure or cancellation", (uint8_t *)&v16, 0x16u);
    }
    if ([*(id *)(a1 + 40) behavior] == 1)
    {
      uint64_t v13 = [*(id *)(a1 + 32) extensionContainerViewController];
      char v14 = [v13 canBecomeFirstResponder];

      if ((v14 & 1) == 0)
      {
        [*(id *)(a1 + 32) _setupQuickReplyForNotificationAction:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) becomeFirstResponder];
        v15 = [*(id *)(a1 + 32) inputAccessoryView];
        [v15 becomeFirstResponder];
      }
    }
  }
}

- (BOOL)performAction:(id)a3 forNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 behavior] == 1
    && (-[NCNotificationContentContainerViewController extensionContainerViewController](self, "extensionContainerViewController"), v8 = objc_claimAutoreleasedReturnValue(), char v9 = [v8 canBecomeFirstResponder], v8, (v9 & 1) == 0))
  {
    [(NCNotificationContentContainerViewController *)self _setupQuickReplyForNotificationAction:v6];
    [(NCNotificationContentContainerViewController *)self becomeFirstResponder];
    double v11 = [(NCNotificationContentContainerViewController *)self inputAccessoryView];
    [v11 becomeFirstResponder];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = [(NCNotificationContentContainerViewController *)self performAction:v6 forNotification:v7 withUserInfo:MEMORY[0x1E4F1CC08]];
  }

  return v10;
}

- (BOOL)defaultContentHidden
{
  BOOL v3 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  if (v3)
  {
    uint64_t v4 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
    char v5 = [v4 isDefaultContentHidden];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)overridesDefaultTitle
{
  BOOL v3 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  if (v3)
  {
    uint64_t v4 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
    char v5 = [v4 isDefaultTitleOverridden];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)preserveInputViews
{
  id v5 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  if [v5 canBecomeFirstResponder] && (objc_opt_respondsToSelector())
  {
    [v5 preserveInputViews];
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4FB1A90] sharedInstance];
    uint64_t v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v3 _preserveInputViewsWithId:v4 animated:1];
  }
}

- (BOOL)restoreInputViews
{
  BOOL v3 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  if [v3 canBecomeFirstResponder] && (objc_opt_respondsToSelector())
  {
    char v4 = [v3 restoreInputViews];
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1A90] sharedInstance];
    id v6 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    char v4 = [v5 _restoreInputViewsWithId:v6 animated:1];
  }
  return v4;
}

- (BOOL)allowManualDismiss
{
  return 1;
}

- (BOOL)userInteractionEnabled
{
  v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  char v3 = [v2 isUserInteractionEnabled];

  return v3;
}

- (unint64_t)customContentLocation
{
  return self->_customContentLocation;
}

- (NSString)contentExtensionIdentifier
{
  v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  char v3 = [v2 extensionIdentifier];

  return (NSString *)v3;
}

- (void)playMedia
{
  id v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  [v2 playMedia];
}

- (id)cancelTouches
{
  id v2 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  char v3 = [v2 cancelTouchesForCurrentEventInExtension];

  return v3;
}

- (void)notificationTextInputView:(id)a3 didConfirmText:(id)a4 forAction:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v14 = *MEMORY[0x1E4F50D00];
  v15[0] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  BOOL v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  double v11 = [(NCNotificationContentContainerViewController *)self notificationRequest];
  LOBYTE(v9) = [(NCNotificationContentContainerViewController *)self performAction:v7 forNotification:v11 withUserInfo:v10];

  if ((v9 & 1) == 0)
  {
    char v12 = [(NCNotificationContentContainerViewController *)self delegate];
    uint64_t v13 = [(NCNotificationContentContainerViewController *)self notificationRequest];
    [v12 customContent:self forwardAction:v7 forNotification:v13 withUserInfo:v10];
  }
}

- (void)_setupExtensionContainerViewControllerController:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NCNotificationContentContainerViewController *)self isViewLoaded];
  if (v4)
  {
    if (v5)
    {
      id v6 = [v4 parentViewController];

      if (!v6)
      {
        id v7 = (void *)*MEMORY[0x1E4FB3760];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
        {
          id v8 = v7;
          id v9 = (objc_class *)objc_opt_class();
          BOOL v10 = NSStringFromClass(v9);
          double v11 = [(NCNotificationContentContainerViewController *)self notificationRequest];
          char v12 = [v11 notificationIdentifier];
          uint64_t v13 = objc_msgSend(v12, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          v22 = v10;
          __int16 v23 = 2114;
          id v24 = v13;
          _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Setting up content container view controller %{public}@ for notification %{public}@", buf, 0x16u);
        }
        [(NCNotificationContentContainerViewController *)self addChildViewController:v4];
        uint64_t v14 = [v4 view];
        v15 = [(NCNotificationContentContainerViewController *)self view];
        [v15 bounds];
        objc_msgSend(v14, "setFrame:");

        [v14 setAutoresizingMask:18];
        int v16 = [(NCNotificationContentContainerViewController *)self view];
        [v16 addSubview:v14];

        [v4 didMoveToParentViewController:self];
        [v14 setAlpha:0.0];
        id v17 = (void *)MEMORY[0x1E4FB1EB0];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __97__NCNotificationContentContainerViewController__setupExtensionContainerViewControllerController___block_invoke;
        v19[3] = &unk_1E6A91BB0;
        id v20 = v14;
        id v18 = v14;
        [v17 animateWithDuration:v19 animations:0.25];
      }
    }
  }
}

uint64_t __97__NCNotificationContentContainerViewController__setupExtensionContainerViewControllerController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

+ (id)_visibleAttachmentForNotificationRequest:(id)a3
{
  char v3 = [a3 userNotification];
  id v4 = [v3 request];
  int v5 = [v4 content];
  id v6 = [v5 attachments];

  id v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_19);

  return v7;
}

BOOL __89__NCNotificationContentContainerViewController__visibleAttachmentForNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 options];
  BOOL v3 = [v2 displayLocation] != 1;

  return v3;
}

+ (id)_defaultUIExtensionForNotificationRequest:(id)a3 visibleAttachment:(id *)a4
{
  if (a3)
  {
    int v5 = objc_msgSend(a1, "_visibleAttachmentForNotificationRequest:");
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.UserNotificationsUIKit.DefaultUIExtension" error:0];
      if (a4) {
        *a4 = v5;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_loadExtensionContainerViewControllerForNotificationRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_customContentLocation = 0;
  int v5 = [MEMORY[0x1E4F44778] sharedInstance];
  id v6 = [v4 sectionIdentifier];
  id v7 = [v4 categoryIdentifier];
  id v8 = [v5 extensionForNotificationSourceIdentifier:v6 categoryIdentifier:v7];

  id v9 = v8;
  BOOL v10 = v9;
  if (!v9)
  {
    id v23 = 0;
    BOOL v10 = [(id)objc_opt_class() _defaultUIExtensionForNotificationRequest:v4 visibleAttachment:&v23];
    if (!v10)
    {
      [(NCNotificationContentContainerViewController *)self setExtensionContainerViewController:0];
      int v16 = 0;
LABEL_11:
      BOOL v21 = [(NCNotificationContentContainerViewController *)self notificationRequest];
      int v22 = [v21 showsTextInputOnAppearance];

      if (v22) {
        [(NCNotificationContentContainerViewController *)self _setupQuickReplyForNotificationRequest:v4];
      }
      goto LABEL_13;
    }
    if ([v23 family] == 1) {
      self->_customContentLocation = 1;
    }
  }
  double v11 = [(NCNotificationContentContainerViewController *)self notificationRequest];
  char v12 = [v11 defaultEnvironmentActions];

  uint64_t v13 = objc_msgSend(v12, "bs_map:", &__block_literal_global_44);
  id v14 = objc_alloc(MEMORY[0x1E4F44770]);
  v15 = [v4 userNotification];
  int v16 = (void *)[v14 initWithExtension:v10 notification:v15 actions:v13];

  [v16 setDelegate:self];
  [(NCNotificationContentContainerViewController *)self setExtensionContainerViewController:v16];
  if (v16)
  {
    id v17 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      uint64_t v19 = [v4 notificationIdentifier];
      id v20 = objc_msgSend(v19, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v20;
      _os_log_impl(&dword_1D7C04000, v18, OS_LOG_TYPE_DEFAULT, "Created extension container view controller for notification %{public}@", buf, 0xCu);
    }
  }
  if (!v9) {
    goto LABEL_11;
  }
LABEL_13:
}

uint64_t __108__NCNotificationContentContainerViewController__loadExtensionContainerViewControllerForNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB37D8] userNotificationActionForNCNotificationAction:a2];
}

- (void)_setupQuickReplyForNotificationRequest:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self _textInputActionInNotification:a3];
  if (v4)
  {
    int v5 = v4;
    [(NCNotificationContentContainerViewController *)self _setupQuickReplyForNotificationAction:v4];
    id v4 = v5;
  }
}

- (void)_setupQuickReplyForNotificationAction:(id)a3
{
  id v4 = a3;
  int v5 = [(NCNotificationContentContainerViewController *)self inputAccessoryView];

  if (v5)
  {
    v15 = [(NCNotificationContentContainerViewController *)self inputAccessoryView];
    [(NCNotificationTextInputView *)v15 setAction:v4];
  }
  else
  {
    id v6 = [NCNotificationTextInputView alloc];
    v15 = -[NCNotificationTextInputView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NCNotificationTextInputView *)v15 setDelegate:self];
    [(NCNotificationTextInputView *)v15 setAction:v4];

    [(NCNotificationTextInputView *)v15 sizeToFit];
    id v4 = [(NCNotificationContentContainerViewController *)self notificationRequest];
    id v7 = [v4 content];
    id v8 = [v7 communicationContext];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1848]);
      BOOL v10 = [v7 message];
      double v11 = [v4 timestamp];
      char v12 = [v8 sender];
      uint64_t v13 = [v12 handle];
      [v9 addTextEntry:v10 timestamp:v11 senderIdentifier:v13];

      [(NCNotificationTextInputView *)v15 setInputContextHistory:v9];
    }
    [(NCNotificationContentContainerViewController *)self setInputAccessoryView:v15];
    [(NCNotificationContentContainerViewController *)self reloadInputViews];
    if (([v4 showsTextInputOnAppearance] & 1) == 0)
    {
      id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:self selector:sel__removeInputAccessoryView_ name:*MEMORY[0x1E4FB2BC0] object:0];
    }
  }
}

- (id)_textInputActionInNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a3 defaultEnvironmentActions];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "behavior", (void)v9) == 1)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_removeInputAccessoryView:(id)a3
{
  id v4 = [(NCNotificationContentContainerViewController *)self notificationRequest];
  char v5 = [v4 showsTextInputOnAppearance];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FB2BC0] object:0];

    [(NCNotificationContentContainerViewController *)self setInputAccessoryView:0];
    [(NCNotificationContentContainerViewController *)self reloadInputViews];
  }
}

- (void)_forwardActionToExtension:(id)a3 forNotification:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [(NCNotificationContentContainerViewController *)self _responseForAction:v8 notification:a4 userInfo:v9];
  long long v11 = [(NCNotificationContentContainerViewController *)self extensionContainerViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke;
  v15[3] = &unk_1E6A93B68;
  id v16 = v10;
  id v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [v11 didReceiveNotificationResponse:v14 completionHandler:v15];
}

void __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke_2;
  block[3] = &unk_1E6A93B40;
  uint64_t v11 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __103__NCNotificationContentContainerViewController__forwardActionToExtension_forNotification_withUserInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = (void *)*MEMORY[0x1E4FB3760];
  unint64_t v4 = v2 - 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    if (v2 == 2) {
      char v5 = "forwarded";
    }
    else {
      char v5 = "completed";
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = [v6 actionIdentifier];
    id v9 = (void *)v8;
    id v10 = "did not dismiss";
    *(_DWORD *)id v17 = 136446722;
    *(void *)&v17[4] = v5;
    if (v4 < 2) {
      id v10 = "dismissed";
    }
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v8;
    __int16 v18 = 2082;
    id v19 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Extension container %{public}s handling of action <%{public}@> and %{public}s the notification", v17, 0x20u);
  }
  BOOL v11 = v2 == 2;
  id v12 = objc_msgSend(*(id *)(a1 + 40), "delegate", *(_OWORD *)v17);
  id v13 = [*(id *)(a1 + 48) actionRunner];
  [v13 setShouldForwardAction:v11];

  if (v4 <= 1)
  {
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [v14 notificationRequest];
    [v12 customContent:v14 forwardAction:v15 forNotification:v16 withUserInfo:*(void *)(a1 + 56)];
  }
}

- (id)_responseForAction:(id)a3 notification:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 behavior])
  {
    if ([v7 behavior] == 1)
    {
      uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F50D00]];
      BOOL v11 = (void *)v10;
      id v12 = &stru_1F2F516F8;
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      id v13 = v12;

      id v14 = (void *)MEMORY[0x1E4F44668];
      uint64_t v15 = [v8 userNotification];
      id v16 = [v7 identifier];
      id v17 = [v14 responseWithNotification:v15 actionIdentifier:v16 userText:v13];
    }
    else
    {
      BOOL v21 = (void *)*MEMORY[0x1E4FB3760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_ERROR)) {
        -[NCNotificationContentContainerViewController _responseForAction:notification:userInfo:](v21, v7, v8);
      }
      id v17 = 0;
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1E4F44630];
    id v19 = [v8 userNotification];
    uint64_t v20 = [v7 identifier];
    id v17 = [v18 responseWithNotification:v19 actionIdentifier:v20];
  }

  return v17;
}

- (NCNotificationCustomContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationCustomContentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (_UNNotificationContentExtensionHostContainerViewController)extensionContainerViewController
{
  return self->_extensionContainerViewController;
}

- (void)setExtensionContainerViewController:(id)a3
{
}

- (NCNotificationTextInputView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (void)setCustomContentLocation:(unint64_t)a3
{
  self->_customContentLocation = a3;
}

- (NSMutableArray)updatedActions
{
  return self->_updatedActions;
}

- (void)setUpdatedActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedActions, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_extensionContainerViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_responseForAction:(void *)a1 notification:(void *)a2 userInfo:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v5 = a1;
  uint64_t v6 = [a2 behavior];
  id v7 = [a3 notificationIdentifier];
  id v8 = objc_msgSend(v7, "un_logDigest");
  int v9 = 134218242;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Unknown action behavior %lu for notification %{public}@", (uint8_t *)&v9, 0x16u);
}

@end