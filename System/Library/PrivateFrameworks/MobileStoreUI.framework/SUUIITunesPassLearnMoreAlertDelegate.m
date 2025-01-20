@interface SUUIITunesPassLearnMoreAlertDelegate
+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4;
+ (void)beginThrottleInterval;
- (SUUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4;
- (UIViewController)presentingViewController;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)setPresentingViewController:(id)a3;
- (void)show;
@end

@implementation SUUIITunesPassLearnMoreAlertDelegate

- (SUUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIITunesPassLearnMoreAlertDelegate;
  v9 = [(SUUIITunesPassLearnMoreAlertDelegate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_redeemConfiguration, a3);
  }

  return v10;
}

+ (void)beginThrottleInterval
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setDouble:@"SUUILastITunesPassLearnMoreAlertTime" forKey:CFAbsoluteTimeGetCurrent()];
  [v2 synchronize];
}

+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  v6 = [a4 ITunesPassConfiguration];
  id v7 = [v6 learnMoreAlertView];

  [v5 ITunesPassLearnMoreAlertInterval];
  double v9 = v8;

  if (v9 >= 0.0)
  {
    v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_super v12 = [v11 objectForKey:@"SUUILastITunesPassLearnMoreAlertTime"];

    if (objc_opt_respondsToSelector())
    {
      v13 = (void *)MEMORY[0x263EFF910];
      [v12 doubleValue];
      v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      [v14 timeIntervalSinceNow];
      if (v15 > -v9)
      {

        id v7 = 0;
      }
    }
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10 != 0;
}

- (void)show
{
  v3 = [(SUUIRedeemConfiguration *)self->_redeemConfiguration ITunesPassConfiguration];
  id object = [v3 learnMoreAlertView];

  [object setDelegate:self];
  objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.SUUIITunesPassLearnMoreAlertDelegate", self, (void *)1);
  [object show];
  [(id)objc_opt_class() beginThrottleInterval];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id object = a3;
  if ([object cancelButtonIndex] != a4)
  {
    v6 = [(SUUIITunesPassLearnMoreAlertDelegate *)self presentingViewController];
    if (v6)
    {
      id v7 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
      [(SUUIRedeemStepViewController *)v7 setClientContext:self->_clientContext];
      [(SUUIRedeemStepViewController *)v7 setConfiguration:self->_redeemConfiguration];
      double v8 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v7];
      [v6 presentViewController:v8 animated:1 completion:0];
    }
  }
  [object setDelegate:0];
  objc_setAssociatedObject(object, "com.apple.iTunesStoreUI.SUUIITunesPassLearnMoreAlertDelegate", 0, (void *)1);
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

@end