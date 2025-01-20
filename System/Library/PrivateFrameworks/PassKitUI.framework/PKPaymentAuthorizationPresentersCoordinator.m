@interface PKPaymentAuthorizationPresentersCoordinator
+ (id)coordinatorForHostWithUserInfo:(id)a3;
+ (id)coordinators;
+ (void)coordinatorDidInvalidate:(id)a3;
+ (void)invalidateCoordinators:(id)a3;
- (BOOL)handleHomeButtonPressedInViewController:(id)a3;
- (BOOL)isPresentationModeForPrimaryViewController:(int64_t)a3;
- (BOOL)shouldRequestSecondaryViewControllerPresenter;
- (BOOL)shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:(int64_t)a3;
- (BOOL)supportsSecondaryViewController;
- (NSDictionary)hostUserInfo;
- (PKAsyncTaskProgressTracker)invalidationTracker;
- (PKPaymentAuthorizationFlowCoordinator)flowCoordinator;
- (PKPaymentAuthorizationPresentationTarget)primaryTarget;
- (PKPaymentAuthorizationPresentationTarget)secondaryTarget;
- (PKPaymentAuthorizationPresentersCoordinator)initWithHostUserInfo:(id)a3;
- (SBSRemoteAlertHandle)secondaryTargetAlertHandle;
- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5;
- (void)configureSceneWithPrimaryPresentationMode:(int64_t)a3;
- (void)dealloc;
- (void)dismissSceneAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)flowCoordinatorDidInvalidate;
- (void)invalidate;
- (void)invalidateSecondaryAlert;
- (void)notifyOnInvalidated:(id)a3;
- (void)presentPrimaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)primaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4;
- (void)requestSecondaryViewControllerPresenterIfNecessary;
- (void)secondaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4;
- (void)setFlowCoordinator:(id)a3;
- (void)setHostUserInfo:(id)a3;
- (void)setInvalidationTracker:(id)a3;
- (void)setPrimaryTarget:(id)a3;
- (void)setSecondaryTarget:(id)a3;
- (void)setSecondaryTargetAlertHandle:(id)a3;
- (void)setShouldRequestSecondaryViewControllerPresenter:(BOOL)a3;
- (void)start;
- (void)viewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4;
- (void)viewControllerDidInvalidate:(id)a3;
- (void)viewControllerWillAppear:(id)a3;
- (void)viewControllerWillDisappear:(id)a3;
@end

@implementation PKPaymentAuthorizationPresentersCoordinator

+ (id)coordinators
{
  if (_MergedGlobals_694 != -1) {
    dispatch_once(&_MergedGlobals_694, &__block_literal_global_236);
  }
  v2 = (void *)qword_1EB545D60;

  return v2;
}

void __59__PKPaymentAuthorizationPresentersCoordinator_coordinators__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB545D60;
  qword_1EB545D60 = (uint64_t)v0;
}

+ (id)coordinatorForHostWithUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"hostIdentifier"];
  v6 = [a1 coordinators];
  v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    if ([v6 count])
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: stale coordinators when creating a new one - invalidating them.", v10, 2u);
      }

      [a1 invalidateCoordinators:v6];
    }
    v7 = [[PKPaymentAuthorizationPresentersCoordinator alloc] initWithHostUserInfo:v4];
    [v6 setObject:v7 forKey:v5];
  }

  return v7;
}

+ (void)invalidateCoordinators:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)[a3 copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)coordinatorDidInvalidate:(id)a3
{
  uint64_t v4 = [a3 hostUserInfo];
  id v6 = [v4 objectForKey:@"hostIdentifier"];

  uint64_t v5 = [a1 coordinators];
  [v5 removeObjectForKey:v6];
}

- (PKPaymentAuthorizationPresentersCoordinator)initWithHostUserInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationPresentersCoordinator;
  uint64_t v5 = [(PKPaymentAuthorizationPresentersCoordinator *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hostUserInfo = v5->_hostUserInfo;
    v5->_hostUserInfo = (NSDictionary *)v6;

    v8 = (PKAsyncTaskProgressTracker *)objc_alloc_init(MEMORY[0x1E4F84510]);
    invalidationTracker = v5->_invalidationTracker;
    v5->_invalidationTracker = v8;
  }
  return v5;
}

- (void)dealloc
{
  [(PKPaymentAuthorizationPresentersCoordinator *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationPresentersCoordinator;
  [(PKPaymentAuthorizationPresentersCoordinator *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)flowCoordinatorDidInvalidate
{
  flowCoordinator = self->_flowCoordinator;
  self->_flowCoordinator = 0;

  [(PKAsyncTaskProgressTracker *)self->_invalidationTracker taskDidComplete];

  +[PKPaymentAuthorizationPresentersCoordinator coordinatorDidInvalidate:self];
}

- (void)viewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v6 = a3;
  if ([(PKPaymentAuthorizationPresentersCoordinator *)self isPresentationModeForPrimaryViewController:a4])
  {
    [(PKPaymentAuthorizationPresentersCoordinator *)self primaryViewController:v6 didActivateWithPresentationMode:a4];
  }
  else
  {
    [(PKPaymentAuthorizationPresentersCoordinator *)self secondaryViewController:v6 didActivateWithPresentationMode:a4];
  }
}

- (BOOL)isPresentationModeForPrimaryViewController:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  return self->_primaryTarget == 0;
}

- (void)primaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v6 = a3;
  if (self->_primaryTarget)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: primary view controller was activated twice - something's off.", v10, 2u);
    }
  }
  else
  {
    v8 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
    primaryTarget = self->_primaryTarget;
    self->_primaryTarget = v8;

    [(PKPaymentAuthorizationPresentationTarget *)self->_primaryTarget setPresentingViewController:v6];
    [(PKPaymentAuthorizationPresentationTarget *)self->_primaryTarget presentPendingViewControllerIfNecessary];
    [(PKPaymentAuthorizationPresentersCoordinator *)self configureSceneWithPrimaryPresentationMode:a4];
    [(PKPaymentAuthorizationPresentersCoordinator *)self start];
  }
}

- (void)configureSceneWithPrimaryPresentationMode:(int64_t)a3
{
  self->_shouldRequestSecondaryViewControllerPresenter = [(PKPaymentAuthorizationPresentersCoordinator *)self shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:a3];
}

- (BOOL)shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)secondaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(PKPaymentAuthorizationPresentationTarget *)self->_secondaryTarget presentingViewController];

  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: secondary view controller was activated twice - something's off.", v11, 2u);
    }
  }
  else
  {
    secondaryTarget = self->_secondaryTarget;
    if (!secondaryTarget)
    {
      long long v9 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
      long long v10 = self->_secondaryTarget;
      self->_secondaryTarget = v9;

      secondaryTarget = self->_secondaryTarget;
    }
    [(PKPaymentAuthorizationPresentationTarget *)secondaryTarget setPresentingViewController:v5];
    [(PKPaymentAuthorizationPresentationTarget *)self->_secondaryTarget presentPendingViewControllerIfNecessary];
  }
}

- (void)start
{
  id v5 = [[PKPaymentAuthorizationContext alloc] initWithUserInfo:self->_hostUserInfo];
  objc_super v3 = [[PKPaymentAuthorizationFlowCoordinator alloc] initWithContext:v5 scenePresenter:self delegate:self];
  flowCoordinator = self->_flowCoordinator;
  self->_flowCoordinator = v3;

  [(PKPaymentAuthorizationFlowCoordinator *)self->_flowCoordinator start];
}

- (void)requestSecondaryViewControllerPresenterIfNecessary
{
  if (self->_shouldRequestSecondaryViewControllerPresenter && !self->_secondaryTargetAlertHandle)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA6BB0]);
    uint64_t v4 = *MEMORY[0x1E4F878E8];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v11 = (id)[v3 initWithServiceName:v4 viewControllerClassName:v6];

    [v11 setPrefersEmbeddedDisplayPresentation:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    [v7 setUserInfo:self->_hostUserInfo];
    id v8 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    [v8 setActivatingForSiri:1];
    [v8 setShouldStashPictureInPictureIfNeeded:1];
    long long v9 = (SBSRemoteAlertHandle *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v11 configurationContext:v7];
    secondaryTargetAlertHandle = self->_secondaryTargetAlertHandle;
    self->_secondaryTargetAlertHandle = v9;

    [(SBSRemoteAlertHandle *)self->_secondaryTargetAlertHandle registerObserver:self];
    [(SBSRemoteAlertHandle *)self->_secondaryTargetAlertHandle activateWithContext:v8];
  }
}

- (void)invalidateSecondaryAlert
{
  [(SBSRemoteAlertHandle *)self->_secondaryTargetAlertHandle invalidate];
  secondaryTargetAlertHandle = self->_secondaryTargetAlertHandle;
  self->_secondaryTargetAlertHandle = 0;
}

- (void)viewControllerDidInvalidate:(id)a3
{
  primaryTarget = self->_primaryTarget;
  id v5 = a3;
  id v6 = [(PKPaymentAuthorizationPresentationTarget *)primaryTarget presentingViewController];

  if (v6 == v5)
  {
    [(PKPaymentAuthorizationPresentersCoordinator *)self invalidate];
  }
}

- (void)notifyOnInvalidated:(id)a3
{
}

- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v8 = (void (**)(void))a5;
  flowCoordinator = self->_flowCoordinator;
  if (flowCoordinator)
  {
    [(PKPaymentAuthorizationFlowCoordinator *)flowCoordinator dismissWithReason:a3 error:v10 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)presentPrimaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)supportsSecondaryViewController
{
  v2 = [(PKPaymentAuthorizationPresentationTarget *)self->_primaryTarget presentingViewController];
  id v3 = [v2 _screen];
  uint64_t v4 = [v3 displayIdentity];
  char v5 = [v4 isMainDisplay];

  return v5 ^ 1;
}

- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(PKPaymentAuthorizationPresentersCoordinator *)self supportsSecondaryViewController])
  {
    if (!self->_secondaryTarget)
    {
      id v10 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
      secondaryTarget = self->_secondaryTarget;
      self->_secondaryTarget = v10;
    }
    [(PKPaymentAuthorizationPresentersCoordinator *)self requestSecondaryViewControllerPresenterIfNecessary];
    [(PKPaymentAuthorizationPresentationTarget *)self->_secondaryTarget presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    long long v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: secondary view controller requested but the current scene doesn't support it.", v13, 2u);
    }
  }
}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __97__PKPaymentAuthorizationPresentersCoordinator_dismissSecondaryViewControllerAnimated_completion___block_invoke;
  v13 = &unk_1E59CAD68;
  id v7 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v8 = (void (**)(void))_Block_copy(&v10);
  secondaryTarget = self->_secondaryTarget;
  if (secondaryTarget) {
    -[PKPaymentAuthorizationPresentationTarget dismissViewControllerAnimated:completion:](secondaryTarget, "dismissViewControllerAnimated:completion:", v4, v8, v10, v11, v12, v13);
  }
  else {
    v8[2](v8);
  }
}

uint64_t __97__PKPaymentAuthorizationPresentersCoordinator_dismissSecondaryViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidateSecondaryAlert];
}

- (void)dismissSceneAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  primaryTarget = self->_primaryTarget;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke;
  v13[3] = &unk_1E59CA7D0;
  id v9 = v7;
  uint64_t v14 = v9;
  [(PKPaymentAuthorizationPresentationTarget *)primaryTarget dismissViewControllerAnimated:v4 completion:v13];
  if (self->_secondaryTarget)
  {
    dispatch_group_enter(v9);
    secondaryTarget = self->_secondaryTarget;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E59CA7D0;
    long long v12 = v9;
    [(PKPaymentAuthorizationPresentationTarget *)secondaryTarget dismissViewControllerAnimated:v4 completion:v11];
  }
  if (v6) {
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v6);
  }
}

void __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke(uint64_t a1)
{
}

void __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke_2(uint64_t a1)
{
}

- (void)viewControllerWillAppear:(id)a3
{
  primaryTarget = self->_primaryTarget;
  id v5 = a3;
  id v6 = [(PKPaymentAuthorizationPresentationTarget *)primaryTarget presentingViewController];

  if (v6 == v5)
  {
    flowCoordinator = self->_flowCoordinator;
    [(PKPaymentAuthorizationFlowCoordinator *)flowCoordinator willAppear];
  }
}

- (void)viewControllerWillDisappear:(id)a3
{
  primaryTarget = self->_primaryTarget;
  id v5 = a3;
  id v6 = [(PKPaymentAuthorizationPresentationTarget *)primaryTarget presentingViewController];

  if (v6 == v5)
  {
    flowCoordinator = self->_flowCoordinator;
    [(PKPaymentAuthorizationFlowCoordinator *)flowCoordinator willDisappear];
  }
}

- (BOOL)handleHomeButtonPressedInViewController:(id)a3
{
  return [(PKPaymentAuthorizationFlowCoordinator *)self->_flowCoordinator handleHomeButtonPressed];
}

- (NSDictionary)hostUserInfo
{
  return self->_hostUserInfo;
}

- (void)setHostUserInfo:(id)a3
{
}

- (PKPaymentAuthorizationPresentationTarget)primaryTarget
{
  return self->_primaryTarget;
}

- (void)setPrimaryTarget:(id)a3
{
}

- (PKPaymentAuthorizationPresentationTarget)secondaryTarget
{
  return self->_secondaryTarget;
}

- (void)setSecondaryTarget:(id)a3
{
}

- (SBSRemoteAlertHandle)secondaryTargetAlertHandle
{
  return self->_secondaryTargetAlertHandle;
}

- (void)setSecondaryTargetAlertHandle:(id)a3
{
}

- (PKPaymentAuthorizationFlowCoordinator)flowCoordinator
{
  return self->_flowCoordinator;
}

- (void)setFlowCoordinator:(id)a3
{
}

- (PKAsyncTaskProgressTracker)invalidationTracker
{
  return self->_invalidationTracker;
}

- (void)setInvalidationTracker:(id)a3
{
}

- (BOOL)shouldRequestSecondaryViewControllerPresenter
{
  return self->_shouldRequestSecondaryViewControllerPresenter;
}

- (void)setShouldRequestSecondaryViewControllerPresenter:(BOOL)a3
{
  self->_shouldRequestSecondaryViewControllerPresenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTracker, 0);
  objc_storeStrong((id *)&self->_flowCoordinator, 0);
  objc_storeStrong((id *)&self->_secondaryTargetAlertHandle, 0);
  objc_storeStrong((id *)&self->_secondaryTarget, 0);
  objc_storeStrong((id *)&self->_primaryTarget, 0);

  objc_storeStrong((id *)&self->_hostUserInfo, 0);
}

@end