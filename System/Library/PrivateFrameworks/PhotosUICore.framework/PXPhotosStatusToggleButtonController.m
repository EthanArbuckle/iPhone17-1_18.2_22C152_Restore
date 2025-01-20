@interface PXPhotosStatusToggleButtonController
- (PXPhotosStatusToggleButtonController)initWithFooterViewModel:(id)a3 buttonConfiguration:(id)a4;
- (PXPhotosStatusToggleButtonControllerDelegate)delegate;
- (UIButton)button;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_handleButtonAction:(id)a3;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)photosGlobalFooterViewDidChangeHeight:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXPhotosStatusToggleButtonController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_presentedPopOverViewController);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosStatusToggleButtonControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosStatusToggleButtonControllerDelegate *)WeakRetained;
}

- (UIButton)button
{
  return self->_button;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  id v4 = a3;
  [v4 frame];
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", v5, 1.79769313e308);
  double v7 = v6;
  double v9 = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedPopOverViewController);
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v7, v9);
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(PXPhotosStatusToggleButtonController *)self delegate];
  if (!v6) {
    PXAssertGetLog();
  }
  double v7 = [v6 presentationEnvironmentForPhotosStatusToggleButtonController:self];
  [v7 presentViewController:v5 animated:1 completionHandler:0];
}

- (void)_handleButtonAction:(id)a3
{
  id v4 = objc_alloc_init(PXPhotosGlobalFooterView);
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PXPhotosGlobalFooterView *)v4 setBackgroundColor:v5];

  [(PXPhotosGlobalFooterView *)v4 setViewModel:self->_footerViewModel];
  [(PXPhotosGlobalFooterView *)v4 setDelegate:self];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [v6 setModalPresentationStyle:7];
  [v6 setView:v4];
  -[PXPhotosGlobalFooterView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  objc_msgSend(v6, "setPreferredContentSize:");
  objc_storeWeak((id *)&self->_presentedPopOverViewController, v6);
  double v7 = [v6 popoverPresentationController];
  [v7 setDelegate:self];
  [v7 setPermittedArrowDirections:2];
  double v8 = [(PXPhotosStatusToggleButtonController *)self delegate];
  if (!v8) {
    PXAssertGetLog();
  }
  double v9 = [v8 popoverPresentationEnvironmentForPhotosStatusToggleButtonController:self];
  [v9 presentViewController:v6 animated:1 completionHandler:0];
}

- (PXPhotosStatusToggleButtonController)initWithFooterViewModel:(id)a3 buttonConfiguration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotosStatusToggleButtonController.m", 32, @"Invalid parameter not satisfying: %@", @"footerViewModel" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXPhotosStatusToggleButtonController.m", 33, @"Invalid parameter not satisfying: %@", @"buttonConfiguration" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosStatusToggleButtonController;
  v11 = [(PXPhotosStatusToggleButtonController *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_footerViewModel, a3);
    uint64_t v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:0];
    button = v12->_button;
    v12->_button = (UIButton *)v13;

    [(UIButton *)v12->_button addTarget:v12 action:sel__handleButtonAction_ forControlEvents:0x2000];
  }

  return v12;
}

@end