@interface PAEPixellate
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEPixellate)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEPixellate

- (PAEPixellate)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEPixellate;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEPixellate;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Pixellate::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Pixellate::Scale", 0, 0), 2, 0, 8.0, 1.0, 2000.0, 1.0, 100.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v9 = v8;
  if (v8)
  {
    uint64_t v13 = 0x3FE0000000000000;
    uint64_t v14 = 0x3FE0000000000000;
    uint64_t v12 = 0x4020000000000000;
    [v8 getXValue:&v14 YValue:&v13 fromParm:1 atFxTime:a5->var0.var1];
    [v9 getFloatValue:&v12 fromParm:2 atFxTime:a5->var0.var1];
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1])
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        v10 = (HgcPixellate *)HGObject::operator new(0x1A0uLL);
        HgcPixellate::HgcPixellate(v10);
      }
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