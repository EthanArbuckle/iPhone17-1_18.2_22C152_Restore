@interface PAEiOSLightTunnel
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEiOSLightTunnel)initWithAPIManager:(id)a3;
- (id)properties;
- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8;
@end

@implementation PAEiOSLightTunnel

- (PAEiOSLightTunnel)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEiOSLightTunnel;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithBool:", 0), @"MayRemapTime", 0);
}

- (BOOL)addParameters
{
  v9.receiver = self;
  v9.super_class = (Class)PAEiOSLightTunnel;
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
  objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"iOSLightTunnel::Center", 0, 0), 1, 0, 0.5, 0.5);
  objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"iOSLightTunnel::Radius", 0, 0), 2, 0, 100.0, 1.0, 500.0, 1.0, 500.0, 1.0);
  objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"iOSLightTunnel::Rotation", 0, 0), 3, 0, 0.0, 0.0, 6.28318531);
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
    [v12 setFloatValue:2 toParm:&v14 atFxTime:a5 * 100.0];
    [v13 setFloatValue:3 toParm:&v14 atFxTime:a7];
    [v13 setXValue:1 YValue:&v14 toParm:x atFxTime:y];
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  BOOL v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v8 = v7;
  if (v7)
  {
    double v15 = 0.5;
    double v16 = 0.5;
    [v7 getXValue:&v16 YValue:&v15 fromParm:1 atFxTime:a5->var0.var1];
    double v9 = v16 + -0.5;
    double v16 = v9 * (double)(unint64_t)[a4 width];
    double v10 = v15 + -0.5;
    double v15 = v10 * (double)(unint64_t)[a4 height];
    uint64_t v14 = 0x4059000000000000;
    [v8 getFloatValue:&v14 fromParm:2 atFxTime:a5->var0.var1];
    uint64_t v13 = 0;
    [v8 getFloatValue:&v13 fromParm:3 atFxTime:a5->var0.var1];
    v11 = (HgciOSLightTunnel *)HGObject::operator new(0x1A0uLL);
    HgciOSLightTunnel::HgciOSLightTunnel(v11);
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