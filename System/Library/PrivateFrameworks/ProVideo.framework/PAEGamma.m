@interface PAEGamma
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEGamma)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEGamma

- (PAEGamma)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGamma;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEGamma properties]::once != -1) {
    dispatch_once(&-[PAEGamma properties]::once, &__block_literal_global_38);
  }
  return (id)-[PAEGamma properties]::sPropertiesDict;
}

uint64_t __22__PAEGamma_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC328, @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAEGamma properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v5.receiver = self;
  v5.super_class = (Class)PAEGamma;
  [(PAESharedDefaultBase *)&v5 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3) {
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Gamma::Gamma", 0, 0), 1, 0, 1.0, 0.0, 10.0, 0.0, 5.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    double v16 = 0.0;
    [v9 getFloatValue:&v16 fromParm:1 atFxTime:a5->var0.var1];
    double v10 = 16.6666667;
    if (v16 >= 0.06) {
      double v10 = 1.0 / v16;
    }
    double v16 = v10;
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v15 = 0;
        }
        v11 = (HGGamma *)HGObject::operator new(0x1B0uLL);
        HGGamma::HGGamma(v11);
        float v12 = v16;
        (*(void (**)(HGGamma *, void, float, float, float, float))(*(void *)v11 + 96))(v11, 0, v12, v12, v12, 1.0);
        (*(void (**)(HGGamma *, void, uint64_t))(*(void *)v11 + 120))(v11, 0, v15);
        v14 = v11;
        (*(void (**)(HGGamma *))(*(void *)v11 + 16))(v11);
        [a3 setHeliumRef:&v14];
        if (v14) {
          (*(void (**)(HGGamma *))(*(void *)v14 + 24))(v14);
        }
        (*(void (**)(HGGamma *))(*(void *)v11 + 24))(v11);
        if (v15) {
          (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
        }
        LOBYTE(v9) = 1;
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