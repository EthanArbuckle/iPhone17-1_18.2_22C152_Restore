@interface PAEiOSStretch
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEiOSStretch)initWithAPIManager:(id)a3;
- (id)properties;
- (void)handleUIEventWithPosition:(CGPoint)a3 velocity:(CGPoint)a4 scale:(double)a5 scaleVelocity:(double)a6 rotation:(double)a7 rotationVelocity:(double)a8;
@end

@implementation PAEiOSStretch

- (PAEiOSStretch)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEiOSStretch;
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
  v6.receiver = self;
  v6.super_class = (Class)PAEiOSStretch;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSStretch::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSStretch::Size", 0, 0), 2, 0, 400.0, 0.0, 1000.0, 1.0, 1000.0, 1.0);
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
    [v11 setFloatValue:2 toParm:&v13 atFxTime:a5 * 400.0];
    [v12 setXValue:1 YValue:&v13 toParm:x atFxTime:y];
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v8 = v7;
  if (v7)
  {
    double v26 = 0.5;
    double v27 = 0.5;
    [v7 getXValue:&v27 YValue:&v26 fromParm:1 atFxTime:a5->var0.var1];
    double v9 = v27 + -0.5;
    double v27 = v9 * (double)(unint64_t)[a4 width];
    double v10 = v26 + -0.5;
    double v26 = v10 * (double)(unint64_t)[a4 height];
    long double v25 = 100.0;
    [v8 getFloatValue:&v25 fromParm:2 atFxTime:a5->var0.var1];
    double v11 = v25;
    double v12 = hypot(v25, v25);
    if (v11 == 0.0) {
      hypot((double)(unint64_t)objc_msgSend(a4, "width", v12), (double)(unint64_t)objc_msgSend(a4, "height"));
    }
    long long v13 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v13);
    (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v13 + 120))(v13, 0, [a4 heliumNode]);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v13, (const char *)2, v14);
    v15 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v15);
    unint64_t v16 = [a4 width];
    unint64_t v17 = [a4 height];
    unint64_t v18 = [a4 width];
    unint64_t v19 = [a4 height];
    uint64_t v20 = HGRectMake4i((int)-(double)v16, (int)-(double)v17, (int)((double)v18 + (double)v18), (int)((double)v19 + (double)v19));
    (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v15 + 96))(v15, 0, (float)(int)v20, (float)SHIDWORD(v20), (float)v21, (float)v22);
    (*(void (**)(HGCrop *, void, HGTextureWrap *))(*(void *)v15 + 120))(v15, 0, v13);
    v23 = (HgciOSStretch *)HGObject::operator new(0x1A0uLL);
    HgciOSStretch::HgciOSStretch(v23);
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