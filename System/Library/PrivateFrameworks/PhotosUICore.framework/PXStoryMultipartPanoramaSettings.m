@interface PXStoryMultipartPanoramaSettings
+ (PXStoryMultipartPanoramaSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)isFeatureEnabled;
- (double)maximumTileSide;
- (double)productionReportsTimeInterval;
- (double)productionSimulatedDelay;
- (double)tileOverlapThreshold;
- (id)parentSettings;
- (int64_t)maximumNumberOfParts;
- (int64_t)overlappingTileCount;
- (void)setDefaultValues;
- (void)setIsFeatureEnabled:(BOOL)a3;
- (void)setMaximumNumberOfParts:(int64_t)a3;
- (void)setMaximumTileSide:(double)a3;
- (void)setOverlappingTileCount:(int64_t)a3;
- (void)setProductionReportsTimeInterval:(double)a3;
- (void)setProductionSimulatedDelay:(double)a3;
- (void)setTileOverlapThreshold:(double)a3;
@end

@implementation PXStoryMultipartPanoramaSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMultipartPanoramaSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXStoryMultipartPanoramaSettings *)self setIsFeatureEnabled:_os_feature_enabled_impl()];
  [(PXStoryMultipartPanoramaSettings *)self setMaximumNumberOfParts:3];
  [(PXStoryMultipartPanoramaSettings *)self setOverlappingTileCount:7];
  [(PXStoryMultipartPanoramaSettings *)self setMaximumTileSide:300.0];
  [(PXStoryMultipartPanoramaSettings *)self setTileOverlapThreshold:0.6];
  [(PXStoryMultipartPanoramaSettings *)self setProductionSimulatedDelay:0.0];
  [(PXStoryMultipartPanoramaSettings *)self setProductionReportsTimeInterval:1.0];
}

- (void)setTileOverlapThreshold:(double)a3
{
  self->_tileOverlapThreshold = a3;
}

- (void)setProductionSimulatedDelay:(double)a3
{
  self->_productionSimulatedDelay = a3;
}

- (void)setProductionReportsTimeInterval:(double)a3
{
  self->_productionReportsTimeInterval = a3;
}

- (void)setOverlappingTileCount:(int64_t)a3
{
  self->_overlappingTileCount = a3;
}

- (void)setMaximumTileSide:(double)a3
{
  self->_maximumTileSide = a3;
}

- (void)setMaximumNumberOfParts:(int64_t)a3
{
  self->_maximumNumberOfParts = a3;
}

- (void)setIsFeatureEnabled:(BOOL)a3
{
  self->_isFeatureEnabled = a3;
}

- (double)productionReportsTimeInterval
{
  return self->_productionReportsTimeInterval;
}

- (double)productionSimulatedDelay
{
  return self->_productionSimulatedDelay;
}

- (double)tileOverlapThreshold
{
  return self->_tileOverlapThreshold;
}

- (double)maximumTileSide
{
  return self->_maximumTileSide;
}

- (int64_t)overlappingTileCount
{
  return self->_overlappingTileCount;
}

- (int64_t)maximumNumberOfParts
{
  return self->_maximumNumberOfParts;
}

- (BOOL)isFeatureEnabled
{
  return self->_isFeatureEnabled;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v41 = NSStringFromSelector(sel_isFeatureEnabled);
  v40 = [v3 rowWithTitle:@"Enabled" valueKeyPath:v41];
  v42[0] = v40;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v39 = NSStringFromSelector(sel_maximumNumberOfParts);
  v38 = [v4 rowWithTitle:@"Maximum Parts" valueKeyPath:v39];
  v37 = [v38 minValue:1.0 maxValue:10.0];
  v36 = objc_msgSend(v37, "px_increment:", 1.0);
  v42[1] = v36;
  v5 = (void *)MEMORY[0x1E4F941D8];
  v35 = NSStringFromSelector(sel_overlappingTileCount);
  v34 = [v5 rowWithTitle:@"Overlapping Tiles" valueKeyPath:v35];
  v33 = [v34 minValue:1.0 maxValue:10.0];
  v32 = objc_msgSend(v33, "px_increment:", 1.0);
  v42[2] = v32;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v31 = NSStringFromSelector(sel_maximumTileSide);
  v30 = [v6 rowWithTitle:@"Maximum Tile Side" valueKeyPath:v31];
  v29 = [v30 minValue:10.0 maxValue:1000.0];
  v28 = objc_msgSend(v29, "px_increment:", 1.0);
  v42[3] = v28;
  v7 = (void *)MEMORY[0x1E4F941D8];
  v27 = NSStringFromSelector(sel_tileOverlapThreshold);
  v26 = [v7 rowWithTitle:@"Overlap Threshold" valueKeyPath:v27];
  v25 = [v26 minValue:0.0 maxValue:1.0];
  v24 = objc_msgSend(v25, "px_increment:", 0.1);
  v42[4] = v24;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v23 = NSStringFromSelector(sel_productionSimulatedDelay);
  v22 = [v8 rowWithTitle:@"Simulated Delay" valueKeyPath:v23];
  v21 = [v22 minValue:0.0 maxValue:5.0];
  v9 = objc_msgSend(v21, "px_increment:", 0.1);
  v42[5] = v9;
  v10 = (void *)MEMORY[0x1E4F941D8];
  v11 = NSStringFromSelector(sel_productionReportsTimeInterval);
  v12 = [v10 rowWithTitle:@"Report Time Interval" valueKeyPath:v11];
  v13 = [v12 minValue:0.0 maxValue:5.0];
  v14 = objc_msgSend(v13, "px_increment:", 0.1);
  v42[6] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
  v16 = [v2 sectionWithRows:v15 title:@"Settings"];
  v43[0] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v43[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v19 = [v2 moduleWithTitle:@"Multipart Panoramas" contents:v18];

  return v19;
}

+ (PXStoryMultipartPanoramaSettings)sharedInstance
{
  if (sharedInstance_onceToken_173331 != -1) {
    dispatch_once(&sharedInstance_onceToken_173331, &__block_literal_global_173332);
  }
  v2 = (void *)sharedInstance_sharedInstance_173333;
  return (PXStoryMultipartPanoramaSettings *)v2;
}

void __50__PXStoryMultipartPanoramaSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXStorySettings sharedInstance];
  uint64_t v0 = [v2 multipartPanoramaSettings];
  v1 = (void *)sharedInstance_sharedInstance_173333;
  sharedInstance_sharedInstance_173333 = v0;
}

@end