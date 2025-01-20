@interface PAEZoomBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEZoomBlur)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)constrainWidth:(unint64_t *)a3 andHeight:(unint64_t *)a4 withImageInfo:(id *)a5;
- (void)dealloc;
- (void)polarToRect:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9;
- (void)rectToPolar:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9;
@end

@implementation PAEZoomBlur

- (PAEZoomBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEZoomBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEZoomBlur;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7 = [(PAEFilterDefaultBase *)self getParamAPIWithError:a4];
  double v14 = 0.0;
  if (([v7 getFloatValue:&v14 fromParm:1 atFxTime:a3.var1] & 1) != 0
    && (char v13 = 0, ([v7 getBoolValue:&v13 fromParm:3 atFxTime:a3.var1] & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 1;
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
  v12.receiver = self;
  v12.super_class = (Class)PAEZoomBlur;
  [(PAESharedDefaultBase *)&v12 addParameters];
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
    v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Zoomblur::Look", 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"Zoomblur::Look Entries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    uint64_t v9 = [v8 localizedStringForKey:@"Zoomblur::Amount" value:0 table:0];
    if (v7 >= 2) {
      double v10 = 1000.0;
    }
    else {
      double v10 = 100.0;
    }
    [v3 addFloatSliderWithName:v9 parmId:1 defaultValue:0 parameterMin:2.0 parameterMax:0.0 sliderMin:v10 sliderMax:0.0 delta:32.0 parmFlags:1.0];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Zoomblur::Swirliness", 0, 0), 4, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Zoomblur::Center", 0, 0), 2, 0, 0.5, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"Zoomblur::Crop", 0, 0), 3, 0, 33);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (void)constrainWidth:(unint64_t *)a3 andHeight:(unint64_t *)a4 withImageInfo:(id *)a5
{
  double v5 = (double)*a3;
  double v6 = (double)*a4;
  if (v5 / v6 <= 1.0)
  {
    if (*a4 < 0xFFD) {
      return;
    }
    unint64_t v8 = (unint64_t)(v5 * 4092.0 / v6);
    unint64_t v7 = 4092;
  }
  else
  {
    if (*a3 < 0xFFD) {
      return;
    }
    unint64_t v7 = (unint64_t)(v6 * 4092.0 / v5);
    unint64_t v8 = 4092;
  }
  *a3 = v8;
  *a4 = v7;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = (unint64_t *)&v33;
  }
  if (a4) {
    double v10 = a4;
  }
  else {
    double v10 = (unint64_t *)&v33;
  }
  v11 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  objc_super v12 = v11;
  if (v11)
  {
    double v32 = 0.0;
    uint64_t v33 = 0;
    [v11 getFloatValue:&v32 fromParm:1 atFxTime:a6->var0.var1];
    char v31 = 0;
    [v12 getBoolValue:&v31 fromParm:3 atFxTime:a6->var0.var1];
    int v30 = 0;
    [v12 getIntValue:&v30 fromParm:5 atFxTime:a6->var0.var1];
    unint64_t var0 = a5->var0;
    unint64_t var1 = a5->var1;
    double v28 = 0.5;
    double v29 = 0.5;
    [v12 getXValue:&v29 YValue:&v28 fromParm:2 atFxTime:a6->var0.var1];
    double v16 = v28;
    if (a5->var5 == 2) {
      double v16 = 1.0 - v28;
    }
    double v17 = v29 * (double)var0;
    double v18 = v16 * (double)var1;
    double v28 = v18;
    double v29 = v17;
    if (v31 || v32 == 0.0)
    {
      *uint64_t v9 = var0;
      *double v10 = var1;
    }
    else if (v30 == 1)
    {
      signed int v19 = 3 * vcvtpd_s64_f64(v32);
      *uint64_t v9 = var0 + v19;
      *double v10 = var1 + v19;
    }
    else
    {
      float v20 = v32;
      float v21 = v17;
      float v22 = v18;
      HZoomBlur::getOutputWidthAndHeight((HZoomBlur *)LODWORD(a5->var0), a5->var1, v9, v20, v21, v22, v10, v15);
      long long v23 = *(_OWORD *)&a5->var6;
      v26[2] = *(_OWORD *)&a5->var4;
      v26[3] = v23;
      double var8 = a5->var8;
      long long v24 = *(_OWORD *)&a5->var2;
      v26[0] = *(_OWORD *)&a5->var0;
      v26[1] = v24;
      [(PAEZoomBlur *)self constrainWidth:v9 andHeight:v10 withImageInfo:v26];
    }
  }
  return v12 != 0;
}

- (void)polarToRect:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9
{
  if (objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation"))id v12 = a4; {
  else
  }
    id v12 = a3;
  [v12 width];
  [v12 height];
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  char v13 = (HgcPolarToRect *)HGObject::operator new(0x1C0uLL);
  HgcPolarToRect::HgcPolarToRect(v13);
}

- (void)rectToPolar:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9
{
  int v12 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
  [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  if (!v12) {
    a4 = a3;
  }
  [a4 width];
  [a4 height];
  [a3 width];
  [a3 height];
  char v13 = (HgcRectToPolar *)HGObject::operator new(0x1B0uLL);
  HgcRectToPolar::HgcRectToPolar(v13);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  if (a5->var1 == 2) {
    double v9 = 1.5;
  }
  else {
    double v9 = 1.0;
  }
  double v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (!v10) {
    return 0;
  }
  v11 = v10;
  double v76 = 0.0;
  [v10 getFloatValue:&v76 fromParm:1 atFxTime:a5->var0.var1];
  if (v76 == 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v76);
    }
    else {
      v68[0] = 0;
    }
    [a3 setHeliumRef:v68];
    if (v68[0]) {
      (*(void (**)(void))(*(void *)v68[0] + 24))(v68[0]);
    }
    return 1;
  }
  else
  {
    double v75 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v75, 4, a5->var0.var1, v76);
    double v75 = v75 * 3.14159265 * 0.5 + 1.57079633;
    double v73 = 0.5;
    double v74 = 0.5;
    [v11 getXValue:&v74 YValue:&v73 fromParm:2 atFxTime:a5->var0.var1];
    double v13 = v74;
    double v14 = v13 * (double)(unint64_t)[a4 width];
    float v15 = v14 - (double)(unint64_t)[a4 width] * 0.5;
    double v16 = v73;
    double v17 = v16 * (double)(unint64_t)[a4 height];
    float v18 = v17 - (double)(unint64_t)[a4 height] * 0.5;
    float v19 = sqrtf((float)(v15 * v15) + (float)(v18 * v18));
    if (v19 > 65000.0)
    {
      if (v19 <= -0.00001 || v19 >= 0.00001)
      {
        float v15 = v15 / v19;
        float v18 = v18 / v19;
      }
      float v20 = v15 * 65000.0;
      float v21 = v18 * 65000.0;
      double v22 = (double)(unint64_t)[a4 width] * 0.5 + v20;
      double v74 = v22 / (double)(unint64_t)[a4 width];
      double v23 = (double)(unint64_t)[a4 height] * 0.5 + v21;
      double v73 = v23 / (double)(unint64_t)[a4 height];
    }
    char v72 = 0;
    [v11 getBoolValue:&v72 fromParm:3 atFxTime:a5->var0.var1];
    int v71 = 0;
    [v11 getIntValue:&v71 fromParm:5 atFxTime:a5->var0.var1];
    uint64_t v24 = [a4 imageType];
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]) {
      BOOL v25 = v24 == 3;
    }
    else {
      BOOL v25 = 0;
    }
    BOOL v12 = v25;
    if (v25)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        uint64_t v70 = 0;
      }
      if (v76 == 0.0)
      {
        objc_msgSend(a3, "setHeliumRef:", &v70, v76);
      }
      else if (v71 == 1)
      {
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3, v76);
        HGTransform::HGTransform((HGTransform *)v68);
        HGTransform::Scale((HGTransform *)v68, v9, v9, 1.0);
        v27 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v27);
        (*(void (**)(HGXForm *, void *))(*(void *)v27 + 576))(v27, v68);
        (*(void (**)(HGXForm *, void, uint64_t))(*(void *)v27 + 120))(v27, 0, v70);
        v66 = v27;
        uint64_t v67 = 0;
        (*(void (**)(HGXForm *))(*(void *)v27 + 16))(v27);
        [(PAEZoomBlur *)self polarToRect:a3 withInputImage:a4 withInputNode:&v66 centerX:&v67 centerY:v74 upscaleFactor:v73 andOutputNode:v9];
        if (v66) {
          (*(void (**)(HGXForm *))(*(void *)v66 + 24))(v66);
        }
        double v28 = (HDirectionalBlur *)HGObject::operator new(0x1B0uLL);
        HDirectionalBlur::HDirectionalBlur(v28);
        if (v28) {
          (*(void (**)(HDirectionalBlur *))(*(void *)v28 + 16))(v28);
        }
        float v29 = v9 * v76;
        float v30 = v75;
        float v31 = 1.0 / v69[0];
        float v32 = 1.0 / fabs(v69[5]);
        HDirectionalBlur::init(v28, v29, v30, v31, v32);
        (*(void (**)(HDirectionalBlur *, void, uint64_t))(*(void *)v28 + 120))(v28, 0, v67);
        v64 = v28;
        uint64_t v65 = 0;
        (*(void (**)(HDirectionalBlur *))(*(void *)v28 + 16))(v28);
        [(PAEZoomBlur *)self rectToPolar:a3 withInputImage:a4 withInputNode:&v64 centerX:&v65 centerY:v74 upscaleFactor:v73 andOutputNode:v9];
        if (v64) {
          (*(void (**)(HDirectionalBlur *))(*(void *)v64 + 24))(v64);
        }
        HGTransform::HGTransform((HGTransform *)v63);
        HGTransform::Scale((HGTransform *)v63, 1.0 / v9, 1.0 / v9, 1.0);
        uint64_t v33 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v33);
        (*(void (**)(HGXForm *, uint64_t *))(*(void *)v33 + 576))(v33, v63);
        (*(void (**)(HGXForm *, void, uint64_t))(*(void *)v33 + 120))(v33, 0, v65);
        if (v72)
        {
          unint64_t v34 = [a3 width];
          unint64_t v35 = [a3 height];
          v36 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v36);
          (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v36 + 120))(v36, 0, v33);
          float v37 = (double)v34 * 0.5;
          float v38 = (double)v35 * 0.5;
          (*(void (**)(HGCrop *, void, float, float))(*(void *)v36 + 96))(v36, 0, -v37, -v38);
          v62 = v36;
          (*(void (**)(HGCrop *))(*(void *)v36 + 16))(v36);
          [a3 setHeliumRef:&v62];
          if (v62) {
            (*(void (**)(void *))(*(void *)v62 + 24))(v62);
          }
          (*(void (**)(HGCrop *))(*(void *)v36 + 24))(v36);
        }
        else
        {
          v62 = v33;
          (*(void (**)(HGXForm *))(*(void *)v33 + 16))(v33);
          [a3 setHeliumRef:&v62];
          if (v62) {
            (*(void (**)(void *))(*(void *)v62 + 24))(v62);
          }
        }
        (*(void (**)(HGXForm *))(*(void *)v33 + 24))(v33);
        HGTransform::~HGTransform((HGTransform *)v63);
        if (v65) {
          (*(void (**)(uint64_t))(*(void *)v65 + 24))(v65);
        }
        (*(void (**)(HDirectionalBlur *))(*(void *)v28 + 24))(v28);
        (*(void (**)(HDirectionalBlur *))(*(void *)v28 + 24))(v28);
        if (v67) {
          (*(void (**)(uint64_t))(*(void *)v67 + 24))(v67);
        }
        (*(void (**)(HGXForm *))(*(void *)v27 + 24))(v27);
        HGTransform::~HGTransform((HGTransform *)v68);
      }
      else
      {
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v76);
        double v39 = v74;
        double v74 = (v39 + -0.5) * (double)(unint64_t)[a4 width];
        double v40 = v73;
        double v73 = (v40 + -0.5) * (double)(unint64_t)[a4 height];
        float v41 = v76;
        float v42 = v74;
        float v43 = v73;
        HZoomBlur::makeZoom(&v70, v63, v41, v42, v43);
        v69[0] = 0.0;
        *(void *)&v69[0] = [a3 width];
        uint64_t v67 = 0;
        uint64_t v44 = [a3 height];
        uint64_t v67 = v44;
        if (!v72)
        {
          *(void *)&v69[0] *= 2;
          uint64_t v67 = 2 * v44;
        }
        if (a4)
        {
          [a4 imageInfo];
        }
        else
        {
          uint64_t v61 = 0;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
        }
        [(PAEZoomBlur *)self constrainWidth:v69 andHeight:&v67 withImageInfo:&v57];
        unint64_t v45 = *(void *)&v69[0];
        unint64_t v46 = v67;
        v47 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v47);
        (*(void (**)(HGCrop *, void, uint64_t))(*(void *)v47 + 120))(v47, 0, v63[0]);
        float v48 = (double)v45 * 0.5;
        float v49 = (double)v46 * 0.5;
        (*(void (**)(HGCrop *, void, float, float))(*(void *)v47 + 96))(v47, 0, -v48, -v49);
        if ((HGCrop *)v63[0] != v47)
        {
          if (v63[0]) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)v63[0] + 24))(v63[0], v50, v51, v52, v53, v54, v55, v56, v57);
          }
          v63[0] = (uint64_t)v47;
          (*(void (**)(HGCrop *))(*(void *)v47 + 16))(v47);
        }
        objc_msgSend(a3, "setHeliumRef:", v63, v57, v58, v59, v60, v61);
        (*(void (**)(HGCrop *))(*(void *)v47 + 24))(v47);
        if (v63[0]) {
          (*(void (**)(uint64_t))(*(void *)v63[0] + 24))(v63[0]);
        }
      }
      if (v70) {
        (*(void (**)(uint64_t))(*(void *)v70 + 24))(v70);
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

@end