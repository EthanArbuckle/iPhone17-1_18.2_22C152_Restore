@interface PAETint
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAETint)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAETint

- (PAETint)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAETint;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithInt:6];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:0];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithBool:1];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:590080];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PixelTransformSupport", v4, @"PixelIndependent", v5, @"PositionIndependent", v6, @"MayRemapTime", v7, @"SupportsLargeRenderScale", v8, @"SupportsHeliumRendering", v9, @"SDRWorkingSpace", v10, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1),
               @"AutoColorProcessingSupport",
               0);
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAETint;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"TintFx::Color", 0, 0), 1, 0, 0.360784314, 0.203921569, 0.0901960784);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"TintFx::Intensity", 0, 0), 2, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (!v11) {
    return 0;
  }
  v12 = (void *)v11;
  if ([a4 imageType] - 4 < 0xFFFFFFFE) {
    return 0;
  }
  double v29 = 0.0;
  double v30 = 0.0;
  double v28 = 0.0;
  BOOL v13 = 1;
  [v10 getRedValue:&v30 greenValue:&v29 blueValue:&v28 fromParm:1 atFxTime:a5->var0.var1];
  double v27 = 0.0;
  [v10 getFloatValue:&v27 fromParm:2 atFxTime:a5->var0.var1];
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
    && [a4 imageType] == 3)
  {
    v15 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
    if (!v15) {
      return 0;
    }
    if (![v15 versionAtCreation])
    {
      double v29 = v29 * 0.78;
      double v30 = v30 * 0.78;
      double v28 = v28 * 0.78;
    }
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v26 = 0;
    }
    v16 = (HgcTint *)HGObject::operator new(0x1A0uLL);
    HgcTint::HgcTint(v16);
    (*(void (**)(HgcTint *, void, uint64_t))(*(void *)v16 + 120))(v16, 0, v26);
    float v17 = v30;
    float v18 = v29;
    float v19 = v28;
    (*(void (**)(HgcTint *, void, float, float, float, double))(*(void *)v16 + 96))(v16, 0, v17, v18, v19, 0.0);
    float v20 = v27;
    (*(void (**)(HgcTint *, uint64_t, float, double, double, double))(*(void *)v16 + 96))(v16, 1, v20, 0.0, 0.0, 0.0);
    v21 = (double *)objc_msgSend((id)objc_msgSend(v12, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    float v22 = *v21;
    float v23 = v21[1];
    float v24 = v21[2];
    (*(void (**)(HgcTint *, uint64_t, float, float, float, double))(*(void *)v16 + 96))(v16, 2, v22, v23, v24, 0.0);
    v25 = v16;
    (*(void (**)(HgcTint *))(*(void *)v16 + 16))(v16);
    [a3 setHeliumRef:&v25];
    if (v25) {
      (*(void (**)(HgcTint *))(*(void *)v25 + 24))(v25);
    }
    (*(void (**)(HgcTint *))(*(void *)v16 + 24))(v16);
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
    }
  }
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end