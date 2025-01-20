@interface PAESimpleKeyer
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)isSimpleKey;
- (BOOL)oscIsPublishable:(BOOL)a3;
- (BOOL)parameterChanged:(unsigned int)a3;
- (BOOL)pullInitialKey:(id *)a3;
- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5;
- (PAESimpleKeyer)initWithAPIManager:(id)a3;
- (id)properties;
- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6;
- (void)dealloc;
@end

@implementation PAESimpleKeyer

- (id)properties
{
  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[PAEKeyer properties](&v4, sel_properties));
  objc_msgSend(v2, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 3), @"PixelTransformSupport");
  return v2;
}

- (BOOL)isSimpleKey
{
  return 1;
}

- (PAESimpleKeyer)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  return [(PAEKeyer *)&v4 initWithAPIManager:a3];
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  p_cacheMutex = &self->super._cacheMutex;
  PCMutex::lock(&self->super._cacheMutex);
  v12 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v12, *(void *)&a5->var0, *(void *)&a5->var2, 28);
  v13 = (_DWORD *)*((void *)v12 + 10);
  BOOL v14 = [(PAEKeyer *)self isLutExpandedForHDR];
  int v15 = 0;
  if (v14) {
    float v16 = 11.0;
  }
  else {
    float v16 = 1.0;
  }
  if (v14) {
    int v17 = 2816;
  }
  else {
    int v17 = 256;
  }
  do
  {
    float v18 = (double)v15 / (double)(v17 - 1);
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v16 * v18);
    _DWORD *v13 = v19;
    v20 = (_DWORD *)*((void *)a6 + 15);
    float v21 = (float)(unint64_t)((uint64_t)(*((void *)a6 + 16) - (void)v20) >> 2);
    if ((float)((float)v15 / 255.0) <= 1.0) {
      float v22 = (float)v15 / 255.0;
    }
    else {
      float v22 = 1.0;
    }
    float v23 = v21 + -1.0;
    uint64_t v24 = (uint64_t)rintf(v22 * (float)(v21 + -1.0));
    if ((v24 & 0x8000000000000000) == 0)
    {
      if (v23 < (float)v24) {
        uint64_t v24 = (unint64_t)v23;
      }
      v20 += v24;
    }
    v13[1] = *v20;
    v13[2] = 0;
    ++v15;
    v13 += 4;
  }
  while (v17 != v15);
  v25 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v25, *a5, v12);
  lutsBitmapLoaderCache = self->super._lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache) {
    (*(void (**)(void *))(*(void *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  }
  v27 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v27, (HGBitmap *)v25);
  self->super._lutsBitmapLoaderCache = v27;
  (*(void (**)(HGTexture *))(*(void *)v25 + 24))(v25);
  (*(void (**)(HGBitmap *))(*(void *)v12 + 24))(v12);
  (*(void (**)(void *, void, void *))(*(void *)a3 + 120))(a3, a4, self->super._lutsBitmapLoaderCache);
  PCMutex::unlock(p_cacheMutex);
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = (HGGLNode *)HGObject::operator new(0x1B0uLL);
  HGGLNode::HGGLNode(v6, 0);
  HGGLNode::hglClearToBlack(v6);
  v8 = v6;
  if (v6) {
    (*(void (**)(HGGLNode *))(*(void *)v6 + 16))(v6);
  }
  PAEKeyerDrawAlpha::drawAlpha_in_HGGLNode((uint64_t)&v9, (uint64_t)a4, &v8);
  if (v8) {
    (*(void (**)(HGGLNode *))(*(void *)v8 + 24))(v8);
  }
  v7 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v7);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var2;
  v8[0] = *(_OWORD *)&a5->var0.var0;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a5->var4;
  v7.receiver = self;
  v7.super_class = (Class)PAESimpleKeyer;
  return [(PAEKeyer *)&v7 canThrowRenderOutput:a3 withInput:a4 withInfo:v8];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAESimpleKeyer;
  [(PAEKeyer *)&v2 dealloc];
}

- (BOOL)pullInitialKey:(id *)a3
{
  long long v5 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121D130];
  v6 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F122C298];
  objc_super v7 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121D2E0];
  uint64_t v8 = [(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121DE28];
  if (v5) {
    _ZF = v6 == 0;
  }
  else {
    _ZF = 1;
  }
  BOOL v10 = _ZF || v7 == 0;
  char v11 = v10;
  if (v10)
  {
    v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"Keyer::UnableToObtainAPIsDescription" value:0 table:0];
    uint64_t v14 = [v12 localizedStringForKey:@"Keyer::UnableToObtainAPIsReason" value:0 table:0];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F28568], v14, *MEMORY[0x1E4F28588], 0);
    if (a3) {
      *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:FxPlugErrorDomain code:100001 userInfo:v15];
    }
  }
  else
  {
    float v16 = (void *)v8;
    int v17 = (long long *)MEMORY[0x1E4F1FA48];
    long long v72 = *MEMORY[0x1E4F1FA48];
    uint64_t v73 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    char v71 = 0;
    [v5 getBoolValue:&v71 fromParm:8 atFxTime:&v72];
    if (!v71)
    {
      long long v69 = *v17;
      uint64_t v70 = *((void *)v17 + 2);
      double v68 = COERCE_DOUBLE(&v69);
      long long v66 = v69;
      uint64_t v67 = v70;
      double v65 = COERCE_DOUBLE(&v66);
      [v6 startFxTimeOfMedia:&v68];
      [v6 durationFxTimeOfMedia:&v65];
      if (v68 != -1.0 && v65 != -1.0)
      {
        long long v63 = *v17;
        uint64_t v64 = *((void *)v17 + 2);
        double v62 = COERCE_DOUBLE(&v63);
        [v16 frameDuration:&v62];
      }
      v58[1] = 0;
      v58[2] = 0;
      v58[0] = &v72;
      __asm { FMOV            V0.2D, #1.0 }
      long long v49 = _Q0;
      long long v59 = _Q0;
      uint64_t v60 = 3;
      uint64_t v61 = 0;
      [(PAEKeyer *)self getInputWidth:(char *)&v61 + 4 height:&v61 renderInfo:v58];
      if (*((float *)&v61 + 1) > 0.0)
      {
        LODWORD(v22) = v61;
        if (*(float *)&v61 > 0.0)
        {
          double v62 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v62, 38, &v72, v22);
          double v57 = 0.0;
          [v5 getFloatValue:&v57 fromParm:39 atFxTime:&v72];
          double v56 = 0.0;
          [v5 getFloatValue:&v56 fromParm:40 atFxTime:&v72];
          double v55 = 0.0;
          [v5 getFloatValue:&v55 fromParm:41 atFxTime:&v72];
          double v54 = 0.0;
          [v5 getFloatValue:&v54 fromParm:42 atFxTime:&v72];
          double v53 = 0.0;
          [v5 getFloatValue:&v53 fromParm:43 atFxTime:&v72];
          *(void *)&long long v63 = 0;
          [v5 getFloatValue:&v63 fromParm:36 atFxTime:&v72];
          float v23 = *(double *)&v63;
          double v24 = 0.5;
          [(PAEKeyer *)self autokeyAmountToHistoPercent:v23 * 0.5];
          double v26 = v25;
          v27 = [[PAEKeyerInitialize alloc] initWithAPIManager:self->super.super.super._apiManager keyer:self];
          LODWORD(v63) = 0;
          v50[1] = 0;
          v50[2] = 0;
          v50[0] = &v72;
          long long v51 = v49;
          uint64_t v52 = 3;
          uint64_t v28 = [(PAEKeyer *)self getColorPrimaries];
          uint64_t v29 = (int)*((float *)&v61 + 1);
          uint64_t v30 = (int)*(float *)&v61;
          float v31 = v62;
          float v32 = v57;
          float v33 = v56;
          float v34 = v55;
          float v35 = v54;
          float v36 = v53;
          omSamples = self->super._omSamples;
          BYTE2(v48) = 1;
          BYTE1(v48) = [(PAEKeyer *)self use32x32Histogram];
          LOBYTE(v48) = 0;
          *(float *)&double v38 = v31;
          *(float *)&double v39 = v32;
          *(float *)&double v40 = v33;
          *(float *)&double v41 = v34;
          *(float *)&double v42 = v35;
          *(float *)&double v43 = v36;
          *(float *)&double v26 = v26;
          LODWORD(v44) = LODWORD(v26);
          -[PAEKeyerInitialize findSampleRectsWithInfo:screenColor:colorPrimaries:width:height:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:omSamples:viewingSetupMatte:use32x32Histogram:simpleKey:](v27, "findSampleRectsWithInfo:screenColor:colorPrimaries:width:height:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:omSamples:viewingSetupMatte:use32x32Histogram:simpleKey:", v50, &v63, v28, v29, v30, omSamples, v38, v39, v40, v41, v42, v43, v44, v48);
          if (v63)
          {
            if (v63 != 1)
            {
LABEL_25:
              [v7 setBoolValue:1 toParm:8 atFxTime:&v72];

              return v11 ^ 1;
            }
            double v24 = 1.0;
            float v45 = 0.0;
            double v46 = 0.460000008;
          }
          else
          {
            float v45 = 1.6;
            double v46 = 0.730000019;
          }
          [v7 setFloatValue:20 toParm:&v72 atFxTime:v46];
          [v7 setFloatValue:23 toParm:&v72 atFxTime:(float)(v45 / 20.0)];
          [v7 setFloatValue:24 toParm:&v72 atFxTime:v24];
          goto LABEL_25;
        }
      }
    }
  }
  return v11 ^ 1;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  return [(PAESimpleKeyer *)&v4 parameterChanged:*(void *)&a3];
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

@end