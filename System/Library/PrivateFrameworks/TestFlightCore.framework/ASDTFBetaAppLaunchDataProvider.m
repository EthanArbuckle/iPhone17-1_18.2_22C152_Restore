@interface ASDTFBetaAppLaunchDataProvider
- (void)loadLaunchScreenForBundleWithURL:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation ASDTFBetaAppLaunchDataProvider

- (void)loadLaunchScreenForBundleWithURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x263F01878];
  id v7 = a3;
  id v15 = 0;
  v8 = (void *)[[v6 alloc] initWithURL:v7 allowPlaceholder:0 error:&v15];

  id v9 = v15;
  v10 = [v8 bundleIdentifier];
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    v12 = [MEMORY[0x263F25528] sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke;
    v13[3] = &unk_26468EC50;
    id v14 = v5;
    [v12 getLaunchInfoForBundleID:v10 withCompletionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v9);
  }
}

void __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26468EC28;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__ASDTFBetaAppLaunchDataProvider_loadLaunchScreenForBundleWithURL_withCompletionHandler___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    v2 = *(void (**)(void))(a1[6] + 16);
    v2();
  }
  else
  {
    id v3 = +[TFLaunchScreenBuilder buildLaunchScreenFromBetaAppLaunchInfo:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end