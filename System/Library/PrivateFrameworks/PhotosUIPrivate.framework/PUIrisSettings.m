@interface PUIrisSettings
+ (id)_photosPlayerRootSettings;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)isVitalityAllowed;
- (BOOL)shouldAlwaysBadge;
- (BOOL)showStatusBorder;
- (id)parentSettings;
- (void)performPostSaveActions;
- (void)restoreDefaultValues;
- (void)setDefaultValues;
- (void)setShouldAlwaysBadge:(BOOL)a3;
- (void)setShowStatusBorder:(BOOL)a3;
- (void)setVitalityAllowed:(BOOL)a3;
@end

@implementation PUIrisSettings

- (void)setShouldAlwaysBadge:(BOOL)a3
{
  self->_shouldAlwaysBadge = a3;
}

- (void)setDefaultValues
{
  [(PUIrisSettings *)self setShowStatusBorder:0];
  [(PUIrisSettings *)self setVitalityAllowed:1];
  [(PUIrisSettings *)self setShouldAlwaysBadge:0];
}

- (void)setVitalityAllowed:(BOOL)a3
{
  self->_vitalityAllowed = a3;
}

- (void)setShowStatusBorder:(BOOL)a3
{
  self->_showStatusBorder = a3;
}

- (BOOL)shouldAlwaysBadge
{
  return self->_shouldAlwaysBadge;
}

- (BOOL)isVitalityAllowed
{
  return self->_vitalityAllowed;
}

- (BOOL)showStatusBorder
{
  return self->_showStatusBorder;
}

- (void)performPostSaveActions
{
  v3.receiver = self;
  v3.super_class = (Class)PUIrisSettings;
  [(PXSettings *)&v3 performPostSaveActions];
  v2 = [(id)objc_opt_class() _photosPlayerRootSettings];
  [v2 save];
}

- (void)restoreDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUIrisSettings;
  [(PXSettings *)&v3 restoreDefaultValues];
  v2 = [(id)objc_opt_class() _photosPlayerRootSettings];
  [v2 restoreDefaultValues];
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __42__PUIrisSettings_settingsControllerModule__block_invoke;
  v27[3] = &__block_descriptor_40_e17___ISSettings_8__0l;
  v27[4] = a1;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:settingsProvider:", @"PhotosPlayer Settings", v27);
  v32[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v5 = [v2 sectionWithRows:v4];

  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Status Border" valueKeyPath:@"showStatusBorder"];
  v31 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v9 = [v6 sectionWithRows:v8 title:@"Live Photo View"];

  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Vitality" valueKeyPath:@"vitalityAllowed"];
  v30[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:settingsProvider:", @"Vitality Settings", &__block_literal_global_32);
  v13 = [v12 conditionFormat:@"isVitalityAllowed != 0"];
  v30[1] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Badge" valueKeyPath:@"shouldAlwaysBadge"];
  v30[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v16 = [v10 sectionWithRows:v15 title:@"Vitality"];

  v17 = (void *)MEMORY[0x1E4F94160];
  v18 = (void *)MEMORY[0x1E4F940F8];
  v19 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v20 = [v18 rowWithTitle:@"Restore Defaults" action:v19];
  v29 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v22 = [v17 sectionWithRows:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v28[0] = v9;
  v28[1] = v5;
  v28[2] = v16;
  v28[3] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  v25 = [v23 moduleWithTitle:@"Iris" contents:v24];

  return v25;
}

uint64_t __42__PUIrisSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _photosPlayerRootSettings];
}

uint64_t __42__PUIrisSettings_settingsControllerModule__block_invoke_2()
{
  return [MEMORY[0x1E4F8EBC0] sharedInstance];
}

+ (id)_photosPlayerRootSettings
{
  Class v2 = NSClassFromString(&cfstr_Isrootsettings.isa);
  return [(objc_class *)v2 sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_40018 != -1) {
    dispatch_once(&sharedInstance_onceToken_40018, &__block_literal_global_40019);
  }
  Class v2 = (void *)sharedInstance_sharedInstance_40020;
  return v2;
}

void __32__PUIrisSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 irisSettings];
  v1 = (void *)sharedInstance_sharedInstance_40020;
  sharedInstance_sharedInstance_40020 = v0;
}

@end