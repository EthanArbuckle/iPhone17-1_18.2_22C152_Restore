@interface PAEEarthquake
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)variesOverTime;
- (HGRef<HGNode>)quakeHeliumNodeWithInputImage:(HGRef<HGNode>)a3 inputImage:(id)a4 outputImage:(id)a5 renderInfo:(id *)a6 twist:(float)a7 horizontalShake:(float)a8 verticalShake:(float)a9 layers:(float)a10 centerX:(float)a11 centerY:(float)a12 randomSeed:(int)a13;
- (PAEEarthquake)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEEarthquake

- (PAEEarthquake)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEEarthquake;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
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
  v8.receiver = self;
  v8.super_class = (Class)PAEEarthquake;
  [(PAESharedDefaultBase *)&v8 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::Twist", 0, 0), 1, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::Horizontal Shake", 0, 0), 2, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::Vertical Shake", 0, 0), 3, 0, 0.1, 0.0, 10.0, 0.0, 1.0, 0.01);
    LODWORD(v6) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::Layers", 0, 0), 4, 1, 1, 8, 1, 0x100000008, v6);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::Center", 0, 0), 5, 0, 0.5, 0.5);
    LODWORD(v7) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Earthquake::RandomSeed", 0, 0), 6, 0, 2294967296, 2000000000, 0, 0x1000003E8, v7);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  v10 = v9;
  if (v9)
  {
    double v38 = 0.0;
    [v9 getFloatValue:&v38 fromParm:1 atFxTime:a5->var0.var1];
    double v37 = 0.0;
    [v10 getFloatValue:&v37 fromParm:2 atFxTime:a5->var0.var1];
    double v36 = 0.0;
    [v10 getFloatValue:&v36 fromParm:3 atFxTime:a5->var0.var1];
    int v35 = 0;
    [v10 getIntValue:&v35 fromParm:4 atFxTime:a5->var0.var1];
    double v33 = 0.0;
    double v34 = 0.0;
    [v10 getXValue:&v34 YValue:&v33 fromParm:5 atFxTime:a5->var0.var1];
    unsigned int v32 = 0;
    [v10 getIntValue:&v32 fromParm:6 atFxTime:a5->var0.var1];
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    if (a4)
    {
      [a4 imageInfo];
      if (*((void *)&v29 + 1)) {
        double v38 = -v38;
      }
    }
    uint64_t v11 = [a4 imageType];
    if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]) {
      BOOL v12 = v11 == 3;
    }
    else {
      BOOL v12 = 0;
    }
    LOBYTE(v10) = v12;
    if (v12)
    {
      [a4 bounds];
      double v16 = (v34 + -0.5) * v15;
      double v18 = v17 * (v33 + -0.5);
      double v33 = v18;
      double v34 = v16;
      if (a4)
      {
        [a4 heliumRef];
        double v18 = v33;
        double v16 = v34;
      }
      else
      {
        uint64_t v25 = 0;
      }
      long long v19 = *(_OWORD *)&a5->var2;
      v23[0] = *(_OWORD *)&a5->var0.var0;
      v23[1] = v19;
      long long v24 = *(_OWORD *)&a5->var4;
      HIDWORD(v20) = DWORD1(v24);
      *(float *)&double v14 = v18;
      *(float *)&double v13 = v16;
      *(float *)&long long v19 = (float)v35;
      *(float *)&double v20 = v36;
      *(float *)&double v18 = v37;
      HIDWORD(v21) = HIDWORD(v38);
      *(float *)&double v21 = v38;
      [(PAEEarthquake *)self quakeHeliumNodeWithInputImage:&v25 inputImage:a4 outputImage:a3 renderInfo:v23 twist:v32 horizontalShake:v21 verticalShake:v18 layers:v20 centerX:*(double *)&v19 centerY:v13 randomSeed:v14];
      if (v25) {
        (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
      }
      [a3 setHeliumRef:&v26];
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
      }
    }
  }
  return (char)v10;
}

- (HGRef<HGNode>)quakeHeliumNodeWithInputImage:(HGRef<HGNode>)a3 inputImage:(id)a4 outputImage:(id)a5 renderInfo:(id *)a6 twist:(float)a7 horizontalShake:(float)a8 verticalShake:(float)a9 layers:(float)a10 centerX:(float)a11 centerY:(float)a12 randomSeed:(int)a13
{
  v51 = v13;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (double *)objc_msgSend((id)objc_msgSend(a4, "pixelTransform"), "matrix");
  uint64_t v26 = (double *)objc_msgSend((id)objc_msgSend(a4, "inversePixelTransform"), "matrix");
  long long v27 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121DA70];
  unint64_t v28 = [v27 timelineFpsNumeratorForEffect:self];
  unint64_t v29 = [v27 timelineFpsDenominatorForEffect:self];
  CMTimeEpoch v30 = *((void *)a6->var0.var1 + 2);
  *(_OWORD *)&time.value = *(_OWORD *)a6->var0.var1;
  time.epoch = v30;
  unint64_t v31 = a13 + 2302755 + (int)(CMTimeGetSeconds(&time) / ((double)v28 / (double)v29) * 1000.0);
  for (uint64_t i = 1; i != 102; ++i)
  {
    unint64_t v31 = ((v31 << 12) + 150889) % 0xAE529;
    v55[i] = v31;
  }
  unint64_t v33 = ((v31 << 12) + 150889) % 0xAE529u;
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  memset(v56, 0, sizeof(v56));
  if (a10 > 0.0)
  {
    uint64_t v34 = 0;
    do
    {
      *((float *)v59 + v34) = 1.0 / a10;
      unint64_t v36 = v33 % 0x65;
      unint64_t v37 = v55[v36 + 1];
      v55[v36 + 1] = ((v37 << 12) + 150889) % 0xAE529;
      float v35 = a7 * 0.1;
      *((float *)v58 + v34) = (float)((float)(v35 + v35) * (float)((float)v37 / 714020.0)) - v35;
      unint64_t v38 = v37 % 0x65;
      unint64_t v39 = v55[v37 % 0x65 + 1];
      v55[v38 + 1] = ((v39 << 12) + 150889) % 0xAE529;
      *((float *)v57 + v34) = (float)((float)((float)(a8 * 25.0) + (float)(a8 * 25.0)) * (float)((float)v39 / 714020.0))
                            - (float)(a8 * 25.0);
      v39 %= 0x65uLL;
      unint64_t v33 = v55[v39 + 1];
      v55[v39 + 1] = ((v33 << 12) + 150889) % 0xAE529;
      *((float *)v56 + v34++) = (float)((float)((float)(a9 * 25.0) + (float)(a9 * 25.0)) * (float)((float)v33 / 714020.0))
                              - (float)(a9 * 25.0);
    }
    while ((float)(int)v34 < a10);
  }
  v55[0] = v33;
  if (a10 == 1.0)
  {
    HGTransform::HGTransform((HGTransform *)v53);
    HGTransform::LoadMatrixd((HGTransform *)v53, v26);
    HGTransform::Transpose((HGTransform *)v53);
    HGTransform::Translate((HGTransform *)v53, (float)-a11, (float)-a12, 0.0);
    HGTransform::Rotate((HGTransform *)v53, *(float *)v58 * 57.2957795, 0.0, 0.0, 1.0);
    HGTransform::Translate((HGTransform *)v53, (float)-*(float *)v57, (float)-*(float *)v56, 0.0);
    HGTransform::Translate((HGTransform *)v53, a11, a12, 0.0);
    HGTransform::HGTransform((HGTransform *)v52);
    HGTransform::LoadMatrixd((HGTransform *)v52, v25);
    HGTransform::Transpose((HGTransform *)v52);
    HGTransform::Multiply(v53, v52);
    v40 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v40);
    (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v40 + 576))(v40, v53);
    (*(void (**)(HGXForm *))(*(void *)v40 + 16))(v40);
    (*(void (**)(HGXForm *))(*(void *)v40 + 24))(v40);
    HGTransform::~HGTransform((HGTransform *)v52);
    HGTransform::~HGTransform((HGTransform *)v53);
  }
  else
  {
    uint64_t v41 = HGMultiTexBlendBase::create((HGMultiTexBlendBase *)(int)a10);
    v40 = (HGXForm *)v41;
    if (a10 <= 0.0)
    {
      if (!v41) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v43 = 0;
      double v44 = (float)-a11;
      double v45 = (float)-a12;
      double v46 = a11;
      double v47 = a12;
      do
      {
        HGTransform::HGTransform((HGTransform *)v53);
        HGTransform::LoadMatrixd((HGTransform *)v53, v26);
        HGTransform::Transpose((HGTransform *)v53);
        HGTransform::Translate((HGTransform *)v53, v44, v45, 0.0);
        HGTransform::Rotate((HGTransform *)v53, *((float *)v58 + v43) * 57.2957795, 0.0, 0.0, 1.0);
        HGTransform::Translate((HGTransform *)v53, (float)-*((float *)v57 + v43), (float)-*((float *)v56 + v43), 0.0);
        HGTransform::Translate((HGTransform *)v53, v46, v47, 0.0);
        HGTransform::HGTransform((HGTransform *)v52);
        HGTransform::LoadMatrixd((HGTransform *)v52, v25);
        HGTransform::Transpose((HGTransform *)v52);
        float64x2_t v48 = HGTransform::Multiply(v53, v52);
        (*(void (**)(HGXForm *, uint64_t, float64x2_t *, float64x2_t))(*(void *)v40 + 576))(v40, v43, v53, v48);
        (*(void (**)(HGXForm *, uint64_t, float))(*(void *)v40 + 584))(v40, v43, *((float *)v59 + v43));
        HGTransform::~HGTransform((HGTransform *)v52);
        HGTransform::~HGTransform((HGTransform *)v53);
        v42.n128_f32[0] = (float)(int)++v43;
      }
      while ((float)(int)v43 < a10);
    }
    (*(void (**)(HGXForm *, __n128))(*(void *)v40 + 16))(v40, v42);
    (*(void (**)(HGXForm *))(*(void *)v40 + 24))(v40);
  }
LABEL_14:
  (*(void (**)(HGXForm *, void, void))(*(void *)v40 + 120))(v40, 0, *(void *)a3.var0);
  *v51 = v40;
  (*(void (**)(HGXForm *))(*(void *)v40 + 16))(v40);
  [(PAESharedDefaultBase *)self crop:v51 fromImage:a4 toImage:a5];
  return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(void *)v40 + 24))(v40);
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