@interface SearchUIPrivacyDetailsViewController
- (BOOL)_canShowWhileLocked;
- (SearchUIPrivacyDetailsViewController)init;
- (SearchUIPrivacyDetailsViewController)initWithBundleIdentifier:(id)a3;
- (void)dismiss;
@end

@implementation SearchUIPrivacyDetailsViewController

- (SearchUIPrivacyDetailsViewController)init
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = +[SearchUIUtilities bundleIdentifierForApp:22];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    v7 = @"com.apple.onboarding.translate";
  }
  else {
    v7 = @"com.apple.onboarding.sirisuggestions";
  }
  v8 = [(SearchUIPrivacyDetailsViewController *)self initWithBundleIdentifier:v7];

  return v8;
}

- (SearchUIPrivacyDetailsViewController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v5 = (void *)getOBPrivacySplashControllerClass_softClass;
  uint64_t v17 = getOBPrivacySplashControllerClass_softClass;
  if (!getOBPrivacySplashControllerClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getOBPrivacySplashControllerClass_block_invoke;
    v13[3] = &unk_1E6E72C90;
    v13[4] = &v14;
    __getOBPrivacySplashControllerClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  v7 = [v6 splashPageWithBundleIdentifier:v4];
  v12.receiver = self;
  v12.super_class = (Class)SearchUIPrivacyDetailsViewController;
  v8 = [(SearchUIPrivacyDetailsViewController *)&v12 initWithRootViewController:v7];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v8 action:sel_dismiss];
    v10 = [v7 navigationItem];
    [v10 setRightBarButtonItem:v9];

    [(SearchUIPrivacyDetailsViewController *)v8 setModalPresentationStyle:2];
  }

  return v8;
}

- (void)dismiss
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end