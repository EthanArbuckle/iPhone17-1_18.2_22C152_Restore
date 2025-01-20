@interface SBElasticHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)definesAnimatedDismissal;
- (BOOL)elasticValueViewControllerCanBePresented:(id)a3 withReason:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHUDAttached;
- (NSArray)physicalButtonSceneTargets;
- (SBElasticHUDViewController)initWithElasticValueContentViewController:(id)a3;
- (SBElasticHUDViewController)initWithFactory:(id)a3;
- (SBElasticHUDViewControllerDelegate)delegate;
- (SBElasticValueViewController)elasticValueViewController;
- (SBHUDAttachmentDelegate)attachmentDelegate;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (int64_t)triggerButton;
- (unint64_t)attachmentIgnoredOrientations;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissAnimatedWithCompletion:(id)a3;
- (void)elasticValueViewControllerNeedsDismissal:(id)a3;
- (void)noteValueDidChange:(float)a3;
- (void)reloadData;
- (void)setAttachmentDelegate:(id)a3;
- (void)setButtonStepCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPositionOffset:(CGPoint)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBElasticHUDViewController

- (SBElasticHUDViewController)initWithFactory:(id)a3
{
  v4 = [a3 elasticValueViewController];
  v5 = [(SBElasticHUDViewController *)self initWithElasticValueContentViewController:v4];

  return v5;
}

- (SBElasticHUDViewController)initWithElasticValueContentViewController:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBElasticHUDViewController;
  v6 = [(SBElasticHUDViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    [(SBElasticHUDViewController *)v6 setTransitioningDelegate:v6];
    objc_storeStrong((id *)&v7->_elasticValueViewController, a3);
    [(SBElasticValueViewController *)v7->_elasticValueViewController setDelegate:v7];
    uint64_t v8 = objc_opt_class();
    v9 = +[SBCoverSheetPresentationManager sharedInstance];
    v10 = [v9 coverSheetSlidingViewController];
    v11 = SBSafeCast(v8, v10);

    v12 = [v11 edgePullGestureRecognizer];
    if (v12) {
      [(SBElasticValueViewController *)v7->_elasticValueViewController setupFailureRelationshipForGestureRecognizer:v12];
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController supportedInterfaceOrientations];
}

- (void)setButtonStepCount:(unint64_t)a3
{
}

- (void)noteValueDidChange:(float)a3
{
}

- (void)reloadData
{
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBElasticHUDViewController;
  [(SBElasticHUDViewController *)&v8 viewDidLoad];
  elasticValueViewController = self->_elasticValueViewController;
  v4 = [(SBElasticHUDViewController *)self view];
  [(SBElasticHUDViewController *)self bs_addChildViewController:elasticValueViewController withSuperview:v4];

  id v5 = [(SBElasticValueViewController *)self->_elasticValueViewController view];
  v6 = [(SBElasticHUDViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  v7 = [(SBElasticValueViewController *)self->_elasticValueViewController view];
  [v7 setAutoresizingMask:18];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBElasticHUDViewController;
  [(SBElasticHUDViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(SBElasticValueViewController *)self->_elasticValueViewController view];
  v4 = [(SBElasticHUDViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  objc_super v5 = objc_alloc_init(_SBElasticHUDViewControllerNullAnimator);
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  v3 = objc_alloc_init(_SBElasticHUDViewControllerNullAnimator);
  return v3;
}

- (NSArray)physicalButtonSceneTargets
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController physicalButtonSceneTargets];
}

- (BOOL)definesAnimatedDismissal
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController definesAnimatedDismissal];
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
}

- (void)setPositionOffset:(CGPoint)a3
{
}

- (int64_t)triggerButton
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController triggerButton];
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController attachmentDelegate];
}

- (void)setAttachmentDelegate:(id)a3
{
}

- (unint64_t)attachmentIgnoredOrientations
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController attachmentIgnoredOrientations];
}

- (BOOL)isHUDAttached
{
  return [(SBElasticValueViewController *)self->_elasticValueViewController isHUDAttached];
}

- (BOOL)elasticValueViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  v6 = [(SBElasticHUDViewController *)self delegate];
  LOBYTE(a4) = [v6 elasticHUDViewControllerCanBePresented:self withReason:a4];

  return (char)a4;
}

- (void)elasticValueViewControllerNeedsDismissal:(id)a3
{
  id v4 = [(SBElasticHUDViewController *)self delegate];
  [v4 elasticHUDViewControllerRequestsDismissal:self];
}

- (SBElasticHUDViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBElasticHUDViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBElasticValueViewController)elasticValueViewController
{
  return self->_elasticValueViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticValueViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end