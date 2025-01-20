@interface UIImage
@end

@implementation UIImage

uint64_t __54__UIImage_SeymourMedia__imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __90__UIImage_SeymourMedia__compositedImageWithSize_images_cornerRadius_blendMode_legacyMode___block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (*(double *)(a1 + 40) > 0.0)
  {
    CGFloat v4 = *MEMORY[0x263F00148];
    CGFloat v5 = *(double *)(MEMORY[0x263F00148] + 8);
    CGFloat v6 = *(double *)(a1 + 48);
    CGFloat v7 = *(double *)(a1 + 56);
    v41.origin.double x = *(CGFloat *)MEMORY[0x263F00148];
    v41.origin.double y = v5;
    v41.size.double width = v6;
    v41.size.double height = v7;
    double MinX = CGRectGetMinX(v41);
    v42.origin.double x = v4;
    v42.origin.double y = v5;
    v42.size.double width = v6;
    v42.size.double height = v7;
    double MinY = CGRectGetMinY(v42);
    v43.origin.double x = v4;
    v43.origin.double y = v5;
    v43.size.double width = v6;
    v43.size.double height = v7;
    double MaxX = CGRectGetMaxX(v43);
    v44.origin.double x = v4;
    v44.origin.double y = v5;
    v44.size.double width = v6;
    v44.size.double height = v7;
    double v11 = MaxX - CGRectGetMinX(v44);
    v45.origin.double x = v4;
    v45.origin.double y = v5;
    v45.size.double width = v6;
    v45.size.double height = v7;
    double MaxY = CGRectGetMaxY(v45);
    v46.origin.double x = v4;
    v46.origin.double y = v5;
    v46.size.double width = v6;
    v46.size.double height = v7;
    objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, v11, MaxY - CGRectGetMinY(v46), *(double *)(a1 + 40));
    id v13 = objc_claimAutoreleasedReturnValue();
    CGContextAddPath(c, (CGPathRef)[v13 CGPath]);
    CGContextClip(c);
  }
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(c);
  double x = ClipBoundingBox.origin.x;
  double y = ClipBoundingBox.origin.y;
  double width = ClipBoundingBox.size.width;
  double height = ClipBoundingBox.size.height;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = (CGImage *)[*(id *)(*((void *)&v35 + 1) + 8 * i) CGImage];
        double v24 = (double)CGImageGetWidth(v23);
        double v25 = (double)CGImageGetHeight(v23);
        double v26 = *(double *)(a1 + 48) / v24;
        double v27 = *(double *)(a1 + 56) / v25;
        memset(&v34.c, 0, 32);
        if (v26 < v27) {
          double v26 = v27;
        }
        *(_OWORD *)&v34.a = 0uLL;
        CGAffineTransformMakeScale(&v34, v26, v26);
        CGAffineTransform v33 = v34;
        v48.origin.double x = 0.0;
        v48.origin.double y = 0.0;
        v48.size.double width = v24;
        v48.size.double height = v25;
        CGRect v49 = CGRectApplyAffineTransform(v48, &v33);
        double v28 = v49.origin.x;
        double v29 = v49.origin.y;
        double v30 = v49.size.width;
        double v31 = v49.size.height;
        CGContextSaveGState(c);
        CGBlendMode v32 = *(_DWORD *)(a1 + 72);
        if (v32) {
          CGContextSetBlendMode(c, v32);
        }
        objc_msgSend((id)objc_opt_class(), "centerRect:inRect:", v28, v29, v30, v31, x, y, width, height);
        CGContextDrawImage(c, v50, v23);
        CGContextRestoreGState(c);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v20);
  }
}

@end