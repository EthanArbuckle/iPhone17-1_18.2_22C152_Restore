@interface VTUIEnrollmentSetupIntroViewControllerGM
- (BOOL)isLaterButtonAvailable;
- (BOOL)isSuccessViewReady;
- (BOOL)shouldCleanupForEnrollment;
- (UIViewController)introViewController;
- (VTUIEnrollmentSetupIntroViewControllerGM)initWithDelegate:(id)a3;
- (VTUIEnrollmentSetupIntroViewControllerGM)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)buddyFlowViewWrapper;
- (void)_animateVisibility:(BOOL)a3;
- (void)didEnterBackground;
- (void)enrollmentWillAppear;
- (void)fadeIn;
- (void)loadView;
- (void)setBuddyFlowViewWrapper:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIntroViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VTUIEnrollmentSetupIntroViewControllerGM

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  [(VTUIEnrollmentSetupIntroViewControllerGM *)&v23 viewDidLoad];
  v3 = +[VTUIStyle sharedStyle];
  char v4 = [v3 isIpad];

  if ((v4 & 1) == 0) {
    [(VTUIEnrollmentSetupIntroViewControllerGM *)self setOverrideUserInterfaceStyle:2];
  }
  v5 = (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *)objc_opt_new();
  buddyFlowViewWrapper = self->_buddyFlowViewWrapper;
  self->_buddyFlowViewWrapper = v5;

  v7 = self->_buddyFlowViewWrapper;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [(GMEnrollmentSetupIntroViewManager *)v7 createViewControllerWithIntroViewControllerDelegate:WeakRetained];
  introViewController = self->_introViewController;
  self->_introViewController = v9;

  [(VTUIEnrollmentSetupIntroViewControllerGM *)self addChildViewController:self->_introViewController];
  v11 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self navigationController];
  v12 = [v11 navigationBar];
  [v12 frame];
  double v14 = v13;

  v15 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;

  v20 = [(UIViewController *)self->_introViewController view];
  objc_msgSend(v20, "setFrame:", 0.0, -v14, v17, v14 + v19);

  v21 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self view];
  v22 = [(UIViewController *)self->_introViewController view];
  [v21 addSubview:v22];

  [(UIViewController *)self->_introViewController didMoveToParentViewController:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  [(VTUIEnrollmentSetupIntroViewControllerGM *)&v6 viewDidDisappear:a3];
  [(UIViewController *)self->_introViewController willMoveToParentViewController:0];
  char v4 = [(UIViewController *)self->_introViewController view];
  [v4 removeFromSuperview];

  [(UIViewController *)self->_introViewController removeFromParentViewController];
  introViewController = self->_introViewController;
  self->_introViewController = 0;
}

- (void)loadView
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  [(VTUIEnrollmentSetupIntroViewControllerGM *)self setView:v3];
}

- (VTUIEnrollmentSetupIntroViewControllerGM)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  v5 = [(VTUIEnrollmentSetupIntroViewControllerGM *)&v8 init];
  objc_super v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)isLaterButtonAvailable
{
  return 1;
}

- (BOOL)shouldCleanupForEnrollment
{
  return 0;
}

- (void)enrollmentWillAppear
{
}

- (void)didEnterBackground
{
  [(GMEnrollmentSetupIntroViewManager *)self->_buddyFlowViewWrapper resetIfInTraining];
  id v3 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self view];
  [v3 setHidden:0];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self view];
  [v4 setHidden:v3];
}

- (void)fadeIn
{
  [(VTUIEnrollmentSetupIntroViewControllerGM *)self _animateVisibility:1];
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__VTUIEnrollmentSetupIntroViewControllerGM_fadeIn__block_invoke;
  block[3] = &unk_264D4C280;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __50__VTUIEnrollmentSetupIntroViewControllerGM_fadeIn__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) buddyFlowViewWrapper];
  [v1 proceedToReady];
}

- (BOOL)isSuccessViewReady
{
  return 1;
}

- (VTUIEnrollmentSetupIntroViewControllerGM)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerGM;
  v10 = [(VTUIEnrollmentSetupIntroViewControllerGM *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.CGFloat x = x;
    v10->_frame.origin.CGFloat y = y;
    v10->_frame.size.CGFloat width = width;
    v10->_frame.size.CGFloat height = height;
    objc_storeWeak((id *)&v10->_delegate, v9);
  }

  return v11;
}

- (void)_animateVisibility:(BOOL)a3
{
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  objc_super v6 = [(VTUIEnrollmentSetupIntroViewControllerGM *)self view];
  [v6 setAlpha:v5];

  [(VTUIEnrollmentSetupIntroViewControllerGM *)self setHidden:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__VTUIEnrollmentSetupIntroViewControllerGM__animateVisibility___block_invoke;
  v7[3] = &unk_264D4C8D8;
  v7[4] = self;
  BOOL v8 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0 completion:0.400000006];
}

void __63__VTUIEnrollmentSetupIntroViewControllerGM__animateVisibility___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:v1];
}

- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)buddyFlowViewWrapper
{
  return self->_buddyFlowViewWrapper;
}

- (void)setBuddyFlowViewWrapper:(id)a3
{
}

- (UIViewController)introViewController
{
  return self->_introViewController;
}

- (void)setIntroViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introViewController, 0);
  objc_storeStrong((id *)&self->_buddyFlowViewWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end