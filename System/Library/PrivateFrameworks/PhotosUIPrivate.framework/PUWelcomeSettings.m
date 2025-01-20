@interface PUWelcomeSettings
+ (PUWelcomeSettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
- (unint64_t)cloudPhotoWelcomeBehavior;
- (unint64_t)whatsNewBehavior;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setCloudPhotoWelcomeBehavior:(unint64_t)a3;
- (void)setDefaultValues;
- (void)setWhatsNewBehavior:(unint64_t)a3;
@end

@implementation PUWelcomeSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUWelcomeSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUWelcomeSettings *)self setWhatsNewBehavior:2];
  [(PUWelcomeSettings *)self setCloudPhotoWelcomeBehavior:2];
}

- (void)setWhatsNewBehavior:(unint64_t)a3
{
  self->_whatsNewBehavior = a3;
}

- (void)setCloudPhotoWelcomeBehavior:(unint64_t)a3
{
  self->_cloudPhotoWelcomeBehavior = a3;
}

- (unint64_t)cloudPhotoWelcomeBehavior
{
  return self->_cloudPhotoWelcomeBehavior;
}

- (unint64_t)whatsNewBehavior
{
  return self->_whatsNewBehavior;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F94108];
  v4 = NSStringFromSelector(sel_whatsNewBehavior);
  v5 = [v3 rowWithTitle:@"What‘s New" valueKeyPath:v4];
  v6 = objc_msgSend(v5, "px_possibleValues:formatter:", &unk_1F078B7F8, &__block_literal_global_13);
  v26[0] = v6;
  v7 = (void *)MEMORY[0x1E4F94108];
  v8 = NSStringFromSelector(sel_cloudPhotoWelcomeBehavior);
  v9 = [v7 rowWithTitle:@"Cloud Photo Welcome" valueKeyPath:v8];
  v10 = objc_msgSend(v9, "px_possibleValues:formatter:", &unk_1F078B810, &__block_literal_global_32_101101);
  v26[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v12 = [v2 sectionWithRows:v11 title:@"App launch prompts"];

  v13 = (void *)MEMORY[0x1E4F94160];
  v14 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Reset All Last Shown Info", &__block_literal_global_43);
  v25[0] = v14;
  v15 = (void *)MEMORY[0x1E4F940F8];
  v16 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v17 = [v15 rowWithTitle:@"Restore Defaults" action:v16];
  v25[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v19 = [v13 sectionWithRows:v18];

  v20 = (void *)MEMORY[0x1E4F94160];
  v24[0] = v12;
  v24[1] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v22 = [v20 moduleWithTitle:@"Welcome Settings" contents:v21];

  return v22;
}

uint64_t __45__PUWelcomeSettings_settingsControllerModule__block_invoke_3()
{
  v0 = +[PUWelcomeViewControllersManager defaultManager];
  [v0 resetAllLastPresentationInfos];

  v1 = (void *)MEMORY[0x1E4F90228];
  return [v1 resetLastShownInfo];
}

__CFString *__45__PUWelcomeSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  objc_super v3 = @"Always Show";
  if (v2 == 1) {
    objc_super v3 = @"Never Show";
  }
  if (v2 == 2) {
    return @"Follow System Behavior";
  }
  else {
    return v3;
  }
}

__CFString *__45__PUWelcomeSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  objc_super v3 = @"Always Show";
  if (v2 == 1) {
    objc_super v3 = @"Never Show";
  }
  if (v2 == 2) {
    return @"Follow System Behavior";
  }
  else {
    return v3;
  }
}

+ (PUWelcomeSettings)sharedInstance
{
  if (sharedInstance_onceToken_101139 != -1) {
    dispatch_once(&sharedInstance_onceToken_101139, &__block_literal_global_101140);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_101141;
  return (PUWelcomeSettings *)v2;
}

void __35__PUWelcomeSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 welcomeSettings];
  v1 = (void *)sharedInstance_sharedInstance_101141;
  sharedInstance_sharedInstance_101141 = v0;
}

@end