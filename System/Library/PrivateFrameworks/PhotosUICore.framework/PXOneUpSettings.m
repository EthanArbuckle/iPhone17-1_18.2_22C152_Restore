@interface PXOneUpSettings
+ (PXOneUpSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)hideFloatingInfoPanel;
- (BOOL)shouldInitiallyZoomContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4;
- (double)maximumWhitespaceWidthForInitialZoomToFill;
- (double)zoomFactorForContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setHideFloatingInfoPanel:(BOOL)a3;
- (void)setMaximumWhitespaceWidthForInitialZoomToFill:(double)a3;
@end

@implementation PXOneUpSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXOneUpSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXOneUpSettings *)self setMaximumWhitespaceWidthForInitialZoomToFill:22.0];
}

- (void)setMaximumWhitespaceWidthForInitialZoomToFill:(double)a3
{
  self->_maximumWhitespaceWidthForInitialZoomToFill = a3;
}

- (void)setHideFloatingInfoPanel:(BOOL)a3
{
  self->_hideFloatingInfoPanel = a3;
}

- (BOOL)hideFloatingInfoPanel
{
  return self->_hideFloatingInfoPanel;
}

- (double)maximumWhitespaceWidthForInitialZoomToFill
{
  return self->_maximumWhitespaceWidthForInitialZoomToFill;
}

- (double)zoomFactorForContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4
{
}

- (BOOL)shouldInitiallyZoomContentWithSize:(CGSize)a3 toFillViewWithSize:(CGSize)a4
{
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXOneUpSettings)sharedInstance
{
  if (sharedInstance_onceToken_200661 != -1) {
    dispatch_once(&sharedInstance_onceToken_200661, &__block_literal_global_200662);
  }
  v2 = (void *)sharedInstance_sharedInstance_200663;
  return (PXOneUpSettings *)v2;
}

void __33__PXOneUpSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 oneUpSettings];
  v1 = (void *)sharedInstance_sharedInstance_200663;
  sharedInstance_sharedInstance_200663 = v0;
}

+ (id)settingsControllerModule
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941D8];
  v16 = NSStringFromSelector(sel_maximumWhitespaceWidthForInitialZoomToFill);
  v4 = [v3 rowWithTitle:@"Maximum Whitespace For Initial Zoom" valueKeyPath:v16];
  v5 = [v4 minValue:0.0 maxValue:50.0];
  v6 = objc_msgSend(v5, "px_increment:", 1.0);
  v17[0] = v6;
  v7 = (void *)MEMORY[0x1E4F941F0];
  v8 = NSStringFromSelector(sel_hideFloatingInfoPanel);
  v9 = [v7 rowWithTitle:@"Hide Floating Info Panel" valueKeyPath:v8];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v11 = [v2 sectionWithRows:v10 title:@"Settings"];
  v18[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v18[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v14 = [v2 moduleWithTitle:@"One Up" contents:v13];

  return v14;
}

@end