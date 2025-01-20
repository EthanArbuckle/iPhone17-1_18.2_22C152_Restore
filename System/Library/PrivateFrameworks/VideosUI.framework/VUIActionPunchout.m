@interface VUIActionPunchout
- (BOOL)_isValidAppInstalled;
- (BOOL)canPerformNow;
- (BOOL)isAccountRequired;
- (BOOL)isAdultContent;
- (BOOL)isEntitledToPlay;
- (BOOL)isPlaybackURL;
- (BOOL)shouldAvoidInstallSheet;
- (BOOL)shouldForceVPPAPrompt;
- (BOOL)shouldPunchOutAfterAppInstallation;
- (BOOL)shouldRunPreflightManager;
- (NSString)canonicalID;
- (NSString)contentTitle;
- (NSString)externalID;
- (NSString)mediaType;
- (NSString)referenceID;
- (NSURL)punchoutURL;
- (VUIActionPunchout)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (VUIContentRating)contentRating;
- (WLKChannelDetails)channelDetails;
- (id)topPresentedViewController;
- (unint64_t)consentCancelButtonType;
- (void)_openAirplayPicker:(id)a3;
- (void)_openPunchoutURL:(id)a3 afterInstallation:(BOOL)a4;
- (void)_presentASCSingleAppInstaller:(id)a3;
- (void)_showErrorMessageAlert:(id)a3;
- (void)_startAppInstallFlow:(BOOL)a3 completionHandler:(id)a4;
- (void)checkVppaStatus:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setChannelDetails:(id)a3;
- (void)setConsentCancelButtonType:(unint64_t)a3;
- (void)setContentRating:(id)a3;
- (void)setContentTitle:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setIsAdultContent:(BOOL)a3;
- (void)setIsEntitledToPlay:(BOOL)a3;
- (void)setIsPlaybackURL:(BOOL)a3;
- (void)setMediaType:(id)a3;
- (void)setPunchoutURL:(id)a3;
- (void)setReferenceID:(id)a3;
- (void)setShouldAvoidInstallSheet:(BOOL)a3;
- (void)setShouldForceVPPAPrompt:(BOOL)a3;
- (void)setShouldPunchOutAfterAppInstallation:(BOOL)a3;
- (void)setShouldRunPreflightManager:(BOOL)a3;
- (void)showAPPInstallRestrictedErrorAlert;
@end

@implementation VUIActionPunchout

- (VUIActionPunchout)initWithContextData:(id)a3 appContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)VUIActionPunchout;
  v8 = [(VUIActionPunchout *)&v45 init];
  v9 = v8;
  if (v8)
  {
    v8->_isPlaybackURL = 1;
    objc_storeStrong((id *)&v8->_appContext, a4);
    v10 = objc_msgSend(v6, "vui_dictionaryForKey:", @"punchoutOfferData");
    v9->_shouldPunchOutAfterAppInstallation = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", @"shouldPunchOutAfterAppInstallation", 1);
    v9->_shouldForceVPPAPrompt = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", @"shouldForceVPPAPrompt", 0);
    v11 = objc_msgSend(v10, "vui_numberForKey:", @"consentCancelButtonType");
    v9->_consentCancelButtonType = (int)[v11 intValue];

    uint64_t v12 = objc_msgSend(v10, "vui_URLForKey:", @"playUrl");
    punchoutURL = v9->_punchoutURL;
    v9->_punchoutURL = (NSURL *)v12;

    if (!v9->_punchoutURL)
    {
      v9->_isPlaybackURL = 0;
      uint64_t v14 = objc_msgSend(v10, "vui_URLForKey:", @"openUrl");
      v15 = v9->_punchoutURL;
      v9->_punchoutURL = (NSURL *)v14;
    }
    v16 = objc_msgSend(v10, "vui_dictionaryForKey:", @"channel");
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB5070]) initWithDictionary:v16];
    channelDetails = v9->_channelDetails;
    v9->_channelDetails = (WLKChannelDetails *)v17;

    v19 = objc_msgSend(v10, "vui_numberForKey:", @"isEntitledToPlay");
    objc_opt_class();
    id v44 = v7;
    if (objc_opt_isKindOfClass()) {
      char v20 = [v19 BOOLValue];
    }
    else {
      char v20 = 0;
    }
    v9->_isEntitledToPlay = v20;
    uint64_t v21 = objc_msgSend(v10, "vui_stringForKey:", @"externalId");
    externalID = v9->_externalID;
    v9->_externalID = (NSString *)v21;

    v23 = objc_msgSend(v10, "vui_stringForKey:", @"referenceId");
    v24 = v23;
    if (!v23)
    {
      v24 = objc_msgSend(v10, "vui_stringForKey:", @"id");
    }
    objc_storeStrong((id *)&v9->_referenceID, v24);
    if (!v23) {

    }
    uint64_t v25 = objc_msgSend(v10, "vui_stringForKey:", @"canonicalId");
    canonicalID = v9->_canonicalID;
    v9->_canonicalID = (NSString *)v25;

    uint64_t v27 = objc_msgSend(v10, "vui_stringForKey:", @"contentTitle");
    v28 = (void *)v27;
    if (v27) {
      v29 = (__CFString *)v27;
    }
    else {
      v29 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v9->_contentTitle, v29);

    v9->_isAdultContent = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", @"isAdultContent", 0);
    uint64_t v30 = objc_msgSend(v10, "vui_stringForKey:", @"mediaType");
    mediaType = v9->_mediaType;
    v9->_mediaType = (NSString *)v30;

    v9->_shouldAvoidInstallSheet = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"shouldAvoidAppInstallSheet", 0);
    v32 = objc_msgSend(v10, "vui_dictionaryForKey:", @"playbackMetadata");
    v33 = objc_msgSend(v32, "vui_stringForKey:", @"ratingSystem");
    v34 = objc_msgSend(v32, "vui_numberForKey:", @"ratingValue");
    uint64_t v35 = [v34 unsignedLongValue];

    v36 = objc_msgSend(v32, "vui_stringForKey:", @"ratingName");
    uint64_t v37 = [objc_alloc(MEMORY[0x1E4FB3C60]) initWithRatingSystemString:v33 ratingLabel:v36 rank:v35 ratingDescription:0];
    contentRating = v9->_contentRating;
    v9->_contentRating = (VUIContentRating *)v37;

    if (v33)
    {
      uint64_t v39 = [v33 length];
      BOOL v40 = 0;
      if (v39 && v36) {
        BOOL v40 = [v36 length] != 0;
      }
    }
    else
    {
      BOOL v40 = 0;
    }
    v9->_shouldRunPreflightManager = v40;
    if (!v9->_punchoutURL)
    {
      uint64_t v41 = [MEMORY[0x1E4F1CB10] URLWithString:@"app://"];
      v42 = v9->_punchoutURL;
      v9->_punchoutURL = (NSURL *)v41;
    }
    id v7 = v44;
  }

  return v9;
}

- (BOOL)canPerformNow
{
  if ([(VUIActionPunchout *)self _isValidAppInstalled]) {
    return 1;
  }
  else {
    return ![(VUIActionPunchout *)self shouldAvoidInstallSheet];
  }
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VUIActionPunchout *)self shouldRunPreflightManager])
  {
    v8 = +[VUIPreflightManager defaultPreflightManager];
    v9 = +[VUIApplicationRouter topPresentedViewController];
    [v8 setPresentingController:v9];

    v10 = [(VUIActionPunchout *)self contentRating];
    [v8 setContentRating:v10];

    [v8 setRestrictionsCheckType:0];
    objc_initWeak(location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__VUIActionPunchout_performWithTargetResponder_completionHandler___block_invoke;
    v12[3] = &unk_1E6DFC550;
    objc_copyWeak(&v14, location);
    id v13 = v7;
    [v8 preflightWithOptions:1 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager:: skipping due to no ratings data", (uint8_t *)location, 2u);
    }

    [(VUIActionPunchout *)self _continueInstallFlowAfterPreflight:v7];
  }
}

void __66__VUIActionPunchout_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  if (a2) {
    [WeakRetained _continueInstallFlowAfterPreflight:v5];
  }
  else {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)checkVppaStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[VUIVPPAManager sharedInstance];
  channelDetails = self->_channelDetails;
  unint64_t consentCancelButtonType = self->_consentCancelButtonType;
  BOOL shouldForceVPPAPrompt = self->_shouldForceVPPAPrompt;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__VUIActionPunchout_checkVppaStatus___block_invoke;
  v10[3] = &unk_1E6DFC578;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v5 startVPPAConsentFlow:channelDetails consentCancelButtonType:consentCancelButtonType shouldForceVPPAPrompt:shouldForceVPPAPrompt completion:v10];
}

void __37__VUIActionPunchout_checkVppaStatus___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __37__VUIActionPunchout_checkVppaStatus___block_invoke_2;
  v15 = &unk_1E6DFA4A0;
  char v17 = a3;
  id v16 = *(id *)(a1 + 40);
  id v6 = _Block_copy(&v12);
  if ((a2 & 1) == 0)
  {
    id v7 = *(void **)(a1 + 40);
    v8 = (void (*)(void *, void))v7[2];
    goto LABEL_10;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidAppInstalled", v12, v13, v14, v15))
  {
    id v9 = +[VUISettingsManager sharedInstance];
    int v10 = [v9 isAppInstallationAllowed];

    id v11 = *(void **)(a1 + 32);
    if (v10)
    {
      [v11 _startAppInstallFlow:a3 completionHandler:v6];
      goto LABEL_11;
    }
    [v11 showAPPInstallRestrictedErrorAlert];
    v8 = (void (*)(void *, void))v6[2];
    id v7 = v6;
LABEL_10:
    v8(v7, 0);
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) shouldPunchOutAfterAppInstallation]) {
    [*(id *)(a1 + 32) _openAirplayPicker:v6];
  }
  else {
    ((void (*)(void *, uint64_t))v6[2])(v6, 1);
  }
LABEL_11:
}

uint64_t __37__VUIActionPunchout_checkVppaStatus___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = +[VUIVPPAManager sharedInstance];
    [v2 reloadConfigurationAfterVPPAChange];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)showAPPInstallRestrictedErrorAlert
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v3 = __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke;
  id v4 = &unk_1E6DF3D58;
  uint64_t v5 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v3((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke(uint64_t a1)
{
  v2 = +[VUILocalizationManager sharedInstance];
  v3 = [v2 localizedStringForKey:@"APP_INSTALL_RESTRICTED"];
  id v11 = +[VUIAlertController vui_alertControllerWithTitle:0 message:v3 preferredStyle:1];

  id v4 = +[VUILocalizationManager sharedInstance];
  uint64_t v5 = [v4 localizedStringForKey:@"SETTINGS"];
  id v6 = +[VUIAlertAction vui_actionWithTitle:v5 style:0 handler:&__block_literal_global_143];
  objc_msgSend(v11, "vui_addAction:", v6);

  id v7 = +[VUILocalizationManager sharedInstance];
  v8 = [v7 localizedStringForKey:@"OK"];
  id v9 = +[VUIAlertAction vui_actionWithTitle:v8 style:0 handler:0];
  objc_msgSend(v11, "vui_addAction:", v9);

  int v10 = [*(id *)(a1 + 32) topPresentedViewController];
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", v10, 1, 0);
}

void __55__VUIActionPunchout_showAPPInstallRestrictedErrorAlert__block_invoke_2()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)_startAppInstallFlow:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4 && ([(WLKChannelDetails *)self->_channelDetails isConsented] & 1) == 0)
  {
    id v7 = +[VUIVPPAManager sharedInstance];
    [v7 reloadConfigurationAfterVPPAChange];
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke;
  v9[3] = &unk_1E6DF4428;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(VUIActionPunchout *)self _presentASCSingleAppInstaller:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"VUIFederatedAppDidInstallNotification" object:WeakRetained[3] userInfo:0];

      int v6 = [WeakRetained shouldPunchOutAfterAppInstallation];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v6)
      {
        [WeakRetained _openPunchoutURL:v7 afterInstallation:1];
        goto LABEL_14;
      }
      if (!v7) {
        goto LABEL_14;
      }
      id v10 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v10();
    }
  }
  else
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_2(v8);
    }

    if (*(void *)(a1 + 32))
    {
      id v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_1(v9);
      }

      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)_presentASCSingleAppInstaller:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v8 = __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke;
  id v9 = &unk_1E6DF4AD0;
  id v10 = self;
  id v11 = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v7);
  }
}

void __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke(uint64_t a1)
{
  v2 = [VUIASCNavigationViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke_2;
  v8[3] = &unk_1E6DF3D80;
  id v9 = *(id *)(a1 + 40);
  uint64_t v5 = [(VUIASCNavigationViewController *)v2 initWithChannelDetails:v4 punchoutAction:v3 shouldHandleVPPA:0 onFlowComplete:v8];
  objc_storeStrong((id *)&sASCNavigationController, v5);
  id v6 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v7 = [v6 controllerPresenter];

  if (!v7)
  {
    uint64_t v7 = +[VUIApplicationRouter topMostVisibleViewController];
  }
  [v7 presentViewController:v5 animated:1 completion:&__block_literal_global_84_0];
}

void __51__VUIActionPunchout__presentASCSingleAppInstaller___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = (void *)sASCNavigationController;
  sASCNavigationController = 0;
}

- (void)_openAirplayPicker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WLKChannelDetails *)self->_channelDetails appBundleIDs];
  id v6 = [v5 firstObject];

  if (self->_isEntitledToPlay && [v6 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    id v8 = __40__VUIActionPunchout__openAirplayPicker___block_invoke;
    id v9 = &unk_1E6DF4510;
    id v10 = v6;
    id v11 = self;
    id v12 = v4;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v8(block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [(VUIActionPunchout *)self _openPunchoutURL:v4 afterInstallation:0];
  }
}

void __40__VUIActionPunchout__openAirplayPicker___block_invoke(void *a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__30;
  id v12 = __Block_byref_object_dispose__30;
  id v13 = (id)objc_opt_new();
  v2 = (void *)v9[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__VUIActionPunchout__openAirplayPicker___block_invoke_86;
  v5[3] = &unk_1E6DFC5A0;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  uint64_t v7 = &v8;
  [v2 willBeginPlaybackFromAppWithBundleID:v3 completionHandler:v5];

  _Block_object_dispose(&v8, 8);
}

void __40__VUIActionPunchout__openAirplayPicker___block_invoke_86(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _openPunchoutURL:*(void *)(a1 + 40) afterInstallation:0];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)_showErrorMessageAlert:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  uint64_t v5 = [(VUIActionPunchout *)self channelDetails];
  id v6 = [v5 name];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = NSString;
    id v9 = +[VUILocalizationManager sharedInstance];
    uint64_t v10 = [v9 localizedStringForKey:@"PUNCHOUT_FAILED_ERROR"];
    id v11 = [(VUIActionPunchout *)self channelDetails];
    id v12 = [v11 name];
    id v13 = [v8 stringWithValidatedFormat:v10, @"%@", 0, v12 validFormatSpecifiers error];

    [v4 setMessage:v13];
  }
  else
  {
    id v13 = +[VUILocalizationManager sharedInstance];
    id v14 = [v13 localizedStringForKey:@"PUNCHOUT_FAILED_GENERIC_ERROR"];
    [v4 setMessage:v14];
  }
  v15 = [v30 domain];
  if ([v15 isEqualToString:*MEMORY[0x1E4F626B8]])
  {
    uint64_t v16 = [v30 code];

    if (v16 != 1) {
      goto LABEL_12;
    }
    char v17 = [v30 userInfo];
    v15 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v15)
    {
      v18 = [v15 domain];
      if (![v18 isEqualToString:*MEMORY[0x1E4F625D0]])
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v19 = [v15 code];

      if (v19 == 5)
      {
        char v20 = +[VUILocalizationManager sharedInstance];
        uint64_t v21 = [v20 localizedStringForKey:@"TRANSACTION_RESTRICTED_PUNCHOUT"];
        [v4 setMessage:v21];

        v22 = (void *)MEMORY[0x1E4FB1410];
        v18 = +[VUILocalizationManager sharedInstance];
        v23 = [v18 localizedStringForKey:@"SETTINGS"];
        v24 = [v22 actionWithTitle:v23 style:0 handler:&__block_literal_global_105];
        [v4 addAction:v24];

        goto LABEL_10;
      }
    }
  }
LABEL_11:

LABEL_12:
  uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
  v26 = +[VUILocalizationManager sharedInstance];
  uint64_t v27 = [v26 localizedStringForKey:@"OK"];
  v28 = [v25 actionWithTitle:v27 style:0 handler:0];
  [v4 addAction:v28];

  v29 = [(VUIActionPunchout *)self topPresentedViewController];
  [v29 presentViewController:v4 animated:1 completion:0];
}

void __44__VUIActionPunchout__showErrorMessageAlert___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)_openPunchoutURL:(id)a3 afterInstallation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(VUIActionPunchout *)self punchoutURL];
  uint64_t v8 = [(VUIActionPunchout *)self channelDetails];
  id v9 = [v8 appBundleIDs];
  uint64_t v10 = [v9 firstObject];

  if ([v10 length] && v7)
  {
    BOOL v28 = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke;
    aBlock[3] = &unk_1E6DFC5C8;
    aBlock[4] = self;
    id v11 = v7;
    id v40 = v11;
    id v12 = v10;
    id v41 = v12;
    id v42 = v6;
    v29 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    id v13 = [v11 scheme];
    id v14 = [v13 lowercaseString];
    int v15 = [v14 isEqualToString:@"app"];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_120;
      v35[3] = &unk_1E6DF9518;
      objc_copyWeak(&v37, &location);
      id v36 = v29;
      [v16 openApplicationWithBundleIdentifier:v12 configuration:0 completionHandler:v35];

      objc_destroyWeak(&v37);
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2;
      v32[3] = &unk_1E6DF4510;
      v32[4] = self;
      id v18 = v11;
      id v33 = v18;
      id v34 = v29;
      uint64_t v27 = (void (**)(void))_Block_copy(v32);
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v18 resolvingAgainstBaseURL:0];
      char v20 = [v19 scheme];
      uint64_t v21 = [v20 lowercaseString];
      if ([v21 isEqualToString:@"https"])
      {
        char v22 = 0;
      }
      else
      {
        v23 = [v19 scheme];
        v24 = [v23 lowercaseString];
        char v25 = [v24 isEqualToString:@"http"];

        char v22 = v25 ^ 1;
      }

      if (!v28 || (v22 & 1) != 0)
      {
        v27[2]();
      }
      else
      {
        v26 = (void *)MEMORY[0x1E4F22398];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_138;
        v30[3] = &unk_1E6DF4210;
        v31 = v27;
        [v26 afterAppLinksBecomeAvailableForURL:v18 limit:-1 performBlock:v30];
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    char v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[VUIActionPunchout _openPunchoutURL:afterInstallation:]();
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) _showErrorMessageAlert:v5];
  }
  else if (v6)
  {
    +[VUIMetricsMediaEvent recordPunchout:isUrlForPlay:](VUIMetricsMediaEvent, "recordPunchout:isUrlForPlay:", v6, [v6 isPlaybackURL]);
    id v9 = +[VUIMetricsController sharedInstance];
    uint64_t v10 = [v7 punchoutURL];
    id v11 = [v10 absoluteString];
    [v9 setExitEventDestinationUrl:v11];

    id v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      *(_DWORD *)buf = 138412290;
      v50 = v13;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "DropOnTab: resetting last playback date %@", buf, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v15 = [MEMORY[0x1E4F1C9C8] date];
    [v14 setObject:v15 forKey:@"lastPlaybackDate"];

    if ([v7 isPlaybackURL])
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F29088];
      char v17 = [*(id *)(a1 + 40) absoluteString];
      id v18 = [v16 componentsWithString:v17];

      if (v18)
      {
        uint64_t v42 = a1;
        v43 = v7;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v41 = v18;
        uint64_t v19 = [v18 queryItems];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = 0;
          uint64_t v23 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v45 != v23) {
                objc_enumerationMutation(v19);
              }
              char v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              v26 = [v25 name];
              int v27 = [v26 isEqual:@"resumeTime"];

              if (v27)
              {
                BOOL v28 = [v25 value];
                uint64_t v22 = [v28 integerValue];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v21);
        }
        else
        {
          uint64_t v22 = 0;
        }

        a1 = v42;
        uint64_t v7 = v43;
        id v18 = v41;
      }
      else
      {
        uint64_t v22 = 0;
      }
      id v29 = objc_alloc_init(MEMORY[0x1E4FB50B8]);
      id v30 = [v7 channelDetails];
      v31 = [v30 channelID];
      [v29 setChannelID:v31];

      v32 = [v7 channelDetails];
      objc_msgSend(v29, "setConsented:", objc_msgSend(v32, "isConsented"));

      id v33 = [v7 punchoutURL];
      [v29 setUrl:v33];

      id v34 = [MEMORY[0x1E4F1C9C8] now];
      [v29 setPunchoutTime:v34];

      [v29 setBundleID:*(void *)(a1 + 48)];
      uint64_t v35 = [v7 canonicalID];
      [v29 setCanonicalID:v35];

      id v36 = [v7 channelDetails];
      id v37 = [v36 appAdamIDs];
      v38 = [v37 firstObject];
      [v29 setAppAdamID:v38];

      uint64_t v39 = [v7 externalID];
      [v29 setExternalContentID:v39];

      [v29 setResumeTimeSeconds:v22];
      id v40 = [MEMORY[0x1E4FB50B0] defaultFederatedAnalyticsReporter];
      [v40 reportPunchout:v29];
    }
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v5 == 0);
  }
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_120(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_120_cold_1();
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_121;
  uint64_t v10 = &unk_1E6DFAA70;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = v8;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v9((uint64_t)v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }

  objc_destroyWeak(&v13);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_121(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F62688]];
  if ([*(id *)(a1 + 32) isPlaybackURL])
  {
    [v3 addEntriesFromDictionary:&unk_1F3F3ECD8];
    [v3 setObject:&unk_1F3F3ECD8 forKey:*MEMORY[0x1E4F62660]];
  }
  [v2 setFrontBoardOptions:v3];
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3;
  v7[3] = &unk_1E6DFC5F0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 openURL:v5 configuration:v2 completionHandler:v7];
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3_cold_1();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v11 = __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_129;
  id v12 = &unk_1E6DF68B8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v4;
  uint64_t v14 = v7;
  id v15 = v6;
  id v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = v4;
  if ([v8 isMainThread]) {
    v11(block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_129(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_138(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_138_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isValidAppInstalled
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  channelDetails = self->_channelDetails;
  if (channelDetails
    && ([(WLKChannelDetails *)channelDetails appBundleIDs],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(WLKChannelDetails *)self->_channelDetails appBundleIDs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (v11)
          {
            id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
            int v13 = [v12 applicationIsInstalled:v11];

            if (v13)
            {
              id v15 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v11 allowPlaceholder:1 error:0];
              uint64_t v16 = [(WLKChannelDetails *)self->_channelDetails minRequiredAppVersion];
              char v17 = [v15 shortVersionString];
              if (v16 && [v16 compare:v17 options:64] == 1) {
                LOBYTE(v14) = 0;
              }
              else {
                int v14 = [v15 isPlaceholder] ^ 1;
              }

              goto LABEL_19;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v14) = 0;
LABEL_19:
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (id)topPresentedViewController
{
  return +[VUIApplicationRouter topPresentedViewController];
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (void)setPunchoutURL:(id)a3
{
}

- (BOOL)isPlaybackURL
{
  return self->_isPlaybackURL;
}

- (void)setIsPlaybackURL:(BOOL)a3
{
  self->_isPlaybackURL = a3;
}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (void)setChannelDetails:(id)a3
{
}

- (BOOL)isEntitledToPlay
{
  return self->_isEntitledToPlay;
}

- (void)setIsEntitledToPlay:(BOOL)a3
{
  self->_isEntitledToPlay = a3;
}

- (BOOL)isAdultContent
{
  return self->_isAdultContent;
}

- (void)setIsAdultContent:(BOOL)a3
{
  self->_isAdultContent = a3;
}

- (BOOL)shouldPunchOutAfterAppInstallation
{
  return self->_shouldPunchOutAfterAppInstallation;
}

- (void)setShouldPunchOutAfterAppInstallation:(BOOL)a3
{
  self->_shouldPunchOutAfterAppInstallation = a3;
}

- (BOOL)shouldForceVPPAPrompt
{
  return self->_shouldForceVPPAPrompt;
}

- (void)setShouldForceVPPAPrompt:(BOOL)a3
{
  self->_BOOL shouldForceVPPAPrompt = a3;
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSString)referenceID
{
  return self->_referenceID;
}

- (void)setReferenceID:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (BOOL)shouldAvoidInstallSheet
{
  return self->_shouldAvoidInstallSheet;
}

- (void)setShouldAvoidInstallSheet:(BOOL)a3
{
  self->_shouldAvoidInstallSheet = a3;
}

- (BOOL)shouldRunPreflightManager
{
  return self->_shouldRunPreflightManager;
}

- (void)setShouldRunPreflightManager:(BOOL)a3
{
  self->_shouldRunPreflightManager = a3;
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (unint64_t)consentCancelButtonType
{
  return self->_consentCancelButtonType;
}

- (void)setConsentCancelButtonType:(unint64_t)a3
{
  self->_unint64_t consentCancelButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_referenceID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
  objc_storeStrong((id *)&self->_punchoutURL, 0);
}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionPunchout::_startAppInstallFlow running completion handler with false", v1, 2u);
}

void __60__VUIActionPunchout__startAppInstallFlow_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionPunchout::_startAppInstallFlow weak self has been deallocated", v1, 2u);
}

- (void)_openPunchoutURL:afterInstallation:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1E2BD7000, v1, OS_LOG_TYPE_ERROR, "VUIActionPunchout::either punchoutURL or bundleID is nil; URL: [%@] bundleIdentifier:[%@]",
    v2,
    0x16u);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "VUIActionPunchout::openApplicationWithBundleIdentifier returned with error: %@", v2, v3, v4, v5, v6);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "VUIActionPunchout::openURL returned with error: %@", v2, v3, v4, v5, v6);
}

void __56__VUIActionPunchout__openPunchoutURL_afterInstallation___block_invoke_2_138_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "VUIActionPunchout:: error waiting for site approval: %@", v2, v3, v4, v5, v6);
}

@end