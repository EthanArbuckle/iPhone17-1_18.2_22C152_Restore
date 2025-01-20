@interface SUUIRedeemResultsViewController
+ (BOOL)canShowResultsForRedeem:(id)a3;
+ (id)redeemResultsControllerForRedeem:(id)a3;
- (SUUIRedeem)redeem;
- (SUUIRedeemResultsViewController)initWithCoder:(id)a3;
- (SUUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUIRedeemResultsViewController)initWithRedeem:(id)a3;
- (int64_t)redeemCategory;
- (void)_doneAction:(id)a3;
- (void)setRedeem:(id)a3;
- (void)setRedeemCategory:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SUUIRedeemResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Your view controller class (%@) MUST override %@ to be considered for showing a redeem", v7, v8 format];

  return 0;
}

+ (id)redeemResultsControllerForRedeem:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      if (objc_msgSend(v9, "canShowResultsForRedeem:", v3, (void)v12)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  v10 = (void *)[objc_alloc((Class)v9) initWithRedeem:v3];

  return v10;
}

- (SUUIRedeemResultsViewController)initWithRedeem:(id)a3
{
  id v5 = a3;
  if ([(SUUIRedeemResultsViewController *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = +[SUUIRedeemResultsViewController redeemResultsControllerForRedeem:v5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIRedeemResultsViewController;
    uint64_t v7 = [(SUUIRedeemResultsViewController *)&v11 initWithNibName:0 bundle:0];
    uint64_t v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_redeem, a3);
    }
    uint64_t v6 = v8;
    self = v6;
  }
  v9 = v6;

  return v9;
}

- (SUUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (SUUIRedeemResultsViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemResultsViewController;
  [(SUUIRedeemResultsViewController *)&v7 viewDidLoad];
  id v3 = [(SUUIRedeemStepViewController *)self clientContext];
  id v4 = [(SUUIRedeemResultsViewController *)self navigationItem];
  [v4 setHidesBackButton:1];
  id v5 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v5 setAction:sel__doneAction_];
  [v5 setTarget:self];
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_SUCCESS_DONE_BUTTON" inTable:@"Redeem"];
  }
  else {
  uint64_t v6 = +[SUUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_DONE_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [v5 setTitle:v6];

  [v5 setStyle:2];
  [v4 setRightBarButtonItem:v5];
}

- (void)_doneAction:(id)a3
{
  if ([(SUUIRedeemStepViewController *)self shouldShowPassbookLearnMore]
    && ([(SUUIRedeemResultsViewController *)self redeem],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(SUUIRedeemStepViewController *)self configuration],
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = +[SUUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:v4 configuration:v5], v5, v4, v6))
  {
    objc_super v7 = [SUUIITunesPassLearnMoreAlertDelegate alloc];
    uint64_t v8 = [(SUUIRedeemStepViewController *)self configuration];
    v9 = [(SUUIRedeemStepViewController *)self clientContext];
    v10 = [(SUUIITunesPassLearnMoreAlertDelegate *)v7 initWithRedeemConfiguration:v8 clientContext:v9];

    objc_super v11 = [(SUUIRedeemResultsViewController *)self presentingViewController];
    [(SUUIITunesPassLearnMoreAlertDelegate *)v10 setPresentingViewController:v11];
  }
  else
  {
    v10 = 0;
  }
  long long v12 = [(SUUIRedeemResultsViewController *)self redeem];
  long long v13 = [v12 redirectURL];

  uint64_t v14 = [(SUUIRedeemResultsViewController *)self parentViewController];
  long long v15 = (void *)v14;
  if (v14) {
    v16 = (SUUIRedeemResultsViewController *)v14;
  }
  else {
    v16 = self;
  }
  v17 = v16;

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__SUUIRedeemResultsViewController__doneAction___block_invoke;
  v20[3] = &unk_265400890;
  id v21 = v13;
  v22 = v10;
  v18 = v10;
  id v19 = v13;
  [(SUUIRedeemResultsViewController *)v17 dismissViewControllerAnimated:1 completion:v20];
}

void __47__SUUIRedeemResultsViewController__doneAction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    SUUIMetricsOpenURL(v2);
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    if (v3) {
      [v3 show];
    }
  }
}

- (SUUIRedeem)redeem
{
  return self->_redeem;
}

- (void)setRedeem:(id)a3
{
}

- (int64_t)redeemCategory
{
  return self->_redeemCategory;
}

- (void)setRedeemCategory:(int64_t)a3
{
  self->_redeemCategory = a3;
}

- (void).cxx_destruct
{
}

@end