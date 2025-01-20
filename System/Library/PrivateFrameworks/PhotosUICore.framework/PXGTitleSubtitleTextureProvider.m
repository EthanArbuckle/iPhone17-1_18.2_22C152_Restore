@interface PXGTitleSubtitleTextureProvider
+ (double)_drawWithTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 requestID:(int)a8 renderCompletionHandler:(id)a9;
@end

@implementation PXGTitleSubtitleTextureProvider

- (void)_requestTextureForTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 requestID:(int)a8 renderCompletionHandler:(id)a9
{
  uint64_t v10 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  if ([(PXGTextureProvider *)self isRequestActive:v10]) {
    PXPixelSizeAreaIsZero();
  }
}

uint64_t __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5DAFE20;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 96);
  objc_copyWeak(&v10, (id *)(a1 + 72));
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  uint64_t v2 = MEMORY[0x1AD10B1D0](0, 0, v4, *(double *)(a1 + 80), *(double *)(a1 + 88));

  objc_destroyWeak(&v10);
  return v2;
}

void __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_3(uint64_t a1, CGImage *a2, void *a3)
{
  id v5 = a3;
  CGImageRetain(a2);
  id v6 = [*(id *)(a1 + 32) requestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_4;
  block[3] = &unk_1E5DBB8B8;
  char v11 = *(unsigned char *)(a1 + 52);
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  int v10 = *(_DWORD *)(a1 + 48);
  dispatch_async(v6, block);

  id v7 = [v5 objectForKeyedSubscript:@"PXGTitleSubtitleTextureProviderLastBaselineKey"];

  uint64_t v8 = *(void *)(a1 + 40);
  [v7 doubleValue];
  (*(void (**)(uint64_t))(v8 + 16))(v8);
}

void __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_4(uint64_t a1)
{
  char v9 = 0;
  __int16 v8 = 0;
  memset(v12, 0, sizeof(v12));
  char v2 = *(unsigned char *)(a1 + 52);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  long long v6 = *(_OWORD *)off_1E5DAAFA0;
  char v7 = v2;
  int v10 = 1065353216;
  char v11 = 0;
  [v3 provideCGImage:v4 options:&v6 forRequestID:v5];
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

uint64_t __130__PXGTitleSubtitleTextureProvider__requestTextureForTitle_subtitle_spec_targetSize_screenScale_requestID_renderCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  +[PXGTitleSubtitleTextureProvider _drawWithTitle:subtitle:spec:targetSize:context:viewport:screenScale:](PXGTitleSubtitleTextureProvider, "_drawWithTitle:subtitle:spec:targetSize:context:viewport:screenScale:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(double *)(a1 + 80), *(double *)(a1 + 88), a3, a4, a5, a6, *(double *)(a1 + 96));
  double v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v13 = @"PXGTitleSubtitleTextureProviderLastBaselineKey";
  int v10 = [NSNumber numberWithDouble:v8];
  v14[0] = v10;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [WeakRetained cacheAdditionalInfo:v11 withKey:*(void *)(a1 + 56)];

  return (*(uint64_t (**)(double))(*(void *)(a1 + 64) + 16))(v8);
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  v52.receiver = self;
  v52.super_class = (Class)PXGTitleSubtitleTextureProvider;
  v36 = a6;
  id v14 = [(PXGTextureProvider *)&v52 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v32 = v15;
  NSUInteger v33 = (NSUInteger)v14;
  id v16 = [v13 contentSource];
  [v13 displayScale];
  uint64_t v18 = v17;
  char v19 = objc_opt_respondsToSelector();
  v37 = v13;
  uint64_t v35 = [v13 version];
  if (length)
  {
    char v34 = v19 & 1;
    int v20 = v33;
    do
    {
      v21 = [v16 titleForSpriteAtIndex:v10];
      v22 = [v16 subtitleForSpriteAtIndex:v10];
      v23 = [v16 titleSubtitleSpecForSpriteAtIndex:v10];
      float32x2_t v24 = (float32x2_t)*(&v36->var3 + 5 * v10.location);
      objc_initWeak(&location, self);
      v25 = [(PXGTitleSubtitleTextureProvider *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E5DAFDF8;
      objc_copyWeak(&v44, &location);
      id v39 = v21;
      id v40 = v22;
      id v41 = v23;
      float64x2_t v45 = vcvtq_f64_f32(v24);
      uint64_t v46 = v18;
      int v48 = v20;
      id v42 = v37;
      id v26 = v16;
      char v50 = v34;
      unsigned int v49 = v10.location;
      id v43 = v26;
      uint64_t v47 = v35;
      id v27 = v23;
      id v28 = v22;
      id v29 = v21;
      dispatch_async(v25, block);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      ++v20;
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      --length;
    }
    while (length);
  }

  NSUInteger v31 = v32;
  NSUInteger v30 = v33;
  result.uint64_t length = v31;
  result.id location = v30;
  return result;
}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(double *)(a1 + 96);
  uint64_t v6 = *(unsigned int *)(a1 + 112);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
  v10[3] = &unk_1E5DAFDD0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  char v15 = *(unsigned char *)(a1 + 120);
  int v14 = *(_DWORD *)(a1 + 116);
  uint64_t v9 = *(void *)(a1 + 104);
  id v12 = v8;
  uint64_t v13 = v9;
  objc_msgSend(WeakRetained, "_requestTextureForTitle:subtitle:spec:targetSize:screenScale:requestID:renderCompletionHandler:", v3, v4, v7, v6, v10, *(double *)(a1 + 80), *(double *)(a1 + 88), v5);
}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) layoutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3;
  block[3] = &unk_1E5DAFDA8;
  id v8 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v13 = *(unsigned char *)(a1 + 60);
  int v12 = *(_DWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  double v11 = a2;
  dispatch_async(v4, block);
}

void __101__PXGTitleSubtitleTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) contentSource];
  uint64_t v3 = v2;
  if (v2 == *(void **)(a1 + 40) && *(unsigned char *)(a1 + 68))
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) contentSource];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
  }
  uint64_t v6 = *(unsigned int *)(a1 + 64);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  double v9 = *(double *)(a1 + 56);
  [v7 didRenderTitleAndSubtitleSpriteAtIndex:v6 layoutVersion:v8 withLastBaseline:v9];
}

+ (double)_drawWithTitle:(id)a3 subtitle:(id)a4 spec:(id)a5 targetSize:(CGSize)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  CGFloat v15 = a6.height;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  UIGraphicsPushContext(a7);
  CGContextTranslateCTM(a7, 0.0, v15);
  CGContextScaleCTM(a7, 1.0, -1.0);
  if (PXGShouldDisplayTextTextureBoundaries())
  {
    CGContextSetRGBFillColor(a7, 1.0, 0.5, 1.0, 0.5);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGContextFillRect(a7, v22);
  }
  CGContextScaleCTM(a7, a9, a9);
  PXRectScale();
}

void __104__PXGTitleSubtitleTextureProvider__drawWithTitle_subtitle_spec_targetSize_context_viewport_screenScale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRendersAsynchronously:0];
  [v3 setTypesettingMode:1];
  [v3 setTitleText:*(void *)(a1 + 32)];
  [v3 setSubtitleText:*(void *)(a1 + 40)];
  [v3 setSpec:*(void *)(a1 + 48)];
  objc_msgSend(v3, "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end