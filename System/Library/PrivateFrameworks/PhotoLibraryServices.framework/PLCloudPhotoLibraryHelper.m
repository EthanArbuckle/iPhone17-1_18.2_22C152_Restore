@interface PLCloudPhotoLibraryHelper
+ (void)_donateTipsAppEnablementSignal;
+ (void)disableCPL:(id)a3;
+ (void)enableCPL:(id)a3;
@end

@implementation PLCloudPhotoLibraryHelper

+ (void)_donateTipsAppEnablementSignal
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:@"com.apple.mobileslideshow.icpl-enabled" context:@"com.apple.mobileslideshow" osBuild:0 userInfo:0];
  v2 = BiomeLibrary();
  v3 = [v2 Discoverability];
  v4 = [v3 Signals];
  v5 = [v4 source];

  [v5 sendEvent:v6];
}

+ (void)disableCPL:(id)a3
{
  id v3 = a3;
  id v5 = +[PLAccountStore pl_sharedAccountStore];
  v4 = [v5 cachedPrimaryAppleAccount];
  [v4 setEnabled:0 forDataclass:*MEMORY[0x1E4F17A88]];
  [v5 saveAccount:v4 withDataclassActions:0 doVerify:0 completion:v3];
}

+ (void)enableCPL:(id)a3
{
  id v4 = a3;
  id v6 = +[PLAccountStore pl_sharedAccountStore];
  id v5 = [v6 cachedPrimaryAppleAccount];
  [v5 setEnabled:1 forDataclass:*MEMORY[0x1E4F17A88]];
  [v5 setEnabled:0 forDataclass:*MEMORY[0x1E4F17AE0]];
  [v6 saveAccount:v5 withDataclassActions:0 doVerify:0 completion:v4];

  [a1 _donateTipsAppEnablementSignal];
}

@end