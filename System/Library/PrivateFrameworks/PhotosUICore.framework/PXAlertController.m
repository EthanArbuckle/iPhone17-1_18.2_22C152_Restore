@interface PXAlertController
+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4;
+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4 shouldDismiss:(BOOL)a5;
+ (id)progressAlertControllerWithMessage:(id)a3;
- (PXAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)contentView;
- (void)setContentView:(id)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXAlertController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXAlertController;
  [(PXAlertController *)&v4 viewDidDisappear:a3];
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXAlertController;
  [(PXAlertController *)&v4 viewWillAppear:a3];
  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_contentView != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_contentView, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v9;
    }
    else {
      v6 = 0;
    }
    objc_storeStrong((id *)&self->_progressView, v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v9;
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)&self->_activityIndicatorView, v7);
    if (v9)
    {
      v8 = [[_PXAlertContentViewController alloc] initWithContentView:v9];
      [(PXAlertController *)self setContentViewController:v8];
    }
    else
    {
      [(PXAlertController *)self setContentViewController:0];
    }
    v5 = v9;
  }
}

- (PXAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXAlertController;
  objc_super v4 = [(PXAlertController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(_PXAlertContentViewController);
    contentViewController = v4->_contentViewController;
    v4->_contentViewController = v5;
  }
  return v4;
}

+ (id)progressAlertControllerWithMessage:(id)a3
{
  v3 = [a1 alertControllerWithTitle:0 message:a3 preferredStyle:1];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:0];
  [v3 setContentView:v4];

  return v3;
}

+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4
{
  return (id)[a1 activityAlertControllerWithTitle:a3 cancelHandler:a4 shouldDismiss:0];
}

+ (id)activityAlertControllerWithTitle:(id)a3 cancelHandler:(id)a4 shouldDismiss:(BOOL)a5
{
  id v8 = a4;
  v9 = [a1 alertControllerWithTitle:a3 message:0 preferredStyle:1];
  v10 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PXAlertController_activityAlertControllerWithTitle_cancelHandler_shouldDismiss___block_invoke;
  v13[3] = &__block_descriptor_33_e5_B8__0l;
  BOOL v14 = a5;
  [v9 _addActionWithTitle:v10 style:1 handler:v8 shouldDismissHandler:v13];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v9 setContentView:v11];

  return v9;
}

uint64_t __82__PXAlertController_activityAlertControllerWithTitle_cancelHandler_shouldDismiss___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

@end