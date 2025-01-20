@interface CKContainer(CloudBookmarkCKContainerExtras)
+ (id)_safari_containerWithIdentifier:()CloudBookmarkCKContainerExtras encryptionServiceName:environment:useApplicationBundleIdentifierOverride:;
+ (id)safari_cloudBookmarksContainer;
+ (id)safari_cloudExtensionsContainer;
+ (id)safari_cloudSettingsContainer;
+ (id)safari_cloudTabsContainer;
+ (id)safari_historyContainer;
+ (id)safari_historyManateeContainer;
+ (id)safari_scribbleFeedbackContainer;
+ (uint64_t)_safari_containerEnvironment;
@end

@implementation CKContainer(CloudBookmarkCKContainerExtras)

+ (id)_safari_containerWithIdentifier:()CloudBookmarkCKContainerExtras encryptionServiceName:environment:useApplicationBundleIdentifierOverride:
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F19ED0]) initWithContainerIdentifier:v9 environment:a5];
  id v12 = objc_alloc_init(MEMORY[0x1E4F19EE8]);
  if ([v10 length])
  {
    [v12 setEncryptionServiceName:v10];
    [v12 setUseZoneWidePCS:1];
  }
  if (a6)
  {
    [v12 setApplicationBundleIdentifierOverrideForPushTopicGeneration:v9];
    [v12 setApplicationBundleIdentifierOverrideForContainerAccess:v9];
    v13 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
    [v12 setApplicationBundleIdentifierOverrideForTCC:v13];
    [v12 setApplicationBundleIdentifierOverrideForNetworkAttribution:v13];
    [v12 setPrefersHiddenAllowedSharingOptionsUI:1];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F19EC0]) initWithContainerID:v11 options:v12];

  return v14;
}

+ (id)safari_cloudBookmarksContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudBookmarksContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudBookmarksContainer_onceToken != -1) {
    dispatch_once(&safari_cloudBookmarksContainer_onceToken, block);
  }
  v1 = (void *)safari_cloudBookmarksContainer_container;
  return v1;
}

+ (id)safari_historyContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CKContainer_CloudBookmarkCKContainerExtras__safari_historyContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_historyContainer_onceToken != -1) {
    dispatch_once(&safari_historyContainer_onceToken, block);
  }
  v1 = (void *)safari_historyContainer_container;
  return v1;
}

+ (id)safari_historyManateeContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CKContainer_CloudBookmarkCKContainerExtras__safari_historyManateeContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_historyManateeContainer_onceToken != -1) {
    dispatch_once(&safari_historyManateeContainer_onceToken, block);
  }
  v1 = (void *)safari_historyManateeContainer_container;
  return v1;
}

+ (id)safari_cloudTabsContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudTabsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudTabsContainer_onceToken != -1) {
    dispatch_once(&safari_cloudTabsContainer_onceToken, block);
  }
  v1 = (void *)safari_cloudTabsContainer_container;
  return v1;
}

+ (id)safari_cloudSettingsContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudSettingsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudSettingsContainer_onceToken != -1) {
    dispatch_once(&safari_cloudSettingsContainer_onceToken, block);
  }
  v1 = (void *)safari_cloudSettingsContainer_container;
  return v1;
}

+ (id)safari_scribbleFeedbackContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CKContainer_CloudBookmarkCKContainerExtras__safari_scribbleFeedbackContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_scribbleFeedbackContainer_onceToken != -1) {
    dispatch_once(&safari_scribbleFeedbackContainer_onceToken, block);
  }
  v1 = (void *)safari_scribbleFeedbackContainer_container;
  return v1;
}

+ (id)safari_cloudExtensionsContainer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudExtensionsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudExtensionsContainer_onceToken != -1) {
    dispatch_once(&safari_cloudExtensionsContainer_onceToken, block);
  }
  v1 = (void *)safari_cloudExtensionsContainer_container;
  return v1;
}

+ (uint64_t)_safari_containerEnvironment
{
  if (_safari_containerEnvironment_onceToken != -1) {
    dispatch_once(&_safari_containerEnvironment_onceToken, &__block_literal_global_12);
  }
  return _safari_containerEnvironment_environment;
}

@end