@interface PAEWave
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)variesOverTime;
- (PAEWave)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEWave

- (PAEWave)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEWave;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEWave;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)variesOverTime
{
  return 0;
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
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v9, 1, a3.var1))
  {
    if (v9 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 1;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v6, v9), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    id v8 = [(PAEFilterDefaultBase *)self getParamErrorFor:@"PAEWave"];
    id result = 0;
    *a4 = v8;
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
  v6.super_class = (Class)PAEWave;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Wave::Amplitude", 0, 0), 1, 0, 10.0, 0.0, 500.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Wave::Wave Length", 0, 0), 2, 0, 100.0, 1.0, 500.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Wave::Offset", 0, 0), 3, 0, 100.0, -500.0, 500.0, -500.0, 500.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Wave::Vertical", 0, 0), 4, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Wave::Repeat Edges", 0, 0), 5, 1, 33);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  double v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v9)
  {
LABEL_11:
    LOBYTE(v11) = 1;
    return v11;
  }
  v10 = v9;
  double v29 = 0.0;
  v30[0] = 0.0;
  double v28 = 0.0;
  __int16 v27 = 0;
  [v9 getFloatValue:v30 fromParm:1 atFxTime:a5->var0.var1];
  if (v30[0] == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v30[0]);
    }
    else {
      v21[0] = 0.0;
    }
    [a3 setHeliumRef:v21];
    if (*(void *)&v21[0]) {
      (*(void (**)(void))(**(void **)&v21[0] + 24))(*(void *)&v21[0]);
    }
    goto LABEL_11;
  }
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v29, 2, a5->var0.var1, v30[0]);
  [v10 getFloatValue:&v28 fromParm:3 atFxTime:a5->var0.var1];
  [v10 getBoolValue:(char *)&v27 + 1 fromParm:4 atFxTime:a5->var0.var1];
  [v10 getBoolValue:&v27 fromParm:5 atFxTime:a5->var0.var1];
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (a4)
  {
    [a4 imageInfo];
    if (*((void *)&v24 + 1) == 2) {
      double v28 = -v28;
    }
  }
  [a4 width];
  [a4 height];
  double v12 = v29;
  if (v29 == 0.0) {
    double v29 = 1.0;
  }
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4, v12);
  double v29 = fabs(v21[5]) * v29;
  v30[0] = fabs(v21[0]) * v30[0];
  int v11 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v11)
  {
    if ([a4 imageType] == 3)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        v20 = 0;
      }
      [(PAESharedDefaultBase *)self getImageBoundary:a4];
      v19[0] = vcvtq_f64_f32((float32x2_t)v17);
      v19[1] = vcvtq_f64_f32(v18);
      if (PCMatrix44Tmpl<double>::transformRect<double>(v21, (double *)v19, (uint64_t)v19))
      {
        v16 = v20;
        if (v20) {
          (*(void (**)(HGNode *))(*(void *)v20 + 16))(v20);
        }
        [(PAESharedDefaultBase *)self changeDOD:&v16 withRect:v19];
        v13 = v17;
        if (v20 == v17)
        {
          if (v20) {
            (*(void (**)(void))(*(void *)v20 + 24))();
          }
        }
        else
        {
          if (v20)
          {
            (*(void (**)(void))(*(void *)v20 + 24))();
            v13 = v17;
          }
          v20 = v13;
          v17 = 0;
        }
        if (v16) {
          (*(void (**)(HGNode *))(*(void *)v16 + 24))(v16);
        }
        [a4 width];
        [a4 height];
        [a3 width];
        [a3 height];
        [a3 width];
        [a3 height];
        v14 = (HgcWave *)HGObject::operator new(0x1A0uLL);
        HgcWave::HgcWave(v14);
      }
      if (v20) {
        (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
      }
    }
    LOBYTE(v11) = 0;
  }
  return v11;
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

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

@end