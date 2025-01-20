@interface TFBetaAppLaunchScreenProvider
+ (id)createBetaAppLaunchViewControllerForIdentifier:(id)a3 hostedIn:(id)a4 withSidepackLaunchInfo:(id)a5;
@end

@implementation TFBetaAppLaunchScreenProvider

+ (id)createBetaAppLaunchViewControllerForIdentifier:(id)a3 hostedIn:(id)a4 withSidepackLaunchInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10 = +[TFLaunchScreenBuilder buildLaunchScreenFromBetaAppLaunchInfo:v9];
  }
  else
  {
    v10 = 0;
  }
  id v21 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v7 allowPlaceholder:0 error:&v21];
  id v12 = v21;
  if (!v11)
  {
    id v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Missing app record for passed bundle identifier" userInfo:0];
    objc_exception_throw(v20);
  }
  v13 = v12;
  v14 = [TFBetaAppLaunchPresenter alloc];
  v15 = [v11 URL];
  v16 = objc_alloc_init(ASDTFBetaAppLaunchDataProvider);
  v17 = [(TFBetaAppLaunchPresenter *)v14 initWithBundleURL:v15 launchDataProvider:v16 launchScreenSidepack:v10];

  v18 = [[TFBetaAppLaunchScreenViewController alloc] initWithPresenter:v17];
  [(TFBetaAppLaunchPresenter *)v17 setPresenterView:v18];
  [(TFBetaAppLaunchScreenViewController *)v18 setLaunchScreenHost:v8];

  return v18;
}

@end