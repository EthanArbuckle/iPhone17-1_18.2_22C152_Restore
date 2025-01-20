@interface PAEUnsharpMask
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEUnsharpMask)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAEUnsharpMask

- (PAEUnsharpMask)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEUnsharpMask;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v15 = 0.0;
  char v14 = 0;
  if ([v7 getFloatValue:&v15 fromParm:2 atFxTime:a3.var1]
    && ([v7 getBoolValue:&v14 fromParm:6 atFxTime:a3.var1] & 1) != 0)
  {
    if (v15 == 0.0) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 1;
    }
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, v15);
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithBool:", v14 == 0), @"SupportsLargeRenderScale", 0);
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
  v6.receiver = self;
  v6.super_class = (Class)PAEUnsharpMask;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Radius", 0, 0), 1, 0, 7.0, 0.0, 32.0, 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Amount", 0, 0), 2, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Threshold", 0, 0), 3, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Horizontal", 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Vertical", 0, 0), 5, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Unsharpmask::Equirect", 0, 0), 6, 0, 1);
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
  double v70 = 0.0;
  [v9 getFloatValue:&v70 fromParm:2 atFxTime:a5->var0.var1];
  if (v70 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v70);
    }
    else {
      v57[0] = 0;
    }
    [a3 setHeliumRef:v57];
    if (v57[0]) {
      (*(void (**)(void))(**(void **)v57 + 24))(*(void *)v57);
    }
  }
  else
  {
    int v14 = objc_msgSend(v12, "versionAtCreation", v70);
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v15 = v68;
    double v16 = v69;
    if (v68 <= v69) {
      double v17 = v69;
    }
    else {
      double v17 = v68;
    }
    double v67 = 0.0;
    [v9 getFloatValue:&v67 fromParm:1 atFxTime:a5->var0.var1];
    double v67 = v17 * v67;
    double v66 = 0.0;
    [v9 getFloatValue:&v66 fromParm:3 atFxTime:a5->var0.var1];
    double v65 = 0.0;
    [v9 getFloatValue:&v65 fromParm:4 atFxTime:a5->var0.var1];
    double v18 = v15 / v17;
    double v65 = v18 * (v65 * 0.01);
    double v64 = 0.0;
    [v9 getFloatValue:&v64 fromParm:5 atFxTime:a5->var0.var1];
    double v19 = v16 / v17;
    double v64 = v19 * (v64 * 0.01);
    char v63 = 0;
    [v9 getBoolValue:&v63 fromParm:6 atFxTime:a5->var0.var1];
    if (a4)
    {
      [a4 heliumRef];
      uint64_t v60 = v62;
      if (v62) {
        (*(void (**)(uint64_t))(*(void *)v62 + 16))(v62);
      }
    }
    else
    {
      uint64_t v62 = 0;
      uint64_t v60 = 0;
    }
    [(PAESharedDefaultBase *)self smear:&v60 fromImage:a4 toImage:a4];
    if (v60) {
      (*(void (**)(uint64_t))(*(void *)v60 + 24))(v60);
    }
    if (v63)
    {
      v20 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v20);
      *(void *)v20 = &unk_1F1094F88;
      *((void *)v20 + 51) = 0;
      *((void *)v20 + 52) = 0;
      *((_DWORD *)v20 + 106) = 0;
      *((void *)v20 + 54) = 0;
      *((void *)v20 + 55) = 0;
      double v21 = v67;
      double v22 = v68;
      double v23 = v64;
      double v24 = v65;
      double v25 = v69;
      int v26 = [a4 width];
      int v27 = [a4 height];
      float v28 = v21;
      float v29 = v22 * v24 / v18;
      *(_OWORD *)v57[0].f32 = xmmword_1B7E736B0;
      long long v55 = xmmword_1B7E736C0;
      float v30 = v25 * v23 / v19;
      long long v52 = xmmword_1B7E736B0;
      long long v59 = xmmword_1B7E736C0;
      HEquirectGaussianBlur::init((uint64_t)v20, v26, v27, v57, (float32x2_t *)&v55, (float32x2_t *)&v52, (float32x2_t *)&v59, v28, v29, v30);
      (*(void (**)(HGNode *, void, uint64_t))(*(void *)v20 + 120))(v20, 0, v62);
      (*(void (**)(HGNode *))(*(void *)v20 + 16))(v20);
      (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
    }
    else
    {
      v20 = (HGNode *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v20);
      float v31 = v67;
      float v32 = v65;
      float v33 = v64;
      HGaussianBlur::init((HGaussianBlur *)v20, v31, v32, v33, v14 == 0, 0, 0);
      (*(void (**)(HGNode *, void, uint64_t))(*(void *)v20 + 120))(v20, 0, v62);
      (*(void (**)(HGNode *))(*(void *)v20 + 16))(v20);
      (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
    }
    *(void *)&long long v59 = v20;
    (*(void (**)(HGNode *))(*(void *)v20 + 16))(v20);
    [(PAESharedDefaultBase *)self crop:&v59 fromImage:a4 toImage:a3];
    v34 = (HgcUnsharpMask *)HGObject::operator new(0x1A0uLL);
    HgcUnsharpMask::HgcUnsharpMask(v34);
    v58 = v34;
    (*(void (**)(HgcUnsharpMask *, void, uint64_t))(*(void *)v34 + 120))(v34, 0, v62);
    (*(void (**)(HgcUnsharpMask *, uint64_t, void))(*(void *)v58 + 120))(v58, 1, v59);
    float v35 = v70;
    (*(void (**)(HgcUnsharpMask *, void, float, double, double, double))(*(void *)v58 + 96))(v58, 0, v35, 0.0, 0.0, 0.0);
    float v36 = v66;
    (*(void (**)(HgcUnsharpMask *, uint64_t, float, double, double, double))(*(void *)v58 + 96))(v58, 1, v36, 0.0, 0.0, 0.0);
    if (!v14)
    {
      v51 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
      HGColorClamp::HGColorClamp(v51);
    }
    if (v63)
    {
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      unint64_t v37 = [a4 width];
      double v38 = *(double *)&v55;
      unint64_t v39 = [a4 height];
      double v40 = ceil(fabs(v38) * (double)v37);
      double v41 = ceil(fabs(v56) * (double)v39);
      *(double *)&long long v52 = v40 * -0.5;
      *((double *)&v52 + 1) = v41 * -0.5;
      double v53 = v40;
      double v54 = v41;
      PCMatrix44Tmpl<double>::transformRect<double>((double *)v57, (double *)&v52, (uint64_t)&v52);
      float v42 = *(double *)&v52;
      float v43 = *((double *)&v52 + 1);
      float v44 = *(double *)&v52 + v53;
      float v45 = *((double *)&v52 + 1) + v54;
      uint64_t v47 = HGRectMake4f(v46, v42, v43, v44, v45);
      uint64_t v49 = v48;
      v50 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v50);
      (*(void (**)(HGCrop *, void, HgcUnsharpMask *))(*(void *)v50 + 120))(v50, 0, v58);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v50 + 96))(v50, 0, (float)(int)v47, (float)SHIDWORD(v47), (float)(int)v49, (float)SHIDWORD(v49));
      if (v58 != v50)
      {
        if (v58) {
          (*(void (**)(HgcUnsharpMask *))(*(void *)v58 + 24))(v58);
        }
        v58 = v50;
        (*(void (**)(HGCrop *))(*(void *)v50 + 16))(v50);
      }
      (*(void (**)(HGCrop *))(*(void *)v50 + 24))(v50);
    }
    [a3 setHeliumRef:&v58];
    if (v58) {
      (*(void (**)(HgcUnsharpMask *))(*(void *)v58 + 24))(v58);
    }
    if ((void)v59) {
      (*(void (**)(void))(*(void *)v59 + 24))(v59);
    }
    (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
    if (v61) {
      (*(void (**)(uint64_t))(*(void *)v61 + 24))(v61);
    }
    if (v62) {
      (*(void (**)(uint64_t))(*(void *)v62 + 24))(v62);
    }
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