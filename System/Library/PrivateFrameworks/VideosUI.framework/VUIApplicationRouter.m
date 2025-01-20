@interface VUIApplicationRouter
+ (BOOL)_handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7 extraInfo:(id *)a8;
+ (BOOL)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5;
+ (BOOL)handleDocumentDataSource:(id)a3 targetResponder:(id)a4 appContext:(id)a5 documentOptions:(id)a6 completion:(id)a7;
+ (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 routerDataSource:(id)a6 supplementaryData:(id)a7 extraInfo:(id *)a8;
+ (id)_viewControllerWithIdentifier:(id)a3;
+ (id)currentNavigationController;
+ (id)eventDataSourceForEvent:(id)a3 routerDataSource:(id)a4;
+ (id)topMostVisibleViewController;
+ (id)topPresentedViewController;
+ (void)_amsBagURLForKey:(id)a3 withCompletion:(id)a4;
+ (void)_dismissPresentedViewControllerWithCompletion:(id)a3;
+ (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 isModalPresentation:(BOOL)a6 originalNavigationController:(id)a7;
+ (void)_navigateAccountSettingsWithDestinationViewController:(id)a3 shouldEmbedInNavController:(BOOL)a4 isModalPresentation:(BOOL)a5 originalNavigationController:(id)a6;
+ (void)_performForType:(int64_t)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7;
+ (void)dismissOrPopLastViewControllerWithCompletion:(id)a3;
+ (void)dismissOrPopViewControllerWithId:(id)a3 completion:(id)a4;
+ (void)dismissPresentedViewController;
+ (void)invokeAction:(id)a3 primaryAction:(id)a4 targetResponder:(id)a5 completion:(id)a6;
+ (void)invokeAction:(id)a3 targetResponder:(id)a4 completion:(id)a5;
+ (void)pushAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 fromNavigationController:(id)a6;
@end

@implementation VUIApplicationRouter

+ (id)eventDataSourceForEvent:(id)a3 routerDataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (([v5 isEqualToString:@"play"] & 1) != 0
      || [v5 isEqualToString:@"autoPlay"])
    {
      uint64_t v7 = [v6 playEventDataSource];
LABEL_5:
      v8 = (void *)v7;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:@"select"])
    {
      uint64_t v7 = [v6 selectEventDataSource];
      goto LABEL_5;
    }
    if ([v5 isEqualToString:@"contextmenu"])
    {
      uint64_t v7 = [v6 contextMenuEventDataSource];
      goto LABEL_5;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (BOOL)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (+[VUIUtilities isSUIEnabled])
  {
    v9 = +[VUIInterfaceFactory sharedInstance];
    v10 = [v9 controllerPresenter];

    [v10 handleAccountSettingsEventWithUrl:v7 amsBagKey:v8 useAMSWebView:v5];
  }
  else
  {
    +[VUIApplicationRouter _handleAccountSettingsEventWithUrl:v7 amsBagKey:v8 useAMSWebView:v5 isModalPresentation:1 originalNavigationController:0];
  }

  return 0;
}

+ (void)pushAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 fromNavigationController:(id)a6
{
}

+ (BOOL)_handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7 extraInfo:(id *)a8
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F1C9C8] date];
  [v16 timeIntervalSince1970];
  double v18 = v17;

  if (v14)
  {
    [(id)objc_opt_class() _performForType:0 targetResponder:v12 appContext:v13 eventDataSource:v14 documentOptions:v15];
    if (a8)
    {
      if (*a8)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
        [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isHandled"];
        v20 = [MEMORY[0x1E4F28ED0] numberWithLong:(uint64_t)(v18 * 1000.0)];
        [v19 setObject:v20 forKeyedSubscript:@"eventTimeStamp"];

        *a8 = (id)[v19 copy];
      }
      else
      {
        v23[0] = @"isHandled";
        v23[1] = @"eventTimeStamp";
        v24[0] = MEMORY[0x1E4F1CC38];
        v21 = [MEMORY[0x1E4F28ED0] numberWithLong:(uint64_t)(v18 * 1000.0)];
        v24[1] = v21;
        *a8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      }
    }
  }

  return 0;
}

+ (void)_performForType:(int64_t)a3 targetResponder:(id)a4 appContext:(id)a5 eventDataSource:(id)a6 documentOptions:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  switch(a3)
  {
    case 0:
      v16 = [v14 preActionDocumentDataSource];
      double v17 = [v14 preAction];
      uint64_t v18 = 1;
      if (v16) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 1:
      v16 = [v14 documentDataSource];
      double v17 = [v14 action];
      uint64_t v18 = 2;
      if (v16) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 2:
      v16 = [v14 postActionDocumentDataSource];
      double v17 = [v14 postAction];
      uint64_t v18 = 3;
      if (v16)
      {
LABEL_6:
        v38 = v17;
        v19 = v13;
        uint64_t v20 = v18;
        v21 = VUIDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = v12;
          if ((unint64_t)a3 > 2) {
            v22 = @"unknown";
          }
          else {
            v22 = off_1E6DF4A08[a3];
          }
          v28 = objc_msgSend(v16, "uiConfiguration", v36, v38);
          v29 = NSStringFromVUIPresentationType([v28 type]);
          *(_DWORD *)buf = 138412802;
          v56 = v22;
          __int16 v57 = 2112;
          v58 = v16;
          __int16 v59 = 2112;
          v60 = v29;
          _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::performing event [%@] with %@ (%@)", buf, 0x20u);

          id v12 = v37;
        }

        v30 = objc_opt_class();
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke;
        v47[3] = &unk_1E6DF48D0;
        id v48 = v16;
        id v53 = a1;
        uint64_t v54 = v20;
        id v49 = v12;
        id v13 = v19;
        id v50 = v19;
        id v51 = v14;
        id v52 = v15;
        id v31 = v16;
        [v30 handleDocumentDataSource:v31 targetResponder:v49 appContext:v50 documentOptions:v52 completion:v47];
      }
      else
      {
LABEL_10:
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v15 objectForKeyedSubscript:@"playlistCollectionViewModel"];
            [v17 setCollectionViewModel:v23];
          }
          v24 = VUIDefaultLogObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)a3 > 2) {
              v25 = @"unknown";
            }
            else {
              v25 = off_1E6DF4A08[a3];
            }
            *(_DWORD *)buf = 138412546;
            v56 = v25;
            __int16 v57 = 2112;
            v58 = v17;
            _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::performing event [%@] with %@", buf, 0x16u);
          }

          uint64_t v32 = [v14 action];
          v33 = (void *)v32;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_63;
          v39[3] = &unk_1E6DF48F8;
          if (v32) {
            v34 = (void *)v32;
          }
          else {
            v34 = v17;
          }
          id v40 = v17;
          id v45 = a1;
          uint64_t v46 = v18;
          id v41 = v12;
          id v42 = v13;
          id v43 = v14;
          id v44 = v15;
          id v35 = v17;
          +[VUIApplicationRouter invokeAction:v35 primaryAction:v34 targetResponder:v41 completion:v39];
        }
        else
        {
LABEL_16:
          v26 = VUIDefaultLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)a3 > 2) {
              v27 = @"unknown";
            }
            else {
              v27 = off_1E6DF4A08[a3];
            }
            *(_DWORD *)buf = 138412546;
            v56 = v27;
            __int16 v57 = 2112;
            v58 = 0;
            _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::skipping empty event [%@] with %@", buf, 0x16u);
          }

          [(id)objc_opt_class() _performForType:v18 targetResponder:v12 appContext:v13 eventDataSource:v14 documentOptions:v15];
        }
      }
LABEL_31:

      return;
    case 3:
      goto LABEL_31;
    default:
      uint64_t v18 = 3;
      goto LABEL_16;
  }
}

void __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter:: %@ handled", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_58;
  v5[3] = &unk_1E6DF48A8;
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = v4;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_58(void *a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = a1[9];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  return [v2 _performForType:v3 targetResponder:v4 appContext:v5 eventDataSource:v6 documentOptions:v7];
}

void __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_63(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v5 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter:: %@ complete with success: %@", buf, 0x16u);
  }

  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_70;
    v8[3] = &unk_1E6DF48A8;
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = v7;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __99__VUIApplicationRouter__performForType_targetResponder_appContext_eventDataSource_documentOptions___block_invoke_70(void *a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = a1[9];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  return [v2 _performForType:v3 targetResponder:v4 appContext:v5 eventDataSource:v6 documentOptions:v7];
}

+ (void)invokeAction:(id)a3 targetResponder:(id)a4 completion:(id)a5
{
}

+ (void)invokeAction:(id)a3 primaryAction:(id)a4 targetResponder:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isAccountRequired]
    && !+[VUIAuthenticationManager userHasActiveAccount]
    && +[VUIAuthenticationManager allowsAccountModification])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_2;
    v18[3] = &unk_1E6DF4920;
    uint64_t v13 = &v19;
    id v19 = v9;
    id v20 = v11;
    id v22 = v12;
    id v14 = v10;
    id v21 = v14;
    id v15 = v12;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:v18];
    uint64_t v16 = VUIDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::Authentication requested for action: %@", buf, 0xCu);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke;
    v23[3] = &unk_1E6DF3D80;
    uint64_t v13 = &v24;
    id v24 = v12;
    id v17 = v12;
    [v9 performWithTargetResponder:v11 completionHandler:v23];
  }
}

uint64_t __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_3;
    v10[3] = &unk_1E6DF3D80;
    id v11 = *(id *)(a1 + 56);
    [v6 performWithTargetResponder:v7 completionHandler:v10];
  }
  else
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIApplicationRouter - VUIApplicationRouter::Authentication request failed for action: %@, error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __78__VUIApplicationRouter_invokeAction_primaryAction_targetResponder_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_navigateAccountSettingsWithDestinationViewController:(id)a3 shouldEmbedInNavController:(BOOL)a4 isModalPresentation:(BOOL)a5 originalNavigationController:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  if (!a6 || a5)
  {
    id v10 = [a1 currentNavigationController];
    id v11 = v10;
    if (v8)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
      [v12 setModalPresentationStyle:2];
      [v11 presentViewController:v12 animated:1 completion:0];
    }
    else
    {
      [v10 setModalPresentationStyle:2];
      [v11 presentViewController:v13 animated:1 completion:0];
    }
  }
  else
  {
    [a6 pushViewController:v13 animated:1];
  }
}

+ (void)_amsBagURLForKey:(id)a3 withCompletion:(id)a4
{
  uint64_t v9 = (void (**)(id, void *))a4;
  id v5 = (void *)MEMORY[0x1E4FA9C70];
  id v6 = a3;
  uint64_t v7 = [v5 app];
  BOOL v8 = [v7 urlForKey:v6];

  if (v9) {
    v9[2](v9, v8);
  }
}

+ (void)_handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5 isModalPresentation:(BOOL)a6 originalNavigationController:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12)
  {
    if (v9)
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      id v17 = objc_msgSend(v16, "ams_activeiTunesAccount");

      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F4E028]) initWithBag:v15 account:v17 clientInfo:0];
      id v19 = +[VUIMetricsController sharedInstance];
      id v20 = [v19 getMetricsOverlayForWebContainer];

      [v18 setMetricsOverlay:v20];
      id v21 = (id)[v18 loadURL:v12];
      [a1 _navigateAccountSettingsWithDestinationViewController:v18 shouldEmbedInNavController:1 isModalPresentation:v8 originalNavigationController:v14];
    }
    else
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F3C2A0]) initWithAccountURL:v12];
      uint64_t v27 = +[VUIInterfaceFactory sharedInstance];
      v28 = [v27 openURLHandler];
      int v29 = [v28 isRedeemURL:v12];

      if (v29)
      {
        v30 = +[SKAccountPageHandler sharedInstance];
        [v15 setDelegate:v30];
      }
      [a1 _navigateAccountSettingsWithDestinationViewController:v15 shouldEmbedInNavController:0 isModalPresentation:v8 originalNavigationController:v14];
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([v13 length])
  {
    if (!v9)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke;
      v31[3] = &unk_1E6DF4970;
      id v33 = a1;
      BOOL v34 = v8;
      id v32 = v14;
      [a1 _amsBagURLForKey:v13 withCompletion:v31];

      goto LABEL_11;
    }
    id v15 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    id v22 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v23 = objc_msgSend(v22, "ams_activeiTunesAccount");

    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F4E028]) initWithBag:v15 account:v23 clientInfo:0];
    v25 = [v15 URLForKey:v13];
    id v26 = (id)[v24 loadBagValue:v25];

    [a1 _navigateAccountSettingsWithDestinationViewController:v24 shouldEmbedInNavController:1 isModalPresentation:v8 originalNavigationController:v14];
    goto LABEL_10;
  }
LABEL_11:
}

void __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke_2;
  block[3] = &unk_1E6DF4948;
  id v8 = v3;
  char v10 = *(unsigned char *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __132__VUIApplicationRouter__handleAccountSettingsEventWithUrl_amsBagKey_useAMSWebView_isModalPresentation_originalNavigationController___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F3C2A0]) initWithAccountURL:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _navigateAccountSettingsWithDestinationViewController:v2 shouldEmbedInNavController:0 isModalPresentation:*(unsigned __int8 *)(a1 + 56) originalNavigationController:*(void *)(a1 + 40)];
}

+ (BOOL)handleDocumentDataSource:(id)a3 targetResponder:(id)a4 appContext:(id)a5 documentOptions:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(id)objc_opt_class() topPresentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v16 dismissViewControllerAnimated:1 completion:0];
    uint64_t v17 = [(id)objc_opt_class() topPresentedViewController];

    id v16 = (id)v17;
  }
  uint64_t v18 = [v11 uiConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v14)
    {
      uint64_t v19 = [v14 mutableCopy];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v35 = (void *)v19;
    id v75 = v14;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v35 setObject:v12 forKey:@"sourceView"];
      }
    }
    id v36 = v12;
    v37 = +[VUIInterfaceFactory sharedInstance];
    v38 = (void *)[v35 copy];
    id v39 = v13;
    id v40 = [v37 viewControllerWithDocumentDataSource:v11 appContext:v13 documentOptions:v38];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v71 = v15;
      uint64_t v41 = [v16 vuiPresentedViewController];
      if (v41)
      {
        id v42 = (void *)v41;
        id v43 = [v16 vuiPresentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v45 = [v16 vuiPresentedViewController];

          id v16 = (id)v45;
        }
      }
      id v12 = v36;
      id v46 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v47 = v36;
      }
      else {
        id v47 = 0;
      }
      [v46 setSourceView:v47];

      id v15 = v71;
      if (!v40) {
        goto LABEL_36;
      }
    }
    else
    {
      id v12 = v36;
      if (!v40)
      {
LABEL_36:

        BOOL v48 = 1;
        BOOL v34 = v39;
        id v14 = v75;
        goto LABEL_49;
      }
    }
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __103__VUIApplicationRouter_handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke;
    v84[3] = &unk_1E6DF3D80;
    id v85 = v15;
    +[VUIPresenterController presentViewController:v40 fromViewController:v16 WithConfiguration:v18 completion:v84];

    goto LABEL_36;
  }
  if ([v18 type] == 6
    || [v18 type] == 8
    || [v18 type] == 7
    || [v18 type] == 10
    || [v18 type] == 16
    || [v18 type] == 12)
  {
    id v20 = (void (**)(void))v15;
    id v74 = v12;
    id v21 = v13;
    uint64_t v22 = [v16 vuiPresentedViewController];
    if (v22)
    {
      v23 = (void *)v22;
      id v24 = [v16 vuiPresentedViewController];
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (v25)
      {
        uint64_t v26 = [v16 vuiPresentedViewController];

        id v16 = (id)v26;
      }
    }
    uint64_t v27 = [v18 viewControllerIdentifier];
    if (v27)
    {
      v28 = (void *)v27;
      int v29 = [v18 viewControllerIdentifier];
      uint64_t v30 = [v29 length];

      if (v30)
      {
        id v31 = objc_opt_class();
        id v32 = [v18 viewControllerIdentifier];
        uint64_t v33 = [v31 _viewControllerWithIdentifier:v32];

        id v16 = (id)v33;
      }
    }
    BOOL v34 = v21;
    id v15 = v20;
    if (v16)
    {
      if ([v18 type] == 8)
      {
        +[VUIPresenterController popOrDismissViewController:v16 completion:v20];
LABEL_40:
        BOOL v48 = 1;
LABEL_48:
        id v12 = v74;
        goto LABEL_49;
      }
      if ([v18 type] == 12 || objc_msgSend(v18, "type") == 16)
      {
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __103__VUIApplicationRouter_handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke_2;
        v77[3] = &unk_1E6DF4998;
        id v78 = v18;
        id v79 = v11;
        id v80 = v21;
        id v81 = v14;
        id v16 = v16;
        id v82 = v16;
        v83 = v20;
        +[VUIPresenterController popOrDismissViewController:v16 completion:v77];

        goto LABEL_40;
      }
      if ([v18 type] == 6)
      {
        +[VUIPresenterController popViewController:v16 completion:v20];
        goto LABEL_40;
      }
      if ([v18 type] == 7)
      {
        id v49 = +[VUIPlaybackManager sharedInstance];
        int v50 = [v49 isShowingExtras];

        if (!v50) {
          goto LABEL_46;
        }
        id v51 = +[VUIPlaybackManager sharedInstance];
        v72 = [v51 extrasNavigationController];

        id v52 = [v72 topViewController];
        id v53 = [v52 presentedViewController];
        uint64_t v54 = [v53 presentedViewController];
        v55 = [v54 presentedViewController];

        BOOL v34 = v21;
        if (!v55)
        {
          id v15 = v20;
          v20[2](v20);
        }
        else
        {
LABEL_46:
          id v15 = v20;
          +[VUIPresenterController dismissViewController:v16 completion:v20];
        }
        goto LABEL_40;
      }
    }
    BOOL v48 = 0;
    goto LABEL_48;
  }
  id v73 = v15;
  uint64_t v57 = [v18 type];
  if (v57 == 15) {
    [v11 setShouldUseZoomTransition:1];
  }
  BOOL v76 = v57 == 15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v58 = v16;
  }
  else {
    v58 = 0;
  }
  id v70 = v58;
  __int16 v59 = [v70 viewControllers];
  BOOL v60 = [v59 count] == 1;

  uint64_t v61 = [v11 uiConfiguration];
  [v61 setIsComingFromRoot:v60];

  v62 = +[VUIInterfaceFactory sharedInstance];
  id v69 = v13;
  v68 = [v62 viewControllerWithDocumentDataSource:v11 appContext:v13 documentOptions:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v63 = v12;
  }
  else {
    v63 = 0;
  }
  id v64 = v63;
  v65 = [v11 contextData];
  v67 = [v65 contextDataDict];

  v66 = [v67 objectForKeyedSubscript:@"presentationSourceID"];
  id v15 = v73;
  +[VUIPresenterController pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:](VUIPresenterController, "pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:", v68, v70, v76, v64, v66, [v18 isAnimated], v73);

  BOOL v34 = v69;
  BOOL v48 = 1;
LABEL_49:

  return v48;
}

uint64_t __103__VUIApplicationRouter_handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __103__VUIApplicationRouter_handleDocumentDataSource_targetResponder_appContext_documentOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) type];
  if (v2 == 16) {
    [*(id *)(a1 + 40) setShouldUseZoomTransition:1];
  }
  id v3 = +[VUIInterfaceFactory sharedInstance];
  id v7 = [v3 viewControllerWithDocumentDataSource:*(void *)(a1 + 40) appContext:*(void *)(a1 + 48) documentOptions:*(void *)(a1 + 56)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = *(void **)(a1 + 64);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v7)
  {
    +[VUIPresenterController pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:](VUIPresenterController, "pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:", v7, v5, v2 == 16, 0, 0, [*(id *)(a1 + 32) isAnimated], *(void *)(a1 + 72));
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

+ (void)dismissPresentedViewController
{
}

+ (void)dismissOrPopViewControllerWithId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke;
  aBlock[3] = &unk_1E6DF49C0;
  id v7 = v5;
  id v14 = v7;
  id v8 = (void (**)(void))v6;
  id v15 = v8;
  long long v9 = (uint64_t (**)(void))_Block_copy(aBlock);
  if (!+[VUIUtilities isSUIEnabled] || (v9[2](v9) & 1) == 0)
  {
    char v10 = [(id)objc_opt_class() _viewControllerWithIdentifier:v7];
    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke_2;
      v11[3] = &unk_1E6DF3DD0;
      id v12 = v8;
      +[VUIPresenterController popOrDismissViewController:v10 completion:v11];
    }
    else if (v8)
    {
      v8[2](v8);
    }
  }
}

uint64_t __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VUIInterfaceFactory sharedInstance];
  id v3 = [v2 controllerPresenter];

  if (v3 && [*(id *)(a1 + 32) length]) {
    uint64_t v4 = [v3 dismissViewControllerWithID:*(void *)(a1 + 32) animated:1 completion:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __68__VUIApplicationRouter_dismissOrPopViewControllerWithId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)dismissOrPopLastViewControllerWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() topPresentedViewController];
  +[VUIPresenterController popOrDismissViewController:v4 completion:v3];
}

+ (void)_dismissPresentedViewControllerWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = +[VUITVAppLauncher sharedInstance];
  id v5 = [v4 appController];

  id v6 = [v5 navigationController];
  id v7 = [v6 vuiPresentedViewController];

  if (v7)
  {
    id v8 = [v6 vuiPresentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v10 = [v6 vuiPresentedViewController];
    id v11 = v10;
    if (isKindOfClass)
    {
      uint64_t v12 = [v10 topViewController];

      id v11 = (void *)v12;
    }
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [MEMORY[0x1E4FB3CF0] sharedInstance];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke;
        v17[3] = &unk_1E6DF49E8;
        id v14 = (id *)&v18;
        uint64_t v18 = v3;
        [v13 dismissViewController:v11 animated:1 completion:v17];
      }
      else
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke_2;
        v15[3] = &unk_1E6DF3DD0;
        id v14 = (id *)&v16;
        id v16 = v3;
        objc_msgSend(v6, "vui_dismissViewControllerAnimated:completion:", 1, v15);
      }
    }
  }
  else if (v3)
  {
    v3[2](v3);
  }
}

uint64_t __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__VUIApplicationRouter__dismissPresentedViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)currentNavigationController
{
  uint64_t v2 = +[VUITVAppLauncher sharedInstance];
  id v3 = [v2 appController];

  id v4 = [v3 navigationController];

  if (v4)
  {
    id v5 = [v3 navigationController];
    goto LABEL_11;
  }
  id v6 = +[VUICurrentSiriNavControllerContainer sharedInstance];
  id v7 = [v6 currentSiriNavController];

  if (v7)
  {
    id v8 = +[VUICurrentSiriNavControllerContainer sharedInstance];
    uint64_t v9 = [v8 currentSiriNavController];
  }
  else
  {
    char v10 = +[VUITVAppLauncher sharedInstance];
    id v8 = [v10 rootViewController];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 conformsToProtocol:&unk_1F3F5D0F8])
    {
      id v5 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = [v8 currentNavigationController];
  }
  id v5 = (void *)v9;
LABEL_10:

LABEL_11:
  return v5;
}

+ (id)topPresentedViewController
{
  uint64_t v2 = [(id)objc_opt_class() currentNavigationController];
  uint64_t v3 = [v2 vuiPresentedViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    while (1)
    {
      id v5 = [v2 vuiPresentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      id v7 = [v2 vuiPresentedViewController];

      id v4 = [v7 vuiPresentedViewController];
      uint64_t v2 = v7;
      if (!v4) {
        goto LABEL_7;
      }
    }
  }
  id v7 = v2;
LABEL_7:
  return v7;
}

+ (id)topMostVisibleViewController
{
  if (+[VUIUtilities isSUIEnabled])
  {
    uint64_t v2 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v3 = [v2 rootPresentingViewController];
    id v4 = __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v3, v3);
  }
  else
  {
    uint64_t v2 = [(id)objc_opt_class() topPresentedViewController];
    id v4 = __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v2, v2);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 vuiSelectedViewController];
    uint64_t v6 = __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke((uint64_t)v5, v5);

    id v4 = (void *)v6;
  }
  return v4;
}

id __52__VUIApplicationRouter_topMostVisibleViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 vuiPresentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [v2 vuiPresentedViewController];

      id v5 = [v4 vuiPresentedViewController];

      id v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 visibleViewController];

    id v4 = (void *)v6;
  }
  return v4;
}

+ (id)_viewControllerWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() currentNavigationController];
  if (v4)
  {
    while (1)
    {
      id v5 = [v4 vuiChildViewControllers];
      if ([v5 count]) {
        break;
      }
LABEL_10:
      uint64_t v9 = [v4 vuiPresentedViewController];

      id v4 = (void *)v9;
      if (!v9)
      {
        id v10 = 0;
        id v4 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v5 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 vuiViewControllerIdentifier];
      }
      else
      {
        id v8 = 0;
      }
      if ([v8 length] && objc_msgSend(v8, "isEqualToString:", v3)) {
        break;
      }

      if (++v6 >= (unint64_t)[v5 count]) {
        goto LABEL_10;
      }
    }
    if ([v5 indexOfObject:v7]
      || ([v4 vuiPresentingViewController],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          id v11 = v4,
          !v12))
    {
      id v11 = v7;
    }
    id v10 = v11;
  }
  else
  {
    id v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 appContext:(id)a5 routerDataSource:(id)a6 supplementaryData:(id)a7 extraInfo:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(id)objc_opt_class() eventDataSourceForEvent:v17 routerDataSource:v14];

  LOBYTE(a8) = [(id)objc_opt_class() _handleEvent:v17 targetResponder:v16 appContext:v15 eventDataSource:v18 documentOptions:v13 extraInfo:a8];
  return (char)a8;
}

@end