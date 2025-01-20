@interface PXStickersSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (id)parentSettings;
@end

@implementation PXStickersSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_24660 != -1) {
    dispatch_once(&sharedInstance_onceToken_24660, &__block_literal_global_24661);
  }
  v2 = (void *)sharedInstance_sharedInstance_24662;
  return v2;
}

void __36__PXStickersSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 stickersSettings];
  v1 = (void *)sharedInstance_sharedInstance_24662;
  sharedInstance_sharedInstance_24662 = v0;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = (void *)MEMORY[0x1E4F940F8];
  v6 = (void *)MEMORY[0x1E4F94190];
  v7 = _ReviewActionHandlerForType(v3, 0);
  v8 = [v6 actionWithHandler:v7];
  v9 = [v5 rowWithTitle:@"Review Sticker Confidence Score" action:v8];
  v19[0] = v9;
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = (void *)MEMORY[0x1E4F94190];
  v12 = _ReviewActionHandlerForType(v3, 1);
  v13 = [v11 actionWithHandler:v12];
  v14 = [v10 rowWithTitle:@"Review Live Sticker Suggestion Score" action:v13];
  v19[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v16 = [v4 sectionWithRows:v15 title:@"Review"];
  [v2 addObject:v16];

  v17 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Stickers" contents:v2];

  return v17;
}

@end