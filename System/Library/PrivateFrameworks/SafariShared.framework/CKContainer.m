@interface CKContainer
@end

@implementation CKContainer

void __77__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudBookmarksContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.WBSCloudBookmarksStore", 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v2 = (void *)safari_cloudBookmarksContainer_container;
  safari_cloudBookmarksContainer_container = v1;
}

void __70__CKContainer_CloudBookmarkCKContainerExtras__safari_historyContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.WBSCloudHistoryStore", 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v2 = (void *)safari_historyContainer_container;
  safari_historyContainer_container = v1;
}

void __77__CKContainer_CloudBookmarkCKContainerExtras__safari_historyManateeContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.History", @"com.apple.SafariShared.History", objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v2 = (void *)safari_historyManateeContainer_container;
  safari_historyManateeContainer_container = v1;
}

void __72__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudTabsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.CloudTabs", @"com.apple.SafariShared.CloudTabs", objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v2 = (void *)safari_cloudTabsContainer_container;
  safari_cloudTabsContainer_container = v1;
}

void __76__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudSettingsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.Settings", @"com.apple.SafariShared.History", objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v2 = (void *)safari_cloudSettingsContainer_container;
  safari_cloudSettingsContainer_container = v1;
}

void __79__CKContainer_CloudBookmarkCKContainerExtras__safari_scribbleFeedbackContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.WebElementVisibilityFeedback", 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v2 = (void *)safari_scribbleFeedbackContainer_container;
  safari_scribbleFeedbackContainer_container = v1;
}

void __78__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudExtensionsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", @"com.apple.SafariShared.Settings", @"com.apple.SafariShared.History", objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v2 = (void *)safari_cloudExtensionsContainer_container;
  safari_cloudExtensionsContainer_container = v1;
}

void __75__CKContainer_CloudBookmarkCKContainerExtras___safari_containerEnvironment__block_invoke()
{
  _safari_containerEnvironment_environment = 1;
  if ([MEMORY[0x1E4F97EA0] isInternalInstall])
  {
    v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v1 = [v0 BOOLForKey:@"WBSDebugUseCloudKitContainerSandboxEnvironment"];

    if (v1) {
      _safari_containerEnvironment_environment = 2;
    }
  }
}

@end