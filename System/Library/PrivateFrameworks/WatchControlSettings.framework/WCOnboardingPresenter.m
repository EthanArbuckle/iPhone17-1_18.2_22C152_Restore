@interface WCOnboardingPresenter
+ (void)presentGesturesOverviewFromViewController:(id)a3 withObserver:(id)a4;
+ (void)presentOnboardingFromViewController:(id)a3 withObserver:(id)a4;
@end

@implementation WCOnboardingPresenter

+ (void)presentOnboardingFromViewController:(id)a3 withObserver:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 setOnboardingObserver:v5];

  [v6 presentViewController:v7 animated:1 completion:0];
}

+ (void)presentGesturesOverviewFromViewController:(id)a3 withObserver:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = +[WCGesturesOverviewViewController_iOS createGesturesOverviewViewController];
  [v6 setOnboardingObserver:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v8 navigationController];
    [v7 pushViewController:v6 animated:1];
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v6];
    [v8 presentViewController:v7 animated:1 completion:0];
  }
}

@end