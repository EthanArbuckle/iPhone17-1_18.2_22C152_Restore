@interface PXGCaptureSpriteTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestWithBehavior:(unint64_t)a3 renderSnapshot:(id)a4 requestID:(int)a5;
@end

@implementation PXGCaptureSpriteTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PXGCaptureSpriteTextureProvider;
  v30 = a4;
  v31 = a6;
  id v14 = [(PXGTextureProvider *)&v40 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v28 = v15;
  NSUInteger v29 = (NSUInteger)v14;
  v16 = [v13 contentSource];
  if (length)
  {
    int v17 = v29;
    do
    {
      v18 = (void *)[v16 behaviorForCaptureSpriteAtIndex:v10 inLayout:v13];
      if (v18 == (void *)2)
      {
        char v19 = *(&v31->var0 + 40 * v10.location);
        v20 = (char *)v30 + 32 * v10.location;
        float32x2_t v21 = *(float32x2_t *)(v20 + 24);
        float64x2_t v32 = *(float64x2_t *)v20;
        if (objc_opt_respondsToSelector())
        {
          v22 = [v16 offscreenEffectForCapturedSnapshotAtIndex:v10 inLayout:v13];
        }
        else
        {
          v22 = 0;
        }
        LOBYTE(location) = v19;
        *(_DWORD *)((char *)&location + 1) = 0;
        HIDWORD(location) = 0;
        float64x2_t v38 = vaddq_f64(v32, vcvtq_f64_f32(vmul_f32(v21, (float32x2_t)0xBF000000BF000000)));
        float64x2_t v39 = vcvtq_f64_f32(v21);
        v23 = [(PXGTextureProvider *)self requestRenderSnapshot:&location offscreenEffect:v22];
      }
      else
      {
        v23 = 0;
      }
      objc_initWeak(&location, self);
      v24 = [(PXGTextureProvider *)self requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__PXGCaptureSpriteTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DBE778;
      objc_copyWeak(v35, &location);
      v35[1] = v18;
      id v34 = v23;
      int v36 = v17;
      id v25 = v23;
      dispatch_async(v24, block);

      objc_destroyWeak(v35);
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

void __101__PXGCaptureSpriteTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _requestWithBehavior:*(void *)(a1 + 48) renderSnapshot:*(void *)(a1 + 32) requestID:*(unsigned int *)(a1 + 56)];
}

- (void)_requestWithBehavior:(unint64_t)a3 renderSnapshot:(id)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  v9 = [[PXGCaptureSpritePayload alloc] initWithBehavior:a3 renderSnapshot:v8];

  [(PXGTextureProvider *)self providePayload:v9 forRequestID:v5];
}

@end