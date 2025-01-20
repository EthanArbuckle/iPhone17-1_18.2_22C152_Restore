@interface PUPickerActivityProgressController
- (NSProgress)progress;
- (NSString)message;
- (NSString)title;
- (PUPickerActivityProgressController)init;
- (id)cancellationHandler;
- (void)_setupAlertController;
- (void)hideWithCompletion:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setMessage:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTitle:(id)a3;
- (void)showFromSourceViewController:(id)a3 completion:(id)a4;
@end

@implementation PUPickerActivityProgressController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setCancellationHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (void)_setupAlertController
{
  v3 = [(PUPickerActivityProgressController *)self title];
  v4 = [(PUPickerActivityProgressController *)self message];
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  objc_initWeak(&location, self);
  v6 = PULocalizedString(@"CANCEL");
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __59__PUPickerActivityProgressController__setupAlertController__block_invoke;
  v11 = &unk_1E5F2E530;
  objc_copyWeak(&v12, &location);
  [(UIAlertController *)v5 _addActionWithTitle:v6 style:1 handler:&v8 shouldDismissHandler:&__block_literal_global_1214];

  -[UIAlertController setContentViewController:](v5, "setContentViewController:", self->_progressViewController, v8, v9, v10, v11);
  alertController = self->_alertController;
  self->_alertController = v5;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__PUPickerActivityProgressController__setupAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained cancellationHandler];
  v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

uint64_t __59__PUPickerActivityProgressController__setupAlertController__block_invoke_2()
{
  return 0;
}

- (void)hideWithCompletion:(id)a3
{
}

- (void)showFromSourceViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPickerActivityProgressController *)self _setupAlertController];
  [v7 presentViewController:self->_alertController animated:1 completion:v6];
}

- (void)setMessage:(id)a3
{
  uint64_t v9 = (NSString *)a3;
  v4 = self->_message;
  if (v4 == v9)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v9 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v9 copy];
      message = self->_message;
      self->_message = v6;

      alertController = self->_alertController;
      if (alertController) {
        [(UIAlertController *)alertController setMessage:self->_message];
      }
    }
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v9 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v9)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v9 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v9 copy];
      title = self->_title;
      self->_title = v6;

      alertController = self->_alertController;
      if (alertController) {
        [(UIAlertController *)alertController setTitle:self->_title];
      }
    }
  }
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  [(PUAssetPickerActivityProgressViewController *)self->_progressViewController setProgress:v5];
}

- (PUPickerActivityProgressController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUPickerActivityProgressController;
  v2 = [(PUPickerActivityProgressController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PUAssetPickerActivityProgressViewController);
    progressViewController = v2->_progressViewController;
    v2->_progressViewController = v3;
  }
  return v2;
}

@end