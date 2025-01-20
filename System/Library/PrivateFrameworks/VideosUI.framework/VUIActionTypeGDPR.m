@interface VUIActionTypeGDPR
- (NSDictionary)contextData;
- (VUIActionTypeGDPR)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setContextData:(id)a3;
@end

@implementation VUIActionTypeGDPR

- (VUIActionTypeGDPR)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIActionTypeGDPR;
  v9 = [(VUIActionTypeGDPR *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
  }

  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[VUITVAppLauncher sharedInstance];
  v9 = [v8 appController];

  v10 = [v9 navigationController];
  objc_initWeak(&location, self);
  v11 = +[VUIMetricsController sharedInstance];
  v22[0] = @"targetId";
  v22[1] = @"targetType";
  v23[0] = @"continue";
  v23[1] = @"button";
  v22[2] = @"actionType";
  v22[3] = @"dialogId";
  v23[2] = @"gdprConsent";
  v23[3] = @"GDPR";
  v22[4] = @"dialogType";
  v23[4] = @"GDPR";
  objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
  [v11 recordClick:v12];

  v13 = +[VUIMetricsController sharedInstance];
  [v13 forceGDPRConsentStatus:1];

  v14 = [MEMORY[0x1E4F28C40] defaultCenter];
  objc_msgSend(v14, "vui_postNotificationName:object:userInfo:", @"VUIGDPRUserDidConsentNotification", 0, 0);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke;
  v17[3] = &unk_1E6DF6608;
  id v15 = v10;
  id v18 = v15;
  v19 = self;
  id v16 = v7;
  id v20 = v16;
  +[VUIGDPRPresentationManager acceptGDPRAndSyncWithServers:v17];

  objc_destroyWeak(&location);
}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v6 = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_2;
  id v7 = &unk_1E6DF4510;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  id v8 = v2;
  uint64_t v9 = v3;
  id v10 = v4;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v6(block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_2(void *a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_3;
  v11[3] = &unk_1E6DF4AD0;
  id v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[6];
  v11[4] = a1[5];
  id v12 = v3;
  [v2 dismissViewControllerAnimated:1 completion:v11];
  v4 = +[VUIInterfaceFactory sharedInstance];
  v5 = [v4 openURLHandler];
  char v6 = [v5 openedByDeeplink];

  if ((v6 & 1) == 0)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIApplicationActionRouter - GDPR Accept Button -- Check if there is any pending offer to spend", v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
    +[VUIOfferUtilities fetchAndPresentOffer:WeakRetained sourceEvent:@"AppLaunch" completion:0];
  }
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  dispatch_async(v9, &__block_literal_global_42);
}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v2 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v3 = [v2 openURLHandler];
  [v3 handleDeferredURLWithAppContext:WeakRetained];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
}

uint64_t __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_8()
{
  return +[VideosUI initializeGroupActivities];
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end