@interface VUIGDPRViewControllerFactory
+ (id)_appImage;
+ (id)_chinaController;
+ (id)_defaultController;
+ (id)_disclaimerFeature;
+ (id)_features;
+ (id)_libraryOnlyController;
+ (id)_tinted4KDowwnloadImageWithRenderingMode:(int64_t)a3;
+ (id)_tinted4KTVWithRenderingMode:(int64_t)a3;
+ (id)_tintedAppleTVPlusImageWithRenderingMode:(int64_t)a3;
+ (id)_tintedMLSImageWithRenderingMode:(int64_t)a3;
+ (id)_tintedPopcornWithRenderingMode:(int64_t)a3;
+ (id)_tintedSymbolNamed:(id)a3 withHighlightColor:(id)a4;
+ (id)_tintedVUIGlyphNamed:(id)a3;
+ (id)_tintedVision3DWithRenderingMode:(int64_t)a3;
+ (id)_whatsNewController;
+ (id)_whatsNewFeatures;
+ (id)getStoreFrontID;
+ (void)createViewController:(BOOL)a3 completion:(id)a4;
@end

@implementation VUIGDPRViewControllerFactory

+ (void)createViewController:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!WLKIsRegulatedSKU())
  {
    if (!v4)
    {
      v12 = objc_opt_class();
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2;
      v13[3] = &unk_1E6DF5AA8;
      v8 = (id *)v14;
      v14[0] = v6;
      v14[1] = a1;
      [v12 isFullTVAppEnabledWithCompletion:v13];
      goto LABEL_16;
    }
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning Library-only controller (offline)", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v16 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2;
    v17 = &unk_1E6DF4788;
    v8 = (id *)v18;
    v18[0] = v6;
    v18[1] = a1;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v16((uint64_t)block);
      goto LABEL_16;
    }
    v10 = MEMORY[0x1E4F14428];
    v11 = block;
LABEL_15:
    dispatch_async(v10, v11);
    goto LABEL_16;
  }
  v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning China controller", buf, 2u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v20 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke;
  v21 = &unk_1E6DF4788;
  v8 = (id *)v22;
  v22[0] = v6;
  v22[1] = a1;
  if (![MEMORY[0x1E4F29060] isMainThread])
  {
    v10 = MEMORY[0x1E4F14428];
    v11 = v19;
    goto LABEL_15;
  }
  v20((uint64_t)v19);
LABEL_16:
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _chinaController];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _libraryOnlyController];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning Library-only controller (bag-driven)", buf, 2u);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v35 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_4;
    v36 = &unk_1E6DF4788;
    v7 = (id *)v37;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v37[0] = v8;
    v37[1] = v9;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v35((uint64_t)v34);
      goto LABEL_30;
    }
    v17 = MEMORY[0x1E4F14428];
    v18 = v34;
LABEL_22:
    dispatch_async(v17, v18);
    goto LABEL_30;
  }
  int v10 = [MEMORY[0x1E4F4DBA8] hasPreviouslyAcknowledgedPrivacyIdentifier:@"com.apple.onboarding.tvapp"];
  v11 = [MEMORY[0x1E4FB3C80] sharedInstance];
  int v12 = [v11 gdprWhatsNewFlowEnabled];

  if (v12)
  {
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Overriding hasSeenGDPR flag from using user defaults", buf, 2u);
    }

    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4FB3C80] sharedInstance];
  int v20 = [v19 gdprFirstTimeFlowEnabled];

  if (v20)
  {
    v21 = VUIDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Overriding hasSeenGDPR flag from using user defaults", buf, 2u);
    }
  }
  else if (v10)
  {
LABEL_11:
    v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v31 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_7;
    v32 = &unk_1E6DF4788;
    v7 = (id *)v33;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v33[0] = v15;
    v33[1] = v16;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v31((uint64_t)block);
      goto LABEL_30;
    }
    v17 = MEMORY[0x1E4F14428];
    v18 = block;
    goto LABEL_22;
  }
  v22 = VUIDefaultLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "VUIGDPRViewControllerFactory - Returning default controller", buf, 2u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v26 = __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_8;
  v27 = &unk_1E6DF8D70;
  v7 = (id *)v29;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 40);
  v29[0] = v23;
  v29[1] = v24;
  id v28 = v5;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v26((uint64_t)v25);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v25);
  }

LABEL_30:
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _libraryOnlyController];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _whatsNewController];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__VUIGDPRViewControllerFactory_createViewController_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _defaultController];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 32));
}

+ (id)_defaultController
{
  if ([MEMORY[0x1E4FB3C90] isVision])
  {
    id v3 = [a1 _appImage];
  }
  else
  {
    id v3 = 0;
  }
  if (([MEMORY[0x1E4FB3C90] isPad] & 1) != 0
    || [MEMORY[0x1E4FB3C90] isVision])
  {
    BOOL v4 = +[VUILocalizationManager sharedInstance];
    id v5 = v4;
    id v6 = @"WELCOME_TITLE_1";
  }
  else
  {
    BOOL v4 = +[VUILocalizationManager sharedInstance];
    id v5 = v4;
    id v6 = @"WELCOME_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6];

  id v8 = [VUIGDPRViewController alloc];
  uint64_t v9 = [a1 _features];
  int v10 = +[VUILocalizationManager sharedInstance];
  v11 = [v10 localizedStringForKey:@"WELCOME_BUTTON_TITLE"];
  int v12 = [(AMSUIOnboardingViewController *)v8 initWithHeaderImage:v3 titleText:v7 features:v9 primaryButtonText:v11 privacyLinkBundleIdentifier:@"com.apple.onboarding.tvapp"];

  return v12;
}

+ (id)_whatsNewController
{
  if ([MEMORY[0x1E4FB3C90] isVision])
  {
    id v3 = [a1 _appImage];
  }
  else
  {
    id v3 = 0;
  }
  BOOL v4 = [VUIGDPRViewController alloc];
  id v5 = +[VUILocalizationManager sharedInstance];
  id v6 = [v5 localizedStringForKey:@"WELCOME_WN_TITLE"];
  v7 = [a1 _whatsNewFeatures];
  id v8 = +[VUILocalizationManager sharedInstance];
  uint64_t v9 = [v8 localizedStringForKey:@"WELCOME_WN_BUTTON_TITLE"];
  int v10 = [(AMSUIOnboardingViewController *)v4 initWithHeaderImage:v3 titleText:v6 features:v7 primaryButtonText:v9 privacyLinkBundleIdentifier:@"com.apple.onboarding.tvapp"];

  return v10;
}

+ (id)_chinaController
{
  id v3 = [VUIGDPRViewController alloc];
  BOOL v4 = [a1 _appImage];
  id v5 = +[VUILocalizationManager sharedInstance];
  id v6 = [v5 localizedStringForKey:@"WELCOME_TITLE_VIDEOS"];
  v7 = +[VUILocalizationManager sharedInstance];
  id v8 = [v7 localizedStringForKey:@"WELCOME_DESCRIPTION_VIDEOS"];
  uint64_t v9 = +[VUILocalizationManager sharedInstance];
  int v10 = [v9 localizedStringForKey:@"WELCOME_BUTTON_TITLE"];
  v11 = [(AMSUIOnboardingViewController *)v3 initWithHeaderImage:v4 titleText:v6 descriptionText:v8 primaryButtonText:v10 privacyLinkBundleIdentifier:@"com.apple.onboarding.tvapp"];

  return v11;
}

+ (id)_libraryOnlyController
{
  id v3 = [VUIGDPRViewController alloc];
  BOOL v4 = [a1 _appImage];
  id v5 = +[VUILocalizationManager sharedInstance];
  id v6 = [v5 localizedStringForKey:@"WELCOME_TITLE"];
  v7 = +[VUILocalizationManager sharedInstance];
  id v8 = [v7 localizedStringForKey:@"WELCOME_DESCRIPTION_VIDEOS"];
  uint64_t v9 = +[VUILocalizationManager sharedInstance];
  int v10 = [v9 localizedStringForKey:@"WELCOME_BUTTON_TITLE"];
  v11 = [(AMSUIOnboardingViewController *)v3 initWithHeaderImage:v4 titleText:v6 descriptionText:v8 primaryButtonText:v10 privacyLinkBundleIdentifier:@"com.apple.onboarding.tvapp"];

  return v11;
}

+ (id)_features
{
  int v3 = [MEMORY[0x1E4FB3C90] isVision];
  id v4 = objc_alloc(MEMORY[0x1E4F4DFE8]);
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    id v6 = [a1 _tintedSymbolNamed:@"appletvplus.logo" withHighlightColor:v5];
    v7 = +[VUILocalizationManager sharedInstance];
    id v8 = [v7 localizedStringForKey:@"WELCOME_FEATURE_TITLE1_VISION"];
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    int v10 = [v9 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION1_VISION"];
    v11 = (void *)[v4 initWithImage:v6 titleText:v8 descriptionText:v10];

    id v12 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    v13 = [a1 _tintedVision3DWithRenderingMode:1];
    v14 = +[VUILocalizationManager sharedInstance];
    id v15 = [v14 localizedStringForKey:@"WELCOME_FEATURE_TITLE2_VISION"];
    uint64_t v16 = +[VUILocalizationManager sharedInstance];
    v17 = [v16 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION2_VISION"];
    v18 = (void *)[v12 initWithImage:v13 titleText:v15 descriptionText:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    int v20 = [a1 _tintedPopcornWithRenderingMode:1];
    v21 = +[VUILocalizationManager sharedInstance];
    v22 = [v21 localizedStringForKey:@"WELCOME_FEATURE_TITLE3_VISION"];
    id v23 = +[VUILocalizationManager sharedInstance];
    uint64_t v24 = [v23 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION3_VISION"];
    v25 = (void *)[v19 initWithImage:v20 titleText:v22 descriptionText:v24];
  }
  else
  {
    v26 = [a1 _tintedAppleTVPlusImageWithRenderingMode:1];
    v27 = +[VUILocalizationManager sharedInstance];
    id v28 = [v27 localizedStringForKey:@"WELCOME_FEATURE_TITLE1"];
    v29 = +[VUILocalizationManager sharedInstance];
    v30 = [v29 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION1"];
    v11 = (void *)[v4 initWithImage:v26 titleText:v28 descriptionText:v30];

    id v31 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    v32 = [a1 _tintedMLSImageWithRenderingMode:1];
    v33 = +[VUILocalizationManager sharedInstance];
    v34 = [v33 localizedStringForKey:@"WELCOME_FEATURE_TITLE2"];
    v35 = +[VUILocalizationManager sharedInstance];
    v36 = [v35 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION2"];
    v18 = (void *)[v31 initWithImage:v32 titleText:v34 descriptionText:v36];

    id v37 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    int v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    v21 = [a1 _tintedSymbolNamed:@"film" withHighlightColor:v20];
    v22 = +[VUILocalizationManager sharedInstance];
    id v23 = [v22 localizedStringForKey:@"WELCOME_FEATURE_TITLE3"];
    uint64_t v24 = +[VUILocalizationManager sharedInstance];
    v38 = [v24 localizedStringForKey:@"WELCOME_FEATURE_DESCRIPTION3"];
    v25 = (void *)[v37 initWithImage:v21 titleText:v23 descriptionText:v38];
  }
  v39 = [a1 _disclaimerFeature];
  v40 = [MEMORY[0x1E4F1CA48] array];
  [v40 addObject:v11];
  [v40 addObject:v18];
  [v40 addObject:v25];
  [v40 addObject:v39];
  v41 = (void *)[v40 copy];

  return v41;
}

+ (id)_whatsNewFeatures
{
  int v3 = [MEMORY[0x1E4FB3C90] isVision];
  id v4 = objc_alloc(MEMORY[0x1E4F4DFE8]);
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
  if (v3)
  {
    id v6 = [a1 _tintedSymbolNamed:@"arrow.down.circle" withHighlightColor:v5];
    v7 = +[VUILocalizationManager sharedInstance];
    id v8 = [v7 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_SEASON_DOWNLOADS"];
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    int v10 = [v9 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_SEASON_DOWNLOADS"];
    v11 = (void *)[v4 initWithImage:v6 titleText:v8 descriptionText:v10];

    id v12 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    v13 = [a1 _tinted4KDowwnloadImageWithRenderingMode:1];
    v14 = +[VUILocalizationManager sharedInstance];
    id v15 = [v14 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_4K_DOWNLOADS"];
    uint64_t v16 = +[VUILocalizationManager sharedInstance];
    v17 = [v16 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_4K_DOWNLOADS"];
    v18 = (void *)[v12 initWithImage:v13 titleText:v15 descriptionText:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    int v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
    v21 = [a1 _tintedSymbolNamed:@"shareplay" withHighlightColor:v20];
    v22 = +[VUILocalizationManager sharedInstance];
    id v23 = [v22 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_SHAREPLAY"];
    uint64_t v24 = +[VUILocalizationManager sharedInstance];
    v25 = [v24 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_SHAREPLAY"];
    v26 = (void *)[v19 initWithImage:v21 titleText:v23 descriptionText:v25];
    v27 = 0;
  }
  else
  {
    id v28 = [a1 _tintedSymbolNamed:@"film.stack" withHighlightColor:v5];
    v29 = +[VUILocalizationManager sharedInstance];
    v30 = [v29 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_TRAILERS_PLAYLIST"];
    id v31 = +[VUILocalizationManager sharedInstance];
    v32 = [v31 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_TRAILER_PLAYLIST"];
    v27 = (void *)[v4 initWithImage:v28 titleText:v30 descriptionText:v32];

    id v33 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    v34 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
    v35 = [a1 _tintedSymbolNamed:@"arrow.down.circle" withHighlightColor:v34];
    v36 = +[VUILocalizationManager sharedInstance];
    id v37 = [v36 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_SEASON_DOWNLOADS"];
    v38 = +[VUILocalizationManager sharedInstance];
    v39 = [v38 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_SEASON_DOWNLOADS"];
    v11 = (void *)[v33 initWithImage:v35 titleText:v37 descriptionText:v39];

    id v40 = objc_alloc(MEMORY[0x1E4F4DFE8]);
    int v20 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
    v21 = [a1 _tintedSymbolNamed:@"shareplay" withHighlightColor:v20];
    v22 = +[VUILocalizationManager sharedInstance];
    id v23 = [v22 localizedStringForKey:@"WHATSNEW_FEATURE_TITLE_SHAREPLAY"];
    uint64_t v24 = +[VUILocalizationManager sharedInstance];
    v25 = [v24 localizedStringForKey:@"WHATSNEW_FEATURE_DESCRIPTION_SHAREPLAY"];
    v18 = (void *)[v40 initWithImage:v21 titleText:v23 descriptionText:v25];
    v26 = 0;
  }

  v41 = [MEMORY[0x1E4F1CA48] array];
  if (![MEMORY[0x1E4FB3C90] isVision])
  {
    [v41 addObject:v27];
    [v41 addObject:v11];
    v42 = v41;
    v43 = v18;
    goto LABEL_10;
  }
  if (v27) {
    [v41 addObject:v27];
  }
  [v41 addObject:v11];
  [v41 addObject:v18];
  if (v26)
  {
    v42 = v41;
    v43 = v26;
LABEL_10:
    [v42 addObject:v43];
  }
  v44 = (void *)[v41 copy];

  return v44;
}

+ (id)_disclaimerFeature
{
  int v2 = [MEMORY[0x1E4FB3C90] isVision];
  int v3 = +[VUILocalizationManager sharedInstance];
  id v4 = v3;
  if (v2) {
    id v5 = @"WELCOME_FEATURE_DISCLAIMER1";
  }
  else {
    id v5 = @"WELCOME_FEATURE_DISCLAIMER";
  }
  id v6 = [v3 localizedStringForKey:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F4DFE8]);
  id v8 = objc_opt_new();
  uint64_t v9 = (void *)[v7 initWithImage:v8 titleText:&stru_1F3E921E0 descriptionText:v6];

  return v9;
}

+ (id)_appImage
{
  if ([MEMORY[0x1E4FB3C90] isVision]) {
    int v2 = @"Onboarding-AppIcon-Circular";
  }
  else {
    int v2 = @"Onboarding-AppIcon";
  }
  int v3 = (void *)MEMORY[0x1E4FB1818];
  return (id)objc_msgSend(v3, "vui_videosUIImageNamed:", v2);
}

+ (id)_tintedVUIGlyphNamed:(id)a3
{
  int v3 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", a3);
  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  id v5 = objc_msgSend(v3, "vui_imageWithColor:", v4);

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  return v7;
}

+ (id)_tintedAppleTVPlusImageWithRenderingMode:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v4 imageNamed:@"appletvplus.rectangle.fill" inBundle:v5];
  id v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];

  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  uint64_t v9 = [v7 imageWithTintColor:v8 renderingMode:a3];

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  return v11;
}

+ (id)_tintedMLSImageWithRenderingMode:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"mls.crest.outline");
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  id v6 = [v4 imageWithTintColor:v5 renderingMode:a3];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  return v8;
}

+ (id)_tinted4KDowwnloadImageWithRenderingMode:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v4 imageNamed:@"4k.downloads" inBundle:v5];
  id v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];

  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
  uint64_t v9 = [v7 imageWithTintColor:v8 renderingMode:a3];

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  return v11;
}

+ (id)_tintedSymbolNamed:(id)a3 withHighlightColor:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a4;
  id v7 = [v5 _systemImageNamed:a3];
  id v8 = [v7 imageWithTintColor:v6 renderingMode:1];

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v10 = v9;

  return v10;
}

+ (id)_tintedPopcornWithRenderingMode:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"popcorn.fill");
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
  id v6 = [v4 imageWithTintColor:v5 renderingMode:a3];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  return v8;
}

+ (id)_tinted4KTVWithRenderingMode:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"4K.TV");
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
  id v6 = [v4 imageWithTintColor:v5 renderingMode:a3];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  return v8;
}

+ (id)_tintedVision3DWithRenderingMode:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", @"immersive.badge.fill");
  id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyBlueHighlightedColor");
  id v6 = [v4 imageWithTintColor:v5 renderingMode:a3];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  return v8;
}

+ (id)getStoreFrontID
{
  int v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  int v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  if (!v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    int v3 = objc_msgSend(v4, "ams_localiTunesAccount");
  }
  id v5 = objc_msgSend(v3, "ams_storefront");
  id v6 = [v5 componentsSeparatedByString:@"-"];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 count] >= 2)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = v7;
    goto LABEL_15;
  }
  id v9 = [v5 componentsSeparatedByString:@","];

  if (v9)
  {
    if ((unint64_t)[v9 count] >= 2)
    {
      id v8 = [v9 objectAtIndexedSubscript:0];
      goto LABEL_15;
    }
    if ([v9 count])
    {
      id v10 = [v9 objectAtIndexedSubscript:0];
      if ([v10 length])
      {
        id v8 = [v9 objectAtIndexedSubscript:0];
      }
      else
      {
        id v8 = 0;
      }

      goto LABEL_15;
    }
  }
  id v8 = 0;
LABEL_15:

  return v8;
}

@end