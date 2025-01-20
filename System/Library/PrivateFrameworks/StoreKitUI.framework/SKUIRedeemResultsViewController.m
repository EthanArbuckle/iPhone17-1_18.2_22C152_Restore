@interface SKUIRedeemResultsViewController
+ (BOOL)canShowResultsForRedeem:(id)a3;
+ (id)redeemResultsControllerForRedeem:(id)a3;
- (SKUIRedeem)redeem;
- (SKUIRedeemResultsViewController)initWithCoder:(id)a3;
- (SKUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUIRedeemResultsViewController)initWithRedeem:(id)a3;
- (int64_t)redeemCategory;
- (void)_doneAction:(id)a3;
- (void)setRedeem:(id)a3;
- (void)setRedeemCategory:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SKUIRedeemResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIRedeemResultsViewController canShowResultsForRedeem:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = NSStringFromSelector(a2);
  [v12 raise:v13, @"Your view controller class (%@) MUST override %@ to be considered for showing a redeem", v15, v16 format];

  return 0;
}

+ (id)redeemResultsControllerForRedeem:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIRedeemResultsViewController redeemResultsControllerForRedeem:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_7:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
      if (objc_msgSend(v17, "canShowResultsForRedeem:", v3, (void)v20)) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v17 = 0;
  }

  v18 = (void *)[objc_alloc((Class)v17) initWithRedeem:v3];

  return v18;
}

- (SKUIRedeemResultsViewController)initWithRedeem:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIRedeemResultsViewController initWithRedeem:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if ([(SKUIRedeemResultsViewController *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v14 = +[SKUIRedeemResultsViewController redeemResultsControllerForRedeem:v5];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SKUIRedeemResultsViewController;
    uint64_t v15 = [(SKUIRedeemResultsViewController *)&v19 initWithNibName:0 bundle:0];
    uint64_t v16 = v15;
    if (v15) {
      objc_storeStrong((id *)&v15->_redeem, a3);
    }
    uint64_t v14 = v16;
    self = v14;
  }
  v17 = v14;

  return v17;
}

- (SKUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIRedeemResultsViewController initWithNibName:bundle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }

  return 0;
}

- (SKUIRedeemResultsViewController)initWithCoder:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIRedeemResultsViewController initWithCoder:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIRedeemResultsViewController;
  [(SKUIRedeemResultsViewController *)&v7 viewDidLoad];
  id v3 = [(SKUIRedeemStepViewController *)self clientContext];
  BOOL v4 = [(SKUIRedeemResultsViewController *)self navigationItem];
  [v4 setHidesBackButton:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v5 setAction:sel__doneAction_];
  [v5 setTarget:self];
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_SUCCESS_DONE_BUTTON" inTable:@"Redeem"];
  }
  else {
  uint64_t v6 = +[SKUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_DONE_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [v5 setTitle:v6];

  [v5 setStyle:2];
  [v4 setRightBarButtonItem:v5];
}

- (void)_doneAction:(id)a3
{
  if ([(SKUIRedeemStepViewController *)self shouldShowPassbookLearnMore]
    && ([(SKUIRedeemResultsViewController *)self redeem],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        [(SKUIRedeemStepViewController *)self configuration],
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = +[SKUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:v4 configuration:v5], v5, v4, v6))
  {
    objc_super v7 = [SKUIITunesPassLearnMoreAlertDelegate alloc];
    uint64_t v8 = [(SKUIRedeemStepViewController *)self configuration];
    uint64_t v9 = [(SKUIRedeemStepViewController *)self clientContext];
    uint64_t v10 = [(SKUIITunesPassLearnMoreAlertDelegate *)v7 initWithRedeemConfiguration:v8 clientContext:v9];

    uint64_t v11 = [(SKUIRedeemResultsViewController *)self presentingViewController];
    [(SKUIITunesPassLearnMoreAlertDelegate *)v10 setPresentingViewController:v11];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = [(SKUIRedeemResultsViewController *)self redeem];
  uint64_t v13 = [v12 redirectURL];

  uint64_t v14 = [(SKUIRedeemResultsViewController *)self parentViewController];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (SKUIRedeemResultsViewController *)v14;
  }
  else {
    uint64_t v16 = self;
  }
  v17 = v16;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__SKUIRedeemResultsViewController__doneAction___block_invoke;
  v20[3] = &unk_1E6421FF8;
  id v21 = v13;
  long long v22 = v10;
  v18 = v10;
  id v19 = v13;
  [(SKUIRedeemResultsViewController *)v17 dismissViewControllerAnimated:1 completion:v20];
}

void __47__SKUIRedeemResultsViewController__doneAction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    SKUIMetricsOpenURL(v2);
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    if (v3) {
      [v3 show];
    }
  }
}

- (SKUIRedeem)redeem
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

+ (void)canShowResultsForRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)redeemResultsControllerForRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end