@interface PAEChannelBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEChannelBlur)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEChannelBlur

- (PAEChannelBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEChannelBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v8 = v7;
  __int16 v16 = 0;
  if (!v7
    || [v7 getBoolValue:(char *)&v16 + 1 fromParm:8 atFxTime:a3.var1]
    && ([v8 getBoolValue:&v16 fromParm:9 atFxTime:a3.var1] & 1) != 0)
  {
    double v15 = 0.0;
    BOOL v9 = 1;
    [v8 getFloatValue:&v15 fromParm:1 atFxTime:a3.var1];
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    if (HIBYTE(v16) | v16) {
      BOOL v9 = v15 == 0.0;
    }
    uint64_t v11 = [NSNumber numberWithBool:v9];
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"PositionIndependent", objc_msgSend(NSNumber, "numberWithBool:", (_BYTE)v16 == 0), @"SupportsLargeRenderScale", 0);
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
  v10.super_class = (Class)PAEChannelBlur;
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
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Amount", 0, 0), 1, 0, 4.0, 0.0, dbl_1B7E74400[v7], 0.0, 64.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Blur Red", 0, 0), 2, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Blur Green", 0, 0), 3, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Blur Blue", 0, 0), 4, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Blur Alpha", 0, 0), 5, 1, 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Horizontal", 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Vertical", 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Crop", 0, 0), 8, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"ChannelBlur::Equirect", 0, 0), 9, 0, 1);
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
    id v14 = v10;
    char v24 = 0;
    [v10 getBoolValue:&v24 fromParm:9 atFxTime:a6->var0.var1];
    if (v24)
    {
      *a3 = a5->var0;
      *a4 = a5->var1;
    }
    else
    {
      double v23 = 0.0;
      [v14 getFloatValue:&v23 fromParm:1 atFxTime:a6->var0.var1];
      double v23 = v23 * 0.5;
      double v22 = 0.0;
      [v14 getFloatValue:&v22 fromParm:6 atFxTime:a6->var0.var1];
      double v22 = v22 * 0.01;
      double v21 = 0.0;
      [v14 getFloatValue:&v21 fromParm:7 atFxTime:a6->var0.var1];
      double v21 = v21 * 0.01;
      char v20 = 0;
      [v14 getBoolValue:&v20 fromParm:8 atFxTime:a6->var0.var1];
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
  [(PAESharedDefaultBase *)self getScaleForImage:a4];
  double v14 = v58[1];
  double v15 = v58[2];
  v58[0] = 0.0;
  [v9 getFloatValue:v58 fromParm:1 atFxTime:a5->var0.var1];
  v58[0] = v58[0] * 0.5;
  double v57 = 0.0;
  [v9 getFloatValue:&v57 fromParm:6 atFxTime:a5->var0.var1];
  double v57 = v14 * (v57 * 0.01);
  double v56 = 0.0;
  [v9 getFloatValue:&v56 fromParm:7 atFxTime:a5->var0.var1];
  double v56 = v15 * (v56 * 0.01);
  char v55 = 0;
  [v9 getBoolValue:&v55 fromParm:2 atFxTime:a5->var0.var1];
  char v54 = 0;
  [v9 getBoolValue:&v54 fromParm:3 atFxTime:a5->var0.var1];
  char v53 = 0;
  [v9 getBoolValue:&v53 fromParm:4 atFxTime:a5->var0.var1];
  char v52 = 0;
  [v9 getBoolValue:&v52 fromParm:5 atFxTime:a5->var0.var1];
  unsigned __int8 v51 = 0;
  [v9 getBoolValue:&v51 fromParm:8 atFxTime:a5->var0.var1];
  unsigned __int8 v50 = 0;
  [v9 getBoolValue:&v50 fromParm:9 atFxTime:a5->var0.var1];
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v49 = 0;
  }
  if (v58[0] == 0.0)
  {
    objc_msgSend(a3, "setHeliumRef:", &v49, v58[0]);
  }
  else
  {
    if (v50)
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3, v58[0]);
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
      float v17 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v17);
      *(void *)float v17 = &unk_1F1094F88;
      *((void *)v17 + 51) = 0;
      *((void *)v17 + 52) = 0;
      *((_DWORD *)v17 + 106) = 0;
      *((void *)v17 + 54) = 0;
      *((void *)v17 + 55) = 0;
      double v18 = v57;
      double v19 = v58[0];
      double v20 = v56;
      unint64_t v21 = [a4 width];
      double v22 = v46[0].f64[0];
      unint64_t v23 = [a4 height];
      float v24 = v19;
      float v25 = v18;
      float v26 = v20;
      v45[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v46[0]), v46[1]);
      float32x4_t v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v48);
      float32x4_t v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v45[1] + 8)), *(float64x2_t *)((char *)&v45[2] + 8));
      float32x4_t v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v45[3] + 8)), *(float64x2_t *)((char *)&v45[4] + 8));
      HEquirectGaussianBlur::init((uint64_t)v17, vcvtpd_s64_f64(v22 * (double)v21), vcvtpd_s64_f64(vmuld_lane_f64((double)v23, v47, 1)), (float32x2_t *)v45, (float32x2_t *)&v44, (float32x2_t *)&v43, (float32x2_t *)&v42, v24, v25, v26);
      (*(void (**)(HGNode *, void, uint64_t))(*(void *)v17 + 120))(v17, 0, v49);
      (*(void (**)(HGNode *))(*(void *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(void *)v17 + 24))(v17);
    }
    else
    {
      float v17 = (HGNode *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v17);
      float v27 = v58[0];
      float v28 = v57;
      float v29 = v56;
      HGaussianBlur::init((HGaussianBlur *)v17, v27, v28, v29, v13 == 0, 0, 0);
      (*(void (**)(HGNode *, void, uint64_t))(*(void *)v17 + 120))(v17, 0, v49);
      (*(void (**)(HGNode *))(*(void *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(void *)v17 + 24))(v17);
    }
    if (v55) {
      float v30 = 1.0;
    }
    else {
      float v30 = 0.0;
    }
    if (v54) {
      float v31 = 1.0;
    }
    else {
      float v31 = 0.0;
    }
    if (v53) {
      float v32 = 1.0;
    }
    else {
      float v32 = 0.0;
    }
    if (v52) {
      float v33 = 1.0;
    }
    else {
      float v33 = 0.0;
    }
    v46[0].f64[0] = 0.0;
    if (v52)
    {
      v34 = (HgcChannelBlurNoPremult *)HGObject::operator new(0x1A0uLL);
      HgcChannelBlurNoPremult::HgcChannelBlurNoPremult(v34);
    }
    else
    {
      v34 = (HgcChannelBlurNoPremult *)HGObject::operator new(0x1A0uLL);
      HgcChannelBlur::HgcChannelBlur(v34);
    }
    if (v34) {
      *(void *)&v46[0].f64[0] = v34;
    }
    (*(void (**)(HgcChannelBlurNoPremult *, uint64_t, HGNode *))(*(void *)v34 + 120))(v34, 1, v17);
    (*(void (**)(HgcChannelBlurNoPremult *, void, float, float, float, float))(*(void *)v34 + 96))(v34, 0, v30, v31, v32, v33);
    (*(void (**)(HgcChannelBlurNoPremult *, void, uint64_t))(*(void *)v34 + 120))(v34, 0, v49);
    if (v51 | v50)
    {
      v35 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v35);
      int v36 = [a4 width];
      if (v36 >= 0) {
        int v37 = v36;
      }
      else {
        int v37 = v36 + 1;
      }
      int v38 = [a4 width];
      int v39 = [a4 height];
      if (v39 >= 0) {
        int v40 = v39;
      }
      else {
        int v40 = v39 + 1;
      }
      int v41 = [a4 height];
      (*(void (**)(HGCrop *, void, HgcChannelBlurNoPremult *))(*(void *)v35 + 120))(v35, 0, v34);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v35 + 96))(v35, 0, (float)-(v37 >> 1), (float)-(v40 >> 1), (float)(v38 - (v37 >> 1)), (float)(v41 - (v40 >> 1)));
      if (v34 != v35)
      {
        (*(void (**)(HgcChannelBlurNoPremult *))(*(void *)v34 + 24))(v34);
        *(void *)&v46[0].f64[0] = v35;
        (*(void (**)(HGCrop *))(*(void *)v35 + 16))(v35);
      }
      (*(void (**)(HGCrop *))(*(void *)v35 + 24))(v35);
    }
    [a3 setHeliumRef:v46];
    if (*(void *)&v46[0].f64[0]) {
      (*(void (**)(void))(**(void **)&v46[0].f64[0] + 24))(*(void *)&v46[0].f64[0]);
    }
    (*(void (**)(HGNode *))(*(void *)v17 + 24))(v17);
  }
  if (v49) {
    (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
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