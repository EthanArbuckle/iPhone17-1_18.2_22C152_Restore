@interface PAELightRays
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAELightRays)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
@end

@implementation PAELightRays

- (PAELightRays)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAELightRays;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAELightRays;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithBool:", 1), @"InputSizeLimit", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v16 = 0.0;
  char v15 = 0;
  if ([v7 getFloatValue:&v16 fromParm:1 atFxTime:a3.var1]
    && ([v7 getBoolValue:&v15 fromParm:5 atFxTime:a3.var1] & 1) != 0)
  {
    if (v16 == 0.0) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 1;
    }
    if (v15) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 3;
    }
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", v8, v16);
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9), @"AutoColorProcessingSupport", 0);
  }
  else if (a4)
  {
    v13 = (objc_class *)objc_opt_class();
    id v14 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v13)];
    id result = 0;
    *a4 = v14;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  v8.receiver = self;
  v8.super_class = (Class)PAELightRays;
  [(PAESharedDefaultBase *)&v8 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  unsigned int v4 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
  if (v3)
  {
    BOOL v5 = v4 < 2;
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"LightRays::Amount", 0, 0), 1, 0, 50.0, 0.0, 200.0, 0.0, 200.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"LightRays::Center", 0, 0), 2, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"LightRays::Glow", 0, 0), 3, 0, 1.5, 0.0, 8.0, 0.0, 8.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"LightRays::Expansion", 0, 0), 4, 32, 0.4, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"LightRays::Clip", 0, 0), 5, v5, 1);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  uint64_t v11 = v10;
  if (v10)
  {
    double v17 = 0.0;
    [v10 getFloatValue:&v17 fromParm:1 atFxTime:a6->var0.var1];
    double v16 = 0.0;
    [v11 getFloatValue:&v16 fromParm:4 atFxTime:a6->var0.var1];
    unint64_t var1 = a5->var1;
    float v13 = v17 * v16;
    uint64_t v14 = (int)(2 * vcvtps_s32_f32(v13));
    if (a3) {
      *a3 = a5->var0 + v14;
    }
    if (a4) {
      *a4 = var1 + v14;
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v6 = MEMORY[0x1F4188790](self);
  objc_super v8 = v7;
  v10 = v9;
  v34 = v11;
  v45[2] = *MEMORY[0x1E4F143B8];
  v33 = (id *)v6;
  v12 = (void *)[*(id *)(v6 + 8) apiForProtocol:&unk_1F121A608];
  float v13 = v12;
  if (v12)
  {
    v43[0] = 0.0;
    [v12 getFloatValue:v43 fromParm:1 atFxTime:*v8];
    if (v43[0] == 0.0)
    {
      if (v10) {
        objc_msgSend(v10, "heliumRef", v43[0]);
      }
      else {
        *(void *)&v44[0].var0 = 0;
      }
      [v34 setHeliumRef:v44];
      if (*(void *)&v44[0].var0) {
        (*(void (**)(void))(**(void **)&v44[0].var0 + 24))(*(void *)&v44[0].var0);
      }
    }
    else
    {
      uint64_t v41 = 0x3FE0000000000000;
      uint64_t v42 = 0x3FE0000000000000;
      objc_msgSend(v13, "getXValue:YValue:fromParm:atFxTime:", &v42, &v41, 2, *v8, v43[0]);
      uint64_t v40 = 0;
      [v13 getFloatValue:&v40 fromParm:3 atFxTime:*v8];
      char v39 = 0;
      [v13 getBoolValue:&v39 fromParm:5 atFxTime:*v8];
      if (v10) {
        [v10 heliumRef];
      }
      else {
        uint64_t v38 = 0;
      }
      unint64_t v14 = [v34 width];
      unint64_t v15 = [v34 height];
      v45[0] = 0;
      v45[1] = 0;
      double v16 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
      HGTextureWrap::HGTextureWrap(v16);
      HGTextureWrap::SetTextureWrapMode((uint64_t)v16, 0, v17);
      HGTextureWrap::SetTextureBorderColor(v16, (float *)v45);
      (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v16 + 120))(v16, 0, v38);
      float v18 = (double)v14 * 0.5;
      float v19 = (double)v15 * 0.5;
      *(void *)&v44[0].var0 = HGRectMake4f(v20, -v18, -v19, v18, v19);
      *(void *)&v44[0].var2 = v21;
      HGTextureWrap::SetCropRect(v16, v44);
      if (objc_msgSend((id)objc_msgSend(v33[1], "apiForProtocol:", &unk_1F121E208), "versionAtCreation"))
      {
        [v10 width];
        [v10 width];
        uint64_t v5 = [v10 height];
        [v10 height];
      }
      [v33 getScaleForImage:v10];
      double v22 = v36;
      if (v36 <= v37) {
        double v22 = v37;
      }
      LODWORD(v5) = vcvtpd_s64_f64(v22 * v43[0] * 0.5);
      if ((int)v5 >= 1)
      {
        uint64_t v23 = 0;
        float v24 = 0.00390625 / v22;
        float v25 = 0.0;
        do
        {
          float v26 = 1.0 - (float)((float)(int)v23 / (float)(int)v5);
          *((float *)&v44[0].var0 + v23) = v26;
          float v25 = v25 + v26;
          *((float *)&v43[1] + v23) = 1.0 - (float)(v24 * (float)(int)v23);
          ++v23;
        }
        while (v5 != v23);
        v27 = (float *)v44;
        uint64_t v28 = v5;
        float v29 = 1.0 / v25;
        do
        {
          float *v27 = v29 * *v27;
          ++v27;
          --v28;
        }
        while (v28);
      }
      v35 = 0;
      if (v5)
      {
        v30 = (HGNode *)HGObject::operator new(0x1A0uLL);
        HGNode::HGNode(v30);
        if (v30) {
          v35 = v30;
        }
        if ((int)v5 >= 1)
        {
          v31 = (HgcConvolvePass8tapPoint *)HGObject::operator new(0x1B0uLL);
          HgcConvolvePass8tapPoint::HgcConvolvePass8tapPoint(v31);
        }
      }
      else
      {
        v35 = v16;
        (*(void (**)(HGTextureWrap *))(*(void *)v16 + 16))(v16);
      }
      [v33 crop:&v35 fromImage:v34 toImage:v34];
      [v34 setHeliumRef:&v35];
      if (v35) {
        (*(void (**)(void *))(*(void *)v35 + 24))(v35);
      }
      (*(void (**)(HGTextureWrap *))(*(void *)v16 + 24))(v16);
      if (v38) {
        (*(void (**)(uint64_t))(*(void *)v38 + 24))(v38);
      }
    }
  }
  return v13 != 0;
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