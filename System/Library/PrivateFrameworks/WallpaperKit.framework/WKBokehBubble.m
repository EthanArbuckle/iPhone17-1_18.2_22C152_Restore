@interface WKBokehBubble
+ (id)_newFadeAnimationWithSeed:(uint64_t)a1;
+ (id)_newFlickerAnimationWithSeed:(uint64_t)a1;
+ (id)_newScaleAnimationWithSeed:(uint64_t)a1;
- (WKBokehBubble)init;
- (void)_configureAnimationsWithSeed:(void *)a1;
- (void)_configureAppearanceWithSeed:(void *)a1;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)initWithSeed:(void *)a1;
@end

@implementation WKBokehBubble

- (WKBokehBubble)init
{
  int v4 = rand();
  return (WKBokehBubble *)-[WKBokehBubble initWithSeed:](self, (unsigned int *)&v4);
}

- (void)initWithSeed:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)WKBokehBubble;
  id v3 = objc_msgSendSuper2(&v6, sel_init);
  int v4 = v3;
  if (v3)
  {
    [v3 setCompositingFilter:*MEMORY[0x1E4F3A220]];
    -[WKBokehBubble _configureAppearanceWithSeed:](v4, a2);
    -[WKBokehBubble _configureAnimationsWithSeed:](v4, a2);
  }
  return v4;
}

- (void)_configureAppearanceWithSeed:(void *)a1
{
  if (a1)
  {
    double v4 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 2.0) + -1.0);
    double v5 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 2.0) + -1.0);
    double v6 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 1.2) + -1.5);
    objc_msgSend(a1, "setPosition:", v4 * v6, v5 * v6);
    [a1 setZPosition:v6];
    v7 = +[WKBokehImageArbiter imageForZ:](v6);
    [v7 size];
    double v10 = sqrt(v8 * v9) * 0.15 * 0.0078125;
    id v11 = v7;
    objc_msgSend(a1, "setContents:", objc_msgSend(v11, "CGImage"));
    objc_msgSend(a1, "setBounds:", 0.0, 0.0, v10, v10);
    [a1 setOpacity:0.0];
  }
}

- (void)_configureAnimationsWithSeed:(void *)a1
{
  if (a1)
  {
    [a1 removeAllAnimations];
    id v7 = +[WKBokehBubble _newFadeAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
    [v7 setKeyPath:@"opacity"];
    [v7 setDelegate:a1];
    [a1 addAnimation:v7 forKey:@"fade"];
    id v4 = +[WKBokehBubble _newFlickerAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
    [v4 setKeyPath:@"opacity"];
    [a1 addAnimation:v4 forKey:@"flicker"];
    if ((float)((float)rand_r(a2) * 4.6566e-10) < 0.5)
    {
      id v5 = +[WKBokehBubble _newScaleAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
      [v5 setKeyPath:@"transform.scale.x"];
      [a1 addAnimation:v5 forKey:@"squish"];
      id v6 = +[WKBokehBubble _newScaleAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
      [v6 setKeyPath:@"transform.scale.y"];
      [a1 addAnimation:v6 forKey:@"squash"];
    }
  }
}

+ (id)_newFadeAnimationWithSeed:(uint64_t)a1
{
  v13[4] = *MEMORY[0x1E4F143B8];
  self;
  double v3 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 3.0) + 5.0) + 0.0;
  double v4 = v3 + (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 14.0) + 3.0);
  double v5 = v4 + (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 3.0) + 5.0);
  id v6 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v6 setAdditive:1];
  [v6 setValues:&unk_1F18C1EB0];
  id v7 = [NSNumber numberWithDouble:0.0 / v5];
  v13[0] = v7;
  double v8 = [NSNumber numberWithDouble:v3 / v5];
  v13[1] = v8;
  double v9 = [NSNumber numberWithDouble:v4 / v5];
  v13[2] = v9;
  double v10 = [NSNumber numberWithDouble:v5 / v5];
  v13[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  [v6 setKeyTimes:v11];

  [v6 setDuration:v5];
  return v6;
}

+ (id)_newFlickerAnimationWithSeed:(uint64_t)a1
{
  v30[4] = *MEMORY[0x1E4F143B8];
  self;
  int v3 = rand_r(a2);
  float v4 = (float)rand_r(a2) * 4.6566e-10;
  float v5 = (float)rand_r(a2) * 4.6566e-10;
  float v6 = (float)(v5 * 0.2) + 0.3;
  float v7 = (float)(v5 * 0.5) + 0.5;
  if (v4 >= 0.15) {
    float v8 = v7;
  }
  else {
    float v8 = v6;
  }
  float v9 = (float)rand_r(a2) * 4.6566e-10;
  float v10 = (float)rand_r(a2) * 4.6566e-10;
  float v11 = v10 + 0.5;
  float v12 = (float)(v10 * 0.4) + 0.1;
  if (v9 < 0.15) {
    float v12 = v11;
  }
  double v13 = v12 * 0.5;
  double v14 = v13 + 0.0;
  double v15 = v13 + 0.0 + v8;
  double v16 = v13 + v15;
  id v17 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v17 setAdditive:1];
  v30[0] = &unk_1F18C1E38;
  v30[1] = &unk_1F18C1E38;
  double v18 = -(float)((float)((float)((float)v3 * 4.6566e-10) * 0.1) + 0.0);
  v19 = [NSNumber numberWithDouble:v18];
  v30[2] = v19;
  v20 = [NSNumber numberWithDouble:v18];
  v30[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v17 setValues:v21];

  v22 = [NSNumber numberWithDouble:0.0 / v16];
  v29[0] = v22;
  v23 = [NSNumber numberWithDouble:v14 / v16];
  v29[1] = v23;
  v24 = [NSNumber numberWithDouble:v15 / v16];
  v29[2] = v24;
  v25 = [NSNumber numberWithDouble:v16 / v16];
  v29[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v17 setKeyTimes:v26];

  [v17 setDuration:v16];
  [v17 setAutoreverses:1];
  LODWORD(v27) = 2139095040;
  [v17 setRepeatCount:v27];
  CAFrameRateRange v31 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  objc_msgSend(v17, "setPreferredFrameRateRange:", *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);
  return v17;
}

+ (id)_newScaleAnimationWithSeed:(uint64_t)a1
{
  v19[4] = *MEMORY[0x1E4F143B8];
  self;
  double v3 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 0.4) + 0.2) * 0.5;
  double v4 = v3 + 0.0;
  double v5 = v3 + 0.0 + 0.4;
  double v6 = v3 + v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v7 setAdditive:1];
  v19[0] = &unk_1F18C1E38;
  v19[1] = &unk_1F18C1E38;
  float v8 = [NSNumber numberWithDouble:-0.025];
  v19[2] = v8;
  float v9 = [NSNumber numberWithDouble:-0.025];
  v19[3] = v9;
  float v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v7 setValues:v10];

  float v11 = [NSNumber numberWithDouble:0.0 / v6];
  v18[0] = v11;
  float v12 = [NSNumber numberWithDouble:v4 / v6];
  v18[1] = v12;
  double v13 = [NSNumber numberWithDouble:v5 / v6];
  v18[2] = v13;
  double v14 = [NSNumber numberWithDouble:v6 / v6];
  v18[3] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  [v7 setKeyTimes:v15];

  [v7 setDuration:v6];
  *(float *)&double v6 = v6;
  [v7 setTimeOffset:(float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * *(float *)&v6) + 0.0)];
  [v7 setAutoreverses:1];
  LODWORD(v16) = 2139095040;
  [v7 setRepeatCount:v16];
  CAFrameRateRange v20 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
  return v7;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    unsigned int v5 = rand();
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    -[WKBokehBubble _configureAppearanceWithSeed:](self, &v5);
    -[WKBokehBubble _configureAnimationsWithSeed:](self, &v5);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

@end