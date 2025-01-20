@interface VUIOfferUtilities
+ (void)_handleOfferDataSource:(id)a3 appContext:(id)a4;
+ (void)fetchAndPresentOffer:(id)a3 sourceEvent:(id)a4 completion:(id)a5;
+ (void)registerDeviceForCommerceOffers;
@end

@implementation VUIOfferUtilities

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:@"offersInterface"];
  v4 = v3;
  if (v3 && [v3 hasProperty:@"onProcessOffers"])
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v5 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F1CC28];
    }
    v20[0] = @"isInFullScreenPlayback";
    v20[1] = @"isBusyLoadingSharedWatch";
    if (*(unsigned char *)(a1 + 65)) {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    v21[0] = v5;
    v21[1] = v6;
    v20[2] = @"eventSource";
    v7 = @"Unknown";
    if (*(void *)(a1 + 32)) {
      v7 = *(__CFString **)(a1 + 32);
    }
    v21[2] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    v19[0] = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_2;
    aBlock[3] = &unk_1E6DFC2E0;
    id v17 = *(id *)(a1 + 40);
    long long v15 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v15;
    long long v18 = v15;
    v10 = _Block_copy(aBlock);
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v12 = (id)[v4 invokeMethod:@"onProcessOffers" withArguments:v11];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"VUIJSOfferdidFinishProcessing" object:0];
  }
}

+ (void)fetchAndPresentOffer:(id)a3 sourceEvent:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = VUISignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.FetchAndPresentOffer", "", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"VUIJSOfferdidStartProcessing" object:0];

  uint64_t v13 = +[VUIPlaybackManager sharedInstance];
  char v14 = [v13 isFullscreenPlaybackUIBeingShown];

  long long v15 = +[VUIInterfaceFactory sharedInstance];
  v16 = [v15 openURLHandler];
  char v17 = [v16 isLoadingSharedWatchURL];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke;
  v21[3] = &unk_1E6DFC308;
  char v26 = v14;
  char v27 = v17;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v25 = a1;
  id v18 = v10;
  id v19 = v8;
  id v20 = v9;
  [v19 evaluate:v21];
}

uint64_t __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_3(void *a1)
{
  +[VideosUI handleUpsellPresented:0];
  uint64_t v2 = a1[4];
  if (v2)
  {
    v3 = +[VUIOpenURLRouterDataSource routerDataSourceWithDict:v2 appContext:a1[5]];
    BOOL v4 = v3 != 0;
    if (v3)
    {
      +[VideosUI handleUpsellPresented:1];
      uint64_t v5 = [v3 action];
      uint64_t v6 = v5;
      if (v5)
      {
        [v5 performWithTargetResponder:0 completionHandler:&__block_literal_global_140];
      }
      else
      {
        v7 = VUIDefaultLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)char v14 = 0;
          _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "Processing valid offer router data source", v14, 2u);
        }

        [(id)objc_opt_class() _handleOfferDataSource:v3 appContext:a1[5]];
      }
    }
    else
    {
      uint64_t v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "Invalid offer router data source", v13, 2u);
      }
    }
  }
  else
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Empty offer router data source", buf, 2u);
    }
    BOOL v4 = 0;
  }

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"VUIJSOfferdidFinishProcessing" object:0];

  id v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.FetchAndPresentOffer", "", v11, 2u);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v4);
  }
  return result;
}

+ (void)registerDeviceForCommerceOffers
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"hasRegisterdDeviceForOffer"];

  if (v3)
  {
    BOOL v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Already registered the device for offers.", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    BOOL v4 = objc_msgSend(v5, "ams_activeiTunesAccount");

    if (v4)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4DC50]) initWithAccount:v4 bag:v6];
      id v8 = [v7 perform];
      [v8 addFinishBlock:&__block_literal_global_38_1];
    }
    else
    {
      uint64_t v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUIOfferUtilities - No account is signed in, skipping device offer registration.", v9, 2u);
      }
    }
  }
}

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_3;
  block[3] = &unk_1E6DFC2B8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_4()
{
  v0 = VUIDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E2BD7000, v0, OS_LOG_TYPE_INFO, "Processed offer action data source", v1, 2u);
  }
}

void __52__VUIOfferUtilities_registerDeviceForCommerceOffers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Error running the device offer registration. %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Registered the device for offers.", (uint8_t *)&v6, 2u);
    }

    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:1 forKey:@"hasRegisterdDeviceForOffer"];
  }
}

+ (void)_handleOfferDataSource:(id)a3 appContext:(id)a4
{
  id v16 = a4;
  BOOL v5 = [a3 documentDataSources];
  int v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = [v6 firstObject];
    uint64_t v8 = +[VUIInterfaceFactory sharedInstance];
    id v9 = [v8 viewControllerWithDocumentDataSource:v7 appContext:v16];

    long long v10 = [v7 uiConfiguration];
  }
  else
  {
    long long v10 = 0;
    id v9 = 0;
  }
  v11 = +[VUITVAppLauncher sharedInstance];
  id v12 = [v11 appController];
  uint64_t v13 = [v12 navigationController];

  if (v9)
  {
    char v14 = +[VUIPlaybackManager sharedInstance];
    [v14 dismissPlaybackAnimated:0 leaveGroupActivitySession:1 completion:0];

    objc_msgSend(v13, "vui_dismissViewControllerAnimated:completion:", 1, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = +[VUIApplicationRouter topPresentedViewController];
      +[VUIPresenterController presentViewController:v9 fromViewController:v15 WithConfiguration:v10 completion:0];
    }
    else
    {
      [v13 pushViewController:v9 animated:0];
    }
  }
}

@end