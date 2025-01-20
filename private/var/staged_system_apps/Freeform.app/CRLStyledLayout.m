@interface CRLStyledLayout
- (BOOL)isDraggable;
- (BOOL)isInvisible;
- (BOOL)supportsFlipping;
- (BOOL)suppressesShadowsAndReflections;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)alignmentFrameInRoot;
- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (double)opacity;
- (double)scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:(CGAffineTransform *)a3 withStartingPathSource:(id)a4;
- (void)dynamicOpacityChangeDidBegin;
- (void)dynamicOpacityChangeDidEnd;
- (void)dynamicOpacityUpdateToValue:(double)a3;
- (void)setSuppressesShadowsAndReflections:(BOOL)a3;
@end

@implementation CRLStyledLayout

- (void)setSuppressesShadowsAndReflections:(BOOL)a3
{
  if (BYTE2(self->mDynamicOpacity) != a3)
  {
    BYTE2(self->mDynamicOpacity) = a3;
    id v5 = [(CRLCanvasLayout *)self layoutController];
    v4 = [v5 canvas];
    [v4 canvasInvalidatedForLayout:self];
  }
}

- (double)scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:(CGAffineTransform *)a3 withStartingPathSource:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v8 = [(CRLCanvasAbstractLayout *)self parent];
  v9 = sub_1002469D0(v7, v8);

  if (v9)
  {
    [v9 maximumFrameSizeForChild:self];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = 1.79769313e308;
    double v13 = 1.79769313e308;
  }
  if (v11 >= 1.79769313e308)
  {
    double v14 = 1.0;
    if (v13 >= 1.79769313e308) {
      goto LABEL_78;
    }
  }
  v15 = [(CRLCanvasLayout *)self stroke];
  id v16 = [v6 copy];
  [v16 naturalSize];
  double v89 = v18;
  double v90 = v17;
  [v16 naturalSize];
  double v20 = v19;
  double v22 = v21;
  unsigned int v23 = 0;
  double v92 = v11;
  double v91 = v13;
  while (1)
  {
    v24 = [v16 bezierPath];
    long long v25 = *(_OWORD *)&a3->c;
    *(_OWORD *)v101 = *(_OWORD *)&a3->a;
    *(_OWORD *)&v101[16] = v25;
    *(_OWORD *)&v101[32] = *(_OWORD *)&a3->tx;
    if (!CGAffineTransformIsIdentity((CGAffineTransform *)v101))
    {
      long long v26 = *(_OWORD *)&a3->c;
      *(_OWORD *)v101 = *(_OWORD *)&a3->a;
      *(_OWORD *)&v101[16] = v26;
      *(_OWORD *)&v101[32] = *(_OWORD *)&a3->tx;
      [v24 transformUsingAffineTransform:v101];
    }
    [v24 boundsIncludingCRLStroke:v15];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v35 = sub_100064680(v31, v33, v11);
    if (!v23 && v35 <= 0.0 && v36 <= 0.0) {
      break;
    }
    if (!v23)
    {
      [v24 bounds:v35];
      CGFloat x = v106.origin.x;
      CGFloat y = v106.origin.y;
      CGFloat width = v106.size.width;
      CGFloat height = v106.size.height;
      CGFloat v97 = v106.size.height;
      double MinY = CGRectGetMinY(v106);
      v107.origin.CGFloat x = v28;
      v107.origin.CGFloat y = v30;
      v107.size.CGFloat width = v32;
      v107.size.CGFloat height = v34;
      double v95 = CGRectGetMinY(v107);
      v108.origin.CGFloat x = x;
      v108.origin.CGFloat y = y;
      v108.size.CGFloat width = width;
      v108.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v108);
      v109.origin.CGFloat x = v28;
      v109.origin.CGFloat y = v30;
      v109.size.CGFloat width = v32;
      v109.size.CGFloat height = v34;
      double log = MinX - CGRectGetMinX(v109);
      v110.origin.CGFloat x = v28;
      v110.origin.CGFloat y = v30;
      v110.size.CGFloat width = v32;
      v110.size.CGFloat height = v34;
      double MaxY = CGRectGetMaxY(v110);
      v111.origin.CGFloat x = x;
      v111.origin.CGFloat y = y;
      v111.size.CGFloat width = width;
      v111.size.CGFloat height = v97;
      double v93 = CGRectGetMaxY(v111);
      v112.origin.CGFloat x = v28;
      v112.origin.CGFloat y = v30;
      v112.size.CGFloat width = v32;
      v112.size.CGFloat height = v34;
      double MaxX = CGRectGetMaxX(v112);
      v113.origin.CGFloat x = x;
      v113.origin.CGFloat y = y;
      v113.size.CGFloat width = width;
      double v11 = v92;
      v113.size.CGFloat height = v97;
      double v60 = MaxX - CGRectGetMaxX(v113);
      double v13 = v91;
      sub_100064680(v92, v91, 0.01);
      sub_100064070();
      double v62 = v61;
      double v64 = v63 - (log + v60);
      [(CRLCanvasLayout *)self minimumSize];
      if (v64 < v65
        || (double v66 = v62 - (MinY - v95 + MaxY - v93), [(CRLCanvasLayout *)self minimumSize], v66 < v67))
      {
        [(CRLCanvasLayout *)self minimumSize];
        [v16 scaleToNaturalSize];
        [v16 naturalSize];
        double v20 = v76;
        double v22 = v77;
        break;
      }
      unsigned int v68 = [v24 isLineSegment];
      [v16 naturalSize];
      if (v68)
      {
LABEL_52:
        double v53 = sub_10006732C(v69, v70, v64, v66);
      }
      else
      {
        if (v69 == 0.0 || ([v16 naturalSize], v71 == 0.0))
        {
          [v16 naturalSize];
          goto LABEL_52;
        }
        [v16 naturalSize];
        double v53 = sub_10006729C(0, v74, v75, v64, v66);
      }
LABEL_53:
      [v16 scaleToNaturalSize:v53];
      [v16 naturalSize];
      double v20 = v72;
      double v22 = v73;
      goto LABEL_54;
    }
    BOOL v37 = v35 > 0.0 || v35 <= -1.0;
    if (!v37 && v36 <= 0.0 || v35 <= 0.0 && v36 <= 0.0 && v36 > -1.0) {
      break;
    }
    if (v23 <= 3)
    {
      BOOL v40 = v36 <= 0.0 && v35 <= 0.0 || v11 <= 0.5 || v13 <= 0.5;
      double v41 = v11;
      double v42 = v13;
      if (!v40) {
        double v41 = sub_100064680(v11, v13, 0.5);
      }
      double v43 = v41 / v32;
      double v44 = v42 / v34;
      if (v44 >= 1.0 || v43 <= 1.0) {
        double v46 = v43;
      }
      else {
        double v46 = v44;
      }
      if (v43 < 1.0 && v44 > 1.0) {
        double v46 = v43;
      }
      else {
        double v43 = v44;
      }
      float v47 = v46;
      float v48 = v43;
      float v49 = fminf(v47, v48);
      if (v49 == 0.0) {
        double v50 = 0.001;
      }
      else {
        double v50 = v49;
      }
      [v16 naturalSize];
      double v53 = sub_1000646A4(v51, v52, v50);
      goto LABEL_53;
    }
LABEL_54:

    if (++v23 == 5) {
      goto LABEL_59;
    }
  }

LABEL_59:
  double v14 = 1.0;
  if (v90 != v20 || v89 != v22)
  {
    double v78 = v20 / v90;
    double v79 = v22 / v89;
    double v14 = v22 / v89;
    if (v20 / v90 != 0.0)
    {
      double v14 = v20 / v90;
      if (v79 != 0.0)
      {
        if (v78 >= v79) {
          double v14 = v22 / v89;
        }
        else {
          double v14 = v20 / v90;
        }
      }
    }
    if (v14 >= 0.0 && v14 <= 0.0)
    {
      int v80 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCC78);
      }
      v81 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        loga = v81;
        v104.CGFloat width = v90;
        v104.CGFloat height = v89;
        v98 = NSStringFromCGSize(v104);
        v105.CGFloat width = v20;
        v105.CGFloat height = v22;
        v88 = NSStringFromCGSize(v105);
        *(_DWORD *)v101 = 67110402;
        *(_DWORD *)&v101[4] = v80;
        *(_WORD *)&v101[8] = 2082;
        *(void *)&v101[10] = "-[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:]";
        *(_WORD *)&v101[18] = 2082;
        *(void *)&v101[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledLayout.m";
        *(_WORD *)&v101[28] = 1024;
        *(_DWORD *)&v101[30] = 187;
        *(_WORD *)&v101[34] = 2112;
        *(void *)&v101[36] = v98;
        *(_WORD *)&v101[44] = 2112;
        *(void *)&v101[46] = v88;
        _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unclamping due to sad math. original natural size %@ proposed natural size %@", v101, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCC98);
      }
      v82 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v82, v80);
      }
      v83 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:]");
      v84 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledLayout.m"];
      v102.CGFloat width = v90;
      v102.CGFloat height = v89;
      v85 = NSStringFromCGSize(v102);
      v103.CGFloat width = v20;
      v103.CGFloat height = v22;
      v86 = NSStringFromCGSize(v103);
      +[CRLAssertionHandler handleFailureInFunction:v83, v84, 187, 0, "Unclamping due to sad math. original natural size %@ proposed natural size %@", v85, v86 file lineNumber isFatal description];

      double v14 = 1.0;
    }
  }

LABEL_78:
  return v14;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  [(CRLCanvasAbstractLayout *)self alignmentFrame];

  double v8 = sub_100067584(v4, v5, v6, v7, a3);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  v3 = [(CRLCanvasAbstractLayout *)self parent];

  [(CRLCanvasAbstractLayout *)self alignmentFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (v3)
  {
    double v12 = [(CRLCanvasAbstractLayout *)self parent];
    double v13 = v12;
    if (v12) {
      [v12 transformInRoot];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  [(CRLCanvasAbstractLayout *)self alignmentFrame];
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v5.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tCGFloat x = *(_OWORD *)&a3->tx;
  return CGRectApplyAffineTransform(v6, &v5);
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)CRLStyledLayout;
  long long v9 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v9;
  v30[2] = *(_OWORD *)&a4->tx;
  -[CRLCanvasLayout frameForCullingWithBaseFrame:additionalTransform:](&v31, "frameForCullingWithBaseFrame:additionalTransform:", v30, a3.origin.x, y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  if (!CGRectIsEmpty(v32))
  {
    CGAffineTransform v18 = [(CRLCanvasLayout *)self layoutController];
    CGRect v19 = [v18 canvas];
    if ([v19 suppressesShadowsAndReflections])
    {
    }
    else
    {
      unsigned __int8 v20 = [(CRLStyledLayout *)self suppressesShadowsAndReflections];

      if (v20) {
        goto LABEL_6;
      }
      long long v25 = [(CRLStyledLayout *)self styledInfo];
      CGAffineTransform v18 = [v25 shadow];

      if (v18 && [v18 isEnabled])
      {
        [v18 shadowBoundsForRect:x, y, width, height];
        v36.origin.double x = v26;
        v36.origin.double y = v27;
        v36.size.double width = v28;
        v36.size.double height = v29;
        v33.origin.double x = v11;
        v33.origin.double y = v13;
        v33.size.double width = v15;
        v33.size.double height = v17;
        CGRect v34 = CGRectUnion(v33, v36);
        CGFloat v11 = v34.origin.x;
        CGFloat v13 = v34.origin.y;
        CGFloat v15 = v34.size.width;
        CGFloat v17 = v34.size.height;
      }
    }
  }
LABEL_6:
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  double v24 = v17;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)dynamicOpacityChangeDidBegin
{
  BYTE2(self->super._dynamicInfoGeometry) = 1;
}

- (void)dynamicOpacityUpdateToValue:(double)a3
{
  *(double *)(&self->mIsUpdatingOpacity + 2) = a3;
  long long v4 = [(CRLCanvasLayout *)self layoutController];
  CGAffineTransform v5 = [v4 canvas];
  id v7 = [v5 canvasController];

  CGRect v6 = [v7 repForLayout:self];
  [v6 processChangedProperty:17];
}

- (void)dynamicOpacityChangeDidEnd
{
  BYTE2(self->super._dynamicInfoGeometry) = 0;
  v3 = [(CRLCanvasLayout *)self layoutController];
  long long v4 = [v3 canvas];
  id v6 = [v4 canvasController];

  CGAffineTransform v5 = [v6 repForLayout:self];
  [v5 processChangedProperty:17];
}

- (double)opacity
{
  if (BYTE2(self->super._dynamicInfoGeometry)) {
    return *(double *)(&self->mIsUpdatingOpacity + 2);
  }
  else {
    return 1.0;
  }
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)supportsFlipping
{
  return 1;
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)suppressesShadowsAndReflections
{
  return BYTE2(self->mDynamicOpacity);
}

@end