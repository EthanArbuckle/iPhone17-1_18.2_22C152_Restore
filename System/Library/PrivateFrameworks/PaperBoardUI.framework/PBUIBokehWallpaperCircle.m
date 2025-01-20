@interface PBUIBokehWallpaperCircle
+ (id)_newFadeAnimation;
+ (id)_newFlickerAnimation;
+ (id)_newScaleAnimation;
- (CGRect)superviewBounds;
- (PBUIBokehWallpaperCircle)initWithSuperviewBounds:(CGRect)a3 color:(int64_t)a4;
- (void)_pauseAnimations;
- (void)_resumeAnimations;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)configureAnimationsWithPhase:(double)a3;
- (void)randomize;
- (void)setAnimationsEnabled:(BOOL)a3;
- (void)setColor:(int64_t)a3;
- (void)setSuperviewBounds:(CGRect)a3;
- (void)updatePositionWithTime:(double)a3 dx:(double)a4 dy:(double)a5 lockScreen:(BOOL)a6;
@end

@implementation PBUIBokehWallpaperCircle

- (PBUIBokehWallpaperCircle)initWithSuperviewBounds:(CGRect)a3 color:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PBUIBokehWallpaperCircle;
  v9 = [(PBUIBokehWallpaperCircle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_superviewBounds.origin.CGFloat x = x;
    v9->_superviewBounds.origin.CGFloat y = y;
    v9->_superviewBounds.size.CGFloat width = width;
    v9->_superviewBounds.size.CGFloat height = height;
    v9->_color = a4;
    [(PBUIBokehWallpaperCircle *)v9 randomize];
  }
  return v10;
}

- (void)randomize
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(PBUIBokehWallpaperCircle *)self setOpacity:0.0];
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = (float)((float)((float)((float)rand() * 4.6566e-10) * 130.0) + 40.0);
  double v6 = 1.0;
  if (v4 == 1) {
    double v6 = 1.5;
  }
  double v7 = v6 * v5;
  CGRect v21 = CGRectInset(self->_superviewBounds, v6 * v5 * -0.5, v6 * v5 * -0.5);
  CGFloat y = v21.origin.y;
  CGFloat height = v21.size.height;
  float x = v21.origin.x;
  float width = v21.size.width;
  double v12 = (float)(x + (float)((float)((float)rand() * 4.6566e-10) * (float)(width - x)));
  *(float *)&CGFloat y = y;
  *(float *)&CGFloat height = height;
  double v13 = (float)(*(float *)&y + (float)((float)((float)rand() * 4.6566e-10) * (float)(*(float *)&height - *(float *)&y)));
  -[PBUIBokehWallpaperCircle setBounds:](self, "setBounds:", 0.0, 0.0, v7, v7);
  -[PBUIBokehWallpaperCircle setPosition:](self, "setPosition:", v12, v13);
  [(PBUIBokehWallpaperCircle *)self setZPosition:v7];
  uint64_t v14 = +[PBUIBokehImageArbiter bokehImageForDiameter:](v7);
  +[PBUIBokehImageArbiter imageForBokehImage:]((uint64_t)PBUIBokehImageArbiter, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  -[PBUIBokehWallpaperCircle setContents:](self, "setContents:", [v15 CGImage]);

  [(PBUIBokehWallpaperCircle *)self setColor:self->_color];
  double v16 = (float)((float)((float)((float)rand() * 4.6566e-10) * 6.2832) + 0.0);
  double v17 = (float)((float)((float)((float)rand() * 4.6566e-10) * 0.07) + 0.0);
  __double2 v18 = __sincos_stret(v16);
  self->_dxdt = v18.__cosval * v17;
  self->_dydt = v18.__sinval * v17;
  self->_speed = v7 * 1.5 / 170.0;
  [(PBUIBokehWallpaperCircle *)self configureAnimationsWithPhase:0.0];
  v19 = (void *)MEMORY[0x1E4F39CF8];
  [v19 commit];
}

- (void)updatePositionWithTime:(double)a3 dx:(double)a4 dy:(double)a5 lockScreen:(BOOL)a6
{
  BOOL v6 = a6;
  v11 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 35.0;
  if (v6) {
    double v13 = 140.0;
  }
  if (v12 == 1) {
    double v14 = v13 * 1.5;
  }
  else {
    double v14 = v13;
  }
  [(PBUIBokehWallpaperCircle *)self position];
  double speed = self->_speed;
  double v17 = v16 + (self->_dxdt + speed * a4 * v14) * 60.0 * a3;
  double v19 = v18 + (self->_dydt + -(a5 * speed) * v14) * 60.0 * a3;
  -[PBUIBokehWallpaperCircle setPosition:](self, "setPosition:", v17, v19);
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
  uint64_t v4 = +[PBUIBokehColorArbiter randomCircleColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, a3);
  uint64_t v5 = [v4 cgColor];

  [(PBUIBokehWallpaperCircle *)self setContentsMultiplyColor:v5];
}

- (void)configureAnimationsWithPhase:(double)a3
{
  [(PBUIBokehWallpaperCircle *)self removeAllAnimations];
  id v8 = +[PBUIBokehWallpaperCircle _newFadeAnimation];
  [v8 setDelegate:self];
  [v8 setKeyPath:@"opacity"];
  [v8 setTimeOffset:a3];
  [(PBUIBokehWallpaperCircle *)self addAnimation:v8 forKey:@"fade"];
  id v5 = +[PBUIBokehWallpaperCircle _newFlickerAnimation];
  [v5 setKeyPath:@"opacity"];
  [(PBUIBokehWallpaperCircle *)self addAnimation:v5 forKey:@"flicker"];
  if ((float)((float)rand() * 4.6566e-10) < 0.5)
  {
    id v6 = +[PBUIBokehWallpaperCircle _newScaleAnimation];
    [v6 setKeyPath:@"transform.scale.x"];
    [(PBUIBokehWallpaperCircle *)self addAnimation:v6 forKey:@"scale.x"];
    id v7 = +[PBUIBokehWallpaperCircle _newScaleAnimation];
    [v7 setKeyPath:@"transform.scale.y"];
    [(PBUIBokehWallpaperCircle *)self addAnimation:v7 forKey:@"scale.y"];
  }
}

- (void)setAnimationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(PBUIBokehWallpaperCircle *)self speed];
  if ((v5 != 0.0) != v3)
  {
    if (v3)
    {
      [(PBUIBokehWallpaperCircle *)self _resumeAnimations];
    }
    else
    {
      [(PBUIBokehWallpaperCircle *)self _pauseAnimations];
    }
  }
}

- (void)_pauseAnimations
{
  [(PBUIBokehWallpaperCircle *)self convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;
  [(PBUIBokehWallpaperCircle *)self setSpeed:0.0];
  [(PBUIBokehWallpaperCircle *)self setTimeOffset:v4];
}

- (void)_resumeAnimations
{
  [(PBUIBokehWallpaperCircle *)self timeOffset];
  double v4 = v3;
  LODWORD(v3) = 1.0;
  [(PBUIBokehWallpaperCircle *)self setSpeed:v3];
  [(PBUIBokehWallpaperCircle *)self setTimeOffset:0.0];
  [(PBUIBokehWallpaperCircle *)self setBeginTime:0.0];
  [(PBUIBokehWallpaperCircle *)self convertTime:0 fromLayer:CACurrentMediaTime()];
  [(PBUIBokehWallpaperCircle *)self setBeginTime:v5 - v4];
  id v6 = [(PBUIBokehWallpaperCircle *)self animationForKey:@"fade"];

  if (!v6)
  {
    [(PBUIBokehWallpaperCircle *)self configureAnimationsWithPhase:0.0];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(PBUIBokehWallpaperCircle *)self randomize];
  }
}

+ (id)_newFadeAnimation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  double v2 = (float)((float)((float)((float)rand() * 4.6566e-10) * 3.0) + 5.0) + 0.0;
  double v3 = v2 + (float)((float)((float)((float)rand() * 4.6566e-10) * 14.0) + 3.0);
  double v4 = v3 + (float)((float)((float)((float)rand() * 4.6566e-10) * 3.0) + 5.0);
  id v5 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v5 setAdditive:1];
  [v5 setValues:&unk_1F162C5A0];
  id v6 = [NSNumber numberWithDouble:0.0 / v4];
  v12[0] = v6;
  id v7 = [NSNumber numberWithDouble:v2 / v4];
  v12[1] = v7;
  id v8 = [NSNumber numberWithDouble:v3 / v4];
  v12[2] = v8;
  v9 = [NSNumber numberWithDouble:v4 / v4];
  v12[3] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  [v5 setKeyTimes:v10];

  [v5 setDuration:v4];
  CAFrameRateRange v13 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  return v5;
}

+ (id)_newFlickerAnimation
{
  v31[4] = *MEMORY[0x1E4F143B8];
  int v2 = rand();
  float v3 = (float)rand() * 4.6566e-10;
  float v4 = (float)rand() * 4.6566e-10;
  float v5 = (float)(v4 * 0.2) + 0.3;
  float v6 = (float)(v4 * 0.5) + 0.5;
  if (v3 >= 0.15) {
    float v7 = v6;
  }
  else {
    float v7 = v5;
  }
  float v8 = (float)rand() * 4.6566e-10;
  float v9 = (float)rand() * 4.6566e-10;
  float v10 = v9 + 0.5;
  float v11 = (float)(v9 * 0.4) + 0.1;
  if (v8 < 0.15) {
    float v11 = v10;
  }
  double v12 = v7;
  double v13 = (float)((float)((float)((float)v2 * 4.6566e-10) * 0.1) + 0.0);
  double v14 = v11 * 0.5;
  double v15 = v14 + 0.0;
  double v16 = v14 + 0.0 + v12;
  double v17 = v14 + v16;
  id v18 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v18 setAdditive:1];
  v31[0] = &unk_1F162C690;
  v31[1] = &unk_1F162C690;
  double v19 = -v13;
  v20 = [NSNumber numberWithDouble:v19];
  v31[2] = v20;
  CGRect v21 = [NSNumber numberWithDouble:v19];
  v31[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v18 setValues:v22];

  v23 = [NSNumber numberWithDouble:0.0 / v17];
  v30[0] = v23;
  v24 = [NSNumber numberWithDouble:v15 / v17];
  v30[1] = v24;
  v25 = [NSNumber numberWithDouble:v16 / v17];
  v30[2] = v25;
  v26 = [NSNumber numberWithDouble:v17 / v17];
  v30[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v18 setKeyTimes:v27];

  [v18 setDuration:v17];
  [v18 setAutoreverses:1];
  LODWORD(v28) = 2139095040;
  [v18 setRepeatCount:v28];
  CAFrameRateRange v32 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v18, "setPreferredFrameRateRange:", *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);
  return v18;
}

+ (id)_newScaleAnimation
{
  v18[4] = *MEMORY[0x1E4F143B8];
  double v2 = (float)((float)((float)((float)rand() * 4.6566e-10) * 0.4) + 0.2) * 0.5;
  double v3 = v2 + 0.0;
  double v4 = v2 + 0.0 + 0.4;
  double v5 = v2 + v4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v6 setAdditive:1];
  v18[0] = &unk_1F162C690;
  v18[1] = &unk_1F162C690;
  float v7 = [NSNumber numberWithDouble:-0.0125];
  v18[2] = v7;
  float v8 = [NSNumber numberWithDouble:-0.0125];
  v18[3] = v8;
  float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  [v6 setValues:v9];

  float v10 = [NSNumber numberWithDouble:0.0 / v5];
  v17[0] = v10;
  float v11 = [NSNumber numberWithDouble:v3 / v5];
  v17[1] = v11;
  double v12 = [NSNumber numberWithDouble:v4 / v5];
  v17[2] = v12;
  double v13 = [NSNumber numberWithDouble:v5 / v5];
  v17[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  [v6 setKeyTimes:v14];

  [v6 setDuration:v5];
  *(float *)&double v5 = v5;
  [v6 setTimeOffset:(float)((float)((float)((float)rand() * 4.6566e-10) * *(float *)&v5) + 0.0)];
  [v6 setAutoreverses:1];
  LODWORD(v15) = 2139095040;
  [v6 setRepeatCount:v15];
  CAFrameRateRange v19 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  return v6;
}

- (CGRect)superviewBounds
{
  double x = self->_superviewBounds.origin.x;
  double y = self->_superviewBounds.origin.y;
  double width = self->_superviewBounds.size.width;
  double height = self->_superviewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSuperviewBounds:(CGRect)a3
{
  self->_superviewBounds = a3;
}

@end