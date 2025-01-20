@interface PAERingLens
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAERingLens)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAERingLens

- (PAERingLens)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAERingLens;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v14 = 0.0;
  if (([v7 getFloatValue:&v14 fromParm:2 atFxTime:a3.var1] & 1) != 0
    && (char v13 = 0, ([v7 getBoolValue:&v13 fromParm:5 atFxTime:a3.var1] & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 1;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v9, v14), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    v11 = (objc_class *)objc_opt_class();
    id v12 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v11)];
    id result = 0;
    *a4 = v12;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAERingLens;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    unsigned int v7 = [v4 versionAtCreation];
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"RingLens::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"RingLens::Radius", 0, 0), 2, 0, 160.0, 0.0, dbl_1B7E74A60[v7 < 2], 0.0, dbl_1B7E73F60[v7 < 2], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"RingLens::Thickness", 0, 0), 3, 0, 0.43, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"RingLens::Refraction", 0, 0), 4, 0, 1.7, -5.0, 5.0, -5.0, 5.0, 0.5);
    if (v7) {
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"RingLens::Crop", 0, 0), 5, 0, 33);
    }
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  objc_super v10 = v9;
  if (v9)
  {
    double v26 = 160.0;
    [v9 getFloatValue:&v26 fromParm:2 atFxTime:a5->var0.var1];
    if (v26 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v26);
      }
      else {
        v25[0] = 0.0;
      }
      [a3 setHeliumRef:v25];
      if (*(void *)&v25[0]) {
        (*(void (**)(void))(**(void **)&v25[0] + 24))(*(void *)&v25[0]);
      }
    }
    else
    {
      v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208, v26);
      if (v11) {
        [v11 versionAtCreation];
      }
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      __asm { FMOV            V0.2D, #0.5 }
      *(_OWORD *)v23 = _Q0;
      [v10 getXValue:v23 YValue:&v23[1] fromParm:1 atFxTime:a5->var0.var1];
      [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:v23 withImage:a4];
      *(_OWORD *)v23 = v22;
      PCMatrix44Tmpl<double>::rightTranslate(v25, *(double *)&v22, *((double *)&v22 + 1), 0.0);
      v17.f64[0] = -v23[0];
      *(void *)&double v18 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate(v24, v17, -v23[1], 0.0);
      *(void *)&long long v22 = 0x3FDB851EB851EB85;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v22, 3, a5->var0.var1, v18);
      uint64_t v21 = 0x3FFB333333333333;
      [v10 getFloatValue:&v21 fromParm:4 atFxTime:a5->var0.var1];
      if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
        && [a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        v19 = (HRingLens *)HGObject::operator new(0x2B0uLL);
        HRingLens::HRingLens(v19);
      }
    }
  }
  return v10 != 0;
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