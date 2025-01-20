@interface PSUIFaceIDEnrollmentCoordinator
- (PSEnrollmentNavigationController)_presentedViewController;
- (PSUIFaceIDEnrollmentCoordinator)initWithPresentingViewController:(id)a3 configuration:(unint64_t)a4;
- (PSUIFaceIDEnrollmentCoordinatorDelegate)delegate;
- (UIViewController)presentingViewController;
- (unint64_t)configuration;
- (void)enrollmentNavigationControllerDidDismiss:(id)a3;
- (void)enrollmentNavigationControllerWillDismiss:(id)a3;
- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4;
- (void)preloadAndCreateEnrollmentControllerWithPasscode:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)set_presentedViewController:(id)a3;
- (void)startWithPasscode:(id)a3;
@end

@implementation PSUIFaceIDEnrollmentCoordinator

- (PSUIFaceIDEnrollmentCoordinator)initWithPresentingViewController:(id)a3 configuration:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSUIFaceIDEnrollmentCoordinator;
  v8 = [(PSUIFaceIDEnrollmentCoordinator *)&v12 init];
  if (v8)
  {
    v9 = objc_alloc_init(PSEnrollmentNavigationController);
    presentedViewController = v8->__presentedViewController;
    v8->__presentedViewController = v9;

    [(PSEnrollmentNavigationController *)v8->__presentedViewController setDismissalDelegate:v8];
    objc_storeStrong((id *)&v8->_presentingViewController, a3);
    v8->_configuration = a4;
  }

  return v8;
}

- (void)startWithPasscode:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
  v6 = [v5 navigationBar];
  id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.0];
  v8 = PSPointImageOfColor();
  [v6 setBackgroundImage:v8 forBarMetrics:0];

  v9 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
  v10 = [v9 navigationBar];
  [v10 _setHidesShadow:1];

  v11 = [(PSUIFaceIDEnrollmentCoordinator *)self delegate];
  LODWORD(v10) = [v11 faceIDEnrollmentCoordinatorShouldPresentInModalSheet:self];

  objc_super v12 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
  v13 = v12;
  if (v10) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0;
  }
  [v12 setModalPresentationStyle:v14];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke;
  aBlock[3] = &unk_264E95290;
  aBlock[4] = self;
  id v15 = v4;
  id v33 = v15;
  objc_copyWeak(&v34, &location);
  v16 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  unint64_t v17 = [(PSUIFaceIDEnrollmentCoordinator *)self configuration];
  if (v17 < 2)
  {
    v16[2](v16, 1);
  }
  else
  {
    if (v17 == 2)
    {
      id v25 = objc_alloc(MEMORY[0x263F2AAA0]);
      v19 = v31;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_3;
      v31[3] = &unk_264E952B8;
      v31[4] = v16;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_4;
      v30[3] = &unk_264E952E0;
      v30[4] = self;
      v20 = (void *)[v25 initInBuddy:0 bkDevice:0 upsell:0 withEndEnrollmentActionPrimary:v31 enrollmentActionSecondary:v30];
      v37[0] = v20;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
      v27 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
      [v27 setViewControllers:v26];

      v23 = [(PSUIFaceIDEnrollmentCoordinator *)self presentingViewController];
      v24 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
      [v23 presentViewController:v24 animated:1 completion:0];
      goto LABEL_10;
    }
    if (v17 == 3)
    {
      id v18 = objc_alloc(MEMORY[0x263F2AA98]);
      v19 = v29;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_5;
      v29[3] = &unk_264E952B8;
      v29[4] = v16;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_6;
      v28[3] = &unk_264E952E0;
      v28[4] = self;
      v20 = (void *)[v18 initInBuddy:0 isDemo:0 bkDevice:0 withEndEnrollmentActionPrimary:v29 enrollmentActionSecondary:v28];
      v36 = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      v22 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
      [v22 setViewControllers:v21];

      v23 = [(PSUIFaceIDEnrollmentCoordinator *)self presentingViewController];
      v24 = [(PSUIFaceIDEnrollmentCoordinator *)self presentedViewController];
      [v23 presentViewController:v24 animated:1 completion:0];
LABEL_10:
    }
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke(uint64_t a1, char a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_2;
  v5[3] = &unk_264E95268;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  char v7 = a2;
  [v3 preloadAndCreateEnrollmentControllerWithPasscode:v4 completion:v5];
  objc_destroyWeak(&v6);
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained configuration];
  if (v4 <= 3) {
    [v8 setEnrollmentConfiguration:qword_23D36A8F8[v4]];
  }
  v5 = [WeakRetained presentedViewController];
  [v5 pushViewController:v8 animated:*(unsigned char *)(a1 + 40) == 0];

  if (*(unsigned char *)(a1 + 40))
  {
    id v6 = [WeakRetained presentingViewController];
    char v7 = [WeakRetained presentedViewController];
    [v6 presentViewController:v7 animated:1 completion:0];
  }
}

uint64_t __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)preloadAndCreateEnrollmentControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x263F2AA90];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_264E95330;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 preloadWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke_2;
  v5[3] = &unk_264E95308;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
}

void __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)[objc_alloc(MEMORY[0x263F2AA90]) initWithPreloadedState:*(void *)(a1 + 32)];
  [v2 setDelegate:WeakRetained];
  id v3 = [WeakRetained delegate];
  objc_msgSend(v2, "setInSheet:", objc_msgSend(v3, "faceIDEnrollmentCoordinatorShouldPresentInModalSheet:", WeakRetained));

  [v2 primeWithPasscode:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
    {
      id v7 = [v5 description];
    }
    else
    {
      id v7 = &stru_26F10E0E8;
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Finished Pearl enroll %@", (uint8_t *)&v9, 0xCu);
    if (v5) {
  }
    }
  id v8 = [(PSUIFaceIDEnrollmentCoordinator *)self delegate];
  [v8 faceIDEnrollmentCoordinator:self finishedEnrollmentWithError:v5];
}

- (void)enrollmentNavigationControllerWillDismiss:(id)a3
{
  id v4 = [(PSUIFaceIDEnrollmentCoordinator *)self delegate];
  [v4 faceIDEnrollmentCoordinatorWillDismiss:self];
}

- (void)enrollmentNavigationControllerDidDismiss:(id)a3
{
  [(PSUIFaceIDEnrollmentCoordinator *)self set_presentedViewController:0];
  id v4 = [(PSUIFaceIDEnrollmentCoordinator *)self delegate];
  [v4 faceIDEnrollmentCoordinatorDidDismiss:self];
}

- (unint64_t)configuration
{
  return self->_configuration;
}

- (PSUIFaceIDEnrollmentCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSUIFaceIDEnrollmentCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (PSEnrollmentNavigationController)_presentedViewController
{
  return self->__presentedViewController;
}

- (void)set_presentedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__presentedViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end