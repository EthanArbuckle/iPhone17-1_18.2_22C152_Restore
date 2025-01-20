@interface PFClientUtil
+ (BOOL)isAppRemovalService;
+ (BOOL)isPodcastsApp;
+ (BOOL)isPodcastsKit;
+ (BOOL)isRunningOnDesktop;
+ (BOOL)isRunningOnHomepod;
+ (BOOL)isRunningOnInternalOS;
+ (BOOL)isRunningOnTV;
+ (BOOL)isRunningOnVisionOS;
+ (BOOL)isRunningOnWatch;
+ (BOOL)platformSupportsVideo;
+ (BOOL)supportsDownloads;
+ (BOOL)supportsGUI;
+ (BOOL)supportsImageStore;
+ (BOOL)supportsLocalLibrary;
+ (NSString)bagProfileName;
+ (NSString)bagProfileVersion;
+ (id)clientBundleVersion;
+ (id)clientIdentifier;
+ (id)clientIdentifierHeader;
+ (id)mediaApiClientIdentifier;
+ (id)mediaApiClientVersion;
@end

@implementation PFClientUtil

+ (BOOL)isRunningOnInternalOS
{
  if (isRunningOnInternalOS_onceToken != -1) {
    dispatch_once(&isRunningOnInternalOS_onceToken, &__block_literal_global_28);
  }
  return isRunningOnInternalOS_isRunningOnInternalOS;
}

+ (id)mediaApiClientVersion
{
  return @"1";
}

+ (BOOL)isRunningOnTV
{
  return 0;
}

+ (id)clientBundleVersion
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 infoDictionary];
  v4 = [v3 objectForKey:@"CFBundleShortVersionString"];

  return v4;
}

+ (BOOL)isPodcastsApp
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PFClientUtil_isPodcastsApp__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPodcastsApp_onceToken != -1) {
    dispatch_once(&isPodcastsApp_onceToken, block);
  }
  return isPodcastsApp_isPodcastsApp;
}

+ (BOOL)supportsDownloads
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PFClientUtil_supportsDownloads__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsDownloads_onceToken != -1) {
    dispatch_once(&supportsDownloads_onceToken, block);
  }
  return supportsDownloads_supportsDownloads;
}

+ (NSString)bagProfileVersion
{
  return (NSString *)@"1";
}

+ (NSString)bagProfileName
{
  if (bagProfileName_onceToken != -1) {
    dispatch_once(&bagProfileName_onceToken, &__block_literal_global_17);
  }
  return (NSString *)@"Podcasts";
}

+ (BOOL)supportsLocalLibrary
{
  if (supportsLocalLibrary_onceToken != -1) {
    dispatch_once(&supportsLocalLibrary_onceToken, &__block_literal_global_33);
  }
  return (supportsLocalLibrary_supportsLocalLibrary & 1) == 0;
}

+ (id)mediaApiClientIdentifier
{
  if (mediaApiClientIdentifier_onceToken != -1) {
    dispatch_once(&mediaApiClientIdentifier_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)mediaApiClientIdentifier_identifier;
  return v2;
}

uint64_t __34__PFClientUtil_supportsImageStore__block_invoke(uint64_t a1)
{
  char v2 = os_feature_enabled_removed_imagestore();
  uint64_t result = [*(id *)(a1 + 32) isRunningOnHomepod];
  if (result & 1) != 0 || (uint64_t result = [*(id *)(a1 + 32) isPodcastsKit], (result))
  {
    char v4 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isAppRemovalService];
    char v4 = (result | v2) ^ 1;
  }
  supportsImageStore_supportsImageStore = v4;
  return result;
}

+ (BOOL)isRunningOnHomepod
{
  if (isRunningOnHomepod_onceToken != -1) {
    dispatch_once(&isRunningOnHomepod_onceToken, &__block_literal_global_19);
  }
  return isRunningOnHomepod_isRunningOnHomepod;
}

+ (BOOL)isPodcastsKit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PFClientUtil_isPodcastsKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPodcastsKit_onceToken != -1) {
    dispatch_once(&isPodcastsKit_onceToken, block);
  }
  return isPodcastsKit_isPodcastsKit;
}

+ (BOOL)isAppRemovalService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PFClientUtil_isAppRemovalService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAppRemovalService_onceToken != -1) {
    dispatch_once(&isAppRemovalService_onceToken, block);
  }
  return isAppRemovalService_isAppRemovalService;
}

void __36__PFClientUtil_supportsLocalLibrary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 infoDictionary];
  char v2 = [v1 valueForKey:@"PodcastsThinClient"];
  char v3 = [v2 isEqual:MEMORY[0x1E4F1CC38]];

  supportsLocalLibrary_supportsLocalLibrary = v3;
}

+ (BOOL)isRunningOnDesktop
{
  return 0;
}

void __29__PFClientUtil_isPodcastsKit__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientIdentifier];
  isPodcastsKit_isPodcastsKit = [v1 isEqualToString:@"com.apple.PodcastsKit"];
}

void __35__PFClientUtil_isAppRemovalService__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientIdentifier];
  isAppRemovalService_isAppRemovalService = [v1 isEqualToString:@"com.apple.podcasts.appremoval"];
}

void __29__PFClientUtil_isPodcastsApp__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientIdentifier];
  isPodcastsApp_isPodcastsApp = [v1 isEqualToString:@"com.apple.podcasts"];
}

+ (id)clientIdentifier
{
  char v2 = [MEMORY[0x1E4F28B50] mainBundle];
  char v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    char v4 = [MEMORY[0x1E4F28F80] processInfo];
    char v3 = [v4 processName];
  }
  return v3;
}

void __40__PFClientUtil_mediaApiClientIdentifier__block_invoke()
{
  v0 = (void *)mediaApiClientIdentifier_identifier;
  mediaApiClientIdentifier_identifier = @"com.apple.podcasts";
}

uint64_t __37__PFClientUtil_isRunningOnInternalOS__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isRunningOnInternalOS_isRunningOnInternalOS = result;
  return result;
}

uint64_t __35__PFClientUtil_isRunningOnVisionOS__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isRunningOnVisionOS_isRunningOnVisionOS = result == 11;
  return result;
}

uint64_t __34__PFClientUtil_isRunningOnHomepod__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isRunningOnHomepod_isRunningOnHomepod = result == 7;
  return result;
}

uint64_t __33__PFClientUtil_supportsDownloads__block_invoke(uint64_t a1)
{
  supportsDownloads_supportsDownloads = [*(id *)(a1 + 32) isPodcastsApp];
  if (supportsDownloads_supportsDownloads) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = isRunningUnitTests();
  }
  supportsDownloads_supportsDownloads = result;
  return result;
}

+ (BOOL)isRunningOnVisionOS
{
  if (isRunningOnVisionOS_onceToken != -1) {
    dispatch_once(&isRunningOnVisionOS_onceToken, &__block_literal_global_26);
  }
  return isRunningOnVisionOS_isRunningOnVisionOS;
}

+ (BOOL)supportsImageStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PFClientUtil_supportsImageStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsImageStore_onceToken != -1) {
    dispatch_once(&supportsImageStore_onceToken, block);
  }
  return supportsImageStore_supportsImageStore;
}

+ (id)clientIdentifierHeader
{
  return @"Podcasts";
}

+ (BOOL)isRunningOnWatch
{
  if (isRunningOnWatch_onceToken != -1) {
    dispatch_once(&isRunningOnWatch_onceToken, &__block_literal_global_24);
  }
  return 0;
}

+ (BOOL)platformSupportsVideo
{
  return [a1 isRunningOnHomepod] ^ 1;
}

+ (BOOL)supportsGUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__PFClientUtil_supportsGUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsGUI_onceToken != -1) {
    dispatch_once(&supportsGUI_onceToken, block);
  }
  return supportsGUI_supportsGUI;
}

uint64_t __27__PFClientUtil_supportsGUI__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunningOnHomepod]) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = [*(id *)(a1 + 32) isPodcastsApp];
  }
  supportsGUI_supportsGUI = result;
  return result;
}

@end