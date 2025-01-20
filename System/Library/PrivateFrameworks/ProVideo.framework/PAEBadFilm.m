@interface PAEBadFilm
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)variesOverTime;
- (PAEBadFilm)initWithAPIManager:(id)a3;
- (double)autoRandomize:(double)a3 withVariance:(double)a4 andFrequency:(int)a5 atTime:(id)a6 randCount:(int *)a7;
- (id).cxx_construct;
- (id)properties;
- (void)createDust:(int)a3 scratches:(int)a4 scratchColor:(double *)a5 hair:(int)a6 randomSeed:(int)a7 autoRandFreq:(int)a8 buffer:(void *)a9 atTime:(id)a10 pixelTransform:(const void *)a11;
- (void)dealloc;
- (void)getBrightness:(double *)a3 saturation:(double *)a4 dust:(int *)a5 scratches:(int *)a6 scratchColor:(double *)a7 hair:(int *)a8 randomSeed:(int *)a9 jitter:(double *)a10 focus:(double *)a11 grain:(double *)a12 autoRandFreq:(int *)a13 withParmsAPI:(id)a14 atTime:(id)a15;
- (void)setupScratchArrayWithAutoRandomizeFrequency:(int)a3 andSeed:(int)a4 withWidth:(int)a5 andHeight:(int)a6 atTime:(id)a7;
@end

@implementation PAEBadFilm

- (PAEBadFilm)initWithAPIManager:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PAEBadFilm;
  v4 = -[PAESharedDefaultBase initWithAPIManager:](&v8, sel_initWithAPIManager_);
  v5 = v4;
  if (v4)
  {
    v4->_cachedSeed = 0;
    v4->_scratches = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:25];
    v6 = [[PAEEarthquake alloc] initWithAPIManager:a3];
    v5->_jitterer = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  self->_jitterer = 0;
  v3.receiver = self;
  v3.super_class = (Class)PAEBadFilm;
  [(PAESharedDefaultBase *)&v3 dealloc];
}

- (id)properties
{
  if (-[PAEBadFilm properties]::once != -1) {
    dispatch_once(&-[PAEBadFilm properties]::once, &__block_literal_global_45);
  }
  return (id)-[PAEBadFilm properties]::sPropertiesDict;
}

uint64_t __24__PAEBadFilm_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:0];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, @"MayRemapTime", v2, @"SupportsHeliumRendering", v3, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
  -[PAEBadFilm properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  v11.receiver = self;
  v11.super_class = (Class)PAEBadFilm;
  [(PAESharedDefaultBase *)&v11 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Focus", 0, 0), 1, 0, 0.0, 0.0, 600.0, 0.0, 64.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::FocusVariance", 0, 0), 2, 0, 1.0, 0.0, 100.0, 0.0, 100.0, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Brightness", 0, 0), 3, 0, 1.0, 0.0, 100.0, 0.0, 5.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::BrightnessVariance", 0, 0), 4, 0, 0.34, 0.0, 2.5, 0.0, 2.5, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Saturation", 0, 0), 5, 0, -50.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::SaturationVariance", 0, 0), 6, 0, 5.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    LODWORD(v6) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Scratches", 0, 0), 7, 1, 0, 25, 0, 0x100000019, v6);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::ScratchColor", 0, 0), 15, 0, 1.0, 1.0, 1.0, 0.25);
    LODWORD(v7) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Hairs", 0, 0), 8, 1, 0, 10, 0, 0x10000000ALL, v7);
    LODWORD(v8) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Dust", 0, 0), 9, 4, 0, 100, 0, 0x100000064, v8);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Jitter", 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::JitterVariance", 0, 0), 11, 0, 0.05, 0.0, 0.5, 0.0, 0.5, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::Grain", 0, 0), 12, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    LODWORD(v9) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::AutoRandomFreq", 0, 0), 13, 3, 0, 1000, 0, 0x100000064, v9);
    LODWORD(v10) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"BadFilm::RandomSeed", 0, 0), 14, 25, 2294967296, 2000000000, 0, 0x1000003E8, v10);
  }
  return v3 != 0;
}

- (void)getBrightness:(double *)a3 saturation:(double *)a4 dust:(int *)a5 scratches:(int *)a6 scratchColor:(double *)a7 hair:(int *)a8 randomSeed:(int *)a9 jitter:(double *)a10 focus:(double *)a11 grain:(double *)a12 autoRandFreq:(int *)a13 withParmsAPI:(id)a14 atTime:(id)a15
{
  [a14 getFloatValue:a3 fromParm:3 atFxTime:a15.var1];
  [a14 getFloatValue:a4 fromParm:5 atFxTime:a15.var1];
  [a14 getIntValue:a5 fromParm:9 atFxTime:a15.var1];
  [a14 getIntValue:a6 fromParm:7 atFxTime:a15.var1];
  [a14 getRedValue:a7 greenValue:a7 + 1 blueValue:a7 + 2 alphaValue:a7 + 3 fromParm:15 atFxTime:a15.var1];
  [a14 getIntValue:a8 fromParm:8 atFxTime:a15.var1];
  [a14 getIntValue:a9 fromParm:14 atFxTime:a15.var1];
  [a14 getFloatValue:a10 fromParm:10 atFxTime:a15.var1];
  [a14 getFloatValue:a11 fromParm:1 atFxTime:a15.var1];
  [a14 getFloatValue:a12 fromParm:12 atFxTime:a15.var1];
  double v33 = 0.0;
  double v34 = 0.0;
  double v31 = 0.0;
  double v32 = 0.0;
  [a14 getIntValue:a13 fromParm:13 atFxTime:a15.var1];
  if (*a13)
  {
    int v30 = 0;
    [a14 getFloatValue:&v34 fromParm:2 atFxTime:a15.var1];
    [(PAEBadFilm *)self autoRandomize:*a13 withVariance:a15.var1 andFrequency:&v30 atTime:*a11 randCount:v34];
    *a11 = fabs(v19);
    [a14 getFloatValue:&v33 fromParm:4 atFxTime:a15.var1];
    [(PAEBadFilm *)self autoRandomize:*a13 withVariance:a15.var1 andFrequency:&v30 atTime:*a3 randCount:v33];
    *a3 = fabs(v20);
    [a14 getFloatValue:&v32 fromParm:6 atFxTime:a15.var1];
    [(PAEBadFilm *)self autoRandomize:*a13 withVariance:a15.var1 andFrequency:&v30 atTime:*a4 randCount:v32];
    *(void *)a4 = v21;
    [a14 getFloatValue:&v31 fromParm:11 atFxTime:a15.var1];
    [(PAEBadFilm *)self autoRandomize:*a13 withVariance:a15.var1 andFrequency:&v30 atTime:*a10 randCount:v31];
    *a10 = fabs(v22);
  }
  double v23 = *a4 / 100.0 + 1.0;
  double v24 = 2.0;
  if (v23 <= 2.0) {
    double v24 = *a4 / 100.0 + 1.0;
  }
  BOOL v25 = v23 < 0.0;
  double v26 = 0.0;
  if (!v25) {
    double v26 = v24;
  }
  *a4 = v26;
}

- (double)autoRandomize:(double)a3 withVariance:(double)a4 andFrequency:(int)a5 atTime:(id)a6 randCount:(int *)a7
{
  [(PAESharedDefaultBase *)self frameFromFxTime:a6.var1 forPlugIn:self];
  double v12 = v11 + v11;
  RandMersenne::RandMersenne((RandMersenne *)v19);
  RandMersenne::SetSeed((RandMersenne *)v19, (unint64_t)v12);
  int v13 = *a7;
  if (*a7 <= 0)
  {
    int v15 = v21;
  }
  else
  {
    int v14 = 0;
    int v15 = v21;
    do
    {
      if (v15 >= 382)
      {
        dsfmt_gen_rand_all((uint64_t)v20);
        int v15 = 0;
        int v13 = *a7;
      }
      int v21 = ++v15;
      ++v14;
    }
    while (v14 < v13);
  }
  if (v15 >= 382)
  {
    dsfmt_gen_rand_all((uint64_t)v20);
    int v15 = 0;
  }
  int v16 = v15 + 1;
  int v21 = v15 + 1;
  if (!(int)((*(double *)&v20[v15] + -1.0) * (double)a5))
  {
    if (v15 >= 381)
    {
      dsfmt_gen_rand_all((uint64_t)v20);
      int v16 = 0;
    }
    int v21 = v16 + 1;
    double v17 = *(double *)&v20[v16] + -1.0 + -0.5;
    a3 = (v17 + v17) * a4 + a3;
  }
  ++*a7;
  RandMersenne::~RandMersenne((RandMersenne *)v19);
  return a3;
}

- (void)setupScratchArrayWithAutoRandomizeFrequency:(int)a3 andSeed:(int)a4 withWidth:(int)a5 andHeight:(int)a6 atTime:(id)a7
{
  RandMersenne::RandMersenne((RandMersenne *)v29);
  if (a3)
  {
    [(PAESharedDefaultBase *)self frameFromFxTime:a7.var1 forPlugIn:self];
    double v13 = RandMersenne::SetSeed((RandMersenne *)v29, (unint64_t)(v12 + v12) + 1);
  }
  else
  {
    double v13 = RandMersenne::SetSeed((RandMersenne *)v29, a4);
  }
  [(NSMutableArray *)self->_scratches removeAllObjects];
  double v14 = (float)a6;
  int v15 = 25;
  do
  {
    uint64_t v16 = v31;
    if (v31 < 382)
    {
      int v17 = ++v31;
      double v18 = v30[v16];
      if (v16 == 381)
      {
        dsfmt_gen_rand_all((uint64_t)v30);
        int v17 = 0;
      }
    }
    else
    {
      dsfmt_gen_rand_all((uint64_t)v30);
      int v17 = 1;
      double v18 = v30[0];
    }
    int v31 = v17 + 1;
    double v19 = v30[v17];
    if (v17 < 381)
    {
      int v20 = v17 + 2;
      int v31 = v17 + 2;
      double v21 = v30[v17 + 1];
      if (v17 == 380)
      {
        dsfmt_gen_rand_all((uint64_t)v30);
        int v20 = 0;
      }
    }
    else
    {
      dsfmt_gen_rand_all((uint64_t)v30);
      int v20 = 1;
      double v21 = v30[0];
    }
    int v31 = v20 + 1;
    double v22 = v30[v20];
    double v23 = [PAEScratchVector alloc];
    double v24 = v18 + -1.0;
    *(float *)&double v24 = v18 + -1.0;
    double v25 = (v19 + -1.0) * v14 * 600.0;
    *(float *)&double v25 = v25;
    double v26 = v21 + -1.0;
    *(float *)&double v26 = v21 + -1.0;
    double v27 = (v22 + -1.0) * v14 * 600.0;
    *(float *)&double v27 = v27;
    v28 = [(PAEScratchVector *)v23 initWithStartLocationX:v24 andY:v25 andEndLocationX:v26 andY:v27];
    [(NSMutableArray *)self->_scratches addObject:v28];

    --v15;
  }
  while (v15);
  RandMersenne::~RandMersenne((RandMersenne *)v29);
}

- (void)createDust:(int)a3 scratches:(int)a4 scratchColor:(double *)a5 hair:(int)a6 randomSeed:(int)a7 autoRandFreq:(int)a8 buffer:(void *)a9 atTime:(id)a10 pixelTransform:(const void *)a11
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    double v18 = DeviceRGB;
    size_t v19 = *((int *)a9 + 7) - (uint64_t)*((int *)a9 + 5);
    size_t v20 = *((int *)a9 + 8) - (uint64_t)*((int *)a9 + 6);
    CGContextRef v21 = CGBitmapContextCreate(*((void **)a9 + 10), v19, v20, 8uLL, *((void *)a9 + 8), DeviceRGB, 2u);
    if (v21)
    {
      double v22 = v21;
      v92 = a5;
      int v96 = a4;
      memset(components, 0, sizeof(components));
      double v23 = CGColorCreate(v18, (const CGFloat *)components);
      CGContextSaveGState(v22);
      CGContextSetBlendMode(v22, kCGBlendModeCopy);
      CGContextSetFillColorWithColor(v22, v23);
      v112.size.width = (double)(int)v19;
      v112.size.height = (double)(int)v20;
      v112.origin.x = 0.0;
      v112.origin.y = 0.0;
      double v99 = (double)(int)v19;
      double v100 = (double)(int)v20;
      CGContextFillRect(v22, v112);
      CGContextRestoreGState(v22);
      RandMersenne::RandMersenne((RandMersenne *)v107);
      color = v23;
      unsigned int v97 = a8;
      uint64_t v95 = v12;
      size_t v94 = v19;
      if (a8)
      {
        [(PAESharedDefaultBase *)self frameFromFxTime:a10.var1 forPlugIn:self];
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v24 + v24) + 1);
        int v25 = v109;
        if (v109 >= 382)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          int v25 = 0;
        }
        int v109 = v25 + 1;
        if (a3 >= 1 && !(int)((v108[v25] + -1.0) * (double)a8))
        {
          CGContextSetLineWidth(v22, 1.0);
          int v26 = 0;
          double v98 = (float)(int)v19;
          do
          {
            int v27 = v109;
            if (v109 > 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v27 = 0;
            }
            int v28 = v27 + 1;
            int v109 = v27 + 1;
            double v29 = v108[v27];
            if (v27 >= 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v28 = 0;
            }
            int v109 = v28 + 1;
            double v30 = v108[v28];
            if (v28 < 381)
            {
              int v33 = v28 + 2;
              int v109 = v28 + 2;
              double v31 = v108[v28 + 1];
              double v34 = *(double *)a11;
              if (v28 == 380)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                int v33 = 0;
              }
              double v32 = *(double *)a11;
            }
            else
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              double v31 = v108[0];
              double v32 = *(double *)a11;
              int v33 = 1;
              double v34 = *(double *)a11;
            }
            int v109 = v33 + 1;
            float v35 = v34 * (v31 + -1.0);
            float v36 = (v108[v33] + -1.0) * 0.75 + 0.25;
            CGContextSetRGBStrokeColor(v22, v35, v35, v35, v32 * v36);
            float v37 = (v29 + -1.0) * v98;
            float v38 = (v30 + -1.0) * (float)(int)v20;
            CGContextMoveToPoint(v22, v37, v38);
            int v39 = v109;
            if (v109 >= 382)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v39 = 0;
            }
            double v40 = v108[v39];
            int v109 = v39 + 1;
            int v41 = (int)((v40 + -1.0) * 11.0);
            if (v41 >= 1)
            {
              do
              {
                uint64_t v42 = v109;
                if (v109 < 382)
                {
                  int v44 = ++v109;
                  double v43 = v108[v42];
                  if (v42 == 381)
                  {
                    dsfmt_gen_rand_all((uint64_t)v108);
                    int v44 = 0;
                  }
                }
                else
                {
                  dsfmt_gen_rand_all((uint64_t)v108);
                  LODWORD(v43) = LODWORD(v108[0]);
                  int v44 = 1;
                }
                int v109 = v44 + 1;
                double v45 = v108[v44];
                float v46 = v37 + 1.0;
                if (LODWORD(v43) >= 0xAAAAAAAA) {
                  float v46 = v37;
                }
                if (LODWORD(v43) >= 0x55555555) {
                  float v37 = v46;
                }
                else {
                  float v37 = v37 + -1.0;
                }
                float v47 = v38 + 1.0;
                if (LODWORD(v45) >= 0xAAAAAAAA) {
                  float v47 = v38;
                }
                if (LODWORD(v45) >= 0x55555555) {
                  float v38 = v47;
                }
                else {
                  float v38 = v38 + -1.0;
                }
                CGContextAddLineToPoint(v22, v37, v38);
                --v41;
              }
              while (v41);
            }
            CGContextStrokePath(v22);
            ++v26;
          }
          while (v26 != a3);
        }
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v12);
        int v48 = v109;
        if (v109 >= 382)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          int v48 = 0;
        }
        int v109 = v48 + 1;
      }
      *(void *)&long long v105 = &self->_scratchMutex;
      PCMutex::lock(&self->_scratchMutex);
      BYTE8(v105) = 1;
      int v49 = v97;
      unsigned int v50 = v95;
      if ([(NSMutableArray *)self->_scratches count] != 25 || !v97 && self->_cachedSeed != v95) {
        [(PAEBadFilm *)self setupScratchArrayWithAutoRandomizeFrequency:v97 andSeed:v95 withWidth:v94 andHeight:v20 atTime:a10.var1];
      }
      v51 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_scratches];
      PCMutex::unlock(&self->_scratchMutex);
      var1 = a10.var1;
      if (v97)
      {
        [(PAESharedDefaultBase *)self frameFromFxTime:a10.var1 forPlugIn:self];
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v53 + v53) + 1);
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v95);
      }
      if (v96 >= 1)
      {
        CGContextSetRGBStrokeColor(v22, *v92, v92[1], v92[2], v92[3]);
        v54 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121DE28];
        long long v105 = *MEMORY[0x1E4F1FA48];
        uint64_t v106 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        v104 = &v105;
        [v54 inPointFxTimeOfTimelineForEffect:&v104];
        [(PAESharedDefaultBase *)self frameFromFxTime:a10.var1 forPlugIn:self];
        double v56 = v55;
        [(PAESharedDefaultBase *)self frameFromFxTime:v104 forPlugIn:self];
        uint64_t v58 = 0;
        float v59 = (float)(int)v94;
        double v60 = fmod(v56 - v57, 600.0) * v100;
        do
        {
          v61 = (void *)[v51 objectAtIndex:v58];
          uint64_t v102 = 0;
          uint64_t v103 = 0;
          [v61 startLocationX:(char *)&v103 + 4 andY:&v103 andEndLocationX:(char *)&v102 + 4 andY:&v102];
          float v62 = *(float *)&v103 - v60;
          float v63 = *(float *)&v102 - v60;
          *(float *)&uint64_t v103 = v62;
          *((float *)&v103 + 1) = *((float *)&v103 + 1) * v59;
          *(float *)&uint64_t v102 = v63;
          *((float *)&v102 + 1) = *((float *)&v102 + 1) * v59;
          int v64 = v109;
          if (v109 >= 382)
          {
            dsfmt_gen_rand_all((uint64_t)v108);
            int v64 = 0;
          }
          int v109 = v64 + 1;
          CGContextSetLineWidth(v22, v108[v64] + -1.0 + 1.0);
          CGContextMoveToPoint(v22, *((float *)&v103 + 1), *(float *)&v103);
          CGContextAddLineToPoint(v22, *((float *)&v102 + 1), *(float *)&v102);
          ++v58;
        }
        while (v96 != v58);
        CGContextStrokePath(v22);
        unsigned int v50 = v95;
        var1 = a10.var1;
        int v49 = v97;
      }
      if (v49)
      {
        [(PAESharedDefaultBase *)self frameFromFxTime:var1 forPlugIn:self];
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v65 + v65) + 1);
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v50);
      }
      int v66 = v109;
      if (v109 < 382)
      {
        int v67 = ++v109;
        if (v66 == 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          int v67 = 0;
        }
      }
      else
      {
        dsfmt_gen_rand_all((uint64_t)v108);
        int v67 = 1;
      }
      int v68 = v67 + 1;
      int v109 = v67 + 1;
      if (v49)
      {
        if (v67 >= 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          int v68 = 0;
        }
        int v109 = v68 + 1;
        if (a6 >= 1 && !(int)((v108[v68] + -1.0) * (double)v49))
        {
          float v69 = *(double *)a11 + 0.1;
          CGContextSetRGBStrokeColor(v22, 0.2, 0.2, 0.2, v69);
          int v70 = 0;
          float v71 = fabs(*((double *)a11 + 5)) * 10.0;
          float v72 = fabs(*(double *)a11) * 10.0;
          double v73 = v72;
          double v74 = v71;
          do
          {
            int v75 = v109;
            if (v109 > 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v75 = 0;
            }
            int v76 = v75 + 1;
            int v109 = v75 + 1;
            double v77 = v108[v75];
            if (v75 >= 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v76 = 0;
            }
            float v78 = (v77 + -1.0) * v99;
            double v79 = v108[v76];
            int v109 = v76 + 1;
            float v80 = (v79 + -1.0) * v100;
            CGContextMoveToPoint(v22, v78, v80);
            int v81 = 5;
            do
            {
              int v82 = v109;
              if (v109 > 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                int v82 = 0;
              }
              int v83 = v82 + 1;
              int v109 = v82 + 1;
              double v84 = v108[v82];
              if (v82 >= 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                int v83 = 0;
              }
              float v78 = (v84 + -1.0 + -0.5 + v84 + -1.0 + -0.5) * v73 + v78;
              int v109 = v83 + 1;
              double v85 = v108[v83] + -1.0 + -0.5;
              float v80 = (v85 + v85) * v74 + v80;
              double v86 = v78;
              CGContextAddLineToPoint(v22, v78, v80);
              --v81;
            }
            while (v81);
            uint64_t v87 = v109;
            if (v109 < 382)
            {
              int v88 = ++v109;
              double v89 = v108[v87];
              if (v87 == 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                int v88 = 0;
              }
            }
            else
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              int v88 = 1;
              double v89 = v108[0];
            }
            int v109 = v88 + 1;
            float v90 = (v89 + -1.0 + -0.5 + v89 + -1.0 + -0.5) * v73 + v86;
            double v91 = v108[v88] + -1.0 + -0.5;
            *(float *)&double v91 = (v91 + v91) * v74 + v80;
            CGContextAddLineToPoint(v22, v90, *(float *)&v91);
            ++v70;
          }
          while (v70 != a6);
          CGContextStrokePath(v22);
        }
      }
      else
      {
        if (v67 >= 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          int v68 = 0;
        }
        int v109 = v68 + 1;
      }
      CGColorRelease(color);
      CGContextRelease(v22);
      RandMersenne::~RandMersenne((RandMersenne *)v107);
    }
    CGColorSpaceRelease(v18);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  if (a4) {
    [a4 imageInfo];
  }
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  if (a3) {
    [a3 imageInfo];
  }
  long long v9 = v48;
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v11 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F12189D0];
  uint64_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    return 0;
  }
  uint64_t v41 = 0x3FF0000000000000;
  uint64_t v42 = 0x3FF0000000000000;
  uint64_t v40 = 0;
  unsigned int v39 = 0;
  unsigned int v38 = 25;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  double v35 = 0.0;
  unsigned int v34 = 0;
  [(PAEBadFilm *)self getBrightness:&v42 saturation:&v41 dust:(char *)&v40 + 4 scratches:&v40 scratchColor:v53 hair:&v39 randomSeed:&v38 jitter:&v37 focus:&v36 grain:&v35 autoRandFreq:&v34 withParmsAPI:v10 atTime:a5->var0.var1];
  uint64_t v15 = [a4 imageType];
  int v16 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  if (v16) {
    BOOL v17 = v15 == 3;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v14 = v17;
  if (v17)
  {
    int v18 = (int)(float)(unint64_t)v9;
    int v19 = (int)(float)*((unint64_t *)&v9 + 1);
    if (v18 >= 0) {
      int v20 = (int)(float)(unint64_t)v9;
    }
    else {
      int v20 = v18 + 1;
    }
    unsigned int v21 = v18 - (v20 >> 1);
    if (v19 >= 0) {
      int v22 = (int)(float)*((unint64_t *)&v9 + 1);
    }
    else {
      int v22 = v19 + 1;
    }
    uint64_t v23 = HGRectMake4i(-(v20 >> 1), -(v22 >> 1), v21, v19 - (v22 >> 1));
    uint64_t v25 = v24;
    int v26 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(void *)&double v27 = HGBitmap::HGBitmap(v26, v23, v25, 22).n128_u64[0];
    -[PAEBadFilm createDust:scratches:scratchColor:hair:randomSeed:autoRandFreq:buffer:atTime:pixelTransform:](self, "createDust:scratches:scratchColor:hair:randomSeed:autoRandFreq:buffer:atTime:pixelTransform:", HIDWORD(v40), v40, v53, v39, v38, v34, v27, v26, a5->var0.var1, v33);
    int v28 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v28, v26);
    [(PAESharedDefaultBase *)self getScaleForImage:a4];
    objc_msgSend((id)objc_msgSend(v12, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    if (v35 != 0.0)
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v35);
      long long v29 = v43;
      [(PAESharedDefaultBase *)self frameFromFxTime:a5->var0.var1 forPlugIn:self];
      PAEGenerateNoise(v35, v30, v29, *((uint64_t *)&v29 + 1), 2, 0, 1, 0);
    }
    double v31 = (HgcBadFilm *)HGObject::operator new(0x1A0uLL);
    *((_OWORD *)v31 + 24) = 0u;
    *((_OWORD *)v31 + 25) = 0u;
    *((_OWORD *)v31 + 22) = 0u;
    *((_OWORD *)v31 + 23) = 0u;
    *((_OWORD *)v31 + 20) = 0u;
    *((_OWORD *)v31 + 21) = 0u;
    *((_OWORD *)v31 + 18) = 0u;
    *((_OWORD *)v31 + 19) = 0u;
    *((_OWORD *)v31 + 16) = 0u;
    *((_OWORD *)v31 + 17) = 0u;
    *((_OWORD *)v31 + 14) = 0u;
    *((_OWORD *)v31 + 15) = 0u;
    *((_OWORD *)v31 + 12) = 0u;
    *((_OWORD *)v31 + 13) = 0u;
    *((_OWORD *)v31 + 10) = 0u;
    *((_OWORD *)v31 + 11) = 0u;
    *((_OWORD *)v31 + 8) = 0u;
    *((_OWORD *)v31 + 9) = 0u;
    *((_OWORD *)v31 + 6) = 0u;
    *((_OWORD *)v31 + 7) = 0u;
    *((_OWORD *)v31 + 4) = 0u;
    *((_OWORD *)v31 + 5) = 0u;
    *((_OWORD *)v31 + 2) = 0u;
    *((_OWORD *)v31 + 3) = 0u;
    *(_OWORD *)double v31 = 0u;
    *((_OWORD *)v31 + 1) = 0u;
    HgcBadFilm::HgcBadFilm(v31);
  }
  return v14;
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

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end