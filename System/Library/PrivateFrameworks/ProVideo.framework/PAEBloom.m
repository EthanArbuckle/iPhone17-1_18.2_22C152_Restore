@interface PAEBloom
- (BOOL)addParameters;
- (BOOL)bloomHeliumRender:(id)a3 withInput:(id)a4 withRadius:(double)a5 withBrightness:(double)a6 withThreshold:(double)a7 doDarkBloom:(BOOL)a8 withXScale:(double)a9 withYScale:(double)a10 withDoCrop:(BOOL)a11 withDoClip:(BOOL)a12 is360:(BOOL)a13 withInfo:(id *)a14;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEBloom)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEBloom

- (PAEBloom)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBloom;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v16 = 0.0;
  if (([v7 getFloatValue:&v16 fromParm:1 atFxTime:a3.var1] & 1) != 0
    && (unsigned __int8 v15 = 0, ([v7 getBoolValue:&v15 fromParm:6 atFxTime:a3.var1] & 1) != 0)
    && (unsigned __int8 v14 = 0, ([v7 getBoolValue:&v14 fromParm:8 atFxTime:a3.var1] & 1) != 0))
  {
    if (v16 == 0.0) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 1;
    }
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, v16);
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithBool:", (v15 | v14) == 0), @"PositionIndependent", 0);
  }
  else if (a4)
  {
    v12 = (objc_class *)objc_opt_class();
    id v13 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v12)];
    id result = 0;
    *a4 = v13;
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
  v10.super_class = (Class)PAEBloom;
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
    BOOL v7 = [v4 versionAtCreation] < 2;
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Amount", 0, 0), 1, 0, 7.0, 0.0, 32.0, 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Brightness", 0, 0), 2, 0, 70.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Threshold", 0, 0), 3, 0, 75.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Horizontal", 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Vertical", 0, 0), 5, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Clip", 0, 0), 7, v7, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Crop", 0, 0), 6, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Bloom::Equirect", 0, 0), 8, 0, 1);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v11 = v10;
  if (v10)
  {
    char v22 = 0;
    [v10 getBoolValue:&v22 fromParm:8 atFxTime:a6->var0.var1];
    if (v22)
    {
      if (a3) {
        *a3 = a5->var0;
      }
      if (a4)
      {
        unint64_t var1 = a5->var1;
LABEL_11:
        *a4 = var1;
      }
    }
    else
    {
      double v21 = 0.0;
      [v11 getFloatValue:&v21 fromParm:1 atFxTime:a6->var0.var1];
      double v20 = 0.0;
      [v11 getFloatValue:&v20 fromParm:4 atFxTime:a6->var0.var1];
      double v20 = v20 * 0.01;
      double v19 = 0.0;
      [v11 getFloatValue:&v19 fromParm:5 atFxTime:a6->var0.var1];
      double v19 = v19 * 0.01;
      char v18 = 0;
      [v11 getBoolValue:&v18 fromParm:6 atFxTime:a6->var0.var1];
      unint64_t var0 = a5->var0;
      unint64_t var1 = a5->var1;
      if (v18)
      {
        if (a3) {
          *a3 = var0;
        }
        if (a4) {
          goto LABEL_11;
        }
      }
      else
      {
        float v15 = v21 + v21;
        double v16 = v15;
        unsigned int v17 = vcvtpd_s64_f64(v19 * v16);
        if (a3) {
          *a3 = var0 + (int)(2 * vcvtpd_s64_f64(v20 * v16));
        }
        var1 += (int)(2 * v17);
        if (a4) {
          goto LABEL_11;
        }
      }
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    objc_super v10 = (void *)v9;
    if ([a4 imageType] == 3)
    {
      [(PAESharedDefaultBase *)self getScaleForImage:a4];
      double v12 = v26[1];
      double v11 = v26[2];
      v26[0] = 0.0;
      [v10 getFloatValue:v26 fromParm:1 atFxTime:a5->var0.var1];
      if (v26[0] == 0.0)
      {
        if (a4) {
          objc_msgSend(a4, "heliumRef", v26[0]);
        }
        else {
          double v25 = 0.0;
        }
        [a3 setHeliumRef:&v25];
        if (v25 != 0.0) {
          (*(void (**)(double))(**(void **)&v25 + 24))(COERCE_DOUBLE(*(void *)&v25));
        }
        LOBYTE(v9) = 1;
      }
      else
      {
        if (v12 <= v11) {
          double v13 = v11;
        }
        else {
          double v13 = v12;
        }
        double v25 = 0.0;
        objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v25, 4, a5->var0.var1, v26[0]);
        double v25 = v12 / v13 * (v25 * 0.01);
        double v24 = 0.0;
        [v10 getFloatValue:&v24 fromParm:5 atFxTime:a5->var0.var1];
        double v24 = v11 / v13 * (v24 * 0.01);
        double v23 = 0.0;
        [v10 getFloatValue:&v23 fromParm:2 atFxTime:a5->var0.var1];
        double v22 = 0.0;
        [v10 getFloatValue:&v22 fromParm:3 atFxTime:a5->var0.var1];
        unsigned __int8 v21 = 0;
        [v10 getBoolValue:&v21 fromParm:7 atFxTime:a5->var0.var1];
        unsigned __int8 v20 = 0;
        [v10 getBoolValue:&v20 fromParm:6 atFxTime:a5->var0.var1];
        unsigned __int8 v19 = 0;
        [v10 getBoolValue:&v19 fromParm:8 atFxTime:a5->var0.var1];
        double v14 = v23;
        double v23 = fabs((v23 + -50.0) * 4.0);
        if (v14 >= 50.0)
        {
          uint64_t v15 = 0;
        }
        else
        {
          double v22 = 100.0 - v22;
          uint64_t v15 = 1;
        }
        long long v16 = *(_OWORD *)&a5->var2;
        v18[0] = *(_OWORD *)&a5->var0.var0;
        v18[1] = v16;
        v18[2] = *(_OWORD *)&a5->var4;
        LOBYTE(v9) = -[PAEBloom bloomHeliumRender:withInput:withRadius:withBrightness:withThreshold:doDarkBloom:withXScale:withYScale:withDoCrop:withDoClip:is360:withInfo:](self, "bloomHeliumRender:withInput:withRadius:withBrightness:withThreshold:doDarkBloom:withXScale:withYScale:withDoCrop:withDoClip:is360:withInfo:", a3, a4, v15, v20, v21, v19, v26[0], v18);
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)bloomHeliumRender:(id)a3 withInput:(id)a4 withRadius:(double)a5 withBrightness:(double)a6 withThreshold:(double)a7 doDarkBloom:(BOOL)a8 withXScale:(double)a9 withYScale:(double)a10 withDoCrop:(BOOL)a11 withDoClip:(BOOL)a12 is360:(BOOL)a13 withInfo:(id *)a14
{
  BOOL v14 = a13;
  BOOL v15 = a12;
  BOOL v46 = a11;
  BOOL v16 = a8;
  double v25 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v25)
  {
    BOOL v26 = [v25 versionAtCreation] == 0;
    if (a4)
    {
LABEL_3:
      [a4 heliumRef];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v26 = 1;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v55 = 0;
LABEL_6:
  float v27 = a7 / 100.0;
  if (v16) {
    float v28 = -10.0;
  }
  else {
    float v28 = 10.0;
  }
  if (v16) {
    float v29 = -v27;
  }
  else {
    float v29 = v27;
  }
  v30 = (HgcBloomThreshold *)HGObject::operator new(0x1A0uLL);
  HgcBloomThreshold::HgcBloomThreshold(v30);
  (*(void (**)(HgcBloomThreshold *, void, uint64_t))(*(void *)v30 + 120))(v30, 0, v55);
  (*(void (**)(HgcBloomThreshold *, void, float, float, float, float))(*(void *)v30 + 96))(v30, 0, v29 * -10.0, v29 * -10.0, v29 * -10.0, v29 * -10.0);
  (*(void (**)(HgcBloomThreshold *, uint64_t, float, float, float, float))(*(void *)v30 + 96))(v30, 1, v28, v28, v28, v28);
  (*(void (**)(HgcBloomThreshold *, uint64_t, double, double, double, double))(*(void *)v30 + 96))(v30, 3, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HgcBloomThreshold *, uint64_t, float, float, double, double))(*(void *)v30 + 96))(v30, 2, -3.4028e38, 3.4028e38, 0.0, 0.0);
  if (v14)
  {
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
    v31 = (HGNode *)HGObject::operator new(0x1C0uLL);
    HGNode::HGNode(v31);
    *(void *)v31 = &unk_1F1094F88;
    *((void *)v31 + 51) = 0;
    *((void *)v31 + 52) = 0;
    *((_DWORD *)v31 + 106) = 0;
    *((void *)v31 + 54) = 0;
    *((void *)v31 + 55) = 0;
    off_1F1095000(v31, 0, (HGNode *)v30);
    unint64_t v32 = [a4 width];
    unint64_t v33 = [a4 height];
    float v34 = a5 * 0.5;
    float v35 = a9;
    float v36 = a10;
    float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47[0]), v47[1]);
    float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v48), v49);
    float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54[0]), v54[1]);
    float32x4_t v50 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54[2]), v54[3]);
    HEquirectGaussianBlur::init((uint64_t)v31, vcvtpd_s64_f64(fabs(v47[0].f64[0]) * (double)v32), vcvtpd_s64_f64(fabs(v48.f64[1]) * (double)v33), (float32x2_t *)&v53, (float32x2_t *)&v52, (float32x2_t *)&v51, (float32x2_t *)&v50, v34, v35, v36);
    (*(void (**)(HGNode *))(*(void *)v31 + 16))(v31);
    (*(void (**)(HGNode *))(*(void *)v31 + 24))(v31);
  }
  else
  {
    v31 = (HGNode *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur((HGaussianBlur *)v31);
    (*(void (**)(HGNode *, void, HgcBloomThreshold *))(*(void *)v31 + 120))(v31, 0, v30);
    float v37 = a5 * 0.5;
    float v38 = a9;
    float v39 = a10;
    HGaussianBlur::init((HGaussianBlur *)v31, v37, v38, v39, 0, 0, 0);
    (*(void (**)(HGNode *))(*(void *)v31 + 16))(v31);
    (*(void (**)(HGNode *))(*(void *)v31 + 24))(v31);
  }
  if (v16) {
    a6 = -a6;
  }
  v40 = (HgcEchoScaleAndAdd *)HGObject::operator new(0x1A0uLL);
  HgcEchoScaleAndAdd::HgcEchoScaleAndAdd(v40);
  float v41 = a6 / 50.0;
  *(void *)&v54[0].f64[0] = v40;
  (*(void (**)(HgcEchoScaleAndAdd *, void, float, float, float, float))(*(void *)v40 + 96))(v40, 0, v41, v41, v41, v41);
  v42.n128_u32[0] = 2139095039;
  if (v15) {
    v42.n128_f32[0] = 1.0;
  }
  (*(void (**)(__n128, double, double, double))(**(void **)&v54[0].f64[0] + 96))(v42, 0.0, 0.0, 0.0);
  (*(void (**)(HGNode *))(*(void *)v31 + 16))(v31);
  v43 = (HGXForm *)v31;
  if (v26)
  {
    v43 = (HGXForm *)v31;
    if (a14->var5)
    {
      HGTransform::HGTransform((HGTransform *)v47);
      HGTransform::Translate((HGTransform *)v47, 0.0, -2.25, 0.0);
      v44 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v44);
      (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v44 + 576))(v44, v47);
      (*(void (**)(HGXForm *, void, uint64_t))(*(void *)v44 + 120))(v44, 0, v55);
      v43 = (HGXForm *)v31;
      if (v31 != (HGNode *)v44)
      {
        (*(void (**)(HGNode *))(*(void *)v31 + 24))(v31);
        v43 = v44;
        (*(void (**)(HGXForm *))(*(void *)v44 + 16))(v44);
      }
      (*(void (**)(HGXForm *))(*(void *)v44 + 24))(v44);
      HGTransform::~HGTransform((HGTransform *)v47);
    }
  }
  (*(void (**)(void, void, HGXForm *))(**(void **)&v54[0].f64[0] + 120))(*(void *)&v54[0].f64[0], 0, v43);
  (*(void (**)(void, uint64_t, uint64_t))(**(void **)&v54[0].f64[0] + 120))(*(void *)&v54[0].f64[0], 1, v55);
  if (v46) {
    [(PAESharedDefaultBase *)self crop:v54 fromImage:a4 toImage:a3];
  }
  [a3 setHeliumRef:v54];
  (*(void (**)(HGXForm *))(*(void *)v43 + 24))(v43);
  if (*(void *)&v54[0].f64[0]) {
    (*(void (**)(void))(**(void **)&v54[0].f64[0] + 24))(*(void *)&v54[0].f64[0]);
  }
  (*(void (**)(HGNode *))(*(void *)v31 + 24))(v31);
  (*(void (**)(HgcBloomThreshold *))(*(void *)v30 + 24))(v30);
  if (v55) {
    (*(void (**)(uint64_t))(*(void *)v55 + 24))(v55);
  }
  return 1;
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