@interface PAEOverlappingCircles
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (PAEOverlappingCircles)initWithAPIManager:(id)a3;
- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4;
- (id)properties;
- (void)dealloc;
- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:;
@end

@implementation PAEOverlappingCircles

- (PAEOverlappingCircles)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEOverlappingCircles;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEOverlappingCircles;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithInt:3];
  uint64_t v5 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PixelTransformSupport", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  objc_super v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A3D0];
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v2, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Center", 0, 0), 7, 32, 0.5, 0.5);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Color 1", 0, 0), 3, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Color 2", 0, 0), 4, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Background Color", 0, 0), 8, 0, 0.5, 0.5, 0.5, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Size", 0, 0), 1, 0, 80.0, 1.0, 1000.0, 1.0, 500.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Circle Offset", 0, 0), 2, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v2, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Angle", 0, 0), 6, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v2, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Overlapping Circles::Contrast", 0, 0), 5, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
  }
  return v2 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a3, "matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v6 = (double *)[a4 matrix];
  uint64_t v7 = 0;
  double v8 = *v6;
  double v9 = v6[1];
  double v10 = v6[2];
  double v11 = v6[3];
  double v12 = v6[4];
  double v13 = v6[5];
  double v14 = v6[6];
  double v15 = v6[7];
  double v16 = v6[8];
  double v17 = v6[9];
  double v18 = v6[10];
  double v19 = v6[11];
  double v20 = v6[12];
  double v21 = v6[13];
  uint64_t v22 = v5 + 96;
  double v23 = v6[14];
  double v24 = v6[15];
  do
  {
    double v25 = *(double *)(v5 + v7);
    double v26 = *(double *)(v22 + v7 - 64);
    double v27 = *(double *)(v22 + v7 - 32);
    double v28 = *(double *)(v22 + v7);
    v29 = (double *)((char *)&v31 + v7);
    double *v29 = v25 * v8 + v26 * v9 + v27 * v10 + v28 * v11;
    v29[4] = v25 * v12 + v26 * v13 + v27 * v14 + v28 * v15;
    v29[8] = v25 * v16 + v26 * v17 + v27 * v18 + v28 * v19;
    v29[12] = v25 * v20 + v26 * v21 + v27 * v23 + v28 * v24;
    v7 += 8;
  }
  while (v7 != 32);
  return [[FxMatrix44 alloc] initWithMatrix44Data:&v31];
}

- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __double2 v12 = __sincos_stret(a6);
  v21[0] = *(void *)&v12.__cosval;
  *(double *)&v21[1] = -v12.__sinval;
  v21[2] = 0;
  v21[3] = 0;
  __double2 v22 = v12;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v25 = xmmword_1B7E74058;
  long long v26 = unk_1B7E74068;
  long long v27 = xmmword_1B7E74078;
  long long v28 = unk_1B7E74088;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  long long v14 = xmmword_1B7E733E0;
  uint64_t v15 = 0;
  double v16 = a5;
  long long v17 = xmmword_1B7E74058;
  long long v18 = unk_1B7E74068;
  long long v19 = xmmword_1B7E74078;
  long long v20 = unk_1B7E74088;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAEOverlappingCircles multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAEOverlappingCircles multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", objc_msgSend(a7, "inversePixelTransform"), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13)), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  uint64_t v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v7)
  {
    [a3 bounds];
    double v9 = v8;
    double v11 = v10;
    double v59 = 80.0;
    [v7 getFloatValue:&v59 fromParm:1 atFxTime:a4->var0.var1];
    double v58 = 1.0;
    [v7 getFloatValue:&v58 fromParm:2 atFxTime:a4->var0.var1];
    double v12 = sqrt(v59 * v59 * 0.5);
    double v58 = (v58 * 0.414213562 + 1.0) * v12 + (v58 * 0.414213562 + 1.0) * v12;
    double v57 = 0.0;
    [v7 getFloatValue:&v57 fromParm:6 atFxTime:a4->var0.var1];
    double v57 = -v57;
    double v56 = 0.5;
    double v55 = 0.5;
    [v7 getXValue:&v56 YValue:&v55 fromParm:7 atFxTime:a4->var0.var1];
    double v13 = v9 * (0.5 - v56);
    double v14 = v11 * (0.5 - v55);
    double v53 = 0.0;
    double v54 = 0.0;
    double v51 = 0.0;
    double v52 = 0.0;
    [v7 getRedValue:&v54 greenValue:&v53 blueValue:&v52 alphaValue:&v51 fromParm:3 atFxTime:a4->var0.var1];
    double v53 = v51 * v53;
    double v54 = v51 * v54;
    double v52 = v51 * v52;
    double v49 = 0.0;
    double v50 = 0.0;
    double v47 = 0.0;
    double v48 = 0.0;
    [v7 getRedValue:&v50 greenValue:&v49 blueValue:&v48 alphaValue:&v47 fromParm:4 atFxTime:a4->var0.var1];
    double v49 = v47 * v49;
    double v50 = v47 * v50;
    double v48 = v47 * v48;
    double v45 = 0.0;
    double v46 = 0.0;
    double v43 = 0.0;
    double v44 = 0.0;
    [v7 getRedValue:&v46 greenValue:&v45 blueValue:&v44 alphaValue:&v43 fromParm:8 atFxTime:a4->var0.var1];
    double v45 = v43 * v45;
    double v46 = v43 * v46;
    double v44 = v43 * v44;
    double v42 = 1.0;
    [v7 getFloatValue:&v42 fromParm:5 atFxTime:a4->var0.var1];
    double v42 = v42 * v42;
    v41 = 0;
    [(PAEOverlappingCircles *)self getTransformMatrix:&v41 forCenterX:a3 centerY:v13 angle:v14 andOutputImage:v57];
    uint64_t v15 = (HgcOverlappingCircles *)HGObject::operator new(0x1A0uLL);
    HgcOverlappingCircles::HgcOverlappingCircles(v15);
    float v16 = v59;
    (*(void (**)(HgcOverlappingCircles *, void, float, double, double, double))(*(void *)v15 + 96))(v15, 0, v16, 0.0, 0.0, 0.0);
    float v17 = v58;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 1, v17, 0.0, 0.0, 0.0);
    float v18 = v54;
    float v19 = v53;
    float v20 = v52;
    float v21 = v51;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 2, v18, v19, v20, v21);
    float v22 = v50;
    float v23 = v49;
    float v24 = v48;
    float v25 = v47;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 3, v22, v23, v24, v25);
    float v26 = v46;
    float v27 = v45;
    float v28 = v44;
    float v29 = v43;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 4, v26, v27, v28, v29);
    float v30 = v42;
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 7, v30, 0.0, 0.0, 0.0);
    float v31 = *v41;
    float v32 = v41[1];
    float v33 = v41[2];
    float v34 = v41[3];
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 5, v31, v32, v33, v34);
    float v35 = v41[4];
    float v36 = v41[5];
    float v37 = v41[6];
    float v38 = v41[7];
    (*(void (**)(HgcOverlappingCircles *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 6, v35, v36, v37, v38);
    v40 = v15;
    (*(void (**)(HgcOverlappingCircles *))(*(void *)v15 + 16))(v15);
    [a3 setHeliumRef:&v40];
    if (v40) {
      (*(void (**)(HgcOverlappingCircles *))(*(void *)v40 + 24))(v40);
    }
    (*(void (**)(HgcOverlappingCircles *))(*(void *)v15 + 24))(v15);
  }
  return v7 != 0;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 0;
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end