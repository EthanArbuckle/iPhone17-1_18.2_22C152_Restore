@interface PUPickerUtilities
+ (id)interventionViewControllerForView:(id)a3 withAction:(id)a4;
+ (id)pickerConfigurationForAddToAlbumWithAssetsToAdd:(id)a3;
+ (void)presentDataAccessEducationViewController;
+ (void)presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded;
+ (void)presentUserSafetyViewControllerWithCompletionHandler:(id)a3;
@end

@implementation PUPickerUtilities

+ (id)pickerConfigurationForAddToAlbumWithAssetsToAdd:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F39930]);
  v5 = [v3 firstObject];
  v6 = [v5 photoLibrary];
  v7 = (void *)[v4 _initWithPhotoLibrary:v6 onlyReturnsIdentifiers:0];

  if (v7)
  {
    objc_msgSend(v7, "set_onboardingOverlayDismissedBefore:", 1);
    objc_msgSend(v7, "set_onboardingHeaderDismissedBefore:", 1);
    objc_msgSend(v7, "set_limitedLibraryHeaderDismissedBefore:", 0);
    [v7 setSelectionLimit:1];
    [v7 _setSourceType:2];
    id v8 = objc_alloc_init(MEMORY[0x1E4F399B0]);
    v9 = [MEMORY[0x1E4F1CA48] array];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PUPickerUtilities_pickerConfigurationForAddToAlbumWithAssetsToAdd___block_invoke;
    v12[3] = &unk_1E5F2EC80;
    id v13 = v9;
    id v10 = v9;
    [v3 enumerateObjectsUsingBlock:v12];
    [v8 setAssetsToAddIdentifiers:v10];
    [v7 _setAlbumsConfiguration:v8];
  }
  return v7;
}

void __69__PUPickerUtilities_pickerConfigurationForAddToAlbumWithAssetsToAdd___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

+ (id)interventionViewControllerForView:(id)a3 withAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 frame];
  if (v7 <= 400.0 || ([v5 frame], v8 <= 400.0))
  {
    uint64_t v9 = [MEMORY[0x1E4F906A8] interventionAlertControllerWithAction:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F906A8] interventionViewControllerWithAction:v6];
  }
  id v10 = (void *)v9;

  return v10;
}

+ (void)presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded
{
  if (presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_onceToken != -1) {
    dispatch_once(&presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_onceToken, &__block_literal_global_104282);
  }
  if (presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented == 1)
  {
    v2 = PLPrivacyGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v3 = "[Touch Authentication] Surpassed alert because of it was already presented.";
      id v4 = buf;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    if ((MEMORY[0x1B3E7A510]() & 1) == 0 && (PLIsDeveloperMode() & 1) == 0)
    {
      v2 = PLPrivacyGetLog();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v10 = 0;
      id v3 = "[Touch Authentication] Surpassed alert because of it is not enabled.";
      id v4 = (uint8_t *)&v10;
      goto LABEL_6;
    }
    v2 = [objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.Photos.PhotosUIService" viewControllerClassName:@"PhotosUIServicePickerUnsupportedConfigurationAlertController"];
    id v5 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    id v6 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v2 configurationContext:v5];
    id v7 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    [v6 activateWithContext:v7];
    presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented = 1;
    double v8 = PLPrivacyGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[Touch Authentication] Prompted for touch authentication.", v9, 2u);
    }
  }
LABEL_12:
}

void __88__PUPickerUtilities_presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded__block_invoke()
{
  presentInternalAndDeveloperModeOnlyTouchAuthenticationAlertIfNeeded_hasAlreadyPresented = 1;
}

+ (void)presentUserSafetyViewControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.Photos.PhotosUIService" viewControllerClassName:@"PhotosUIServiceUserSafetyViewController"];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  id v6 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v4 configurationContext:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  double v8 = (void *)MEMORY[0x1E4F4F670];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __74__PUPickerUtilities_presentUserSafetyViewControllerWithCompletionHandler___block_invoke;
  v18 = &unk_1E5F2EC58;
  id v19 = v6;
  id v20 = v3;
  id v9 = v6;
  id v10 = v3;
  v11 = [v8 responderWithHandler:&v15];
  objc_msgSend(v11, "setQueue:", MEMORY[0x1E4F14428], v15, v16, v17, v18);
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F4F668]) initWithInfo:0 responder:v11];
  v14 = [v12 setWithObject:v13];
  [v7 setActions:v14];

  [v9 activateWithContext:v7];
}

uint64_t __74__PUPickerUtilities_presentUserSafetyViewControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 error];
  (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v4 == 0);

  id v5 = *(void **)(a1 + 32);
  return [v5 invalidate];
}

+ (void)presentDataAccessEducationViewController
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.Photos.PhotosUIService" viewControllerClassName:@"PhotosUIServiceDataAccessEducationViewController"];
  id v2 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  uint64_t v3 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v5 configurationContext:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v3 activateWithContext:v4];
}

@end