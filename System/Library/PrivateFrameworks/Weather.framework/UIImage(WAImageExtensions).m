@interface UIImage(WAImageExtensions)
- (id)WAImageLoaderPreCacheImage;
- (void)drawPDFInRect:()WAImageExtensions;
@end

@implementation UIImage(WAImageExtensions)

- (id)WAImageLoaderPreCacheImage
{
  [a1 size];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  [a1 scale];
  CGFloat v7 = v6;
  v11.width = v3;
  v11.height = v5;
  UIGraphicsBeginImageContextWithOptions(v11, 0, v7);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

- (void)drawPDFInRect:()WAImageExtensions
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.CGFloat width = a4;
  v17.size.double height = a5;
  CGContextBeginTransparencyLayerWithRect(CurrentContext, v17, 0);
  CGRect BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)[a1 _CGPDFPage], kCGPDFMediaBox);
  CGFloat width = BoxRect.size.width;
  double height = BoxRect.size.height;
  CGFloat v13 = a4 / BoxRect.size.width;
  BoxRect.origin.x = a2;
  BoxRect.origin.y = a3;
  BoxRect.size.CGFloat width = a4;
  BoxRect.size.double height = a5;
  CGFloat MinX = CGRectGetMinX(BoxRect);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.CGFloat width = a4;
  v19.size.double height = a5;
  CGFloat MaxY = CGRectGetMaxY(v19);
  CGContextTranslateCTM(CurrentContext, MinX, MaxY);
  CGContextScaleCTM(CurrentContext, v13, -a5 / height);
  CGContextDrawPDFPage(CurrentContext, (CGPDFPageRef)[a1 _CGPDFPage]);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.CGFloat width = width;
  v20.size.double height = height;
  UIRectFillUsingBlendMode(v20, kCGBlendModeSourceIn);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

@end