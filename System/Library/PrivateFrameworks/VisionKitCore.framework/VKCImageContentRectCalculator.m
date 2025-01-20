@interface VKCImageContentRectCalculator
+ (CGRect)processNormalizedRect:(CGRect)a3 scale:(double *)a4 contentMode:(int64_t)a5;
+ (CGRect)unitContentsRectForBounds:(CGRect)a3 contentMode:(int64_t)a4 imageSize:(CGSize)a5 orientation:(int64_t)a6 view:(id)a7;
@end

@implementation VKCImageContentRectCalculator

+ (CGRect)unitContentsRectForBounds:(CGRect)a3 contentMode:(int64_t)a4 imageSize:(CGSize)a5 orientation:(int64_t)a6 view:(id)a7
{
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12 = [a7 layer];
  [v12 contentsRect];
  vk_orientationApplyToRectAtPoint((CGAffineTransform *)a6, v13, v14, v15, v16, 0.5, 0.5);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  double v66 = 1.0;
  if ((unint64_t)(a4 - 1) > 1) {
    goto LABEL_4;
  }
  v69.origin.CGFloat x = 0.0;
  v69.origin.CGFloat y = 0.0;
  v69.size.CGFloat width = 1.0;
  v69.size.CGFloat height = 1.0;
  v67.origin.CGFloat x = v18;
  v67.origin.CGFloat y = v20;
  v67.size.CGFloat width = v22;
  v67.size.CGFloat height = v24;
  if (CGRectEqualToRect(v67, v69)
    || VKMNearlyEqualRects(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v18, v20, v22, v24))
  {
LABEL_4:
    double v25 = VKMRectWithSize();
    VKMNormalizedSubrectInRect(v25, v26, v27, v28, x, y, width, height);
    objc_msgSend(a1, "processNormalizedRect:scale:contentMode:", &v66, a4);
  }
  else
  {
    double v33 = VKMRectWithSize();
    CGFloat v35 = v34;
    CGFloat v62 = v37;
    CGFloat v63 = v36;
    VKMRectFromNormalizedSubrect(v33, v34, v36, v37, v18, v20, v22, v24);
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    VKMNormalizedSubrectInRect(v38, v40, v42, v44, x, y, width, height);
    objc_msgSend(a1, "processNormalizedRect:scale:contentMode:", &v66, a4);
    double v50 = VKMClampRectToRect(v46, v47, v48, v49, 0.0, 0.0, 1.0, 1.0);
    VKMRectFromNormalizedSubrect(v39, v41, v43, v45, v50, v51, v52, v53);
    double v54 = VKMCenterOfRect(v39, v41, v43, v45);
    double v56 = v55;
    double v57 = VKMMultiplyPointScalar(width, height, 1.0 / v66);
    double v58 = VKMRectWithCenterAndSize(v54, v56, v57);
    VKMNormalizedSubrectInRect(v33, v35, v63, v62, v58, v59, v60, v61);
  }
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

+ (CGRect)processNormalizedRect:(CGRect)a3 scale:(double *)a4 contentMode:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  CGFloat y = a3.origin.y;
  *a4 = 1.0;
  CGFloat v10 = a3.origin.y;
  int v11 = 0;
  int v12 = 0;
  double v13 = 0.0;
  int v14 = 1;
  char v15 = 1;
  double v16 = 0.0;
  double v17 = 0.0;
  switch(a5)
  {
    case 0:
      double x = 0.0;
      CGFloat y = 0.0;
      double width = 1.0;
      double height = 1.0;
      goto LABEL_16;
    case 1:
      goto LABEL_3;
    case 2:
    case 3:
      int v14 = 0;
LABEL_3:
      if (VKMSizeIsEmptyOrHasNanOrInf(width, a3.size.height))
      {
        v28.origin.double x = x;
        v28.origin.CGFloat y = v10;
        v28.size.double width = width;
        v28.size.double height = height;
        CGFloat v18 = NSStringFromCGRect(v28);
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isValid", "+[VKCImageContentRectCalculator processNormalizedRect:scale:contentMode:]", 0, 0, @"Invalid rect for aspect fit / fill: %@", v18);
      }
      else
      {
        if (width >= height) {
          double v19 = width;
        }
        else {
          double v19 = height;
        }
        if (width >= height) {
          double v20 = height;
        }
        else {
          double v20 = width;
        }
        if (!v14) {
          double v19 = v20;
        }
        *a4 = 1.0 / v19;
        VKMScaledRect(x, v10, width, height, 1.0 / v19);
        double width = v21;
        double height = v22;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      double v13 = 0.5 - width * 0.5;
      goto LABEL_29;
    case 5:
      double v16 = 0.5 - width * 0.5;
      double v17 = 0.0;
      goto LABEL_30;
    case 6:
      goto LABEL_23;
    case 7:
      goto LABEL_29;
    case 8:
      goto LABEL_21;
    case 9:
      goto LABEL_30;
    case 10:
      int v14 = 0;
      int v11 = 0;
      CGFloat y = 0.0;
      goto LABEL_21;
    case 11:
      char v15 = 0;
      int v12 = 0;
      double x = 0.0;
      goto LABEL_23;
    case 12:
      int v14 = 0;
      int v11 = 1;
LABEL_21:
      double v23 = x;
      CGFloat v24 = v10;
      double v25 = width;
      double x = 1.0 - CGRectGetMaxX(a3);
      if (v11)
      {
        char v15 = 0;
        int v12 = v14;
LABEL_23:
        v29.origin.double x = x;
        v29.origin.CGFloat y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        double v17 = 1.0 - CGRectGetMaxY(v29);
        if (v15)
        {
          double v13 = 0.5 - width * 0.5;
          double v16 = v13;
          if ((v12 & 1) == 0) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        int v14 = v12;
      }
      else
      {
        double v17 = y;
      }
      double v13 = x;
      double v16 = x;
      if (!v14) {
        goto LABEL_30;
      }
LABEL_29:
      double v17 = 0.5 - height * 0.5;
      double v16 = v13;
LABEL_30:
      double v26 = width;
      double v27 = height;
      result.size.double height = v27;
      result.size.double width = v26;
      result.origin.CGFloat y = v17;
      result.origin.double x = v16;
      return result;
    default:
LABEL_16:
      double v16 = x;
      double v17 = y;
      goto LABEL_30;
  }
}

@end