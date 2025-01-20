@interface PKPaymentAuthorizationRemoteAlertViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (PKPaymentAuthorizationPresentersCoordinator)presentersCoordinator;
- (id)initializePresentersCoordinatorWithUserInfo:(id)a3;
- (int)_preferredStatusBarVisibility;
- (unint64_t)supportedInterfaceOrientations;
- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5;
- (void)configureAnalyticsWithUserInfo:(id)a3;
- (void)configureAppearance;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)configureWithUserInfo:(id)a3 dismissalHandler:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)didInvalidateForRemoteAlert;
- (void)handleButtonActions:(id)a3;
- (void)noteActivatedWithPresentationMode:(int64_t)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentersCoordinatorDidInvalidate;
- (void)setBlocksInput;
- (void)updateStatusBarVisibility;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentAuthorizationRemoteAlertViewController

- (void)dealloc
{
  [(PKPaymentAuthorizationPresentersCoordinator *)self->_presentersCoordinator viewControllerDidInvalidate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(PKPaymentAuthorizationRemoteAlertViewController *)&v5 viewDidLoad];
  objc_super v3 = [(PKPaymentAuthorizationRemoteAlertViewController *)self view];
  v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:self->_blocksInput];
}

- (void)setBlocksInput
{
  self->_blocksInput = 1;
  id v4 = [(PKPaymentAuthorizationRemoteAlertViewController *)self viewIfLoaded];
  objc_super v3 = [v4 layer];
  [v3 setHitTestsAsOpaque:self->_blocksInput];
}

- (void)presentersCoordinatorDidInvalidate
{
  id v4 = [(PKPaymentAuthorizationRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v4 invalidate];
  [(PKPaymentAuthorizationRemoteAlertViewController *)self dismissViewControllerAnimated:0 completion:0];
  presentersCoordinator = self->_presentersCoordinator;
  self->_presentersCoordinator = 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [(PKPaymentAuthorizationRemoteAlertViewController *)self presentedViewController];
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
    -[PKPaymentAuthorizationRemoteAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v16, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
  }
  double v12 = v10;
  double v13 = v11;

  double v14 = v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(PKPaymentAuthorizationRemoteAlertViewController *)&v4 viewWillAppear:a3];
  [(PKPaymentAuthorizationPresentersCoordinator *)self->_presentersCoordinator viewControllerWillAppear:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(PKPaymentAuthorizationRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPaymentAuthorizationPresentersCoordinator *)self->_presentersCoordinator viewControllerWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(PKPaymentAuthorizationRemoteAlertViewController *)&v4 viewDidDisappear:a3];
  if ([(NSString *)self->_analyticsSubject length]) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:self->_analyticsSubject];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  id v10 = a4;
  v8 = (void (**)(void))a5;
  presentersCoordinator = self->_presentersCoordinator;
  if (presentersCoordinator)
  {
    [(PKPaymentAuthorizationPresentersCoordinator *)presentersCoordinator askForDismissalWithReason:a3 error:v10 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)didInvalidateForRemoteAlert
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 didInvalidateForRemoteAlert];
  [(PKPaymentAuthorizationPresentersCoordinator *)self->_presentersCoordinator viewControllerDidInvalidate:self];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 userInfo];
  [(PKPaymentAuthorizationRemoteAlertViewController *)self configureWithUserInfo:v7 dismissalHandler:0 completion:v6];
}

- (void)configureWithUserInfo:(id)a3 dismissalHandler:(id)a4 completion:(id)a5
{
  id v12 = a4;
  v8 = (void (**)(void))a5;
  id v9 = a3;
  [(PKPaymentAuthorizationRemoteAlertViewController *)self configureAppearance];
  [(PKPaymentAuthorizationRemoteAlertViewController *)self configureAnalyticsWithUserInfo:v9];
  id v10 = [(PKPaymentAuthorizationRemoteAlertViewController *)self initializePresentersCoordinatorWithUserInfo:v9];

  presentersCoordinator = self->_presentersCoordinator;
  self->_presentersCoordinator = v10;

  if (v12) {
    [(PKPaymentAuthorizationPresentersCoordinator *)self->_presentersCoordinator notifyOnInvalidated:v12];
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)configureAppearance
{
  id v2 = [(PKPaymentAuthorizationRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v2 setAllowsBanners:1];
  [v2 setAllowsSiri:0];
  [v2 setAllowsAlertItems:1];
  [v2 setLaunchingInterfaceOrientation:PKUserInterfaceIdiomSupportsLargeLayouts() ^ 1];
  if (PKUserInterfaceIdiomSupportsLargeLayouts() && (PKUserIntentIsAvailable() & 1) == 0) {
    [v2 setOrientationChangedEventsEnabled:0];
  }
  [v2 setDesiredHardwareButtonEvents:16];
  [v2 setSwipeDismissalStyle:0];
  [v2 setDismissalAnimationStyle:1];
  [v2 setWallpaperStyle:1 withDuration:0.0];
}

- (void)configureAnalyticsWithUserInfo:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 objectForKey:*MEMORY[0x1E4F878D8]];
  analyticsSubject = self->_analyticsSubject;
  self->_analyticsSubject = v4;

  NSUInteger v6 = [(NSString *)self->_analyticsSubject length];
  id v7 = v10;
  if (v6)
  {
    v8 = [v10 objectForKey:*MEMORY[0x1E4F878D0]];
    id v9 = self->_analyticsSubject;
    if (v8) {
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v9 withArchivedParent:v8];
    }
    else {
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v9];
    }

    id v7 = v10;
  }
}

- (id)initializePresentersCoordinatorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[PKPaymentAuthorizationPresentersCoordinator coordinatorForHostWithUserInfo:v4];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentAuthorizationRemoteAlertViewController_initializePresentersCoordinatorWithUserInfo___block_invoke;
  v7[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, &location);
  [v5 notifyOnInvalidated:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __95__PKPaymentAuthorizationRemoteAlertViewController_initializePresentersCoordinatorWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentersCoordinatorDidInvalidate];
}

- (void)noteActivatedWithPresentationMode:(int64_t)a3
{
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  id v2 = [(PKPaymentAuthorizationRemoteAlertViewController *)self presentedViewController];
  objc_super v3 = v2;
  if (v2) {
    int v4 = [v2 _preferredStatusBarVisibility];
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  [(PKPaymentAuthorizationRemoteAlertViewController *)&v6 presentViewController:a3 animated:a4 completion:a5];
  [(PKPaymentAuthorizationRemoteAlertViewController *)self updateStatusBarVisibility];
}

- (void)updateStatusBarVisibility
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__PKPaymentAuthorizationRemoteAlertViewController_updateStatusBarVisibility__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.0];
}

uint64_t __76__PKPaymentAuthorizationRemoteAlertViewController_updateStatusBarVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentAuthorizationRemoteAlertViewController_handleButtonActions___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__PKPaymentAuthorizationRemoteAlertViewController_handleButtonActions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "handleHomeButtonPressedInViewController:") & 1) == 0)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "sendResponseWithUnHandledEvents:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "events", (void)v7));
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (PKPaymentAuthorizationPresentersCoordinator)presentersCoordinator
{
  return self->_presentersCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentersCoordinator, 0);

  objc_storeStrong((id *)&self->_analyticsSubject, 0);
}

@end