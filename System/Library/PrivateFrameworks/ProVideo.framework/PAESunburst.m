@interface PAESunburst
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (PAESunburst)initWithAPIManager:(id)a3;
- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4;
- (id)properties;
- (void)dealloc;
- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:;
@end

@implementation PAESunburst

- (PAESunburst)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESunburst;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAESunburst;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PixelTransformSupport", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  objc_super v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A3D0];
  if (v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v2, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Sun Color", 0, 0), 9, 0, 1.0, 0.5, 0.0, 1.0);
    objc_msgSend(v2, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Background Color", 0, 0), 10, 0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Number of Arms", 0, 0), 2, 0, 20.0, 2.0, 4096.0, 2.0, 255.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Radius", 0, 0), 3, 32, 200.0, 0.0, 4096.0, 0.0, 2000.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Inner Radius", 0, 0), 4, 32, 0.5, 0.01, 1.0, 0.01, 1.0, 0.1);
    objc_msgSend(v2, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Rotation", 0, 0), 5, 0, 0.0, -3600.0, 3600.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Waviness Amplitude", 0, 0), 6, 0, 0.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Waviness Frequency", 0, 0), 7, 0, 2.2, 0.0, 10.0, 0.0, 10.0, 1.0);
    objc_msgSend(v2, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Waviness Phase", 0, 0), 8, 0, 0.0, -1000.0, 1000.0, -10.0, 10.0, 1.0);
    objc_msgSend(v2, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v3, "localizedStringForKey:value:table:", @"Sunburst::Contrast", 0, 0), 11, 0, 0.75, 0.0, 1.0, 0.0, 1.0, 0.1);
    [v2 addFloatSliderWithName:@"Hidden Inner Radius" parmId:12 defaultValue:2 parameterMin:100.0 parameterMax:0.0 sliderMin:4096.0 sliderMax:0.0 delta:4096.0 parmFlags:1.0];
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
  long long v25 = xmmword_1B7E74178;
  long long v26 = unk_1B7E74188;
  long long v27 = xmmword_1B7E74198;
  long long v28 = unk_1B7E741A8;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  long long v14 = xmmword_1B7E733E0;
  uint64_t v15 = 0;
  double v16 = a5;
  long long v17 = xmmword_1B7E74178;
  long long v18 = unk_1B7E74188;
  long long v19 = xmmword_1B7E74198;
  long long v20 = unk_1B7E741A8;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAESunburst multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAESunburst multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", objc_msgSend(a7, "inversePixelTransform"), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13)), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  uint64_t v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  double v8 = v7;
  if (v7)
  {
    double v66 = 300.0;
    double v67 = 20.0;
    uint64_t v64 = 0;
    double v65 = 0.5;
    double v62 = 0.0;
    double v63 = 0.0;
    double v60 = 0.0;
    double v61 = 0.0;
    double v58 = 0.0;
    double v59 = 0.0;
    double v56 = 1.0;
    double v57 = 0.0;
    double v54 = 1.0;
    double v55 = 1.0;
    double __x = 0.5;
    double v53 = 1.0;
    [v7 getFloatValue:&v67 fromParm:2 atFxTime:a4->var0.var1];
    [v8 getFloatValue:&v66 fromParm:3 atFxTime:a4->var0.var1];
    [v8 getFloatValue:&v65 fromParm:4 atFxTime:a4->var0.var1];
    double v9 = v67;
    if (v67 == 3.0)
    {
      double v9 = v65;
      if (v65 == 0.5) {
        double v65 = 0.49999;
      }
    }
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v64, 5, a4->var0.var1, v9);
    [v8 getFloatValue:&v63 fromParm:6 atFxTime:a4->var0.var1];
    double v63 = v63 / 10.0;
    [v8 getFloatValue:&v62 fromParm:7 atFxTime:a4->var0.var1];
    double v62 = v62 / 10.0;
    [v8 getFloatValue:&v61 fromParm:8 atFxTime:a4->var0.var1];
    [v8 getRedValue:&v60 greenValue:&v59 blueValue:&v58 alphaValue:&v57 fromParm:9 atFxTime:a4->var0.var1];
    double v59 = v57 * v59;
    double v60 = v57 * v60;
    double v58 = v57 * v58;
    [v8 getRedValue:&v56 greenValue:&v55 blueValue:&v54 alphaValue:&v53 fromParm:10 atFxTime:a4->var0.var1];
    double v55 = v53 * v55;
    double v56 = v53 * v56;
    double v54 = v53 * v54;
    [v8 getFloatValue:&__x fromParm:11 atFxTime:a4->var0.var1];
    double __x = pow(__x, 3.0);
    [a3 bounds];
    double v11 = v10;
    double v13 = v12;
    double v50 = 0.5;
    double v51 = 0.5;
    [v8 getXValue:&v51 YValue:&v50 fromParm:1 atFxTime:a4->var0.var1];
    double v50 = v13 * (0.5 - v50);
    double v51 = v11 * (0.5 - v51);
    v49 = 0;
    -[PAESunburst getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v49, a3);
    double v14 = v67;
    uint64_t v15 = (HgcSunburst *)HGObject::operator new(0x1A0uLL);
    HgcSunburst::HgcSunburst(v15);
    double v16 = v66;
    double v17 = v65;
    __double2 v18 = __sincos_stret(6.28318531 / v14 * 0.5);
    __double2 v19 = __sincos_stret(6.28318531 / v14);
    float v20 = 6.28318531 / v14;
    (*(void (**)(HgcSunburst *, void, float, double, double, double))(*(void *)v15 + 96))(v15, 0, v20, 0.0, 0.0, 0.0);
    float v21 = v60;
    float v22 = v59;
    float v23 = v58;
    float v24 = v57;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 1, v21, v22, v23, v24);
    float v25 = v56;
    float v26 = v55;
    float v27 = v54;
    float v28 = v53;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 2, v25, v26, v27, v28);
    float v29 = *v49;
    float v30 = v49[1];
    float v31 = v49[2];
    float v32 = v49[3];
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 3, v29, v30, v31, v32);
    float v33 = v49[4];
    float v34 = v49[5];
    float v35 = v49[6];
    float v36 = v49[7];
    (*(void (**)(HgcSunburst *, uint64_t, float, float, float, float))(*(void *)v15 + 96))(v15, 4, v33, v34, v35, v36);
    float v37 = __x;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 9, v37, 0.0, 0.0, 0.0);
    float v38 = v16 * v17;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 5, v38, 0.0, 0.0, 0.0);
    float v39 = v18.__cosval * v16;
    float v40 = v18.__sinval * v16;
    (*(void (**)(HgcSunburst *, uint64_t, float, float, double, double))(*(void *)v15 + 96))(v15, 6, v39, v40, 0.0, 0.0);
    (*(void (**)(HgcSunburst *, uint64_t, float, float, double, double))(*(void *)v15 + 96))(v15, 7, v39, v40, 0.0, 0.0);
    float v41 = v19.__cosval * (v16 * v17);
    float v42 = v19.__sinval * (v16 * v17);
    (*(void (**)(HgcSunburst *, uint64_t, float, float, double, double))(*(void *)v15 + 96))(v15, 8, v41, v42, 0.0, 0.0);
    float v43 = v66;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 10, v43, 0.0, 0.0, 0.0);
    float v44 = v63 / 6.28318531;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 11, v44, 0.0, 0.0, 0.0);
    float v45 = v62;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 12, v45, 0.0, 0.0, 0.0);
    float v46 = v61;
    (*(void (**)(HgcSunburst *, uint64_t, float, double, double, double))(*(void *)v15 + 96))(v15, 13, v46, 0.0, 0.0, 0.0);
    v48 = v15;
    (*(void (**)(HgcSunburst *))(*(void *)v15 + 16))(v15);
    [a3 setHeliumRef:&v48];
    if (v48) {
      (*(void (**)(HgcSunburst *))(*(void *)v48 + 24))(v48);
    }
    (*(void (**)(HgcSunburst *))(*(void *)v15 + 24))(v15);
  }
  return v8 != 0;
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