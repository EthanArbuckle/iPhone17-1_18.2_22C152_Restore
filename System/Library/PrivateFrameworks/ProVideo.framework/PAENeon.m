@interface PAENeon
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (HGRef<HGNode>)blurNodeWithRadius:(double)a3 xScale:(double)a4 yScale:(double)a5 inputNode:(HGRef<HGNode>)a6;
- (HGRef<HGNode>)brightnessNodeWithValue:(double)a3 inputNode:(HGRef<HGNode>)a4;
- (PAENeon)initWithAPIManager:(id)a3;
- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4;
- (id)properties;
@end

@implementation PAENeon

- (PAENeon)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAENeon;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAENeon properties]::once != -1) {
    dispatch_once(&-[PAENeon properties]::once, &__block_literal_global_31);
  }
  return (id)-[PAENeon properties]::sPropertiesDict;
}

uint64_t __21__PAENeon_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"PixelIndependent", v2, @"MayRemapTime", v3, @"SupportsHeliumRendering", v4, @"SDRWorkingSpace", v5, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAENeon properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  v6 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v6)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve FxParameterRetrievalAPI object", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v16 = v15;
      v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = FxPlugErrorDomain;
      uint64_t v19 = 100001;
LABEL_20:
      v21 = (void *)[v17 errorWithDomain:v18 code:v19 userInfo:v16];
      id result = 0;
      *a4 = v21;
      return result;
    }
    return 0;
  }
  v7 = v6;
  uint64_t v26 = 0x3FF0000000000000;
  double v25 = 0.0;
  if (![v6 getFloatValue:&v26 fromParm:1 atFxTime:a3.var1])
  {
    uint64_t v24 = 0x3FF0000000000000;
    goto LABEL_16;
  }
  uint64_t v24 = 0x3FF0000000000000;
  if (![v7 getFloatValue:&v25 fromParm:3 atFxTime:a3.var1])
  {
LABEL_16:
    double v23 = 0.0;
    goto LABEL_17;
  }
  double v23 = 0.0;
  if (([v7 getFloatValue:&v24 fromParm:2 atFxTime:a3.var1] & 1) == 0)
  {
LABEL_17:
    uint64_t v22 = 0x3FF0000000000000;
    goto LABEL_18;
  }
  uint64_t v22 = 0x3FF0000000000000;
  if (([v7 getFloatValue:&v23 fromParm:5 atFxTime:a3.var1] & 1) == 0
    || ([v7 getFloatValue:&v22 fromParm:4 atFxTime:a3.var1] & 1) == 0)
  {
LABEL_18:
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to retrieve a parameter in [-PAEGaussianBlur dynamicPropertiesAtTime:withError:]", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      uint64_t v16 = v20;
      v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = FxPlugErrorDomain;
      uint64_t v19 = 100002;
      goto LABEL_20;
    }
    return 0;
  }
  double v8 = v25;
  if (v25 < v23) {
    double v8 = v23;
  }
  if (v8 == 0.0) {
    uint64_t v9 = 6;
  }
  else {
    uint64_t v9 = 3;
  }
  v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = [NSNumber numberWithBool:1];
  uint64_t v12 = [NSNumber numberWithInt:v9];
  uint64_t v13 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"PositionIndependent", v12, @"PixelTransformSupport", v13, @"SupportsLargeRenderScale", objc_msgSend(NSNumber, "numberWithBool:", 0), @"SupportsStableAnimation", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAENeon;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Neon::Outer Brightness", 0, 0), 4, 0, 2.0, 0.0, 1000.0, 0.0, 20.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Neon::Outer Glow", 0, 0), 5, 0, 45.0, 0.0, 1000.0, 0.0, 200.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Neon::Inner Brightness", 0, 0), 2, 0, 2.0, 0.0, 1000.0, 0.0, 15.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Neon::Inner Glow", 0, 0), 3, 0, 50.0, 0.0, 1000.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Neon::Edge Intensity", 0, 0), 1, 0, 10.0, 0.0, 1000.0, 0.0, 15.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (!(v9 | v10)) {
    return 0;
  }
  unsigned int v12 = [(id)v10 versionAtCreation];
  *(double *)&uint64_t v47 = 1.0;
  [(id)v9 getFloatValue:&v47 fromParm:1 atFxTime:a5->var0.var1];
  double v46 = 0.0;
  [(id)v9 getFloatValue:&v46 fromParm:3 atFxTime:a5->var0.var1];
  *(double *)&uint64_t v45 = 1.0;
  [(id)v9 getFloatValue:&v45 fromParm:2 atFxTime:a5->var0.var1];
  double v44 = 0.0;
  [(id)v9 getFloatValue:&v44 fromParm:5 atFxTime:a5->var0.var1];
  *(double *)&uint64_t v43 = 1.0;
  [(id)v9 getFloatValue:&v43 fromParm:4 atFxTime:a5->var0.var1];
  int v13 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  uint64_t v14 = [a4 imageType];
  if (v13) {
    BOOL v15 = v14 == 3;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v11 = v15;
  if (v15)
  {
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v42 = 0;
    }
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    double v16 = *(double *)&v47;
    uint64_t v38 = v42;
    if (v42) {
      (*(void (**)(uint64_t))(*(void *)v42 + 16))(v42);
    }
    [(PAENeon *)self brightnessNodeWithValue:&v38 inputNode:v16];
    if (v38) {
      (*(void (**)(uint64_t))(*(void *)v38 + 24))(v38);
    }
    double v17 = v46;
    double v18 = v40;
    double v19 = v41;
    uint64_t v36 = v42;
    if (v42) {
      (*(void (**)(uint64_t))(*(void *)v42 + 16))(v42);
    }
    [(PAENeon *)self blurNodeWithRadius:&v36 xScale:v17 yScale:v18 inputNode:v19];
    if (v36) {
      (*(void (**)(uint64_t))(*(void *)v36 + 24))(v36);
    }
    double v20 = *(double *)&v45;
    uint64_t v34 = v37;
    if (v37) {
      (*(void (**)(uint64_t))(*(void *)v37 + 16))(v37);
    }
    [(PAENeon *)self brightnessNodeWithValue:&v34 inputNode:v20];
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
    }
    double v21 = v44;
    double v22 = v40;
    double v23 = v41;
    uint64_t v32 = v42;
    if (v42) {
      (*(void (**)(uint64_t))(*(void *)v42 + 16))(v42);
    }
    [(PAENeon *)self blurNodeWithRadius:&v32 xScale:v21 yScale:v22 inputNode:v23];
    if (v32) {
      (*(void (**)(uint64_t))(*(void *)v32 + 24))(v32);
    }
    double v24 = *(double *)&v43;
    uint64_t v30 = v33;
    if (v33) {
      (*(void (**)(uint64_t))(*(void *)v33 + 16))(v33);
    }
    [(PAENeon *)self brightnessNodeWithValue:&v30 inputNode:v24];
    if (v30) {
      (*(void (**)(uint64_t))(*(void *)v30 + 24))(v30);
    }
    double v25 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v25);
    (*(void (**)(HGHWMultiBlend *, void, uint64_t))(*(void *)v25 + 120))(v25, 0, v39);
    uint64_t v26 = *(void (**)(HGHWMultiBlend *, uint64_t, uint64_t))(*(void *)v25 + 120);
    if (v12 < 4)
    {
      v26(v25, 1, v35);
      v27 = &v31;
    }
    else
    {
      v26(v25, 1, v31);
      v27 = &v35;
    }
    (*(void (**)(HGHWMultiBlend *, uint64_t, uint64_t))(*(void *)v25 + 120))(v25, 2, *v27);
    v29 = v25;
    (*(void (**)(HGHWMultiBlend *))(*(void *)v25 + 16))(v25);
    [a3 setHeliumRef:&v29];
    if (v29) {
      (*(void (**)(HGHWMultiBlend *))(*(void *)v29 + 24))(v29);
    }
    (*(void (**)(HGHWMultiBlend *))(*(void *)v25 + 24))(v25);
    if (v31) {
      (*(void (**)(uint64_t))(*(void *)v31 + 24))(v31);
    }
    if (v33) {
      (*(void (**)(uint64_t))(*(void *)v33 + 24))(v33);
    }
    if (v35) {
      (*(void (**)(uint64_t))(*(void *)v35 + 24))(v35);
    }
    if (v37) {
      (*(void (**)(uint64_t))(*(void *)v37 + 24))(v37);
    }
    if (v39) {
      (*(void (**)(uint64_t))(*(void *)v39 + 24))(v39);
    }
    if (v42) {
      (*(void (**)(uint64_t))(*(void *)v42 + 24))(v42);
    }
  }
  return v11;
}

- (HGRef<HGNode>)brightnessNodeWithValue:(double)a3 inputNode:(HGRef<HGNode>)a4
{
  uint64_t v4 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v4);
}

- (HGRef<HGNode>)blurNodeWithRadius:(double)a3 xScale:(double)a4 yScale:(double)a5 inputNode:(HGRef<HGNode>)a6
{
  BOOL v11 = v6;
  unsigned int v12 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v12);
  float v13 = a3;
  float v14 = a4;
  float v15 = a5;
  HGaussianBlur::init(v12, v13, v14, v15, 0, 0, 0);
  v16.var0 = (HGNode *)(*(uint64_t (**)(HGaussianBlur *, void, void))(*(void *)v12 + 120))(v12, 0, *(void *)a6.var0);
  *BOOL v11 = v12;
  return v16;
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

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  uint64_t v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  BOOL v11 = v10;
  if (v10)
  {
    double v18 = 0.0;
    [v10 getFloatValue:&v18 fromParm:3 atFxTime:a6->var0.var1];
    double v17 = 0.0;
    [v11 getFloatValue:&v17 fromParm:5 atFxTime:a6->var0.var1];
    double v12 = v18;
    if (v18 < v17) {
      double v12 = v17;
    }
    unint64_t var1 = a5->var1;
    float v14 = v12;
    uint64_t v15 = (int)(2 * vcvtps_s32_f32(v14));
    if (a3) {
      *a3 = a5->var0 + v15;
    }
    if (a4) {
      *a4 = var1 + v15;
    }
  }
  return v11 != 0;
}

@end