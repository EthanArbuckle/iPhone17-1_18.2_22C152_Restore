@interface PAEHSVAdjust
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEHSVAdjust)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEHSVAdjust

- (PAEHSVAdjust)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEHSVAdjust;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEHSVAdjust properties]::once != -1) {
    dispatch_once(&-[PAEHSVAdjust properties]::once, &__block_literal_global_43);
  }
  return (id)-[PAEHSVAdjust properties]::sPropertiesDict;
}

uint64_t __26__PAEHSVAdjust_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC370, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1),
             @"AutoColorProcessingSupport",
             0);
  -[PAEHSVAdjust properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEHSVAdjust;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"HSVAdjust::Hue", 0, 0), 1, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"HSVAdjust::Saturation", 0, 0), 2, 0, 0.0, -1.0, 3.0, -1.0, 3.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"HSVAdjust::Value", 0, 0), 3, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v29[10] = *(double *)MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  uint64_t v11 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12 || v11 == 0;
  char v14 = v13;
  if (!v13)
  {
    uint64_t v15 = [a4 dynamicRangeType];
    if ([v10 versionAtCreation]) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v15 == 0;
    }
    int v17 = v16;
    double v28 = 0.0;
    v29[0] = 0.0;
    double v27 = 0.0;
    [v9 getFloatValue:v29 fromParm:1 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v28 fromParm:2 atFxTime:a5->var0.var1];
    double v28 = v28 + 1.0;
    [v9 getFloatValue:&v27 fromParm:3 atFxTime:a5->var0.var1];
    if (v17) {
      v29[0] = v29[0] * 180.0 / 3.14159265;
    }
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v26 = 0;
    }
    double v18 = v29[0];
    if (!v17)
    {
      if (v29[0] < 0.0)
      {
        do
          double v18 = v18 + 6.28318531;
        while (v18 < 0.0);
        v29[0] = v18;
      }
      if (v18 > 6.28318531)
      {
        do
          double v18 = v18 + -6.28318531;
        while (v18 > 6.28318531);
        v29[0] = v18;
      }
      v23 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
      HGColorMatrix::HGColorMatrix(v23);
    }
    if (v29[0] < 0.0)
    {
      do
        double v18 = v18 + 360.0;
      while (v18 < 0.0);
      v29[0] = v18;
    }
    if (v18 > 360.0)
    {
      do
        double v18 = v18 + -360.0;
      while (v18 > 360.0);
      v29[0] = v18;
    }
    v19 = (HgcHSVAdjust *)HGObject::operator new(0x1A0uLL);
    HgcHSVAdjust::HgcHSVAdjust(v19);
    v25 = v19;
    (*(void (**)(HgcHSVAdjust *, void, uint64_t))(*(void *)v19 + 120))(v19, 0, v26);
    float v20 = v29[0] / 360.0 + 1.0;
    float v21 = v28;
    float v22 = v27;
    (*(void (**)(HgcHSVAdjust *, void, float, float, float, double))(*(void *)v19 + 96))(v19, 0, v20, v21, v22, 0.0);
    [a3 setHeliumRef:&v25];
    if (v25) {
      (*(void (**)(HgcHSVAdjust *))(*(void *)v25 + 24))(v25);
    }
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
    }
  }
  return v14 ^ 1;
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