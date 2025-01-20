@interface PAEScrape
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEScrape)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEScrape

- (PAEScrape)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEScrape;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEScrape;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PositionIndependent", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEScrape;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Scrape::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Scrape::Rotation", 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Scrape::Amount", 0, 0), 3, 0, 50.0, 0.0, 200.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Scrape::Crop", 0, 0), 4, 1, 33);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    memset(&v23[2], 0, 32);
    if (a3)
    {
      [a3 imageInfo];
      uint64_t v10 = *((void *)&v24 + 1);
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    __asm { FMOV            V0.2D, #0.5 }
    v23[0] = _Q0;
    [v9 getXValue:v23 YValue:(char *)v23 + 8 fromParm:1 atFxTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:v23 withImage:a4];
    v23[0] = v22;
    *(void *)&long long v22 = 0;
    [v9 getFloatValue:&v22 fromParm:2 atFxTime:a5->var0.var1];
    if (v10) {
      *(double *)&long long v22 = -(*(double *)&v22 + -3.14159265);
    }
    double v21 = 0.0;
    [v9 getFloatValue:&v21 fromParm:3 atFxTime:a5->var0.var1];
    double v16 = 200.0 - v21;
    if (v21 > 200.0) {
      double v16 = 0.0;
    }
    if (v21 >= 0.0) {
      double v17 = v16;
    }
    else {
      double v17 = 200.0;
    }
    double v21 = v17;
    int v20 = 0;
    [v9 getIntValue:&v20 fromParm:4 atFxTime:a5->var0.var1];
    __sincos_stret(*(double *)&v22);
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
      && [a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      v18 = (HgcScrape *)HGObject::operator new(0x1B0uLL);
      HgcScrape::HgcScrape(v18);
    }
  }
  return v9 != 0;
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