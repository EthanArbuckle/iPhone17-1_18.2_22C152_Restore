@interface PAEGloom
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEGloom)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEGloom

- (PAEGloom)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGloom;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (id)properties
{
  if (-[PAEGloom properties]::once != -1) {
    dispatch_once(&-[PAEGloom properties]::once, &__block_literal_global_47);
  }
  return (id)-[PAEGloom properties]::sPropertiesDict;
}

uint64_t __22__PAEGloom_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"PositionIndependent", v2, @"MayRemapTime", v3, @"SupportsHeliumRendering", v4, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAEGloom properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v16 = 0.0;
  unsigned __int8 v15 = 0;
  if (([v7 getFloatValue:&v16 fromParm:1 atFxTime:a3.var1] & 1) != 0
    || ([v7 getBoolValue:&v15 fromParm:4 atFxTime:a3.var1] & 1) != 0)
  {
    if (v16 == 0.0) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 3;
    }
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, v16);
    uint64_t v11 = [NSNumber numberWithBool:1];
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"PixelTransformSupport", v11, @"SupportsStableAnimation", objc_msgSend(NSNumber, "numberWithBool:", v15), @"SupportsLargeRenderScale", 0);
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
  v6.super_class = (Class)PAEGloom;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Gloom::Radius", 0, 0), 1, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Gloom::Amount", 0, 0), 2, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    [v3 addToggleButtonWithName:@"Prescale Input" parmId:3 defaultValue:0 parmFlags:2];
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Gloom::Equirect", 0, 0), 4, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
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
  v12 = (void *)v10;
  if ([a4 imageType] != 3) {
    return 0;
  }
  int v13 = [v12 versionAtCreation];
  uint64_t v52 = 0x4000000000000000;
  double v53 = 10.0;
  [v9 getFloatValue:&v53 fromParm:1 atFxTime:a5->var0.var1];
  double v14 = v53;
  if (v53 != 0.0)
  {
    if (!v13)
    {
      double v14 = pow(v53 / 100.0, 1.425) * 253.0;
      double v53 = v14;
    }
    char v51 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v51, 3, a5->var0.var1, v14);
    [v9 getFloatValue:&v52 fromParm:2 atFxTime:a5->var0.var1];
    char v50 = 0;
    [v9 getBoolValue:&v50 fromParm:4 atFxTime:a5->var0.var1];
    v51 &= v50 ^ 1;
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v17 = v48;
    double v16 = v49;
    if (a4)
    {
      [a4 heliumRef];
      float64_t v46 = v47;
      if (v47 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v47 + 16))(COERCE_FLOAT64_T(*(void *)&v47));
      }
    }
    else
    {
      float64_t v46 = 0.0;
      float64_t v47 = 0.0;
    }
    [(PAESharedDefaultBase *)self smear:&v46 fromImage:a4 toImage:a4];
    float64_t v20 = v41[0].f64[0];
    if (*(void *)&v47 == *(void *)&v41[0].f64[0])
    {
      if (v47 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v47 + 24))(COERCE_FLOAT64_T(*(void *)&v47));
      }
    }
    else
    {
      if (v47 != 0.0)
      {
        (*(void (**)(float64_t))(**(void **)&v47 + 24))(COERCE_FLOAT64_T(*(void *)&v47));
        float64_t v20 = v41[0].f64[0];
      }
      float64_t v47 = v20;
      v41[0].f64[0] = 0.0;
    }
    if (v46 != 0.0) {
      (*(void (**)(float64_t))(**(void **)&v46 + 24))(COERCE_FLOAT64_T(*(void *)&v46));
    }
    if (v51)
    {
      float64_t v45 = v47;
      if (v47 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v47 + 16))(COERCE_FLOAT64_T(*(void *)&v47));
      }
      HIDWORD(v21) = HIDWORD(v53);
      *(float *)&double v21 = v53;
      *(float *)&double v18 = v17;
      *(float *)&double v19 = v16;
      v44[0] = LODWORD(v18);
      v44[1] = LODWORD(v19);
      LODWORD(v18) = 1.5;
      LODWORD(v19) = 3.0;
      [(PAEFilterDefaultBase *)self makePrescaledBlurNode:&v45 radius:v44 withScale:v21 minInputScale:v18 maxInputScale:v19];
      if (*(void *)&v41[0].f64[0]) {
        v41[0].f64[0] = 0.0;
      }
      if (v45 != 0.0) {
        (*(void (**)(float64_t))(**(void **)&v45 + 24))(COERCE_FLOAT64_T(*(void *)&v45));
      }
    }
    else if (v50)
    {
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
      v22 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v22);
      *(void *)v22 = &unk_1F1094F88;
      *((void *)v22 + 51) = 0;
      *((void *)v22 + 52) = 0;
      *((_DWORD *)v22 + 106) = 0;
      *((void *)v22 + 54) = 0;
      *((void *)v22 + 55) = 0;
      double v23 = v53;
      double v24 = v48;
      double v25 = v49;
      unint64_t v26 = [a4 width];
      double v27 = v41[0].f64[0];
      unint64_t v28 = [a4 height];
      float v29 = v23;
      float v30 = v24;
      float v31 = v25;
      v40[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v41[0]), v41[1]);
      float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v42), v43);
      float32x4_t v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v40[1] + 8)), *(float64x2_t *)((char *)&v40[2] + 8));
      float32x4_t v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v40[3] + 8)), *(float64x2_t *)((char *)&v40[4] + 8));
      HEquirectGaussianBlur::init((uint64_t)v22, vcvtpd_s64_f64(fabs(v27) * (double)v26), vcvtpd_s64_f64(fabs(v42.f64[1]) * (double)v28), (float32x2_t *)v40, (float32x2_t *)&v39, (float32x2_t *)&v38, (float32x2_t *)&v37, v29, v30, v31);
      (*(void (**)(HGNode *, void, float64_t))(*(void *)v22 + 120))(v22, 0, COERCE_FLOAT64_T(*(void *)&v47));
      (*(void (**)(HGNode *))(*(void *)v22 + 16))(v22);
      (*(void (**)(HGNode *))(*(void *)v22 + 24))(v22);
    }
    else
    {
      v32 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur(v32);
      float v33 = v53;
      float v34 = v17;
      float v35 = v16;
      HGaussianBlur::init(v32, v33, v34, v35, v13 == 0, 0, 0);
      (*(void (**)(HGaussianBlur *, void, float64_t))(*(void *)v32 + 120))(v32, 0, COERCE_FLOAT64_T(*(void *)&v47));
      (*(void (**)(HGaussianBlur *))(*(void *)v32 + 16))(v32);
      (*(void (**)(HGaussianBlur *))(*(void *)v32 + 24))(v32);
    }
    v36 = (HgcGloom *)HGObject::operator new(0x1A0uLL);
    HgcGloom::HgcGloom(v36);
  }
  if (a4) {
    objc_msgSend(a4, "heliumRef", v53);
  }
  else {
    v41[0].f64[0] = 0.0;
  }
  [a3 setHeliumRef:v41];
  if (*(void *)&v41[0].f64[0]) {
    (*(void (**)(void))(**(void **)&v41[0].f64[0] + 24))(*(void *)&v41[0].f64[0]);
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