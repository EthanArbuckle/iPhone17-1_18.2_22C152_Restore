@interface TSDImageLayout
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)hasAlpha;
- (BOOL)hasMaskingPath;
- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline;
- (BOOL)isDraggingInMaskEditMode;
- (BOOL)isDynamicallyChangingImageAdjustments;
- (BOOL)isInInstantAlphaMode;
- (BOOL)isInMaskEditMode;
- (BOOL)isInMaskScaleMode;
- (BOOL)isInvisible;
- (BOOL)isResizingInMaskEditMode;
- (BOOL)isRotatingInMaskEditMode;
- (BOOL)maskIntersectsImage;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldRenderFrameStroke;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)supportsRotation;
- (CGAffineTransform)imageDataToVisualSizeTransform;
- (CGAffineTransform)layoutToImageTransform;
- (CGAffineTransform)layoutToMaskTransform;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGPath)pathToStroke;
- (CGPoint)centerForConnecting;
- (CGPoint)centerForRotation;
- (CGPoint)centerForRotationInMaskMode;
- (CGRect)alignmentFrameForProvidingGuidesInRoot;
- (CGRect)boundsInfluencingExteriorWrap;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CGRect)pathBoundsWithoutStroke;
- (CGSize)sizeOfFrameRectIncludingCoverage;
- (TSDImageLayout)initWithInfo:(id)a3;
- (id)computeLayoutGeometry;
- (id)currentInfoGeometry;
- (id)geometryForTransforming;
- (id)i_computeWrapPath;
- (id)imageAdjustments;
- (id)imageGeometry;
- (id)imageGeometryInRoot;
- (id)imageInfo;
- (id)inspectorGeometry;
- (id)layoutGeometryFromInfo;
- (id)maskLayout;
- (id)originalImageGeometry;
- (id)smartPathSource;
- (id)visibleGeometries;
- (int)maskEditMode;
- (int)maskEditModeForDragging;
- (int)maskEditModeForLayoutState;
- (int)maskEditModeForResizing;
- (int)maskEditModeForRotating;
- (void)beginDrag;
- (void)beginDynamicOperation;
- (void)beginEditingImageInMaskEditMode;
- (void)beginEditingMaskInMaskEditMode;
- (void)beginInstantAlphaMode;
- (void)beginResize;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)dynamicImageAdjustmentsChangeDidBegin;
- (void)dynamicImageAdjustmentsChangeDidEnd;
- (void)dynamicImageAdjustmentsUpdateToValue:(id)a3;
- (void)endDrag;
- (void)endDynamicOperation;
- (void)endInstantAlphaMode;
- (void)endMaskEditMode;
- (void)maskModeScaleDidBegin;
- (void)maskModeScaleDidEnd;
- (void)maskWasApplied;
- (void)maskWasReset;
- (void)offsetGeometryBy:(CGPoint)a3;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)p_setDynamicInfoGeometry:(id)a3;
- (void)processChangedProperty:(int)a3;
- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4;
- (void)takeRotationFromTracker:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation TSDImageLayout

- (TSDImageLayout)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDImageLayout;
  v3 = [(TSDMediaLayout *)&v7 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [(TSDImageLayout *)v3 imageInfo];
    if (v5)
    {
      if ([v5 maskInfo]) {
        v4->mMaskEditMode = 1;
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  self->mMaskLayout = 0;
  self->mImageGeometry = 0;

  self->mBaseImageLayoutGeometry = 0;
  self->mDynamicInfoGeometry = 0;
  CGPathRelease(self->mPathToStroke);

  self->mTracedPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  [(TSDDrawableLayout *)&v3 dealloc];
}

- (id)geometryForTransforming
{
  if ([(TSDImageLayout *)self maskEditModeForLayoutState] == 3)
  {
    return [(TSDImageLayout *)self imageGeometry];
  }
  else
  {
    return [(TSDAbstractLayout *)self geometry];
  }
}

- (id)visibleGeometries
{
  v10[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(TSDImageLayout *)self isInMaskEditMode];
  v4 = [(TSDAbstractLayout *)self geometry];
  if (v3)
  {
    v10[0] = v4;
    v10[1] = [(TSDImageLayout *)self imageGeometry];
    id v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = (TSDLayoutGeometry **)v10;
    uint64_t v7 = 2;
  }
  else
  {
    v9 = v4;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = &v9;
    uint64_t v7 = 1;
  }
  return (id)objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9);
}

- (id)currentInfoGeometry
{
  if (self->mDynamicInfoGeometry) {
    return self->mDynamicInfoGeometry;
  }
  BOOL v3 = [(TSDLayout *)self info];

  return (id)[(TSDInfo *)v3 geometry];
}

- (id)layoutGeometryFromInfo
{
  id v2 = [(TSDImageLayout *)self currentInfoGeometry];
  BOOL v3 = [TSDLayoutGeometry alloc];
  [v2 size];
  double v5 = v4;
  double v7 = v6;
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  return -[TSDLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v9, v5, v7);
}

- (id)computeLayoutGeometry
{
  id v3 = [(TSDImageLayout *)self maskLayout];
  if (v3)
  {
    double v4 = [(TSDLayout *)self layoutGeometryFromProvider];
  }
  else
  {
    v122.receiver = self;
    v122.super_class = (Class)TSDImageLayout;
    double v4 = [(TSDLayout *)&v122 computeLayoutGeometry];
  }
  double v5 = v4;

  self->mImageGeometrdouble y = (TSDLayoutGeometry *)v5;
  objc_opt_class();
  [(TSDMediaLayout *)self stroke];
  double v6 = (void *)TSUDynamicCast();
  CGPathRelease(self->mPathToStroke);
  self->mPathToStroke = 0;
  [(TSDMediaLayout *)self setShouldRenderFrameStroke:0];
  id v7 = [(TSDImageLayout *)self imageInfo];
  v8 = v7;
  if (v3)
  {
    v9 = (TSDLayoutGeometry *)[v3 computeLayoutGeometry];
    if ([(TSDLayout *)self layoutState] != 3)
    {
      [(TSDLayoutGeometry *)v9 size];
      -[TSDLayout scaleForInlineClampingUnrotatedSize:withGeometry:](self, "scaleForInlineClampingUnrotatedSize:withGeometry:", [(TSDAbstractLayout *)self geometry], v10, v11);
      CGFloat v13 = v12;
      CGAffineTransformMakeScale(&v121, v12, v12);
      v9 = [(TSDLayoutGeometry *)v9 geometryByTransformingBy:&v121];
      CGAffineTransformMakeScale(&v120, v13, v13);
      double v5 = [(TSDLayoutGeometry *)v5 geometryByTransformingBy:&v120];
      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "setPathScale:", v13);
      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "setGeometry:", v9);

      self->mImageGeometrdouble y = (TSDLayoutGeometry *)v5;
    }
    v14 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", [v3 path]);
    [v3 pathBounds];
    CGAffineTransformMakeTranslation(&v118, -v15, -v16);
    [(TSDBezierPath *)v14 transformUsingAffineTransform:&v118];
LABEL_10:
    [(TSDLayoutGeometry *)v5 size];
    v19 = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
    if ([v8 instantAlphaPath])
    {
      v20 = objc_msgSend((id)objc_msgSend(v8, "instantAlphaPath"), "copy");
      [(TSDImageLayout *)self imageDataToVisualSizeTransform];
      [v20 transformUsingAffineTransform:v117];
      [v20 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      v19 = v20;
      if (v9)
      {
LABEL_12:
        [(TSDLayoutGeometry *)v9 transform];
        goto LABEL_15;
      }
    }
    else
    {
      double v22 = *MEMORY[0x263F001A8];
      double v24 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v28 = *(double *)(MEMORY[0x263F001A8] + 24);
      if (v9) {
        goto LABEL_12;
      }
    }
    memset(&v115, 0, sizeof(v115));
LABEL_15:
    CGAffineTransformInvert(&v116, &v115);
    [(TSDBezierPath *)v19 transformUsingAffineTransform:&v116];
    if (v14) {
      v19 = [(TSDBezierPath *)v14 intersectBezierPath:v19];
    }
    if (v19)
    {
      uint64_t v29 = [(TSDBezierPath *)v19 elementCount];
      self->mMaskIntersectsImage = v29 > 1;
      if (v29 > 1) {
        goto LABEL_22;
      }
    }
    else
    {
      self->mMaskIntersectsImage = 0;
    }
    if (![v6 isFrame])
    {
      if (v5) {
        [(TSDLayoutGeometry *)v5 transform];
      }
      else {
        memset(v112, 0, sizeof(v112));
      }
      v46 = [(TSDLayoutGeometry *)v9 geometryByTransformingBy:v112];
      [(TSDLayoutGeometry *)v9 size];
      [(TSDMediaLayout *)self setBoundsForStandardKnobs:TSDRectWithSize()];
      uint64_t v77 = MEMORY[0x263F000D0];
      long long v78 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&self->mLayoutToMaskTransform.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&self->mLayoutToMaskTransform.c = v78;
      *(_OWORD *)&self->mLayoutToMaskTransform.tdouble x = *(_OWORD *)(v77 + 32);
LABEL_48:
      if (v9) {
        [(TSDLayoutGeometry *)v9 transform];
      }
      else {
        memset(&v110, 0, sizeof(v110));
      }
      CGAffineTransformInvert(&t1, &v110);
      long long v79 = *(_OWORD *)&self->mLayoutToMaskTransform.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&self->mLayoutToMaskTransform.a;
      *(_OWORD *)&t2.c = v79;
      *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->mLayoutToMaskTransform.tx;
      CGAffineTransformConcat(&v119, &t1, &t2);
      long long v80 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v80;
      *(_OWORD *)&self->mLayoutToImageTransform.tdouble x = *(_OWORD *)&v119.tx;
      goto LABEL_52;
    }
LABEL_22:
    int v30 = [v6 isFrame];
    double v104 = v22;
    double v102 = v24;
    if (v14 && v30) {
      v31 = v14;
    }
    else {
      v31 = v19;
    }
    v32 = CGPathRetain([(TSDBezierPath *)v31 CGPath]);
    self->mPathToStroke = v32;
    [+[TSDBezierPath bezierPathWithCGPath:v32] boundsIncludingTSDStroke:v6];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    [(TSDLayoutGeometry *)v9 size];
    v123.origin.double x = TSDRectWithSize();
    CGFloat width = v123.size.width;
    CGFloat height = v123.size.height;
    v127.origin.double x = v34;
    v127.origin.double y = v36;
    v127.size.CGFloat width = v38;
    v127.size.CGFloat height = v40;
    CGRect v124 = CGRectUnion(v123, v127);
    double x = v124.origin.x;
    double y = v124.origin.y;
    v45 = -[TSDLayoutGeometry initWithFrame:]([TSDMutableLayoutGeometry alloc], "initWithFrame:", v124.origin.x, v124.origin.y, v124.size.width, v124.size.height);
    if (v9) {
      [(TSDLayoutGeometry *)v9 transform];
    }
    else {
      memset(v114, 0, sizeof(v114));
    }
    [(TSDMutableLayoutGeometry *)v45 transformBy:v114];
    if (v5) {
      [(TSDLayoutGeometry *)v5 transform];
    }
    else {
      memset(v113, 0, sizeof(v113));
    }
    [(TSDMutableLayoutGeometry *)v45 transformBy:v113];
    v46 = v45;
    double v47 = -x;
    double v48 = -y;
    if (v3)
    {
      double v49 = v47;
      double v50 = v48;
      double v26 = width;
      double v28 = height;
    }
    else
    {
      v125.origin.double x = v104;
      v125.origin.double y = v102;
      v125.size.CGFloat width = v26;
      v125.size.CGFloat height = v28;
      v51 = CGPathCreateWithRect(v125, 0);
      TSDPathBoundsIncludingStroke(v51, v6);
      if (v52 <= 0.0) {
        double v53 = v52;
      }
      else {
        double v53 = 0.0;
      }
      double v49 = TSDSubtractPoints(v104, v102, v53);
      double v50 = v54;
      CGPathRelease(v51);
    }
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v49, v50, v26, v28);
    CGAffineTransformMakeTranslation(&v119, v47, v48);
    long long v55 = *(_OWORD *)&v119.c;
    *(_OWORD *)&self->mLayoutToMaskTransform.a = *(_OWORD *)&v119.a;
    *(_OWORD *)&self->mLayoutToMaskTransform.c = v55;
    *(_OWORD *)&self->mLayoutToMaskTransform.tdouble x = *(_OWORD *)&v119.tx;
    goto LABEL_48;
  }
  if ([v7 instantAlphaPath])
  {
    v17 = [TSDLayoutGeometry alloc];
    [(TSDLayoutGeometry *)self->mImageGeometry size];
    long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v119.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v119.c = v18;
    *(_OWORD *)&v119.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    v9 = -[TSDLayoutGeometry initWithSize:transform:](v17, "initWithSize:transform:", &v119);
    v14 = 0;
    goto LABEL_10;
  }
  uint64_t v56 = MEMORY[0x263F000D0];
  long long v57 = *MEMORY[0x263F000D0];
  long long v58 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&self->mLayoutToMaskTransform.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->mLayoutToMaskTransform.c = v58;
  long long v59 = *(_OWORD *)(v56 + 32);
  *(_OWORD *)&self->mLayoutToMaskTransform.tdouble x = v59;
  self->mMaskIntersectsImage = 0;
  if (v6
    && (long long v103 = v58,
        long long v105 = v57,
        long long v101 = v59,
        int v60 = [v6 shouldRender],
        long long v59 = v101,
        long long v58 = v103,
        long long v57 = v105,
        v60))
  {
    if (objc_msgSend(v6, "isFrame", *(double *)&v105, *(double *)&v103, *(double *)&v101))
    {
      [(TSDLayoutGeometry *)v5 size];
      double v61 = TSDRectWithSize();
      uint64_t v63 = v62;
      uint64_t v65 = v64;
      uint64_t v67 = v66;
      objc_msgSend(v6, "coverageRect:");
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      double v73 = v72;
      double v75 = v74;
      v76 = (void *)[(TSDMutableLayoutGeometry *)v5 mutableCopy];
      objc_msgSend(v76, "setSize:", v73, v75);
      if (v76) {
        [v76 transform];
      }
      else {
        memset(&v107, 0, sizeof(v107));
      }
      CGAffineTransformTranslate(&v108, &v107, v69, v71);
      CGAffineTransform v106 = v108;
      [v76 setTransform:&v106];
      v46 = v76;
      CGFloat v98 = -v69;
      CGFloat v99 = -v71;
      CGAffineTransformMakeTranslation(&v119, v98, v99);
      long long v100 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v100;
      *(_OWORD *)&self->mLayoutToImageTransform.tdouble x = *(_OWORD *)&v119.tx;
      double v92 = v61;
      uint64_t v93 = v63;
      uint64_t v94 = v65;
      uint64_t v95 = v67;
      CGFloat v96 = v98;
      CGFloat v97 = v99;
    }
    else
    {
      [v6 width];
      CGFloat v90 = v89 * 0.5;
      v46 = -[TSDLayoutGeometry geometryByOutsettingBy:](v5, "geometryByOutsettingBy:", v90, v90);
      CGAffineTransformMakeTranslation(&v119, v90, v90);
      long long v91 = *(_OWORD *)&v119.c;
      *(_OWORD *)&self->mLayoutToImageTransform.a = *(_OWORD *)&v119.a;
      *(_OWORD *)&self->mLayoutToImageTransform.c = v91;
      *(_OWORD *)&self->mLayoutToImageTransform.tdouble x = *(_OWORD *)&v119.tx;
      [(TSDLayoutGeometry *)v5 size];
      double v92 = TSDRectWithSize();
      CGFloat v96 = v90;
      CGFloat v97 = v90;
    }
    CGRect v126 = CGRectOffset(*(CGRect *)&v92, v96, v97);
    -[TSDMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v126.origin.x, v126.origin.y, v126.size.width, v126.size.height);
  }
  else
  {
    *(_OWORD *)&self->mLayoutToImageTransform.a = v57;
    *(_OWORD *)&self->mLayoutToImageTransform.c = v58;
    *(_OWORD *)&self->mLayoutToImageTransform.tdouble x = v59;
    [(TSDLayoutGeometry *)v5 size];
    [(TSDMediaLayout *)self setBoundsForStandardKnobs:TSDRectWithSize()];
    v46 = v5;
  }
LABEL_52:
  if ([v6 isFrame])
  {
    if (self->mPathToStroke)
    {
      [+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:") bounds];
    }
    else
    {
      [(TSDLayoutGeometry *)v5 size];
      double v81 = TSDRectWithSize();
    }
    [v6 coverageRectWithoutAdornment:v81];
    -[TSDMediaLayout setShouldRenderFrameStroke:](self, "setShouldRenderFrameStroke:", objc_msgSend(v6, "shouldRenderForSizeIncludingCoverage:", v82, v83));
  }
  id v84 = [(TSDLayout *)self i_layoutGeometryProvider];
  if (!v84) {
    return v46;
  }
  v85 = v84;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v46;
  }
  v86 = (void *)[v85 adjustLayoutGeometry:v46 forLayout:self];
  if (objc_opt_respondsToSelector())
  {
    v87 = self->mImageGeometry;
    self->mImageGeometrdouble y = (TSDLayoutGeometry *)(id)[v85 adjustImageGeometry:self->mImageGeometry withLayoutGeometry:v46 forLayout:self];
  }
  return v86;
}

- (void)processChangedProperty:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDImageLayout;
  -[TSDMediaLayout processChangedProperty:](&v7, sel_processChangedProperty_);
  if (a3 == 517)
  {
    [(TSDLayout *)self invalidateFrame];
LABEL_8:
    [(TSDMediaLayout *)self invalidateAlignmentFrame];
    [(TSDDrawableLayout *)self invalidateExteriorWrap];
    goto LABEL_9;
  }
  if ((a3 & 0xFFFFFFFE) == 0x200) {
    goto LABEL_8;
  }
  if ((a3 & 0xFFFFFFFE) != 0x210)
  {
    if (a3 == 521)
    {
      [(TSDDrawableLayout *)self invalidateExteriorWrap];

      self->mTracedPath = 0;
    }
    return;
  }
  [(TSDLayout *)self invalidateFrame];
  [(TSDMediaLayout *)self invalidateAlignmentFrame];
  [(TSDLayout *)self invalidateChildren];
  [(TSDDrawableLayout *)self invalidateExteriorWrap];
  if (a3 != 529)
  {
    if (a3 == 528)
    {

      self->mTracedPath = 0;
      self->mHasAlpha = 0;
    }
    return;
  }
LABEL_9:
  if (([(TSDInfo *)[(TSDLayout *)self info] isInlineWithText] & 1) != 0
    || [(TSDInfo *)[(TSDLayout *)self info] isAnchoredToText])
  {
    double v5 = [(TSDAbstractLayout *)self parent];
    if (v5)
    {
      double v6 = v5;
      while ((objc_opt_respondsToSelector() & 1) == 0)
      {
        double v6 = [(TSDAbstractLayout *)v6 parent];
        if (!v6) {
          return;
        }
      }
      [(TSDAbstractLayout *)v6 wrappableChildInvalidated:self];
    }
  }
}

- (void)updateChildrenFromInfo
{
  id v3 = objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "maskInfo");
  mMaskLayout = self->mMaskLayout;
  if ((v3 != 0) == (mMaskLayout == 0) || [(TSDMaskLayout *)mMaskLayout maskInfo] != v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    double v6 = self->mMaskLayout;
    if (v3)
    {
      if (v6)
      {

        self->mMaskLayout = 0;
      }
      objc_super v7 = (TSDMaskLayout *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "layoutClass")), "initWithInfo:", v3);
      self->mMaskLayout = v7;
      [v5 addObject:v7];
    }
    else
    {

      self->mMaskLayout = 0;
    }
    [(TSDAbstractLayout *)self setChildren:v5];

    [(TSDDrawableLayout *)self invalidate];
  }
  v8 = [(TSDAbstractLayout *)self children];

  [(NSArray *)v8 makeObjectsPerformSelector:sel_updateChildrenFromInfo];
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->mMaskLayout && !objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath")
    || !self->mPathToStroke)
  {
    memset(&v22, 0, sizeof(v22));
    objc_super v7 = [(TSDAbstractLayout *)self geometry];
    if (v7)
    {
      [(TSDLayoutGeometry *)v7 fullTransform];
      if (!v3) {
        goto LABEL_23;
      }
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      if (!v3)
      {
LABEL_23:
        CGAffineTransform v21 = v22;
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        double v10 = 1.0;
        double v11 = 1.0;
        goto LABEL_24;
      }
    }
    if ([(TSDAbstractLayout *)self parent])
    {
      double v16 = [(TSDAbstractLayout *)self parent];
      if (v16) {
        [(TSDAbstractLayout *)v16 transformInRoot];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform v19 = v22;
      CGAffineTransformConcat(&v21, &v19, &t2);
      CGAffineTransform v22 = v21;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  [(TSDMediaLayout *)self stroke];
  id v5 = (void *)TSUDynamicCast();
  double v6 = +[TSDBezierPath bezierPathWithCGPath:self->mPathToStroke];
  memset(&v22, 0, sizeof(v22));
  [(TSDImageLayout *)self layoutToMaskTransform];
  if (v3) {
    [(TSDAbstractLayout *)self transformInRoot];
  }
  else {
    [(TSDAbstractLayout *)self transform];
  }
  CGAffineTransformConcat(&v22, &t1, &v17);
  CGAffineTransform v21 = v22;
  [(TSDBezierPath *)v6 transformUsingAffineTransform:&v21];
  if (v5 && [v5 shouldRender])
  {
    if ([v5 isFrame]
      && [(TSDImageLayout *)self shouldRenderFrameStroke])
    {
      [+[TSDBezierPath bezierPathWithCGPath:self->mPathToStroke] bounds];
      objc_msgSend(v5, "coverageRect:");
      CGAffineTransform v21 = v22;
LABEL_24:
      *(CGRect *)&CGFloat v12 = CGRectApplyAffineTransform(*(CGRect *)&v8, &v21);
      goto LABEL_25;
    }
    [(TSDBezierPath *)v6 takeAttributesFromStroke:v5];
    [(TSDBezierPath *)v6 boundsIncludingStroke];
  }
  else
  {
    [(TSDBezierPath *)v6 bounds];
  }
LABEL_25:
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  if ([(TSDImageLayout *)self isResizingInMaskEditMode])
  {
    if ([(TSDImageLayout *)self maskEditModeForResizing] == 2)
    {
LABEL_3:
      objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
      double v3 = TSDRectWithSize();
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      memset(&v25, 0, sizeof(v25));
      if (self)
      {
        [(TSDImageLayout *)self layoutToImageTransform];
        [(TSDAbstractLayout *)self transformInRoot];
      }
      else
      {
        memset(v21, 0, sizeof(v21));
        memset(v20, 0, sizeof(v20));
      }
      p_CGAffineTransform t1 = (CGAffineTransform *)v21;
      p_CGAffineTransform t2 = (CGAffineTransform *)v20;
LABEL_14:
      CGAffineTransformConcat(&v25, p_t1, p_t2);
      CGAffineTransform v22 = v25;
      v26.origin.double x = v3;
      v26.origin.double y = v5;
      v26.size.CGFloat width = v7;
      v26.size.CGFloat height = v9;
      *(CGRect *)&CGFloat v13 = CGRectApplyAffineTransform(v26, &v22);
      goto LABEL_15;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry"), "size");
    double v3 = TSDRectWithSize();
    CGFloat v5 = v10;
    CGFloat v7 = v11;
    CGFloat v9 = v12;
    memset(&v25, 0, sizeof(v25));
    if (self)
    {
      [(TSDImageLayout *)self layoutToMaskTransform];
      [(TSDAbstractLayout *)self transformInRoot];
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    p_CGAffineTransform t1 = &t1;
    p_CGAffineTransform t2 = &t2;
    goto LABEL_14;
  }
  if ([(TSDImageLayout *)self isDraggingInMaskEditMode])
  {
    if ([(TSDImageLayout *)self maskEditModeForDragging] != 3) {
      goto LABEL_3;
    }
    goto LABEL_7;
  }
  v19.receiver = self;
  v19.super_class = (Class)TSDImageLayout;
  [(TSDAbstractLayout *)&v19 alignmentFrameForProvidingGuidesInRoot];
LABEL_15:
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    id v7 = -[TSDLayoutGeometry geometryByTranslatingBy:](self->mImageGeometry, "geometryByTranslatingBy:", a3.x, a3.y);

    self->mImageGeometrdouble y = (TSDLayoutGeometry *)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDImageLayout;
  -[TSDAbstractLayout offsetGeometryBy:](&v8, sel_offsetGeometryBy_, x, y);
}

- (BOOL)hasAlpha
{
  if (!self->mHasAlpha)
  {
    self->mHasAlpha = 1;
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "imageData"), 0);
    objc_opt_class();
    double v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      if ([v4 isOpaque]) {
        self->mHasAlpha = 2;
      }
    }
  }
  return self->mHasAlpha == 1;
}

- (BOOL)isInvisible
{
  double v3 = [(TSDImageLayout *)self pathToStroke];
  if (v3)
  {
    BoundingBodouble x = CGPathGetBoundingBox(v3);
  }
  else
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    BoundingBox.origin.double x = TSDRectWithSize();
  }

  return CGRectIsNull(BoundingBox);
}

- (BOOL)shouldDisplayGuides
{
  if ([(TSDImageLayout *)self isResizingInMaskEditMode]
    || [(TSDImageLayout *)self isDraggingInMaskEditMode])
  {
    return 1;
  }
  if (self->mScalingInMaskMode) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return [(TSDLayout *)&v4 shouldDisplayGuides];
}

- (BOOL)shouldRenderFrameStroke
{
  if ([(TSDImageLayout *)self isInInstantAlphaMode]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return [(TSDMediaLayout *)&v4 shouldRenderFrameStroke];
}

- (BOOL)maskIntersectsImage
{
  return self->mMaskIntersectsImage;
}

- (void)beginDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  [(TSDLayout *)&v3 beginDynamicOperation];
  objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "beginDynamicOperation");
  self->mBaseImageLayoutGeometrdouble y = (TSDLayoutGeometry *)objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "copy");
  [(TSDImageLayout *)self p_createDynamicCopies];
}

- (void)endDynamicOperation
{
  [(TSDImageLayout *)self p_destroyDynamicCopies];

  self->mBaseImageLayoutGeometrdouble y = 0;
  objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "endDynamicOperation");
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  [(TSDLayout *)&v3 endDynamicOperation];
}

- (void)beginResize
{
  v6.receiver = self;
  v6.super_class = (Class)TSDImageLayout;
  [(TSDLayout *)&v6 beginResize];
  if ([(TSDImageLayout *)self maskEditMode] == 3)
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    self->super.super.super.super.mInitialBoundsForStandardKnobs.origin.double x = TSDRectWithSize();
    self->super.super.super.super.mInitialBoundsForStandardKnobs.origin.double y = v3;
    self->super.super.super.super.mInitialBoundsForStandardKnobs.size.CGFloat width = v4;
    self->super.super.super.super.mInitialBoundsForStandardKnobs.size.CGFloat height = v5;

    self->super.super.super.super.mBaseGeometrdouble y = (TSDLayoutGeometry *)objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "copy");
  }
}

- (void)beginDrag
{
  if ([(TSDImageLayout *)self maskEditModeForDragging] == 3)
  {
    [(TSDLayout *)self i_setBaseCapturedAlignmentFrameOriginForInline];
    [(TSDLayout *)self invalidateSize];
    [(TSDLayout *)self validate];
  }
  else
  {
    [(TSDImageLayout *)self maskEditModeForDragging];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  [(TSDLayout *)&v3 beginDrag];
}

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    if ([(TSDImageLayout *)self maskEditModeForDragging] == 3)
    {
      id v7 = (void *)[(TSDInfoGeometry *)self->mDynamicInfoGeometry mutableCopy];
      [v7 position];
      objc_msgSend(v7, "setPosition:", TSDAddPoints(v8, v9, x));
      [(TSDImageLayout *)self p_setDynamicInfoGeometry:v7];

      objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "dragBy:", x, y);
      if ([(TSDInfo *)[(TSDLayout *)self info] owningAttachment])
      {
        [(TSDLayout *)self invalidatePosition];
        objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", self);
        [(TSDAbstractLayout *)self fixTransformFromLastInterimPosition];
      }
    }
    else if ([(TSDImageLayout *)self maskEditModeForDragging] == 2)
    {
      id v10 = [(TSDImageLayout *)self maskLayout];
      objc_msgSend(v10, "dragBy:", x, y);
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)TSDImageLayout;
      -[TSDDrawableLayout dragBy:](&v14, sel_dragBy_, x, y);
      if (!self->mBaseImageLayoutGeometry)
      {
        double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[TSDImageLayout dragBy:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 744, @"invalid nil value for '%s'", "mBaseImageLayoutGeometry");
      }
      id v13 = -[TSDLayoutGeometry geometryByTranslatingBy:](self->mImageGeometry, "geometryByTranslatingBy:", x, y);

      self->mImageGeometrdouble y = (TSDLayoutGeometry *)v13;
    }
  }
}

- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline
{
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return [(TSDLayout *)&v4 i_useBaseCapturedAlignmentFrameOriginForInline]|| [(TSDImageLayout *)self isDraggingInMaskEditMode]|| [(TSDImageLayout *)self isRotatingInMaskEditMode];
}

- (void)endDrag
{
  if (![(TSDImageLayout *)self isDraggingInMaskEditMode])
  {

    self->mImageGeometrdouble y = self->mBaseImageLayoutGeometry;
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDImageLayout;
  [(TSDLayout *)&v3 endDrag];
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  memset(&v17, 0, sizeof(v17));
  mBaseImageLayoutGeometrdouble y = self->mBaseImageLayoutGeometry;
  if (mBaseImageLayoutGeometry) {
    [(TSDLayoutGeometry *)mBaseImageLayoutGeometry fullTransform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransformInvert(&t1, &v15);
  double v8 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  if (v8) {
    [v8 fullTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v17, &t1, &t2);
  CGAffineTransform v11 = v17;
  CGAffineTransformInvert(&v12, &v11);
  long long v9 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tdouble x = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v13, &v12, &v11);
  CGAffineTransform v11 = v17;
  return CGAffineTransformConcat(retstr, &v13, &v11);
}

- (void)takeRotationFromTracker:(id)a3
{
  if (!a3)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
    if (self) {
      goto LABEL_3;
    }
LABEL_5:
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    goto LABEL_6;
  }
  [a3 rotateTransform];
  if (!self) {
    goto LABEL_5;
  }
LABEL_3:
  [(TSDImageLayout *)self layoutTransformInInfoSpace:&v5];
LABEL_6:
  -[TSDImageLayout resizeWithTransform:asChild:](self, "resizeWithTransform:asChild:", &v8, objc_msgSend((id)objc_msgSend(a3, "rep", v5, v6, v7, v8, v9, v10), "layout") != (void)self);
}

- (CGPoint)centerForRotation
{
  if ([(TSDImageLayout *)self isRotatingInMaskEditMode])
  {
    [(TSDImageLayout *)self centerForRotationInMaskMode];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDImageLayout;
    [(TSDLayout *)&v5 centerForRotation];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)centerForRotationInMaskMode
{
  if ([(TSDImageLayout *)self maskEditModeForRotating] == 3)
  {
    if (objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      objc_msgSend((id)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath"), "bounds");
      double v7 = TSDCenterOfRect(v3, v4, v5, v6);
      double v9 = v8;
      if (self)
      {
        [(TSDImageLayout *)self imageDataToVisualSizeTransform];
        double v10 = v67;
        double v11 = v66;
        double v12 = v69;
        double v13 = v68;
        double v14 = v71;
        double v15 = v70;
      }
      else
      {
        double v14 = 0.0;
        double v12 = 0.0;
        double v10 = 0.0;
        double v15 = 0.0;
        double v13 = 0.0;
        double v11 = 0.0;
      }
      double v39 = v15 + v9 * v13 + v11 * v7;
      double v40 = v14 + v9 * v12 + v10 * v7;
      if (self)
      {
        [(TSDImageLayout *)self layoutToImageTransform];
        double v42 = v60;
        double v41 = v61;
        double v44 = v62;
        double v43 = v63;
        double v45 = v64;
        double v27 = v65;
      }
      else
      {
        double v27 = 0.0;
        double v43 = 0.0;
        double v41 = 0.0;
        double v45 = 0.0;
        double v44 = 0.0;
        double v42 = 0.0;
      }
      double v29 = v45 + v40 * v44 + v42 * v39;
      double v38 = v40 * v43 + v41 * v39;
      goto LABEL_18;
    }
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    double v33 = TSDRectWithSize();
    double v20 = TSDCenterOfRect(v33, v34, v35, v36);
    double v22 = v37;
    if (self)
    {
      [(TSDImageLayout *)self layoutToImageTransform];
      double v24 = v54;
      double v23 = v55;
      double v26 = v56;
      double v25 = v57;
      double v28 = v58;
      double v27 = v59;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ([(TSDImageLayout *)self maskEditModeForRotating] == 2)
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry"), "size");
    double v16 = TSDRectWithSize();
    double v20 = TSDCenterOfRect(v16, v17, v18, v19);
    double v22 = v21;
    if (self)
    {
      [(TSDImageLayout *)self layoutToMaskTransform];
      double v24 = v48;
      double v23 = v49;
      double v26 = v50;
      double v25 = v51;
      double v28 = v52;
      double v27 = v53;
LABEL_12:
      double v29 = v28 + v22 * v26 + v24 * v20;
      double v38 = v22 * v25 + v23 * v20;
LABEL_18:
      double v30 = v27 + v38;
      goto LABEL_19;
    }
LABEL_11:
    double v27 = 0.0;
    double v25 = 0.0;
    double v23 = 0.0;
    double v28 = 0.0;
    double v26 = 0.0;
    double v24 = 0.0;
    goto LABEL_12;
  }
  double v29 = *MEMORY[0x263F00148];
  double v30 = *(double *)(MEMORY[0x263F00148] + 8);
  v31 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v32 = [NSString stringWithUTF8String:"-[TSDImageLayout centerForRotationInMaskMode]"];
  objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 817, @"asking for mask mode center of rotation when not in mask edit mode");
LABEL_19:
  double v46 = v29;
  double v47 = v30;
  result.double y = v47;
  result.double x = v46;
  return result;
}

- (CGPoint)centerForConnecting
{
  if (objc_msgSend(-[TSDDrawableLayout i_wrapPath](self, "i_wrapPath"), "elementCount") < 2)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDImageLayout;
    [(TSDLayout *)&v17 centerForConnecting];
  }
  else
  {
    objc_msgSend(-[TSDDrawableLayout i_wrapPath](self, "i_wrapPath"), "bounds");
    double v7 = TSDCenterOfRect(v3, v4, v5, v6);
    double v15 = v8;
    double v16 = v7;
    double v9 = [(TSDAbstractLayout *)self geometry];
    if (v9)
    {
      [(TSDLayoutGeometry *)v9 transform];
      float64x2_t v10 = v18;
      float64x2_t v11 = v19;
      float64x2_t v12 = v20;
    }
    else
    {
      float64x2_t v12 = 0uLL;
      float64x2_t v10 = 0uLL;
      float64x2_t v11 = 0uLL;
    }
    float64x2_t v13 = vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, v15), v10, v16));
    double v14 = v13.f64[1];
  }
  result.double x = v13.f64[0];
  result.double y = v14;
  return result;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  if ([(TSDImageLayout *)self maskEditModeForResizing] == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    if ([(TSDImageLayout *)self maskEditModeForResizing] != 1) {
      goto LABEL_8;
    }
    CGFloat v4 = objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry");
    if (v4) {
      [v4 transform];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    BOOL v3 = TSDIsTransformAxisAlignedWithThreshold((double *)v7, 0.0001);
    if (v3)
    {
LABEL_8:
      v6.receiver = self;
      v6.super_class = (Class)TSDImageLayout;
      LOBYTE(v3) = [(TSDLayout *)&v6 canAspectRatioLockBeChangedByUser];
    }
  }
  return v3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  if ([(TSDImageLayout *)self maskEditModeForResizing] == 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    if ([(TSDImageLayout *)self maskEditModeForResizing] != 1) {
      goto LABEL_8;
    }
    CGFloat v4 = objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "geometry");
    if (v4) {
      [v4 transform];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    BOOL v3 = TSDIsTransformAxisAlignedWithThreshold((double *)v7, 0.0001);
    if (v3)
    {
LABEL_8:
      v6.receiver = self;
      v6.super_class = (Class)TSDImageLayout;
      LOBYTE(v3) = [(TSDLayout *)&v6 resizeMayChangeAspectRatio];
    }
  }
  return v3;
}

- (BOOL)shouldSnapWhileResizing
{
  if ([(TSDImageLayout *)self isInMaskEditMode]
    && [(TSDImageLayout *)self maskEditModeForLayoutState] == 3)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageLayout;
  return [(TSDAbstractLayout *)&v4 shouldSnapWhileResizing];
}

- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(TSDImageLayout *)self isInMaskEditMode]
    && [(TSDImageLayout *)self maskEditModeForLayoutState] != 3)
  {
    if ([(TSDImageLayout *)self maskEditModeForLayoutState] != 2) {
      return;
    }
    id v10 = [(TSDImageLayout *)self maskLayout];
    long long v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v23.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v23.c = v13;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)&a3->tx;
    p_CGAffineTransform t2 = &v23;
    goto LABEL_21;
  }
  if (v4)
  {
    a3->tdouble x = 0.0;
    a3->tdouble y = 0.0;
  }
  memset(&v23, 0, sizeof(v23));
  double v7 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  if (v7) {
    [v7 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v23, &t1, &t2);
  CGAffineTransform t2 = v23;
  [(TSDImageLayout *)self p_setDynamicInfoGeometry:+[TSDInfoGeometry geometryFromFullTransform:&t2]];
  if ([(TSDImageLayout *)self maskEditModeForLayoutState] == 3)
  {
    memset(&t2, 0, sizeof(t2));
    double v9 = objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "geometry");
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    CGAffineTransformInvert(&v20, &v19);
    mDynamicInfoGeometrdouble y = self->mDynamicInfoGeometry;
    if (mDynamicInfoGeometry) {
      [(TSDInfoGeometry *)mDynamicInfoGeometry transform];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    CGAffineTransformConcat(&t2, &v20, &v18);
    id v15 = [(TSDImageLayout *)self maskLayout];
    CGAffineTransform v16 = t2;
    CGAffineTransformInvert(&v17, &v16);
    p_CGAffineTransform t2 = &v17;
    id v10 = v15;
    goto LABEL_21;
  }
  if (![(TSDImageLayout *)self isInMaskEditMode]
    && [(TSDLayout *)self layoutState] == 4)
  {
    id v10 = [(TSDImageLayout *)self maskLayout];
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    p_CGAffineTransform t2 = &t2;
LABEL_21:
    [v10 resizeWithTransform:p_t2 asChild:0];
  }
}

- (id)smartPathSource
{
  return (id)TSUClassAndProtocolCast();
}

- (CGRect)pathBoundsWithoutStroke
{
  id v2 = objc_msgSend(-[TSDImageLayout smartPathSource](self, "smartPathSource"), "bezierPath");

  [v2 bounds];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)maskWasReset
{
  if ([(TSDImageLayout *)self isInMaskEditMode])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout maskWasReset]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 952, @"Mask should never be reset in mask edit mode");
  }
  self->mMaskEditMode = 0;
}

- (void)maskWasApplied
{
  if ([(TSDImageLayout *)self isInMaskEditMode])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout maskWasApplied]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 958, @"maskWasApplied should not be called in mask edit mode");
  }
  self->mMaskEditMode = 1;
}

- (void)beginEditingImageInMaskEditMode
{
  if ([(TSDImageLayout *)self maskEditMode] == 3)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout beginEditingImageInMaskEditMode]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 964, @"already editing image in mask edit mode");
  }
  self->mMaskEditMode = 3;
  double v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"TSDImageLayoutMaskEditModeDidChangeNotification" object:self];
}

- (void)beginEditingMaskInMaskEditMode
{
  if ([(TSDImageLayout *)self maskEditMode] == 2)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout beginEditingMaskInMaskEditMode]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 971, @"already editing mask in mask edit mode");
  }
  self->mMaskEditMode = 2;
  double v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v5 postNotificationName:@"TSDImageLayoutMaskEditModeDidChangeNotification" object:self];
}

- (void)endMaskEditMode
{
  if ([(TSDImageLayout *)self isInInstantAlphaMode])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout endMaskEditMode]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 978, @"Cannot end mask edit mode while still editing instant alpha");
  }
  if ([(TSDImageLayout *)self maskEditMode] != 3
    && [(TSDImageLayout *)self maskEditMode] != 2)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageLayout endMaskEditMode]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 979, @"not in mask edit mode");
  }
  self->mMaskEditMode = 1;
  double v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v7 postNotificationName:@"TSDImageLayoutMaskEditModeDidChangeNotification" object:self];
}

- (BOOL)isInMaskEditMode
{
  return [(TSDImageLayout *)self maskEditMode] == 2
      || [(TSDImageLayout *)self maskEditMode] == 3;
}

- (BOOL)isDraggingInMaskEditMode
{
  BOOL v3 = [(TSDImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(TSDLayout *)self layoutState] == 2;
  }
  return v3;
}

- (BOOL)isRotatingInMaskEditMode
{
  BOOL v3 = [(TSDImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(TSDLayout *)self layoutState] == 3;
  }
  return v3;
}

- (BOOL)isResizingInMaskEditMode
{
  BOOL v3 = [(TSDImageLayout *)self isInMaskEditMode];
  if (v3) {
    LOBYTE(v3) = [(TSDLayout *)self layoutState] == 4;
  }
  return v3;
}

- (int)maskEditModeForDragging
{
  if ([(TSDImageLayout *)self isInMaskEditMode]) {
    return 3;
  }

  return [(TSDImageLayout *)self maskEditMode];
}

- (int)maskEditModeForRotating
{
  if ([(TSDImageLayout *)self isInMaskEditMode]) {
    return 3;
  }

  return [(TSDImageLayout *)self maskEditMode];
}

- (int)maskEditModeForResizing
{
  if (self->mScalingInMaskMode) {
    return 3;
  }
  else {
    return [(TSDImageLayout *)self maskEditMode];
  }
}

- (int)maskEditModeForLayoutState
{
  int v3 = [(TSDLayout *)self layoutState];
  if (v3 == 3)
  {
    return [(TSDImageLayout *)self maskEditModeForRotating];
  }
  else if (v3 == 2)
  {
    return [(TSDImageLayout *)self maskEditModeForDragging];
  }
  else
  {
    return [(TSDImageLayout *)self maskEditModeForResizing];
  }
}

- (void)maskModeScaleDidBegin
{
  self->mScalingInMaskMode = 1;
  [(TSDMaskLayout *)self->mMaskLayout maskModeScaleDidBegin];
}

- (void)maskModeScaleDidEnd
{
  self->mScalingInMaskMode = 0;
  [(TSDMaskLayout *)self->mMaskLayout maskModeScaleDidEnd];
}

- (void)beginInstantAlphaMode
{
  if (![(TSDImageLayout *)self isInMaskEditMode])
  {
    int v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout beginInstantAlphaMode]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1073, @"must be editing the mask when editing instant alpha");
  }
  self->mInInstantAlphaMode = 1;
}

- (void)endInstantAlphaMode
{
  self->mInInstantAlphaMode = 0;
  [(TSDImageLayout *)self endMaskEditMode];
}

- (id)imageInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

- (id)imageGeometry
{
  return self->mImageGeometry;
}

- (id)originalImageGeometry
{
  return self->mBaseImageLayoutGeometry;
}

- (id)imageGeometryInRoot
{
  int v3 = (void *)[(TSDLayoutGeometry *)self->mImageGeometry mutableCopy];
  uint64_t v4 = [(TSDAbstractLayout *)self parent];
  if (v4)
  {
    double v5 = v4;
    do
    {
      uint64_t v6 = [(TSDAbstractLayout *)v5 geometry];
      if (v6)
      {
        [(TSDLayoutGeometry *)v6 transform];
      }
      else
      {
        long long v9 = 0u;
        long long v10 = 0u;
        long long v8 = 0u;
      }
      [v3 transformBy:&v8];
      double v5 = [(TSDAbstractLayout *)v5 parent];
    }
    while (v5);
  }
  return v3;
}

- (id)inspectorGeometry
{
  if ([(TSDImageLayout *)self maskEditMode] == 3)
  {
    id v3 = [(TSDImageLayout *)self imageGeometry];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v14 = *MEMORY[0x263F000D0];
    long long v15 = v4;
    long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    double v5 = [(TSDAbstractLayout *)self parent];
    if (v5)
    {
      uint64_t v6 = v5;
      do
      {
        if ([(TSDAbstractLayout *)v6 isRootLayoutForInspectorGeometry]) {
          break;
        }
        double v7 = [(TSDAbstractLayout *)v6 geometry];
        if (v7)
        {
          v10[0] = v14;
          v10[1] = v15;
          v10[2] = v16;
          [(TSDLayoutGeometry *)v7 transformByConcatenatingTransformTo:v10];
        }
        else
        {
          long long v12 = 0u;
          long long v13 = 0u;
          long long v11 = 0u;
        }
        long long v14 = v11;
        long long v15 = v12;
        long long v16 = v13;
        uint64_t v6 = [(TSDAbstractLayout *)v6 parent];
      }
      while (v6);
    }
    long long v11 = v14;
    long long v12 = v15;
    long long v13 = v16;
    return (id)[v3 geometryByTransformingBy:&v11];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDImageLayout;
    return [(TSDLayout *)&v9 inspectorGeometry];
  }
}

- (BOOL)hasMaskingPath
{
  if ([(TSDImageLayout *)self maskLayout]
    || (uint64_t v3 = objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "instantAlphaPath")) != 0)
  {
    if (!self->mPathToStroke)
    {
      long long v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImageLayout hasMaskingPath]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1135, @"If image has masking path it must specify a path to stroke");
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (CGPath)pathToStroke
{
  return self->mPathToStroke;
}

- (CGSize)sizeOfFrameRectIncludingCoverage
{
  mPathToStroke = self->mPathToStroke;
  if (mPathToStroke)
  {
    TSDPathBoundsIncludingStroke(mPathToStroke, [(TSDMediaLayout *)self stroke]);
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v7 = [(TSDAbstractLayout *)self geometry];
    [(TSDLayoutGeometry *)v7 size];
  }
  result.CGFloat height = v6;
  result.CGFloat width = v4;
  return result;
}

- (CGAffineTransform)layoutToImageTransform
{
  long long v3 = *(_OWORD *)&self[9].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[9].c;
  return self;
}

- (CGAffineTransform)layoutToMaskTransform
{
  long long v3 = *(_OWORD *)&self[10].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[10].c;
  return self;
}

- (CGAffineTransform)imageDataToVisualSizeTransform
{
  objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
  double v6 = v5;
  double v8 = v7;
  CGSize result = (CGAffineTransform *)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "naturalSize");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  if (v10 > 0.0 || v11 > 0.0)
  {
    double v14 = v6 / v10;
    double v15 = v8 / v11;
    return CGAffineTransformMakeScale(retstr, v14, v15);
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F000D0];
    long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v12 + 32);
  }
  return result;
}

- (id)maskLayout
{
  return self->mMaskLayout;
}

- (id)imageAdjustments
{
  if (self->mIsUpdatingImageAdjustments) {
    return self->mDynamicImageAdjustments;
  }
  id v3 = [(TSDImageLayout *)self imageInfo];

  return (id)[v3 imageAdjustments];
}

- (BOOL)isDynamicallyChangingImageAdjustments
{
  return self->mIsUpdatingImageAdjustments;
}

- (void)dynamicImageAdjustmentsChangeDidBegin
{
  self->mIsUpdatingImageAdjustments = 1;
  self->mDynamicImageAdjustments = (TSDImageAdjustments *)objc_msgSend((id)objc_msgSend(-[TSDImageLayout imageInfo](self, "imageInfo"), "imageAdjustments"), "copy");
}

- (void)dynamicImageAdjustmentsUpdateToValue:(id)a3
{
  self->mDynamicImageAdjustments = (TSDImageAdjustments *)[a3 copy];
}

- (void)dynamicImageAdjustmentsChangeDidEnd
{
  self->mIsUpdatingImageAdjustments = 0;

  self->mDynamicImageAdjustments = 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  [(TSDMediaLayout *)self alignmentFrame];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if ([(TSDAbstractLayout *)self parent])
  {
    -[TSDAbstractLayout rectInRoot:]([(TSDAbstractLayout *)self parent], "rectInRoot:", x, y, width, height);
    double x = v11;
    double y = v12;
    double width = v13;
    double height = v14;
  }
  double v15 = (void *)[(TSDInfo *)[(TSDLayout *)self info] exteriorTextWrap];
  if (v15)
  {
    [v15 margin];
    if (v16 > 0.0)
    {
      CGFloat v17 = -v16;
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      CGRect v23 = CGRectInset(v22, v17, v17);
      double x = v23.origin.x;
      double y = v23.origin.y;
      double width = v23.size.width;
      double height = v23.size.height;
    }
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (id)i_computeWrapPath
{
  id v3 = [(TSDImageLayout *)self imageInfo];
  objc_opt_class();
  [(TSDMediaLayout *)self stroke];
  double v4 = (void *)TSUDynamicCast();
  double v5 = v4;
  if (v4 && [v4 shouldRender])
  {
    int v6 = [v5 isFrame];
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    int v6 = 0;
  }
  uint64_t v8 = [v3 instantAlphaPath];
  id v9 = [(TSDImageLayout *)self maskLayout];
  double v10 = objc_msgSend(-[TSDImageLayout maskLayout](self, "maskLayout"), "computeLayoutGeometry");
  memset(&v42, 0, sizeof(v42));
  if (v9)
  {
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    CGAffineTransformInvert(&v42, &v41);
    if (v8)
    {
LABEL_22:
      id v12 = (id)objc_msgSend((id)objc_msgSend(v3, "instantAlphaPath"), "copy");
      if (self) {
        [(TSDImageLayout *)self imageDataToVisualSizeTransform];
      }
      else {
        memset(v40, 0, sizeof(v40));
      }
      [v12 transformUsingAffineTransform:v40];
      CGAffineTransform v39 = v42;
      [v12 transformUsingAffineTransform:&v39];
      if (v6) {
        goto LABEL_26;
      }
      goto LABEL_10;
    }
  }
  else
  {
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v42.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v42.c = v11;
    *(_OWORD *)&v42.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    if (v8) {
      goto LABEL_22;
    }
  }
  id v12 = 0;
  if (v6)
  {
LABEL_26:
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
    double v28 = TSDRectWithSize();
    if (v8 && !v9) {
      objc_msgSend(v5, "boundsForPath:", v12, v28);
    }
    double v16 = +[TSDBezierPath bezierPathWithRect:v28];
    goto LABEL_38;
  }
LABEL_10:
  if (v7 && [(TSDImageLayout *)self hasAlpha])
  {
    [v3 naturalSize];
    double v13 = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
  }
  else
  {
    mTracedPath = self->mTracedPath;
    if (!mTracedPath)
    {
      mTracedPath = (TSDBezierPath *)(id)[v3 tracedPath];
      self->mTracedPath = mTracedPath;
    }
    double v13 = (TSDBezierPath *)[(TSDBezierPath *)mTracedPath copy];
  }
  double v15 = v13;
  [(TSDBezierPath *)v13 bounds];
  if (CGRectIsEmpty(v43))
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
    double v16 = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
  }
  else
  {
    objc_msgSend(-[TSDImageLayout imageGeometry](self, "imageGeometry"), "size");
    double v18 = v17;
    double v20 = v19;
    [v3 naturalSize];
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, v18 / v21, v20 / v22);
    CGAffineTransform v38 = v39;
    [(TSDBezierPath *)v15 transformUsingAffineTransform:&v38];
    if (v9)
    {
      id v23 = [(TSDImageLayout *)self maskLayout];
      CGAffineTransform v38 = v42;
      [(TSDBezierPath *)v15 transformUsingAffineTransform:&v38];
      double v24 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", [v23 path]);
      [v23 pathBounds];
      CGAffineTransformMakeTranslation(&v37, -v25, -v26);
      [(TSDBezierPath *)v24 transformUsingAffineTransform:&v37];
      double v27 = [(TSDBezierPath *)v15 intersectBezierPath:v24];
    }
    else
    {
      double v27 = v15;
    }
    double v16 = v27;
    if (v8) {
      double v16 = [(TSDBezierPath *)v27 intersectBezierPath:v12];
    }
    if (v7)
    {
      [(TSDBezierPath *)v16 takeAttributesFromStroke:v5];
      double v29 = [(TSDBezierPath *)v16 uniteWithBezierPath:[(TSDBezierPath *)v16 outlineStroke]];
      if (v29)
      {
        double v30 = v29;
        if ([(TSDBezierPath *)v29 elementCount] > 0) {
          double v16 = v30;
        }
      }
    }
  }

LABEL_38:
  if ([(TSDBezierPath *)v16 elementCount] >= 2)
  {
    [(TSDBezierPath *)v16 bounds];
    double v32 = fmin(v31, 0.0);
    double v34 = fmin(v33, 0.0);
    if (!TSDNearlyEqualPoints(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v32, v34))
    {
      CGAffineTransformMakeTranslation(&v36, -v32, -v34);
      [(TSDBezierPath *)v16 transformUsingAffineTransform:&v36];
    }
  }
  return v16;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)p_createDynamicCopies
{
  if (self->mDynamicInfoGeometry)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageLayout p_createDynamicCopies]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1356, @"expected nil value for '%s'", "mDynamicInfoGeometry");
  }
  self->mDynamicInfoGeometrdouble y = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  self->mDynamicInfoGeometrdouble y = (TSDInfoGeometry *)[a3 copy];
  [(TSDLayout *)self invalidateFrame];

  [(TSDMediaLayout *)self invalidateAlignmentFrame];
}

- (void)p_destroyDynamicCopies
{
  mDynamicInfoGeometrdouble y = self->mDynamicInfoGeometry;
  if (!mDynamicInfoGeometry)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDImageLayout p_destroyDynamicCopies]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageLayout.m"), 1372, @"invalid nil value for '%s'", "mDynamicInfoGeometry");
    mDynamicInfoGeometrdouble y = self->mDynamicInfoGeometry;
  }

  self->mDynamicInfoGeometrdouble y = 0;
  [(TSDLayout *)self invalidateFrame];

  [(TSDMediaLayout *)self invalidateAlignmentFrame];
}

- (int)maskEditMode
{
  return self->mMaskEditMode;
}

- (BOOL)isInMaskScaleMode
{
  return self->mScalingInMaskMode;
}

- (BOOL)isInInstantAlphaMode
{
  return self->mInInstantAlphaMode;
}

@end