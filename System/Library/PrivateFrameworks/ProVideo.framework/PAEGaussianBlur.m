@interface PAEGaussianBlur
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (PAEGaussianBlur)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4;
@end

@implementation PAEGaussianBlur

- (PAEGaussianBlur)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEGaussianBlur;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEGaussianBlur properties]::once != -1) {
    dispatch_once(&-[PAEGaussianBlur properties]::once, &__block_literal_global_24);
  }
  return (id)-[PAEGaussianBlur properties]::sProps;
}

uint64_t __29__PAEGaussianBlur_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"MayRemapTime", v2, @"SupportsHeliumRendering", v3, @"InputSizeLimit", v4, @"UsesRationalTime", objc_msgSend(NSNumber, "numberWithInteger:", 3), @"AutoColorProcessingSupport", 0);
  -[PAEGaussianBlur properties]::sProps = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v6)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve FxParameterRetrievalAPI object", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v20 = v19;
      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = FxPlugErrorDomain;
      uint64_t v23 = 100001;
LABEL_24:
      v25 = (void *)[v21 errorWithDomain:v22 code:v23 userInfo:v20];
      id result = 0;
      *a4 = v25;
      return result;
    }
    return 0;
  }
  v7 = v6;
  unsigned __int8 v28 = 0;
  unsigned __int8 v27 = 0;
  if (![v6 getBoolValue:&v28 fromParm:4 atFxTime:a3.var1])
  {
    double v26 = 0.0;
    goto LABEL_22;
  }
  int v8 = [v7 getBoolValue:&v27 fromParm:6 atFxTime:a3.var1];
  if (v28) {
    BOOL v9 = v27 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  char v10 = v9;
  unsigned __int8 v28 = v10;
  double v26 = 0.0;
  if (!v8 || ([v7 getFloatValue:&v26 fromParm:1 atFxTime:a3.var1] & 1) == 0)
  {
LABEL_22:
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve a parameter in [-PAEGaussianBlur dynamicPropertiesAtTime:withError:]", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v20 = v24;
      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = FxPlugErrorDomain;
      uint64_t v23 = 100002;
      goto LABEL_24;
    }
    return 0;
  }
  uint64_t v11 = 3;
  if (!v28)
  {
    if (v26 == 0.0 && v27 == 0) {
      uint64_t v11 = 6;
    }
    else {
      uint64_t v11 = 3;
    }
  }
  BOOL v13 = v28 == 0;
  v14 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v15 = [NSNumber numberWithBool:(v28 | v27) == 0];
  uint64_t v16 = [NSNumber numberWithInt:v11];
  uint64_t v17 = [NSNumber numberWithBool:v27 == 0];
  return (id)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"PositionIndependent", v16, @"PixelTransformSupport", v17, @"SupportsLargeRenderScale", objc_msgSend(NSNumber, "numberWithBool:", v13), @"SupportsStableAnimation", 0);
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEGaussianBlur;
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
    BOOL v7 = [v4 versionAtCreation] < 2;
    int v8 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GaussianBlur::Amount", 0, 0), 1, 0, 4.0, 0.0, dbl_1B7E74400[v7], 0.0, 64.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GaussianBlur::Horizontal", 0, 0), 2, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GaussianBlur::Vertical", 0, 0), 3, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GaussianBlur::Crop", 0, 0), 4, 0, 33);
    [v3 addToggleButtonWithName:@"Prescale Input" parmId:5 defaultValue:0 parmFlags:2];
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", @"GaussianBlur::360 Blur", 0, 0), 6, 0, 1);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  objc_super v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v11 = v10;
  if (v10)
  {
    char v22 = 0;
    [v10 getBoolValue:&v22 fromParm:6 atFxTime:a6->var0.var1];
    if (v22)
    {
      if (a3) {
        *a3 = a5->var0;
      }
      if (a4)
      {
        unint64_t var1 = a5->var1;
LABEL_11:
        *a4 = var1;
      }
    }
    else
    {
      double v21 = 0.0;
      [v11 getFloatValue:&v21 fromParm:1 atFxTime:a6->var0.var1];
      double v21 = v21 * 0.5;
      double v20 = 0.0;
      [v11 getFloatValue:&v20 fromParm:2 atFxTime:a6->var0.var1];
      double v20 = v20 * 0.01;
      double v19 = 0.0;
      [v11 getFloatValue:&v19 fromParm:3 atFxTime:a6->var0.var1];
      double v19 = v19 * 0.01;
      char v18 = 0;
      [v11 getBoolValue:&v18 fromParm:4 atFxTime:a6->var0.var1];
      unint64_t var0 = a5->var0;
      unint64_t var1 = a5->var1;
      if (v18)
      {
        if (a3) {
          *a3 = var0;
        }
        if (a4) {
          goto LABEL_11;
        }
      }
      else
      {
        float v15 = v21 + v21;
        double v16 = v15;
        unsigned int v17 = vcvtpd_s64_f64(v19 * v16);
        if (a3) {
          *a3 = var0 + (int)(2 * vcvtpd_s64_f64(v20 * v16));
        }
        var1 += (int)(2 * v17);
        if (a4) {
          goto LABEL_11;
        }
      }
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  BOOL v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
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
  int v13 = [v10 versionAtCreation];
  int v14 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  int v15 = [a4 imageType];
  [(PAESharedDefaultBase *)self getScaleForImage:a4];
  double v17 = v41[1];
  double v16 = v41[2];
  v41[0] = 0.0;
  [v9 getFloatValue:v41 fromParm:1 atFxTime:a5->var0.var1];
  char v40 = 0;
  [v9 getBoolValue:&v40 fromParm:5 atFxTime:a5->var0.var1];
  if (v41[0] <= 0.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", v41[0]);
    }
    else {
      double v39 = 0.0;
    }
    [a3 setHeliumRef:&v39];
    if (v39 != 0.0) {
      (*(void (**)(void))(**(void **)&v39 + 24))(*(void *)&v39);
    }
    return 1;
  }
  else
  {
    v41[0] = v41[0] * 0.5;
    double v39 = 0.0;
    [v9 getFloatValue:&v39 fromParm:2 atFxTime:a5->var0.var1];
    double v39 = v17 * (v39 * 0.01);
    double v38 = 0.0;
    [v9 getFloatValue:&v38 fromParm:3 atFxTime:a5->var0.var1];
    double v38 = v16 * (v38 * 0.01);
    if (v14) {
      BOOL v18 = v15 == 3;
    }
    else {
      BOOL v18 = 0;
    }
    BOOL v12 = v18;
    if (v18)
    {
      if (a4) {
        [a4 heliumRef];
      }
      else {
        v37 = 0;
      }
      char v36 = 0;
      [v9 getBoolValue:&v36 fromParm:4 atFxTime:a5->var0.var1];
      if (v36)
      {
        v34 = v37;
        if (v37) {
          (*(void (**)(HGaussianBlur *))(*(void *)v37 + 16))(v37);
        }
        [(PAESharedDefaultBase *)self smear:&v34 fromImage:a4 toImage:a4];
        double v19 = v35;
        if (v37 == v35)
        {
          if (v37) {
            (*(void (**)(void))(*(void *)v37 + 24))();
          }
        }
        else
        {
          if (v37)
          {
            (*(void (**)(void))(*(void *)v37 + 24))();
            double v19 = v35;
          }
          v37 = v19;
          v35 = 0;
        }
        if (v34) {
          (*(void (**)(HGaussianBlur *))(*(void *)v34 + 24))(v34);
        }
      }
      v35 = 0;
      if (v40)
      {
        v32 = v37;
        if (v37) {
          (*(void (**)(HGaussianBlur *))(*(void *)v37 + 16))(v37);
        }
        HIDWORD(v20) = HIDWORD(v41[0]);
        *(float *)&double v20 = v41[0];
        HIDWORD(v22) = HIDWORD(v38);
        HIDWORD(v21) = HIDWORD(v39);
        float v23 = v39;
        float v24 = v38;
        *(float *)v31 = v23;
        *(float *)&v31[1] = v24;
        LODWORD(v22) = 2139095039;
        LODWORD(v21) = 1.5;
        [(PAEFilterDefaultBase *)self makePrescaledBlurNode:&v32 radius:v31 withScale:v20 minInputScale:v21 maxInputScale:v22];
        if (v33)
        {
          v35 = v33;
          v33 = 0;
        }
        if (v32) {
          (*(void (**)(HGaussianBlur *))(*(void *)v32 + 24))(v32);
        }
      }
      else
      {
        v25 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
        HGaussianBlur::HGaussianBlur(v25);
        float v26 = v41[0];
        float v27 = v39;
        float v28 = v38;
        HGaussianBlur::init(v25, v26, v27, v28, v13 == 0, a5->var1 == 2, 0);
        (*(void (**)(HGaussianBlur *, void, HGaussianBlur *))(*(void *)v25 + 120))(v25, 0, v37);
        uint64_t v29 = *(void *)v25;
        v35 = v25;
        (*(void (**)(HGaussianBlur *))(v29 + 16))(v25);
        (*(void (**)(HGaussianBlur *))(*(void *)v25 + 24))(v25);
      }
      if (v36) {
        [(PAESharedDefaultBase *)self crop:&v35 fromImage:a4 toImage:a3];
      }
      [a3 setHeliumRef:&v35];
      if (v35) {
        (*(void (**)(HGaussianBlur *))(*(void *)v35 + 24))(v35);
      }
      if (v37) {
        (*(void (**)(HGaussianBlur *))(*(void *)v37 + 24))(v37);
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

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  BOOL v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121D130, a4);
  char v8 = 0;
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v5 getBoolValue:&v8 fromParm:6 atFxTime:&v6];
  *a3 = v8 ^ 1;
}

@end