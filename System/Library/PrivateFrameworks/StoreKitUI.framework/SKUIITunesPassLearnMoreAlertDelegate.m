@interface SKUIITunesPassLearnMoreAlertDelegate
+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4;
+ (void)beginThrottleInterval;
- (SKUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4;
- (UIViewController)presentingViewController;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)setPresentingViewController:(id)a3;
- (void)show;
@end

@implementation SKUIITunesPassLearnMoreAlertDelegate

- (SKUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIITunesPassLearnMoreAlertDelegate initWithRedeemConfiguration:clientContext:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIITunesPassLearnMoreAlertDelegate;
  v17 = [(SKUIITunesPassLearnMoreAlertDelegate *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientContext, a4);
    objc_storeStrong((id *)&v18->_redeemConfiguration, a3);
  }

  return v18;
}

+ (void)beginThrottleInterval
{
}

+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:configuration:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v5 ITunesPassConfiguration];
  uint64_t v16 = [v15 learnMoreAlertView];

  [v6 ITunesPassLearnMoreAlertInterval];
  double v18 = v17;

  if (v18 >= 0.0)
  {
    objc_super v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v21 = [v20 objectForKey:@"SKUILastITunesPassLearnMoreAlertTime"];

    if (objc_opt_respondsToSelector())
    {
      v22 = (void *)MEMORY[0x1E4F1C9C8];
      [v21 doubleValue];
      v23 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
      [v23 timeIntervalSinceNow];
      if (v24 > -v18)
      {

        uint64_t v16 = 0;
      }
    }
    v19 = v16;
  }
  else
  {
    v19 = 0;
  }

  return v19 != 0;
}

- (void)show
{
  v3 = [(SKUIRedeemConfiguration *)self->_redeemConfiguration ITunesPassConfiguration];
  id object = [v3 learnMoreAlertView];

  [object setDelegate:self];
  objc_setAssociatedObject(object, "com.apple.StoreKitUI.SKUIITunesPassLearnMoreAlertDelegate", self, (void *)1);
  [object show];
  [(id)objc_opt_class() beginThrottleInterval];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id object = a3;
  if ([object cancelButtonIndex] != a4)
  {
    id v6 = [(SKUIITunesPassLearnMoreAlertDelegate *)self presentingViewController];
    if (v6)
    {
      BOOL v7 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreViewController);
      [(SKUIRedeemStepViewController *)v7 setClientContext:self->_clientContext];
      [(SKUIRedeemStepViewController *)v7 setConfiguration:self->_redeemConfiguration];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
      [v6 presentViewController:v8 animated:1 completion:0];
    }
  }
  [object setDelegate:0];
  objc_setAssociatedObject(object, "com.apple.StoreKitUI.SKUIITunesPassLearnMoreAlertDelegate", 0, (void *)1);
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithRedeemConfiguration:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)shouldShowAlertForRedeem:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end