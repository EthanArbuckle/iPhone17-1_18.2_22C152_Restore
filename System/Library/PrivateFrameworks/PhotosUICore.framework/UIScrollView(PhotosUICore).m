@interface UIScrollView(PhotosUICore)
+ (double)_convertDampingRatio:()PhotosUICore response:toMass:stiffness:damping:;
- (BOOL)_px_isScrolledAtEdge:()PhotosUICore tolerance:;
- (BOOL)px_isPerformingScrollTest;
- (double)_px_currentContentSize;
- (double)px_contentOffsetYFraction;
- (long)px_decelerationOffsetForInitialVelocity:()PhotosUICore;
- (long)px_initialVelocityForDecelerationOffset:()PhotosUICore;
- (uint64_t)px_cancelScrollAnimation;
- (uint64_t)px_cancelScrollGesture;
- (uint64_t)px_contentOffsetForEdge:()PhotosUICore;
- (uint64_t)px_isBouncing;
- (uint64_t)px_isDecelerating;
- (uint64_t)px_isScrolledAtEdge:()PhotosUICore;
- (uint64_t)px_isScrolledAtEdge:()PhotosUICore tolerance:;
- (uint64_t)px_isScrolledBeyondEdge:()PhotosUICore;
- (uint64_t)px_performDecelerationWithInitialVelocity:()PhotosUICore axis:;
- (uint64_t)px_scrollToContentOffset:()PhotosUICore animated:;
- (uint64_t)px_scrollToEdge:()PhotosUICore animated:;
- (void)px_adjustInsetsForKeyboardInfo:()PhotosUICore safeAreaInsets:;
- (void)px_constrainedContentOffset:()PhotosUICore;
- (void)px_contentOffsetForEdge:()PhotosUICore padding:;
- (void)px_maximumContentOffset;
- (void)px_minimumContentOffset;
- (void)px_performDecelerationWithInitialVelocity:()PhotosUICore axis:targetContentOffsetForProposedOffset:;
- (void)px_scrollDistanceFromEdge:()PhotosUICore;
- (void)px_scrollableAxis;
@end

@implementation UIScrollView(PhotosUICore)

- (uint64_t)px_isScrolledAtEdge:()PhotosUICore tolerance:
{
  if (a4 < 0.0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"UIScrollView+PhotosUICore.m", 73, @"Invalid parameter not satisfying: %@", @"tolerance >= 0.0f" object file lineNumber description];
  }
  return objc_msgSend(a1, "_px_isScrolledAtEdge:tolerance:", a3, a4);
}

- (BOOL)_px_isScrolledAtEdge:()PhotosUICore tolerance:
{
  objc_msgSend(a1, "px_scrollDistanceFromEdge:");
  return v3 <= a2;
}

- (void)px_scrollDistanceFromEdge:()PhotosUICore
{
  [a1 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v11 = v9;
  CGFloat v12 = v10;
  [a1 contentOffset];
  objc_msgSend(a1, "_px_currentContentSize");
  [a1 adjustedContentInset];
  switch(a3)
  {
    case 2:
      v13.origin.x = v6;
      v13.origin.y = v8;
      v13.size.width = v11;
      v13.size.height = v12;
      CGRectGetWidth(v13);
      break;
    case 3:
      v14.origin.x = v6;
      v14.origin.y = v8;
      v14.size.width = v11;
      v14.size.height = v12;
      CGRectGetHeight(v14);
      break;
    default:
      return;
  }
}

- (void)px_constrainedContentOffset:()PhotosUICore
{
  [a1 bounds];
  objc_msgSend(a1, "_px_currentContentSize");
  [a1 adjustedContentInset];
  objc_msgSend(a1, "px_screenScale", v4, v3, v2);
  PXSizeCeilingToPixel();
}

- (double)_px_currentContentSize
{
  [a1 contentSize];
  double v3 = v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [a1 collectionViewLayout];
    [v4 collectionViewContentSize];
    double v3 = v5;
  }
  return v3;
}

- (uint64_t)px_isBouncing
{
  unint64_t v2 = objc_msgSend(a1, "px_scrollableAxis");
  if (v2)
  {
    if (objc_msgSend(a1, "px_isScrolledBeyondEdge:", 0)) {
      return 1;
    }
    unsigned int v3 = objc_msgSend(a1, "px_isScrolledBeyondEdge:", 2);
  }
  else
  {
    unsigned int v3 = 0;
  }
  uint64_t v4 = (v2 >> 1) & 1 | v3;
  if ((v2 & 2) == 0) {
    return v4;
  }
  if (v3) {
    return v4;
  }
  uint64_t v4 = 1;
  if (objc_msgSend(a1, "px_isScrolledBeyondEdge:", 1)) {
    return v4;
  }
  return objc_msgSend(a1, "px_isScrolledBeyondEdge:", 3);
}

- (void)px_scrollableAxis
{
}

- (void)px_performDecelerationWithInitialVelocity:()PhotosUICore axis:targetContentOffsetForProposedOffset:
{
  id v5 = a4;
  [a1 decelerationRate];
  log(v6);
  [a1 contentOffset];
  PXPointValueForAxis();
}

- (uint64_t)px_performDecelerationWithInitialVelocity:()PhotosUICore axis:
{
  return objc_msgSend(a1, "px_performDecelerationWithInitialVelocity:axis:targetContentOffsetForProposedOffset:", a3, &__block_literal_global_61277);
}

- (long)px_initialVelocityForDecelerationOffset:()PhotosUICore
{
  BOOL v3 = a2 < 0.0;
  [a1 decelerationRate];
  return (dbl_1AB359D00[v3] - log(v4) * a2) * -1000.0;
}

- (long)px_decelerationOffsetForInitialVelocity:()PhotosUICore
{
  [a1 decelerationRate];
  return 0.0 - (a2 / -1000.0 - dbl_1AB359D00[a2 / -1000.0 < 0.0]) / log(v3);
}

- (double)px_contentOffsetYFraction
{
  objc_msgSend(a1, "px_minimumContentOffset");
  double v3 = v2;
  objc_msgSend(a1, "px_maximumContentOffset");
  double v5 = v4 - v3;
  [a1 contentOffset];
  if (fabs((v6 - v3) / v5) != INFINITY)
  {
    PXFloatSaturate();
  }
  return 0.0;
}

- (void)px_maximumContentOffset
{
}

- (void)px_minimumContentOffset
{
}

- (BOOL)px_isPerformingScrollTest
{
  v1 = [a1 scrollTestParameters];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)px_cancelScrollAnimation
{
  [a1 contentOffset];
  return objc_msgSend(a1, "setContentOffset:animated:", 0);
}

- (uint64_t)px_cancelScrollGesture
{
  uint64_t result = [a1 isScrollEnabled];
  if (result)
  {
    if (objc_opt_respondsToSelector())
    {
      return [a1 _forcePanGestureToEndImmediately];
    }
    else
    {
      [a1 setScrollEnabled:0];
      return [a1 setScrollEnabled:1];
    }
  }
  return result;
}

- (void)px_adjustInsetsForKeyboardInfo:()PhotosUICore safeAreaInsets:
{
  id v8 = a6;
  double v9 = [v8 objectForKey:*MEMORY[0x1E4FB2BD8]];
  if (v9)
  {
    double v10 = [a1 superview];
    [a1 frame];
    objc_msgSend(v10, "convertRect:toView:", 0);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [a1 window];
    objc_msgSend(v19, "convertRect:toView:", 0, v12, v14, v16, v18);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    [v9 CGRectValue];
    v63.origin.double x = v28;
    v63.origin.double y = v29;
    v63.size.double width = v30;
    v63.size.double height = v31;
    v60.origin.double x = v21;
    v60.origin.double y = v23;
    v60.size.double width = v25;
    v60.size.double height = v27;
    CGRect v61 = CGRectIntersection(v60, v63);
    double x = v61.origin.x;
    double y = v61.origin.y;
    double width = v61.size.width;
    double height = v61.size.height;
    if (CGRectIsNull(v61)
      || (v62.origin.double x = x, v62.origin.y = y, v62.size.width = width, v62.size.height = height, CGRectIsEmpty(v62)))
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    v36 = [a1 window];
    objc_msgSend(v36, "convertRect:fromWindow:", 0, x, y, width, height);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;

    v45 = [a1 superview];
    objc_msgSend(v45, "convertRect:fromView:", 0, v38, v40, v42, v44);
    double v47 = v46;

    [a1 contentInset];
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    uint64_t v53 = v52;
    if (v47 < a4) {
      double v47 = a4;
    }
    v54 = [v8 objectForKey:*MEMORY[0x1E4FB2BA8]];
    [v54 doubleValue];
    double v56 = v55;

    v57 = [v8 objectForKey:*MEMORY[0x1E4FB2BA0]];
    uint64_t v58 = [v57 integerValue];

    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __76__UIScrollView_PhotosUICore__px_adjustInsetsForKeyboardInfo_safeAreaInsets___block_invoke;
    v59[3] = &unk_1E5DD3630;
    v59[4] = a1;
    v59[5] = v49;
    v59[6] = v51;
    *(double *)&v59[7] = v47;
    v59[8] = v53;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v58 << 16 delay:v59 options:0 animations:v56 completion:0.0];
  }
}

- (uint64_t)px_isDecelerating
{
  if ([a1 isDecelerating]) {
    return 1;
  }
  return objc_msgSend(a1, "px_isBouncing");
}

- (void)px_contentOffsetForEdge:()PhotosUICore padding:
{
  [a1 bounds];
  [a1 contentOffset];
  objc_msgSend(a1, "_px_currentContentSize");
  objc_msgSend(a1, "adjustedContentInset", v2);
  PXEdgeInsetsAdd();
}

- (uint64_t)px_contentOffsetForEdge:()PhotosUICore
{
  return objc_msgSend(a1, "px_contentOffsetForEdge:padding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

- (uint64_t)px_scrollToEdge:()PhotosUICore animated:
{
  objc_msgSend(a1, "px_contentOffsetForEdge:");
  return objc_msgSend(a1, "px_scrollToContentOffset:animated:", a4);
}

- (uint64_t)px_isScrolledBeyondEdge:()PhotosUICore
{
  return objc_msgSend(a1, "_px_isScrolledAtEdge:tolerance:", -0.6);
}

- (uint64_t)px_isScrolledAtEdge:()PhotosUICore
{
  objc_msgSend(a1, "px_screenScale");
  if (v5 == 0.0) {
    double v6 = 0.5;
  }
  else {
    double v6 = 0.5 / v5;
  }
  return objc_msgSend(a1, "px_isScrolledAtEdge:tolerance:", a3, v6);
}

- (uint64_t)px_scrollToContentOffset:()PhotosUICore animated:
{
  objc_msgSend(a1, "px_constrainedContentOffset:");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

+ (double)_convertDampingRatio:()PhotosUICore response:toMass:stiffness:damping:
{
  double v7 = 6.28318531 / a2;
  if (a5) {
    *a5 = 0x3FF0000000000000;
  }
  double v8 = v7 * v7;
  if (a6) {
    *a6 = v8;
  }
  if (a7)
  {
    double v9 = sqrt(v8);
    uint64_t result = (v9 + v9) * result;
    *a7 = result;
  }
  return result;
}

@end