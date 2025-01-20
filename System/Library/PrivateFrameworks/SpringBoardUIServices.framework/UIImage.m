@interface UIImage
@end

@implementation UIImage

uint64_t __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __98__UIImage_SBUILegibilityAdditions__sbui_strikeImageForLegibilitySettings_strength_size_type_pool___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 40) * *(double *)(result + 48);
  if (v1 > 0.00000011920929)
  {
    uint64_t v2 = result;
    do
    {
      if (v1 + 0.00000011920929 <= 1.0) {
        double v3 = v1;
      }
      else {
        double v3 = 1.0;
      }
      result = objc_msgSend(*(id *)(v2 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(v2 + 56), *(double *)(v2 + 64), *(double *)(v2 + 72), *(double *)(v2 + 80), v3);
      double v1 = v1 + -1.0;
    }
    while (v1 > 0.00000011920929);
  }
  return result;
}

void __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke(uint64_t a1)
{
  uint64_t v25 = *(void *)(a1 + 104);
  UIRectCenteredIntegralRectScale();
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(*(id *)(a1 + 32), "CGColor", v25));
  if (*(unsigned char *)(a1 + 120) || !*(void *)(a1 + 40))
  {
    v36.origin.x = v3;
    v36.origin.y = v5;
    v36.size.width = v7;
    v36.size.height = v9;
    CGContextFillRect(CurrentContext, v36);
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      [v11 shadowSettings];
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
    }
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 80));
    id v12 = [*(id *)(a1 + 40) _flatImageWithColor:*(void *)(a1 + 32)];
    v13 = (CGImage *)[v12 CGImage];
    v37.origin.x = v3;
    v37.origin.y = v5;
    v37.size.width = v7;
    v37.size.height = v9;
    CGContextDrawImage(CurrentContext, v37, v13);
  }
  Data = CGBitmapContextGetData(CurrentContext);
  size_t Width = CGBitmapContextGetWidth(CurrentContext);
  size_t Height = CGBitmapContextGetHeight(CurrentContext);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(CurrentContext);
  v18 = (void *)MEMORY[0x1E4F42A80];
  double v19 = *(double *)(a1 + 104);
  uint64_t v20 = *(void *)(a1 + 112);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_2;
  v26[3] = &unk_1E5CCD848;
  uint64_t v21 = *(void *)(a1 + 56);
  id v27 = *(id *)(a1 + 48);
  uint64_t v28 = *(void *)(a1 + 104);
  uint64_t v29 = *(void *)(a1 + 112);
  v30 = Data;
  size_t v31 = Height;
  size_t v32 = Width;
  size_t v33 = BytesPerRow;
  uint64_t v22 = objc_msgSend(v18, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", v20, v21, v26, *(double *)(a1 + 72), *(double *)(a1 + 80), v19);
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

vImage_Error __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_2(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  dest.data = CGBitmapContextGetData(CurrentContext);
  dest.width = CGBitmapContextGetWidth(CurrentContext);
  dest.height = CGBitmapContextGetHeight(CurrentContext);
  dest.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
  CGFloat v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 shadowSettings];
    double v4 = v12 * 0.2;
  }
  else
  {
    double v4 = 0.0;
  }
  double v5 = v4 * *(double *)(a1 + 40);
  double v6 = v5 * 3.0 * 2.50662827 * 0.25 + 0.5;
  BOOL v7 = v5 < 2.0;
  double v8 = 4.25994241;
  if (!v7) {
    double v8 = v6;
  }
  uint32_t v9 = vcvtmd_u64_f64(v8) | 1;
  v10 = (const vImage_Buffer *)(a1 + 56);
  if ((unint64_t)(*(void *)(a1 + 48) - 3) > 1) {
    return vImageTentConvolve_ARGB8888(v10, &dest, 0, 0, 0, v9, v9, 0, 8u);
  }
  else {
    return vImageTentConvolve_Planar8(v10, &dest, 0, 0, 0, v9, v9, 0, 8u);
  }
}

@end