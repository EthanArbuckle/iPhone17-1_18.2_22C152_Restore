@interface PXSwipeDownSettings
+ (PXSwipeDownSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)rotationOnHorizontalMotion;
- (BOOL)rotationOnVerticalMotion;
- (double)downResistanceDistance;
- (double)horizontalResistanceDistance;
- (double)rotationHorizontalMotionFactor;
- (double)rotationHorizontalMotionHysteresisDistance;
- (double)rotationMaximumAngle;
- (double)rotationVerticalMotionAngle;
- (double)rotationVerticalMotionResistanceDistance;
- (double)scaleDownDistance;
- (double)scaleDownFactor;
- (double)transitionDistance;
- (double)upResistanceDistance;
- (id)parentSettings;
- (int64_t)downMotionType;
- (int64_t)horizontalMotionType;
- (int64_t)upMotionType;
- (void)setDefaultValues;
- (void)setDownMotionType:(int64_t)a3;
- (void)setDownResistanceDistance:(double)a3;
- (void)setHorizontalMotionType:(int64_t)a3;
- (void)setHorizontalResistanceDistance:(double)a3;
- (void)setRotationHorizontalMotionFactor:(double)a3;
- (void)setRotationHorizontalMotionHysteresisDistance:(double)a3;
- (void)setRotationMaximumAngle:(double)a3;
- (void)setRotationOnHorizontalMotion:(BOOL)a3;
- (void)setRotationOnVerticalMotion:(BOOL)a3;
- (void)setRotationVerticalMotionAngle:(double)a3;
- (void)setRotationVerticalMotionResistanceDistance:(double)a3;
- (void)setScaleDownDistance:(double)a3;
- (void)setScaleDownFactor:(double)a3;
- (void)setTransitionDistance:(double)a3;
- (void)setUpMotionType:(int64_t)a3;
- (void)setUpResistanceDistance:(double)a3;
@end

@implementation PXSwipeDownSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXSwipeDownSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXSwipeDownSettings *)self setHorizontalMotionType:1];
  [(PXSwipeDownSettings *)self setHorizontalResistanceDistance:100.0];
  [(PXSwipeDownSettings *)self setDownMotionType:0];
  [(PXSwipeDownSettings *)self setDownResistanceDistance:200.0];
  [(PXSwipeDownSettings *)self setUpMotionType:1];
  [(PXSwipeDownSettings *)self setUpResistanceDistance:100.0];
  [(PXSwipeDownSettings *)self setScaleDownFactor:0.5];
  [(PXSwipeDownSettings *)self setScaleDownDistance:200.0];
  [(PXSwipeDownSettings *)self setRotationOnHorizontalMotion:0];
  [(PXSwipeDownSettings *)self setRotationHorizontalMotionFactor:50.0];
  [(PXSwipeDownSettings *)self setRotationHorizontalMotionHysteresisDistance:20.0];
  [(PXSwipeDownSettings *)self setRotationOnVerticalMotion:0];
  [(PXSwipeDownSettings *)self setRotationVerticalMotionAngle:7.0];
  [(PXSwipeDownSettings *)self setRotationVerticalMotionResistanceDistance:400.0];
  [(PXSwipeDownSettings *)self setRotationMaximumAngle:12.0];
  [(PXSwipeDownSettings *)self setTransitionDistance:400.0];
}

- (void)setUpResistanceDistance:(double)a3
{
  self->_upResistanceDistance = a3;
}

- (void)setUpMotionType:(int64_t)a3
{
  self->_upMotionType = a3;
}

- (void)setTransitionDistance:(double)a3
{
  self->_transitionDistance = a3;
}

- (void)setScaleDownFactor:(double)a3
{
  self->_scaleDownFactor = a3;
}

- (void)setScaleDownDistance:(double)a3
{
  self->_scaleDownDistance = a3;
}

- (void)setRotationVerticalMotionResistanceDistance:(double)a3
{
  self->_rotationVerticalMotionResistanceDistance = a3;
}

- (void)setRotationVerticalMotionAngle:(double)a3
{
  self->_rotationVerticalMotionAngle = a3;
}

- (void)setRotationOnVerticalMotion:(BOOL)a3
{
  self->_rotationOnVerticalMotion = a3;
}

- (void)setRotationOnHorizontalMotion:(BOOL)a3
{
  self->_rotationOnHorizontalMotion = a3;
}

- (void)setRotationMaximumAngle:(double)a3
{
  self->_rotationMaximumAngle = a3;
}

- (void)setRotationHorizontalMotionHysteresisDistance:(double)a3
{
  self->_rotationHorizontalMotionHysteresisDistance = a3;
}

- (void)setRotationHorizontalMotionFactor:(double)a3
{
  self->_rotationHorizontalMotionFactor = a3;
}

- (void)setHorizontalResistanceDistance:(double)a3
{
  self->_horizontalResistanceDistance = a3;
}

- (void)setHorizontalMotionType:(int64_t)a3
{
  self->_horizontalMotionType = a3;
}

- (void)setDownResistanceDistance:(double)a3
{
  self->_downResistanceDistance = a3;
}

- (void)setDownMotionType:(int64_t)a3
{
  self->_downMotionType = a3;
}

- (double)transitionDistance
{
  return self->_transitionDistance;
}

- (double)rotationMaximumAngle
{
  return self->_rotationMaximumAngle;
}

- (double)rotationVerticalMotionResistanceDistance
{
  return self->_rotationVerticalMotionResistanceDistance;
}

- (double)rotationVerticalMotionAngle
{
  return self->_rotationVerticalMotionAngle;
}

- (BOOL)rotationOnVerticalMotion
{
  return self->_rotationOnVerticalMotion;
}

- (double)rotationHorizontalMotionHysteresisDistance
{
  return self->_rotationHorizontalMotionHysteresisDistance;
}

- (double)rotationHorizontalMotionFactor
{
  return self->_rotationHorizontalMotionFactor;
}

- (BOOL)rotationOnHorizontalMotion
{
  return self->_rotationOnHorizontalMotion;
}

- (double)scaleDownDistance
{
  return self->_scaleDownDistance;
}

- (double)scaleDownFactor
{
  return self->_scaleDownFactor;
}

- (double)upResistanceDistance
{
  return self->_upResistanceDistance;
}

- (int64_t)upMotionType
{
  return self->_upMotionType;
}

- (double)downResistanceDistance
{
  return self->_downResistanceDistance;
}

- (int64_t)downMotionType
{
  return self->_downMotionType;
}

- (double)horizontalResistanceDistance
{
  return self->_horizontalResistanceDistance;
}

- (int64_t)horizontalMotionType
{
  return self->_horizontalMotionType;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v62[16] = *MEMORY[0x1E4F143B8];
  v43 = (void *)MEMORY[0x1E4F94160];
  v60 = [MEMORY[0x1E4F94108] rowWithTitle:@"Horizontal Motion" valueKeyPath:@"horizontalMotionType"];
  v59 = [v60 possibleValues:&unk_1F02D4198 titles:&unk_1F02D41B0];
  v62[0] = v59;
  v58 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Horizontal Resistance Distance" valueKeyPath:@"horizontalResistanceDistance"];
  v57 = [v58 minValue:10.0 maxValue:500.0];
  v56 = objc_msgSend(v57, "px_increment:", 10.0);
  v55 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"horizontalMotionType == %@", &unk_1F02D7A80];
  v54 = [v56 condition:v55];
  v62[1] = v54;
  v53 = [MEMORY[0x1E4F94108] rowWithTitle:@"Down Motion" valueKeyPath:@"downMotionType"];
  v52 = [v53 possibleValues:&unk_1F02D4198 titles:&unk_1F02D41B0];
  v62[2] = v52;
  v51 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Down Resistance Distance" valueKeyPath:@"downResistanceDistance"];
  v50 = [v51 minValue:10.0 maxValue:500.0];
  v49 = objc_msgSend(v50, "px_increment:", 10.0);
  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"downMotionType == %@", &unk_1F02D7A80];
  v47 = [v49 condition:v48];
  v62[3] = v47;
  v46 = [MEMORY[0x1E4F94108] rowWithTitle:@"Up Motion" valueKeyPath:@"upMotionType"];
  v45 = [v46 possibleValues:&unk_1F02D4198 titles:&unk_1F02D41B0];
  v62[4] = v45;
  v42 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Up Resistance Distance" valueKeyPath:@"upResistanceDistance"];
  v41 = [v42 minValue:10.0 maxValue:500.0];
  v40 = objc_msgSend(v41, "px_increment:", 10.0);
  v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"upMotionType == %@", &unk_1F02D7A80];
  v38 = [v40 condition:v39];
  v62[5] = v38;
  v37 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Scale Down Factor" valueKeyPath:@"scaleDownFactor"];
  v36 = [v37 minValue:0.0 maxValue:1.0];
  v35 = objc_msgSend(v36, "px_increment:", 0.100000001);
  v62[6] = v35;
  v34 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Scale Down Distance" valueKeyPath:@"scaleDownDistance"];
  v33 = [v34 minValue:10.0 maxValue:500.0];
  v32 = objc_msgSend(v33, "px_increment:", 10.0);
  v62[7] = v32;
  v31 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rotation on Horizontal Motion" valueKeyPath:@"rotationOnHorizontalMotion"];
  v62[8] = v31;
  v30 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Factor" valueKeyPath:@"rotationHorizontalMotionFactor"];
  v29 = [v30 minValue:0.0 maxValue:300.0];
  v28 = objc_msgSend(v29, "px_increment:", 1.0);
  v27 = [v28 conditionFormat:@"rotationOnHorizontalMotion != 0"];
  v62[9] = v27;
  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Hysteresis Distance" valueKeyPath:@"rotationHorizontalMotionHysteresisDistance"];
  v25 = [v26 minValue:0.0 maxValue:100.0];
  v24 = objc_msgSend(v25, "px_increment:", 1.0);
  v23 = [v24 conditionFormat:@"rotationOnHorizontalMotion != 0"];
  v62[10] = v23;
  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rotation on Vertical Motion" valueKeyPath:@"rotationOnVerticalMotion"];
  v62[11] = v22;
  v21 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Angle" valueKeyPath:@"rotationVerticalMotionAngle"];
  v20 = [v21 minValue:0.0 maxValue:10.0];
  v19 = objc_msgSend(v20, "px_increment:", 0.5);
  v18 = [v19 conditionFormat:@"rotationOnVerticalMotion != 0"];
  v62[12] = v18;
  v17 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Distance" valueKeyPath:@"rotationVerticalMotionResistanceDistance"];
  v2 = [v17 minValue:0.0 maxValue:500.0];
  objc_super v3 = objc_msgSend(v2, "px_increment:", 10.0);
  v4 = [v3 conditionFormat:@"rotationOnVerticalMotion != 0"];
  v62[13] = v4;
  v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Maximum Angle" valueKeyPath:@"rotationMaximumAngle"];
  v6 = [v5 minValue:0.0 maxValue:45.0];
  v7 = objc_msgSend(v6, "px_increment:", 1.0);
  v62[14] = v7;
  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Transition Distance" valueKeyPath:@"transitionDistance"];
  v9 = [v8 minValue:10.0 maxValue:500.0];
  v10 = objc_msgSend(v9, "px_increment:", 10.0);
  v62[15] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:16];
  v44 = [v43 sectionWithRows:v11];

  v12 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v13 = (void *)MEMORY[0x1E4F94160];
  v61[0] = v44;
  v61[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v15 = [v13 moduleWithTitle:@"Swipe Down" contents:v14];

  return v15;
}

+ (PXSwipeDownSettings)sharedInstance
{
  if (sharedInstance_onceToken_100894 != -1) {
    dispatch_once(&sharedInstance_onceToken_100894, &__block_literal_global_100895);
  }
  v2 = (void *)sharedInstance_sharedInstance_100896;
  return (PXSwipeDownSettings *)v2;
}

void __37__PXSwipeDownSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 swipeDownSettings];
  v1 = (void *)sharedInstance_sharedInstance_100896;
  sharedInstance_sharedInstance_100896 = v0;
}

@end