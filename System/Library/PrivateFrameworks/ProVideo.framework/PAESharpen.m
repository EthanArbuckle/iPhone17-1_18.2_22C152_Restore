@interface PAESharpen
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAESharpen)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAESharpen

- (PAESharpen)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESharpen;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v16 = 0.0;
  if ([v7 getFloatValue:&v16 fromParm:2 atFxTime:a3.var1])
  {
    if (v16 == 0.0) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 1;
    }
    char v15 = 0;
    objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v15, 3, a3.var1, v16);
    BOOL v9 = v15 == 0;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = [NSNumber numberWithInt:v8];
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithBool:", v9), @"SupportsLargeRenderScale", 0);
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
  v6.receiver = self;
  v6.super_class = (Class)PAESharpen;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Sharpen::Intensity", 0, 0), 1, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Sharpen::Amount", 0, 0), 2, 0, 2.5, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Sharpen::Equirect", 0, 0), 3, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Sharpen::Amount", 0, 0), 4, 0, 2);
  }
  return v3 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  BOOL v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
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
  v12 = (void *)v10;
  if ([a4 imageType] != 3) {
    return 0;
  }
  double v46 = 2.5;
  [v9 getFloatValue:&v46 fromParm:2 atFxTime:a5->var0.var1];
  if (v46 != 0.0)
  {
    int v14 = objc_msgSend(v12, "versionAtCreation", v46);
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v15 = v44;
    double v16 = v45;
    uint64_t v43 = 0x3FF0000000000000;
    [v9 getFloatValue:&v43 fromParm:1 atFxTime:a5->var0.var1];
    char v42 = 0;
    [v9 getBoolValue:&v42 fromParm:3 atFxTime:a5->var0.var1];
    if (a4) {
      [a4 heliumRef];
    }
    else {
      float64_t v41 = 0.0;
    }
    if (v42)
    {
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
      v17 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v17);
      *(void *)v17 = &unk_1F1094F88;
      *((void *)v17 + 51) = 0;
      *((void *)v17 + 52) = 0;
      *((_DWORD *)v17 + 106) = 0;
      *((void *)v17 + 54) = 0;
      *((void *)v17 + 55) = 0;
      (*(void (**)(HGNode *, void, uint64_t))(*(void *)v17 + 120))(v17, 0, [a4 heliumNode]);
      double v19 = v45;
      double v18 = v46;
      double v20 = v44;
      unint64_t v21 = [a4 width];
      double v22 = v38[0].f64[0];
      unint64_t v23 = [a4 height];
      float v24 = v18;
      float v25 = v20;
      float v26 = v19;
      v37[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38[0]), v38[1]);
      float32x4_t v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v40);
      float32x4_t v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v37[1]), (float64x2_t)v37[2]);
      float32x4_t v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v37[3]), (float64x2_t)v37[4]);
      HEquirectGaussianBlur::init((uint64_t)v17, vcvtpd_s64_f64(fabs(v22) * (double)v21), vcvtpd_s64_f64(fabs(v39.f64[1]) * (double)v23), (float32x2_t *)v37, (float32x2_t *)&v36, (float32x2_t *)&v35, (float32x2_t *)&v34, v24, v25, v26);
      (*(void (**)(HGNode *))(*(void *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(void *)v17 + 24))(v17);
    }
    else
    {
      float64_t v33 = v41;
      if (v41 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v41 + 16))(COERCE_FLOAT64_T(*(void *)&v41));
      }
      [(PAESharedDefaultBase *)self smear:&v33 fromImage:a4 toImage:a4];
      float64_t v27 = v38[0].f64[0];
      if (*(void *)&v41 == *(void *)&v38[0].f64[0])
      {
        if (v41 != 0.0) {
          (*(void (**)(float64_t))(**(void **)&v41 + 24))(COERCE_FLOAT64_T(*(void *)&v41));
        }
      }
      else
      {
        if (v41 != 0.0)
        {
          (*(void (**)(float64_t))(**(void **)&v41 + 24))(COERCE_FLOAT64_T(*(void *)&v41));
          float64_t v27 = v38[0].f64[0];
        }
        float64_t v41 = v27;
        v38[0].f64[0] = 0.0;
      }
      if (v33 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v33 + 24))(COERCE_FLOAT64_T(*(void *)&v33));
      }
      v28 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur(v28);
      float v29 = v46;
      float v30 = v15;
      float v31 = v16;
      HGaussianBlur::init(v28, v29, v30, v31, v14 == 0, 0, 0);
      (*(void (**)(HGaussianBlur *, void, float64_t))(*(void *)v28 + 120))(v28, 0, COERCE_FLOAT64_T(*(void *)&v41));
      (*(void (**)(HGaussianBlur *))(*(void *)v28 + 16))(v28);
      (*(void (**)(HGaussianBlur *))(*(void *)v28 + 24))(v28);
    }
    v32 = (HgcSharpen *)HGObject::operator new(0x1A0uLL);
    HgcSharpen::HgcSharpen(v32);
  }
  if (a4) {
    objc_msgSend(a4, "heliumRef", v46);
  }
  else {
    v38[0].f64[0] = 0.0;
  }
  [a3 setHeliumRef:v38];
  if (*(void *)&v38[0].f64[0]) {
    (*(void (**)(void))(**(void **)&v38[0].f64[0] + 24))(*(void *)&v38[0].f64[0]);
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