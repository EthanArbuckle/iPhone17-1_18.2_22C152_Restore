@interface PAEWidescreen
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEWidescreen)initWithAPIManager:(id)a3;
- (id)properties;
@end

@implementation PAEWidescreen

- (PAEWidescreen)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEWidescreen;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEWidescreen;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Widescreen::Aspect Ratio", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"Widescreen::AspectEntries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Widescreen::Offset", 0, 0), 2, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Widescreen::Border Size", 0, 0), 3, 0, 0.0, 0.0, 10.0, 0.0, 10.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Widescreen::Border Color", 0, 0), 4, 0, 0.0, 0.0, 0.0, 1.0);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    double v10 = (double)[v9 versionAtCreation];
  }
  else {
    double v10 = 0.0;
  }
  uint64_t v54 = 0x3FF0000000000000;
  uint64_t v51 = 0x3FF0000000000000;
  *(void *)&v48[40] = 0x3FF0000000000000;
  *(void *)v48 = 0x3FF0000000000000;
  memset(&v48[8], 0, 32);
  float64x2_t v49 = 0u;
  long long v50 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v47 = 0x3FF0000000000000;
  uint64_t v44 = 0x3FF0000000000000;
  *(void *)&v41[40] = 0x3FF0000000000000;
  *(void *)v41 = 0x3FF0000000000000;
  memset(&v41[8], 0, 32);
  float64x2_t v42 = 0u;
  long long v43 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  if (v10 <= 0.0)
  {
    unint64_t v18 = [a4 width];
    unint64_t v19 = [a4 height];
    v20.f64[0] = (double)v18 * -0.5;
    PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v48, v20, (double)v19 * -0.5, 0.0);
    double var3 = a5->var3;
    double var4 = a5->var4;
    if (var3 != 1.0)
    {
      *(float64x2_t *)v48 = vmulq_n_f64(*(float64x2_t *)v48, var3);
      *(float64x2_t *)&v48[16] = vmulq_n_f64(*(float64x2_t *)&v48[16], var3);
    }
    if (var4 != 1.0)
    {
      *(float64x2_t *)&v48[32] = vmulq_n_f64(*(float64x2_t *)&v48[32], var4);
      float64x2_t v49 = vmulq_n_f64(v49, var4);
    }
    double v23 = 1.0 / var3;
    double v24 = 1.0 / var4;
    if (v23 != 1.0)
    {
      *(float64x2_t *)v41 = vmulq_n_f64(*(float64x2_t *)v41, v23);
      *(float64x2_t *)&v41[16] = vmulq_n_f64(*(float64x2_t *)&v41[16], v23);
    }
    if (v24 != 1.0)
    {
      *(float64x2_t *)&v41[32] = vmulq_n_f64(*(float64x2_t *)&v41[32], v24);
      float64x2_t v42 = vmulq_n_f64(v42, v24);
    }
    unint64_t v25 = [a4 width];
    unint64_t v26 = [a4 height];
    v27.f64[0] = (double)v25 * 0.5;
    *(void *)&long long v16 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v41, v27, (double)v26 * 0.5, 0.0);
  }
  else
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
    for (uint64_t i = 0; i != 16; i += 4)
    {
      v12 = &v41[i * 8];
      long long v13 = *(_OWORD *)&v40[i + 2];
      _OWORD *v12 = *(_OWORD *)&v40[i];
      v12[1] = v13;
    }
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
    for (uint64_t j = 0; j != 16; j += 4)
    {
      v15 = &v48[j * 8];
      long long v16 = *(_OWORD *)&v40[j];
      long long v17 = *(_OWORD *)&v40[j + 2];
      _OWORD *v15 = v16;
      v15[1] = v17;
    }
  }
  objc_msgSend(a3, "bounds", *(double *)&v16);
  [a4 bounds];
  v28 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v28)
  {
    v29 = v28;
    int v39 = 0;
    v40[0] = 0;
    double v37 = 0.0;
    double v38 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    double v34 = 0.0;
    [v28 getIntValue:&v39 fromParm:1 atFxTime:a5->var0.var1];
    [v29 getFloatValue:v40 fromParm:2 atFxTime:a5->var0.var1];
    [v29 getFloatValue:&v38 fromParm:3 atFxTime:a5->var0.var1];
    [v29 getRedValue:&v37 greenValue:&v36 blueValue:&v35 alphaValue:&v34 fromParm:4 atFxTime:a5->var0.var1];
    double v36 = v34 * v36;
    double v37 = v34 * v37;
    double v35 = v34 * v35;
    double v30 = v38;
    if (v38 != 0.0)
    {
      float v31 = v38;
      double v30 = (float)(v31 / 100.0);
    }
    LODWORD(v28) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1, v30);
    if (v28)
    {
      if ([a4 imageType] == 3)
      {
        if (a4) {
          [a4 heliumRef];
        }
        v32 = (HWideScreen *)HGObject::operator new(0x1A0uLL);
        HWideScreen::HWideScreen(v32);
      }
      LOBYTE(v28) = 0;
    }
  }
  return (char)v28;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 1;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end