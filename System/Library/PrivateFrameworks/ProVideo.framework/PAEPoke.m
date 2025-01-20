@interface PAEPoke
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEPoke)initWithAPIManager:(id)a3;
- (id)properties;
- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8;
@end

@implementation PAEPoke

- (PAEPoke)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEPoke;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithInteger:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"SupportsHeliumRendering", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEPoke;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Poke::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Poke::Radius", 0, 0), 2, 0, 300.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Poke::Scale", 0, 0), 3, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 1.0);
  }
  return v3 != 0;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y = a3.y;
  double x = a3.x;
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121D2E0, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v11)
  {
    v12 = v11;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v11 setFloatValue:3 toParm:&v13 atFxTime:a5 * 0.5];
    [v12 setXValue:1 YValue:&v13 toParm:x atFxTime:y];
  }
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

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v8)
  {
    v9 = (void *)v8;
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    __asm { FMOV            V0.2D, #0.5 }
    long long v22 = _Q0;
    [v9 getXValue:&v22 YValue:(char *)&v22 + 8 fromParm:1 atFxTime:a5->var0.var1];
    double v21 = 300.0;
    [v9 getFloatValue:&v21 fromParm:2 atFxTime:a5->var0.var1];
    double v15 = v21;
    if (v21 < 0.00001) {
      double v15 = 0.00001;
    }
    double v21 = v15;
    uint64_t v20 = 0x3FE0000000000000;
    [v9 getFloatValue:&v20 fromParm:3 atFxTime:a5->var0.var1];
    int v16 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v22 withImage:a4];
    long long v22 = v19;
    if (v16 && [a4 imageType] == 3)
    {
      v17 = (HPoke *)HGObject::operator new(0x2A0uLL);
      HPoke::HPoke(v17);
    }
    LOBYTE(v8) = 0;
  }
  return v8;
}

@end