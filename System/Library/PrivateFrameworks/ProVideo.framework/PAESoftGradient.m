@interface PAESoftGradient
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)variesOverTime;
- (PAESoftGradient)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAESoftGradient

- (PAESoftGradient)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESoftGradient;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  v8.receiver = self;
  v8.super_class = (Class)PAESoftGradient;
  [(PAESharedDefaultBase *)&v8 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SoftGradient::Center", 0, 0), 310, 0, 0.5, 0.5);
    unsigned int v5 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
    uint64_t v6 = [v4 localizedStringForKey:@"SoftGradient::Color" value:0 table:0];
    if (v5 < 2) {
      [v3 addColorParameterWithName:v6 parmId:311 defaultRed:0 defaultGreen:1.0 defaultBlue:1.0 defaultAlpha:1.0 parmFlags:1.0];
    }
    else {
      [v3 addColorParameterWithName:v6 parmId:311 defaultRed:0 defaultGreen:1.0 defaultBlue:1.0 parmFlags:1.0];
    }
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"SoftGradient::Radius", 0, 0), 312, 0, 240.0, 0.0, dbl_1B7E73F60[v5 < 3], 0.0, 1000.0, 10.0);
  }
  return v3 != 0;
}

- (id)properties
{
  if (-[PAESoftGradient properties]::once != -1) {
    dispatch_once(&-[PAESoftGradient properties]::once, &__block_literal_global_20);
  }
  return (id)-[PAESoftGradient properties]::sPropertiesDict;
}

uint64_t __29__PAESoftGradient_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithInteger:6];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"MayRemapTime", v2, @"PreservesAlpha", v3, @"PixelTransformSupport", v4, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
  -[PAESoftGradient properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    v11 = (void *)v8;
    double v24 = 0.5;
    double v25 = 0.5;
    double v22 = 1.0;
    double v23 = 1.0;
    *(double *)&uint64_t v20 = 1.0;
    double v21 = 1.0;
    double v19 = 300.0;
    [a3 bounds];
    double v13 = v12;
    double v15 = v14;
    [v7 getXValue:&v25 YValue:&v24 fromParm:310 atFxTime:a4->var0.var1];
    double v24 = v15 * (v24 + -0.5);
    double v25 = v13 * (v25 + -0.5);
    if ([v11 versionAtCreation] < 2)
    {
      [v7 getRedValue:&v23 greenValue:&v22 blueValue:&v21 alphaValue:&v20 fromParm:311 atFxTime:a4->var0.var1];
      double v16 = *(double *)&v20;
    }
    else
    {
      [v7 getRedValue:&v23 greenValue:&v22 blueValue:&v21 fromParm:311 atFxTime:a4->var0.var1];
      double v16 = 1.0;
    }
    double v22 = v16 * v22;
    double v23 = v16 * v23;
    double v21 = v16 * v21;
    [v7 getFloatValue:&v19 fromParm:312 atFxTime:a4->var0.var1];
    double v19 = 1.0 / v19;
    v17 = (HgcSoftGradient *)HGObject::operator new(0x1A0uLL);
    HgcSoftGradient::HgcSoftGradient(v17);
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 1;
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end