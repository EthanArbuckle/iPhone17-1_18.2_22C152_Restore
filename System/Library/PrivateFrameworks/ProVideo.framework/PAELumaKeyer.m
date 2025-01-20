@interface PAELumaKeyer
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)finishInitialSetup:(id *)a3;
- (BOOL)isLumaKey;
- (BOOL)oscIsPublishable:(BOOL)a3;
- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5;
- (PAELumaKeyer)initWithAPIManager:(id)a3;
- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6;
- (void)dealloc;
@end

@implementation PAELumaKeyer

- (PAELumaKeyer)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAELumaKeyer;
  return [(PAEKeyer *)&v4 initWithAPIManager:a3];
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  uint64_t v8 = *(void *)&a4;
  p_cacheMutex = &self->super._cacheMutex;
  v24 = &self->super._cacheMutex;
  PCMutex::lock(&self->super._cacheMutex);
  LOBYTE(v25) = 1;
  v12 = (HGBitmap *)HGObject::operator new(0x80uLL);
  *(void *)&double v13 = HGBitmap::HGBitmap(v12, *(void *)&a5->var0, *(void *)&a5->var2, 28).n128_u64[0];
  v14 = (_DWORD *)*((void *)v12 + 10);
  BOOL v15 = [(PAEKeyer *)self isLutExpandedForHDR];
  int v16 = 0;
  if (v15) {
    float v17 = 11.0;
  }
  else {
    float v17 = 1.0;
  }
  if (v15) {
    int v18 = 2816;
  }
  else {
    int v18 = 256;
  }
  do
  {
    float v19 = (double)v16 / (double)(v18 - 1);
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v17 * v19);
    _DWORD *v14 = v20;
    v14 += 4;
    ++v16;
  }
  while (v18 != v16);
  v21 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v21, *a5, v12);
  lutsBitmapLoaderCache = self->super._lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache) {
    (*(void (**)(void *))(*(void *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  }
  v23 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v23, (HGBitmap *)v21);
  self->super._lutsBitmapLoaderCache = v23;
  (*(void (**)(HGTexture *))(*(void *)v21 + 24))(v21);
  (*(void (**)(HGBitmap *))(*(void *)v12 + 24))(v12);
  (*(void (**)(void *, uint64_t, void *))(*(void *)a3 + 120))(a3, v8, self->super._lutsBitmapLoaderCache);
  PCMutex::unlock(p_cacheMutex);
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  desiredRGBToYCbCrMatrix(self->super.super.super._apiManager, (uint64_t)v6, (uint64_t)a5.var1);
  v5 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v5);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var2;
  v8[0] = *(_OWORD *)&a5->var0.var0;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a5->var4;
  v7.receiver = self;
  v7.super_class = (Class)PAELumaKeyer;
  return [(PAEKeyer *)&v7 canThrowRenderOutput:a3 withInput:a4 withInfo:v8];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PAELumaKeyer;
  [(PAEKeyer *)&v2 dealloc];
}

- (BOOL)isLumaKey
{
  return 1;
}

- (BOOL)finishInitialSetup:(id *)a3
{
  long long v17 = *MEMORY[0x1E4F1FA48];
  uint64_t v18 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  objc_super v4 = [[PAEKeyerSetupUtil alloc] initWithAPIManager:self->super.super.super._apiManager colorPrimaries:[(PAEKeyer *)self getColorPrimaries] atTime:&v17];
  long long v5 = [(PAEKeyerSetupUtil *)v4 omKeyer];
  (*(void (**)(OMKeyer2D *, float))(*(void *)v5 + 64))(v5, -1.0);
  (*(void (**)(OMKeyer2D *, float))(*(void *)v5 + 72))(v5, 1.0);
  (*(void (**)(OMKeyer2D *, float))(*(void *)v5 + 80))(v5, 100000.0);
  (*(void (**)(OMKeyer2D *, float))(*(void *)v5 + 88))(v5, 100000.0);
  [(PAEKeyerSetupUtil *)v4 autoAdjustSoftGap];
  float v7 = v6;
  int v8 = [(PAEKeyerSetupUtil *)v4 tight];
  omSamples = (OMSamples *)self->super._omSamples;
  [(PAEKeyerSetupUtil *)v4 shadowsGain];
  float v11 = v10;
  [(PAEKeyerSetupUtil *)v4 highlightsGain];
  float v13 = v12;
  [(PAEKeyerSetupUtil *)v4 spreadGain];
  float v15 = v14;
  OMKeyer2D::computeModel(v5, 0, v7, v8, omSamples, v11, v13, v15, 1, 0);
  [(PAEKeyerSetupUtil *)v4 syncWithDB:&v17 setAsDefault:1];

  return 1;
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

@end