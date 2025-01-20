@interface PAEThreshold
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEThreshold)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEThreshold

- (PAEThreshold)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEThreshold;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC3A0, @"PixelTransformSupport", v3, @"PixelIndependent", v4, @"PositionIndependent", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEThreshold;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Threshold::Threshold", 0, 0), 1, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Threshold::Smoothness", 0, 0), 2, 0, 0.15, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Threshold::Dark Color", 0, 0), 3, 0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Threshold::Light Color", 0, 0), 4, 0, 1.0, 1.0, 1.0);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Threshold::Correct For Alpha", 0, 0), 5, 0, 33);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    double v35 = 0.0;
    [v9 getFloatValue:&v35 fromParm:1 atFxTime:a5->var0.var1];
    double v34 = 0.0;
    [v10 getFloatValue:&v34 fromParm:2 atFxTime:a5->var0.var1];
    double v32 = 0.0;
    double v33 = 0.0;
    double v31 = 0.0;
    [v10 getRedValue:&v33 greenValue:&v32 blueValue:&v31 fromParm:3 atFxTime:a5->var0.var1];
    double v29 = 0.0;
    double v30 = 0.0;
    double v28 = 0.0;
    [v10 getRedValue:&v30 greenValue:&v29 blueValue:&v28 fromParm:4 atFxTime:a5->var0.var1];
    int v27 = 0;
    int v11 = [v10 getIntValue:&v27 fromParm:5 atFxTime:a5->var0.var1];
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
        if (v9)
        {
          v12 = v9;
          if (a4) {
            [a4 heliumRef];
          }
          else {
            uint64_t v26 = 0;
          }
          v25 = 0;
          if (v27) {
            int v13 = v11;
          }
          else {
            int v13 = 0;
          }
          if (v13 == 1)
          {
            v14 = (HgcThreshold *)HGObject::operator new(0x1A0uLL);
            HgcThreshold::HgcThreshold(v14);
          }
          else
          {
            v14 = (HgcThreshold *)HGObject::operator new(0x1A0uLL);
            HgcThresholdNoPremult::HgcThresholdNoPremult(v14);
          }
          if (v14) {
            v25 = v14;
          }
          double v15 = v34;
          if (v34 == 0.0)
          {
            double v34 = 0.00100000005;
            double v15 = 0.00100000005;
          }
          (*(void (**)(HgcThreshold *, void, uint64_t))(*(void *)v14 + 120))(v14, 0, v26);
          float v16 = v35;
          (*(void (**)(HgcThreshold *, void, float, double, double, double))(*(void *)v14 + 96))(v14, 0, v16, 0.0, 0.0, 0.0);
          float v17 = 1.0 / v15;
          (*(void (**)(HgcThreshold *, uint64_t, float, double, double, double))(*(void *)v14 + 96))(v14, 1, v17, 0.0, 0.0, 0.0);
          [v12 versionAtCreation];
          float v18 = v33;
          float v19 = v32;
          float v20 = v31;
          (*(void (**)(HgcThreshold *, uint64_t, float, float, float, float))(*(void *)v14 + 96))(v14, 2, v18, v19, v20, 1.0);
          float v21 = v30;
          float v22 = v29;
          float v23 = v28;
          (*(void (**)(HgcThreshold *, uint64_t, float, float, float, float))(*(void *)v14 + 96))(v14, 3, v21, v22, v23, 1.0);
          [a3 setHeliumRef:&v25];
          if (v25) {
            (*(void (**)(HgcThreshold *))(*(void *)v25 + 24))(v25);
          }
          if (v26) {
            (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
          }
          LOBYTE(v9) = 1;
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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