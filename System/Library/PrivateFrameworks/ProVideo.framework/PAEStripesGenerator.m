@interface PAEStripesGenerator
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)variesOverTime;
- (PAEStripesGenerator)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEStripesGenerator

- (PAEStripesGenerator)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEStripesGenerator;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEStripesGenerator;
  [(PAESharedDefaultBase *)&v6 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"StripesGenerator::Center", 0, 0), 310, 0, 0.5, 0.5);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"StripesGenerator::Color 1", 0, 0), 311, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"StripesGenerator::Color 2", 0, 0), 312, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"StripesGenerator::Size", 0, 0), 313, 0, 80.0, 0.0, 800.0, 0.0, 800.0, 10.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"StripesGenerator::Contrast", 0, 0), 314, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
  }
  return v3 != 0;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PreservesAlpha", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
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
    uint64_t v23 = 0x3FE0000000000000;
    uint64_t v24 = 0x3FE0000000000000;
    double v21 = 1.0;
    double v22 = 1.0;
    double v19 = 1.0;
    double v20 = 1.0;
    double v17 = 0.0;
    double v18 = 0.0;
    double v15 = 1.0;
    double v16 = 0.0;
    double v13 = 1.0;
    double v14 = 80.0;
    [a3 height];
    [a3 width];
    [v7 getXValue:&v24 YValue:&v23 fromParm:310 atFxTime:a4->var0.var1];
    [v7 getRedValue:&v22 greenValue:&v21 blueValue:&v20 alphaValue:&v19 fromParm:311 atFxTime:a4->var0.var1];
    double v21 = v19 * v21;
    double v22 = v19 * v22;
    double v20 = v19 * v20;
    [v7 getRedValue:&v18 greenValue:&v17 blueValue:&v16 alphaValue:&v15 fromParm:312 atFxTime:a4->var0.var1];
    double v17 = v15 * v17;
    double v18 = v15 * v18;
    double v16 = v15 * v16;
    [v7 getFloatValue:&v14 fromParm:313 atFxTime:a4->var0.var1];
    [v7 getFloatValue:&v13 fromParm:314 atFxTime:a4->var0.var1];
    double v13 = v13 * (v14 * 0.5);
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    if ([(PAESharedDefaultBase *)self getRenderMode:a4->var0.var1])
    {
      if ([a3 imageType] == 3)
      {
        v11 = (HgcStripes *)HGObject::operator new(0x1A0uLL);
        HgcStripes::HgcStripes(v11);
      }
    }
  }
  return v10;
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

@end