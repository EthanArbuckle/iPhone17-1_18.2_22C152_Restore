@interface PAEGradientBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEGradientBlur)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEGradientBlur

- (PAEGradientBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGradientBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:0];
  uint64_t v7 = [NSNumber numberWithBool:0];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsHeliumRendering", v5, @"MayRemapTime", v6, @"SupportsLargeRenderScale", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v14 = 0.0;
  if (([v7 getFloatValue:&v14 fromParm:3 atFxTime:a3.var1] & 1) != 0
    && (char v13 = 0, ([v7 getBoolValue:&v13 fromParm:4 atFxTime:a3.var1] & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 3;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v9, v14), @"PixelTransformSupport", 0);
  }
  else if (a4)
  {
    v11 = (objc_class *)objc_opt_class();
    id v12 = [(PAEFilterDefaultBase *)self getParamErrorFor:NSStringFromClass(v11)];
    id result = 0;
    *a4 = v12;
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
  v6.super_class = (Class)PAEGradientBlur;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GradientBlur::Point 1", 0, 0), 1, 0, 0.0, 0.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GradientBlur::Point 2", 0, 0), 2, 0, 0.67, 0.67);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GradientBlur::Amount", 0, 0), 3, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"GradientBlur::Crop", 0, 0), 4, 1, 1);
  }
  return v3 != 0;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v10 && (v11 = v10, char v16 = 0, [v10 getBoolValue:&v16 fromParm:4 atFxTime:a6->var0.var1], !v16))
  {
    double v15 = 0.0;
    [v11 getFloatValue:&v15 fromParm:3 atFxTime:a6->var0.var1];
    double v13 = v15 + v15;
    *a3 = (unint64_t)(v15 + v15 + (double)a5->var0);
    unint64_t var1 = (unint64_t)(v13 + (double)a5->var1);
  }
  else
  {
    *a3 = a5->var0;
    unint64_t var1 = a5->var1;
  }
  *a4 = var1;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    v10 = v9;
    double v51 = 10.0;
    char v50 = 1;
    [v9 getFloatValue:&v51 fromParm:3 atFxTime:a5->var0.var1];
    if (v51 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v51);
      }
      else {
        v47[0] = 0;
      }
      [a3 setHeliumRef:v47];
      if (v47[0]) {
        (*(void (**)(void))(*(void *)v47[0] + 24))(v47[0]);
      }
LABEL_18:
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    int64x2_t v49 = 0uLL;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v49, &v49.u64[1], 1, a5->var0.var1, v51);
    int64x2_t v48 = vdupq_n_s64(0x3FE570A3D70A3D71uLL);
    [v10 getXValue:&v48 YValue:&v48.u64[1] fromParm:2 atFxTime:a5->var0.var1];
    [v10 getBoolValue:&v50 fromParm:4 atFxTime:a5->var0.var1];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    double v11 = *(double *)v47;
    double v12 = *(double *)&v47[5];
    [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v49 withImage:a3];
    int64x2_t v49 = v54;
    [(PAESharedDefaultBase *)self convertRelativeToPixelCoordinates:&v48 withImage:a3];
    int64x2_t v48 = v54;
    if (v51 == 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v51);
      }
      else {
        v54.i64[0] = 0;
      }
      [a3 setHeliumRef:&v54];
      if (v54.i64[0]) {
        (*(void (**)(uint64_t))(*(void *)v54.i64[0] + 24))(v54.i64[0]);
      }
      goto LABEL_18;
    }
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1, v51);
    if (v9)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          v46 = 0;
        }
        if (v50)
        {
          v45 = v46;
          if (v46) {
            (*(void (**)(HGNode *))(*(void *)v46 + 16))(v46);
          }
          [(PAESharedDefaultBase *)self smear:&v45 fromImage:a4 toImage:a4];
          double v13 = (HGNode *)v54.i64[0];
          if (v46 == (HGNode *)v54.i64[0])
          {
            if (v46) {
              (*(void (**)(void))(*(void *)v46 + 24))();
            }
          }
          else
          {
            if (v46)
            {
              (*(void (**)(void))(*(void *)v46 + 24))();
              double v13 = (HGNode *)v54.i64[0];
            }
            v46 = v13;
            v54.i64[0] = 0;
          }
          if (v45) {
            (*(void (**)(HGNode *))(*(void *)v45 + 24))(v45);
          }
        }
        int64x2_t v14 = v49;
        int64x2_t v15 = v48;
        char v16 = (HgcGradientBlur2 *)HGObject::operator new(0x1A0uLL);
        HgcGradientBlur2::HgcGradientBlur2(v16);
        double v17 = 1.0
            / sqrt((*(double *)v14.i64 - *(double *)v15.i64) * (*(double *)v14.i64 - *(double *)v15.i64)+ (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]) * (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]));
        double v18 = (*(double *)v14.i64 - *(double *)v15.i64) * v17;
        double v19 = (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]) * v17;
        float v20 = v18;
        float v21 = v19;
        *(float *)&double v18 = *(double *)v15.i64 * v18 + *(double *)&v15.i64[1] * v19;
        float v22 = -*(float *)&v18;
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, double, float))(*(void *)v16 + 96))(v16, 1, v20, v21, 0.0, -*(float *)&v18);
        *(float *)&double v17 = v17;
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, double, double, double))(*(void *)v16 + 96))(v16, 2, *(float *)&v17, 0.0, 0.0, 0.0);
        v23 = (HgcGradientBlur2 *)HGObject::operator new(0x1A0uLL);
        HgcGradientBlur2::HgcGradientBlur2(v23);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, double, float))(*(void *)v23 + 96))(v23, 1, v20, v21, 0.0, v22);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, double, double, double))(*(void *)v23 + 96))(v23, 2, *(float *)&v17, 0.0, 0.0, 0.0);
        uint64_t v24 = 0;
        double v51 = v51 * 2.7;
        float v27 = v51 / 7.0;
        int32x4_t v28 = (int32x4_t)xmmword_1B7E74440;
        v29.i64[0] = 0x400000004;
        v29.i64[1] = 0x400000004;
        do
        {
          float32x4_t v30 = vmulq_n_f32(vcvtq_f32_s32(v28), v27);
          float v25 = v11;
          *(float32x4_t *)((char *)&v54 + v24 * 4) = vmulq_n_f32(v30, v25);
          float v26 = v12;
          *(float32x4_t *)&v52[v24] = vmulq_n_f32(v30, v26);
          int32x4_t v28 = vaddq_s32(v28, v29);
          v24 += 4;
        }
        while (v24 != 8);
        v31 = v46;
        v32 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
        HGBlurGroup::HGBlurGroup(v32, v31, 0);
        HGBlurGroup::setBlurValues(v32, (const float *)v54.i32, v52, 5);
        (*(void (**)(HgcGradientBlur2 *, void, double, double, double, double))(*(void *)v16 + 96))(v16, 0, 0.0, 0.0, 0.0, 0.0);
        uint64_t v33 = HGBlurGroup::level(v32, 0);
        (*(void (**)(HgcGradientBlur2 *, void, uint64_t))(*(void *)v16 + 120))(v16, 0, v33);
        uint64_t v34 = HGBlurGroup::level(v32, 1u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v16 + 120))(v16, 1, v34);
        uint64_t v35 = HGBlurGroup::level(v32, 2u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v16 + 120))(v16, 2, v35);
        uint64_t v36 = HGBlurGroup::level(v32, 3u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v16 + 120))(v16, 3, v36);
        uint64_t v37 = HGBlurGroup::level(v32, 4u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v16 + 120))(v16, 4, v37);
        if (v32) {
          (*(void (**)(HGBlurGroup *))(*(void *)v32 + 24))(v32);
        }
        v38 = v46;
        v39 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
        HGBlurGroup::HGBlurGroup(v39, v38, 0);
        HGBlurGroup::setBlurValues(v39, &v55, &v53, 4);
        (*(void (**)(HgcGradientBlur2 *, void, float, double, double, double))(*(void *)v23 + 96))(v23, 0, 1.0, 0.0, 0.0, 0.0);
        (*(void (**)(HgcGradientBlur2 *, void, HgcGradientBlur2 *))(*(void *)v23 + 120))(v23, 0, v16);
        uint64_t v40 = HGBlurGroup::level(v39, 0);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v23 + 120))(v23, 1, v40);
        uint64_t v41 = HGBlurGroup::level(v39, 1u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v23 + 120))(v23, 2, v41);
        uint64_t v42 = HGBlurGroup::level(v39, 2u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v23 + 120))(v23, 3, v42);
        uint64_t v43 = HGBlurGroup::level(v39, 3u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(void *)v23 + 120))(v23, 4, v43);
        if (v39) {
          (*(void (**)(HGBlurGroup *))(*(void *)v39 + 24))(v39);
        }
        v54.i64[0] = (uint64_t)v23;
        (*(void (**)(HgcGradientBlur2 *))(*(void *)v23 + 16))(v23);
        if (v50) {
          [(PAESharedDefaultBase *)self crop:&v54 fromImage:a4 toImage:a3];
        }
        objc_msgSend(a3, "setHeliumRef:", &v54, v45);
        if (v54.i64[0]) {
          (*(void (**)(uint64_t))(*(void *)v54.i64[0] + 24))(v54.i64[0]);
        }
        (*(void (**)(HgcGradientBlur2 *))(*(void *)v23 + 24))(v23);
        (*(void (**)(HgcGradientBlur2 *))(*(void *)v16 + 24))(v16);
        if (v46) {
          (*(void (**)(HGNode *))(*(void *)v46 + 24))(v46);
        }
        goto LABEL_18;
      }
      LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
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