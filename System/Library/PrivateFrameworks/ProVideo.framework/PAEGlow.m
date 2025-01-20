@interface PAEGlow
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (HGRef<HGNode>)get360BlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7;
- (HGRef<HGNode>)getBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7 is360:(BOOL)a8;
- (HGRef<HGNode>)getPlanarBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7;
- (PAEGlow)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEGlow

- (PAEGlow)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGlow;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEGlow;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  if (-[PAEGlow properties]::once != -1) {
    dispatch_once(&-[PAEGlow properties]::once, &__block_literal_global_44);
  }
  return (id)-[PAEGlow properties]::sPropertiesDict;
}

uint64_t __21__PAEGlow_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithInt:6];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"SupportsHeliumRendering", v2, @"MayRemapTime", v3, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAEGlow properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!a4 || v6)
  {
    char v14 = 0;
    [v6 getBoolValue:&v14 fromParm:6 atFxTime:a3.var1];
    if (v14)
    {
      v17[0] = @"PositionIndependent";
      uint64_t v9 = [NSNumber numberWithBool:0];
      v17[1] = @"SupportsLargeRenderScale";
      v18[0] = v9;
      v18[1] = [NSNumber numberWithBool:0];
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = v18;
      v12 = v17;
    }
    else
    {
      v15[0] = @"PositionIndependent";
      uint64_t v13 = [NSNumber numberWithBool:1];
      v15[1] = @"SupportsLargeRenderScale";
      v16[0] = v13;
      v16[1] = [NSNumber numberWithBool:1];
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = v16;
      v12 = v15;
    }
    return (id)[v10 dictionaryWithObjects:v11 forKeys:v12 count:2];
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4F28588];
    v20[0] = @"Unable to retrieve parameter retrieval API (v5)";
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 13, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
    id result = 0;
    *a4 = v7;
  }
  return result;
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEGlow;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  objc_super v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
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
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Radius", 0, 0), 1, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Opacity", 0, 0), 2, 0, 1.5, 0.0, 3.0, 0.0, 3.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Threshold", 0, 0), 3, 0, 0.75, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Softness", 0, 0), 4, 0, 0.2, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Clip", 0, 0), 5, v7, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Glow::Equirect", 0, 0), 6, 0, 1);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (a3) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || a4 == 0;
  char v13 = v12;
  if (!v12)
  {
    char v14 = v10;
    char v21 = 0;
    [v10 getBoolValue:&v21 fromParm:6 atFxTime:a6->var0.var1];
    if (v21)
    {
      *a3 = a5->var0;
      unint64_t var1 = a5->var1;
    }
    else
    {
      double v20 = 0.0;
      [v14 getFloatValue:&v20 fromParm:1 atFxTime:a6->var0.var1];
      float v16 = v20 + v20;
      unsigned int v17 = vcvtps_s32_f32(v16);
      int v18 = a5->var1;
      *a3 = (int)(LODWORD(a5->var0) + 2 * v17);
      unint64_t var1 = (int)(v18 + 2 * v17);
    }
    *a4 = var1;
  }
  return v13 ^ 1;
}

- (HGRef<HGNode>)get360BlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7
{
  uint64_t v9 = v7;
  char v13 = v8;
  if (self)
  {
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a5, a6, a7.var0, a7.var1);
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a5];
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    float64x2_t v40 = 0u;
    float64x2_t v41 = 0u;
    float64x2_t v38 = 0u;
    float64x2_t v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    float64x2_t v32 = 0u;
    float64x2_t v33 = 0u;
    float64x2_t v30 = 0u;
    float64x2_t v31 = 0u;
  }
  float v16 = (HGNode *)HGObject::operator new(0x1C0uLL);
  HGNode::HGNode(v16);
  *(void *)float v16 = &unk_1F1094F88;
  *((void *)v16 + 51) = 0;
  *((void *)v16 + 52) = 0;
  *((_DWORD *)v16 + 106) = 0;
  *((void *)v16 + 54) = 0;
  *((void *)v16 + 55) = 0;
  off_1F1095000(v16, 0, *(HGNode **)a3.var0);
  double v17 = *v9;
  double v18 = v9[1];
  unint64_t v19 = [a4 width];
  double v20 = v38.f64[0];
  unint64_t v21 = [a4 height];
  float v22 = a6;
  float v23 = v17;
  float v24 = v18;
  float32x4_t v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v39);
  float32x4_t v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v40), v41);
  float32x4_t v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v30), v31);
  float32x4_t v26 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
  v25 = HEquirectGaussianBlur::init((uint64_t)v16, vcvtpd_s64_f64(fabs(v20) * (double)v19), vcvtpd_s64_f64(fabs(v40.f64[1]) * (double)v21), (float32x2_t *)&v29, (float32x2_t *)&v28, (float32x2_t *)&v27, (float32x2_t *)&v26, v22, v23, v24);
  *char v13 = v16;
  return (HGRef<HGNode>)v25;
}

- (HGRef<HGNode>)getPlanarBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7
{
  double v9 = a6;
  BOOL v12 = v8;
  double v14 = *v7;
  double v13 = v7[1];
  int v15 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208, a4, a5, a6, a7.var0, a7.var1), "versionAtCreation");
  if (!v15)
  {
    double v9 = pow(v9 / 100.0, 1.425) * 253.0;
    [a4 pixelAspect];
    double v14 = v14 * (1.0 / v16);
  }
  double v17 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v17);
  double v18 = 4.0;
  if (v9 <= 10.0 && (double v18 = 2.0, v9 <= 5.0))
  {
    int v20 = 0;
    double v18 = 1.0;
  }
  else
  {
    HGTransform::HGTransform((HGTransform *)v27);
    HGTransform::Scale((HGTransform *)v27, 1.0 / v18, 1.0 / v18, 1.0);
    (*(void (**)(HGXForm *, void, void))(*(void *)v17 + 120))(v17, 0, *(void *)a3.var0);
    (*(void (**)(HGXForm *, unsigned char *))(*(void *)v17 + 576))(v17, v27);
    long double v19 = pow(v9 / 600.0, 0.65);
    double v9 = pow(v19 * 575.0 / v18 / 575.0, 1.53846154) * 600.0;
    HGTransform::~HGTransform((HGTransform *)v27);
    int v20 = 1;
  }
  unint64_t v21 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v21);
  float v22 = v9;
  float v23 = v14;
  float v24 = v13;
  HGaussianBlur::init(v21, v22, v23, v24, v15 == 0, 0, 0);
  if (v20) {
    (*(void (**)(HGaussianBlur *, void, HGXForm *))(*(void *)v21 + 120))(v21, 0, v17);
  }
  else {
    (*(void (**)(HGaussianBlur *, void, void))(*(void *)v21 + 120))(v21, 0, *(void *)a3.var0);
  }
  void *v12 = v21;
  (*(void (**)(HGaussianBlur *))(*(void *)v21 + 16))(v21);
  v25 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v25);
  if (v20)
  {
    HGTransform::HGTransform((HGTransform *)v27);
    HGTransform::Scale((HGTransform *)v27, v18, v18, 1.0);
    (*(void (**)(HGXForm *, void, HGaussianBlur *))(*(void *)v25 + 120))(v25, 0, v21);
    (*(void (**)(HGXForm *, unsigned char *))(*(void *)v25 + 576))(v25, v27);
    if (v21 != (HGaussianBlur *)v25)
    {
      (*(void (**)(HGaussianBlur *))(*(void *)v21 + 24))(v21);
      void *v12 = v25;
      (*(void (**)(HGXForm *))(*(void *)v25 + 16))(v25);
    }
    HGTransform::~HGTransform((HGTransform *)v27);
  }
  else if (!v25)
  {
    goto LABEL_16;
  }
  (*(void (**)(HGXForm *))(*(void *)v25 + 24))(v25);
LABEL_16:
  v26.var0 = (HGNode *)(*(uint64_t (**)(HGaussianBlur *))(*(void *)v21 + 24))(v21);
  if (v17) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(void *)v17 + 24))(v17);
  }
  return v26;
}

- (HGRef<HGNode>)getBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7 is360:(BOOL)a8
{
  objc_super v10 = (long long *)a8;
  double v14 = self;
  int v15 = v9;
  uint64_t v16 = *(void *)a3.var0;
  if (!v8)
  {
    uint64_t v18 = *(void *)a3.var0;
    if (v16) {
      self = (PAEGlow *)(*(uint64_t (**)(uint64_t, SEL, double, PCVector2<double>, __n128))(*(void *)v16 + 16))(v16, a2, a6, a7, *(__n128 *)&a7.var1);
    }
    long long v17 = *v10;
    if (v14)
    {
      self = -[PAEGlow getPlanarBlurNode:withInputImage:outputImage:blurRadius:blurScale:](v14, "getPlanarBlurNode:withInputImage:outputImage:blurRadius:blurScale:", &v18, a4, a5, &v17, a6, a7.var0, a7.var1);
      uint64_t v16 = v18;
      if (!v18) {
        return (HGRef<HGNode>)self;
      }
    }
    else
    {
      *int v15 = 0;
      if (!v16) {
        return (HGRef<HGNode>)self;
      }
    }
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
  }
  uint64_t v20 = *(void *)a3.var0;
  if (v16) {
    self = (PAEGlow *)(*(uint64_t (**)(uint64_t, SEL, double, PCVector2<double>, __n128))(*(void *)v16 + 16))(v16, a2, a6, a7, *(__n128 *)&a7.var1);
  }
  long long v19 = *v10;
  if (v14)
  {
    self = -[PAEGlow get360BlurNode:withInputImage:outputImage:blurRadius:blurScale:](v14, "get360BlurNode:withInputImage:outputImage:blurRadius:blurScale:", &v20, a4, a5, &v19, a6, a7.var0, a7.var1);
    uint64_t v16 = v20;
    if (!v20) {
      return (HGRef<HGNode>)self;
    }
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
  }
  *int v15 = 0;
  if (v16) {
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
  }
  return (HGRef<HGNode>)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;
  if (!v10)
  {
    BOOL v12 = (void *)v9;
    uint64_t v18 = 0x3FE8000000000000;
    uint64_t v19 = 0x4024000000000000;
    uint64_t v17 = 0x3FC999999999999ALL;
    uint64_t v16 = 0x3FF8000000000000;
    __int16 v15 = 0;
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    [v8 getFloatValue:&v19 fromParm:1 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v18 fromParm:3 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v17 fromParm:4 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v16 fromParm:2 atFxTime:a5->var0.var1];
    [v8 getBoolValue:(char *)&v15 + 1 fromParm:5 atFxTime:a5->var0.var1];
    [v8 getBoolValue:&v15 fromParm:6 atFxTime:a5->var0.var1];
    if (a4) {
      [a4 heliumRef];
    }
    objc_msgSend((id)objc_msgSend(v12, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    double v13 = (HgcGlow *)HGObject::operator new(0x1A0uLL);
    HgcGlow::HgcGlow(v13);
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

@end