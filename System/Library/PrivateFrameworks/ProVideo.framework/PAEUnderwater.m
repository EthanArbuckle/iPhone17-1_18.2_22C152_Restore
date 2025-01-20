@interface PAEUnderwater
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)variesOverTime;
- (PAEUnderwater)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEUnderwater

- (PAEUnderwater)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEUnderwater;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEUnderwater;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAEUnderwater;
  [(PAESharedDefaultBase *)&v11 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  objc_super v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  int v5 = [v4 versionAtCreation];
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!v6)
  {
    BOOL v8 = v5 == 0;
    v9 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Underwater::Size", 0, 0), 1, 0, 2.0, 0.001, 100.0, 0.001, 10.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Underwater::Speed", 0, 0), 2, 0, 0.5, 0.0, 100.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"Underwater::Refraction", 0, 0), 3, 0, 100.0, 0.0, 1000.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v9, "localizedStringForKey:value:table:", @"BumpMap::Repeat Edges", 0, 0), 6, v8, 0);
  }
  return v7;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL result = !v6;
  if (!v6)
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
  }
  return result;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v47[19] = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  double v46 = 0.0;
  [v9 getFloatValue:&v46 fromParm:3 atFxTime:a5->var0.var1];
  if (v46 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v46);
    }
    else {
      v42[0] = 0;
    }
    [a3 setHeliumRef:v42];
    if (v42[0]) {
      (*(void (**)(void))(*(void *)v42[0] + 24))(v42[0]);
    }
    return 1;
  }
  else
  {
    objc_msgSend(a4, "width", v46);
    [a4 height];
    uint64_t v13 = [a3 imageType];
    int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
    BOOL result = 0;
    if (v14 && v13 == 3)
    {
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
      double v45 = 0.0;
      [v9 getFloatValue:&v45 fromParm:1 atFxTime:a5->var0.var1];
      double v45 = v45 * 0.1;
      double v44 = 0.0;
      [v9 getFloatValue:&v44 fromParm:2 atFxTime:a5->var0.var1];
      char v43 = 0;
      [v9 getBoolValue:&v43 fromParm:6 atFxTime:a5->var0.var1];
      unint64_t v15 = 589505315;
      for (uint64_t i = 1; i != 102; ++i)
      {
        unint64_t v15 = ((v15 << 12) + 150889) % 0xAE529;
        v42[i] = v15;
      }
      [(PAESharedDefaultBase *)self secondsFromFxTime:a5->var0.var1];
      uint64_t v17 = 0;
      *(float *)&double v18 = v18;
      double v41 = v44 * *(float *)&v18;
      v19 = (float *)v47;
      unint64_t v20 = 456248;
      float v21 = 0.0;
      float v22 = 0.0;
      float v23 = 0.0;
      float v24 = 0.0;
      while (1)
      {
        unint64_t v25 = v42[v20 % 0x65 + 1];
        v42[v20 % 0x65 + 1] = ((v25 << 12) + 150889) % 0xAE529;
        float v26 = (float)((float)v25 / 714020.0) * 6.2832;
        unint64_t v27 = v25 % 0x65;
        unint64_t v28 = v42[v25 % 0x65 + 1];
        v42[v27 + 1] = ((v28 << 12) + 150889) % 0xAE529;
        float v29 = v21;
        float v30 = (float)((float)((float)v28 / 714020.0) * 6.2832) + 0.0;
        unint64_t v20 = v42[v28 % 0x65 + 1];
        v42[v28 % 0x65 + 1] = ((v20 << 12) + 150889) % 0xAE529;
        float v31 = (float)((float)(int)v17 * 0.25) + 1.0;
        float v32 = (float)((float)(1.0 / v31) * (float)((float)((float)((float)v20 / 714020.0) * 0.25) + 0.75)) * 0.25;
        v19[1] = v32;
        float v33 = v31 * v32;
        __float2 v34 = __sincosf_stret(v26 + 0.0);
        float v35 = v34.__cosval * v33;
        float v36 = v34.__sinval * v33;
        *(v19 - 2) = v34.__cosval * v33;
        *(v19 - 1) = v34.__sinval * v33;
        float v37 = v41 * v31 + v30;
        float *v19 = v37;
        v19 += 4;
        if ((float)(v34.__cosval * v33) >= 0.0) {
          float v38 = -0.0;
        }
        else {
          float v38 = v34.__cosval * v33;
        }
        float v23 = v23 + v38;
        if (v35 < 0.0) {
          float v35 = -0.0;
        }
        float v21 = v29 + v35;
        if (v36 >= 0.0) {
          float v39 = -0.0;
        }
        else {
          float v39 = v34.__sinval * v33;
        }
        float v24 = v24 + v39;
        if (v36 < 0.0) {
          float v36 = -0.0;
        }
        float v22 = v22 + v36;
        if (++v17 == 10)
        {
          v42[0] = v20;
          v40 = (HUnderwaterRefractV2 *)HGObject::operator new(0x1B0uLL);
          HUnderwaterRefractV2::HUnderwaterRefractV2(v40);
        }
      }
    }
  }
  return result;
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

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v9 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v9, 3, a3.var1))
  {
    if (v9 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 3;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v6, v9), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    id v8 = [(PAEFilterDefaultBase *)self getParamErrorFor:@"PAEUnderwater"];
    id result = 0;
    *a4 = v8;
  }
  else
  {
    return 0;
  }
  return result;
}

@end