@interface PAECircleBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAECircleBlur)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAECircleBlur

- (PAECircleBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAECircleBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"InputSizeLimit", v8, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAECircleBlur;
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
    unsigned int v7 = [v4 versionAtCreation];
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"CircleBlur::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"CircleBlur::Blur Amount", 0, 0), 2, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"CircleBlur::Circle Radius", 0, 0), 3, 0, 400.0, 0.0, dbl_1B7E74420[v7 < 3], 0.0, dbl_1B7E74430[v7 < 3], 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"CircleBlur::Crop", 0, 0), 4, 1, 1);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  BOOL v6 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      self = (PAECircleBlur *)[(PROAPIAccessing *)v6->super.super._apiManager apiForProtocol:&unk_1F121D130];
      if (self)
      {
        v11 = self;
        char v15 = 0;
        [(PAECircleBlur *)self getBoolValue:&v15 fromParm:4 atFxTime:a6->var0.var1];
        double v14 = 0.0;
        double v12 = 0.0;
        if (!v15)
        {
          -[PAECircleBlur getFloatValue:fromParm:atFxTime:](v11, "getFloatValue:fromParm:atFxTime:", &v14, 2, a6->var0.var1, 0.0);
          double v12 = v14 * 1.8 + v14 * 1.8;
        }
        *a3 = (unint64_t)(v12 + (double)a5->var0);
        *a4 = (unint64_t)(v12 + (double)a5->var1);
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  unsigned int v13 = [v10 versionAtCreation];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  if (!v13)
  {
    v88.f64[0] = 1.0;
    *((void *)&v90 + 1) = 0x3FF0000000000000;
  }
  double v78 = 400.0;
  double v79 = 10.0;
  char v77 = 1;
  long long v76 = 0uLL;
  [v9 getXValue:&v76 YValue:(char *)&v76 + 8 fromParm:1 atFxTime:a5->var0.var1];
  if (v13 >= 2) {
    id v14 = a4;
  }
  else {
    id v14 = a3;
  }
  [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v76 withImage:v14];
  long long v76 = v75[0];
  [v9 getFloatValue:&v79 fromParm:2 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v78 fromParm:3 atFxTime:a5->var0.var1];
  [v9 getBoolValue:&v77 fromParm:4 atFxTime:a5->var0.var1];
  int v15 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  uint64_t v16 = [a4 imageType];
  v75[5] = v85;
  v75[6] = v86;
  v75[7] = v87;
  v75[1] = v81;
  v75[2] = v82;
  v75[3] = v83;
  v75[4] = v84;
  long long v71 = v92;
  long long v72 = v93;
  long long v73 = v94;
  long long v74 = v95;
  v75[0] = v80;
  float64x2_t v67 = v88;
  long long v68 = v89;
  long long v69 = v90;
  long long v70 = v91;
  PCMatrix44Tmpl<double>::rightTranslate((double *)v75, *(double *)&v76, *((double *)&v76 + 1), 0.0);
  v17.f64[0] = -*(double *)&v76;
  PCMatrix44Tmpl<double>::leftTranslate(&v67, v17, -*((double *)&v76 + 1), 0.0);
  if (v15) {
    BOOL v18 = v16 == 3;
  }
  else {
    BOOL v18 = 0;
  }
  BOOL v12 = v18;
  if (v18)
  {
    if (v79 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v79);
      }
      else {
        v98[0] = 0;
      }
      [a3 setHeliumRef:v98];
      if (v98[0]) {
        (*(void (**)(void))(*(void *)v98[0] + 24))(v98[0]);
      }
    }
    else
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v79);
      }
      else {
        v66 = 0;
      }
      if (v77)
      {
        v65 = v66;
        if (v66) {
          (*(void (**)(HGNode *))(*(void *)v66 + 16))(v66);
        }
        [(PAESharedDefaultBase *)self smear:&v65 fromImage:a4 toImage:a4];
        v19 = (HGNode *)v98[0];
        if (v66 == (HGNode *)v98[0])
        {
          if (v66) {
            (*(void (**)(void))(*(void *)v66 + 24))();
          }
        }
        else
        {
          if (v66)
          {
            (*(void (**)(void))(*(void *)v66 + 24))();
            v19 = (HGNode *)v98[0];
          }
          v66 = v19;
          v98[0] = 0;
        }
        if (v65) {
          (*(void (**)(HGNode *))(*(void *)v65 + 24))(v65);
        }
      }
      unint64_t v20 = 0;
      double v21 = v79 * 2.7;
      float64x2_t v22 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v67.f64[0], 0);
      float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(fabs(*((double *)&v69 + 1))), 0);
      float v24 = v79 * 2.7 / 7.0;
      int32x4_t v25 = (int32x4_t)xmmword_1B7E74440;
      v26.i64[0] = 0x400000004;
      v26.i64[1] = 0x400000004;
      do
      {
        float32x4_t v27 = vmulq_n_f32(vcvtq_f32_s32(v25), v24);
        float64x2_t v28 = vcvtq_f64_f32(*(float32x2_t *)v27.f32);
        float64x2_t v29 = vcvt_hight_f64_f32(v27);
        *(float32x4_t *)&v98[v20 / 2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v28, v22)), vdivq_f64(v29, v22));
        *(float32x4_t *)&v96[v20] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v28, v23)), vdivq_f64(v29, v23));
        int32x4_t v25 = vaddq_s32(v25, v26);
        v20 += 4;
      }
      while (v20 != 8);
      double v79 = v21 * 7.0 / 100.0;
      v30 = (HgcCircleBlur2 *)HGObject::operator new(0x1A0uLL);
      HgcCircleBlur2::HgcCircleBlur2(v30);
      v31 = (HgcCircleBlur2 *)HGObject::operator new(0x1A0uLL);
      HgcCircleBlur2::HgcCircleBlur2(v31);
      float v32 = 1.0 / v78;
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, double, double, double))(*(void *)v30 + 96))(v30, 1, v32, 0.0, 0.0, 0.0);
      float v33 = 1.0 / v78;
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, double, double, double))(*(void *)v31 + 96))(v31, 1, v33, 0.0, 0.0, 0.0);
      float v34 = v67.f64[0];
      float v35 = v67.f64[1];
      float v36 = *(double *)&v68;
      float v37 = *((double *)&v68 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(void *)v30 + 96))(v30, 2, v34, v35, v36, v37);
      float v38 = v67.f64[0];
      float v39 = v67.f64[1];
      float v40 = *(double *)&v68;
      float v41 = *((double *)&v68 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(void *)v31 + 96))(v31, 2, v38, v39, v40, v41);
      float v42 = *(double *)&v69;
      float v43 = *((double *)&v69 + 1);
      float v44 = *(double *)&v70;
      float v45 = *((double *)&v70 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(void *)v30 + 96))(v30, 3, v42, v43, v44, v45);
      float v46 = *(double *)&v69;
      float v47 = *((double *)&v69 + 1);
      float v48 = *(double *)&v70;
      float v49 = *((double *)&v70 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(void *)v31 + 96))(v31, 3, v46, v47, v48, v49);
      v50 = v66;
      v51 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
      HGBlurGroup::HGBlurGroup(v51, v50, 0);
      HGBlurGroup::setBlurValues(v51, (const float *)v98, v96, 5);
      (*(void (**)(HgcCircleBlur2 *, void, double, double, double, double))(*(void *)v30 + 96))(v30, 0, 0.0, 0.0, 0.0, 0.0);
      uint64_t v52 = HGBlurGroup::level(v51, 0);
      (*(void (**)(HgcCircleBlur2 *, void, uint64_t))(*(void *)v30 + 120))(v30, 0, v52);
      uint64_t v53 = HGBlurGroup::level(v51, 1u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v30 + 120))(v30, 1, v53);
      uint64_t v54 = HGBlurGroup::level(v51, 2u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v30 + 120))(v30, 2, v54);
      uint64_t v55 = HGBlurGroup::level(v51, 3u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v30 + 120))(v30, 3, v55);
      uint64_t v56 = HGBlurGroup::level(v51, 4u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v30 + 120))(v30, 4, v56);
      if (v51) {
        (*(void (**)(HGBlurGroup *))(*(void *)v51 + 24))(v51);
      }
      v57 = v66;
      v58 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
      HGBlurGroup::HGBlurGroup(v58, v57, 0);
      HGBlurGroup::setBlurValues(v58, &v99, &v97, 4);
      (*(void (**)(HgcCircleBlur2 *, void, float, double, double, double))(*(void *)v31 + 96))(v31, 0, 1.0, 0.0, 0.0, 0.0);
      (*(void (**)(HgcCircleBlur2 *, void, HgcCircleBlur2 *))(*(void *)v31 + 120))(v31, 0, v30);
      uint64_t v59 = HGBlurGroup::level(v58, 0);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v31 + 120))(v31, 1, v59);
      uint64_t v60 = HGBlurGroup::level(v58, 1u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v31 + 120))(v31, 2, v60);
      uint64_t v61 = HGBlurGroup::level(v58, 2u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v31 + 120))(v31, 3, v61);
      uint64_t v62 = HGBlurGroup::level(v58, 3u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(void *)v31 + 120))(v31, 4, v62);
      if (v58) {
        (*(void (**)(HGBlurGroup *))(*(void *)v58 + 24))(v58);
      }
      v64 = v31;
      (*(void (**)(HgcCircleBlur2 *))(*(void *)v31 + 16))(v31);
      if (v77) {
        [(PAESharedDefaultBase *)self crop:&v64 fromImage:a4 toImage:a3];
      }
      [a3 setHeliumRef:&v64];
      if (v64) {
        (*(void (**)(HgcCircleBlur2 *))(*(void *)v64 + 24))(v64);
      }
      (*(void (**)(HgcCircleBlur2 *))(*(void *)v31 + 24))(v31);
      (*(void (**)(HgcCircleBlur2 *))(*(void *)v30 + 24))(v30);
      if (v66) {
        (*(void (**)(HGNode *))(*(void *)v66 + 24))(v66);
      }
    }
  }
  return v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 1;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end