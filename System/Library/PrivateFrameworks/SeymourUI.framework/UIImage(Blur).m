@interface UIImage(Blur)
- (id)applyBlurWithRadius:()Blur tintColor:saturationDeltaFactor:maskImage:;
@end

@implementation UIImage(Blur)

- (id)applyBlurWithRadius:()Blur tintColor:saturationDeltaFactor:maskImage:
{
  __n128 v71 = a3;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  [a1 size];
  if (v11 < 1.0 || ([a1 size], v12 < 1.0))
  {
    objc_msgSend(a1, "size", v71.n128_u64[0]);
    uint64_t v14 = v13;
    [a1 size];
    NSLog(&cfstr_ErrorInvalidSi.isa, v14, v15, a1);
LABEL_4:
    v16 = 0;
    goto LABEL_5;
  }
  id v18 = a1;
  if (![v18 CGImage])
  {
    NSLog(&cfstr_ErrorImageMust.isa, v18);
    goto LABEL_4;
  }
  if (v10)
  {
    id v19 = v10;
    if (![v19 CGImage])
    {
      NSLog(&cfstr_ErrorMaskimage.isa, v19);
      goto LABEL_4;
    }
  }
  CGFloat v20 = *MEMORY[0x263F00148];
  CGFloat v21 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v18, "size", v71.n128_u64[0]);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  id v26 = v18;
  v27 = v26;
  double v28 = fabs(v71.n128_f64[0] + -1.0);
  if (a2 > 0.00000011920929 || v28 > 0.00000011920929)
  {
    [v26 size];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    v34 = [MEMORY[0x263F82B60] mainScreen];
    [v34 scale];
    CGFloat v36 = v35;
    v88.width = v31;
    v88.height = v33;
    UIGraphicsBeginImageContextWithOptions(v88, 0, v36);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    [v27 size];
    CGContextTranslateCTM(CurrentContext, 0.0, -v38);
    id v39 = v27;
    v40 = (CGImage *)[v39 CGImage];
    v91.origin.x = v20;
    v91.origin.y = v21;
    v91.size.width = v23;
    v91.size.height = v25;
    CGContextDrawImage(CurrentContext, v91, v40);
    src.data = CGBitmapContextGetData(CurrentContext);
    src.width = CGBitmapContextGetWidth(CurrentContext);
    src.height = CGBitmapContextGetHeight(CurrentContext);
    src.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
    [v39 size];
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    v45 = [MEMORY[0x263F82B60] mainScreen];
    [v45 scale];
    CGFloat v47 = v46;
    v89.width = v42;
    v89.height = v44;
    UIGraphicsBeginImageContextWithOptions(v89, 0, v47);

    v48 = UIGraphicsGetCurrentContext();
    dest.data = CGBitmapContextGetData(v48);
    dest.width = CGBitmapContextGetWidth(v48);
    dest.height = CGBitmapContextGetHeight(v48);
    dest.rowBytes = CGBitmapContextGetBytesPerRow(v48);
    if (a2 > 0.00000011920929)
    {
      v49 = [MEMORY[0x263F82B60] mainScreen];
      [v49 scale];
      double v51 = v50 * a2;

      LODWORD(v49) = vcvtmd_u64_f64(v51 * 3.0 * 2.50662827 * 0.25 + 0.5) | 1;
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
      vImageBoxConvolve_ARGB8888(&dest, &src, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
    }
    if (v28 > 0.00000011920929)
    {
      double v74 = v71.n128_f64[0] * 0.9278 + 0.0722;
      double v75 = v71.n128_f64[0] * -0.0722 + 0.0722;
      double v76 = v75;
      float64x2_t v78 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL), (float64x2_t)xmmword_23A80CA00, v71.n128_f64[0]);
      float64_t v79 = v78.f64[0];
      uint64_t v77 = 0;
      uint64_t v80 = 0;
      float64x2_t v52 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL), (float64x2_t)xmmword_23A80CA10, v71.n128_f64[0]);
      float64_t v81 = v52.f64[0];
      float64x2_t v82 = v52;
      long long v83 = 0u;
      long long v84 = 0u;
      uint64_t v85 = 0x3FF0000000000000;
      uint64_t v53 = 0;
      v54 = &v74;
      float64x2_t v55 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
      do
      {
        float64x2_t v56 = *(float64x2_t *)v54;
        float64x2_t v57 = *(float64x2_t *)(v54 + 2);
        v54 += 4;
        *(uint64_t *)((char *)&v70 + v53) = (uint64_t)vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v56, v55)), vmulq_f64(v57, v55)))));
        v53 += 8;
      }
      while (v53 != 32);
      if (a2 > 0.00000011920929)
      {
        vImageMatrixMultiply_ARGB8888(&dest, &src, (const int16_t *)&v70, 256, 0, 0, 0);
        UIGraphicsEndImageContext();
        v29 = UIGraphicsGetImageFromCurrentImageContext();

LABEL_26:
        UIGraphicsEndImageContext();
        goto LABEL_27;
      }
      vImageMatrixMultiply_ARGB8888(&src, &dest, (const int16_t *)&v70, 256, 0, 0, 0);
    }
    v29 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    goto LABEL_26;
  }
  v29 = v26;
LABEL_27:
  [v27 size];
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  v62 = [MEMORY[0x263F82B60] mainScreen];
  [v62 scale];
  CGFloat v64 = v63;
  v90.width = v59;
  v90.height = v61;
  UIGraphicsBeginImageContextWithOptions(v90, 0, v64);

  v65 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v65, 1.0, -1.0);
  [v27 size];
  CGContextTranslateCTM(v65, 0.0, -v66);
  v67 = (CGImage *)[v27 CGImage];
  v92.origin.x = v20;
  v92.origin.y = v21;
  v92.size.width = v23;
  v92.size.height = v25;
  CGContextDrawImage(v65, v92, v67);
  if (a2 > 0.00000011920929)
  {
    CGContextSaveGState(v65);
    if (v10)
    {
      v68 = (CGImage *)[v10 CGImage];
      v93.origin.x = v20;
      v93.origin.y = v21;
      v93.size.width = v23;
      v93.size.height = v25;
      CGContextClipToMask(v65, v93, v68);
    }
    v69 = (CGImage *)[v29 CGImage];
    v94.origin.x = v20;
    v94.origin.y = v21;
    v94.size.width = v23;
    v94.size.height = v25;
    CGContextDrawImage(v65, v94, v69);
    CGContextRestoreGState(v65);
  }
  if (v9)
  {
    CGContextSaveGState(v65);
    CGContextSetFillColorWithColor(v65, (CGColorRef)[v9 CGColor]);
    v95.origin.x = v20;
    v95.origin.y = v21;
    v95.size.width = v23;
    v95.size.height = v25;
    CGContextFillRect(v65, v95);
    CGContextRestoreGState(v65);
  }
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

LABEL_5:

  return v16;
}

@end