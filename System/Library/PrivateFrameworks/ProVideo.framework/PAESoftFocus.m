@interface PAESoftFocus
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAESoftFocus)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAESoftFocus

- (PAESoftFocus)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESoftFocus;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  __int16 v15 = 0;
  if (!v7)
  {
    BOOL v9 = 1;
    goto LABEL_8;
  }
  v8 = v7;
  if ([v7 getBoolValue:(char *)&v15 + 1 fromParm:5 atFxTime:a3.var1]
    && [v8 getBoolValue:&v15 fromParm:6 atFxTime:a3.var1])
  {
    BOOL v9 = (HIBYTE(v15) | v15) == 0;
LABEL_8:
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = [NSNumber numberWithBool:v9];
    return (id)objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"PositionIndependent", objc_msgSend(NSNumber, "numberWithBool:", (_BYTE)v15 == 0), @"SupportsLargeRenderScale", 0);
  }
  if (!a4) {
    return 0;
  }
  v10 = (objc_class *)objc_opt_class();
  id v11 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v10)];
  id result = 0;
  *a4 = v11;
  return result;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAESoftFocus;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
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
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Amount", 0, 0), 1, 0, 2.0, 0.0, dbl_1B7E744C0[v7], 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Strength", 0, 0), 2, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Horizontal", 0, 0), 3, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Vertical", 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Crop", 0, 0), 5, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"SoftFocus::Equirect", 0, 0), 6, 0, 1);
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
    uint64_t v14 = v10;
    char v24 = 0;
    [v10 getBoolValue:&v24 fromParm:6 atFxTime:a6->var0.var1];
    if (v24)
    {
      *a3 = a5->var0;
      *a4 = a5->var1;
    }
    else
    {
      double v23 = 0.0;
      [v14 getFloatValue:&v23 fromParm:1 atFxTime:a6->var0.var1];
      double v22 = 0.0;
      [v14 getFloatValue:&v22 fromParm:3 atFxTime:a6->var0.var1];
      double v22 = v22 * 0.01;
      double v21 = 0.0;
      [v14 getFloatValue:&v21 fromParm:4 atFxTime:a6->var0.var1];
      double v21 = v21 * 0.01;
      char v20 = 0;
      [v14 getBoolValue:&v20 fromParm:5 atFxTime:a6->var0.var1];
      int64x2_t v15 = *(int64x2_t *)&a5->var0;
      if (!v20)
      {
        v16.f64[0] = v22;
        float v17 = v23 + v23;
        v16.f64[1] = v21;
        int32x2_t v18 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v16, v17))));
        int64x2_t v15 = vaddw_s32(v15, vadd_s32(v18, v18));
      }
      *a3 = v15.i64[0];
      *a4 = v15.u64[1];
    }
  }
  return v13 ^ 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
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
  BOOL v12 = (void *)v10;
  if ([a4 imageType] != 3) {
    return 0;
  }
  int v13 = [v12 versionAtCreation];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  double v14 = v67[1];
  double v15 = v67[6];
  v67[0] = 0.0;
  [v9 getFloatValue:v67 fromParm:1 atFxTime:a5->var0.var1];
  v67[0] = v67[0] * 0.5;
  double v66 = 0.0;
  [v9 getFloatValue:&v66 fromParm:3 atFxTime:a5->var0.var1];
  double v66 = v14 * (v66 * 0.01);
  double v65 = 0.0;
  [v9 getFloatValue:&v65 fromParm:4 atFxTime:a5->var0.var1];
  double v65 = fabs(v15) * (v65 * 0.01);
  double v64 = 0.0;
  [v9 getFloatValue:&v64 fromParm:2 atFxTime:a5->var0.var1];
  char v63 = 0;
  [v9 getBoolValue:&v63 fromParm:5 atFxTime:a5->var0.var1];
  char v62 = 0;
  [v9 getBoolValue:&v62 fromParm:6 atFxTime:a5->var0.var1];
  v63 &= v62 ^ 1;
  if (!a4)
  {
    v61 = 0;
    if (v62) {
      goto LABEL_8;
    }
LABEL_13:
    if (v63)
    {
      if (!v13)
      {
        v33 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v33);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v33, 0, v34);
        v68[0] = 0uLL;
        HGTextureWrap::SetTextureBorderColor(v33, (float *)v68);
        (*(void (**)(HGTextureWrap *, void, HGNode *))(*(void *)v33 + 120))(v33, 0, v61);
        v35 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v35);
        [(PAESharedDefaultBase *)self getImageBoundary:a4];
        uint64_t v36 = HGRectMake4i((int)*(float *)v60[0].f64, (int)*((float *)v60[0].f64 + 1), (int)*(float *)&v60[0].f64[1] + (int)*(float *)v60[0].f64, (int)*((float *)&v60[0].f64[1] + 1) + (int)*((float *)v60[0].f64 + 1));
        (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v35 + 96))(v35, 0, (float)(int)v36, (float)SHIDWORD(v36), (float)(v37 + 1), (float)(int)((unint64_t)(v37 + 0x100000000) >> 32));
        (*(void (**)(HGCrop *, void, HGTextureWrap *))(*(void *)v35 + 120))(v35, 0, v33);
        if (v61 != (HGNode *)v35)
        {
          if (v61) {
            (*(void (**)(void))(*(void *)v61 + 24))();
          }
          v61 = (HGNode *)v35;
          (*(void (**)(HGCrop *))(*(void *)v35 + 16))(v35);
        }
        (*(void (**)(HGCrop *))(*(void *)v35 + 24))(v35);
        (*(void (**)(HGTextureWrap *))(*(void *)v33 + 24))(v33);
      }
      v53 = v61;
      if (v61) {
        (*(void (**)(HGNode *))(*(void *)v61 + 16))(v61);
      }
      [(PAESharedDefaultBase *)self smear:&v53 fromImage:a4 toImage:a4];
      float64_t v38 = v68[0].f64[0];
      if (v61 == *(HGNode **)&v68[0].f64[0])
      {
        if (v61) {
          (*(void (**)(void))(*(void *)v61 + 24))();
        }
      }
      else
      {
        if (v61)
        {
          (*(void (**)(void))(*(void *)v61 + 24))();
          float64_t v38 = v68[0].f64[0];
        }
        v61 = *(HGNode **)&v38;
        v68[0].f64[0] = 0.0;
      }
      if (v53) {
        (*(void (**)(HGNode *))(*(void *)v53 + 24))(v53);
      }
    }
    v39 = (HSoftFocus *)HGObject::operator new(0x1B0uLL);
    HSoftFocus::HSoftFocus(v39);
    float v40 = v67[0];
    float v41 = v64;
    float v42 = v66;
    float v43 = v65;
    HSoftFocus::init(v39, v40, v41, v42, v43, v13 == 0);
    (*(void (**)(HSoftFocus *, void, HGNode *))(*(void *)v39 + 120))(v39, 0, v61);
    if (v63)
    {
      v44 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v44);
      (*(void (**)(HGCrop *, void, HSoftFocus *))(*(void *)v44 + 120))(v44, 0, v39);
      unint64_t v45 = [a4 width];
      unint64_t v46 = [a4 height];
      unint64_t v47 = [a4 width];
      unint64_t v48 = [a4 height];
      float v49 = (double)v45 * -0.5;
      float v50 = (double)v46 * -0.5;
      float v51 = (double)v47 * 0.5;
      float v52 = (double)v48 * 0.5;
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v44 + 96))(v44, 0, v49, v50, v51, v52);
      *(void *)&v68[0].f64[0] = v44;
      (*(void (**)(HGCrop *))(*(void *)v44 + 16))(v44);
      [a3 setHeliumRef:v68];
      if (*(void *)&v68[0].f64[0]) {
        (*(void (**)(void))(**(void **)&v68[0].f64[0] + 24))(*(void *)&v68[0].f64[0]);
      }
      (*(void (**)(HGCrop *))(*(void *)v44 + 24))(v44);
    }
    else
    {
      *(void *)&v68[0].f64[0] = v39;
      (*(void (**)(HSoftFocus *))(*(void *)v39 + 16))(v39);
      [a3 setHeliumRef:v68];
      if (*(void *)&v68[0].f64[0]) {
        (*(void (**)(void))(**(void **)&v68[0].f64[0] + 24))(*(void *)&v68[0].f64[0]);
      }
    }
    (*(void (**)(HSoftFocus *))(*(void *)v39 + 24))(v39);
    goto LABEL_37;
  }
  [a4 heliumRef];
  if (!v62) {
    goto LABEL_13;
  }
LABEL_8:
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
  float64x2_t v16 = (HGNode *)HGObject::operator new(0x1C0uLL);
  HGNode::HGNode(v16);
  *(void *)float64x2_t v16 = &unk_1F1094F88;
  *((void *)v16 + 51) = 0;
  *((void *)v16 + 52) = 0;
  *((_DWORD *)v16 + 106) = 0;
  *((void *)v16 + 54) = 0;
  *((void *)v16 + 55) = 0;
  off_1F1095000(v16, 0, v61);
  unint64_t v17 = [a4 width];
  double v18 = v68[0].f64[0];
  unint64_t v19 = [a4 height];
  double v20 = ceil(fabs(v18) * (double)v17);
  float v21 = v67[0];
  float v22 = v66;
  float v23 = v65;
  float32x4_t v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68[0]), v68[1]);
  double v24 = fabs(v69.f64[1]) * (double)v19;
  float32x4_t v59 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v69), v70);
  float32x4_t v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v60[0]), v60[1]);
  float32x4_t v57 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v60[2]), v60[3]);
  HEquirectGaussianBlur::init((uint64_t)v16, (int)v20, vcvtpd_s64_f64(v24), (float32x2_t *)&v54, (float32x2_t *)&v59, (float32x2_t *)&v58, (float32x2_t *)&v57, v21, v22, v23);
  v25 = (HGLegacyBlend *)HGObject::operator new(0x1C0uLL);
  HGLegacyBlend::HGLegacyBlend(v25);
  (*(void (**)(HGLegacyBlend *, void, float, double, double, double))(*(void *)v25 + 96))(v25, 0, 8.0, 0.0, 0.0, 0.0);
  float v26 = v64;
  (*(void (**)(HGLegacyBlend *, uint64_t, float, double, double, double))(*(void *)v25 + 96))(v25, 1, v26, 0.0, 0.0, 0.0);
  (*(void (**)(HGLegacyBlend *, uint64_t, HGNode *))(*(void *)v25 + 120))(v25, 1, v16);
  (*(void (**)(HGLegacyBlend *, void, HGNode *))(*(void *)v25 + 120))(v25, 0, v61);
  double v27 = ceil(v24);
  *(double *)v54.i64 = v20 * -0.5;
  *(double *)&v54.i64[1] = v27 * -0.5;
  double v55 = v20;
  double v56 = v27;
  PCMatrix44Tmpl<double>::transformRect<double>(v60[0].f64, (double *)v54.i64, (uint64_t)&v54);
  uint64_t v28 = HGRectMake4i(vcvtmd_s64_f64(*(double *)v54.i64), vcvtmd_s64_f64(*(double *)&v54.i64[1]), vcvtpd_s64_f64(*(double *)v54.i64 + v55), vcvtpd_s64_f64(*(double *)&v54.i64[1] + v56));
  uint64_t v30 = v29;
  v31 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v31);
  (*(void (**)(HGCrop *, void, HGLegacyBlend *))(*(void *)v31 + 120))(v31, 0, v25);
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v31 + 96))(v31, 0, (float)(int)v28, (float)SHIDWORD(v28), (float)(int)v30, (float)SHIDWORD(v30));
  v59.i64[0] = (uint64_t)v31;
  (*(void (**)(HGCrop *))(*(void *)v31 + 16))(v31);
  [a3 setHeliumRef:&v59];
  if (v59.i64[0]) {
    (*(void (**)(uint64_t))(*(void *)v59.i64[0] + 24))(v59.i64[0]);
  }
  (*(void (**)(HGCrop *))(*(void *)v31 + 24))(v31);
  (*(void (**)(HGLegacyBlend *))(*(void *)v25 + 24))(v25);
  (*(void (**)(HGNode *))(*(void *)v16 + 24))(v16);
LABEL_37:
  if (v61) {
    (*(void (**)(HGNode *))(*(void *)v61 + 24))(v61);
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