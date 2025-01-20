@interface PXAssetsRecoverySettings
+ (PXAssetsRecoverySettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
- (void)setDefaultValues;
@end

@implementation PXAssetsRecoverySettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)PXAssetsRecoverySettings;
  [(PTSettings *)&v2 setDefaultValues];
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = (void *)MEMORY[0x1E4F94160];
  v4 = (void *)MEMORY[0x1E4F940F8];
  v5 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_200_238572];
  v6 = [v4 rowWithTitle:@"Clear Dismissal Date" action:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 sectionWithRows:v7];
  [v2 addObject:v8];

  v9 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Assets Recovery" contents:v2];

  return v9;
}

uint64_t __52__PXAssetsRecoverySettings_settingsControllerModule__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v1 = objc_msgSend(v0, "px_localDefaults");
  [v1 setDate:0 forKey:@"AssetsRecoveryBannerDismissalDate"];

  return 1;
}

+ (PXAssetsRecoverySettings)sharedInstance
{
  if (sharedInstance_onceToken_238585 != -1) {
    dispatch_once(&sharedInstance_onceToken_238585, &__block_literal_global_238586);
  }
  id v2 = (void *)sharedInstance_sharedInstance_238587;
  return (PXAssetsRecoverySettings *)v2;
}

void __42__PXAssetsRecoverySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 assetsRecoverySettings];
  v1 = (void *)sharedInstance_sharedInstance_238587;
  sharedInstance_sharedInstance_238587 = v0;
}

@end