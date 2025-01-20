@interface PXVideoPlaybackSettings
+ (PXVideoPlaybackSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)isDownloadingVideoSegmentsEnabled;
- (double)maxHighlightFractionForDisplay;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setIsDownloadingVideoSegmentsEnabled:(BOOL)a3;
- (void)setMaxHighlightFractionForDisplay:(double)a3;
@end

@implementation PXVideoPlaybackSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXVideoPlaybackSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXVideoPlaybackSettings *)self setMaxHighlightFractionForDisplay:0.9];
  [(PXVideoPlaybackSettings *)self setIsDownloadingVideoSegmentsEnabled:1];
}

- (void)setMaxHighlightFractionForDisplay:(double)a3
{
  self->_maxHighlightFractionForDisplay = a3;
}

- (void)setIsDownloadingVideoSegmentsEnabled:(BOOL)a3
{
  self->_isDownloadingVideoSegmentsEnabled = a3;
}

- (double)maxHighlightFractionForDisplay
{
  return self->_maxHighlightFractionForDisplay;
}

- (BOOL)isDownloadingVideoSegmentsEnabled
{
  return self->_isDownloadingVideoSegmentsEnabled;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXVideoPlaybackSettings)sharedInstance
{
  if (sharedInstance_onceToken_102360 != -1) {
    dispatch_once(&sharedInstance_onceToken_102360, &__block_literal_global_102361);
  }
  v2 = (void *)sharedInstance_sharedInstance_102362;
  return (PXVideoPlaybackSettings *)v2;
}

void __41__PXVideoPlaybackSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 videoPlaybackSettings];
  v1 = (void *)sharedInstance_sharedInstance_102362;
  sharedInstance_sharedInstance_102362 = v0;
}

+ (id)settingsControllerModule
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v4 = NSStringFromSelector(sel_isDownloadingVideoSegmentsEnabled);
  v5 = [v3 rowWithTitle:@"Download Video Segments" valueKeyPath:v4];
  v18[0] = v5;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v7 = NSStringFromSelector(sel_maxHighlightFractionForDisplay);
  v8 = [v6 rowWithTitle:@"Max Highlight Fraction" valueKeyPath:v7];
  v9 = [v8 minValue:0.5 maxValue:1.0];
  v18[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v11 = [v2 sectionWithRows:v10 title:@"Settings"];

  v12 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v13 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v11;
  v17[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v13 moduleWithTitle:@"Video Playback" contents:v14];

  return v15;
}

@end