@interface BFFFinishSetupTouchIDViewController
- (BFFFinishSetupTouchIDViewController)init;
- (LAContext)authContext;
- (NSString)passcode;
- (id)_cancelLeftNavigationItem;
- (id)completion;
- (void)_didCompleteMesaControllerWithResult:(unint64_t)a3;
- (void)_userDidTapCancelButton:(id)a3;
- (void)beginEnrollment;
- (void)dealloc;
- (void)deleteIdentity;
- (void)didBecomeActive:(id)a3;
- (void)didResignActive:(id)a3;
- (void)endEnrollment;
- (void)enrollResult:(int)a3 bkIdentity:(id)a4;
- (void)loadView;
- (void)resetLeftNavigationItem;
- (void)restartEnrollment;
- (void)setAuthContext:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPasscode:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BFFFinishSetupTouchIDViewController

- (BFFFinishSetupTouchIDViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupTouchIDViewController;
  v2 = [(BFFFinishSetupTouchIDViewController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_didBecomeActive_ name:*MEMORY[0x263F83318] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_didResignActive_ name:*MEMORY[0x263F833C0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(BiometricKitUIEnrollViewController *)self->_enrollController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BFFFinishSetupTouchIDViewController;
  [(BFFFinishSetupTouchIDViewController *)&v3 dealloc];
}

- (void)didBecomeActive:(id)a3
{
  if (!self->_enrollController) {
    [(BFFFinishSetupTouchIDViewController *)self beginEnrollment];
  }
}

- (void)didResignActive:(id)a3
{
  if (!self->_enrollComplete) {
    [(BFFFinishSetupTouchIDViewController *)self deleteIdentity];
  }
  [(BFFFinishSetupTouchIDViewController *)self endEnrollment];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupTouchIDViewController;
  [(BFFFinishSetupTouchIDViewController *)&v6 loadView];
  objc_super v3 = [(BFFFinishSetupTouchIDViewController *)self view];
  v4 = +[BFFStyle sharedStyle];
  v5 = [v4 backgroundColor];
  [v3 setBackgroundColor:v5];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  [(BFFFinishSetupTouchIDViewController *)&v4 viewDidLoad];
  objc_super v3 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  [(BFFFinishSetupTouchIDViewController *)&v4 viewWillAppear:a3];
  if (![(id)*MEMORY[0x263F83300] applicationState]) {
    [(BFFFinishSetupTouchIDViewController *)self beginEnrollment];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  [(BFFFinishSetupTouchIDViewController *)&v4 viewDidDisappear:a3];
  [(BFFFinishSetupTouchIDViewController *)self endEnrollment];
}

- (void)beginEnrollment
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  objc_super v3 = (void *)getBiometricKitUIClass_softClass;
  uint64_t v25 = getBiometricKitUIClass_softClass;
  if (!getBiometricKitUIClass_softClass)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getBiometricKitUIClass_block_invoke;
    v21[3] = &unk_26454AB18;
    v21[4] = &v22;
    __getBiometricKitUIClass_block_invoke((uint64_t)v21);
    objc_super v3 = (void *)v23[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v22, 8);
  v5 = [v4 sharedInstance];
  objc_super v6 = [v5 getEnrollUIViewController:1 bundleName:0];
  v7 = v6;
  if (v6)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke;
    v18[3] = &unk_26454AAF0;
    id v8 = v6;
    id v19 = v8;
    v20 = self;
    v9 = (void (**)(void))MEMORY[0x223C63B60](v18);
    v10 = [(BFFFinishSetupTouchIDViewController *)self passcode];
    BOOL v11 = [v10 length] == 0;

    if (v11)
    {
      v9[2](v9);
    }
    else
    {
      v12 = (void *)MEMORY[0x263F67FD8];
      v13 = [(BFFFinishSetupTouchIDViewController *)self passcode];
      v26 = &unk_26D1D8558;
      v27[0] = &unk_26D1D8570;
      v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_23;
      v15[3] = &unk_26454AEF0;
      v15[4] = self;
      id v16 = v8;
      v17 = v9;
      [v12 createContextWithSecret:v13 policy:1007 options:v14 completion:v15];
    }
  }
}

void __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:MEMORY[0x263EFFA88] forKey:@"IN_BUDDY"];
  v2 = *(void **)(a1 + 32);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  objc_super v3 = (void *)getBiometricKitClass_softClass;
  uint64_t v15 = getBiometricKitClass_softClass;
  if (!getBiometricKitClass_softClass)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getBiometricKitClass_block_invoke;
    v11[3] = &unk_26454AB18;
    v11[4] = &v12;
    __getBiometricKitClass_block_invoke((uint64_t)v11);
    objc_super v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  v5 = [v4 manager];
  [v2 setBiometricKit:v5];

  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) addChildViewController:*(void *)(a1 + 32)];
  objc_super v6 = [*(id *)(a1 + 32) view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [*(id *)(a1 + 40) view];
  id v8 = [*(id *)(a1 + 32) view];
  [v7 addSubview:v8];

  v9 = [*(id *)(a1 + 32) view];
  v10 = [*(id *)(a1 + 40) view];
  [v9 pinToEdges:v10];

  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 976), *(id *)(a1 + 32));
}

void __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_23(id *a1, uint64_t a2)
{
  [a1[4] setAuthContext:a2];
  objc_super v3 = [a1[4] authContext];
  id v4 = [v3 externalizedContext];

  if (v4) {
    [a1[5] setProperty:v4 forKey:@"credset"];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_2;
  block[3] = &unk_26454AEC8;
  id v6 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endEnrollment
{
  v5 = self->_enrollController;
  [(BiometricKitUIEnrollViewController *)v5 willMoveToParentViewController:0];
  objc_super v3 = [(BiometricKitUIEnrollViewController *)v5 view];
  [v3 removeFromSuperview];

  [(BiometricKitUIEnrollViewController *)v5 removeFromParentViewController];
  [(BiometricKitUIEnrollViewController *)v5 setDelegate:0];
  enrollController = self->_enrollController;
  self->_enrollController = 0;
}

- (void)restartEnrollment
{
  [(BFFFinishSetupTouchIDViewController *)self deleteIdentity];
  [(BiometricKitUIEnrollViewController *)self->_enrollController restartEnroll];
  [(BFFFinishSetupTouchIDViewController *)self resetLeftNavigationItem];
}

- (void)deleteIdentity
{
  if (self->_identity)
  {
    objc_super v3 = [MEMORY[0x263F5FAA8] sharedInstance];
    [v3 removeIdentity:self->_identity];

    identity = self->_identity;
    self->_identity = 0;
  }
}

- (id)_cancelLeftNavigationItem
{
  cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  if (!cancelLeftNavigationItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancelButton_];
    v5 = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v4;

    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  }
  return cancelLeftNavigationItem;
}

- (void)_userDidTapCancelButton:(id)a3
{
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Buddy followup touch ID user did tap cancel", v5, 2u);
  }

  [(BFFFinishSetupTouchIDViewController *)self deleteIdentity];
  [(BFFFinishSetupTouchIDViewController *)self _didCompleteMesaControllerWithResult:2];
}

- (void)resetLeftNavigationItem
{
  objc_super v3 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
  id v4 = [v3 leftBarButtonItem];
  v5 = [(BFFFinishSetupTouchIDViewController *)self _cancelLeftNavigationItem];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
    [v7 performSelector:sel_setLeftBarButtonItem_animated_ withObject:0 withObject:MEMORY[0x263EFFA88]];

    id v8 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
    [v8 setHidesBackButton:0];
  }
}

- (void)_didCompleteMesaControllerWithResult:(unint64_t)a3
{
  self->_enrollComplete = 1;
  completion = (void (**)(id, BFFFinishSetupTouchIDViewController *, unint64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, self, a3);
    id v5 = self->_completion;
    self->_completion = 0;
  }
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67109120;
    v23[1] = a3;
    _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Enroll result: %d", (uint8_t *)v23, 8u);
  }

  switch(a3)
  {
    case 0:
      self->_enrollComplete = 0;
      [(BFFFinishSetupTouchIDViewController *)self resetLeftNavigationItem];
      break;
    case 1:
      if (v7)
      {
        objc_storeStrong((id *)&self->_identity, a4);
        v9 = [MEMORY[0x263F5FAA8] sharedInstance];
        v10 = [MEMORY[0x263F5FAF0] nextIdentityName];
        [v9 setName:v10 forIdentity:v7];
      }
      break;
    case 3:
      if (v7)
      {
        BOOL v11 = [MEMORY[0x263F5FAA8] sharedInstance];
        [v11 removeIdentity:v7];

        identity = self->_identity;
        self->_identity = 0;
      }
      v13 = self;
      uint64_t v14 = 1;
      goto LABEL_11;
    case 4:
      v13 = self;
      uint64_t v14 = 0;
LABEL_11:
      [(BFFFinishSetupTouchIDViewController *)v13 _didCompleteMesaControllerWithResult:v14];
      break;
    case 9:
      if (v7)
      {
        uint64_t v15 = [MEMORY[0x263F5FAA8] sharedInstance];
        [v15 removeIdentity:v7];

        id v16 = self->_identity;
        self->_identity = 0;
      }
      [(BiometricKitUIEnrollViewController *)self->_enrollController restartEnroll];
      break;
    case 10:
      v17 = self->_identity;
      self->_identity = 0;

      v18 = (void *)MEMORY[0x263F8C6D0];
      id v19 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
      [v18 cancelPreviousPerformRequestsWithTarget:v19 selector:sel_setLeftBarButtonItem_ object:0];

      v20 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
      [v20 setHidesBackButton:1];

      v21 = [(BFFFinishSetupTouchIDViewController *)self navigationItem];
      uint64_t v22 = [(BFFFinishSetupTouchIDViewController *)self _cancelLeftNavigationItem];
      [v21 setLeftBarButtonItem:v22 animated:1];

      break;
    default:
      break;
  }
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_cancelLeftNavigationItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_enrollController, 0);
}

@end