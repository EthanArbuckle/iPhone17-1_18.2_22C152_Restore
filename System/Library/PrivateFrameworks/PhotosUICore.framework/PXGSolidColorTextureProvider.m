@interface PXGSolidColorTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForColor:(id)a3 targetSize:(CGSize)a4 traitCollection:(id)a5 requestID:(int)a6;
- (void)viewEnvironmentDidChange:(id)a3;
@end

@implementation PXGSolidColorTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PXGSolidColorTextureProvider;
  v29 = a6;
  id v14 = [(PXGTextureProvider *)&v37 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v27 = v15;
  NSUInteger v28 = (NSUInteger)v14;
  v16 = [v13 contentSource];
  if (length)
  {
    int v17 = v28;
    do
    {
      float32x2_t v18 = (float32x2_t)*(&v29->var3 + 5 * v10.location);
      if (v16) {
        [v16 colorAtIndex:v10 inLayout:v13];
      }
      else {
      v19 = [MEMORY[0x1E4FB1618] magentaColor];
      }
      v20 = [(PXGTextureProvider *)self viewEnvironment];
      v21 = [v20 traitCollection];

      objc_initWeak(&location, self);
      v22 = [(PXGTextureProvider *)self requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__PXGSolidColorTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DB8D78;
      objc_copyWeak(&v33, &location);
      float64x2_t v34 = vcvtq_f64_f32(v18);
      id v31 = v19;
      id v32 = v21;
      int v35 = v17;
      id v23 = v21;
      id v24 = v19;
      dispatch_async(v22, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      ++v17;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  NSUInteger v26 = v27;
  NSUInteger v25 = v28;
  result.uint64_t length = v26;
  result.id location = v25;
  return result;
}

void __98__PXGSolidColorTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_requestTextureForColor:targetSize:traitCollection:requestID:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_requestTextureForColor:(id)a3 targetSize:(CGSize)a4 traitCollection:(id)a5 requestID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a5;
  if ([(PXGTextureProvider *)self isRequestActive:v6]) {
    PXPixelSizeAreaIsZero();
  }
}

- (void)viewEnvironmentDidChange:(id)a3
{
  id v11 = a3;
  v4 = [(PXGTextureProvider *)self viewEnvironment];
  id v5 = [v4 traitCollection];
  id v6 = [v11 traitCollection];
  if (v5 == v6)
  {

LABEL_5:
    v8 = [(PXGTextureProvider *)self viewEnvironment];
    uint64_t v9 = [v8 userInterfaceStyle];
    uint64_t v10 = [v11 userInterfaceStyle];

    if (v9 == v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v7 = [v5 isEqual:v6];

  if (v7) {
    goto LABEL_5;
  }

LABEL_6:
  [(PXGCGImageTextureProvider *)self invalidateCache];
LABEL_7:
}

uint64_t __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideCGImage:a2 forRequestID:*(unsigned int *)(a1 + 40)];
}

uint64_t __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:*(void *)(a1 + 40)];
  double v8 = 0.0;
  BOOL v2 = (([v1 getWhite:0 alpha:&v8] & 1) != 0
     || [v1 getRed:0 green:0 blue:0 alpha:&v8])
    && v8 == 1.0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_2;
  v6[3] = &unk_1E5DC39D0;
  id v7 = v1;
  id v3 = v1;
  uint64_t v4 = MEMORY[0x1AD10B1D0](v2, 0, v6, 1.0, 1.0);

  return v4;
}

void __93__PXGSolidColorTextureProvider__requestTextureForColor_targetSize_traitCollection_requestID___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;
  double v14 = a6;
  CGContextFillRect(a2, *(CGRect *)&v11);
}

@end