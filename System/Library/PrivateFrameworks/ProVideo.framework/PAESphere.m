@interface PAESphere
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAESphere)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAESphere

- (PAESphere)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESphere;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAESphere;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (!v4) {
    return 0;
  }
  int v5 = [v4 versionAtCreation];
  if (!v3) {
    return 0;
  }
  int v6 = v5;
  uint64_t v7 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v8 = 1;
  objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", @"Sphere::Center", 0, 0), 1, 0, 0.5, 0.5);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", @"Sphere::Radius", 0, 0), 2, 0, 400.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
  if (v6) {
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", @"Sphere::Crop", 0, 0), 3, 0, 33);
  }
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v10)
  {
    [v10 versionAtCreation];
    if (!v9) {
      return v9 != 0;
    }
  }
  else if (!v9)
  {
    return v9 != 0;
  }
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  __asm { FMOV            V0.2D, #0.5 }
  long long v23 = _Q0;
  [v9 getXValue:&v23 YValue:(char *)&v23 + 8 fromParm:1 atFxTime:a5->var0.var1];
  [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v23 withImage:a4];
  long long v23 = v22;
  PCMatrix44Tmpl<double>::rightTranslate(v25, *(double *)&v22, *((double *)&v22 + 1), 0.0);
  v16.f64[0] = -*(double *)&v23;
  *(void *)&double v17 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate(v24, v16, -*((double *)&v23 + 1), 0.0);
  *(void *)&long long v22 = 0x4079000000000000;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v22, 2, a5->var0.var1, v17);
  if (*(double *)&v22 != 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", *(double *)&v22);
    }
    else {
      v21 = 0;
    }
    v19 = (HSphere *)HGObject::operator new(0x2B0uLL);
    HSphere::HSphere(v19);
  }
  v18 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v18);
  v21 = v18;
  [a3 setHeliumRef:&v21];
  if (v21) {
    (*(void (**)(HGNode *))(*(void *)v21 + 24))(v21);
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