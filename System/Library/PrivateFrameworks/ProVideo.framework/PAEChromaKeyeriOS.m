@interface PAEChromaKeyeriOS
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEChromaKeyeriOS)initWithAPIManager:(id)a3;
- (id)properties;
- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6;
- (void)dealloc;
@end

@implementation PAEChromaKeyeriOS

- (PAEChromaKeyeriOS)initWithAPIManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEChromaKeyeriOS;
  v3 = [(PAESharedDefaultBase *)&v6 initWithAPIManager:a3];
  v3->_matteTools = objc_alloc_init(PAEKeyerMatteTools);
  v4 = objc_alloc_init(PAEKeyerPreprocess);
  v3->_preprocessTools = v4;
  v4->_apiManager = v3->super.super._apiManager;
  v3->_lutsBitmapLoaderCache = 0;
  return v3;
}

- (void)dealloc
{
  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache) {
    (*(void (**)(void *))(*(void *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEChromaKeyeriOS;
  [(PAESharedDefaultBase *)&v4 dealloc];
}

- (id)properties
{
  if (-[PAEChromaKeyeriOS properties]::once != -1) {
    dispatch_once(&-[PAEChromaKeyeriOS properties]::once, &__block_literal_global_28);
  }
  return (id)-[PAEChromaKeyeriOS properties]::sPropertiesDict;
}

uint64_t __31__PAEChromaKeyeriOS_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:0];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"PositionIndependent", v2, @"MayRemapTime", v3, @"SupportsLargeRenderScale", v4, @"SupportsHeliumRendering", v5, @"SDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 590080), @"HDRWorkingSpace", 0);
  -[PAEChromaKeyeriOS properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  uint64_t v2 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSChroma::TargetColor", 0, 0), 1, 0, 0.0, 0.75, 0.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSChroma::TargetColor HDR", 0, 0), 5, 0, 0.0, 0.75, 0.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSChroma::Tolerance", 0, 0), 2, 0, 0.1, 0.0, 0.5, 0.0, 0.5, 0.001);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSChroma::SpillLevel", 0, 0), 3, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.001);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"iOSChroma::Softness", 0, 0), 4, 0, 9.0, 0.0, 20.0, 0.0, 20.0, 0.1);
  }
  return 1;
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  uint64_t v8 = *(void *)&a4;
  v11 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v11, *(void *)&a5->var0, *(void *)&a5->var2, 28);
  int v12 = 0;
  uint64_t v13 = *((void *)v11 + 10);
  double v14 = 0.0;
  do
  {
    float v15 = v14 / 255.0;
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v15);
    v16 = (_DWORD *)*((void *)a6 + 15);
    float v17 = (float)(unint64_t)((uint64_t)(*((void *)a6 + 16) - (void)v16) >> 2);
    *(_DWORD *)uint64_t v13 = v18;
    float v19 = v17 + -1.0;
    uint64_t v20 = (uint64_t)rintf((float)(v17 + -1.0) * v15);
    if ((v20 & 0x8000000000000000) == 0)
    {
      if (v19 < (float)v20) {
        uint64_t v20 = (unint64_t)v19;
      }
      v16 += v20;
    }
    *(_DWORD *)(v13 + 4) = *v16;
    *(float *)(v13 + 8) = OMKeyer2D::getAlphaSatOffset((OMKeyer2D *)a6, v12);
    double v14 = v14 + 1.0;
    ++v12;
    v13 += 16;
  }
  while (v12 != 256);
  v21 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v21, *a5, v11);
  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache) {
    (*(void (**)(void *))(*(void *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  }
  v23 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v23, (HGBitmap *)v21);
  self->_lutsBitmapLoaderCache = v23;
  (*(void (**)(HGTexture *))(*(void *)v21 + 24))(v21);
  (*(void (**)(HGBitmap *))(*(void *)v11 + 24))(v11);
  v24 = self->_lutsBitmapLoaderCache;
  v25 = *(void (**)(void *, uint64_t, void *))(*(void *)a3 + 120);

  v25(a3, v8, v24);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v25[2] = *(double *)MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121B008];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  if (!v8) {
    return 0;
  }
  v11 = (void *)v10;
  if (a4)
  {
    [a4 heliumRef];
    uint64_t v22 = v23;
    if (v23)
    {
      (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
      uint64_t v21 = v23;
      (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v21 = 0;
LABEL_8:
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]
    && [a4 imageType] == 3)
  {
    uint64_t v20 = 0;
    uint64_t v19 = 0x3FF0000000000000;
    uint64_t v18 = 0x3FF0000000000000;
    [v9 getLevelsBlack:&v20 White:&v19 Gamma:&v18 fromParm:26 atTime:a5->var0.var1];
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    [v8 getRedValue:&v24 greenValue:&v24.f64[1] blueValue:v25 fromParm:1 atFxTime:a5->var0.var1];
    if ([v11 colorPrimaries] == 1)
    {
      [v8 getRedValue:&v24 greenValue:&v24.f64[1] blueValue:v25 fromParm:5 atFxTime:a5->var0.var1];
      float64x2_t v24 = vmulq_f64(v24, (float64x2_t)vdupq_n_s64(0x3FD1FA3F40000000uLL));
      v25[0] = v25[0] * 0.280898869;
    }
    [v8 getFloatValue:&v17 fromParm:2 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v16 fromParm:3 atFxTime:a5->var0.var1];
    [v8 getFloatValue:&v15 fromParm:4 atFxTime:a5->var0.var1];
    OMSamples::OMSamples((OMSamples *)v14);
  }
  BOOL v12 = 1;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
  }
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 24))(v22);
  }
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 24))(v23);
  }
  return v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end