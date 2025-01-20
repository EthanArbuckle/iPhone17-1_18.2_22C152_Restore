@interface PBUIParallaxSettings
+ (id)settingsControllerModule;
- (BOOL)increaseEnabled;
- (BOOL)slideEnabled;
- (BOOL)tiltEnabled;
- (double)slideIncreaseX;
- (double)slideIncreaseY;
- (double)slidePixelsX;
- (double)slidePixelsY;
- (double)tiltDegreesX;
- (double)tiltDegreesY;
- (int64_t)distanceFromScreen;
- (int64_t)slideDirectionX;
- (int64_t)slideDirectionY;
- (int64_t)tiltDirectionX;
- (int64_t)tiltDirectionY;
- (void)setDefaultValues;
- (void)setDistanceFromScreen:(int64_t)a3;
- (void)setIncreaseEnabled:(BOOL)a3;
- (void)setSlideDirectionX:(int64_t)a3;
- (void)setSlideDirectionY:(int64_t)a3;
- (void)setSlideEnabled:(BOOL)a3;
- (void)setSlideIncreaseX:(double)a3;
- (void)setSlideIncreaseY:(double)a3;
- (void)setSlidePixelsX:(double)a3;
- (void)setSlidePixelsY:(double)a3;
- (void)setTiltDegreesX:(double)a3;
- (void)setTiltDegreesY:(double)a3;
- (void)setTiltDirectionX:(int64_t)a3;
- (void)setTiltDirectionY:(int64_t)a3;
- (void)setTiltEnabled:(BOOL)a3;
@end

@implementation PBUIParallaxSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIParallaxSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PBUIParallaxSettings *)self setSlideEnabled:1];
  [(PBUIParallaxSettings *)self setSlideDirectionX:1];
  [(PBUIParallaxSettings *)self setSlideDirectionY:1];
  [(PBUIParallaxSettings *)self setSlidePixelsX:10.0];
  [(PBUIParallaxSettings *)self setSlidePixelsY:10.0];
  [(PBUIParallaxSettings *)self setTiltEnabled:0];
  [(PBUIParallaxSettings *)self setTiltDirectionX:1];
  [(PBUIParallaxSettings *)self setTiltDirectionY:1];
  [(PBUIParallaxSettings *)self setTiltDegreesX:0.0];
  [(PBUIParallaxSettings *)self setTiltDegreesY:0.0];
  [(PBUIParallaxSettings *)self setDistanceFromScreen:0];
  [(PBUIParallaxSettings *)self setIncreaseEnabled:0];
  [(PBUIParallaxSettings *)self setSlideIncreaseX:0.0];
  [(PBUIParallaxSettings *)self setSlideIncreaseY:0.0];
}

+ (id)settingsControllerModule
{
  v59[5] = *MEMORY[0x1E4F143B8];
  v53 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Slide enabled" valueKeyPath:@"slideEnabled"];
  v59[0] = v53;
  v50 = [MEMORY[0x1E4F94108] rowWithTitle:@"Horizontal direction" valueKeyPath:@"slideDirectionX"];
  v47 = [v50 possibleValues:&unk_1F162C570 titles:&unk_1F162C588];
  v44 = [v47 conditionFormat:@"slideEnabled != 0"];
  v59[1] = v44;
  v42 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal offset (pixels)" valueKeyPath:@"slidePixelsX"];
  v39 = [v42 between:0.0 and:200.0];
  v2 = [v39 precision:0];
  objc_super v3 = [v2 conditionFormat:@"slideEnabled != 0"];
  v59[2] = v3;
  v4 = [MEMORY[0x1E4F94108] rowWithTitle:@"Vertical direction" valueKeyPath:@"slideDirectionY"];
  v5 = [v4 possibleValues:&unk_1F162C570 titles:&unk_1F162C588];
  v6 = [v5 conditionFormat:@"slideEnabled != 0"];
  v59[3] = v6;
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical offset (pixels)" valueKeyPath:@"slidePixelsY"];
  v8 = [v7 between:0.0 and:200.0];
  v9 = [v8 precision:0];
  v10 = [v9 conditionFormat:@"slideEnabled != 0"];
  v59[4] = v10;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:5];

  v54 = [MEMORY[0x1E4F94160] sectionWithRows:v41 title:@"Slide"];
  v51 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Tilt enabled" valueKeyPath:@"tiltEnabled"];
  v58[0] = v51;
  v48 = [MEMORY[0x1E4F94108] rowWithTitle:@"Horizontal direction" valueKeyPath:@"tiltDirectionX"];
  v45 = [v48 possibleValues:&unk_1F162C570 titles:&unk_1F162C588];
  v43 = [v45 conditionFormat:@"tiltEnabled != 0"];
  v58[1] = v43;
  v40 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal rotation (degrees)" valueKeyPath:@"tiltDegreesX"];
  v38 = [v40 between:0.0 and:90.0];
  v11 = [v38 precision:1];
  v12 = [v11 conditionFormat:@"tiltEnabled != 0"];
  v58[2] = v12;
  v13 = [MEMORY[0x1E4F94108] rowWithTitle:@"Vertical direction" valueKeyPath:@"tiltDirectionY"];
  v14 = [v13 possibleValues:&unk_1F162C570 titles:&unk_1F162C588];
  v15 = [v14 conditionFormat:@"tiltEnabled != 0"];
  v58[3] = v15;
  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical rotation (degrees)" valueKeyPath:@"tiltDegreesY"];
  v17 = [v16 between:0.0 and:90.0];
  v18 = [v17 precision:1];
  v19 = [v18 conditionFormat:@"tiltEnabled != 0"];
  v58[4] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:5];

  v52 = [MEMORY[0x1E4F94160] sectionWithRows:v20 title:@"Tilt"];
  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"Distance from screen" valueKeyPath:@"distanceFromScreen"];
  v22 = [v21 precision:0];
  v57 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];

  v49 = [MEMORY[0x1E4F94160] sectionWithRows:v23 title:@"Perspective" conditionFormat:@"tiltEnabled != 0"];
  v46 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Lock effects enabled" valueKeyPath:@"increaseEnabled"];
  v56[0] = v46;
  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal slide increase (px)" valueKeyPath:@"slideIncreaseX"];
  v25 = [v24 between:0.0 and:200.0];
  v26 = [v25 precision:0];
  v27 = [v26 conditionFormat:@"increaseEnabled != 0 && slideEnabled != 0"];
  v56[1] = v27;
  v28 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical slide increase (px)" valueKeyPath:@"slideIncreaseY"];
  v29 = [v28 between:0.0 and:200.0];
  v30 = [v29 precision:0];
  v31 = [v30 conditionFormat:@"increaseEnabled != 0 && slideEnabled != 0"];
  v56[2] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];

  v33 = [MEMORY[0x1E4F94160] sectionWithRows:v32 title:@"Directional Lock Effects"];
  v34 = (void *)MEMORY[0x1E4F94160];
  v55[0] = v54;
  v55[1] = v52;
  v55[2] = v49;
  v55[3] = v33;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
  v36 = [v34 moduleWithTitle:0 contents:v35];

  return v36;
}

- (BOOL)slideEnabled
{
  return self->_slideEnabled;
}

- (void)setSlideEnabled:(BOOL)a3
{
  self->_slideEnabled = a3;
}

- (int64_t)slideDirectionX
{
  return self->_slideDirectionX;
}

- (void)setSlideDirectionX:(int64_t)a3
{
  self->_slideDirectionX = a3;
}

- (int64_t)slideDirectionY
{
  return self->_slideDirectionY;
}

- (void)setSlideDirectionY:(int64_t)a3
{
  self->_slideDirectionY = a3;
}

- (double)slidePixelsX
{
  return self->_slidePixelsX;
}

- (void)setSlidePixelsX:(double)a3
{
  self->_slidePixelsX = a3;
}

- (double)slidePixelsY
{
  return self->_slidePixelsY;
}

- (void)setSlidePixelsY:(double)a3
{
  self->_slidePixelsY = a3;
}

- (BOOL)tiltEnabled
{
  return self->_tiltEnabled;
}

- (void)setTiltEnabled:(BOOL)a3
{
  self->_tiltEnabled = a3;
}

- (int64_t)tiltDirectionX
{
  return self->_tiltDirectionX;
}

- (void)setTiltDirectionX:(int64_t)a3
{
  self->_tiltDirectionX = a3;
}

- (int64_t)tiltDirectionY
{
  return self->_tiltDirectionY;
}

- (void)setTiltDirectionY:(int64_t)a3
{
  self->_tiltDirectionY = a3;
}

- (double)tiltDegreesX
{
  return self->_tiltDegreesX;
}

- (void)setTiltDegreesX:(double)a3
{
  self->_tiltDegreesX = a3;
}

- (double)tiltDegreesY
{
  return self->_tiltDegreesY;
}

- (void)setTiltDegreesY:(double)a3
{
  self->_tiltDegreesY = a3;
}

- (int64_t)distanceFromScreen
{
  return self->_distanceFromScreen;
}

- (void)setDistanceFromScreen:(int64_t)a3
{
  self->_distanceFromScreen = a3;
}

- (BOOL)increaseEnabled
{
  return self->_increaseEnabled;
}

- (void)setIncreaseEnabled:(BOOL)a3
{
  self->_increaseEnabled = a3;
}

- (double)slideIncreaseX
{
  return self->_slideIncreaseX;
}

- (void)setSlideIncreaseX:(double)a3
{
  self->_slideIncreaseX = a3;
}

- (double)slideIncreaseY
{
  return self->_slideIncreaseY;
}

- (void)setSlideIncreaseY:(double)a3
{
  self->_slideIncreaseY = a3;
}

@end