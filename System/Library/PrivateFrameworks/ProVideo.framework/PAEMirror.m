@interface PAEMirror
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEMirror)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8;
@end

@implementation PAEMirror

- (PAEMirror)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEMirror;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEMirror;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Mirror::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Mirror::Angle", 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Mirror::Repeat Border Pixels", 0, 0), 3, 1, 33);
  }
  return v3 != 0;
}

- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8
{
  double y = a3.y;
  double x = a3.x;
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121D2E0, a3.x, a3.y, a4.x, a4.y, a5, a6, a7, a8);
  if (v10)
  {
    long long v11 = *MEMORY[0x1E4F1FA48];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v10 setXValue:1 YValue:&v11 toParm:x atFxTime:y];
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    double v23 = 0.0;
    [v9 getXValue:&v25 YValue:&v24 fromParm:1 atFxTime:a5->var0.var1];
    [v10 getFloatValue:&v23 fromParm:2 atFxTime:a5->var0.var1];
    int v22 = 0;
    [v10 getIntValue:&v22 fromParm:3 atFxTime:a5->var0.var1];
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    if (a3)
    {
      [a3 imageInfo];
      if (*((void *)&v19 + 1)) {
        double v23 = -v23;
      }
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
          uint64_t v16 = 0;
        }
        if (v22)
        {
          uint64_t v14 = v16;
          if (v16) {
            (*(void (**)(uint64_t))(*(void *)v16 + 16))(v16);
          }
          [(PAESharedDefaultBase *)self smear:&v14 fromImage:a4 toImage:a4];
          uint64_t v11 = v15;
          if (v16 == v15)
          {
            if (v16) {
              (*(void (**)(void))(*(void *)v16 + 24))();
            }
          }
          else
          {
            if (v16)
            {
              (*(void (**)(void))(*(void *)v16 + 24))();
              uint64_t v11 = v15;
            }
            uint64_t v15 = 0;
            uint64_t v16 = v11;
          }
          if (v14) {
            (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
          }
        }
        __sincos_stret(v23);
        uint64_t v12 = (HMirror *)HGObject::operator new(0x1E0uLL);
        HMirror::HMirror(v12);
      }
      LOBYTE(v9) = 0;
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