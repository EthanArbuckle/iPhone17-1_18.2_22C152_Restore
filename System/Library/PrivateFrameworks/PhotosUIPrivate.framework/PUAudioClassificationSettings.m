@interface PUAudioClassificationSettings
+ (PUAudioClassificationSettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
- (void)setDefaultValues;
@end

@implementation PUAudioClassificationSettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)PUAudioClassificationSettings;
  [(PTSettings *)&v2 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Browse", &__block_literal_global_7506);
  v3 = (void *)MEMORY[0x1E4F94160];
  v11[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v5 = [v3 sectionWithRows:v4];

  v6 = (void *)MEMORY[0x1E4F94160];
  v10 = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = [v6 moduleWithTitle:@"Audio Classification Settings" contents:v7];

  return v8;
}

void __61__PUAudioClassificationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5 = [[PUAudioClassificationBrowserDebugViewController alloc] initWithStyle:0];
  v3 = [(PUAudioClassificationBrowserDebugViewController *)v5 navigationItem];
  [v3 setTitle:@"Audio Classification Browser"];

  v4 = [v2 navigationController];

  [v4 pushViewController:v5 animated:1];
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (PUAudioClassificationSettings)sharedInstance
{
  if (sharedInstance_onceToken_100641 != -1) {
    dispatch_once(&sharedInstance_onceToken_100641, &__block_literal_global_100642);
  }
  id v2 = (void *)sharedInstance_sharedInstance_100643;
  return (PUAudioClassificationSettings *)v2;
}

void __47__PUAudioClassificationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 audioClassificationSettings];
  v1 = (void *)sharedInstance_sharedInstance_100643;
  sharedInstance_sharedInstance_100643 = v0;
}

@end