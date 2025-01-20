@interface NCExpandedPlatterViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_canTransitionToPlatterPresentationState:(int)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)expandedPlatterView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4;
- (BOOL)resignFirstResponder;
- (CGSize)_maximumPlatterSize;
- (CGSize)_preferredCustomContentSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NCExpandedPlatterViewController)initWithNotificationRequest:(id)a3 customContentViewController:(id)a4;
- (NCExpandedPlatterViewControllerDelegate)delegate;
- (NCNotificationCustomContent)customContentViewController;
- (NCNotificationRequest)notificationRequest;
- (PLExpandedPlatterDismissing)dismisser;
- (id)_expandedPlatterView;
- (id)_expandedPlatterViewIfLoaded;
- (id)_expandedPlatterViewLoadingIfNecessary:(BOOL)a3;
- (id)_pendingPresentationTransitionDidEndBlock;
- (void)_handleDefaultTap:(id)a3;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_setCustomContentViewController:(id)a3;
- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3;
- (void)_setPreferredCustomContentSize:(CGSize)a3;
- (void)_setupStaticContentProviderIfNecessary;
- (void)_updatePreferredContentSize;
- (void)_updatePreferredCustomContentSize;
- (void)_updateScreenCaptureProhibited;
- (void)_updateWithProvidedCustomContent;
- (void)_updateWithProvidedStaticContent;
- (void)addExpandedPlatterObserver:(id)a3;
- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4;
- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6;
- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7;
- (void)customContentDidLoadExtension:(id)a3;
- (void)customContentDidUpdateTitle:(id)a3;
- (void)customContentRequestsDefaultAction:(id)a3;
- (void)customContentRequestsDismiss:(id)a3;
- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4;
- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4;
- (void)expandedPlatterDidPresent:(id)a3;
- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4;
- (void)expandedPlatterView:(id)a3 requestsInteractionWithURL:(id)a4;
- (void)expandedPlatterWillPresent:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)playMedia;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)removeExpandedPlatterObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismisser:(id)a3;
- (void)setNotificationRequest:(id)a3;
- (void)userInteractionDidEndForExpandedPlatter:(id)a3;
- (void)userInteractionWillBeginForExpandedPlatter:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NCExpandedPlatterViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    NCRegisterUserNotificationsUILogging();
  }
}

- (NCExpandedPlatterViewController)initWithNotificationRequest:(id)a3 customContentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NCExpandedPlatterViewController;
  v8 = [(NCExpandedPlatterViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NCExpandedPlatterViewController *)v8 setNotificationRequest:v6];
    [(NCExpandedPlatterViewController *)v9 _setCustomContentViewController:v7];
  }

  return v9;
}

- (void)setNotificationRequest:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    staticContentProvider = self->_staticContentProvider;
    self->_staticContentProvider = 0;

    id v6 = [(NCExpandedPlatterViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];

    [(NCExpandedPlatterViewController *)self _updateScreenCaptureProhibited];
  }
}

- (void)playMedia
{
  if (objc_opt_respondsToSelector())
  {
    customContentViewController = self->_customContentViewController;
    [(NCNotificationCustomContent *)customContentViewController playMedia];
  }
}

- (BOOL)canBecomeFirstResponder
{
  if (self->_customContentViewController)
  {
    customContentViewController = self->_customContentViewController;
    return [(NCNotificationCustomContent *)customContentViewController canBecomeFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCExpandedPlatterViewController;
    return [(NCExpandedPlatterViewController *)&v4 canBecomeFirstResponder];
  }
}

- (BOOL)becomeFirstResponder
{
  if (self->_customContentViewController)
  {
    char v3 = objc_opt_respondsToSelector();
    customContentViewController = self->_customContentViewController;
    if (v3)
    {
      return [(NCNotificationCustomContent *)customContentViewController restoreInputViews];
    }
    else
    {
      return [(NCNotificationCustomContent *)customContentViewController becomeFirstResponder];
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCExpandedPlatterViewController;
    return [(NCExpandedPlatterViewController *)&v6 becomeFirstResponder];
  }
}

- (BOOL)canResignFirstResponder
{
  if (self->_customContentViewController)
  {
    customContentViewController = self->_customContentViewController;
    return [(NCNotificationCustomContent *)customContentViewController canResignFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCExpandedPlatterViewController;
    return [(NCExpandedPlatterViewController *)&v4 canResignFirstResponder];
  }
}

- (BOOL)resignFirstResponder
{
  if (self->_customContentViewController)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationCustomContent *)self->_customContentViewController preserveInputViews];
    }
    customContentViewController = self->_customContentViewController;
    return [(NCNotificationCustomContent *)customContentViewController resignFirstResponder];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NCExpandedPlatterViewController;
    return [(NCExpandedPlatterViewController *)&v5 resignFirstResponder];
  }
}

- (void)keyboardWillShow:(id)a3
{
  if ([(NCExpandedPlatterViewController *)self bs_isAppearingOrAppeared]
    && [(NCNotificationCustomContent *)self->_customContentViewController _containsFirstResponder])
  {
    id v4 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
    [v4 setScrollViewPinnedToBottom:1];
  }
}

- (void)keyboardWillHide:(id)a3
{
  id v3 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  [v3 setScrollViewPinnedToBottom:0];
}

- (void)loadView
{
  id v3 = objc_alloc_init(NCExpandedPlatterView);
  [(PLExpandedPlatterView *)v3 setDelegate:self];
  [(PLExpandedPlatterView *)v3 setHeaderEnabled:0];
  [(PLExpandedPlatterView *)v3 setDismissControlEnabled:0];
  [(NCExpandedPlatterViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v3 viewDidLoad];
  [(NCExpandedPlatterViewController *)self _updateWithProvidedStaticContent];
  [(NCExpandedPlatterViewController *)self _updateWithProvidedCustomContent];
  [(NCExpandedPlatterViewController *)self _updatePreferredContentSize];
  [(NCExpandedPlatterViewController *)self _updateScreenCaptureProhibited];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v8 viewWillAppear:a3];
  id v4 = [(NCExpandedPlatterViewController *)self view];
  objc_super v5 = [v4 window];
  [v5 makeKeyAndVisible];

  objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v6 viewWillDisappear:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v6 viewDidDisappear:a3];
  id v4 = [(NCExpandedPlatterViewController *)self view];
  objc_super v5 = [v4 window];
  [v5 resignKeyWindow];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v3 viewWillLayoutSubviews];
  [(NCExpandedPlatterViewController *)self _setupStaticContentProviderIfNecessary];
  [(NCExpandedPlatterViewController *)self _updatePreferredContentSize];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterViewController;
  [(NCExpandedPlatterViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(NCExpandedPlatterViewController *)self _updatePreferredContentSize];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (self->_customContentViewController == a3)
  {
    id v10 = a3;
    [(NCExpandedPlatterViewController *)self _maximumPlatterSize];
    if (width < v11) {
      double v11 = width;
    }
    objc_msgSend(v10, "sizeForChildContentContainer:withParentContainerSize:", v10, v11, height);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NCExpandedPlatterViewController;
    -[NCExpandedPlatterViewController sizeForChildContentContainer:withParentContainerSize:](&v16, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  }
  double v12 = v8;
  double v13 = v9;

  double v14 = v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (PLExpandedPlatterDismissing)dismisser
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_dismisser);
  objc_super v4 = WeakRetained;
  if (!WeakRetained) {
    WeakRetained = self;
  }
  objc_super v5 = WeakRetained;

  return v5;
}

- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4
{
  id v6 = a3;
  if (!self->_dismissalReason)
  {
    id v11 = v6;
    if (a4 == 2) {
      id v7 = @"dismissalReasonHomeAction";
    }
    else {
      id v7 = 0;
    }
    double v8 = v7;
    if (a4 == 2)
    {
      dismissalReason = self->_dismissalReason;
      self->_dismissalReason = (NSString *)@"dismissalReasonHomeAction";

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained expandedPlatterViewController:self requestsDismissalWithReason:self->_dismissalReason userInfo:0];
      }
    }
    id v6 = v11;
  }
}

- (void)addExpandedPlatterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeExpandedPlatterObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, NCExpandedPlatterViewController *, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = (id)[(NSHashTable *)observers copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            id v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)expandedPlatterWillPresent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NCExpandedPlatterViewController *)self _canTransitionToPlatterPresentationState:1];
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      uint64_t v8 = v6;
      double v9 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
      uint64_t v10 = objc_msgSend(v9, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      long long v14 = v10;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Expanded platter will present for request %{public}@", buf, 0xCu);
    }
    self->_expandedPlatterPresentationState = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__NCExpandedPlatterViewController_expandedPlatterWillPresent___block_invoke;
    v11[3] = &unk_1E6A93BD8;
    id v12 = v4;
    [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v11];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatterWillPresent:]((uint64_t)self, v6);
  }
}

void __62__NCExpandedPlatterViewController_expandedPlatterWillPresent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 expandedPlatterWillPresent:*(void *)(a1 + 32)];
  }
}

- (void)expandedPlatterDidPresent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NCExpandedPlatterViewController *)self _canTransitionToPlatterPresentationState:2];
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      uint64_t v8 = v6;
      double v9 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
      uint64_t v10 = objc_msgSend(v9, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      long long v14 = v10;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Expanded platter did present for request %{public}@", buf, 0xCu);
    }
    self->_expandedPlatterPresentationState = 2;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__NCExpandedPlatterViewController_expandedPlatterDidPresent___block_invoke;
    v11[3] = &unk_1E6A93BD8;
    id v12 = v4;
    [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v11];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatterDidPresent:]((uint64_t)self, v6);
  }
}

void __61__NCExpandedPlatterViewController_expandedPlatterDidPresent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 expandedPlatterDidPresent:*(void *)(a1 + 32)];
  }
}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NCExpandedPlatterViewController *)self _canTransitionToPlatterPresentationState:3];
  double v9 = (void *)*MEMORY[0x1E4FB3750];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      id v11 = v9;
      id v12 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
      long long v13 = objc_msgSend(v12, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "Expanded platter will dismiss for request %{public}@ (reason: %{public}@)", buf, 0x16u);
    }
    self->_expandedPlatterPresentationState = 3;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__NCExpandedPlatterViewController_expandedPlatter_willDismissWithReason___block_invoke;
    v14[3] = &unk_1E6A93C00;
    id v15 = v6;
    id v16 = v7;
    [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v14];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatter:willDismissWithReason:]((uint64_t)self, v9);
  }
}

void __73__NCExpandedPlatterViewController_expandedPlatter_willDismissWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 expandedPlatter:*(void *)(a1 + 32) willDismissWithReason:*(void *)(a1 + 40)];
  }
}

- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NCExpandedPlatterViewController *)self _canTransitionToPlatterPresentationState:0];
  double v9 = (void *)*MEMORY[0x1E4FB3750];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      id v11 = v9;
      id v12 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
      long long v13 = objc_msgSend(v12, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "Expanded platter did dismiss for request %{public}@ (reason: %{public}@)", buf, 0x16u);
    }
    self->_expandedPlatterPresentationState = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__NCExpandedPlatterViewController_expandedPlatter_didDismissWithReason___block_invoke;
    v14[3] = &unk_1E6A93C00;
    id v15 = v6;
    id v16 = v7;
    [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v14];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
  {
    -[NCExpandedPlatterViewController expandedPlatter:didDismissWithReason:]((uint64_t)self, v9);
  }
}

void __72__NCExpandedPlatterViewController_expandedPlatter_didDismissWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 expandedPlatter:*(void *)(a1 + 32) didDismissWithReason:*(void *)(a1 + 40)];
  }
}

- (void)userInteractionWillBeginForExpandedPlatter:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    id v7 = v5;
    BOOL v8 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
    double v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    long long v14 = v9;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "User interaction will begin for expanded platter for request %{public}@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NCExpandedPlatterViewController_userInteractionWillBeginForExpandedPlatter___block_invoke;
  v11[3] = &unk_1E6A93BD8;
  id v12 = v4;
  id v10 = v4;
  [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v11];
}

void __78__NCExpandedPlatterViewController_userInteractionWillBeginForExpandedPlatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 userInteractionWillBeginForExpandedPlatter:*(void *)(a1 + 32)];
  }
}

- (void)userInteractionDidEndForExpandedPlatter:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    id v7 = v5;
    BOOL v8 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
    double v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    long long v14 = v9;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "User interaction did end for expanded platter for request %{public}@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__NCExpandedPlatterViewController_userInteractionDidEndForExpandedPlatter___block_invoke;
  v11[3] = &unk_1E6A93BD8;
  id v12 = v4;
  id v10 = v4;
  [(NCExpandedPlatterViewController *)self _notifyObserversWithBlock:v11];
}

void __75__NCExpandedPlatterViewController_userInteractionDidEndForExpandedPlatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 userInteractionDidEndForExpandedPlatter:*(void *)(a1 + 32)];
  }
}

- (void)expandedPlatterView:(id)a3 requestsInteractionWithURL:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  if (v8 == v6)
  {
    if (self->_dismissalReason)
    {
      char v9 = BSEqualStrings();

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    dismissalReason = self->_dismissalReason;
    self->_dismissalReason = (NSString *)@"dismissalReasonURL";

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v12 = self->_dismissalReason;
      long long v14 = @"NCExpandedPlatterObservableDismissalReasonUserInfoKeyURL";
      v15[0] = v7;
      long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [WeakRetained expandedPlatterViewController:self requestsDismissalWithReason:v12 userInfo:v13];
    }
  }
  else
  {
  }
LABEL_10:
}

- (BOOL)expandedPlatterView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([(NCNotificationCustomContent *)self->_customContentViewController userInteractionEnabled])
  {
    id v6 = [v5 view];
    id v7 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
    id v8 = [v7 customContentView];
    int v9 = [v6 isDescendantOfView:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)customContent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContent:v17 requestPermissionToExecuteAction:v12 forNotification:v13 withUserInfo:v14 completionHandler:v15];
  }
}

- (void)customContent:(id)a3 forwardAction:(id)a4 forNotification:(id)a5 withUserInfo:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContent:v14 forwardAction:v10 forNotification:v11 withUserInfo:v12];
  }
}

- (void)customContentRequestsDefaultAction:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContentRequestsDefaultAction:v5];
  }
}

- (void)customContentRequestsDismiss:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContentRequestsDismiss:v5];
  }
}

- (void)customContentDidLoadExtension:(id)a3
{
  if ([(NCExpandedPlatterViewController *)self bs_isAppearingOrAppeared])
  {
    id v5 = [(NCExpandedPlatterViewController *)self view];
    id v4 = [v5 window];
    [v4 makeKeyAndVisible];
  }
}

- (void)customContentDidUpdateTitle:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContentDidUpdateTitle:v5];
  }
}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained customContent:v8 didUpdateUserNotificationActions:v6];
  }
}

- (CGSize)_maximumPlatterSize
{
  v2 = [(NCExpandedPlatterViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 _referenceBounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.double width = v10;
    v19.size.double height = v12;
    CGRectGetWidth(v19);
    UICeilToScale();
    uint64_t v14 = v13;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.double width = v10;
    v20.size.double height = v12;
    CGRectGetHeight(v20);
    UICeilToScale();
    double v16 = v15;
  }
  else
  {
    double v16 = 1.79769313e308;
    *(double *)&uint64_t v14 = 556.0;
  }
  double v17 = *(double *)&v14;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (BOOL)_canTransitionToPlatterPresentationState:(int)a3
{
  switch(self->_expandedPlatterPresentationState)
  {
    case 0:
      BOOL v3 = a3 == 1;
      goto LABEL_5;
    case 1:
      BOOL v3 = (a3 & 0xFFFFFFFE) == 2;
LABEL_5:
      BOOL result = v3;
      break;
    case 2:
      BOOL result = 1;
      break;
    case 3:
      BOOL result = a3 < 2;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (id)_expandedPlatterViewLoadingIfNecessary:(BOOL)a3
{
  if (a3) {
    [(NCExpandedPlatterViewController *)self view];
  }
  else {
  BOOL v3 = [(NCExpandedPlatterViewController *)self viewIfLoaded];
  }

  return v3;
}

- (id)_expandedPlatterViewIfLoaded
{
  return [(NCExpandedPlatterViewController *)self _expandedPlatterViewLoadingIfNecessary:0];
}

- (id)_expandedPlatterView
{
  return [(NCExpandedPlatterViewController *)self _expandedPlatterViewLoadingIfNecessary:1];
}

- (CGSize)_preferredCustomContentSize
{
  v2 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  [v2 customContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  objc_msgSend(v5, "setCustomContentSize:", width, height);
}

- (void)_updatePreferredCustomContentSize
{
  double v3 = [(UIViewController *)self nc_presentationControllerIfPresented];
  id v11 = [v3 containerView];

  if (v11)
  {
    [v11 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    double v5 = v9;
    double v7 = v10;
  }
  -[NCExpandedPlatterViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_customContentViewController, v5, v7);
  -[NCExpandedPlatterViewController _setPreferredCustomContentSize:](self, "_setPreferredCustomContentSize:");
}

- (void)_updatePreferredContentSize
{
  double v3 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  if (v3)
  {
    [(NCExpandedPlatterViewController *)self _preferredCustomContentSize];
    double v5 = v4;
    double v7 = v6;
    [(NCExpandedPlatterViewController *)self _updatePreferredCustomContentSize];
    [v3 customContentSize];
    double v9 = v8;
    double v11 = v10;
    objc_msgSend(v3, "sizeThatFitsContentWithSize:");
    double v13 = v12;
    double v15 = v14;
    [(NCExpandedPlatterViewController *)self _maximumPlatterSize];
    if (v13 > v16) {
      double v13 = v16;
    }
    if (v15 > v17) {
      double v15 = v17;
    }
    [(NCExpandedPlatterViewController *)self preferredContentSize];
    BOOL v20 = v19 != v15 || v18 != v13;
    BOOL v21 = v7 != v11 || v5 != v9;
    if (v20 || v21)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__NCExpandedPlatterViewController__updatePreferredContentSize__block_invoke;
      aBlock[3] = &unk_1E6A93C28;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v13;
      *(double *)&aBlock[6] = v15;
      v22 = (void (**)(void *, void))_Block_copy(aBlock);
      if ([(NCExpandedPlatterViewController *)self _appearState] == 2)
      {
        v23 = objc_alloc_init(_NCExpandedPlatterViewControllerAnimator);
        id v24 = objc_alloc_init(MEMORY[0x1E4FB23E8]);
        v25 = [v3 customContentView];
        [v24 _setContainerView:v25];

        [v24 _setAnimator:v23];
        v26 = [v24 _transitionCoordinator];
        v27 = v26;
        if (v20) {
          [v26 animateAlongsideTransition:v22 completion:0];
        }
        if (v21) {
          -[NCNotificationCustomContent viewWillTransitionToSize:withTransitionCoordinator:](self->_customContentViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v27, v9, v11);
        }
        [(_NCExpandedPlatterViewControllerAnimator *)v23 animateTransition:v24];
      }
      else
      {
        v22[2](v22, 0);
      }
    }
  }
}

uint64_t __62__NCExpandedPlatterViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_updateScreenCaptureProhibited
{
  id v4 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  double v3 = [(NCNotificationRequest *)self->_notificationRequest options];
  objc_msgSend(v4, "setScreenCaptureProhibited:", objc_msgSend(v3, "screenCaptureProhibited"));
}

- (void)_updateWithProvidedStaticContent
{
  double v3 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  if (v3)
  {
    id v21 = v3;
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider badgedIconView];
      [v4 setShadowEnabled:1];
      [v21 setBadgedIconView:v4];
    }
    double v5 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider date];
    [v21 setDate:v5];

    objc_msgSend(v21, "setDateAllDay:", -[NCNotificationStaticContentProviding isDateAllDay](self->_staticContentProvider, "isDateAllDay"));
    double v6 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider timeZone];
    [v21 setTimeZone:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [WeakRetained expandedPlatterViewController:self dateFormatStyleForNotificationRequest:self->_notificationRequest];
    }
    else {
      uint64_t v8 = 1;
    }
    [v21 setDateFormatStyle:v8];
    double v9 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primaryText];
    [v21 setPrimaryText:v9];

    double v10 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider primarySubtitleText];
    [v21 setPrimarySubtitleText:v10];

    double v11 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider secondaryText];
    [v21 setSecondaryText:v11];

    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v12 = [WeakRetained importantAdornmentEligibleOptionsForNotificationViewController:self];
    }
    else {
      uint64_t v12 = -1;
    }
    staticContentProvider = self->_staticContentProvider;
    double v14 = [v21 importantTextImageConfiguration];
    double v15 = [(NCNotificationStaticContentProviding *)staticContentProvider importantAttributedTextWithImageConfiguration:v14 importantAdornmentEligibleOptions:v12];

    if ([v15 length])
    {
      [v21 setImportantAttributedText:v15];
    }
    else
    {
      double v16 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider importantText];
      [v21 setImportantText:v16];
    }
    double v17 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider importantTextVisualStylingProvider];
    [v21 setImportantTextVisualStylingProvider:v17];

    double v18 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider footerText];
    [v21 setFooterText:v18];

    if (objc_opt_respondsToSelector())
    {
      double v19 = [(NCNotificationStaticContentProviding *)self->_staticContentProvider thumbnail];
      [v21 setThumbnail:v19];
    }
    BOOL v20 = [v21 defaultTapGestureRecognizer];
    [v20 addTarget:self action:sel__handleDefaultTap_];

    double v3 = v21;
  }
}

- (void)_setupStaticContentProviderIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 1016);
  double v3 = a2;
  id v4 = [v2 notificationIdentifier];
  double v5 = objc_msgSend(v4, "un_logDigest");
  int v6 = 138543362;
  double v7 = v5;
  _os_log_debug_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEBUG, "Delegate failed to provide static content provider for expanded platter with notification request %{public}@ – instantiating default", (uint8_t *)&v6, 0xCu);
}

- (void)_setCustomContentViewController:(id)a3
{
  double v5 = (NCNotificationCustomContent *)a3;
  p_customContentViewController = &self->_customContentViewController;
  customContentViewController = self->_customContentViewController;
  uint64_t v8 = v5;
  if (customContentViewController != v5)
  {
    [(NCNotificationCustomContent *)customContentViewController willMoveToParentViewController:0];
    [(NCNotificationCustomContent *)*p_customContentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_customContentViewController, a3);
    if (*p_customContentViewController)
    {
      [(NCNotificationCustomContent *)*p_customContentViewController setDelegate:self];
      [(NCExpandedPlatterViewController *)self addChildViewController:*p_customContentViewController];
      [(NCNotificationCustomContent *)*p_customContentViewController didMoveToParentViewController:self];
    }
  }
}

- (void)_updateWithProvidedCustomContent
{
  double v3 = [(NCExpandedPlatterViewController *)self _expandedPlatterViewIfLoaded];
  if (v3)
  {
    id v7 = v3;
    [(NCExpandedPlatterViewController *)self _updatePreferredCustomContentSize];
    id v4 = [(NCNotificationCustomContent *)self->_customContentViewController view];
    double v5 = [v7 customContentView];
    objc_msgSend(v7, "setHidesNotificationContent:", -[NCNotificationCustomContent defaultContentHidden](self->_customContentViewController, "defaultContentHidden"));
    int v6 = [v4 superview];

    if (v6 != v5)
    {
      [v5 addSubview:v4];
      [v5 bounds];
      objc_msgSend(v4, "setFrame:");
      [v4 setAutoresizingMask:18];
    }

    double v3 = v7;
  }
}

- (void)_handleDefaultTap:(id)a3
{
  if ([a3 state] == 3 && !self->_dismissalReason)
  {
    self->_dismissalReason = (NSString *)@"dismissalReasonDefaultTap";

    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__NCExpandedPlatterViewController__handleDefaultTap___block_invoke;
    v4[3] = &unk_1E6A919A0;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __53__NCExpandedPlatterViewController__handleDefaultTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (BSEqualStrings())
    {
      v2 = [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        [v2 expandedPlatterViewController:v4 requestsDismissalWithReason:v4[124] userInfo:0];
      }
    }
  }

  return MEMORY[0x1F4181820]();
}

- (void)setDismisser:(id)a3
{
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (NCNotificationCustomContent)customContentViewController
{
  return self->_customContentViewController;
}

- (NCExpandedPlatterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCExpandedPlatterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)_pendingPresentationTransitionDidEndBlock
{
  return self->_pendingPresentationTransitionDidEndBlock;
}

- (void)_setPendingPresentationTransitionDidEndBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingPresentationTransitionDidEndBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customContentViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_destroyWeak((id *)&self->_dismisser);
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_staticContentProvider, 0);
}

- (void)expandedPlatterWillPresent:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = OUTLINED_FUNCTION_1();
  id v5 = NCStringForAppearState(v4);
  int v6 = NCStringForAppearState(1u);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D7C04000, v7, v8, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v9, v10, v11, v12, v13);
}

- (void)expandedPlatterDidPresent:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = OUTLINED_FUNCTION_1();
  id v5 = NCStringForAppearState(v4);
  int v6 = NCStringForAppearState(2u);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D7C04000, v7, v8, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v9, v10, v11, v12, v13);
}

- (void)expandedPlatter:(uint64_t)a1 willDismissWithReason:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = OUTLINED_FUNCTION_1();
  id v5 = NCStringForAppearState(v4);
  int v6 = NCStringForAppearState(3u);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D7C04000, v7, v8, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v9, v10, v11, v12, v13);
}

- (void)expandedPlatter:(uint64_t)a1 didDismissWithReason:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = OUTLINED_FUNCTION_1();
  id v5 = NCStringForAppearState(v4);
  int v6 = NCStringForAppearState(0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D7C04000, v7, v8, "%{public}@: Illegal transition attempted from '%{public}@' to '%{public}@' – aborting", v9, v10, v11, v12, v13);
}

@end