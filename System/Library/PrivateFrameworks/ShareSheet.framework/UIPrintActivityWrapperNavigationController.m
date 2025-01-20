@interface UIPrintActivityWrapperNavigationController
- (BOOL)presentedPrintInteractionController;
- (UIPrintActivityWrapperNavigationController)initWithPrintInteractionController:(id)a3 completion:(id)a4;
- (UIPrintInteractionController)printInteractionController;
- (void)setPresentedPrintInteractionController:(BOOL)a3;
- (void)setPrintInteractionController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIPrintActivityWrapperNavigationController

- (UIPrintActivityWrapperNavigationController)initWithPrintInteractionController:(id)a3 completion:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIPrintActivityWrapperNavigationController;
  id v5 = a4;
  id v6 = a3;
  v7 = [(UIPrintActivityWrapperNavigationController *)&v11 init];
  -[UIPrintActivityWrapperNavigationController setPrintInteractionController:](v7, "setPrintInteractionController:", v6, v11.receiver, v11.super_class);

  uint64_t v8 = [v5 copy];
  id completionHandler = v7->_completionHandler;
  v7->_id completionHandler = (id)v8;

  return v7;
}

- (void)viewDidLoad
{
  if (![(UIPrintActivityWrapperNavigationController *)self presentedPrintInteractionController])[(UIPrintActivityWrapperNavigationController *)self setPresentedPrintInteractionController:1]; {
  v3.receiver = self;
  }
  v3.super_class = (Class)UIPrintActivityWrapperNavigationController;
  [(UIPrintActivityWrapperNavigationController *)&v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIPrintActivityWrapperNavigationController *)self printInteractionController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__UIPrintActivityWrapperNavigationController_viewWillAppear___block_invoke;
  v7[3] = &unk_1E5A23140;
  v7[4] = self;
  [v5 presentAnimated:0 completionHandler:v7];

  v6.receiver = self;
  v6.super_class = (Class)UIPrintActivityWrapperNavigationController;
  [(UIPrintActivityWrapperNavigationController *)&v6 viewWillAppear:v3];
}

uint64_t __61__UIPrintActivityWrapperNavigationController_viewWillAppear___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1416) + 16))();
}

- (BOOL)presentedPrintInteractionController
{
  return self->_presentedPrintInteractionController;
}

- (void)setPresentedPrintInteractionController:(BOOL)a3
{
  self->_presentedPrintInteractionController = a3;
}

- (UIPrintInteractionController)printInteractionController
{
  return self->_printInteractionController;
}

- (void)setPrintInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end