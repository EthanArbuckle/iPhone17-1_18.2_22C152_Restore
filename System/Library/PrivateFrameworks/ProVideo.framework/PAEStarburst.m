@interface PAEStarburst
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEStarburst)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEStarburst

- (PAEStarburst)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEStarburst;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEStarburst;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Starburst::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Starburst::Radius", 0, 0), 2, 0, 50.0, 0.01, 200.0, 0.01, 200.0, 10.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v8) {
    _ZF = v9 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF)
  {
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  __asm { FMOV            V0.2D, #0.5 }
  long long v20 = _Q0;
  [v8 getXValue:&v20 YValue:(char *)&v20 + 8 fromParm:1 atFxTime:a5->var0.var1];
  [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v20 withImage:a4];
  long long v20 = v18;
  uint64_t v19 = 0x4049000000000000;
  [v8 getFloatValue:&v19 fromParm:2 atFxTime:a5->var0.var1];
  int v15 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v15)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      v16 = (HgcStarburst *)HGObject::operator new(0x1B0uLL);
      HgcStarburst::HgcStarburst(v16);
    }
    goto LABEL_9;
  }
  return v15;
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