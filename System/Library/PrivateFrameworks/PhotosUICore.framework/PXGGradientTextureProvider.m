@interface PXGGradientTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForGradient:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5;
@end

@implementation PXGGradientTextureProvider

- (void)_requestTextureForGradient:(id)a3 targetSize:(CGSize)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  if ([(PXGTextureProvider *)self isRequestActive:v5]) {
    PXPixelSizeAreaIsZero();
  }
}

uint64_t __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startingColor];
  if (CGColorGetAlpha((CGColorRef)[v2 CGColor]) == 1.0)
  {
    id v3 = [*(id *)(a1 + 32) endingColor];
    BOOL v4 = CGColorGetAlpha((CGColorRef)[v3 CGColor]) == 1.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_2;
  v7[3] = &unk_1E5DC39D0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = MEMORY[0x1AD10B1D0](v4, 0, v7, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v5;
}

uint64_t __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideCGImage:a2 forRequestID:*(unsigned int *)(a1 + 40)];
}

void __78__PXGGradientTextureProvider__requestTextureForGradient_targetSize_requestID___block_invoke_2(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v13 = [*(id *)(a1 + 32) startingColor];
  v23[0] = [v13 CGColor];
  id v14 = [*(id *)(a1 + 32) endingColor];
  v23[1] = [v14 CGColor];
  CFArrayRef v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v16 = CGGradientCreateWithColors(DeviceRGB, v15, 0);

  uint64_t v17 = [*(id *)(a1 + 32) direction];
  CGFloat v18 = 0.0;
  CGFloat MinY = 0.0;
  CGFloat MaxY = 0.0;
  CGFloat MidX = 0.0;
  if (!v17)
  {
    v25.origin.x = a3;
    v25.origin.y = a4;
    v25.size.width = a5;
    v25.size.height = a6;
    CGFloat MidX = CGRectGetMidX(v25);
    v26.origin.x = a3;
    v26.origin.y = a4;
    v26.size.width = a5;
    v26.size.height = a6;
    CGFloat MaxY = CGRectGetMaxY(v26);
    v27.origin.x = a3;
    v27.origin.y = a4;
    v27.size.width = a5;
    v27.size.height = a6;
    CGFloat v18 = CGRectGetMidX(v27);
    v28.origin.x = a3;
    v28.origin.y = a4;
    v28.size.width = a5;
    v28.size.height = a6;
    CGFloat MinY = CGRectGetMinY(v28);
  }
  v24.x = MidX;
  v24.y = MaxY;
  CGFloat v22 = v18;
  CGContextDrawLinearGradient(a2, v16, v24, *(CGPoint *)(&MinY - 1), 0);
  CGGradientRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PXGGradientTextureProvider;
  CGRect v26 = a6;
  id v14 = [(PXGTextureProvider *)&v33 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v24 = v15;
  NSUInteger v25 = (NSUInteger)v14;
  v16 = [v13 contentSource];
  if (length)
  {
    int v17 = v25;
    do
    {
      float32x2_t v18 = (float32x2_t)*(&v26->var3 + 5 * v10.location);
      v19 = [v16 gradientForSpriteAtIndex:v10 inLayout:v13];
      objc_initWeak(&location, self);
      v20 = [(PXGTextureProvider *)self requestQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__PXGGradientTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DC39A8;
      objc_copyWeak(&v29, &location);
      id v28 = v19;
      float64x2_t v30 = vcvtq_f64_f32(v18);
      int v31 = v17;
      id v21 = v19;
      dispatch_async(v20, block);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      ++v17;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  NSUInteger v23 = v24;
  NSUInteger v22 = v25;
  result.uint64_t length = v23;
  result.id location = v22;
  return result;
}

void __96__PXGGradientTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestTextureForGradient:targetSize:requestID:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end