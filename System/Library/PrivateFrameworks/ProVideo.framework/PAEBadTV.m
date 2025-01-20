@interface PAEBadTV
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)variesOverTime;
- (PAEBadTV)initWithAPIManager:(id)a3;
- (id)properties;
- (void)createWavyTableOfHeight:(int)a3 rowBytes:(unint64_t)a4 table:(char *)a5 flip:(BOOL)a6 atTime:(id)a7;
- (void)dealloc;
@end

@implementation PAEBadTV

- (PAEBadTV)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEBadTV;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAEBadTV;
  [(PAESharedDefaultBase *)&v2 dealloc];
}

- (id)properties
{
  objc_super v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:0];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"PreservesAlpha", v6, @"SupportsLargeRenderScale", v7, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PAEBadTV;
  [(PAESharedDefaultBase *)&v10 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v4)
  {
    int v5 = [v4 versionAtCreation];
    if (!v3) {
      return v3 != 0;
    }
  }
  else
  {
    int v5 = 0;
    if (!v3) {
      return v3 != 0;
    }
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::Waviness", 0, 0), 1, 0, 10.0, 0.0, 200.0, 0.0, 200.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::Roll", 0, 0), 2, 0, 45.0, -1000.0, 1000.0, -100.0, 100.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::Static", 0, 0), 3, 0, 0.1, 0.0, 4.0, 0.0, 1.0, 0.1);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::ColorSync", 0, 0), 4, 0, 0.8, 0.0, 1.0, 0.0, 1.0, 0.1);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::Saturation", 0, 0), 5, 0, -25.0, -100.0, 100.0, -100.0, 100.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::ScanLineBrightness", 0, 0), 6, 0, 1.5, 0.0, 5.0, 0.0, 5.0, 0.1);
  if (v5)
  {
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::ScanLinePercentage", 0, 0), 9, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::NumScanLines", 0, 0), 10, 0, 100.0, 1.0, 10000.0, 1.0, 1080.0, 1.0);
  }
  else
  {
    LODWORD(v8) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::ScanLineThickness", 0, 0), 7, 2, 0, 100, 0, 0x100000064, v8);
    LODWORD(v9) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", @"BadTV::ScanLineDistance", 0, 0), 8, 1, 1, 100, 1, 0x100000064, v9);
  }
  return v3 != 0;
}

- (void)createWavyTableOfHeight:(int)a3 rowBytes:(unint64_t)a4 table:(char *)a5 flip:(BOOL)a6 atTime:(id)a7
{
  BOOL v8 = a6;
  std::vector<float>::vector(v41, a3);
  RandMersenne::RandMersenne((RandMersenne *)&v38);
  [(PAESharedDefaultBase *)self frameFromFxTime:a7.var1 forPlugIn:self];
  RandMersenne::SetSeed((RandMersenne *)&v38, (v13 + v13) + 1);
  int v14 = v40;
  if (v40 >= 382)
  {
    dsfmt_gen_rand_all((uint64_t)v39);
    int v14 = 0;
  }
  int v15 = v14 + 1;
  int v40 = v14 + 1;
  float v16 = (float)(a3 + 1);
  float v17 = (float)~a3;
  float v18 = *(double *)&v39[v14] + -1.0;
  v19 = (float *)v41[0];
  *(float *)v41[0] = v18;
  if (a3 > 1)
  {
    uint64_t v20 = 1;
    do
    {
      if (v15 >= 382)
      {
        dsfmt_gen_rand_all((uint64_t)v39);
        int v15 = 0;
        v19 = (float *)v41[0];
      }
      double v21 = *(double *)&v39[v15++];
      int v40 = v15;
      *(float *)&double v21 = v21 + -1.0;
      float v18 = v18 + (float)(*(float *)&v21 + -0.5);
      v19[v20] = v18;
      if (v18 >= v16)
      {
        if (v18 > v17) {
          float v17 = v18;
        }
      }
      else
      {
        float v16 = v18;
      }
      ++v20;
    }
    while (a3 != v20);
  }
  float v22 = fabsf(v16);
  float v23 = fabsf(v17);
  if (v23 > v22) {
    float v22 = v23;
  }
  if (a3 >= 1)
  {
    float v24 = v22 + v22;
    uint64_t v25 = a3;
    v26 = v19;
    do
    {
      float *v26 = (float)(*v26 / v24) + 0.5;
      ++v26;
      --v25;
    }
    while (v25);
  }
  unint64_t v27 = (a3 - 1) * a4;
  if (v8)
  {
    unint64_t v28 = -(uint64_t)a4;
  }
  else
  {
    unint64_t v27 = 0;
    unint64_t v28 = a4;
  }
  v29 = &a5[v27];
  uint64_t v30 = (a3 - 1);
  if (a3 == 1)
  {
    char *v29 = -1;
    float v31 = *v19;
  }
  else
  {
    float v32 = *v19 + v19[1];
    char *v29 = -1;
    v29[1] = (int)(float)((float)(v32 * 255.0) * 0.5);
    *((_WORD *)v29 + 1) = 0;
    if (a3 < 3) {
      goto LABEL_27;
    }
    v29 += v28;
    uint64_t v33 = v30 - 1;
    v34 = v19 + 2;
    do
    {
      float v35 = *(v34 - 2);
      float v36 = *(v34 - 1);
      float v37 = *v34++;
      char *v29 = -1;
      v29[1] = (int)(float)((float)((float)((float)(v35 + v36) + v37) * 255.0) / 3.0);
      *((_WORD *)v29 + 1) = 0;
      v29 += v28;
      --v33;
    }
    while (v33);
    float v31 = v19[a3 - 2] + v19[v30];
    char *v29 = -1;
  }
  v29[1] = (int)(float)((float)(v31 * 255.0) * 0.5);
  *((_WORD *)v29 + 1) = 0;
LABEL_27:
  RandMersenne::~RandMersenne((RandMersenne *)&v38);
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v57 = 0;
  memset(&v56[16], 0, 64);
  if (a4) {
    [a4 imageInfo];
  }
  if (self)
  {
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getImageBoundary:a4];
    float32x2_t v9 = *(float32x2_t *)&v44[0];
    float32x2_t v10 = *(float32x2_t *)&v44[1];
  }
  else
  {
    float32x2_t v9 = 0;
    memset(v56, 0, 256);
    float32x2_t v10 = 0;
  }
  v55[0] = vcvtq_f64_f32(v9);
  v55[1] = vcvtq_f64_f32(v10);
  int v11 = PCMatrix44Tmpl<double>::transformRect<double>((double *)v56, (double *)v55, (uint64_t)v55);
  if (v11)
  {
    uint64_t v12 = [a4 width];
    uint64_t v13 = [a4 height];
    int v14 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
    int v15 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
    uint64_t v16 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v18 = v17 || v16 == 0;
    char v19 = v18;
    if (!v18)
    {
      uint64_t v20 = (void *)v16;
      unint64_t v41 = v13;
      unint64_t v42 = v12;
      char v43 = v19;
      int v21 = [v15 versionAtCreation];
      uint64_t v54 = 0;
      [v14 getFloatValue:&v54 fromParm:1 atFxTime:a5->var0.var1];
      uint64_t v22 = HGRectMake4i(0, 0, 1u, 0x438u);
      uint64_t v24 = v23;
      uint64_t v25 = (HGBitmap *)HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v25, v22, v24, 22);
      if (*((void *)v25 + 10))
      {
        -[PAEBadTV createWavyTableOfHeight:rowBytes:table:flip:atTime:](self, "createWavyTableOfHeight:rowBytes:table:flip:atTime:", 1080, *((void *)v25 + 8));
        double v53 = 0.0;
        [v14 getFloatValue:&v53 fromParm:2 atFxTime:a5->var0.var1];
        double v52 = 1.0;
        [v14 getFloatValue:&v52 fromParm:5 atFxTime:a5->var0.var1];
        double v52 = v52 / 100.0 + 1.0;
        uint64_t v51 = 0x3FF0000000000000;
        [v14 getFloatValue:&v51 fromParm:6 atFxTime:a5->var0.var1];
        double v50 = 1.0;
        var1 = a5->var0.var1;
        if (v21)
        {
          [v14 getFloatValue:&v50 fromParm:9 atFxTime:var1];
          double v49 = 1.0;
          v44[0] = 0.0;
          [v14 getFloatValue:v44 fromParm:10 atFxTime:a5->var0.var1];
          unint64_t v28 = v41;
          unint64_t v27 = v42;
          double v29 = v44[0];
          if (v44[0] == 0.0) {
            v44[0] = 1.0;
          }
          unint64_t v30 = objc_msgSend(a4, "height", v29);
          double v31 = (double)v30 / v44[0];
          double v49 = v31 - v31 * v50;
          double v50 = v31 * v50;
        }
        else
        {
          [v14 getFloatValue:&v50 fromParm:7 atFxTime:var1];
          double v49 = 1.0;
          [v14 getFloatValue:&v49 fromParm:8 atFxTime:a5->var0.var1];
          unint64_t v28 = v41;
          unint64_t v27 = v42;
        }
        double v48 = 1.0;
        [v14 getFloatValue:&v48 fromParm:4 atFxTime:a5->var0.var1];
        double v48 = (1.0 - v48) * 10.0;
        double v47 = 0.0;
        [v14 getFloatValue:&v47 fromParm:3 atFxTime:a5->var0.var1];
        double v32 = v47;
        if (v47 > 0.0)
        {
          -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v47);
          [(PAESharedDefaultBase *)self frameFromFxTime:a5->var0.var1 forPlugIn:self];
          PAEGenerateNoise(v47, v33, (int)(float)v27, (int)(float)v28, 0, 0, 1, 0);
        }
        if (a4)
        {
          objc_msgSend(a4, "heliumRef", v47);
          double v45 = v46;
          if (v46 != 0.0) {
            (*(void (**)(double))(**(void **)&v46 + 16))(COERCE_DOUBLE(*(void *)&v46));
          }
        }
        else
        {
          double v45 = 0.0;
          double v46 = 0.0;
        }
        -[PAESharedDefaultBase changeDOD:withRect:](self, "changeDOD:withRect:", &v45, v55, v32);
        double v34 = v44[0];
        if (*(void *)&v46 == *(void *)&v44[0])
        {
          if (v46 != 0.0) {
            (*(void (**)(void))(**(void **)&v46 + 24))();
          }
        }
        else
        {
          if (v46 != 0.0)
          {
            (*(void (**)(void))(**(void **)&v46 + 24))();
            double v34 = v44[0];
          }
          double v46 = v34;
          v44[0] = 0.0;
        }
        if (v45 != 0.0) {
          (*(void (**)(double))(**(void **)&v45 + 24))(COERCE_DOUBLE(*(void *)&v45));
        }
        float v35 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
        HGBitmapLoader::HGBitmapLoader(v35, v25);
        [a4 height];
        [a4 width];
        double v53 = fmod(v53 * 1080.0 / 100.0, 1080.0);
        objc_msgSend((id)objc_msgSend(v20, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
        float v36 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v36);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v36, (const char *)3, v37);
        (*(void (**)(HGTextureWrap *, void, double))(*(void *)v36 + 120))(v36, 0, COERCE_DOUBLE(*(void *)&v46));
        if (v47 > 0.0)
        {
          uint64_t v38 = (HgcBadTVNoise *)HGObject::operator new(0x1B0uLL);
          HgcBadTVNoise::HgcBadTVNoise(v38);
        }
        v39 = (HgcBadTV *)HGObject::operator new(0x1B0uLL);
        HgcBadTV::HgcBadTV(v39);
      }
      (*(void (**)(HGBitmap *))(*(void *)v25 + 24))(v25);
      char v19 = v43;
    }
    LOBYTE(v11) = v19 ^ 1;
  }
  return v11;
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