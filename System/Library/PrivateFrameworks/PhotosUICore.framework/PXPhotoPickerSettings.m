@interface PXPhotoPickerSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)useNavBarAnimatedTransition;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setUseNavBarAnimatedTransition:(BOOL)a3;
@end

@implementation PXPhotoPickerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoPickerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPhotoPickerSettings *)self setUseNavBarAnimatedTransition:1];
}

- (void)setUseNavBarAnimatedTransition:(BOOL)a3
{
  self->_useNavBarAnimatedTransition = a3;
}

- (BOOL)useNavBarAnimatedTransition
{
  return self->_useNavBarAnimatedTransition;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_33034 != -1) {
    dispatch_once(&sharedInstance_onceToken_33034, &__block_literal_global_33035);
  }
  v2 = (void *)sharedInstance_sharedInstance_33036;
  return v2;
}

void __39__PXPhotoPickerSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 photoPickerSettings];
  v1 = (void *)sharedInstance_sharedInstance_33036;
  sharedInstance_sharedInstance_33036 = v0;
}

+ (id)settingsControllerModule
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  objc_super v3 = (void *)MEMORY[0x1E4F941A8];
  v4 = (void *)MEMORY[0x1E4F941F0];
  v5 = NSStringFromSelector(sel_useNavBarAnimatedTransition);
  v6 = [v4 rowWithTitle:@"Use Nav Bar Transition" valueKeyPath:v5];
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v8 = [v3 sectionWithRows:v7 title:@"Grid"];

  v9 = (void *)MEMORY[0x1E4F94160];
  v13[0] = v8;
  v13[1] = v2;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v9 moduleWithTitle:@"Diagnostics" contents:v10];

  return v11;
}

@end