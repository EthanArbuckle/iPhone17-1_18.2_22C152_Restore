@interface PXConfidentialityWarningViewController
- (UIButton)cancelButton;
- (UIButton)confirmButton;
- (UILabel)messageLabel;
- (UIVisualEffectView)effectView;
- (id)cancellationHandler;
- (void)_handleButton:(id)a3;
- (void)presentAsOverlayInWindowScene:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PXConfidentialityWarningViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setCancellationHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)_handleButton:(id)a3
{
  id v10 = a3;
  if ([v10 tag] == 2)
  {
    uint64_t v4 = [(PXConfidentialityWarningViewController *)self cancellationHandler];
    if (!v4) {
      exit(1);
    }
    v5 = (void (**)(void))v4;
    [(PXConfidentialityWarningViewController *)self setCancellationHandler:0];
    v5[2](v5);
  }
  v6 = [(id)overlayWindow rootViewController];

  if (v6 == self)
  {
    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    v8 = [v7 windows];
    v9 = [v8 firstObject];
    [v9 makeKeyAndVisible];

    [(id)overlayWindow setHidden:1];
    [(id)overlayWindow setRootViewController:0];
  }
  else
  {
    [(PXConfidentialityWarningViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)presentAsOverlayInWindowScene:(id)a3
{
  uint64_t v4 = (void *)overlayWindow;
  if (!overlayWindow)
  {
    v5 = (objc_class *)MEMORY[0x1E4FB1F48];
    id v6 = a3;
    uint64_t v7 = [[v5 alloc] initWithWindowScene:v6];

    v8 = (void *)overlayWindow;
    overlayWindow = v7;

    [(id)overlayWindow setWindowLevel:*MEMORY[0x1E4FB3108]];
    uint64_t v4 = (void *)overlayWindow;
  }
  [v4 setRootViewController:self];
  [(id)overlayWindow setHidden:0];
  v9 = (void *)overlayWindow;
  [v9 makeKeyAndVisible];
}

- (void)viewWillLayoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)PXConfidentialityWarningViewController;
  [(PXConfidentialityWarningViewController *)&v37 viewWillLayoutSubviews];
  v3 = [(PXConfidentialityWarningViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v31 = v4;
  double v32 = v6;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v33 = v8;
  double v34 = v10;
  CGFloat v11 = v10;

  v38.origin.double x = v5;
  v38.origin.double y = v7;
  v38.size.double width = v9;
  v38.size.CGFloat height = v11;
  CGRect v39 = CGRectInset(v38, 20.0, 20.0);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  CGFloat height = v39.size.height;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXConfidentialityWarningViewController_viewWillLayoutSubviews__block_invoke;
  aBlock[3] = &__block_descriptor_64_e18_d16__0__UIButton_8l;
  CGRect v36 = v39;
  v16 = (double (**)(void *, void *))_Block_copy(aBlock);
  v17 = [(PXConfidentialityWarningViewController *)self confirmButton];
  double v18 = v16[2](v16, v17);

  v19 = [(PXConfidentialityWarningViewController *)self cancelButton];
  double v20 = v16[2](v16, v19);

  if (v18 >= v20) {
    double v20 = v18;
  }
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v40);
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.CGFloat height = v20;
  CGFloat v22 = MaxY - CGRectGetHeight(v41);
  v42.origin.double x = x;
  v42.origin.double y = v22;
  v42.size.double width = width;
  v42.size.CGFloat height = v20;
  CGFloat v23 = CGRectGetMinY(v42) + -20.0;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.CGFloat height = v20;
  CGFloat v24 = v23 - CGRectGetHeight(v43);
  v44.origin.double x = x;
  v44.origin.double y = v24;
  v44.size.double width = width;
  v44.size.CGFloat height = v20;
  CGFloat v25 = CGRectGetMinY(v44) + -20.0;
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.CGFloat height = height;
  CGFloat v26 = v25 - CGRectGetMinY(v45);
  v27 = [(PXConfidentialityWarningViewController *)self effectView];
  objc_msgSend(v27, "setFrame:", v31, v32, v33, v34);

  v28 = [(PXConfidentialityWarningViewController *)self messageLabel];
  objc_msgSend(v28, "setFrame:", x, y, width, v26);

  v29 = [(PXConfidentialityWarningViewController *)self confirmButton];
  objc_msgSend(v29, "setFrame:", x, v24, width, v20);

  v30 = [(PXConfidentialityWarningViewController *)self cancelButton];
  objc_msgSend(v30, "setFrame:", x, v22, width, v20);
}

double __64__PXConfidentialityWarningViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return v2;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PXConfidentialityWarningViewController;
  [(PXConfidentialityWarningViewController *)&v19 viewDidLoad];
  v3 = [(PXConfidentialityWarningViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
  CGFloat v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:0];
  double v6 = (UIVisualEffectView *)[v4 initWithEffect:v5];
  effectView = self->_effectView;
  self->_effectView = v6;

  [v3 addSubview:self->_effectView];
  double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v8;

  double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  [(UILabel *)self->_messageLabel setFont:v10];

  [(UILabel *)self->_messageLabel setText:@"Confidential UI Warning\n\nMake sure that every person around you is appropriately disclosed."];
  [(UILabel *)self->_messageLabel setNumberOfLines:0];
  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [v3 addSubview:self->_messageLabel];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__PXConfidentialityWarningViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_1E5DC3288;
  v17[4] = self;
  id v18 = v3;
  id v11 = v3;
  v12 = (void (**)(void *, __CFString *, uint64_t))_Block_copy(v17);
  v12[2](v12, @"Continue with Confidential UI", 1);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v13;

  v12[2](v12, @"Cancel", 2);
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v15;
}

id __53__PXConfidentialityWarningViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat v5 = (void *)MEMORY[0x1E4FB14D0];
  id v6 = a2;
  CGFloat v7 = [v5 buttonWithType:1];
  [v7 setTag:a3];
  [v7 setTitle:v6 forState:0];

  [v7 addTarget:*(void *)(a1 + 32) action:sel__handleButton_ forControlEvents:0x2000];
  [*(id *)(a1 + 40) addSubview:v7];
  return v7;
}

@end