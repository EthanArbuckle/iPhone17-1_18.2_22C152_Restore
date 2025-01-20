@interface PXStoryConcreteTimelineSettings
+ (PXStoryConcreteTimelineSettings)sharedInstance;
+ (id)settingsControllerModule;
- (double)initialProductionTimeLimit;
- (double)kenBurnsPanSpeed;
- (double)kenBurnsRotationSpeed;
- (double)kenBurnsScaleSpeed;
- (double)kenBurnsScaleSpeedDuringRotation;
- (double)rotationInitialProductionTimeLimit;
- (double)subsequentProductionTimeLimit;
- (id)parentSettings;
- (int64_t)initialProductionCountLimit;
- (int64_t)rotationInitialProductionCountLimit;
- (void)setDefaultValues;
- (void)setInitialProductionCountLimit:(int64_t)a3;
- (void)setInitialProductionTimeLimit:(double)a3;
- (void)setKenBurnsPanSpeed:(double)a3;
- (void)setKenBurnsRotationSpeed:(double)a3;
- (void)setKenBurnsScaleSpeed:(double)a3;
- (void)setKenBurnsScaleSpeedDuringRotation:(double)a3;
- (void)setRotationInitialProductionCountLimit:(int64_t)a3;
- (void)setRotationInitialProductionTimeLimit:(double)a3;
- (void)setSubsequentProductionTimeLimit:(double)a3;
@end

@implementation PXStoryConcreteTimelineSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteTimelineSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXStoryConcreteTimelineSettings *)self setKenBurnsPanSpeed:10.0];
  [(PXStoryConcreteTimelineSettings *)self setKenBurnsScaleSpeed:10.0];
  [(PXStoryConcreteTimelineSettings *)self setKenBurnsRotationSpeed:3.0];
  [(PXStoryConcreteTimelineSettings *)self setKenBurnsScaleSpeedDuringRotation:5.0];
  [(PXStoryConcreteTimelineSettings *)self setInitialProductionCountLimit:1];
  [(PXStoryConcreteTimelineSettings *)self setInitialProductionTimeLimit:0.0];
  [(PXStoryConcreteTimelineSettings *)self setRotationInitialProductionCountLimit:0];
  [(PXStoryConcreteTimelineSettings *)self setRotationInitialProductionTimeLimit:0.05];
  [(PXStoryConcreteTimelineSettings *)self setSubsequentProductionTimeLimit:1.0];
}

- (void)setSubsequentProductionTimeLimit:(double)a3
{
  self->_subsequentProductionTimeLimit = a3;
}

- (void)setRotationInitialProductionTimeLimit:(double)a3
{
  self->_rotationInitialProductionTimeLimit = a3;
}

- (void)setRotationInitialProductionCountLimit:(int64_t)a3
{
  self->_rotationInitialProductionCountLimit = a3;
}

- (void)setKenBurnsScaleSpeedDuringRotation:(double)a3
{
  self->_kenBurnsScaleSpeedDuringRotation = a3;
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (void)setKenBurnsRotationSpeed:(double)a3
{
  self->_kenBurnsRotationSpeed = a3;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (void)setInitialProductionTimeLimit:(double)a3
{
  self->_initialProductionTimeLimit = a3;
}

- (void)setInitialProductionCountLimit:(int64_t)a3
{
  self->_initialProductionCountLimit = a3;
}

+ (id)settingsControllerModule
{
  v60[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v31 = (id)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941D8];
  v57 = NSStringFromSelector(sel_kenBurnsPanSpeed);
  v56 = [v3 rowWithTitle:@"Pan Speed (pt/s)" valueKeyPath:v57];
  v55 = [v56 minValue:0.0 maxValue:200.0];
  v54 = objc_msgSend(v55, "px_increment:", 1.0);
  v59[0] = v54;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v53 = NSStringFromSelector(sel_kenBurnsScaleSpeed);
  v52 = [v4 rowWithTitle:@"Scale Speed (pt/s at furthest edge)" valueKeyPath:v53];
  v51 = [v52 minValue:0.0 maxValue:200.0];
  v50 = objc_msgSend(v51, "px_increment:", 1.0);
  v59[1] = v50;
  v5 = (void *)MEMORY[0x1E4F941D8];
  v49 = NSStringFromSelector(sel_kenBurnsRotationSpeed);
  v48 = [v5 rowWithTitle:@"Rotation Speed (°/s)" valueKeyPath:v49];
  v47 = [v48 minValue:0.0 maxValue:30.0];
  v46 = objc_msgSend(v47, "px_increment:", 1.0);
  v59[2] = v46;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v45 = NSStringFromSelector(sel_kenBurnsScaleSpeedDuringRotation);
  v44 = [v6 rowWithTitle:@"Scale Speed during Rotation (pt/s at furthest edge)" valueKeyPath:v45];
  v43 = [v44 minValue:0.0 maxValue:200.0];
  v42 = objc_msgSend(v43, "px_increment:", 1.0);
  v59[3] = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
  v40 = [v2 sectionWithRows:v41 title:@"Movements"];
  v60[0] = v40;
  v27 = (void *)MEMORY[0x1E4F94160];
  v7 = (void *)MEMORY[0x1E4F941D8];
  v39 = NSStringFromSelector(sel_initialProductionCountLimit);
  v38 = [v7 rowWithTitle:@"Initial Count" valueKeyPath:v39];
  v37 = [v38 minValue:0.0 maxValue:50.0];
  v36 = objc_msgSend(v37, "px_increment:", 1.0);
  v58[0] = v36;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v35 = NSStringFromSelector(sel_initialProductionTimeLimit);
  v34 = [v8 rowWithTitle:@"Initial Time" valueKeyPath:v35];
  v33 = [v34 minValue:0.0 maxValue:0.1];
  v30 = objc_msgSend(v33, "px_increment:", 0.005);
  v58[1] = v30;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v29 = NSStringFromSelector(sel_rotationInitialProductionCountLimit);
  v28 = [v9 rowWithTitle:@"Rotation Initial Count" valueKeyPath:v29];
  v26 = [v28 minValue:0.0 maxValue:50.0];
  v25 = objc_msgSend(v26, "px_increment:", 1.0);
  v58[2] = v25;
  v10 = (void *)MEMORY[0x1E4F941D8];
  v24 = NSStringFromSelector(sel_rotationInitialProductionTimeLimit);
  v23 = [v10 rowWithTitle:@"Rotation Initial Time" valueKeyPath:v24];
  v11 = [v23 minValue:0.0 maxValue:0.1];
  v12 = objc_msgSend(v11, "px_increment:", 0.005);
  v58[3] = v12;
  v13 = (void *)MEMORY[0x1E4F941D8];
  v14 = NSStringFromSelector(sel_subsequentProductionTimeLimit);
  v15 = [v13 rowWithTitle:@"Subsequent Time" valueKeyPath:v14];
  v16 = [v15 minValue:0.0 maxValue:2.0];
  v17 = objc_msgSend(v16, "px_increment:", 0.1);
  v58[4] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:5];
  v19 = [v27 sectionWithRows:v18 title:@"Production Limits"];
  v60[1] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v60[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  id v32 = [v31 moduleWithTitle:@"Concrete Timeline" contents:v21];

  return v32;
}

- (double)subsequentProductionTimeLimit
{
  return self->_subsequentProductionTimeLimit;
}

- (double)rotationInitialProductionTimeLimit
{
  return self->_rotationInitialProductionTimeLimit;
}

- (int64_t)rotationInitialProductionCountLimit
{
  return self->_rotationInitialProductionCountLimit;
}

- (double)initialProductionTimeLimit
{
  return self->_initialProductionTimeLimit;
}

- (int64_t)initialProductionCountLimit
{
  return self->_initialProductionCountLimit;
}

- (double)kenBurnsScaleSpeedDuringRotation
{
  return self->_kenBurnsScaleSpeedDuringRotation;
}

- (double)kenBurnsRotationSpeed
{
  return self->_kenBurnsRotationSpeed;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance];
}

+ (PXStoryConcreteTimelineSettings)sharedInstance
{
  if (sharedInstance_onceToken_223985 != -1) {
    dispatch_once(&sharedInstance_onceToken_223985, &__block_literal_global_223986);
  }
  v2 = (void *)sharedInstance_sharedInstance_223987;
  return (PXStoryConcreteTimelineSettings *)v2;
}

void __49__PXStoryConcreteTimelineSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXStorySettings sharedInstance];
  uint64_t v0 = [v2 concreteTimelineSettings];
  v1 = (void *)sharedInstance_sharedInstance_223987;
  sharedInstance_sharedInstance_223987 = v0;
}

@end