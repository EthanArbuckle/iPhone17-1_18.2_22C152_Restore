@interface PAEFill
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)parameterChanged:(unsigned int)a3;
- (PAEFill)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEFill

- (PAEFill)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFill;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  if (-[PAEFill properties]::once != -1) {
    dispatch_once(&-[PAEFill properties]::once, &__block_literal_global_32);
  }
  return (id)-[PAEFill properties]::sPropertiesDict;
}

uint64_t __21__PAEFill_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1F11EC298, @"PixelTransformSupport", v1, @"PositionIndependent", v2, @"MayRemapTime", v3, @"SupportsLargeRenderScale", v4, @"SupportsHeliumRendering", v5, @"SupportsInternalMixing", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3),
             @"AutoColorProcessingSupport",
             0);
  -[PAEFill properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEFill;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fill::Type", 0, 0), 1, 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fill::Color", 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fill::Gradient", 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fill::Color", 0, 0), 2, 0, 0.5, 0.5, 0.5);
    objc_msgSend(v3, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Fill::Gradient", 0, 0), 3, 2);
    [v3 setGradientHiddenWithOSC:1 toParam:3];
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  if (a3 != 1) {
    return 1;
  }
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v5 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  uint64_t v7 = (void *)v5;
  long long v18 = *MEMORY[0x1E4F1F9F8];
  uint64_t v19 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  int v17 = 0;
  BOOL v8 = 1;
  [v4 getIntValue:&v17 fromParm:1 atFxTime:&v18];
  int v15 = 0;
  int v16 = 0;
  [v4 getParameterFlags:&v16 fromParm:2];
  v9 = &v15;
  [v4 getParameterFlags:&v15 fromParm:3];
  BOOL v10 = v17 == 0;
  if (v17) {
    v11 = &v15;
  }
  else {
    v11 = &v16;
  }
  if (v17) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  if (v17)
  {
    v9 = &v16;
    uint64_t v13 = 2;
  }
  else
  {
    uint64_t v13 = 3;
  }
  [v7 setParameterFlags:*v11 & 0xFFFFFFFD toParm:v12];
  [v7 setParameterFlags:*v9 | 2u toParm:v13];
  [v7 setGradientHiddenWithOSC:v10 toParam:3];
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  BOOL v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D3D0];
  v11 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F1219AD0];
  uint64_t v12 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v11 == 0 || v12 == 0) {
    return 0;
  }
  int v78 = 0;
  [v9 getIntValue:&v78 fromParm:1 atFxTime:a5->var0.var1];
  int v16 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  [v9 mixAmountAtTime:a5->var0.var1];
  if (!v16) {
    return 0;
  }
  double v18 = v17;
  if ([a4 imageType] != 3) {
    return 0;
  }
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v77 = 0;
  }
  if (v78)
  {
    double v74 = 1.0;
    uint64_t v71 = 0x3FF0000000000000;
    double v68 = 1.0;
    double v65 = 1.0;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    [v11 inversePixelTransform];
    for (uint64_t i = 0; i != 16; i += 4)
    {
      v21 = (_OWORD *)((char *)&v65 + i * 8);
      long long v22 = *(_OWORD *)&v64[i + 2];
      _OWORD *v21 = *(_OWORD *)&v64[i];
      v21[1] = v22;
    }
    uint64_t v23 = HGRectMake4i(0, 0, 0x400u, 1u);
    uint64_t v25 = v24;
    v26 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(void *)&double v27 = HGBitmap::HGBitmap(v26, v23, v25, 24).n128_u64[0];
    double v63 = 0.0;
    v64[0] = 0.0;
    double v75 = 0.0;
    double v76 = 0.0;
    int v62 = 0;
    objc_msgSend(v10, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", *((void *)v26 + 10), 1024, 1, 3, a5->var0.var1, v27);
    [v10 getGradientStartEnd:v64 startY:&v76 endX:&v75 endY:&v63 type:&v62 fromParm:3 atFxTime:a5->var0.var1];
    [a3 pixelAspect];
    double v29 = v28;
    double v30 = v75;
    double v31 = v76;
    double v32 = v63;
    double v33 = v64[0];
    v34 = (HGGradient *)HGObject::operator new(0x210uLL);
    HGGradient::HGGradient(v34);
    if (v62)
    {
      HGGradient::SetGradientMode((uint64_t)v34, 1);
      float v35 = sqrt(v29 * (v30 - v33) * (v29 * (v30 - v33)) + (v32 - v31) * (v32 - v31));
      (*(void (**)(HGGradient *, uint64_t, float, double, double, double))(*(void *)v34 + 96))(v34, 2, fabsf(v35), 0.0, 0.0, 0.0);
    }
    else
    {
      HGGradient::SetGradientMode((uint64_t)v34, 0);
      float v41 = v75;
      float v42 = v63;
      (*(void (**)(HGGradient *, uint64_t, float, float, double, double))(*(void *)v34 + 96))(v34, 2, v41, v42, 0.0, 0.0);
    }
    float v43 = v29;
    (*(void (**)(HGGradient *, void, float, float, float, float))(*(void *)v34 + 96))(v34, 0, v43, 1.0, 1.0, 1.0);
    float v44 = v64[0];
    float v45 = v76;
    (*(void (**)(HGGradient *, uint64_t, float, float, double, double))(*(void *)v34 + 96))(v34, 1, v44, v45, 0.0, 0.0);
    float v46 = v65;
    float v47 = *(double *)&v66;
    float v48 = *(double *)&v67;
    (*(void (**)(HGGradient *, uint64_t, float, float, double, float))(*(void *)v34 + 96))(v34, 3, v46, v47, 0.0, v48);
    float v49 = *((double *)&v67 + 1);
    float v50 = v68;
    float v51 = *((double *)&v69 + 1);
    (*(void (**)(HGGradient *, uint64_t, float, float, double, float))(*(void *)v34 + 96))(v34, 4, v49, v50, 0.0, v51);
    float v52 = *((double *)&v72 + 1);
    float v53 = *(double *)&v73;
    float v54 = v74;
    (*(void (**)(HGGradient *, uint64_t, float, float, double, float))(*(void *)v34 + 96))(v34, 5, v52, v53, 0.0, v54);
    uint64_t v55 = 0;
    uint64_t v56 = *((void *)v26 + 10);
    for (uint64_t j = v56; ; j += 4)
    {
      uint64_t v58 = 0;
      v59 = (char *)(v56 + 4 * v55);
      char v60 = *v59;
      do
      {
        *(unsigned char *)(j + v58) = *(unsigned char *)(j + v58 + 1);
        ++v58;
      }
      while (v58 != 3);
      v59[3] = v60;
      if (++v55 == 1024)
      {
        v61 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
        HGBitmapLoader::HGBitmapLoader(v61, v26);
        (*(void (**)(HGGradient *, void, HGBitmapLoader *))(*(void *)v34 + 120))(v34, 0, v61);
        (*(void (**)(HGGradient *))(*(void *)v34 + 16))(v34);
        FxApplyGradientBlendRequest();
      }
    }
  }
  double v65 = 0.0;
  v64[0] = 0.0;
  double v76 = 0.0;
  [v9 getRedValue:&v65 greenValue:v64 blueValue:&v76 fromParm:2 atFxTime:a5->var0.var1];
  *(double *)&v36 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
  HgcFillColor::HgcFillColor(v36);
  (*(void (**)(HgcFillColor *, void, uint64_t))(*(void *)v36 + 120))(v36, 0, v77);
  float v37 = v65;
  float v38 = v64[0];
  float v39 = v76;
  (*(void (**)(HgcFillColor *, void, float, float, float, double))(*(void *)v36 + 96))(v36, 0, v37, v38, v39, 0.0);
  float v40 = v18;
  (*(void (**)(HgcFillColor *, uint64_t, float, double, double, double))(*(void *)v36 + 96))(v36, 1, v40, 0.0, 0.0, 0.0);
  double v75 = *(double *)&v36;
  (*(void (**)(HgcFillColor *))(*(void *)v36 + 16))(v36);
  [a3 setHeliumRef:&v75];
  if (v75 != 0.0) {
    (*(void (**)(double))(**(void **)&v75 + 24))(COERCE_DOUBLE(*(void *)&v75));
  }
  (*(void (**)(HgcFillColor *))(*(void *)v36 + 24))(v36);
  if (v77) {
    (*(void (**)(uint64_t))(*(void *)v77 + 24))(v77);
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