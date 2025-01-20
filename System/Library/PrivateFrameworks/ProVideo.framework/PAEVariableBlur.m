@interface PAEVariableBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)variesOverTime;
- (PAEVariableBlur)initWithAPIManager:(id)a3;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEVariableBlur

- (PAEVariableBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEVariableBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEVariableBlur;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:0];
  uint64_t v7 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"SupportsLargeRenderScale", v6, @"InputSizeLimit", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEVariableBlur;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"VariableBlur::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"VariableBlur::Amount", 0, 0), 2, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"VariableBlur::InnerRadius", 0, 0), 3, 0, 100.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"VariableBlur::OuterRadius", 0, 0), 4, 0, 400.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"VariableBlur::Crop", 0, 0), 5, 1, 1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (a3) {
    BOOL v11 = a4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (!v11)
  {
    v13 = v10;
    char v17 = 0;
    [v10 getBoolValue:&v17 fromParm:5 atFxTime:a6->var0.var1];
    double v16 = 0.0;
    double v14 = 0.0;
    if (!v17)
    {
      objc_msgSend(v13, "getFloatValue:fromParm:atFxTime:", &v16, 2, a6->var0.var1, 0.0);
      double v14 = v16 + v16;
    }
    *a3 = (unint64_t)(v14 + (double)a5->var0);
    *a4 = (unint64_t)(v14 + (double)a5->var1);
  }
  return v12;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  BOOL v13 = [v10 versionAtCreation] == 0;
  double v106 = 400.0;
  double v107 = 10.0;
  double v105 = 100.0;
  char v104 = 0;
  long long v103 = 0uLL;
  [v9 getXValue:&v103 YValue:(char *)&v103 + 8 fromParm:1 atFxTime:a5->var0.var1];
  [(PAESharedDefaultBase *)self convertRelativeToImageCoordinates:&v103 withImage:a4];
  long long v103 = *(_OWORD *)v95;
  [v9 getFloatValue:&v107 fromParm:2 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v106 fromParm:3 atFxTime:a5->var0.var1];
  [v9 getFloatValue:&v105 fromParm:4 atFxTime:a5->var0.var1];
  if (v13)
  {
    double v14 = v105;
    double v105 = v106;
    double v106 = v14;
  }
  [v9 getBoolValue:&v104 fromParm:5 atFxTime:a5->var0.var1];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
  double v15 = v95[0];
  double v16 = v98;
  uint64_t v17 = [a4 imageType];
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]) {
    BOOL v18 = v17 == 3;
  }
  else {
    BOOL v18 = 0;
  }
  BOOL v12 = v18;
  if (v18)
  {
    if (v107 <= 0.0)
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v107);
      }
      else {
        *(void *)&long long v108 = 0;
      }
      [a3 setHeliumRef:&v108];
      if ((void)v108) {
        (*(void (**)(void))(*(void *)v108 + 24))(v108);
      }
    }
    else
    {
      if (a4) {
        objc_msgSend(a4, "heliumRef", v107);
      }
      else {
        uint64_t v86 = 0;
      }
      if (v104)
      {
        uint64_t v85 = v86;
        if (v86) {
          (*(void (**)(uint64_t))(*(void *)v86 + 16))(v86);
        }
        [(PAESharedDefaultBase *)self smear:&v85 fromImage:a4 toImage:a4];
        uint64_t v19 = v108;
        if (v86 == (void)v108)
        {
          if (v86) {
            (*(void (**)(void))(*(void *)v86 + 24))();
          }
        }
        else
        {
          if (v86)
          {
            (*(void (**)(void))(*(void *)v86 + 24))();
            uint64_t v19 = v108;
          }
          uint64_t v86 = v19;
          *(void *)&long long v108 = 0;
        }
        if (v85) {
          (*(void (**)(uint64_t))(*(void *)v85 + 24))(v85);
        }
      }
      v20 = (HgcVariableBlurIntensity *)HGObject::operator new(0x1A0uLL);
      HgcVariableBlurIntensity::HgcVariableBlurIntensity(v20);
      float v21 = *(double *)&v103;
      float v22 = *((double *)&v103 + 1);
      (*(void (**)(HgcVariableBlurIntensity *, void, float, float, double, double))(*(void *)v20 + 96))(v20, 0, v21, v22, 0.0, 0.0);
      float v23 = 1.0 / (v105 - v106);
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, double, double, double))(*(void *)v20 + 96))(v20, 1, v23, 0.0, 0.0, 0.0);
      float v24 = v106;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, double, double, double))(*(void *)v20 + 96))(v20, 2, v24, 0.0, 0.0, 0.0);
      float v25 = v87;
      float v26 = v88;
      float v27 = v89;
      float v28 = v90;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(void *)v20 + 96))(v20, 3, v25, v26, v27, v28);
      float v29 = v91;
      float v30 = v92;
      float v31 = v93;
      float v32 = v94;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(void *)v20 + 96))(v20, 4, v29, v30, v31, v32);
      v33 = (HGModulatedBlur *)HGObject::operator new(0x1D0uLL);
      HGModulatedBlur::HGModulatedBlur(v33);
      v84 = v33;
      if (v33) {
        (*(void (**)(HGModulatedBlur *))(*(void *)v33 + 16))(v33);
      }
      (*(void (**)(HGModulatedBlur *, void, uint64_t))(*(void *)v33 + 120))(v33, 0, v86);
      (*(void (**)(HGModulatedBlur *, uint64_t, HgcVariableBlurIntensity *))(*(void *)v33 + 120))(v33, 1, v20);
      double v107 = v107 * 2.7;
      float v34 = v107;
      (*(void (**)(HGModulatedBlur *, void, float, double, double, double))(*(void *)v33 + 96))(v33, 0, v34, 0.0, 0.0, 0.0);
      float v35 = v15;
      float v36 = v16;
      float v37 = fabsf(v36);
      (*(void (**)(HGModulatedBlur *, uint64_t, float, float, double, double))(*(void *)v33 + 96))(v33, 1, v35, v37, 0.0, 0.0);
      long long v108 = xmmword_1B7E744D8;
      v109[0] = unk_1B7E744E8;
      *(_OWORD *)((char *)v109 + 12) = unk_1B7E744F4;
      double v38 = v107;
      float v40 = ceil(log2(v107)) + 1.0;
      if (v40 <= 0.0) {
        float v40 = 1.0;
      }
      LODWORD(v39) = vcvtms_s32_f32(v40);
      if ((int)v39 >= 2)
      {
        unint64_t v41 = v39 + 1;
        do
        {
          float v42 = v38;
          *((float *)&v109[-1] + (v41 - 2)) = v42;
          double v38 = v38 * 0.5;
          --v41;
        }
        while (v41 > 2);
      }
      HGModulatedBlur::setBlurValues(v33, (const float *)&v108, (unint64_t)v40);
      double v44 = v105;
      double v43 = v106;
      if (v106 <= v105)
      {
        float v74 = v37;
        float v75 = v35;
        long long v45 = v103;
        double v46 = v100;
        double v47 = v101;
        double v48 = v102;
        double v49 = v95[0];
        double v50 = v97;
        double v78 = v95[1];
        double v79 = v96;
        double v76 = v98;
        double v77 = v99;
        [(PAESharedDefaultBase *)self getImageBoundary:a3];
        float64x2_t v82 = vcvtq_f64_f32(v80);
        float64x2_t v83 = vcvtq_f64_f32(v81);
        PCMatrix44Tmpl<double>::transformRect<double>(v95, v82.f64, (uint64_t)&v82);
        double v43 = *((double *)&v45 + 1) - v44;
        double v51 = (*(double *)&v45 - v44) * v46;
        double v52 = (v44 + *((double *)&v45 + 1)) * v47;
        double v53 = (v44 + *((double *)&v45 + 1)) * v78;
        double v54 = (v79 + (*(double *)&v45 - v44) * v49 + v53) / (v48 + v51 + v52);
        double v55 = (v44 + *(double *)&v45) * v46;
        double v56 = v48 + v55 + v52;
        double v57 = (v44 + *(double *)&v45) * v49;
        double v58 = (v44 + *(double *)&v45) * v50;
        double v59 = (*((double *)&v45 + 1) - v44) * v47;
        double v60 = v48 + v55 + v59;
        double v61 = (*((double *)&v45 + 1) - v44) * v76;
        double v62 = (v77 + v58 + v61) / v60;
        double v63 = (v77 + (*(double *)&v45 - v44) * v50 + v61) / (v48 + v51 + v59);
        if (v82.f64[0] < v54 && v54 < v82.f64[0] + v83.f64[0]) {
          goto LABEL_53;
        }
        if ((double v64 = (v79 + v57 + v53) / v56, v82.f64[0] < v64) && v64 < v82.f64[0] + v83.f64[0]
          || v82.f64[1] < v63 && v63 < v82.f64[1] + v83.f64[1]
          || v82.f64[1] < v62 && v62 < v82.f64[1] + v83.f64[1])
        {
LABEL_53:
          uint64_t v65 = HGRectMake4i(vcvtmd_s64_f64(v54), vcvtmd_s64_f64(v63), vcvtpd_s64_f64(v54 + (v79 + v57 + v43 * v78) / v60 - v54), vcvtpd_s64_f64(v63 + (v77 + v58 + (v44 + *((double *)&v45 + 1)) * v76) / v56 - v62));
          uint64_t v67 = v66;
          v68 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v68);
          (*(void (**)(HGCrop *, void, HGModulatedBlur *))(*(void *)v68 + 120))(v68, 0, v33);
          (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v68 + 96))(v68, 0, (float)(int)v65, (float)SHIDWORD(v65), (float)(int)v67, (float)SHIDWORD(v67));
          v69 = v33;
          if (v33 != v68)
          {
            (*(void (**)(HGModulatedBlur *))(*(void *)v33 + 24))(v33);
            v84 = v68;
            v69 = v68;
            (*(void (**)(HGCrop *))(*(void *)v68 + 16))(v68);
          }
          v70 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
          HGaussianBlur::HGaussianBlur(v70);
          (*(void (**)(HGaussianBlur *, void, uint64_t))(*(void *)v70 + 120))(v70, 0, v86);
          float v71 = v107;
          HGaussianBlur::init(v70, v71, v75, v74, 0, 0, 0);
          v72 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
          HGOverwrite::HGOverwrite(v72);
          (*(void (**)(HGOverwrite *, uint64_t, HGOverwrite *))(*(void *)v72 + 120))(v72, 1, v69);
          (*(void (**)(HGOverwrite *, void, HGaussianBlur *))(*(void *)v72 + 120))(v72, 0, v70);
          if (v69 != v72)
          {
            (*(void (**)(HGOverwrite *))(*(void *)v69 + 24))(v69);
            v84 = v72;
            (*(void (**)(HGOverwrite *))(*(void *)v72 + 16))(v72);
          }
          (*(void (**)(HGOverwrite *))(*(void *)v72 + 24))(v72);
          (*(void (**)(HGaussianBlur *))(*(void *)v70 + 24))(v70);
          (*(void (**)(HGCrop *))(*(void *)v68 + 24))(v68);
        }
      }
      if (v104) {
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v84, a4, a3, v43);
      }
      objc_msgSend(a3, "setHeliumRef:", &v84, v43);
      if (v84) {
        (*(void (**)(HGModulatedBlur *))(*(void *)v84 + 24))(v84);
      }
      (*(void (**)(HGModulatedBlur *))(*(void *)v33 + 24))(v33);
      (*(void (**)(HgcVariableBlurIntensity *))(*(void *)v20 + 24))(v20);
      if (v86) {
        (*(void (**)(uint64_t))(*(void *)v86 + 24))(v86);
      }
    }
  }
  return v12;
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

- (BOOL)frameCleanup
{
  return 1;
}

@end