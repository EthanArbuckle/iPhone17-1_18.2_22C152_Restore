@interface PXTilingSettings
+ (PXTilingSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)flipLayoutsHorizontally;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setFlipLayoutsHorizontally:(BOOL)a3;
@end

@implementation PXTilingSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXTilingSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXTilingSettings *)self setFlipLayoutsHorizontally:0];
}

- (void)setFlipLayoutsHorizontally:(BOOL)a3
{
  self->_flipLayoutsHorizontally = a3;
}

- (BOOL)flipLayoutsHorizontally
{
  return self->_flipLayoutsHorizontally;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXTilingSettings)sharedInstance
{
  if (sharedInstance_onceToken_125694 != -1) {
    dispatch_once(&sharedInstance_onceToken_125694, &__block_literal_global_125695);
  }
  v2 = (void *)sharedInstance_sharedInstance_125696;
  return (PXTilingSettings *)v2;
}

void __34__PXTilingSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 tiling];
  v1 = (void *)sharedInstance_sharedInstance_125696;
  sharedInstance_sharedInstance_125696 = v0;
}

+ (id)settingsControllerModule
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Flip Layouts Horizontally" valueKeyPath:@"flipLayoutsHorizontally"];
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v5 = [v2 sectionWithRows:v4 title:@"Settings"];

  v6 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v7 = (void *)MEMORY[0x1E4F94160];
  v11[0] = v5;
  v11[1] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [v7 moduleWithTitle:@"Tiling" contents:v8];

  return v9;
}

@end