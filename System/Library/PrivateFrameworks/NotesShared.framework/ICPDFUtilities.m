@interface ICPDFUtilities
+ (id)renderedImageForPage:(CGPDFPage *)a3 scale:(double)a4 size:(CGSize)a5 colorSpace:(CGColorSpace *)a6;
@end

@implementation ICPDFUtilities

+ (id)renderedImageForPage:(CGPDFPage *)a3 scale:(double)a4 size:(CGSize)a5 colorSpace:(CGColorSpace *)a6
{
  v6 = a3;
  if (a3)
  {
    double height = a5.height;
    double width = a5.width;
    long long v14 = *MEMORY[0x1E4F1DAD8];
    v10 = objc_msgSend(MEMORY[0x1E4FB17E0], "defaultFormat", a3, a6);
    [v10 setScale:a4];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v10, width, height);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__ICPDFUtilities_renderedImageForPage_scale_size_colorSpace___block_invoke;
    v13[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
    double v15 = width;
    double v16 = height;
    v17 = v6;
    v6 = [v11 imageWithActions:v13];
  }
  return v6;
}

uint64_t __61__ICPDFUtilities_renderedImageForPage_scale_size_colorSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (CGContext *)[a2 CGContext];
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)components = xmmword_1C3DD2F70;
  v5 = CGColorCreate(DeviceGray, components);
  CGContextSetFillColorWithColor(v3, v5);
  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
  CGColorRelease(v5);
  CGColorSpaceRelease(DeviceGray);
  CGContextGetCTM(&v20, v3);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 56));
  CGRect BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)*(void *)(a1 + 64), kCGPDFCropBox);
  CGFloat x = BoxRect.origin.x;
  CGFloat y = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  CGFloat height = BoxRect.size.height;
  memset(&v20, 0, sizeof(v20));
  double v10 = *(double *)(a1 + 48);
  CGFloat v11 = CGRectGetWidth(BoxRect);
  double v12 = *(double *)(a1 + 56);
  CGFloat v13 = v10 / v11;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v14 = CGRectGetHeight(v24);
  CGAffineTransformMakeScale(&v20, v13, v12 / v14);
  CGAffineTransform transform = v20;
  CGContextConcatCTM(v3, &transform);
  memset(&transform, 0, sizeof(transform));
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v15 = -CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v26);
  CGAffineTransformMakeTranslation(&transform, v15, -MinY);
  CGAffineTransform v18 = transform;
  CGContextConcatCTM(v3, &v18);
  return CGContextDrawPDFPageWithAnnotations();
}

@end