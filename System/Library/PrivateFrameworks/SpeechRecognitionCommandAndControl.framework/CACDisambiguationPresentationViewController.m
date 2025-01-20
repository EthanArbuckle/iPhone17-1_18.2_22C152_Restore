@interface CACDisambiguationPresentationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (CACContactDisambiguationPresentationViewControllerDelegate)contactDisambiguationDelegate;
- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3;
- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3 message:(id)a4;
- (NSString)alertTitle;
- (UIAlertController)alertController;
- (id)actionForItem:(id)a3;
- (id)newActionCustomContentView:(id)a3;
- (id)newAlertControllerWithTitle:(id)a3 message:(id)a4;
- (int64_t)zOrder;
- (void)performHideWithCompletion:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setContactDisambiguationDelegate:(id)a3;
- (void)setDisambiguationItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACDisambiguationPresentationViewController

- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3
{
  return [(CACDisambiguationPresentationViewController *)self initWithTitle:a3 message:0];
}

- (CACDisambiguationPresentationViewController)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACDisambiguationPresentationViewController;
  v8 = [(CACDisambiguationPresentationViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(CACDisambiguationPresentationViewController *)v8 newAlertControllerWithTitle:v6 message:v7];
    alertController = v9->_alertController;
    v9->_alertController = (UIAlertController *)v10;
  }
  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACDisambiguationPresentationViewController;
  [(CACDisambiguationPresentationViewController *)&v5 viewDidAppear:a3];
  v4 = [(CACDisambiguationPresentationViewController *)self alertController];
  [(CACDisambiguationPresentationViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CACDisambiguationPresentationViewController *)self alertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  v6.receiver = self;
  v6.super_class = (Class)CACDisambiguationPresentationViewController;
  [(CACDisambiguationPresentationViewController *)&v6 viewWillDisappear:v3];
}

- (void)setDisambiguationItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_disambiguationItems, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(CACDisambiguationPresentationViewController *)self actionForItem:*(void *)(*((void *)&v18 + 1) + 8 * v10)];
        v12 = [(CACDisambiguationPresentationViewController *)self alertController];
        [v12 addAction:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  objc_super v13 = (void *)MEMORY[0x263F82400];
  v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__CACDisambiguationPresentationViewController_setDisambiguationItems___block_invoke;
  v17[3] = &unk_264D115F8;
  v17[4] = self;
  v15 = [v13 actionWithTitle:v14 style:1 handler:v17];

  v16 = [(CACDisambiguationPresentationViewController *)self alertController];
  [v16 addAction:v15];
}

uint64_t __70__CACDisambiguationPresentationViewController_setDisambiguationItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performHideWithCompletion:0];
}

- (id)newAlertControllerWithTitle:(id)a3 message:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionForItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(CACDisambiguationPresentationViewController *)self newActionCustomContentView:v4];
  [v5 setView:v6];

  uint64_t v7 = [v5 view];

  uint64_t v8 = (void *)MEMORY[0x263F82400];
  if (v7)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke;
    v17[3] = &unk_264D11620;
    uint64_t v9 = &v18;
    v17[4] = self;
    id v18 = v4;
    id v10 = v4;
    v11 = [v8 _actionWithContentViewController:v5 style:0 handler:v17];
  }
  else
  {
    v12 = [v4 displayName];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_3;
    v15[3] = &unk_264D11620;
    uint64_t v9 = &v16;
    v15[4] = self;
    id v16 = v4;
    id v13 = v4;
    v11 = [v8 actionWithTitle:v12 style:0 handler:v15];
  }
  return v11;
}

void __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_2;
  v2[3] = &unk_264D115D0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performHideWithCompletion:v2];
}

uint64_t __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startInteraction];
}

void __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_4;
  v2[3] = &unk_264D115D0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performHideWithCompletion:v2];
}

uint64_t __61__CACDisambiguationPresentationViewController_actionForItem___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startInteraction];
}

- (id)newActionCustomContentView:(id)a3
{
  v36[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 type];
  if ((unint64_t)(v4 - 1) < 2)
  {
    id v6 = off_264D10AB8;
    goto LABEL_6;
  }
  id v5 = 0;
  if (v4)
  {
    if (v4 != 3)
    {
LABEL_7:
      uint64_t v7 = [v3 displayName];
      uint64_t v8 = [v5 textLabel];
      [v8 setText:v7];

      uint64_t v9 = [v3 displayDescription];
      id v10 = [v5 detailTextLabel];
      [v10 setText:v9];

      v11 = [v3 displayImage];
      v12 = [v5 imageView];
      [v12 setImage:v11];

      LODWORD(v13) = 1112014848;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8), v13, v14);
      double v16 = v15;
      v17 = [v5 heightAnchor];
      v34 = [v17 constraintLessThanOrEqualToConstant:v16];

      [v34 setActive:1];
      id v35 = v3;
      id v18 = objc_opt_new();
      [v18 addSubview:v5];
      v28 = (void *)MEMORY[0x263F08938];
      v33 = [v5 leadingAnchor];
      v32 = [v18 leadingAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v36[0] = v31;
      v30 = [v5 trailingAnchor];
      v29 = [v18 trailingAnchor];
      long long v19 = [v30 constraintEqualToAnchor:v29];
      v36[1] = v19;
      long long v20 = [v5 centerYAnchor];
      long long v21 = [v18 centerYAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v36[2] = v22;
      uint64_t v23 = [v18 heightAnchor];
      v24 = [v5 heightAnchor];
      v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];
      v36[3] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
      [v28 activateConstraints:v26];

      id v5 = v18;
      id v3 = v35;
      goto LABEL_8;
    }
    id v6 = off_264D10A68;
LABEL_6:
    id v5 = (void *)[objc_alloc(*v6) initWithStyle:0 reuseIdentifier:0];
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)zOrder
{
  return 15;
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)performHideWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisambiguationPresentationViewController *)self contactDisambiguationDelegate];
  [v5 dialDiambiguationPresentationViewController:self hideWithCompletion:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACContactDisambiguationPresentationViewControllerDelegate)contactDisambiguationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDisambiguationDelegate);
  return (CACContactDisambiguationPresentationViewControllerDelegate *)WeakRetained;
}

- (void)setContactDisambiguationDelegate:(id)a3
{
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_destroyWeak((id *)&self->_contactDisambiguationDelegate);
  objc_storeStrong((id *)&self->_disambiguationItems, 0);
}

@end