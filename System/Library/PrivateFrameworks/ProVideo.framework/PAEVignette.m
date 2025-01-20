@interface PAEVignette
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEVignette)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEVignette

- (PAEVignette)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEVignette;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEVignette;
  [(PAESharedDefaultBase *)&v6 addParameters];
  v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Size", 0, 0), 1, 0, 0.6, 0.0, 1.5, 0.0, 1.5, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Falloff", 0, 0), 5, 0, 0.5, 0.001, 1.0, 0.001, 1.0, 0.01);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Center", 0, 0), 6, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Blur Amount", 0, 0), 2, 0, 4.0, 0.0, 400.0, 0.0, 16.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Darken", 0, 0), 3, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Vignette::Saturation", 0, 0), 4, 0, 0.3, -3.0, 3.0, -1.0, 1.0, 0.01);
    [v3 addToggleButtonWithName:@"Prescale Input" parmId:7 defaultValue:0 parmFlags:2];
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
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
  uint64_t v13 = [a4 imageType];
  int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  [v9 mixAmountAtTime:a5->var0.var1];
  BOOL result = 0;
  if (v14 && v13 == 3)
  {
    double v16 = v15;
    double v41 = 0.0;
    [v9 getFloatValue:&v41 fromParm:1 atFxTime:a5->var0.var1];
    if (v41 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v41);
      }
      else {
        double v35 = 0.0;
      }
      [a3 setHeliumRef:&v35];
      if (v35 != 0.0) {
        (*(void (**)(double))(**(void **)&v35 + 24))(COERCE_DOUBLE(*(void *)&v35));
      }
    }
    else
    {
      double v41 = 1.5 - v41;
      double v40 = 0.0;
      [v9 getFloatValue:&v40 fromParm:5 atFxTime:a5->var0.var1];
      uint64_t v39 = 0;
      [v9 getFloatValue:&v39 fromParm:2 atFxTime:a5->var0.var1];
      double v38 = 0.0;
      [v9 getFloatValue:&v38 fromParm:3 atFxTime:a5->var0.var1];
      double v37 = 0.0;
      [v9 getFloatValue:&v37 fromParm:4 atFxTime:a5->var0.var1];
      double v35 = 0.0;
      double v36 = 0.0;
      [v9 getXValue:&v35 YValue:&v36 fromParm:6 atFxTime:a5->var0.var1];
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v34 = 0;
      }
      v17 = (HgcVignetteBB *)HGObject::operator new(0x1A0uLL);
      HgcVignetteBB::HgcVignetteBB(v17);
      v33 = v17;
      (*(void (**)(HgcVignetteBB *, void, uint64_t))(*(void *)v17 + 120))(v17, 0, v34);
      double v19 = v40;
      double v18 = v41;
      double v20 = v37;
      double v21 = v38;
      unint64_t v22 = [a4 width];
      unint64_t v23 = [a4 height];
      float v24 = v35 + -0.5;
      float v25 = v36 + -0.5;
      (*(void (**)(HgcVignetteBB *, void, float, float, double, double))(*(void *)v17 + 96))(v17, 0, v24, v25, 0.0, 0.0);
      float v26 = 1.0 / ((1.50999999 - v18) * v19);
      float v27 = -(v18 * v26);
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, double, double))(*(void *)v17 + 96))(v17, 1, v26, v27, 0.0, 0.0);
      float v28 = 1.0 - v21;
      float v29 = v20 + 1.0;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, float, float))(*(void *)v17 + 96))(v17, 2, v28, v29, 1.0, 1.0);
      float v30 = 1.0 / (double)v22;
      float v31 = 1.0 / (double)v23;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, double, double))(*(void *)v17 + 96))(v17, 3, v30, v31, 0.0, 0.0);
      float v32 = v16;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, double, double, double))(*(void *)v17 + 96))(v17, 4, v32, 0.0, 0.0, 0.0);
      [a3 setHeliumRef:&v33];
      if (v33) {
        (*(void (**)(HgcVignetteBB *))(*(void *)v33 + 24))(v33);
      }
      if (v34) {
        (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
      }
    }
    return 1;
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
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"InputSizeLimit", v6, @"SupportsInternalMixing", v7, @"PositionIndependent", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  double v12 = 0.0;
  if (objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v12, 1, a3.var1))
  {
    if (v12 == 0.0) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 1;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", v6, v12);
    return (id)objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithBool:", 1), @"SupportsStableAnimation", 0);
  }
  else if (a4)
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v10)];
    id result = 0;
    *a4 = v11;
  }
  else
  {
    return 0;
  }
  return result;
}

@end