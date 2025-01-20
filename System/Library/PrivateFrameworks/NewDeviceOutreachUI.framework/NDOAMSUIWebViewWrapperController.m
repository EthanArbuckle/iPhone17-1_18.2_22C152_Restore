@interface NDOAMSUIWebViewWrapperController
- (NDOAMSUIWebViewWrapperController)initWithViewController:(id)a3;
- (UIViewController)viewController;
- (id)dismissBlock;
- (void)dealloc;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NDOAMSUIWebViewWrapperController

- (NDOAMSUIWebViewWrapperController)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOAMSUIWebViewWrapperController;
  v6 = [(NDOAMSUIWebViewWrapperController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (void)dealloc
{
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)NDOAMSUIWebViewWrapperController;
  [(AMSUICommonViewController *)&v5 loadView];
  v3 = [(NDOAMSUIWebViewWrapperController *)self viewController];
  v4.receiver = self;
  v4.super_class = (Class)NDOAMSUIWebViewWrapperController;
  [(AMSUICommonViewController *)&v4 setChildViewController:v3];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NDOAMSUIWebViewWrapperController;
  [(NDOAMSUIWebViewWrapperController *)&v14 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NDOAMSUIWebViewWrapperController *)self viewController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:].cold.4(self);
  }

  double v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:](self);
  }

  double v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:](self);
  }

  if (([(NDOAMSUIWebViewWrapperController *)self isBeingDismissed] & 1) == 0)
  {
    double v8 = [(NDOAMSUIWebViewWrapperController *)self navigationController];
    if ([v8 isBeingDismissed])
    {
    }
    else
    {
      int v9 = [(NDOAMSUIWebViewWrapperController *)self isMovingFromParentViewController];

      if (!v9) {
        goto LABEL_15;
      }
    }
  }
  double v10 = [(NDOAMSUIWebViewWrapperController *)self dismissBlock];

  if (v10)
  {
    double v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[NDOAMSUIWebViewWrapperController viewDidDisappear:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    v19 = [(NDOAMSUIWebViewWrapperController *)self dismissBlock];
    v19[2]();

    [(NDOAMSUIWebViewWrapperController *)self setDismissBlock:0];
  }
LABEL_15:
  v20.receiver = self;
  v20.super_class = (Class)NDOAMSUIWebViewWrapperController;
  [(NDOAMSUIWebViewWrapperController *)&v20 viewDidDisappear:v3];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  double v4 = [(NDOAMSUIWebViewWrapperController *)self dismissBlock];

  if (v4)
  {
    double v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[NDOAMSUIWebViewWrapperController presentationControllerDidDismiss:](v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v13 = [(NDOAMSUIWebViewWrapperController *)self dismissBlock];
    v13[2]();

    [(NDOAMSUIWebViewWrapperController *)self setDismissBlock:0];
  }
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
}

- (void)viewDidDisappear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewDidDisappear:(void *)a1 .cold.2(void *a1)
{
  [a1 isMovingFromParentViewController];
  OUTLINED_FUNCTION_0_2(&dword_238845000, v1, v2, "dismissal isMovingFromParentViewController %d", v3, v4, v5, v6, 0);
}

- (void)viewDidDisappear:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 navigationController];
  [v1 isBeingDismissed];
  OUTLINED_FUNCTION_0_2(&dword_238845000, v2, v3, "dismissal navigationController isBeingDismissed %d", v4, v5, v6, v7, 0);
}

- (void)viewDidDisappear:(void *)a1 .cold.4(void *a1)
{
  [a1 isBeingDismissed];
  OUTLINED_FUNCTION_0_2(&dword_238845000, v1, v2, "dismissal isBeingDismissed %d", v3, v4, v5, v6, 0);
}

- (void)presentationControllerDidDismiss:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end