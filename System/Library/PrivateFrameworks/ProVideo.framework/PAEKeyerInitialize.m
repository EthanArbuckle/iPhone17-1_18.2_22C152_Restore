@interface PAEKeyerInitialize
+ (void)addCorner:(const Vec3f *)a3 toSamples:(void *)a4 corner:(const Vec3f *)a5 clrScreen:(int)a6 clrA:(int)a7 clrB:(int)a8;
+ (void)setInitialSamples:(void *)a3 autokeySetupUtil:(id)a4 sampleBoxHalfDim:(float)a5;
- (BOOL)calculateInitialMatteWithInfo:(id *)a3 omSamples:(void *)a4 colorPrimaries:(int)a5 screenColor:(int *)a6 minGreenHueAngle:(float)a7 maxGreenHueAngle:(float)a8 greenChroma:(float)a9 minBlueHueAngle:(float)a10 maxBlueHueAngle:(float)a11 blueChroma:(float)a12 histoPercentageIncluded:(float)a13 use32x32x32:(BOOL)a14 simpleKey:(BOOL)a15;
- (BOOL)findSampleRectsWithInfo:(id *)a3 screenColor:(int *)a4 colorPrimaries:(int)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13 histoPercentageIncluded:(float)a14 omSamples:(void *)a15 viewingSetupMatte:(BOOL)a16 use32x32Histogram:(BOOL)a17 simpleKey:(BOOL)a18;
- (PAEKeyerInitialize)initWithAPIManager:(id)a3 keyer:(id)a4;
- (void)calculateInitialSamples:(void *)a3 percentageOfBaseColorIncluded:(float)a4 use32x32x32:(BOOL)a5 autokeySetupUtil:(id)a6 samples:(void *)a7 scale:(float)a8;
- (void)dealloc;
- (void)newHisto3d:(BOOL)a3 image:(id)a4;
@end

@implementation PAEKeyerInitialize

- (PAEKeyerInitialize)initWithAPIManager:(id)a3 keyer:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PAEKeyerInitialize;
  v6 = [(PAEKeyerInitialize *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_apiManager = a3;
    id v8 = a4;
    v7->_keyer = (PAEKeyer *)a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerInitialize;
  [(PAEKeyerInitialize *)&v3 dealloc];
}

+ (void)addCorner:(const Vec3f *)a3 toSamples:(void *)a4 corner:(const Vec3f *)a5 clrScreen:(int)a6 clrA:(int)a7 clrB:(int)a8
{
  float32x2_t v8 = vadd_f32(*(float32x2_t *)a3->var0, *(float32x2_t *)a5->var0);
  float32x2_t v14 = v8;
  float v9 = a3->var0[2] + a5->var0[2];
  float v15 = v9;
  float v10 = v14.f32[a6];
  if (v10 > v14.f32[a7] && v10 > v14.f32[a8])
  {
    v12 = (float32x2_t *)*((void *)a4 + 1);
    if ((unint64_t)v12 >= *((void *)a4 + 2))
    {
      uint64_t v13 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)a4, &v14);
    }
    else
    {
      float32x2_t *v12 = v8;
      v12[1].f32[0] = v9;
      uint64_t v13 = (uint64_t)&v12[1] + 4;
    }
    *((void *)a4 + 1) = v13;
  }
}

+ (void)setInitialSamples:(void *)a3 autokeySetupUtil:(id)a4 sampleBoxHalfDim:(float)a5
{
  int v8 = [a4 getSamplesNb];
  uint64_t v9 = [a4 getInitialSamples];
  if (v8 < 1)
  {
    float v12 = 0.0;
    float v11 = 0.0;
  }
  else
  {
    uint64_t v10 = 0;
    float v11 = 0.0;
    float v12 = 0.0;
    do
    {
      float v13 = 0.0;
      float v14 = 0.0;
      if (a4)
      {
        objc_msgSend(a4, "getInitialSample:usingArray:", v10, v9, 0.0, 0.0);
        float v14 = v30;
        float v13 = v31;
      }
      float v12 = v12 + v14;
      float v11 = v11 + v13;
      uint64_t v10 = (v10 + 1);
    }
    while (v8 != v10);
  }
  float v29 = -a5;
  float v30 = -a5;
  if (v12 >= v11) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  if (v12 < v11) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  float v31 = -a5;
  v28[0] = -a5;
  v28[1] = -a5;
  v28[2] = a5;
  v27[0] = -a5;
  v27[1] = a5;
  v27[2] = -a5;
  v26[0] = -a5;
  v26[1] = a5;
  v26[2] = a5;
  *(float *)v25 = a5;
  *(float *)&v25[1] = -a5;
  *(float *)&v25[2] = -a5;
  *(float *)v24 = a5;
  *(float *)&v24[1] = -a5;
  *(float *)&v24[2] = a5;
  *(float *)v23 = a5;
  *(float *)&v23[1] = a5;
  *(float *)&v23[2] = -a5;
  *(float *)v22 = a5;
  *(float *)&v22[1] = a5;
  *(float *)&v22[2] = a5;
  if (v8 >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      if (a4)
      {
        [a4 getInitialSample:v17 usingArray:v9];
        float v18 = *(float *)&v20;
      }
      else
      {
        int v21 = 0;
        uint64_t v20 = 0;
        float v18 = 0.0;
      }
      float v19 = *((float *)&v20 + v15);
      if (v19 > v18 && v19 > *((float *)&v20 + v16))
      {
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:&v29 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v28 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v27 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v26 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v25 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v24 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v23 clrScreen:v15 clrA:0 clrB:v16];
        +[PAEKeyerInitialize addCorner:&v20 toSamples:a3 corner:v22 clrScreen:v15 clrA:0 clrB:v16];
      }
      uint64_t v17 = (v17 + 1);
    }
    while (v8 != v17);
  }
}

- (void)calculateInitialSamples:(void *)a3 percentageOfBaseColorIncluded:(float)a4 use32x32x32:(BOOL)a5 autokeySetupUtil:(id)a6 samples:(void *)a7 scale:(float)a8
{
  uint64_t v30 = *(void *)&a8;
  BOOL v10 = a5;
  __p = 0;
  v34 = 0;
  uint64_t v35 = 0;
  if (a4 != 0.0)
  {
    if ([(PAEKeyer *)self->_keyer is3DHistoExpandedForHDR]) {
      ColorHisto::calculateCenterSamplesHDR((ColorHisto *)a3, (uint64_t)&__p, a4);
    }
    else {
      ColorHisto::calculateCenterSamples((ColorHisto *)a3, (uint64_t)&__p, a4);
    }
  }
  float v29 = a7;
  uint64_t v15 = __p;
  float v14 = v34;
  if (v10) {
    float v16 = 0.015625;
  }
  else {
    float v16 = 0.0078125;
  }
  [a6 clearInitialSamples];
  int64_t v17 = v14 - v15;
  if ((int)((unint64_t)(v14 - v15) >> 2) >= 1)
  {
    uint64_t v18 = 0;
    BOOL v19 = !v10;
    if (v10) {
      char v20 = 7;
    }
    else {
      char v20 = 10;
    }
    if (v19) {
      int v21 = -4;
    }
    else {
      int v21 = -8;
    }
    if (v19) {
      int v22 = 2;
    }
    else {
      int v22 = 4;
    }
    if (v19) {
      char v23 = 4;
    }
    else {
      char v23 = 2;
    }
    if (v19) {
      int v24 = 252;
    }
    else {
      int v24 = 248;
    }
    if (v19) {
      char v25 = 2;
    }
    else {
      char v25 = 3;
    }
    uint64_t v26 = v17 & 0x3FFFFFFFCLL;
    do
    {
      int v27 = *(_DWORD *)((char *)__p + v18);
      v31.f32[0] = (float)((v27 >> v20) & v21 | v22) / 255.0;
      v31.f32[1] = (float)(int)((v27 >> v23) & v24 | v22) / 255.0;
      float v32 = (float)((v27 << v25) & v24 | v22) / 255.0;
      if ([(PAEKeyer *)self->_keyer is3DHistoExpandedForHDR])
      {
        float32x2_t v31 = vmul_n_f32(v31, *(float *)&v30);
        float v32 = v32 * *(float *)&v30;
      }
      [a6 addInitialSample:&v31];
      v18 += 4;
    }
    while (v26 != v18);
  }
  HIDWORD(v28) = HIDWORD(v30);
  *(float *)&double v28 = v16 * *(float *)&v30;
  +[PAEKeyerInitialize setInitialSamples:v29 autokeySetupUtil:a6 sampleBoxHalfDim:v28];
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
}

- (void)newHisto3d:(BOOL)a3 image:(id)a4
{
}

- (BOOL)calculateInitialMatteWithInfo:(id *)a3 omSamples:(void *)a4 colorPrimaries:(int)a5 screenColor:(int *)a6 minGreenHueAngle:(float)a7 maxGreenHueAngle:(float)a8 greenChroma:(float)a9 minBlueHueAngle:(float)a10 maxBlueHueAngle:(float)a11 blueChroma:(float)a12 histoPercentageIncluded:(float)a13 use32x32x32:(BOOL)a14 simpleKey:(BOOL)a15
{
  if ([(PAEKeyer *)self->_keyer is3DHistoExpandedForHDR]) {
    float v15 = 10.532;
  }
  else {
    float v15 = 1.0;
  }
  float v16 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
  HGColorClamp::HGColorClamp(v16, 0.0, v15);
}

- (BOOL)findSampleRectsWithInfo:(id *)a3 screenColor:(int *)a4 colorPrimaries:(int)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13 histoPercentageIncluded:(float)a14 omSamples:(void *)a15 viewingSetupMatte:(BOOL)a16 use32x32Histogram:(BOOL)a17 simpleKey:(BOOL)a18
{
  long long v19 = *(_OWORD *)&a3->var2;
  long long v24 = *(_OWORD *)&a3->var0.var0;
  long long v25 = v19;
  double var4 = a3->var4;
  if (!a15) {
    operator new();
  }
  v21[0] = v24;
  v21[1] = v25;
  double v22 = var4;
  uint64_t v23 = 3;
  return [(PAEKeyerInitialize *)self calculateInitialMatteWithInfo:v21 omSamples:a15 colorPrimaries:*(void *)&a5 screenColor:a4 minGreenHueAngle:a17 maxGreenHueAngle:a18 greenChroma:COERCE_DOUBLE(__PAIR64__(DWORD1(v24), LODWORD(a8))) minBlueHueAngle:COERCE_DOUBLE(__PAIR64__(DWORD1(v25), LODWORD(a9))) maxBlueHueAngle:*(double *)&a10 blueChroma:*(double *)&a11 histoPercentageIncluded:*(double *)&a12 use32x32x32:*(double *)&a13 simpleKey:*(double *)&a14];
}

@end