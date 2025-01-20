@interface PUReviewScreenUtilities
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 orientation:(CGRect)a5;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForCameraTopBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 forContentSize:(CGRect)a5 orientation:(CGSize)a6;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraBottomBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5 shouldShiftPreviewForUtilityBar:(int64_t)a6;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraTopBarGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenControlBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4 safeAreaInsets:(int64_t)a5;
+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenTopBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4;
+ (BOOL)useCompactControlBarButtonsForReferenceBounds:(CGRect)a3;
+ (CGAffineTransform)_transformForRotationAboutCenterOfReferenceBounds:(SEL)a3 withOrientationTransform:(CGRect)a4;
+ (CGRect)_orientedBoundsForReferenceBounds:(CGRect)result sizeClass:(unint64_t)a4;
+ (CGRect)_portraitBoundsForReferenceBounds:(CGRect)a3;
+ (CGRect)cameraBottomBarFrameForReferenceBounds:(CGRect)a3;
+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4;
+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4 shouldShiftPreviewForUtilityBar:(BOOL)a5;
+ (CGRect)cameraTopBarFrameForReferenceBounds:(CGRect)a3;
+ (CGRect)reviewScreenControlBarFrameForReferenceBounds:(CGRect)a3;
+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3;
+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4;
+ (CGRect)reviewScreenTopBarFrameForReferenceBounds:(CGRect)a3;
+ (UIEdgeInsets)_layoutMarginInsetsForSizeSpec:(id *)a3;
+ (double)_cameraBottomBarHeightForSizeSpec:(id *)a3;
+ (double)_cameraBottomBarWidthForSizeSpec:(id *)a3;
+ (double)_cameraTopBarHeightForSizeSpec:(id *)a3;
+ (double)_reviewScreenControlBarHeightForSizeSpec:(id *)a3;
+ (double)_reviewScreenControlBarWidthForSizeSpec:(id *)a3;
+ (double)_reviewScreenScrubberBarHeightForSizeClass:(unint64_t)a3;
+ (double)_reviewScreenTopBarHeightForSizeSpec:(id *)a3;
+ (unint64_t)doneButtonStyleForReferenceBounds:(CGRect)a3;
@end

@implementation PUReviewScreenUtilities

+ (CGRect)_orientedBoundsForReferenceBounds:(CGRect)result sizeClass:(unint64_t)a4
{
  if (a4 <= 6) {
    objc_msgSend(a1, "_portraitBoundsForReferenceBounds:", result.origin.x, result.origin.y, result.size.width, result.size.height, v4, v5);
  }
  return result;
}

+ (CGAffineTransform)_transformForRotationAboutCenterOfReferenceBounds:(SEL)a3 withOrientationTransform:(CGRect)a4
{
  double y = a4.origin.y;
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  objc_msgSend(a2, "_portraitBoundsForReferenceBounds:", a4.origin.x, y);
  UIRectGetCenter();
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, -v10, -v11);
  long long v12 = *(_OWORD *)&v25.a;
  long long v13 = *(_OWORD *)&v25.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
  *(_OWORD *)&retstr->c = v13;
  long long v14 = *(_OWORD *)&v25.tx;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  *(_OWORD *)&t1.a = v12;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = v14;
  long long v15 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v15;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  UIRectGetCenter();
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, v16, v17);
  long long v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v18;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransform v21 = t1;
  result = CGAffineTransformConcat(&t2, &v22, &v21);
  long long v20 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  return result;
}

+ (CGRect)_portraitBoundsForReferenceBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = fmin(a3.size.width, a3.size.height);
  double v6 = fmax(a3.size.width, a3.size.height);
  double v7 = v5;
  result.size.height = v6;
  result.size.width = v7;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForCameraTopBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 forContentSize:(CGRect)a5 orientation:(CGSize)a6
{
  CGFloat width = a6.width;
  double height = a5.size.height;
  double v9 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)PUReviewScreenSizeClassForReferenceSize(a5.size.width, a5.size.height);
  if (result == ($3B1716E7537CC2F16D6737AAC3CCCADB *)7)
  {
    retstr->var1 = (CGPoint)xmmword_1AEFF84F0;
    *(_OWORD *)&retstr->var2.a = unk_1AEFF8500;
    *(_OWORD *)&retstr->var2.c = xmmword_1AEFF8510;
    *(_OWORD *)&retstr->var2.tdouble x = unk_1AEFF8520;
    CGPoint v19 = (CGPoint)PUReviewScreenGeometryZero;
    CGSize v20 = (CGSize)unk_1AEFF84E0;
LABEL_11:
    retstr->var0.origin = v19;
    retstr->var0.size = v20;
    return result;
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  retstr->var0.origin = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var2.a = 1.0;
  retstr->var2.d = 1.0;
  BOOL v21 = v43 == 0.0 || v42 == 0.0;
  double v22 = v42 / v43;
  if (v21) {
    double v22 = 1.0;
  }
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:", v22, x, y, v9, height);
  v35.origin.double x = v23;
  v35.origin.double y = v24;
  v35.size.CGFloat width = v25;
  v35.size.double height = v26;
  v36.double x = v9;
  v36.double y = height;
  *(void *)&v37.CGFloat width = PUReviewScreenSizeClassForReferenceSize(v9, height);
  CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)[a2 _cameraTopBarHeightForSizeSpec:&v36];
  if (*(void *)&width < 3uLL)
  {
    CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", 1, v15, v14, v13, v12, x, y, v9, height);
    long long v28 = v39;
    retstr->var1 = v38;
    *(_OWORD *)&retstr->var2.a = v28;
    long long v29 = v41;
    *(_OWORD *)&retstr->var2.c = v40;
    *(_OWORD *)&retstr->var2.tdouble x = v29;
    CGPoint v19 = v36;
    CGSize v20 = v37;
    goto LABEL_11;
  }
  if (*(void *)&width == 3)
  {
    retstr->var0.origin.double x = 0.0;
    retstr->var0.origin.double y = 0.0;
    retstr->var0.size.CGFloat width = v13;
    retstr->var0.size.double height = v12;
    CGFloat v33 = CGRectGetMaxX(v35) + -8.0 + v27 * -0.5;
    CGFloat MidY = CGRectGetMidY(v35);
    retstr->var1.double x = v33;
    retstr->var1.double y = MidY;
    CGFloat v32 = 1.57079633;
    return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeRotation(&retstr->var2, v32);
  }
  if (*(void *)&width == 4)
  {
    retstr->var0.origin.double x = 0.0;
    retstr->var0.origin.double y = 0.0;
    retstr->var0.size.CGFloat width = v13;
    retstr->var0.size.double height = v12;
    CGFloat v30 = v27 * 0.5 + CGRectGetMinX(v35) + 8.0;
    CGFloat v31 = CGRectGetMidY(v35);
    retstr->var1.double x = v30;
    retstr->var1.double y = v31;
    CGFloat v32 = -1.57079633;
    return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeRotation(&retstr->var2, v32);
  }
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 orientation:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v11 = a4.size.height;
  CGFloat v12 = a4.size.width;
  CGFloat v15 = *MEMORY[0x1E4F1DAD8];
  CGFloat v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  UIRectGetCenter();
  CGFloat v24 = v18;
  double v26 = v17;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v31.c = v19;
  *(_OWORD *)&v31.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)PUReviewScreenSizeClassForReferenceSize(width, height);
  v21.double x = v26;
  v21.double y = v24;
  if ((~(_BYTE)result & 6) != 0)
  {
    float64x2_t v25 = (float64x2_t)v21;
    PUReviewScreenAffineTransformForOrientation(&v31, a6);
    float64x2_t v29 = 0u;
    float64x2_t v30 = 0u;
    CGAffineTransform v27 = v31;
    float64x2_t v28 = 0u;
    CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_transformForRotationAboutCenterOfReferenceBounds:withOrientationTransform:", &v27, x, y, width, height);
    CGPoint v21 = (CGPoint)vaddq_f64(v30, vmlaq_n_f64(vmulq_laneq_f64(v29, v25, 1), v28, v26));
  }
  long long v22 = *(_OWORD *)&v31.a;
  long long v23 = *(_OWORD *)&v31.tx;
  *(_OWORD *)&retstr->var2.c = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->var2.tdouble x = v23;
  retstr->var1 = v21;
  *(_OWORD *)&retstr->var2.a = v22;
  retstr->var0.origin.double x = v15;
  retstr->var0.origin.double y = v16;
  retstr->var0.size.double width = v12;
  retstr->var0.size.double height = v11;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4 safeAreaInsets:(int64_t)a5
{
  objc_msgSend(a2, "reviewScreenScrubberBarFrameForReferenceBounds:safeAreaInsets:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6.top, a6.left, a6.bottom, a6.right);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenControlBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "reviewScreenControlBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenTopBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "reviewScreenTopBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  unint64_t v15 = PUReviewScreenSizeClassForReferenceSize(a4.size.width, a4.size.height);
  BOOL v16 = v15 < 6;
  BOOL v17 = (unint64_t)(a6 - 3) < 2;
  int v18 = v17 && v16;
  if (v17 && v16) {
    double v19 = width;
  }
  else {
    double v19 = height;
  }
  if (v17 && v16) {
    double v20 = height;
  }
  else {
    double v20 = width;
  }
  BOOL v21 = v19 == 0.0 || v20 == 0.0;
  double v22 = v20 / v19;
  if (v21) {
    double v22 = 1.0;
  }
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", v15 == 0, v22, x, y, v10, v9);
  CGFloat v24 = v23;
  double v26 = v25;
  CGFloat v27 = *MEMORY[0x1E4F1DAD8];
  CGFloat v28 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)UIRectGetCenter();
  v32.double x = v30;
  v32.double y = v31;
  if (v18)
  {
    memset(&v44, 0, sizeof(v44));
    float64x2_t v38 = (float64x2_t)v32;
    double v39 = v30;
    PUReviewScreenAffineTransformForOrientation(&v44, a6);
    float64x2_t v42 = 0u;
    float64x2_t v43 = 0u;
    CGAffineTransform v40 = v44;
    float64x2_t v41 = 0u;
    CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_transformForRotationAboutCenterOfReferenceBounds:withOrientationTransform:", &v40, x, y, v10, v9);
    CGPoint v32 = (CGPoint)vaddq_f64(v43, vmlaq_n_f64(vmulq_laneq_f64(v42, v38, 1), v41, v39));
    CGFloat v33 = v26;
  }
  else
  {
    CGFloat v33 = v24;
    CGFloat v24 = v26;
  }
  retstr->var0.origin.double x = v27;
  retstr->var0.origin.double y = v28;
  retstr->var0.size.double width = v33;
  retstr->var0.size.double height = v24;
  uint64_t v34 = MEMORY[0x1E4F1DAB8];
  long long v35 = *MEMORY[0x1E4F1DAB8];
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  retstr->var1 = v32;
  *(_OWORD *)&retstr->var2.a = v35;
  long long v37 = *(_OWORD *)(v34 + 32);
  *(_OWORD *)&retstr->var2.c = v36;
  *(_OWORD *)&retstr->var2.tdouble x = v37;
  return result;
}

+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v10 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v10, x, y, width, height);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [a1 _reviewScreenScrubberBarHeightForSizeClass:v10];
  double v20 = v19;
  double v21 = bottom + v19;
  v26.origin.double x = v12;
  v26.origin.double y = v14;
  v26.size.double width = v16;
  v26.size.double height = v18;
  double v22 = CGRectGetMaxY(v26) - v20;
  double v23 = v12;
  double v24 = v16;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v22;
  result.origin.double x = v23;
  return result;
}

+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3
{
  objc_msgSend(a1, "reviewScreenScrubberBarFrameForReferenceBounds:safeAreaInsets:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (double)_reviewScreenScrubberBarHeightForSizeClass:(unint64_t)a3
{
  double result = 0.0;
  if (a3 == 7)
  {
    if (PUPixelWidth_onceToken != -1) {
      dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_2);
    }
    return *(double *)&PUPixelWidth_pixelWidth + 47.5;
  }
  return result;
}

+ (CGRect)reviewScreenControlBarFrameForReferenceBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v25 = width;
  double v26 = height;
  uint64_t v27 = v8;
  [a1 _reviewScreenControlBarHeightForSizeSpec:&v25];
  double v18 = v17;
  double v25 = width;
  double v26 = height;
  uint64_t v27 = v8;
  [a1 _reviewScreenControlBarWidthForSizeSpec:&v25];
  double v20 = v19;
  if (v18 == 0.0)
  {
    v28.origin.double x = v10;
    v28.origin.double y = v12;
    v28.size.double width = v14;
    v28.size.double height = v16;
    double v10 = CGRectGetMaxX(v28) - v20;
    CGFloat v14 = v20;
  }
  else if (v19 == 0.0)
  {
    v29.origin.double x = v10;
    v29.origin.double y = v12;
    v29.size.double width = v14;
    v29.size.double height = v16;
    double v12 = CGRectGetMaxY(v29) - v18;
    CGFloat v16 = v18;
  }
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (double)_reviewScreenControlBarWidthForSizeSpec:(id *)a3
{
  $015D2AA2D21426A443873F5C96699A92 v4 = *a3;
  [a1 _cameraBottomBarWidthForSizeSpec:&v4];
  return result;
}

+ (double)_reviewScreenControlBarHeightForSizeSpec:(id *)a3
{
  if (!a3->var1) {
    return 141.0;
  }
  $015D2AA2D21426A443873F5C96699A92 v9 = *a3;
  [a1 _cameraBottomBarHeightForSizeSpec:&v9];
  double v6 = v5;
  $015D2AA2D21426A443873F5C96699A92 v9 = *a3;
  [a1 _layoutMarginInsetsForSizeSpec:&v9];
  return v6 + v7;
}

+ (CGRect)reviewScreenTopBarFrameForReferenceBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  *(double *)double v17 = width;
  *(double *)&v17[1] = height;
  v17[2] = PUReviewScreenSizeClassForReferenceSize(width, height);
  [a1 _reviewScreenTopBarHeightForSizeSpec:v17];
  double v13 = v12;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

+ (double)_reviewScreenTopBarHeightForSizeSpec:(id *)a3
{
  $015D2AA2D21426A443873F5C96699A92 v9 = *a3;
  [a1 _cameraTopBarHeightForSizeSpec:&v9];
  if (result == 0.0) {
    double result = 98.0;
  }
  unint64_t var1 = a3->var1;
  BOOL v6 = var1 > 5;
  uint64_t v7 = (1 << var1) & 0x32;
  if (!v6 && v7 != 0) {
    return 105.0;
  }
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5 shouldShiftPreviewForUtilityBar:(int64_t)a6
{
  BOOL v7 = a7;
  double height = a5.height;
  double width = a5.width;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memset(&v28, 0, sizeof(v28));
  PUReviewScreenAffineTransformForOrientation(&v28, a6);
  BOOL v16 = height == 0.0 || width == 0.0;
  double v17 = width / height;
  if (v16) {
    double v17 = 1.0;
  }
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", v7, v17, x, y, v11, v10);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v22 = *MEMORY[0x1E4F1DAD8];
  CGFloat v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->unint64_t var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  double result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)UIRectGetCenter();
  long long v25 = *(_OWORD *)&v28.c;
  *(_OWORD *)&retstr->var2.a = *(_OWORD *)&v28.a;
  *(_OWORD *)&retstr->var2.c = v25;
  *(_OWORD *)&retstr->var2.tdouble x = *(_OWORD *)&v28.tx;
  retstr->var1.double x = v26;
  retstr->var1.double y = v27;
  retstr->var0.origin.double x = v22;
  retstr->var0.origin.double y = v23;
  retstr->var0.size.double width = v19;
  retstr->var0.size.double height = v21;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraBottomBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "cameraBottomBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->unint64_t var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraTopBarGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  objc_msgSend(a2, "cameraTopBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->unint64_t var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForCameraTopBarFrame:inReferenceBounds:forContentSize:orientation:", a6, *(void *)&width, *(void *)&height);
}

+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4 shouldShiftPreviewForUtilityBar:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  unint64_t v12 = PUReviewScreenSizeClassForReferenceSize(a4.size.width, a4.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v12, x, y, width, height);
  double v61 = PURectWithAspectRatioFittingRect(a3, v13, v14, v15, v16);
  double v18 = v17;
  CGFloat v20 = v19;
  double v22 = v21;
  int v23 = PXFloatEqualToFloatWithTolerance();
  int v24 = PXFloatEqualToFloatWithTolerance();
  char v25 = PXFloatEqualToFloatWithTolerance();
  if (v12 > 5 || ((1 << v12) & 0x32) == 0)
  {
    int v30 = 0;
    BOOL v29 = v12 < 6;
    BOOL v26 = v12 == 6;
    goto LABEL_6;
  }
  BOOL v26 = 0;
  BOOL v27 = 0;
  int v28 = 0;
  BOOL v29 = 1;
  int v30 = 1;
  int v31 = 1;
  if ((v25 & 1) == 0)
  {
LABEL_6:
    int v28 = v30 | v24 & v29 ^ 1;
    BOOL v27 = v26;
    int v31 = v30;
  }
  int v32 = v27 | v29 | v31;
  if (!v23) {
    int v32 = v27;
  }
  if (((v27 | v28) & 1) == 0)
  {
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    if (v5)
    {
      v63.origin.double x = x;
      v63.origin.double y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      double MinY = CGRectGetMinY(v63);
LABEL_16:
      double v18 = MinY;
      goto LABEL_17;
    }
LABEL_15:
    double MinY = CGRectGetMaxY(*(CGRect *)&v35);
    goto LABEL_16;
  }
  if ((v24 & v31) != 0)
  {
    objc_msgSend(a1, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    double v34 = v33;
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    if (!v5)
    {
      double v18 = v34 - v22;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v32)
  {
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v59 = v49;
    CGFloat v60 = v48;
    objc_msgSend(a1, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    v64.origin.double x = v45;
    v64.origin.double y = v47;
    v64.size.double height = v59;
    v64.size.double width = v60;
    double MaxY = CGRectGetMaxY(v64);
    v65.origin.double x = v51;
    v65.origin.double y = v53;
    v65.size.double width = v55;
    v65.size.double height = v57;
    double v18 = (MaxY + CGRectGetMinY(v65)) * 0.5 - v22 * 0.5;
  }
LABEL_17:
  double v40 = PURoundRectToPixel(v61, v18, v20, v22);
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.double y = v41;
  result.origin.double x = v40;
  return result;
}

+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4
{
  objc_msgSend(a1, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", 0, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (CGRect)cameraBottomBarFrameForReferenceBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v27 = width;
  double v28 = height;
  uint64_t v29 = v8;
  [a1 _cameraBottomBarWidthForSizeSpec:&v27];
  double v18 = v17;
  double v27 = width;
  double v28 = height;
  uint64_t v29 = v8;
  [a1 _cameraBottomBarHeightForSizeSpec:&v27];
  double v20 = v19;
  double v27 = width;
  double v28 = height;
  uint64_t v29 = v8;
  [a1 _layoutMarginInsetsForSizeSpec:&v27];
  if (v18 == 0.0)
  {
    double v22 = v21;
    v30.origin.double x = v10;
    v30.origin.double y = v12;
    v30.size.double width = v14;
    v30.size.double height = v16;
    double v12 = CGRectGetMaxY(v30) - v22 - v20;
  }
  else if (v20 == 0.0)
  {
    v31.origin.double x = v10;
    v31.origin.double y = v12;
    v31.size.double width = v14;
    v31.size.double height = v16;
    double v10 = CGRectGetMaxX(v31) - v18;
    CGFloat v14 = v18;
    double v20 = v16;
  }
  else
  {
    CGFloat v14 = v18;
  }
  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v20;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (double)_cameraBottomBarWidthForSizeSpec:(id *)a3
{
  double result = 0.0;
  if (a3->var1 == 7)
  {
    double result = a3->var0.width * 0.109375 + 18.0;
    if (result > 130.0) {
      double result = 130.0;
    }
    if (result < 102.0) {
      return 102.0;
    }
  }
  return result;
}

+ (double)_cameraBottomBarHeightForSizeSpec:(id *)a3
{
  switch(a3->var1)
  {
    case 0uLL:
      if (PUPixelWidth_onceToken != -1) {
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_2);
      }
      double result = *(double *)&PUPixelWidth_pixelWidth + 101.0;
      break;
    case 1uLL:
      if (PUPixelWidth_onceToken != -1) {
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_2);
      }
      double result = 119.0 - *(double *)&PUPixelWidth_pixelWidth;
      break;
    case 2uLL:
      double result = 123.0;
      break;
    case 3uLL:
      double result = 140.0;
      break;
    case 4uLL:
      double result = 135.0;
      break;
    case 5uLL:
      double result = 145.0;
      break;
    case 6uLL:
      if (PUPixelWidth_onceToken != -1)
      {
        double v5 = a3;
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_2);
        a3 = v5;
      }
      double result = *(double *)&PUPixelWidth_pixelWidth + 101.0;
      CGFloat v4 = a3->var0.width * 0.409574 + -29.5638;
      if (v4 > 140.0) {
        CGFloat v4 = 140.0;
      }
      if (v4 >= result) {
        double result = v4;
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (CGRect)cameraTopBarFrameForReferenceBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v25 = width;
  double v26 = height;
  uint64_t v27 = v8;
  [a1 _cameraTopBarHeightForSizeSpec:&v25];
  double v18 = v17;
  double v25 = width;
  double v26 = height;
  uint64_t v27 = v8;
  [a1 _layoutMarginInsetsForSizeSpec:&v25];
  double v20 = v19;
  v28.origin.double x = v10;
  v28.origin.double y = v12;
  v28.size.double width = v14;
  v28.size.double height = v16;
  double v21 = v20 + CGRectGetMinY(v28);
  double v22 = v10;
  double v23 = v14;
  double v24 = v18;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v21;
  result.origin.double x = v22;
  return result;
}

+ (double)_cameraTopBarHeightForSizeSpec:(id *)a3
{
  unint64_t var1 = a3->var1;
  if (var1 - 1 < 5) {
    return 44.0;
  }
  if (var1 == 6)
  {
    double result = a3->var0.width * 0.0727273 + 16.7273;
    if (result > 44.0) {
      double result = 44.0;
    }
    if (result < 40.0) {
      return 40.0;
    }
  }
  else
  {
    double result = 0.0;
    if (!var1) {
      return 40.0;
    }
  }
  return result;
}

+ (BOOL)useCompactControlBarButtonsForReferenceBounds:(CGRect)a3
{
  double width = a3.size.width;
  uint64_t v4 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  if (v4 != 6) {
    return v4 == 0;
  }
  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 _referenceBounds];
  double v8 = v7;

  return width < v8 * 0.5;
}

+ (unint64_t)doneButtonStyleForReferenceBounds:(CGRect)a3
{
  unint64_t v3 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  if (v3 >= 2) {
    return v3 != 7;
  }
  else {
    return 2;
  }
}

+ (UIEdgeInsets)_layoutMarginInsetsForSizeSpec:(id *)a3
{
  unint64_t var1 = a3->var1;
  switch(var1)
  {
    case 5uLL:
      $015D2AA2D21426A443873F5C96699A92 v10 = *a3;
      [a1 _cameraBottomBarHeightForSizeSpec:&v10];
      double v5 = 230.0;
      break;
    case 4uLL:
      $015D2AA2D21426A443873F5C96699A92 v10 = *a3;
      [a1 _cameraBottomBarHeightForSizeSpec:&v10];
      double v5 = 203.0;
      break;
    case 1uLL:
      $015D2AA2D21426A443873F5C96699A92 v10 = *a3;
      [a1 _cameraBottomBarHeightForSizeSpec:&v10];
      double v5 = 154.0;
      break;
    default:
      double v7 = *MEMORY[0x1E4FB2848];
      double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      goto LABEL_9;
  }
  double v6 = v5 - v4;
  double v7 = 30.0;
  double v8 = 0.0;
  double v9 = 0.0;
LABEL_9:
  result.right = v8;
  result.double bottom = v6;
  result.left = v9;
  result.top = v7;
  return result;
}

@end