@interface PAEiOSKaleidoscope
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEiOSKaleidoscope)initWithAPIManager:(id)a3;
- (id)properties;
- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8;
@end

@implementation PAEiOSKaleidoscope

- (PAEiOSKaleidoscope)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEiOSKaleidoscope;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", objc_msgSend(NSNumber, "numberWithBool:", 1), @"SupportsHeliumRendering", 0);
}

- (BOOL)addParameters
{
  v9.receiver = self;
  v9.super_class = (Class)PAEiOSKaleidoscope;
  [(PAESharedDefaultBase *)&v9 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (!v5) {
    return 0;
  }
  v6 = v5;
  BOOL v7 = 1;
  objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"iOSKaleidoscope::Count", 0, 0), 1, 0, 6.0, 2.0, 100.0, 2.0, 100.0, 1.0);
  objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"iOSKaleidoscope::Center", 0, 0), 2, 0, 0.5, 0.5);
  objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"iOSKaleidoscope::Angle", 0, 0), 3, 0, 22.5, 0.0, 6.28318531);
  return v7;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y = a3.y;
  double x = a3.x;
  v12 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121D2E0, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v12)
  {
    v13 = v12;
    long long v14 = *MEMORY[0x1E4F1FA48];
    uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v12 setFloatValue:1 toParm:&v14 atFxTime:a5 * 6.0];
    [v13 setFloatValue:3 toParm:&v14 atFxTime:a7];
    [v13 setXValue:2 YValue:&v14 toParm:x atFxTime:y];
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  BOOL v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v8 = v7;
  if (v7)
  {
    double v18 = 2.0;
    [v7 getFloatValue:&v18 fromParm:1 atFxTime:a5->var0.var1];
    uint64_t v16 = 0x3FE0000000000000;
    uint64_t v17 = 0x3FE0000000000000;
    [v8 getXValue:&v17 YValue:&v16 fromParm:2 atFxTime:a5->var0.var1];
    double v15 = 0.392699082;
    [v8 getFloatValue:&v15 fromParm:3 atFxTime:a5->var0.var1];
    [a4 width];
    [a4 height];
    __sincos_stret(v15);
    double v9 = floor(v18);
    if (v9 >= 1.0) {
      double v10 = v9;
    }
    else {
      double v10 = 1.0;
    }
    double v18 = v10;
    v11 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v11);
    (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v11 + 120))(v11, 0, [a4 heliumNode]);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v11, (const char *)2, v12);
    v13 = (HgciOSKaleidoscope *)HGObject::operator new(0x1B0uLL);
    HgciOSKaleidoscope::HgciOSKaleidoscope(v13);
  }
  return 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end