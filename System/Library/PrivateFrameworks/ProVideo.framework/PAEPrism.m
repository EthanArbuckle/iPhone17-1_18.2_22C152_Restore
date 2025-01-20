@interface PAEPrism
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEPrism)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEPrism

- (PAEPrism)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEPrism;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEPrism;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v6)
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve FxParameterRetrievalAPI object", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v13 = v17;
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = FxPlugErrorDomain;
      uint64_t v16 = 100001;
      goto LABEL_12;
    }
    return 0;
  }
  v7 = v6;
  char v20 = 0;
  double v19 = 0.0;
  if (![v6 getBoolValue:&v20 fromParm:3 atFxTime:a3.var1]
    || ([v7 getFloatValue:&v19 fromParm:1 atFxTime:a3.var1] & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve a parameter in [-PAEPrism dynamicPropertiesAtTime:withError:]", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v13 = v12;
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = FxPlugErrorDomain;
      uint64_t v16 = 100002;
LABEL_12:
      v18 = (void *)[v14 errorWithDomain:v15 code:v16 userInfo:v13];
      id result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  if (v20 == 0 && v19 == 0.0) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 3;
  }
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = [NSNumber numberWithBool:v19];
  return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"PositionIndependent", objc_msgSend(NSNumber, "numberWithInt:", v8), @"PixelTransformSupport", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEPrism;
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
    BOOL v7 = [v4 versionAtCreation] == 0;
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Prism::Amount", 0, 0), 1, 0, 7.0, 0.0, dbl_1B7E744C0[v7], 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Prism::Angle", 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Prism::Crop", 0, 0), 3, 0, 33);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Prism::OSC Center", 0, 0), 4, 2, 0.5, 0.5);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  v11 = v10;
  if (v10)
  {
    double v18 = 0.0;
    [v10 getFloatValue:&v18 fromParm:1 atFxTime:a6->var0.var1];
    char v17 = 0;
    [v11 getBoolValue:&v17 fromParm:3 atFxTime:a6->var0.var1];
    unint64_t var0 = a5->var0;
    unint64_t var1 = a5->var1;
    if (v17)
    {
      if (a3) {
        *a3 = var0;
      }
      if (a4) {
LABEL_6:
      }
        *a4 = var1;
    }
    else
    {
      float v15 = v18 + v18;
      uint64_t v16 = (int)(2 * vcvtps_s32_f32(v15));
      if (a3) {
        *a3 = var0 + v16;
      }
      var1 += v16;
      if (a4) {
        goto LABEL_6;
      }
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (v9)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    v18[0] = 0.0;
    [v9 getFloatValue:v18 fromParm:1 atFxTime:a5->var0.var1];
    v18[0] = v18[0] * 0.5;
    double v17 = 0.0;
    [v9 getFloatValue:&v17 fromParm:2 atFxTime:a5->var0.var1];
    if ([a4 origin] == 2) {
      double v17 = -v17;
    }
    char v16 = 0;
    [v9 getBoolValue:&v16 fromParm:3 atFxTime:a5->var0.var1];
    int v10 = [a4 imageType];
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1] && v10 == 3)
    {
      if (v18[0] == 0.0)
      {
        if (a4) {
          objc_msgSend(a4, "heliumRef", v18[0]);
        }
        else {
          v14[0] = 0.0;
        }
        [a3 setHeliumRef:v14];
        if (*(void *)&v14[0]) {
          (*(void (**)(void))(**(void **)&v14[0] + 24))(*(void *)&v14[0]);
        }
      }
      else
      {
        if (a4) {
          objc_msgSend(a4, "heliumRef", v18[0]);
        }
        else {
          uint64_t v15 = 0;
        }
        v11 = (HPrism *)HGObject::operator new(0x1B0uLL);
        HPrism::HPrism(v11);
        __double2 v12 = __sincos_stret(v17);
        v14[0] = (v12.__cosval * v18[1] + v12.__sinval * v18[2]) * v18[0];
        v14[1] = (v12.__cosval * v18[5] + v12.__sinval * v18[6]) * v18[0];
        HPrism::init((uint64_t)v11, v14);
        (*(void (**)(HPrism *, void, uint64_t))(*(void *)v11 + 120))(v11, 0, v15);
        *(void *)&v14[0] = v11;
        (*(void (**)(HPrism *))(*(void *)v11 + 16))(v11);
        if (v16) {
          [(PAESharedDefaultBase *)self crop:v14 fromImage:a4 toImage:a3];
        }
        [a3 setHeliumRef:v14];
        if (*(void *)&v14[0]) {
          (*(void (**)(void))(**(void **)&v14[0] + 24))(*(void *)&v14[0]);
        }
        (*(void (**)(HPrism *))(*(void *)v11 + 24))(v11);
        if (v15) {
          (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
        }
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