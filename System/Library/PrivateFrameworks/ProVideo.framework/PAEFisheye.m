@interface PAEFisheye
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEFisheye)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEFisheye

- (PAEFisheye)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFisheye;
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

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v10 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 2, a3.var1))
  {
    if (v10 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 3;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v6, v10), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v8)];
    id result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEFisheye;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fisheye::Radius", 0, 0), 1, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fisheye::Amount", 0, 0), 2, 0, 15.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fisheye::Center", 0, 0), 3, 0, 0.5, 0.5);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  id v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (!v9)
  {
LABEL_20:
    LOBYTE(v14) = 0;
    return v14;
  }
  v11 = (void *)v10;
  double v25 = 0.0;
  [v9 getFloatValue:&v25 fromParm:2 atFxTime:a5->var0.var1];
  if (v25 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v25);
    }
    else {
      *(void *)&long long v22 = 0;
    }
    [a3 setHeliumRef:&v22];
    if ((void)v22) {
      (*(void (**)(void))(*(void *)v22 + 24))(v22);
    }
    LOBYTE(v14) = 1;
    return v14;
  }
  double v12 = v25 / 30.0 + 1.0;
  if (v25 <= 0.0) {
    double v12 = 1.0 / (1.0 - v25 / 30.0);
  }
  double v25 = v12;
  if (v11) {
    double v13 = (double)[v11 versionAtCreation];
  }
  else {
    double v13 = 0.0;
  }
  __asm { FMOV            V0.2D, #0.5 }
  long long v24 = _Q0;
  [v9 getXValue:&v24 YValue:(char *)&v24 + 8 fromParm:3 atFxTime:a5->var0.var1];
  [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v24 withImage:a4];
  long long v24 = v22;
  uint64_t v23 = 0x3FB999999999999ALL;
  [v9 getFloatValue:&v23 fromParm:1 atFxTime:a5->var0.var1];
  [a4 width];
  [a4 height];
  if (v13 == 0.0) {
    [a4 pixelAspect];
  }
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
  int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v14)
  {
    if ([a3 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      v20 = (HgcFisheye *)HGObject::operator new(0x220uLL);
      HgcFisheye::HgcFisheye(v20);
    }
    goto LABEL_20;
  }
  return v14;
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