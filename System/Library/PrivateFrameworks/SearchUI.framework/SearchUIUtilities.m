@interface SearchUIUtilities
+ (BOOL)appIsValidForBundleIdentifier:(id)a3;
+ (BOOL)bundleIdentifierIsBlockedForScreenTimeExpiration:(id)a3;
+ (BOOL)canShowViewController:(id)a3;
+ (BOOL)deviceIsAuthenticatedForView:(id)a3;
+ (BOOL)deviceIsInBiometryLockout;
+ (BOOL)deviceIsPasscodeLockedForView:(id)a3;
+ (BOOL)deviceSupportsRotation;
+ (BOOL)directionalEdgeInsets:(NSDirectionalEdgeInsets)a3 equalToDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a4;
+ (BOOL)downloadDemotedAppIfNecessaryForBundleIdentifier:(id)a3 presentingViewControllerForExplanationAlert:(id)a4;
+ (BOOL)isAppInstalledWithBundleId:(id)a3;
+ (BOOL)isAppIntentsSupportEnabled;
+ (BOOL)isIpad;
+ (BOOL)isLargeIpad;
+ (BOOL)isMinimizedHardwareKeyboardMode;
+ (BOOL)isPortraitForWindow:(id)a3;
+ (BOOL)isSpotlightProcess;
+ (BOOL)isWideScreen;
+ (BOOL)resultBlockedForScreenTime:(id)a3;
+ (BOOL)resultIsSiriAction:(id)a3;
+ (BOOL)stringHasRegexMatch:(id)a3 regex:(id)a4;
+ (double)disambiguationTableCellContentInset;
+ (double)imageAccessoryAdditionalCompactHorizontalMargin;
+ (double)imageGridContentInset;
+ (double)standardCompactHorizontalMargin;
+ (double)standardTableCellContentInset;
+ (id)addAspectRatioConstraintForSize:(CGSize)a3 toView:(id)a4;
+ (id)bundleIdentifierForApp:(unint64_t)a3;
+ (id)cardForRenderingResult:(id)a3;
+ (id)cardSectionsForRenderingResult:(id)a3;
+ (id)defaultBrowserBundleIdentifier;
+ (id)environmentForDelegate:(id)a3;
+ (id)fileProviderItemIDForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4;
+ (id)fileProviderItemIDForFileResult:(id)a3;
+ (id)fmfHandlesFromContact:(id)a3;
+ (id)focusGroupIdentifier;
+ (id)hyphenatableStringForString:(id)a3;
+ (id)imageForBlockedApp;
+ (id)localizedStringForKey:(id)a3;
+ (id)openApplicationOptions;
+ (id)pointerKeyMapTable;
+ (id)skHandlesFromContact:(id)a3;
+ (id)stringForSFRichText:(id)a3;
+ (id)stringForSFRichTextArray:(id)a3;
+ (id)stringHandlesFromContact:(id)a3;
+ (unint64_t)deviceAuthenticationStateForView:(id)a3;
+ (unint64_t)flippedCornerMaskFromCornerMask:(unint64_t)a3;
+ (void)applyGaussianBlurToView:(id)a3 withRadius:(double)a4;
+ (void)dispatchAsyncIfNecessary:(id)a3;
+ (void)dispatchMainIfNecessary:(id)a3;
+ (void)fetchURLForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)fetchURLForFileResult:(id)a3 completionHandler:(id)a4;
+ (void)openPunchout:(id)a3;
+ (void)openPunchout:(id)a3 completion:(id)a4;
+ (void)openURL:(id)a3 withCompletion:(id)a4;
+ (void)performAnimatableChanges:(id)a3;
+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4;
+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5;
+ (void)playNegativeHaptic;
+ (void)purgeMemory;
+ (void)requestClipInstallWithURL:(id)a3 completion:(id)a4;
+ (void)requestDeviceUnlock:(id)a3;
+ (void)requestDeviceUnlockWithSuccessHandler:(id)a3;
@end

@implementation SearchUIUtilities

+ (BOOL)bundleIdentifierIsBlockedForScreenTimeExpiration:(id)a3
{
  id v3 = a3;
  v4 = +[SearchUIScreenTimeManager sharedInstance];
  v5 = [v4 getCachedObjectIfAvailableForKey:v3];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

+ (id)bundleIdentifierForApp:(unint64_t)a3
{
  if (a3 > 0x1A)
  {
    v4 = 0;
  }
  else
  {
    v4 = [NSString stringWithFormat:@"com.apple.%@", off_1E6E73188[a3]];
  }
  return v4;
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4
{
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

+ (void)performAnimatableChanges:(id)a3
{
}

+ (double)standardTableCellContentInset
{
  [MEMORY[0x1E4FAE198] standardTableCellContentInset];
  return result;
}

+ (BOOL)isIpad
{
  return [MEMORY[0x1E4FAE198] isIpad];
}

+ (BOOL)isWideScreen
{
  return [MEMORY[0x1E4FAE100] isWideScreen];
}

+ (id)localizedStringForKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F40279D8 table:0];

  return v6;
}

+ (void)dispatchMainIfNecessary:(id)a3
{
}

+ (id)focusGroupIdentifier
{
  return @"SearchUIFocusGroupIdentifier";
}

+ (double)imageGridContentInset
{
  return 6.5;
}

+ (double)disambiguationTableCellContentInset
{
  return 8.0;
}

+ (double)standardCompactHorizontalMargin
{
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  return v2;
}

+ (double)imageAccessoryAdditionalCompactHorizontalMargin
{
  return 10.0;
}

+ (BOOL)isLargeIpad
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  BOOL v3 = CGRectGetHeight(v5) > 1195.0;

  return v3;
}

+ (id)hyphenatableStringForString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (hyphenatableStringForString__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
      v6 = (void *)[v5 initWithString:v4 attributes:hyphenatableStringForString__s_attributes];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&hyphenatableStringForString__onceToken, &__block_literal_global_16);
    if (v4) {
      goto LABEL_3;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

void __49__SearchUIUtilities_hyphenatableStringForString___block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v1 = (void *)[v0 mutableCopy];

  [v1 setAlignment:1];
  [v1 setLineBreakMode:4];
  LODWORD(v2) = 1.0;
  [v1 setHyphenationFactor:v2];
  [v1 setAllowsDefaultTighteningForTruncation:1];
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v6[0] = v1;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)hyphenatableStringForString__s_attributes;
  hyphenatableStringForString__s_attributes = v3;
}

+ (id)addAspectRatioConstraintForSize:(CGSize)a3 toView:(id)a4
{
  double width = a3.width;
  double v5 = 1.0;
  if (width != *MEMORY[0x1E4FB30D8] && a3.height > 0.0 && a3.height != *MEMORY[0x1E4FB30D8]) {
    double v5 = width / a3.height;
  }
  v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:a4 attribute:8 multiplier:v5 constant:0.0];
  [v7 setActive:1];
  return v7;
}

+ (BOOL)deviceSupportsRotation
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  BOOL v3 = CGRectGetHeight(v5) > 667.0;

  return v3;
}

+ (BOOL)isPortraitForWindow:(id)a3
{
  id v3 = a3;
  if ([v3 isRotating]) {
    uint64_t v4 = [v3 _toWindowOrientation];
  }
  else {
    uint64_t v4 = [v3 _windowInterfaceOrientation];
  }
  uint64_t v5 = v4;

  v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v7 = [v6 interfaceOrientation];

  if (v5) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v5;
  }
  return (unint64_t)(v9 - 1) < 2;
}

+ (void)dispatchAsyncIfNecessary:(id)a3
{
}

+ (void)openPunchout:(id)a3
{
}

+ (void)openPunchout:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 preferredOpenableURL];
  int v8 = [v7 hasClip];

  if (v8) {
    [a1 requestClipInstallWithURL:v9 completion:v6];
  }
  else {
    [a1 openURL:v9 withCompletion:v6];
  }
}

+ (void)requestClipInstallWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = SearchUIGeneralLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v8, OS_LOG_TYPE_DEFAULT, "Punchout via clip services", buf, 2u);
  }

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F590F0]) initWithURL:v6];
  uint64_t v10 = *MEMORY[0x1E4F590A8];
  v11 = [v9 sessionProxy];
  v12 = [v11 configuration];
  [v12 setLaunchReason:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke;
  v15[3] = &unk_1E6E730C8;
  id v17 = v7;
  id v18 = a1;
  id v16 = v6;
  id v13 = v7;
  id v14 = v6;
  [v9 requestClipWithCompletion:v15];
}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    goto LABEL_14;
  }
  id v7 = SearchUIGeneralLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (!v5)
  {
    if (v8) {
      __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_1(v7);
    }

    goto LABEL_13;
  }
  if (v8) {
    __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_2((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);
  }

  if ([v5 code] != 8) {
LABEL_13:
  }
    [*(id *)(a1 + 48) openURL:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
LABEL_14:
}

+ (void)openURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SearchUIUtilities_openURL_withCompletion___block_invoke;
  v9[3] = &unk_1E6E730F0;
  id v8 = v6;
  id v10 = v8;
  id v11 = a1;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v9];
  if (v7) {
    v7[2](v7);
  }
}

void __44__SearchUIUtilities_openURL_withCompletion___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) openApplicationOptions];
  id v13 = 0;
  [v2 openSensitiveURL:v3 withOptions:v4 error:&v13];
  id v5 = v13;

  if (v5)
  {
    id v6 = SearchUIGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__SearchUIUtilities_openURL_withCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (BOOL)isSpotlightProcess
{
  if (isSpotlightProcess_onceToken != -1) {
    dispatch_once(&isSpotlightProcess_onceToken, &__block_literal_global_63);
  }
  return isSpotlightProcess_isSpotlightProcess;
}

void __39__SearchUIUtilities_isSpotlightProcess__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v1 processName];
  isSpotlightProcess_isSpotlightProcess = [v0 isEqualToString:@"com.apple.Spotlight"];
}

+ (id)openApplicationOptions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SearchUIUtilities_openApplicationOptions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (openApplicationOptions_onceToken != -1) {
    dispatch_once(&openApplicationOptions_onceToken, block);
  }
  double v2 = (void *)openApplicationOptions_options;
  return v2;
}

void __43__SearchUIUtilities_openApplicationOptions__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F62688]];
  if ([*(id *)(a1 + 32) isSpotlightProcess]) {
    [v4 setObject:*MEMORY[0x1E4FA7090] forKey:*MEMORY[0x1E4F62658]];
  }
  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)openApplicationOptions_options;
  openApplicationOptions_options = v2;
}

+ (unint64_t)deviceAuthenticationStateForView:(id)a3
{
  if (![a1 deviceIsPasscodeLockedForView:a3]) {
    return 0;
  }
  if ([a1 deviceIsInBiometryLockout]) {
    return 2;
  }
  return 1;
}

+ (BOOL)deviceIsAuthenticatedForView:(id)a3
{
  return [a1 deviceIsPasscodeLockedForView:a3] ^ 1;
}

+ (BOOL)deviceIsPasscodeLockedForView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 window];
  id v4 = [v3 windowScene];
  id v5 = [v4 _FBSScene];
  id v6 = [v5 settings];
  uint64_t v7 = [v6 displayConfiguration];
  uint64_t v8 = [v7 identity];
  uint64_t v9 = [v8 isContinuityDisplay];

  uint64_t v10 = SearchUIGeneralLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [NSNumber numberWithBool:v9];
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "SearchUI isInOneness: %@", buf, 0xCu);
  }
  id v16 = @"ExtendedDeviceLockState";
  uint64_t v17 = *MEMORY[0x1E4F1CFD0];
  BOOL v12 = 1;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  int v14 = MKBGetDeviceLockState();
  if (v14 != 1) {
    BOOL v12 = v14 == 6 && !v9 || v14 == 2;
  }

  return v12;
}

+ (BOOL)deviceIsInBiometryLockout
{
  uint64_t v2 = [MEMORY[0x1E4F30B60] currentUser];
  uint64_t v3 = [v2 state];
  id v4 = [v3 biometry];
  char v5 = [v4 isLockedOut];

  return v5;
}

+ (BOOL)canShowViewController:(id)a3
{
  id v3 = a3;
  if ([v3 _canShowWhileLocked])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [v3 view];
    BOOL v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:v5];
  }
  return v4;
}

+ (void)requestDeviceUnlockWithSuccessHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__SearchUIUtilities_requestDeviceUnlockWithSuccessHandler___block_invoke;
  v6[3] = &unk_1E6E72E90;
  id v7 = v4;
  id v5 = v4;
  [a1 requestDeviceUnlock:v6];
}

uint64_t __59__SearchUIUtilities_requestDeviceUnlockWithSuccessHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    double result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

+ (void)requestDeviceUnlock:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SearchUIUtilities_requestDeviceUnlock___block_invoke;
  v5[3] = &unk_1E6E73068;
  id v6 = v3;
  id v4 = v3;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v5];
}

void __41__SearchUIUtilities_requestDeviceUnlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  SBSRequestPasscodeUnlockUI();
}

void __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_3;
    v4[3] = &unk_1E6E73118;
    id v5 = v2;
    char v6 = a2;
    +[SearchUIUtilities dispatchMainIfNecessary:v4];
  }
}

uint64_t __41__SearchUIUtilities_requestDeviceUnlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) != 0);
}

+ (void)playNegativeHaptic
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v2 = [v3 _tapticEngine];
  [v2 actuateFeedback:2];
}

+ (id)stringForSFRichText:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 text];
  id v5 = (void *)[v4 mutableCopy];

  if ([v5 length])
  {
    char v6 = v5;
  }
  else
  {
    char v6 = objc_opt_new();

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(v3, "formattedTextPieces", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = [v12 text];
          if ([v13 length])
          {
            int v14 = [v12 text];
            [v6 appendString:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

+ (id)stringForSFRichTextArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if ([v10 length])
        {
          if ([v4 length]) {
            [v4 appendString:@"\n"];
          }
          [v4 appendString:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)pointerKeyMapTable
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
  return v2;
}

+ (BOOL)appIsValidForBundleIdentifier:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
  uint64_t v6 = [v5 applicationState];
  char v7 = [v6 isValid];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];
    uint64_t v9 = [v8 applicationState];
    char v4 = [v9 isValid];
  }
  return v4;
}

+ (BOOL)resultIsSiriAction:(id)a3
{
  id v3 = [a3 contentType];
  char v4 = [v3 hasPrefix:*MEMORY[0x1E4F30100]];

  return v4;
}

+ (BOOL)resultBlockedForScreenTime:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 applicationBundleIdentifier];
  BOOL v5 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:v4];

  uint64_t v6 = [v3 sectionBundleIdentifier];
  LOBYTE(v4) = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:v6];

  char v7 = [v3 sectionBundleIdentifier];

  uint64_t v8 = +[SearchUIUtilities bundleIdentifierForApp:15];
  char v9 = [v7 isEqualToString:v8];

  if (v4) {
    return 1;
  }
  else {
    return v5 & ~v9;
  }
}

+ (id)imageForBlockedApp
{
  uint64_t v2 = [[SearchUISymbolImage alloc] initWithSymbolName:@"hourglass.tophalf.fill"];
  return v2;
}

+ (BOOL)downloadDemotedAppIfNecessaryForBundleIdentifier:(id)a3 presentingViewControllerForExplanationAlert:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
  int v8 = [v7 isPlaceholder];
  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F6F528];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F6F530]) initWithBundleID:v5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke;
    v12[3] = &unk_1E6E73168;
    id v13 = v6;
    id v14 = v7;
    [v9 prioritizeCoordinatorForAppWithIdentity:v10 completion:v12];
  }
  return v8;
}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2;
  v5[3] = &unk_1E6E72938;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v5];
}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = SearchUIGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v11 = NSString;
    long long v12 = +[SearchUIUtilities localizedStringForKey:@"REINSTALLING_APP_ALERT_TITLE_FORMAT"];
    id v13 = [*(id *)(a1 + 48) localizedName];
    id v14 = [v11 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];
    long long v15 = +[SearchUIUtilities localizedStringForKey:@"REINSTALLING_APP_EXPLANATION"];
    long long v16 = [v10 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

    uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
    long long v18 = +[SearchUIUtilities localizedStringForKey:@"CONFIRMATION_ACTION_TITLE"];
    long long v19 = [v17 actionWithTitle:v18 style:0 handler:0];

    [v16 addAction:v19];
    [v16 setPreferredAction:v19];
    [*(id *)(a1 + 40) presentViewController:v16 animated:1 completion:0];
  }
}

+ (id)defaultBrowserBundleIdentifier
{
  return +[SearchUIDefaultBrowserAppIconImage defaultBrowserBundleIdentifier];
}

+ (void)fetchURLForFileResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 identifier];
  uint64_t v8 = [v7 fileProviderIdentifier];

  [a1 fetchURLForCoreSpotlightIdentifier:v9 fileProviderIdentifier:v8 completionHandler:v6];
}

+ (id)fileProviderItemIDForFileResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = [v4 fileProviderIdentifier];

  id v7 = [a1 fileProviderItemIDForCoreSpotlightIdentifier:v5 fileProviderIdentifier:v6];

  return v7;
}

+ (void)fetchURLForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a1 fileProviderItemIDForCoreSpotlightIdentifier:a3 fileProviderIdentifier:a4];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F25D38] defaultManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__SearchUIUtilities_fetchURLForCoreSpotlightIdentifier_fileProviderIdentifier_completionHandler___block_invoke;
    v11[3] = &unk_1E6E72898;
    id v12 = v8;
    [v10 fetchURLForItemID:v9 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __97__SearchUIUtilities_fetchURLForCoreSpotlightIdentifier_fileProviderIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)fileProviderItemIDForCoreSpotlightIdentifier:(id)a3 fileProviderIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v13 = 0;
    id v14 = 0;
    [MEMORY[0x1E4F25D30] getDomainIdentifier:&v14 andIdentifier:&v13 fromCoreSpotlightIdentifier:v5];
    id v8 = v14;
    id v9 = v13;
    uint64_t v10 = SearchUIGeneralLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v16 = v5;
      __int16 v17 = 2112;
      long long v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier: %@ fileProviderIdentifier: fileProviderIdentifier: %@ domainIdentifier: %@ itemIdentifier: %@", buf, 0x2Au);
    }

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F25D30]) initWithProviderID:v7 domainIdentifier:v8 itemIdentifier:v9];
  }
  else
  {
    id v8 = SearchUIGeneralLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:]();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)environmentForDelegate:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 searchUICommandEnvironment];
  }
  else
  {
    id v4 = objc_opt_new();
    [v4 setFeedbackDelegate:v3];
  }

  return v4;
}

+ (BOOL)isMinimizedHardwareKeyboardMode
{
  int v2 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    char v4 = [v3 isMinimized];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (id)fmfHandlesFromContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 stringHandlesFromContact:a3];
  char v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F615A8], "handleWithId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)stringHandlesFromContact:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [v3 emailAddresses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) value];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = objc_msgSend(v3, "phoneNumbers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) value];
        uint64_t v17 = [v16 unformattedInternationalStringValue];
        [v4 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  return v4;
}

+ (id)skHandlesFromContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 stringHandlesFromContact:a3];
  char v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4FA7FD8]);
        uint64_t v12 = objc_msgSend(v11, "initWithString:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)isAppInstalledWithBundleId:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = SearchUIGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SearchUIUtilities isAppInstalledWithBundleId:]();
    }
  }
  uint64_t v7 = [v4 applicationState];
  char v8 = [v7 isInstalled];

  return v8;
}

+ (BOOL)isAppIntentsSupportEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)directionalEdgeInsets:(NSDirectionalEdgeInsets)a3 equalToDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a4
{
  return a3.leading == a4.leading && a3.top == a4.top && a3.trailing == a4.trailing && a3.bottom == a4.bottom;
}

+ (id)cardSectionsForRenderingResult:(id)a3
{
  id v3 = [a1 cardForRenderingResult:a3];
  char v4 = [v3 cardSections];

  return v4;
}

+ (id)cardForRenderingResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 inlineCard];
  uint64_t v6 = [v5 cardSections];
  if (v6)
  {
    uint64_t v7 = [v4 inlineCard];
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (([v4 usesCompactDisplay] & 1) != 0
    || [v4 shouldUseCompactDisplay] && objc_msgSend(v4, "type") == 1
    || !v7)
  {
    char v8 = [v4 compactCard];
    id v10 = [v8 cardSections];
    if (v10)
    {
      uint64_t v11 = [v4 compactCard];
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if ([v4 usesTopHitDisplay])
  {
LABEL_11:
    char v8 = [v4 tophitCard];
    id v10 = [v8 cardSections];
    if (v10)
    {
      uint64_t v11 = [v4 tophitCard];
LABEL_15:
      uint64_t v12 = (void *)v11;

      uint64_t v7 = v12;
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  char v8 = [v4 sectionBundleIdentifier];
  if ([v8 isEqual:@"com.apple.spotlight.tophits"])
  {
    int v9 = [a1 isSpotlightProcess];

    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
LABEL_17:

LABEL_18:
  return v7;
}

+ (void)applyGaussianBlurToView:(id)a3 withRadius:(double)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v6 = *MEMORY[0x1E4F3A0D0];
  id v7 = a3;
  char v8 = [v5 filterWithType:v6];
  int v9 = [NSNumber numberWithDouble:a4];
  [v8 setValue:v9 forKey:@"inputRadius"];

  v12[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v11 = [v7 layer];

  [v11 setFilters:v10];
}

+ (unint64_t)flippedCornerMaskFromCornerMask:(unint64_t)a3
{
  return (a3 >> 2) & 3 | (4 * (a3 & 3));
}

+ (BOOL)stringHasRegexMatch:(id)a3 regex:(id)a4
{
  id v5 = a3;
  uint64_t v11 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:a4 options:0 error:&v11];
  if (v6) {
    BOOL v7 = v11 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    int v9 = objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    BOOL v8 = v9 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (void)purgeMemory
{
  int v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VKDidReceiveMemoryWarningNotification" object:0];

  +[SearchUIUtilities dispatchAsyncIfNecessary:&__block_literal_global_217];
}

uint64_t __32__SearchUIUtilities_purgeMemory__block_invoke()
{
  return +[SearchUIPhotosUtilities shutdownPhotoLibraries];
}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "No valid clips available", v1, 2u);
}

void __58__SearchUIUtilities_requestClipInstallWithURL_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__SearchUIUtilities_openURL_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__SearchUIUtilities_downloadDemotedAppIfNecessaryForBundleIdentifier_presentingViewControllerForExplanationAlert___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)fileProviderItemIDForCoreSpotlightIdentifier:fileProviderIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E45B5000, v0, v1, "SearchUIUtilities: missing coreSpotlightIdentifier or fileProviderIdentifier when tyring to get FPItemID coreSpotlightIdentifier: %@, fileProviderIdentifier: %@");
}

+ (void)isAppInstalledWithBundleId:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E45B5000, v0, v1, "SearchUIUtilities: initialized LSApplicationRecordWithBundleId:%@ error:%@");
}

@end