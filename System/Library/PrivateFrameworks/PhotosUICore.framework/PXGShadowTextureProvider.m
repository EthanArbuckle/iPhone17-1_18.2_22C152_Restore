@interface PXGShadowTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForShadow:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5 targetSize:(CGSize)a6 requestID:(int)a7;
@end

@implementation PXGShadowTextureProvider

- (void)_requestTextureForShadow:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5 targetSize:(CGSize)a6 requestID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v9 = a3;
  if ([(PXGTextureProvider *)self isRequestActive:v7]) {
    PXPixelSizeAreaIsZero();
  }
}

uint64_t __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke(uint64_t a1)
{
  return _createResizableShadowImage(*(void **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __99__PXGShadowTextureProvider__requestTextureForShadow_cornerRadius_screenScale_targetSize_requestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideCGImage:a2 forRequestID:*(unsigned int *)(a1 + 40)];
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PXGShadowTextureProvider;
  v30 = a6;
  id v14 = [(PXGTextureProvider *)&v37 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v28 = v15;
  NSUInteger v29 = (NSUInteger)v14;
  v16 = [v13 contentSource];
  if (length)
  {
    int v17 = v29;
    do
    {
      float32x2_t v18 = (float32x2_t)*(&v30->var3 + 5 * v10.location);
      v19 = [v16 shadowForSpriteAtIndex:v10 inLayout:v13];
      [v16 cornerRadiusForShadowSpriteAtIndex:v10 inLayout:v13];
      v21 = v20;
      [v13 displayScale];
      v23 = v22;
      objc_initWeak(&location, self);
      v24 = [(PXGTextureProvider *)self requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__PXGShadowTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DC2308;
      objc_copyWeak(v33, &location);
      id v32 = v19;
      v33[1] = v21;
      v33[2] = v23;
      float64x2_t v34 = vcvtq_f64_f32(v18);
      int v35 = v17;
      id v25 = v19;
      dispatch_async(v24, block);

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
      ++v17;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  NSUInteger v27 = v28;
  NSUInteger v26 = v29;
  result.uint64_t length = v27;
  result.id location = v26;
  return result;
}

void __94__PXGShadowTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForShadow:cornerRadius:screenScale:targetSize:requestID:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

@end