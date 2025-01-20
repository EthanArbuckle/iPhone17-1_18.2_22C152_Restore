@interface PXStoryScrubberLayoutSettings
+ (PXStoryScrubberLayoutSettings)sharedInstance;
+ (id)_sliderFor:(id)a3 path:(id)a4;
+ (id)settingsControllerModule;
- (double)assetCornerRadius;
- (double)currentAssetPadding;
- (double)currentAssetWidthLandscape;
- (double)currentAssetWidthPortrait;
- (double)defaultAssetPadding;
- (double)defaultAssetWidthLandscape;
- (double)defaultAssetWidthPortrait;
- (double)scrubberHeightLandscape;
- (double)scrubberHeightPortrait;
- (id)parentSettings;
- (void)setAssetCornerRadius:(double)a3;
- (void)setCurrentAssetPadding:(double)a3;
- (void)setCurrentAssetWidthLandscape:(double)a3;
- (void)setCurrentAssetWidthPortrait:(double)a3;
- (void)setDefaultAssetPadding:(double)a3;
- (void)setDefaultAssetWidthLandscape:(double)a3;
- (void)setDefaultAssetWidthPortrait:(double)a3;
- (void)setDefaultValues;
- (void)setScrubberHeightLandscape:(double)a3;
- (void)setScrubberHeightPortrait:(double)a3;
@end

@implementation PXStoryScrubberLayoutSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayoutSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXStoryScrubberLayoutSettings *)self setCurrentAssetWidthLandscape:40.0];
  [(PXStoryScrubberLayoutSettings *)self setCurrentAssetWidthPortrait:44.0];
  [(PXStoryScrubberLayoutSettings *)self setDefaultAssetWidthLandscape:24.0];
  [(PXStoryScrubberLayoutSettings *)self setDefaultAssetWidthPortrait:27.0];
  [(PXStoryScrubberLayoutSettings *)self currentAssetWidthLandscape];
  -[PXStoryScrubberLayoutSettings setScrubberHeightLandscape:](self, "setScrubberHeightLandscape:");
  [(PXStoryScrubberLayoutSettings *)self setScrubberHeightPortrait:44.0];
  [(PXStoryScrubberLayoutSettings *)self setCurrentAssetPadding:12.0];
  [(PXStoryScrubberLayoutSettings *)self setDefaultAssetPadding:6.0];
  [(PXStoryScrubberLayoutSettings *)self setAssetCornerRadius:4.0];
}

- (void)setScrubberHeightPortrait:(double)a3
{
  self->_scrubberHeightPortrait = a3;
}

- (void)setScrubberHeightLandscape:(double)a3
{
  self->_scrubberHeightLandscape = a3;
}

- (void)setDefaultAssetWidthPortrait:(double)a3
{
  self->_defaultAssetWidthPortrait = a3;
}

- (void)setDefaultAssetWidthLandscape:(double)a3
{
  self->_defaultAssetWidthLandscape = a3;
}

- (void)setDefaultAssetPadding:(double)a3
{
  self->_defaultAssetPadding = a3;
}

- (void)setCurrentAssetWidthPortrait:(double)a3
{
  self->_currentAssetWidthPortrait = a3;
}

- (void)setCurrentAssetWidthLandscape:(double)a3
{
  self->_currentAssetWidthLandscape = a3;
}

- (void)setCurrentAssetPadding:(double)a3
{
  self->_currentAssetPadding = a3;
}

- (void)setAssetCornerRadius:(double)a3
{
  self->_assetCornerRadius = a3;
}

- (double)currentAssetWidthLandscape
{
  return self->_currentAssetWidthLandscape;
}

+ (id)_sliderFor:(id)a3 path:(id)a4
{
  v4 = [MEMORY[0x1E4F941D8] rowWithTitle:a3 valueKeyPath:a4];
  v5 = [v4 minValue:1.0 maxValue:100.0];
  v6 = objc_msgSend(v5, "px_increment:", 1.0);

  return v6;
}

+ (id)settingsControllerModule
{
  v45[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  id v24 = (id)MEMORY[0x1E4F94160];
  v40 = NSStringFromSelector(sel_currentAssetWidthLandscape);
  v39 = [a1 _sliderFor:@"Current Asset Width" path:v40];
  v44[0] = v39;
  v38 = NSStringFromSelector(sel_defaultAssetWidthLandscape);
  v37 = [a1 _sliderFor:@"Default Asset Width" path:v38];
  v44[1] = v37;
  v36 = NSStringFromSelector(sel_scrubberHeightLandscape);
  v35 = [a1 _sliderFor:@"Scrubber Height" path:v36];
  v44[2] = v35;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v33 = [v3 sectionWithRows:v34 title:@"Landscape Mode"];
  v45[0] = v33;
  v4 = (void *)MEMORY[0x1E4F94160];
  v32 = NSStringFromSelector(sel_currentAssetWidthPortrait);
  v31 = [a1 _sliderFor:@"Current Asset Width" path:v32];
  v43[0] = v31;
  v30 = NSStringFromSelector(sel_defaultAssetWidthPortrait);
  v29 = [a1 _sliderFor:@"Default Asset Width" path:v30];
  v43[1] = v29;
  v28 = NSStringFromSelector(sel_scrubberHeightPortrait);
  v27 = [a1 _sliderFor:@"Scrubber Height" path:v28];
  v43[2] = v27;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  v23 = [v4 sectionWithRows:v26 title:@"Portrait Mode"];
  v45[1] = v23;
  v5 = (void *)MEMORY[0x1E4F94160];
  v22 = NSStringFromSelector(sel_currentAssetPadding);
  v21 = [a1 _sliderFor:@"Current Asset Padding" path:v22];
  v42[0] = v21;
  v20 = NSStringFromSelector(sel_defaultAssetPadding);
  v19 = [a1 _sliderFor:@"Default Asset Padding" path:v20];
  v42[1] = v19;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v7 = [v5 sectionWithRows:v6 title:@"Horizontal Padding"];
  v45[2] = v7;
  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F941D8];
  v10 = NSStringFromSelector(sel_assetCornerRadius);
  v11 = [v9 rowWithTitle:@"Asset Corner Radius" valueKeyPath:v10];
  v12 = [v11 minValue:0.0 maxValue:15.0];
  v13 = objc_msgSend(v12, "px_increment:", 1.0);
  v41 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v15 = [v8 sectionWithRows:v14 title:@"Appearance"];
  v45[3] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v45[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
  id v25 = [v24 moduleWithTitle:@"Layout Settings" contents:v17];

  return v25;
}

- (double)assetCornerRadius
{
  return self->_assetCornerRadius;
}

- (double)defaultAssetPadding
{
  return self->_defaultAssetPadding;
}

- (double)currentAssetPadding
{
  return self->_currentAssetPadding;
}

- (double)scrubberHeightPortrait
{
  return self->_scrubberHeightPortrait;
}

- (double)scrubberHeightLandscape
{
  return self->_scrubberHeightLandscape;
}

- (double)defaultAssetWidthPortrait
{
  return self->_defaultAssetWidthPortrait;
}

- (double)defaultAssetWidthLandscape
{
  return self->_defaultAssetWidthLandscape;
}

- (double)currentAssetWidthPortrait
{
  return self->_currentAssetWidthPortrait;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance];
}

+ (PXStoryScrubberLayoutSettings)sharedInstance
{
  if (sharedInstance_onceToken_117489 != -1) {
    dispatch_once(&sharedInstance_onceToken_117489, &__block_literal_global_117490);
  }
  v2 = (void *)sharedInstance_sharedInstance_117491;
  return (PXStoryScrubberLayoutSettings *)v2;
}

void __47__PXStoryScrubberLayoutSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXStorySettings sharedInstance];
  uint64_t v0 = [v2 scrubberLayoutSettings];
  v1 = (void *)sharedInstance_sharedInstance_117491;
  sharedInstance_sharedInstance_117491 = v0;
}

@end