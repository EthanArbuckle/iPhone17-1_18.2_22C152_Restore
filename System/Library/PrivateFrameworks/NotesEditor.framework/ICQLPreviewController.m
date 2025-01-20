@interface ICQLPreviewController
- (BOOL)viewOnlyDocumentButtonIsVisible;
- (CGRect)viewOnlyDocumentButtonFrame;
- (ICQLPreviewController)initWithCoder:(id)a3;
- (ICQLPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICSelectorDelayer)hideViewOnlyDocumentButtonSelectorDelayer;
- (ICViewOnlyPopoverViewController)viewOnlyPopoverController;
- (NSLayoutConstraint)bottomButtonConstraint;
- (UIButton)viewOnlyDocumentButton;
- (double)bottomButtonSpacing;
- (void)commonInit;
- (void)hideViewOnlyButton;
- (void)popoverDidDismiss;
- (void)registerForTraitChanges;
- (void)setBottomButtonConstraint:(id)a3;
- (void)setHideViewOnlyDocumentButtonSelectorDelayer:(id)a3;
- (void)setViewOnlyDocumentButton:(id)a3;
- (void)setViewOnlyPopoverController:(id)a3;
- (void)showViewOnlyDocumentPopover;
- (void)showViewOnlyWarning;
- (void)updateBackgroundColor;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICQLPreviewController

- (ICQLPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICQLPreviewController;
  v4 = [(QLPreviewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(ICQLPreviewController *)v4 commonInit];
  }
  return v5;
}

- (ICQLPreviewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQLPreviewController;
  v3 = [(ICQLPreviewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICQLPreviewController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_hideViewOnlyButton delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:5.0];
  [(ICQLPreviewController *)self setHideViewOnlyDocumentButtonSelectorDelayer:v3];

  [(ICQLPreviewController *)self registerForTraitChanges];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICQLPreviewController;
  [(QLPreviewController *)&v10 viewWillAppear:a3];
  v4 = [(QLPreviewController *)self internalNavigationController];
  v5 = [v4 navigationBar];
  [v5 _setHidesShadow:1];

  objc_super v6 = [(QLPreviewController *)self toolbarController];
  objc_super v7 = [v6 originalToolbar];
  [v7 _setHidesShadow:1];

  v8 = [(QLPreviewController *)self toolbarController];
  v9 = [v8 customToolbar];
  [v9 _setHidesShadow:1];

  [(ICQLPreviewController *)self updateBackgroundColor];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQLPreviewController;
  [(QLPreviewController *)&v5 viewDidAppear:a3];
  v4 = [(ICQLPreviewController *)self hideViewOnlyDocumentButtonSelectorDelayer];
  [v4 requestFire];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQLPreviewController;
  [(QLPreviewController *)&v5 viewWillDisappear:a3];
  if ([(ICQLPreviewController *)self viewOnlyDocumentButtonIsVisible])
  {
    v4 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
    [v4 removeFromSuperview];
  }
}

- (void)updateBackgroundColor
{
  v3 = [(ICQLPreviewController *)self traitCollection];
  v4 = objc_msgSend(v3, "ic_appearanceInfo");
  int v5 = [v4 isDark];

  if (v5) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  id v6 = [MEMORY[0x263F825C8] ICBackgroundColor];
  }
  [(QLPreviewController *)self setBackgroundColor:v6];
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(ICQLPreviewController *)self registerForTraitChanges:v3 withAction:sel_updateBackgroundColor];
}

- (UIButton)viewOnlyDocumentButton
{
  viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  if (!viewOnlyDocumentButton)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x263F823D0];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __47__ICQLPreviewController_viewOnlyDocumentButton__block_invoke;
    v22 = &unk_2640B9E88;
    objc_copyWeak(&v23, &location);
    int v5 = [v4 actionWithHandler:&v19];
    id v6 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v19, v20, v21, v22);
    objc_super v7 = [v6 localizedStringForKey:@"This document is view only." value:&stru_26C10E100 table:0];

    v8 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    v9 = [MEMORY[0x263F825C8] darkGrayColor];
    [v8 setBaseForegroundColor:v9];

    objc_super v10 = [MEMORY[0x263F825C8] whiteColor];
    v11 = [v8 background];
    [v11 setBackgroundColor:v10];

    v12 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
    v13 = [v8 background];
    [v13 setStrokeColor:v12];

    v14 = [v8 background];
    [v14 setStrokeWidth:1.0];

    [v8 setCornerStyle:4];
    [v8 setButtonSize:1];
    [v8 setTitleAlignment:1];
    [v8 setTitle:v7];
    [v8 setAccessibilityLabel:v7];
    [v8 contentInsets];
    objc_msgSend(v8, "setContentInsets:", 6.0, 12.0, 6.0, 12.0);
    v15 = objc_msgSend(MEMORY[0x263F827E8], "ic_largeSystemImageNamed:", @"info.circle");
    [v8 setImage:v15];

    [v8 setImagePadding:4.0];
    v16 = [MEMORY[0x263F824E8] buttonWithConfiguration:v8 primaryAction:v5];
    [(UIButton *)v16 ic_applyShadow];
    [(UIButton *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = self->_viewOnlyDocumentButton;
    self->_viewOnlyDocumentButton = v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  }

  return viewOnlyDocumentButton;
}

void __47__ICQLPreviewController_viewOnlyDocumentButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showViewOnlyDocumentPopover];
}

- (void)hideViewOnlyButton
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__ICQLPreviewController_hideViewOnlyButton__block_invoke;
  v3[3] = &unk_2640B8140;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__ICQLPreviewController_hideViewOnlyButton__block_invoke_2;
  v2[3] = &unk_2640B93C0;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:v2 completion:0.25];
}

void __43__ICQLPreviewController_hideViewOnlyButton__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewOnlyDocumentButton];
  [v1 setAlpha:0.0];
}

void __43__ICQLPreviewController_hideViewOnlyButton__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) viewOnlyDocumentButton];
    [v3 setHidden:1];

    id v4 = [*(id *)(a1 + 32) viewOnlyDocumentButton];
    [v4 removeFromSuperview];
  }
}

- (BOOL)viewOnlyDocumentButtonIsVisible
{
  viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  if (!viewOnlyDocumentButton) {
    return 0;
  }
  v3 = [(UIButton *)viewOnlyDocumentButton window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__ICQLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2640B8050;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)ICQLPreviewController;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __76__ICQLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bottomButtonSpacing];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) bottomButtonConstraint];
  [v4 setConstant:v3];
}

- (double)bottomButtonSpacing
{
  double v3 = [(ICQLPreviewController *)self traitCollection];
  unsigned __int8 v4 = objc_msgSend(v3, "ic_hasCompactSize");

  int v5 = [(ICQLPreviewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double result = -40.0;
  if ((v4 & (v9 > v7)) != 0) {
    return -100.0;
  }
  return result;
}

- (void)showViewOnlyWarning
{
  v20[2] = *MEMORY[0x263EF8340];
  if (![(ICQLPreviewController *)self viewOnlyDocumentButtonIsVisible])
  {
    double v3 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
    [v3 setAlpha:0.0];

    unsigned __int8 v4 = [(ICQLPreviewController *)self view];
    int v5 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
    [v4 addSubview:v5];

    double v6 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
    double v7 = [v6 bottomAnchor];
    double v8 = [(ICQLPreviewController *)self view];
    double v9 = [v8 bottomAnchor];
    [(ICQLPreviewController *)self bottomButtonSpacing];
    objc_super v10 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
    [(ICQLPreviewController *)self setBottomButtonConstraint:v10];

    v11 = (void *)MEMORY[0x263F08938];
    v12 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
    v13 = [v12 centerXAnchor];
    v14 = [(ICQLPreviewController *)self view];
    v15 = [v14 centerXAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v20[0] = v16;
    v17 = [(ICQLPreviewController *)self bottomButtonConstraint];
    v20[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v11 activateConstraints:v18];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__ICQLPreviewController_showViewOnlyWarning__block_invoke;
    v19[3] = &unk_2640B8140;
    v19[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v19 animations:0 completion:0.25];
  }
}

void __44__ICQLPreviewController_showViewOnlyWarning__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewOnlyDocumentButton];
  [v1 setAlpha:1.0];
}

- (void)showViewOnlyDocumentPopover
{
  double v3 = [(ICQLPreviewController *)self hideViewOnlyDocumentButtonSelectorDelayer];
  [v3 cancelPreviousFireRequests];

  unsigned __int8 v4 = [(ICQLPreviewController *)self viewOnlyDocumentButton];
  int v5 = +[ICViewOnlyPopoverViewController viewOnlyPopoverViewController:self sourceView:v4];
  [(ICQLPreviewController *)self setViewOnlyPopoverController:v5];

  id v6 = [(ICQLPreviewController *)self viewOnlyPopoverController];
  -[ICQLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, [MEMORY[0x263F82E00] areAnimationsEnabled], 0);
}

- (void)popoverDidDismiss
{
  double v3 = [(ICQLPreviewController *)self viewOnlyPopoverController];
  [v3 removeFromParentViewController];

  id v4 = [(ICQLPreviewController *)self hideViewOnlyDocumentButtonSelectorDelayer];
  [v4 requestFire];
}

- (void)setViewOnlyDocumentButton:(id)a3
{
}

- (ICSelectorDelayer)hideViewOnlyDocumentButtonSelectorDelayer
{
  return self->_hideViewOnlyDocumentButtonSelectorDelayer;
}

- (void)setHideViewOnlyDocumentButtonSelectorDelayer:(id)a3
{
}

- (CGRect)viewOnlyDocumentButtonFrame
{
  double x = self->_viewOnlyDocumentButtonFrame.origin.x;
  double y = self->_viewOnlyDocumentButtonFrame.origin.y;
  double width = self->_viewOnlyDocumentButtonFrame.size.width;
  double height = self->_viewOnlyDocumentButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSLayoutConstraint)bottomButtonConstraint
{
  return self->_bottomButtonConstraint;
}

- (void)setBottomButtonConstraint:(id)a3
{
}

- (ICViewOnlyPopoverViewController)viewOnlyPopoverController
{
  return self->_viewOnlyPopoverController;
}

- (void)setViewOnlyPopoverController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewOnlyPopoverController, 0);
  objc_storeStrong((id *)&self->_bottomButtonConstraint, 0);
  objc_storeStrong((id *)&self->_hideViewOnlyDocumentButtonSelectorDelayer, 0);

  objc_storeStrong((id *)&self->_viewOnlyDocumentButton, 0);
}

@end