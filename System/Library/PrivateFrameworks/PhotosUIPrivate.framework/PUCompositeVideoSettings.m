@interface PUCompositeVideoSettings
+ (PUCompositeVideoSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)useFrameBlending;
- (double)nonStitchingFadeDuration;
- (double)stitchingFadeDuration;
- (id)parentSettings;
- (int64_t)cropMode;
- (void)setCropMode:(int64_t)a3;
- (void)setDefaultValues;
- (void)setNonStitchingFadeDuration:(double)a3;
- (void)setStitchingFadeDuration:(double)a3;
- (void)setUseFrameBlending:(BOOL)a3;
@end

@implementation PUCompositeVideoSettings

- (void)setNonStitchingFadeDuration:(double)a3
{
  self->_nonStitchingFadeDuration = a3;
}

- (void)setDefaultValues
{
  [(PUCompositeVideoSettings *)self setUseFrameBlending:0];
  [(PUCompositeVideoSettings *)self setCropMode:0];
  [(PUCompositeVideoSettings *)self setStitchingFadeDuration:0.25];
  [(PUCompositeVideoSettings *)self setNonStitchingFadeDuration:0.5];
}

- (void)setUseFrameBlending:(BOOL)a3
{
  self->_useFrameBlending = a3;
}

- (void)setStitchingFadeDuration:(double)a3
{
  self->_stitchingFadeDuration = a3;
}

- (void)setCropMode:(int64_t)a3
{
  self->_cropMode = a3;
}

+ (id)settingsControllerModule
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F941A8];
  v3 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Stitch Fade" valueKeyPath:@"stitchingFadeDuration"];
  v4 = [v3 minValue:0.0 maxValue:1.0];
  v28[0] = v4;
  v5 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Concat Fade" valueKeyPath:@"nonStitchingFadeDuration"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v28[1] = v6;
  v7 = [MEMORY[0x1E4F941A0] rowWithTitle:@"Crop Mode" valueKeyPath:@"cropMode"];
  v8 = [v7 possibleValues:&unk_1F078B6D8 titles:&unk_1F078B6F0];
  v28[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v10 = [v2 sectionWithRows:v9 title:@"Rendering"];

  v11 = (void *)MEMORY[0x1E4F941A8];
  v12 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Use Frame Blending In Preview" valueKeyPath:@"useFrameBlending"];
  v27 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v14 = [v11 sectionWithRows:v13 title:@"Playback"];

  v15 = (void *)MEMORY[0x1E4F94160];
  v16 = (void *)MEMORY[0x1E4F940F8];
  v17 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v18 = [v16 rowWithTitle:@"Restore Defaults" action:v17];
  v26 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v20 = [v15 sectionWithRows:v19];

  v21 = (void *)MEMORY[0x1E4F94160];
  v25[0] = v10;
  v25[1] = v14;
  v25[2] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v23 = [v21 moduleWithTitle:@"Composite Video" contents:v22];

  return v23;
}

+ (PUCompositeVideoSettings)sharedInstance
{
  if (sharedInstance_onceToken_89652 != -1) {
    dispatch_once(&sharedInstance_onceToken_89652, &__block_literal_global_89653);
  }
  v2 = (void *)sharedInstance_sharedInstance_89654;
  return (PUCompositeVideoSettings *)v2;
}

void __42__PUCompositeVideoSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 compositeVideoSettings];
  v1 = (void *)sharedInstance_sharedInstance_89654;
  sharedInstance_sharedInstance_89654 = v0;
}

- (double)nonStitchingFadeDuration
{
  return self->_nonStitchingFadeDuration;
}

- (double)stitchingFadeDuration
{
  return self->_stitchingFadeDuration;
}

- (int64_t)cropMode
{
  return self->_cropMode;
}

- (BOOL)useFrameBlending
{
  return self->_useFrameBlending;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

@end