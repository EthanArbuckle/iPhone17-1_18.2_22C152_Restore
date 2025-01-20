@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __58__NSUserDefaults_SafariCoreExtras__safari_browserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_browserDefaults");
  v2 = (void *)safari_browserDefaults_userDefaults;
  safari_browserDefaults_userDefaults = v1;
}

void __93__NSUserDefaults_SafariCoreExtras__safari_standardUserDefaultsWithOptimizedKeyValueObserving__block_invoke()
{
  uint64_t v0 = [[_WBSOptimizedKeyValueObservingUserDefaults alloc] _initWithSuiteName:0 container:0];
  uint64_t v1 = (void *)safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults;
  safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults = v0;
}

void __64__NSUserDefaults_SafariCoreExtras__safari_browserSharedDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobilesafarishared"];
  uint64_t v1 = (void *)safari_browserSharedDefaults_safariSharedDefaults;
  safari_browserSharedDefaults_safariSharedDefaults = v0;
}

void __47__NSUserDefaults_SafariCoreExtras__pm_defaults__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  int v1 = objc_msgSend(v0, "safari_isPasswordsAppBundle");

  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = (void *)pm_defaults_userDefaults;
    pm_defaults_userDefaults = v2;
  }
  else
  {
    WBSSetUpAccessToAppDataContainerWithIdentifier(@"com.apple.Passwords");
    id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = objc_msgSend(v8, "safari_passwordsAppContainerDirectoryURL");
    uint64_t v6 = [v4 _initWithSuiteName:@"com.apple.Passwords" container:v5];
    v7 = (void *)pm_defaults_userDefaults;
    pm_defaults_userDefaults = v6;

    v3 = v8;
  }
}

void __56__NSUserDefaults_SafariCoreExtras__as_developerDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AuthenticationServices.Developer"];
  int v1 = (void *)as_developerDefaults_userDefaults;
  as_developerDefaults_userDefaults = v0;
}

void __65__NSUserDefaults_SafariCoreExtras__safari_cloudBookmarksDefaults__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.SafariBookmarksSyncAgent"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 32)) initWithSuiteName:@"com.apple.SafariBookmarksSyncAgent"];
  }
  uint64_t v6 = (void *)safari_cloudBookmarksDefaults_defaults;
  safari_cloudBookmarksDefaults_defaults = v5;
}

@end