@interface MSOnboardingUtil
+ (BOOL)shouldShowOnboarding;
+ (id)viewControllerForMediaType:(int64_t)a3 completion:(id)a4;
+ (void)markAsShown;
+ (void)presentIfNeededFromViewController:(id)a3 mediaTypes:(int64_t)a4 completion:(id)a5;
@end

@implementation MSOnboardingUtil

+ (void)markAsShown
{
  CFPreferencesSetAppValue(@"MSOnboardingVersionKey", (CFPropertyListRef)[NSNumber numberWithInteger:kMSCurrentOnboardingVersion], @"com.apple.MobileStore");
  CFPreferencesAppSynchronize(@"com.apple.MobileStore");
  uint64_t v6 = 0;
  v2 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B350], "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "valueForKey:error:", @"privacyAcknowledgementUrl", &v6);
  v3 = NSURL;
  if ([(__CFString *)v2 length]) {
    v4 = v2;
  }
  else {
    v4 = @"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/acknowledgePrivacy";
  }
  uint64_t v5 = [v3 URLWithString:v4];
  [MEMORY[0x263F7B2C0] acknowledgePrivacyLinkWithIdentifier:*MEMORY[0x263F7BBD8] URL:v5];
}

+ (void)presentIfNeededFromViewController:(id)a3 mediaTypes:(int64_t)a4 completion:(id)a5
{
  if ([a1 shouldShowOnboarding])
  {
    [a3 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = (void *)[a3 presentedViewController];
    }
    else {
      v9 = 0;
    }
    if (!objc_msgSend((id)objc_msgSend(v9, "viewControllers"), "firstObject")) {
      [a3 presentedViewController];
    }
    getAMPOnboardingViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke;
      v14[3] = &unk_264CE8A88;
      v14[4] = a5;
      v13 = (void *)[a1 viewControllerForMediaType:a4 completion:v14];
      [v13 setModalPresentationStyle:2];
      [a3 presentViewController:v13 animated:1 completion:0];
      return;
    }
    v10 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    id v11 = a5;
    uint64_t v12 = 0;
  }
  else
  {
    v10 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    id v11 = a5;
    uint64_t v12 = 1;
  }
  v10(v11, v12);
}

uint64_t __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke_2;
  v3[3] = &unk_264CE8A60;
  v3[4] = *(void *)(a1 + 32);
  return [a2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __76__MSOnboardingUtil_presentIfNeededFromViewController_mediaTypes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

+ (BOOL)shouldShowOnboarding
{
  if (CFPreferencesGetAppIntegerValue(@"MSOnboardingVersionKey", @"com.apple.MobileStore", 0) != kMSCurrentOnboardingVersion) {
    return 1;
  }
  v2 = (void *)MEMORY[0x263F7B2C0];
  uint64_t v3 = *MEMORY[0x263F7BBD8];
  return [v2 shouldDisplayPrivacyLinkWithIdentifier:v3];
}

+ (id)viewControllerForMediaType:(int64_t)a3 completion:(id)a4
{
  v30[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.itunesstore"];
  if (a3 == 2)
  {
    id v20 = objc_alloc(getAMPOnboardingViewControllerClass());
    uint64_t v21 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"WelcomeiTunesStore", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), 0);
    uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_TITLE", &stru_26EA927B8, 0);
    v23 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = @"ONBOARDING_DESCRIPTION_MUSIC";
LABEL_7:
    uint64_t v25 = [v23 localizedStringForKey:v24 value:&stru_26EA927B8 table:0];
    uint64_t v19 = objc_msgSend(v20, "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkController:", v21, v22, v25, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_CONTINUE", &stru_26EA927B8, 0), v6);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    id v20 = objc_alloc(getAMPOnboardingViewControllerClass());
    uint64_t v21 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"WelcomeiTunesStore", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), 0);
    uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_TITLE", &stru_26EA927B8, 0);
    v23 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = @"ONBOARDING_DESCRIPTION_MUSIC_AND_MOVIES";
    goto LABEL_7;
  }
  if (a3)
  {
    v26 = 0;
    goto LABEL_10;
  }
  id v7 = objc_alloc(getAMPOnboardingFeatureClass());
  uint64_t v28 = v6;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"WelcomeMusic", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), 0);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_TITLE_MUSIC", &stru_26EA927B8, 0);
  v30[0] = objc_msgSend(v7, "initWithImage:titleText:descriptionText:", v8, v9, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_DESCRIPTION_MUSIC", &stru_26EA927B8, 0));
  id v10 = objc_alloc(getAMPOnboardingFeatureClass());
  uint64_t v11 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"WelcomeMovies", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), 0);
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_TITLE_MOVIES", &stru_26EA927B8, 0);
  v30[1] = objc_msgSend(v10, "initWithImage:titleText:descriptionText:", v11, v12, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_DESCRIPTION_MOVIES", &stru_26EA927B8, 0));
  id v13 = objc_alloc(getAMPOnboardingFeatureClass());
  uint64_t v14 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"WelcomeTV", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), 0);
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_TITLE_TV", &stru_26EA927B8, 0);
  v30[2] = objc_msgSend(v13, "initWithImage:titleText:descriptionText:", v14, v15, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_FEATURE_DESCRIPTION_TV", &stru_26EA927B8, 0));
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  id v17 = objc_alloc(getAMPOnboardingViewControllerClass());
  uint64_t v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_TITLE", &stru_26EA927B8, 0);
  uint64_t v19 = objc_msgSend(v17, "initWithTitleText:features:primaryButtonText:privacyLinkController:", v18, v16, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ONBOARDING_CONTINUE", &stru_26EA927B8, 0), v6);
LABEL_8:
  v26 = (void *)v19;
LABEL_10:
  objc_msgSend((id)objc_msgSend(v26, "view"), "setTintColor:", objc_msgSend(MEMORY[0x263F1C550], "systemBlueColor", v28));
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __58__MSOnboardingUtil_viewControllerForMediaType_completion___block_invoke;
  v29[3] = &unk_264CE8AB0;
  v29[4] = a4;
  [v26 setPrimaryButtonCallback:v29];
  return v26;
}

uint64_t __58__MSOnboardingUtil_viewControllerForMediaType_completion___block_invoke(uint64_t a1)
{
  +[MSOnboardingUtil markAsShown];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

@end