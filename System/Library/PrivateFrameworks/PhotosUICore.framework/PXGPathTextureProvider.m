@interface PXGPathTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForPath:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5;
@end

@implementation PXGPathTextureProvider

- (void)_requestTextureForPath:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  if ([(PXGTextureProvider *)self isRequestActive:v5]) {
    PXPixelSizeAreaIsZero();
  }
}

uint64_t __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_2;
  v4[3] = &unk_1E5DC39D0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v2 = MEMORY[0x1AD10B1D0](0, 0, v4, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v2;
}

uint64_t __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideCGImage:a2 forRequestID:*(unsigned int *)(a1 + 40)];
}

void __70__PXGPathTextureProvider__requestTextureForPath_targetSize_requestID___block_invoke_2(uint64_t a1, CGContext *a2)
{
  CGContextAddPath(a2, (CGPathRef)[*(id *)(a1 + 32) CGPath]);
  [*(id *)(a1 + 32) lineWidth];
  CGContextSetLineWidth(a2, v4);
  id v5 = [*(id *)(a1 + 32) strokeColor];
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)[v5 CGColor]);

  id v6 = [*(id *)(a1 + 32) fillColor];
  CGContextSetFillColorWithColor(a2, (CGColorRef)[v6 CGColor]);

  CGPathDrawingMode v7 = [*(id *)(a1 + 32) drawingMode];
  CGContextDrawPath(a2, v7);
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PXGPathTextureProvider;
  v28 = a6;
  id v14 = [(PXGTextureProvider *)&v35 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v26 = v15;
  NSUInteger v27 = (NSUInteger)v14;
  v16 = [v13 contentSource];
  if (length)
  {
    int v19 = v27;
    do
    {
      float32x2_t v20 = (float32x2_t)*(&v28->var3 + 5 * v10.location);
      v21 = [v16 pathForSpriteAtIndex:v10 inLayout:v13];
      if (!v21)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, self, @"PXGPathTextureProvider.m", 30, @"Invalid parameter not satisfying: %@", @"path != nil" object file lineNumber description];
      }
      objc_initWeak(&location, self);
      v22 = [(PXGTextureProvider *)self requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__PXGPathTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DC39A8;
      objc_copyWeak(&v31, &location);
      id v30 = v21;
      float64x2_t v32 = vcvtq_f64_f32(v20);
      int v33 = v19;
      id v23 = v21;
      dispatch_async(v22, block);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      ++v19;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  NSUInteger v18 = v26;
  NSUInteger v17 = v27;
  result.uint64_t length = v18;
  result.id location = v17;
  return result;
}

void __92__PXGPathTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForPath:targetSize:requestID:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end