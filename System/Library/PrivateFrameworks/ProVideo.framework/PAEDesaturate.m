@interface PAEDesaturate
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEDesaturate)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEDesaturate

- (PAEDesaturate)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDesaturate;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC388, @"PixelTransformSupport", v3, @"PixelIndependent", v4, @"PositionIndependent", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEDesaturate;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Desaturate::Desaturation", 0, 0), 1, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Desaturate::Luminance Type", 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"Desaturate::TypeEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    double v20 = 0.0;
    signed int v19 = 0;
    [v9 getFloatValue:&v20 fromParm:1 atFxTime:a5->var0.var1];
    [v10 getIntValue:&v19 fromParm:2 atFxTime:a5->var0.var1];
    if (v19 > 5)
    {
      float v13 = 1.0;
      float v11 = 0.0;
      float v12 = 0.0;
    }
    else
    {
      float v11 = flt_1B7E75048[v19];
      float v12 = flt_1B7E75060[v19];
      float v13 = flt_1B7E75078[v19];
    }
    LODWORD(v9) = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          uint64_t v18 = 0;
        }
        v14 = (HgcDesaturate *)HGObject::operator new(0x1A0uLL);
        HgcDesaturate::HgcDesaturate(v14);
        v17 = v14;
        (*(void (**)(HgcDesaturate *, void, uint64_t))(*(void *)v14 + 120))(v14, 0, v18);
        float v15 = v20;
        (*(void (**)(HgcDesaturate *, void, float, double, double, double))(*(void *)v14 + 96))(v14, 0, v15, 0.0, 0.0, 0.0);
        (*(void (**)(HgcDesaturate *, uint64_t, float, float, float, float))(*(void *)v14 + 96))(v14, 1, v11, v12, v13, 1.0);
        [a3 setHeliumRef:&v17];
        if (v17) {
          (*(void (**)(HgcDesaturate *))(*(void *)v17 + 24))(v17);
        }
        if (v18) {
          (*(void (**)(uint64_t))(*(void *)v18 + 24))(v18);
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