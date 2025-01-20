@interface CRLImageLayout
- (BOOL)allowsConnections;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)hasAlpha;
- (BOOL)hasMaskingPath;
- (BOOL)isDraggingInMaskEditMode;
- (BOOL)isInMaskEditMode;
- (BOOL)isInMaskScaleMode;
- (BOOL)isInvisible;
- (BOOL)isResizingInMaskEditMode;
- (BOOL)isRotatingInMaskEditMode;
- (BOOL)maskIntersectsImage;
- (BOOL)p_shouldUseDynamicInfoGeometryForOperation;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)supportsRotation;
- (CGAffineTransform)layoutToImageTransform;
- (CGAffineTransform)layoutToMaskTransform;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGPath)pathToStroke;
- (CGPoint)centerForConnecting;
- (CGPoint)centerForRotation;
- (CGPoint)centerForRotationInMaskMode;
- (CGRect)alignmentFrameForProvidingGuidesInRoot;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CGRect)pathBoundsWithoutStroke;
- (CGSize)sizeOfFrameRectIncludingCoverage;
- (CRLCanvasInfoGeometry)currentInfoGeometry;
- (CRLCanvasLayoutGeometry)imageGeometry;
- (CRLCanvasLayoutGeometry)imageGeometryInRoot;
- (CRLCanvasLayoutGeometry)originalImageGeometry;
- (CRLImageLayout)initWithInfo:(id)a3;
- (CRLMaskLayout)maskLayout;
- (CRLSmartPathSource)smartPathSource;
- (_TtC8Freeform12CRLImageItem)imageInfo;
- (id)childInfosForChildLayouts;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)commandToResetToSize:(CGSize)a3;
- (id)computeLayoutGeometry;
- (id)computeWrapPath;
- (id)geometryForTransforming;
- (id)inspectorGeometry;
- (id)layoutGeometryFromInfo;
- (id)p_inspectorGeometryForUnmaskedImage;
- (id)visibleGeometries;
- (int64_t)maskEditMode;
- (int64_t)maskEditModeForDragging;
- (int64_t)maskEditModeForFreeTransforming;
- (int64_t)maskEditModeForLayoutState;
- (int64_t)maskEditModeForResizing;
- (int64_t)maskEditModeForRotating;
- (void)beginDrag;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)beginEditingMaskInMaskEditMode:(int64_t)a3;
- (void)beginFreeTransformWithTracker:(id)a3;
- (void)beginResize;
- (void)beginRotate;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)endDrag;
- (void)endDynamicOperation;
- (void)endFreeTransform;
- (void)endMaskEditMode;
- (void)endResize;
- (void)endRotate;
- (void)maskModeScaleDidBegin;
- (void)maskModeScaleDidEnd;
- (void)maskWasApplied;
- (void)maskWasReset;
- (void)offsetGeometryBy:(CGPoint)a3;
- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4;
- (void)p_createDynamicCopiesIfNeeded;
- (void)p_destroyDynamicCopiesIfNeeded;
- (void)p_setDynamicInfoGeometry:(id)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)resizeWithTransform:(CGAffineTransform *)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeScaledImageGeometry:(id)a3 maskGeometry:(id)a4;
- (void)takeSizeFromTracker:(id)a3;
- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5;
- (void)updateChildrenFromInfo;
@end

@implementation CRLImageLayout

- (CRLImageLayout)initWithInfo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  v3 = [(CRLMediaLayout *)&v9 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CRLImageLayout *)v3 imageInfo];
    if (v5)
    {
      v6 = v5;
      v7 = [(CRLImageLayout *)v5 maskInfo];

      if (v7) {
        *(CRLCanvasInfoGeometry **)((char *)&v4->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
      }
    }
    else
    {
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  CGPathRelease(*(CGPathRef *)((char *)&self->mImageGeometry + 3));
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLImageLayout *)&v3 dealloc];
}

- (id)geometryForTransforming
{
  if ((id)[(CRLImageLayout *)self maskEditModeForLayoutState] == (id)3) {
    [(CRLImageLayout *)self imageGeometry];
  }
  else {
  objc_super v3 = [(CRLCanvasAbstractLayout *)self geometry];
  }

  return v3;
}

- (id)visibleGeometries
{
  v7.receiver = self;
  v7.super_class = (Class)CRLImageLayout;
  objc_super v3 = [(CRLCanvasAbstractLayout *)&v7 visibleGeometries];
  if ([(CRLImageLayout *)self isInMaskEditMode])
  {
    v4 = [(CRLImageLayout *)self imageGeometry];
    uint64_t v5 = [v3 arrayByAddingObject:v4];

    objc_super v3 = (void *)v5;
  }

  return v3;
}

- (CRLCanvasInfoGeometry)currentInfoGeometry
{
  v2 = *(void **)((char *)&self->mHasAlpha + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    v4 = [(CRLCanvasLayout *)self info];
    id v3 = [v4 geometry];
  }

  return (CRLCanvasInfoGeometry *)v3;
}

- (id)layoutGeometryFromInfo
{
  v2 = [(CRLImageLayout *)self currentInfoGeometry];
  id v3 = [CRLCanvasLayoutGeometry alloc];
  [v2 size];
  double v5 = v4;
  double v7 = v6;
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  v8 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v10, v5, v7);

  return v8;
}

- (id)computeLayoutGeometry
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasAbstractLayout *)self parent];
  double v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    [v5 maximumFrameSizeForChild:self];
  }
  else
  {
    double v6 = 1.79769313e308;
    double v7 = 1.79769313e308;
  }
  if (*(double *)((char *)&self->mLayoutToMaskTransform.ty + 3) != v6
    || *(double *)(&self->mMaskIntersectsImage + 3) != v7)
  {
    *(double *)((char *)&self->mLayoutToMaskTransform.ty + 3) = v6;
    *(double *)(&self->mMaskIntersectsImage + 3) = v7;
  }
  objc_super v9 = [(CRLImageLayout *)self maskLayout];
  if (v9)
  {
    v10 = [(CRLImageLayout *)self layoutGeometryFromInfo];
  }
  else
  {
    v86.receiver = self;
    v86.super_class = (Class)CRLImageLayout;
    v10 = [(CRLCanvasLayout *)&v86 computeLayoutGeometry];
  }
  v11 = v10;
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), v10);
  uint64_t v12 = objc_opt_class();
  v13 = [(CRLMediaLayout *)self stroke];
  v14 = sub_1002469D0(v12, v13);

  CGPathRelease(*(CGPathRef *)((char *)&self->mImageGeometry + 3));
  *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3) = 0;
  v15 = [(CRLImageLayout *)self imageInfo];
  if (v9)
  {
    [v9 setPathScale:1.0];
    v16 = [v9 computeLayoutGeometry];
    v71 = v5;
    v72 = v14;
    v70 = v15;
    if ([(CRLCanvasLayout *)self layoutState] != 3)
    {
      v17 = [v15 geometry];
      [v17 angle];
      double v19 = v18;
      v20 = [v15 maskInfo];
      v21 = [v20 geometry];
      [v21 angle];
      double v23 = v19 + v22;

      [v16 size];
      double v25 = v24;
      double v27 = v26;
      CGAffineTransformMakeRotation(&v85, v23 * 0.0174532925);
      -[CRLCanvasLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", &v85, v25, v27);
      CGFloat v29 = v28;
      CGAffineTransformMakeScale(&v84, v28, v28);
      uint64_t v30 = [v16 geometryByTransformingBy:&v84];

      CGAffineTransformMakeScale(&v83, v29, v29);
      v31 = [(CRLCanvasLayoutGeometry *)v11 geometryByTransformingBy:&v83];

      v32 = [(CRLImageLayout *)self maskLayout];
      [v32 setPathScale:v29];

      v33 = [(CRLImageLayout *)self maskLayout];
      [v33 setGeometry:v30];

      objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), v31);
      v16 = (void *)v30;
      v11 = v31;
    }
    v34 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v9 path]);
    [v9 pathBounds];
    CGAffineTransformMakeTranslation(&v82, -v35, -v36);
    [v34 transformUsingAffineTransform:&v82];
    [(CRLCanvasLayoutGeometry *)v11 size];
    v37 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&v80, 0, sizeof(v80));
    }
    CGAffineTransformInvert(&v81, &v80);
    [v37 transformUsingAffineTransform:&v81];
    if (v34)
    {
      id v42 = [v34 intersectBezierPath:v37];
    }
    else
    {
      id v42 = v37;
    }
    v43 = v42;
    if (v42)
    {
      uint64_t v44 = (uint64_t)[v42 elementCount];
      BYTE3(self->mLayoutToMaskTransform.tx) = v44 > 1;
      if (v44 >= 2)
      {
        v45 = (CRLCanvasLayoutGeometry *)CGPathRetain((CGPathRef)[v43 CGPath]);
        *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3) = v45;
        v46 = +[CRLBezierPath bezierPathWithCGPath:v45];
        [v46 boundsIncludingCRLStroke:v72];
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;

        [v16 size];
        v89.origin.double x = sub_100064070();
        double width = v89.size.width;
        double height = v89.size.height;
        v91.origin.double x = v48;
        v91.origin.double y = v50;
        v91.size.double width = v52;
        v91.size.double height = v54;
        CGRect v90 = CGRectUnion(v89, v91);
        double x = v90.origin.x;
        double y = v90.origin.y;
        v40 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasMutableLayoutGeometry alloc], "initWithFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
        if (v16) {
          [v16 transform];
        }
        else {
          memset(v79, 0, sizeof(v79));
        }
        [(CRLCanvasMutableLayoutGeometry *)v40 transformBy:v79];
        if (v11) {
          [(CRLCanvasLayoutGeometry *)v11 transform];
        }
        else {
          memset(v78, 0, sizeof(v78));
        }
        [(CRLCanvasMutableLayoutGeometry *)v40 transformBy:v78];
        CGFloat v60 = -x;
        CGFloat v61 = -y;
        -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v60, v61, width, height);
        CGAffineTransformMakeTranslation(&v77, v60, v61);
        long long v62 = *(_OWORD *)&v77.c;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&v77.a;
        *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v62;
        *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = *(_OWORD *)&v77.tx;
LABEL_39:
        if (v16) {
          [v16 transform];
        }
        else {
          memset(&v74, 0, sizeof(v74));
        }
        CGAffineTransformInvert(&t1, &v74);
        long long v63 = *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3);
        *(_OWORD *)&t2.a = *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3);
        *(_OWORD *)&t2.c = v63;
        *(_OWORD *)&t2.tdouble x = *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3);
        CGAffineTransformConcat(&v77, &t1, &t2);
        long long v64 = *(_OWORD *)&v77.c;
        *(_OWORD *)((char *)&self->mMaskLayout + 3) = *(_OWORD *)&v77.a;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v64;
        *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = *(_OWORD *)&v77.tx;

        double v5 = v71;
        v14 = v72;
        v15 = v70;
        goto LABEL_43;
      }
    }
    else
    {
      BYTE3(self->mLayoutToMaskTransform.tx) = 0;
    }
    if (v11) {
      [(CRLCanvasLayoutGeometry *)v11 transform];
    }
    else {
      memset(v76, 0, sizeof(v76));
    }
    v40 = [v16 geometryByTransformingBy:v76];
    [v16 size];
    [(CRLMediaLayout *)self setBoundsForStandardKnobs:sub_100064070()];
    long long v59 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v59;
    *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = *(_OWORD *)&CGAffineTransformIdentity.tx;
    goto LABEL_39;
  }
  long long v68 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v69 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)((char *)&self->mLayoutToImageTransform.tx + 3) = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)((char *)&self->mLayoutToMaskTransform.a + 3) = v68;
  long long v67 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)((char *)&self->mLayoutToMaskTransform.c + 3) = v67;
  BYTE3(self->mLayoutToMaskTransform.tx) = 0;
  if (v14 && [v14 shouldRender])
  {
    [v14 renderedWidth];
    CGFloat v39 = v38 * 0.5;
    -[CRLCanvasLayoutGeometry geometryByOutsettingBy:](v11, "geometryByOutsettingBy:", v39, v39);
    v40 = (CRLCanvasMutableLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeTranslation(&v77, v39, v39);
    long long v41 = *(_OWORD *)&v77.c;
    *(_OWORD *)((char *)&self->mMaskLayout + 3) = *(_OWORD *)&v77.a;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v41;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = *(_OWORD *)&v77.tx;
    [(CRLCanvasLayoutGeometry *)v11 size];
    v87.origin.double x = sub_100064070();
    CGRect v88 = CGRectOffset(v87, v39, v39);
    -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
  }
  else
  {
    v11 = v11;
    *(_OWORD *)((char *)&self->mMaskLayout + 3) = v69;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.a + 3) = v68;
    *(_OWORD *)((char *)&self->mLayoutToImageTransform.c + 3) = v67;
    [(CRLCanvasLayoutGeometry *)v11 size];
    [(CRLMediaLayout *)self setBoundsForStandardKnobs:sub_100064070()];
    v40 = v11;
  }
LABEL_43:
  v65 = v40;

  return v65;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  -[CRLMediaLayout processChangedProperty:](&v8, "processChangedProperty:");
  if ((uint64_t)a3 <= 35)
  {
    if (a3 == 15)
    {
      [(CRLCanvasLayout *)self invalidateFrame];
      [(CRLMediaLayout *)self invalidateAlignmentFrame];
      return;
    }
    if (a3 != 18) {
      goto LABEL_13;
    }
  }
  else if (a3 != 36)
  {
    if (a3 == 37)
    {
      double v5 = [(CRLImageLayout *)self maskLayout];
      double v6 = v5;
      uint64_t v7 = 7;
      goto LABEL_11;
    }
    if (a3 == 38)
    {
      double v5 = [(CRLImageLayout *)self maskLayout];
      double v6 = v5;
      uint64_t v7 = 19;
LABEL_11:
      [v5 processChangedProperty:v7];

      return;
    }
LABEL_13:
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      [(CRLMediaLayout *)self invalidateAlignmentFrame];
      [(CRLBoardItemLayout *)self invalidateExteriorWrap];
    }
    return;
  }
  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLMediaLayout *)self invalidateAlignmentFrame];
  [(CRLCanvasLayout *)self invalidateChildren];
  if (a3 == 18) {
    *(CGFloat *)((char *)&self->mLastParentLimitedSize.width + 3) = 0.0;
  }
}

- (id)childInfosForChildLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  uint64_t v3 = [(CRLCanvasLayout *)&v8 childInfosForChildLayouts];
  double v4 = [(CRLImageLayout *)self imageInfo];
  double v5 = [v4 maskInfo];

  if (v5)
  {
    uint64_t v6 = [v3 arrayByAddingObject:v5];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (void)updateChildrenFromInfo
{
  v25.receiver = self;
  v25.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v25 updateChildrenFromInfo];
  uint64_t v3 = [(CRLImageLayout *)self imageInfo];
  double v4 = [v3 maskInfo];

  double v5 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
  if (!v4)
  {
    *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = 0.0;
LABEL_27:

    goto LABEL_28;
  }
  if (v5)
  {
    uint64_t v6 = [*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) maskInfo];
    if (v6 == v4)
    {
      uint64_t v7 = [*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) parent];

      if (v7 == self) {
        goto LABEL_28;
      }
    }
    else
    {
    }
  }
  objc_super v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
  *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = 0.0;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v9 = [(CRLCanvasAbstractLayout *)self children];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v14 info];

        if (v15 == v4)
        {
          v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = sub_10024715C(v16, v14);
          double v18 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.height + 3);
          *(void *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) = v17;

          goto LABEL_17;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (!*(void *)((char *)&self->super._boundsForStandardKnobs.size.height + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6BD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093248();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6BF8);
    }
    double v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout updateChildrenFromInfo]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v20, 397, 0, "invalid nil value for '%{public}s'", "mMaskLayout");

    goto LABEL_27;
  }
LABEL_28:
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(void *)((char *)&self->super._boundsForStandardKnobs.size.height + 3)
    && *(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(CRLMediaLayout *)self stroke];
    uint64_t v7 = sub_1002469D0(v5, v6);

    objc_super v8 = +[CRLBezierPath bezierPathWithCGPath:*(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3)];
    memset(&v31, 0, sizeof(v31));
    [(CRLImageLayout *)self layoutToMaskTransform];
    if (v3) {
      [(CRLCanvasAbstractLayout *)self transformInRoot];
    }
    else {
      [(CRLCanvasAbstractLayout *)self transform];
    }
    CGAffineTransformConcat(&v31, &t1, &v26);
    CGAffineTransform v30 = v31;
    [v8 transformUsingAffineTransform:&v30];
    if (v7 && [v7 shouldRender])
    {
      [v8 takeAttributesFromStroke:v7];
      [v8 boundsIncludingStroke];
    }
    else
    {
      [v8 bounds];
    }
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  else
  {
    memset(&v31, 0, sizeof(v31));
    objc_super v9 = [(CRLCanvasAbstractLayout *)self geometry];
    id v10 = v9;
    if (v9) {
      [v9 fullTransform];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }

    if (v3)
    {
      id v11 = [(CRLCanvasAbstractLayout *)self parent];

      if (v11)
      {
        uint64_t v12 = [(CRLCanvasAbstractLayout *)self parent];
        v13 = v12;
        if (v12) {
          [v12 transformInRoot];
        }
        else {
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransform v28 = v31;
        CGAffineTransformConcat(&v30, &v28, &t2);
        CGAffineTransform v31 = v30;
      }
    }
    CGAffineTransform v30 = v31;
    v32.origin.CGFloat x = 0.0;
    v32.origin.CGFloat y = 0.0;
    v32.size.CGFloat width = 1.0;
    v32.size.CGFloat height = 1.0;
    CGRect v33 = CGRectApplyAffineTransform(v32, &v30);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  if ([(CRLImageLayout *)self isResizingInMaskEditMode])
  {
    if ((id)[(CRLImageLayout *)self maskEditModeForResizing] == (id)2)
    {
LABEL_3:
      BOOL v3 = [(CRLImageLayout *)self imageGeometry];
      [v3 size];
      double v4 = sub_100064070();
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;

      memset(&v24, 0, sizeof(v24));
      [(CRLImageLayout *)self layoutToImageTransform];
      [(CRLCanvasAbstractLayout *)self transformInRoot];
      p_CGAffineTransform t1 = (CGAffineTransform *)&v20;
      p_CGAffineTransform t2 = (CGAffineTransform *)&v19;
LABEL_7:
      CGAffineTransformConcat(&v24, p_t1, p_t2);
      CGAffineTransform v21 = v24;
      v25.origin.CGFloat x = v4;
      v25.origin.CGFloat y = v6;
      v25.size.CGFloat width = v8;
      v25.size.CGFloat height = v10;
      return CGRectApplyAffineTransform(v25, &v21);
    }
LABEL_6:
    v13 = [(CRLImageLayout *)self maskLayout];
    double v14 = [v13 geometry];
    [v14 size];
    double v4 = sub_100064070();
    CGFloat v6 = v15;
    CGFloat v8 = v16;
    CGFloat v10 = v17;

    memset(&v24, 0, sizeof(v24));
    [(CRLImageLayout *)self layoutToMaskTransform];
    [(CRLCanvasAbstractLayout *)self transformInRoot];
    p_CGAffineTransform t1 = &t1;
    p_CGAffineTransform t2 = &t2;
    goto LABEL_7;
  }
  if ([(CRLImageLayout *)self isDraggingInMaskEditMode])
  {
    if ((id)[(CRLImageLayout *)self maskEditModeForDragging] != (id)3) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLImageLayout;
  [(CRLCanvasAbstractLayout *)&v18 alignmentFrameForProvidingGuidesInRoot];
  return result;
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    uint64_t v7 = [*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) geometryByTranslatingBy:a3.x, a3.y];
    CGFloat v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
    *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  -[CRLCanvasAbstractLayout offsetGeometryBy:](&v9, "offsetGeometryBy:", x, y);
}

- (BOOL)hasAlpha
{
  uint64_t v2 = *(void *)((char *)&self->mLastParentLimitedSize.width + 3);
  if (!v2)
  {
    *(void *)((char *)&self->mLastParentLimitedSize.width + 3) = 1;
    double v4 = +[CRLImageProviderPool sharedPool];
    double v5 = [(CRLImageLayout *)self imageInfo];
    CGFloat v6 = [v5 imageAssetPayload];
    uint64_t v7 = [v4 providerForAsset:v6 shouldValidate:0];

    uint64_t v8 = objc_opt_class();
    objc_super v9 = sub_1002469D0(v8, v7);
    CGFloat v10 = v9;
    if (v9 && [v9 isOpaque]) {
      *(void *)((char *)&self->mLastParentLimitedSize.width + 3) = 2;
    }

    uint64_t v2 = *(void *)((char *)&self->mLastParentLimitedSize.width + 3);
  }
  return v2 == 1;
}

- (BOOL)isInvisible
{
  BOOL v3 = [(CRLImageLayout *)self pathToStroke];
  if (v3)
  {
    BoundingBoCGFloat x = CGPathGetBoundingBox(v3);
    CGFloat x = BoundingBox.origin.x;
    CGFloat y = BoundingBox.origin.y;
    CGFloat width = BoundingBox.size.width;
    CGFloat height = BoundingBox.size.height;
  }
  else
  {
    uint64_t v8 = [(CRLImageLayout *)self imageGeometry];
    [v8 size];
    CGFloat x = sub_100064070();
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;

  return CGRectIsNull(*(CGRect *)&v12);
}

- (BOOL)shouldDisplayGuides
{
  if ([(CRLImageLayout *)self isResizingInMaskEditMode]
    || [(CRLImageLayout *)self isDraggingInMaskEditMode])
  {
    return 1;
  }
  if (BYTE3(self->mBaseInfoGeometry)) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  return [(CRLCanvasLayout *)&v4 shouldDisplayGuides];
}

- (BOOL)maskIntersectsImage
{
  return BYTE3(self->mLayoutToMaskTransform.tx);
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout beginDynamicOperationWithRealTimeCommands:](&v9, "beginDynamicOperationWithRealTimeCommands:");
  double v5 = [(CRLImageLayout *)self maskLayout];
  [v5 beginDynamicOperationWithRealTimeCommands:v3];

  CGFloat v6 = [(CRLImageLayout *)self imageGeometry];
  id v7 = [v6 copy];
  uint64_t v8 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  *(void *)((char *)&self->mLastParentLimitedSize.height + 3) = v7;
}

- (void)endDynamicOperation
{
  BOOL v3 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  *(CGFloat *)((char *)&self->mLastParentLimitedSize.height + 3) = 0.0;

  objc_super v4 = [(CRLImageLayout *)self maskLayout];
  [v4 endDynamicOperation];

  v5.receiver = self;
  v5.super_class = (Class)CRLImageLayout;
  [(CRLBoardItemLayout *)&v5 endDynamicOperation];
}

- (void)beginResize
{
  v6.receiver = self;
  v6.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v6 beginResize];
  [(CRLImageLayout *)self p_createDynamicCopiesIfNeeded];
  if ((id)[(CRLImageLayout *)self maskEditMode] == (id)3)
  {
    BOOL v3 = [(CRLImageLayout *)self imageGeometry];
    [v3 size];
    [(CRLCanvasLayout *)self setInitialBoundsForStandardKnobs:sub_100064070()];

    objc_super v4 = [(CRLImageLayout *)self imageGeometry];
    id v5 = [v4 copy];
    [(CRLCanvasLayout *)self setOriginalGeometry:v5];
  }
}

- (void)endResize
{
  [(CRLImageLayout *)self p_destroyDynamicCopiesIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 endResize];
}

- (id)commandToResetToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(CRLImageLayout *)self imageInfo];
  id v7 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v14.receiver = self;
  v14.super_class = (Class)CRLImageLayout;
  uint64_t v8 = -[CRLMediaLayout commandToResetToSize:](&v14, "commandToResetToSize:", width, height);
  [(CRLCommandGroup *)v7 addCommand:v8];
  if (![(CRLImageLayout *)self isInMaskEditMode])
  {
    objc_super v9 = objc_alloc_init(CRLBezierPath);
    [(CRLBezierPath *)v9 appendBezierPathWithRect:sub_100064070()];
    double v10 = [[CRLBezierPathSource alloc] initWithBezierPath:v9];
    double v11 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", width, height);
    CGFloat v12 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v6 maskGeometry:v11 maskPath:v10];
    [(CRLCommandGroup *)v7 addCommand:v12];
  }

  return v7;
}

- (void)beginDrag
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 beginDrag];
  [(CRLImageLayout *)self p_createDynamicCopiesIfNeeded];
  if ((id)[(CRLImageLayout *)self maskEditModeForDragging] == (id)3)
  {
    [(CRLCanvasLayout *)self invalidateSize];
    [(CRLCanvasLayout *)self validate];
  }
  else
  {
    [(CRLImageLayout *)self maskEditModeForDragging];
  }
}

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x == CGPointZero.x && a3.y == CGPointZero.y) {
    return;
  }
  if ((id)[(CRLImageLayout *)self maskEditModeForDragging] == (id)3)
  {
    id v15 = [*(id *)((char *)&self->mHasAlpha + 3) mutableCopy];
    [v15 position];
    [v15 setPosition:sub_100064698(v7, v8, x)];
    [(CRLImageLayout *)self p_setDynamicInfoGeometry:v15];
    objc_super v9 = [(CRLImageLayout *)self maskLayout];
    [v9 dragBy:x, y];

LABEL_9:

    return;
  }
  if ((id)[(CRLImageLayout *)self maskEditModeForDragging] == (id)2)
  {
    id v15 = [(CRLImageLayout *)self maskLayout];
    [v15 dragBy:x, y];
    goto LABEL_9;
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLImageLayout;
  -[CRLBoardItemLayout dragBy:](&v16, "dragBy:", x, y);
  if (!*(void *)((char *)&self->mLastParentLimitedSize.height + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6C18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010932DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6C38);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout dragBy:]");
    CGFloat v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 616, 0, "invalid nil value for '%{public}s'", "mBaseImageLayoutGeometry");
  }
  uint64_t v13 = [*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) geometryByTranslatingBy:x, y];
  objc_super v14 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v13;
}

- (void)endDrag
{
  if (![(CRLImageLayout *)self isDraggingInMaskEditMode]) {
    objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), *(id *)((char *)&self->mLastParentLimitedSize.height + 3));
  }
  [(CRLImageLayout *)self p_destroyDynamicCopiesIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 endDrag];
}

- (void)beginRotate
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 beginRotate];
  [(CRLImageLayout *)self p_createDynamicCopiesIfNeeded];
}

- (void)endRotate
{
  [(CRLImageLayout *)self p_destroyDynamicCopiesIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 endRotate];
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  memset(&v18, 0, sizeof(v18));
  double v7 = *(void **)((char *)&self->mLastParentLimitedSize.height + 3);
  if (v7) {
    [v7 fullTransform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CGAffineTransformInvert(&t1, &v16);
  double v8 = [(CRLCanvasLayout *)self infoGeometryBeforeDynamicOperation];
  objc_super v9 = v8;
  if (v8) {
    [v8 fullTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v18, &t1, &t2);

  CGAffineTransform v12 = v18;
  CGAffineTransformInvert(&v13, &v12);
  long long v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tdouble x = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v14, &v13, &v12);
  CGAffineTransform v12 = v18;
  return CGAffineTransformConcat(retstr, &v14, &v12);
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLImageLayout;
  [(CRLBoardItemLayout *)&v7 takeRotationFromTracker:v4];
  if (v4) {
    [v4 rotateTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [(CRLImageLayout *)self layoutTransformInInfoSpace:v5];
  [(CRLImageLayout *)self resizeWithTransform:v6];
}

- (CGPoint)centerForRotation
{
  if ([(CRLImageLayout *)self isRotatingInMaskEditMode])
  {
    [(CRLImageLayout *)self centerForRotationInMaskMode];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLImageLayout;
    [(CRLCanvasLayout *)&v5 centerForRotation];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)centerForRotationInMaskMode
{
  if ((id)[(CRLImageLayout *)self maskEditModeForRotating] == (id)3)
  {
    double v3 = [(CRLImageLayout *)self imageGeometry];
    [v3 size];
    double v4 = sub_100064070();
    double v8 = sub_100065738(v4, v5, v6, v7);
    double v10 = v9;

    [(CRLImageLayout *)self layoutToImageTransform];
    double v11 = v39;
    double v12 = v37;
    double v13 = v10 * v38 + v36 * v8;
    double v14 = v40;
    double v15 = v41;
LABEL_5:
    double x = v14 + v13;
    double y = v15 + v10 * v11 + v12 * v8;
    goto LABEL_15;
  }
  if ((id)[(CRLImageLayout *)self maskEditModeForRotating] == (id)2)
  {
    CGAffineTransform v16 = [(CRLImageLayout *)self maskLayout];
    double v17 = [v16 geometry];
    [v17 size];
    double v18 = sub_100064070();
    double v8 = sub_100065738(v18, v19, v20, v21);
    double v10 = v22;

    [(CRLImageLayout *)self layoutToMaskTransform];
    double v11 = v33;
    double v12 = v31;
    double v13 = v10 * v32 + v30 * v8;
    double v14 = v34;
    double v15 = v35;
    goto LABEL_5;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6C58);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101093370();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6C78);
  }
  CGRect v25 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v25);
  }
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  CGAffineTransform v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout centerForRotationInMaskMode]");
  double v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
  +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:682 isFatal:0 description:"asking for mask mode center of rotation when not in mask edit mode"];

LABEL_15:
  double v28 = x;
  double v29 = y;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (CGPoint)centerForConnecting
{
  double v3 = [(CRLBoardItemLayout *)self i_wrapPath];
  if ((uint64_t)[v3 elementCount] < 2)
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageLayout;
    [(CRLCanvasLayout *)&v24 centerForConnecting];
    v23.f64[0] = v16;
    float64_t v18 = v17;
  }
  else
  {
    double v4 = [(CRLBoardItemLayout *)self i_wrapPath];
    [v4 bounds];
    double v9 = sub_100065738(v5, v6, v7, v8);
    double v21 = v10;
    double v22 = v9;
    double v11 = [(CRLCanvasAbstractLayout *)self geometry];
    double v12 = v11;
    if (v11)
    {
      [v11 transform];
      float64x2_t v13 = v25;
      float64x2_t v14 = v26;
      float64x2_t v15 = v27;
    }
    else
    {
      float64x2_t v15 = 0uLL;
      float64x2_t v26 = 0u;
      float64x2_t v27 = 0u;
      float64x2_t v25 = 0u;
      float64x2_t v13 = 0uLL;
      float64x2_t v14 = 0uLL;
    }
    float64x2_t v23 = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v21), v13, v22));
    float64_t v18 = v23.f64[1];
  }
  double v19 = v23.f64[0];
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  if ((id)[(CRLImageLayout *)self maskEditModeForResizing] == (id)2) {
    return 0;
  }
  if ((id)[(CRLImageLayout *)self maskEditModeForResizing] == (id)1)
  {
    double v4 = [(CRLImageLayout *)self maskLayout];
    CGFloat v5 = [v4 geometry];
    CGFloat v6 = v5;
    if (v5) {
      [v5 transform];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    BOOL v7 = sub_10007F910((double *)v9, 0.0001);

    if (!v7) {
      return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  return [(CRLCanvasLayout *)&v8 canAspectRatioLockBeChangedByUser];
}

- (BOOL)resizeMayChangeAspectRatio
{
  if ((id)[(CRLImageLayout *)self maskEditModeForResizing] == (id)2) {
    return 1;
  }
  if ((id)[(CRLImageLayout *)self maskEditModeForResizing] == (id)1)
  {
    double v4 = [(CRLImageLayout *)self maskLayout];
    CGFloat v5 = [v4 geometry];
    CGFloat v6 = v5;
    if (v5) {
      [v5 transform];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    BOOL v7 = sub_10007F910((double *)v9, 0.0001);

    if (!v7) {
      return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageLayout;
  return [(CRLCanvasLayout *)&v8 resizeMayChangeAspectRatio];
}

- (BOOL)shouldSnapWhileResizing
{
  if ([(CRLImageLayout *)self isInMaskEditMode]
    && (id)[(CRLImageLayout *)self maskEditModeForLayoutState] == (id)3)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  return [(CRLCanvasAbstractLayout *)&v4 shouldSnapWhileResizing];
}

- (void)resizeWithTransform:(CGAffineTransform *)a3
{
  if ([(CRLImageLayout *)self isInMaskEditMode]
    && (id)[(CRLImageLayout *)self maskEditModeForLayoutState] != (id)3)
  {
    if ((id)[(CRLImageLayout *)self maskEditModeForLayoutState] != (id)2) {
      return;
    }
    double v11 = [(CRLImageLayout *)self maskLayout];
    double v12 = v11;
    long long v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v24.c = v15;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)&a3->tx;
    p_CGAffineTransform t2 = &v24;
    goto LABEL_20;
  }
  memset(&v24, 0, sizeof(v24));
  CGFloat v5 = [(CRLImageLayout *)self originalImageGeometry];
  CGFloat v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v24, &t1, &t2);

  CGAffineTransform t2 = v24;
  objc_super v8 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&t2];
  [(CRLImageLayout *)self p_setDynamicInfoGeometry:v8];

  if ((id)[(CRLImageLayout *)self maskEditModeForLayoutState] == (id)3)
  {
    memset(&t2, 0, sizeof(t2));
    double v9 = [(CRLImageLayout *)self originalImageGeometry];
    double v10 = v9;
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CGAffineTransformInvert(&v21, &v20);
    float64_t v16 = *(void **)((char *)&self->mHasAlpha + 3);
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CGAffineTransformConcat(&t2, &v21, &v19);

    double v12 = [(CRLImageLayout *)self maskLayout];
    CGAffineTransform v17 = t2;
    CGAffineTransformInvert(&v18, &v17);
    p_CGAffineTransform t2 = &v18;
    double v11 = v12;
    goto LABEL_20;
  }
  if (![(CRLImageLayout *)self isInMaskEditMode]
    && ([(CRLCanvasLayout *)self layoutState] == 4
     || [(CRLCanvasLayout *)self layoutState] == 5))
  {
    double v11 = [(CRLImageLayout *)self maskLayout];
    double v12 = v11;
    long long v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    p_CGAffineTransform t2 = &t2;
LABEL_20:
    [v11 resizeWithTransform:p_t2];
  }
}

- (void)takeSizeFromTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  [(CRLBoardItemLayout *)&v4 takeSizeFromTracker:a3];
  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
}

- (void)takeScaledImageGeometry:(id)a3 maskGeometry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!BYTE3(self->mBaseInfoGeometry))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6C98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010933F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6CB8);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout takeScaledImageGeometry:maskGeometry:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:767 isFatal:0 description:"wrong mode"];
  }
  [(CRLImageLayout *)self p_setDynamicInfoGeometry:v6];
  double v11 = [(CRLImageLayout *)self maskLayout];
  [v11 takeScaledMaskGeometry:v7];

  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v4 beginFreeTransformWithTracker:a3];
  [(CRLImageLayout *)self p_createDynamicCopiesIfNeeded];
}

- (void)endFreeTransform
{
  [(CRLImageLayout *)self p_destroyDynamicCopiesIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CRLImageLayout;
  [(CRLCanvasLayout *)&v3 endFreeTransform];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLImageLayout;
  id v4 = a3;
  [(CRLBoardItemLayout *)&v6 takeFreeTransformFromTracker:v4];
  unsigned int v5 = [v4 isResizing];

  if (v5) {
    [(CRLBoardItemLayout *)self invalidateExteriorWrap];
  }
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class();
  double v9 = sub_10024715C(v8, v7);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10027AF58;
  v12[3] = &unk_1014E6CE0;
  v12[4] = v9;
  long long v10 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->tx;
  [(CRLImageLayout *)self p_calculateClampModelValuesWithAdditionalTransform:v11 andPerformBlock:v12];
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = sub_10027B108;
  double v12 = sub_10027B118;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10027B120;
  v7[3] = &unk_1014E6D08;
  v7[4] = self;
  v7[5] = &v8;
  long long v3 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->tx;
  [(CRLImageLayout *)self p_calculateClampModelValuesWithAdditionalTransform:v6 andPerformBlock:v7];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4
{
  objc_super v6 = (void (**)(id, void *, void *, id))a4;
  id v7 = [(CRLImageLayout *)self imageGeometry];
  long long v8 = *(_OWORD *)&a3->c;
  v20[0] = *(_OWORD *)&a3->a;
  v20[1] = v8;
  v20[2] = *(_OWORD *)&a3->tx;
  double v9 = [v7 geometryByTransformingBy:v20];

  if (v9) {
    [v9 fullTransform];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  uint64_t v10 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v19];
  double v11 = [(CRLImageLayout *)self maskLayout];

  if (v11)
  {
    double v12 = [(CRLImageLayout *)self maskLayout];
    id v13 = [v12 pureGeometry];

    float64x2_t v14 = [(CRLImageLayout *)self maskLayout];
    long long v15 = [v14 computeInfoGeometryFromPureLayoutGeometry:v13];

    float64_t v16 = [(CRLImageLayout *)self maskLayout];
    CGAffineTransform v17 = [v16 pathSource];
    id v18 = [v17 copy];

    [v15 size];
    [v18 scaleToNaturalSize:];
    v6[2](v6, v10, v15, v18);
  }
  else
  {
    v6[2](v6, v10, 0, 0);
  }
}

- (CRLSmartPathSource)smartPathSource
{
  uint64_t v2 = [(CRLImageLayout *)self maskLayout];
  long long v3 = [v2 pathSource];
  uint64_t v4 = objc_opt_class();
  uint64_t v10 = sub_100246DEC(v3, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  return (CRLSmartPathSource *)v10;
}

- (CGRect)pathBoundsWithoutStroke
{
  uint64_t v2 = [(CRLImageLayout *)self smartPathSource];
  long long v3 = [v2 bezierPath];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)maskWasReset
{
  if ([(CRLImageLayout *)self isInMaskEditMode])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6D28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093480();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6D48);
    }
    long long v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout maskWasReset]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:882 isFatal:0 description:"Mask should never be reset in mask edit mode"];
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = 0;
}

- (void)maskWasApplied
{
  if ([(CRLImageLayout *)self isInMaskEditMode])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6D68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093508();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6D88);
    }
    long long v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout maskWasApplied]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:887 isFatal:0 description:"maskWasApplied should not be called in mask edit mode"];
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
}

- (void)beginEditingMaskInMaskEditMode:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6DA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109363C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6DC8);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout beginEditingMaskInMaskEditMode:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 892, 0, "Invalid parameter not satisfying: %{public}s", "(maskEditMode == CRLMaskEditModeEditingImage) || (maskEditMode == CRLMaskEditModeEditingMask)");
  }
  if ([(CRLImageLayout *)self maskEditMode] == a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6DE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093590();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6E08);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout beginEditingMaskInMaskEditMode:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 893, 0, "already editing mask in mode %ld", a3);
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)a3;
  double v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:@"CRLImageLayoutMaskEditModeDidChangeNotification" object:self];
}

- (void)endMaskEditMode
{
  if ((id)[(CRLImageLayout *)self maskEditMode] != (id)3
    && (id)[(CRLImageLayout *)self maskEditMode] != (id)2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6E28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010936D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6E48);
    }
    long long v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout endMaskEditMode]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:899 isFatal:0 description:"not in mask edit mode"];
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 3) = (CRLCanvasInfoGeometry *)1;
  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"CRLImageLayoutMaskEditModeDidChangeNotification" object:self];
}

- (BOOL)isInMaskEditMode
{
  return (id)[(CRLImageLayout *)self maskEditMode] == (id)2
      || (id)[(CRLImageLayout *)self maskEditMode] == (id)3;
}

- (BOOL)isDraggingInMaskEditMode
{
  BOOL v3 = [(CRLImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(CRLCanvasLayout *)self layoutState] == 2
  }
              || [(CRLCanvasLayout *)self layoutState] == 5;
  return v3;
}

- (BOOL)isRotatingInMaskEditMode
{
  BOOL v3 = [(CRLImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(CRLCanvasLayout *)self layoutState] == 3
  }
              || [(CRLCanvasLayout *)self layoutState] == 5;
  return v3;
}

- (BOOL)isResizingInMaskEditMode
{
  BOOL v3 = [(CRLImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(CRLCanvasLayout *)self layoutState] == 4
  }
              || [(CRLCanvasLayout *)self layoutState] == 5;
  return v3;
}

- (int64_t)maskEditModeForDragging
{
  if ([(CRLImageLayout *)self isInMaskEditMode]) {
    return 3;
  }

  return [(CRLImageLayout *)self maskEditMode];
}

- (int64_t)maskEditModeForRotating
{
  if ([(CRLImageLayout *)self isInMaskEditMode]) {
    return 3;
  }

  return [(CRLImageLayout *)self maskEditMode];
}

- (int64_t)maskEditModeForResizing
{
  if (BYTE3(self->mBaseInfoGeometry)) {
    return 3;
  }
  else {
    return [(CRLImageLayout *)self maskEditMode];
  }
}

- (int64_t)maskEditModeForFreeTransforming
{
  if ([(CRLImageLayout *)self isInMaskEditMode]) {
    return 3;
  }

  return [(CRLImageLayout *)self maskEditMode];
}

- (int64_t)maskEditModeForLayoutState
{
  unsigned int v3 = [(CRLCanvasLayout *)self layoutState];
  switch(v3)
  {
    case 5u:
      return [(CRLImageLayout *)self maskEditModeForFreeTransforming];
    case 3u:
      return [(CRLImageLayout *)self maskEditModeForRotating];
    case 2u:
      return [(CRLImageLayout *)self maskEditModeForDragging];
    default:
      return [(CRLImageLayout *)self maskEditModeForResizing];
  }
}

- (void)maskModeScaleDidBegin
{
  BYTE3(self->mBaseInfoGeometry) = 1;
  [*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) maskModeScaleDidBegin];
}

- (void)maskModeScaleDidEnd
{
  BYTE3(self->mBaseInfoGeometry) = 0;
  [*(id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3) maskModeScaleDidEnd];
}

- (_TtC8Freeform12CRLImageItem)imageInfo
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasLayout *)self info];
  double v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLImageItem *)v5;
}

- (CRLCanvasLayoutGeometry)imageGeometry
{
  return (CRLCanvasLayoutGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super._boundsForStandardKnobs.size.width
                                                                            + 3));
}

- (CRLCanvasLayoutGeometry)originalImageGeometry
{
  return (CRLCanvasLayoutGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->mLastParentLimitedSize.height
                                                                            + 3));
}

- (CRLCanvasLayoutGeometry)imageGeometryInRoot
{
  id v3 = [*(id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) mutableCopy];
  uint64_t v4 = [(CRLCanvasAbstractLayout *)self parent];
  if (v4)
  {
    double v5 = (void *)v4;
    do
    {
      double v6 = [v5 geometry:v10, v11, v12];
      double v7 = v6;
      if (v6)
      {
        [v6 transform];
      }
      else
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
      }
      [v3 transformBy:&v10];

      uint64_t v8 = [v5 parent];

      double v5 = (void *)v8;
    }
    while (v8);
  }

  return (CRLCanvasLayoutGeometry *)v3;
}

- (id)inspectorGeometry
{
  if ((id)[(CRLImageLayout *)self maskEditMode] == (id)3
    || (id)[(CRLImageLayout *)self maskEditMode] == (id)2)
  {
    id v3 = [(CRLImageLayout *)self p_inspectorGeometryForUnmaskedImage];
    id v4 = [v3 mutableCopy];

    v8.receiver = self;
    v8.super_class = (Class)CRLImageLayout;
    double v5 = [(CRLCanvasLayout *)&v8 inspectorGeometry];
    [v5 size];
    [v4 setSize:];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLImageLayout;
    id v4 = [(CRLCanvasLayout *)&v7 inspectorGeometry];
  }

  return v4;
}

- (id)p_inspectorGeometryForUnmaskedImage
{
  id v3 = [(CRLImageLayout *)self imageGeometry];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v17 = v4;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v5 = [(CRLCanvasAbstractLayout *)self parent];
  if (v5)
  {
    double v6 = (void *)v5;
    do
    {
      if ([v6 isRootLayoutForInspectorGeometry]) {
        break;
      }
      objc_super v7 = [v6 geometry];
      objc_super v8 = v7;
      if (v7)
      {
        v12[0] = v16;
        v12[1] = v17;
        v12[2] = v18;
        [v7 transformByConcatenatingTransformTo:v12];
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v13 = 0u;
      }
      long long v16 = v13;
      long long v17 = v14;
      long long v18 = v15;

      uint64_t v9 = [v6 parent];

      double v6 = (void *)v9;
    }
    while (v9);
  }
  long long v13 = v16;
  long long v14 = v17;
  long long v15 = v18;
  long long v10 = [v3 geometryByTransformingBy:&v13];

  return v10;
}

- (BOOL)hasMaskingPath
{
  id v3 = [(CRLImageLayout *)self maskLayout];

  if (v3 && !*(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6E68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093758();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6E88);
    }
    long long v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout hasMaskingPath]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:1043 isFatal:0 description:"If image has masking path it must specify a path to stroke"];
  }
  return v3 != 0;
}

- (CGPath)pathToStroke
{
  return *(CGPath **)((char *)&self->mImageGeometry + 3);
}

- (CGSize)sizeOfFrameRectIncludingCoverage
{
  if (*(CRLCanvasLayoutGeometry **)((char *)&self->mImageGeometry + 3))
  {
    id v3 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:");
    long long v4 = [(CRLMediaLayout *)self stroke];
    [v3 boundsIncludingCRLStroke:v4];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    id v3 = [(CRLCanvasAbstractLayout *)self geometry];
    [v3 size];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGAffineTransform)layoutToImageTransform
{
  long long v3 = *(_OWORD *)((char *)&self[10].tx + 3);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self[10].c + 3);
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)((char *)&self[11].a + 3);
  return self;
}

- (CGAffineTransform)layoutToMaskTransform
{
  long long v3 = *(_OWORD *)((char *)&self[11].tx + 3);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self[11].c + 3);
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)((char *)&self[12].a + 3);
  return self;
}

- (CRLMaskLayout)maskLayout
{
  return (CRLMaskLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super._boundsForStandardKnobs.size.height
                                                                  + 3));
}

- (id)computeWrapPath
{
  long long v3 = [(CRLImageLayout *)self imageInfo];
  uint64_t v4 = objc_opt_class();
  double v5 = [(CRLMediaLayout *)self stroke];
  double v6 = sub_1002469D0(v4, v5);

  if (v6) {
    unsigned int v7 = [v6 shouldRender];
  }
  else {
    unsigned int v7 = 0;
  }
  double v8 = [(CRLImageLayout *)self maskLayout];

  double v9 = [(CRLImageLayout *)self maskLayout];
  double v10 = [v9 computeLayoutGeometry];

  memset(&v44, 0, sizeof(v44));
  if (v8)
  {
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v43, 0, sizeof(v43));
    }
    CGAffineTransformInvert(&v44, &v43);
  }
  else
  {
    long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v44.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v44.c = v11;
    *(_OWORD *)&v44.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  double v12 = +[CRLImageProviderPool sharedPool];
  long long v13 = [v3 imageAssetPayload];
  long long v14 = [v12 providerForAsset:v13 shouldValidate:1];

  if (v7 && -[CRLImageLayout hasAlpha](self, "hasAlpha") && ([v14 isError] & 1) == 0)
  {
    [v14 naturalSize];
    id v16 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];
  }
  else
  {
    long long v15 = [v3 tracedPath];
    id v16 = [v15 copy];
  }
  [v16 bounds];
  if (!CGRectIsEmpty(v46))
  {
    CGAffineTransform v19 = [(CRLImageLayout *)self imageGeometry];
    [v19 size];
    double v21 = v20;
    double v23 = v22;

    long long v24 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v42.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v42.c = v24;
    *(_OWORD *)&v42.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (([v14 isError] & 1) == 0)
    {
      [v14 naturalSize];
      CGAffineTransformMakeScale(&v42, v21 / v25, v23 / v26);
      CGAffineTransform v41 = v42;
      [v16 transformUsingAffineTransform:&v41];
    }
    if (v8)
    {
      float64x2_t v27 = [(CRLImageLayout *)self maskLayout];
      CGAffineTransform v41 = v44;
      [v16 transformUsingAffineTransform:&v41];
      double v28 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v27 path]);
      [v27 pathBounds];
      CGAffineTransformMakeTranslation(&v40, -v29, -v30);
      [v28 transformUsingAffineTransform:&v40];
      id v18 = [v16 intersectBezierPath:v28];

      if (!v7) {
        goto LABEL_21;
      }
    }
    else
    {
      id v18 = v16;
      if (!v7) {
        goto LABEL_21;
      }
    }
    [v18 takeAttributesFromStroke:v6];
    double v31 = [v18 strokedCopy];
    uint64_t v32 = [v18 uniteWithBezierPath:v31];

    id v18 = (id)v32;
    goto LABEL_21;
  }
  long long v17 = [(CRLCanvasAbstractLayout *)self geometry];
  [v17 size];
  id v18 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];

LABEL_21:
  if ((uint64_t)[v18 elementCount] >= 2)
  {
    [v18 bounds];
    double v34 = fmin(v33, 0.0);
    double v36 = fmin(v35, 0.0);
    if (!sub_100064084(CGPointZero.x, CGPointZero.y, v34, v36))
    {
      CGAffineTransformMakeTranslation(&v39, -v34, -v36);
      [v18 transformUsingAffineTransform:&v39];
    }
  }
  id v37 = v18;

  return v37;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)allowsConnections
{
  return ![(CRLImageLayout *)self isInMaskEditMode];
}

- (void)p_createDynamicCopiesIfNeeded
{
  if (*(unint64_t *)((char *)&self->mHasAlpha + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6EA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010937E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6EC8);
    }
    long long v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_createDynamicCopiesIfNeeded]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1165, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  if ([(CRLImageLayout *)self p_shouldUseDynamicInfoGeometryForOperation])
  {
    double v6 = [(CRLImageLayout *)self imageGeometry];
    unsigned int v7 = v6;
    if (v6) {
      [v6 fullTransform];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    uint64_t v8 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v10];
    double v9 = *(void **)((char *)&self->mHasAlpha + 3);
    *(unint64_t *)((char *)&self->mHasAlpha + 3) = v8;
  }
}

- (BOOL)p_shouldUseDynamicInfoGeometryForOperation
{
  if (![(CRLCanvasLayout *)self layoutState])
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6EE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093934(v3);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6F08);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1174, 0, "expected inequality between %{public}s and %{public}s", "self.layoutState", "CRLCanvasLayoutStatic");
  }
  if ([(CRLCanvasLayout *)self layoutState] == 1)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6F28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093874(v7);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6F48);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_shouldUseDynamicInfoGeometryForOperation]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1176, 0, "expected inequality between %{public}s and %{public}s", "self.layoutState", "CRLCanvasLayoutDynamic");
  }
  return (id)[(CRLImageLayout *)self maskEditModeForLayoutState] == (id)3
      || ![(CRLImageLayout *)self isInMaskEditMode]
      && ([(CRLCanvasLayout *)self layoutState] == 4
       || [(CRLCanvasLayout *)self layoutState] == 3
       || [(CRLCanvasLayout *)self layoutState] == 5);
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  id v4 = a3;
  if (!*(unint64_t *)((char *)&self->mHasAlpha + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6F68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010939F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6F88);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_setDynamicInfoGeometry:]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1195, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  id v8 = [v4 copy];
  double v9 = *(void **)((char *)&self->mHasAlpha + 3);
  *(unint64_t *)((char *)&self->mHasAlpha + 3) = (unint64_t)v8;

  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLMediaLayout *)self invalidateAlignmentFrame];
}

- (void)p_destroyDynamicCopiesIfNeeded
{
  unsigned __int8 v3 = [(CRLImageLayout *)self p_shouldUseDynamicInfoGeometryForOperation];
  id v4 = *(void **)((char *)&self->mHasAlpha + 3);
  if (v3)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6FE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101093A88();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7008);
      }
      double v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_destroyDynamicCopiesIfNeeded]");
      int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1209, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");

      id v4 = *(void **)((char *)&self->mHasAlpha + 3);
    }
    *(unint64_t *)((char *)&self->mHasAlpha + 3) = 0;

    [(CRLCanvasLayout *)self invalidateFrame];
    [(CRLMediaLayout *)self invalidateAlignmentFrame];
  }
  else if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6FA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093B1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6FC8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageLayout p_destroyDynamicCopiesIfNeeded]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1205, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
}

- (int64_t)maskEditMode
{
  return *(int64_t *)((char *)&self->mDynamicInfoGeometry + 3);
}

- (BOOL)isInMaskScaleMode
{
  return BYTE3(self->mBaseInfoGeometry);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mBaseImageLayoutGeometry + 3), 0);
  objc_storeStrong((id *)((char *)&self->mHasAlpha + 3), 0);
  objc_storeStrong((id *)((char *)&self->mLastParentLimitedSize.height + 3), 0);
  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.height + 3), 0);

  objc_storeStrong((id *)((char *)&self->super._boundsForStandardKnobs.size.width + 3), 0);
}

@end