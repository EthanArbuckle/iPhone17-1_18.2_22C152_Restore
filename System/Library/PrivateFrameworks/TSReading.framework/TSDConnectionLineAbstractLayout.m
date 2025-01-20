@interface TSDConnectionLineAbstractLayout
- (BOOL)canBeIntersected;
- (BOOL)canEndpointsCoincide;
- (BOOL)canFlip;
- (BOOL)canResetTextAndObjectHandles;
- (BOOL)isInvisible;
- (BOOL)isStraightLine;
- (BOOL)pathIsLineSegment;
- (BOOL)pathIsOpen;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldValidate;
- (BOOL)supportsFlipping;
- (BOOL)supportsResize;
- (BOOL)supportsRotation;
- (BOOL)useDynamicOutsets;
- (BOOL)validLine;
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)i_accumulatedDrag;
- (CGPoint)unclippedHeadPoint;
- (CGPoint)unclippedTailPoint;
- (CGRect)boundsForStandardKnobs;
- (TSDConnectionLinePathSource)connectedPathSource;
- (TSDLayout)connectedFrom;
- (TSDLayout)connectedTo;
- (double)dynamicOutsetFrom;
- (double)dynamicOutsetTo;
- (double)outsetFrom;
- (double)outsetTo;
- (id)additionalLayoutsForRepCreation;
- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3];
- (id)layoutInfoGeometry;
- (id)p_infoForConnectingToInfo:(id)a3;
- (id)path;
- (id)pathSource;
- (id)reliedOnLayouts;
- (int)wrapType;
- (void)beginDynamicOperation;
- (void)checkConnections;
- (void)connectedLayoutInvalidated:(id)a3;
- (void)dealloc;
- (void)endDynamicOperation;
- (void)invalidateConnections;
- (void)invalidatePath;
- (void)invalidatePosition;
- (void)parentDidChange;
- (void)pauseDynamicTransformation;
- (void)processChangedProperty:(int)a3;
- (void)removeConnections;
- (void)setConnectedFrom:(id)a3;
- (void)setConnectedTo:(id)a3;
- (void)setDynamicOutsetFrom:(double)a3;
- (void)setDynamicOutsetTo:(double)a3;
- (void)setUseDynamicOutsets:(BOOL)a3;
- (void)updateConnectedPath;
- (void)updateRepPath;
- (void)validate;
@end

@implementation TSDConnectionLineAbstractLayout

- (void)dealloc
{
  if (self->mConnectedFrom)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 53, @"expected nil value for '%s'", "mConnectedFrom");
  }
  if (self->mConnectedTo)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout dealloc]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 54, @"expected nil value for '%s'", "mConnectedTo");
  }

  v7.receiver = self;
  v7.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDShapeLayout *)&v7 dealloc];
}

- (double)outsetFrom
{
  if (self->mUseDynamicOutsets) {
    return self->mDynamicOutsetFrom;
  }
  v3 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");

  [v3 outsetFrom];
  return result;
}

- (double)outsetTo
{
  if (self->mUseDynamicOutsets) {
    return self->mDynamicOutsetTo;
  }
  v3 = objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");

  [v3 outsetTo];
  return result;
}

- (void)setConnectedFrom:(id)a3
{
  if (a3 == self)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout setConnectedFrom:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 85, @"trying to connect a c-line to itself");
  }
  self->mConnectedFrom = (TSDLayout *)a3;
}

- (void)setConnectedTo:(id)a3
{
  if (a3 == self)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout setConnectedTo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 91, @"trying to connect a c-line to itself");
  }
  self->mConnectedTo = (TSDLayout *)a3;
}

- (BOOL)shouldValidate
{
  return self->mValidConnections;
}

- (id)reliedOnLayouts
{
  [(TSDConnectionLineAbstractLayout *)self checkConnections];
  v3 = (void *)[MEMORY[0x263EFF9C0] set];
  uint64_t v4 = v3;
  if (self->mConnectedFrom) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->mConnectedTo) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)additionalLayoutsForRepCreation
{
  id v2 = [(TSDConnectionLineAbstractLayout *)self reliedOnLayouts];

  return (id)[v2 allObjects];
}

- (BOOL)supportsResize
{
  return 0;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsFlipping
{
  return ![(TSDConnectionLineAbstractLayout *)self connectedFrom]
      && [(TSDConnectionLineAbstractLayout *)self connectedTo] == 0;
}

- (void)updateRepPath
{
  id v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self);

  [v2 processChangedProperty:526];
}

- (void)parentDidChange
{
  if (![(TSDAbstractLayout *)self parent]) {
    [(TSDConnectionLineAbstractLayout *)self removeConnections];
  }
  [(TSDConnectionLineAbstractLayout *)self invalidatePath];
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDDrawableLayout *)&v3 parentDidChange];
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((a3 - 539) > 1)
  {
    if (a3 == 526)
    {
      uint64_t v5 = objc_opt_class();
      if (v5 != [(TSDInfo *)[(TSDLayout *)self info] layoutClass]) {
        objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateLayoutForRecreation:", self);
      }
    }
  }
  else
  {
    [(TSDConnectionLineAbstractLayout *)self invalidateConnections];
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDShapeLayout *)&v6 processChangedProperty:v3];
}

- (void)connectedLayoutInvalidated:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([(TSDLayout *)self layoutState] != 2
    || ![(TSDLayout *)self isBeingTransformed])
  {
    if (a3)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id obj = +[TSDLayoutController allInteractiveLayoutControllers];
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v22;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v22 != v7) {
              objc_enumerationMutation(obj);
            }
            v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            v10 = objc_msgSend(v9, "layoutsForInfo:", -[TSDLayout info](self, "info"));
            uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v18;
              do
              {
                uint64_t v14 = 0;
                do
                {
                  if (*(void *)v18 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  v15 = *(TSDConnectionLineAbstractLayout **)(*((void *)&v17 + 1) + 8 * v14);
                  if (v15 != self)
                  {
                    if ([(TSDConnectionLineAbstractLayout *)v15 isMemberOfClass:objc_opt_class()])[(TSDConnectionLineAbstractLayout *)v15 invalidateConnections]; {
                  }
                    }
                  ++v14;
                }
                while (v12 != v14);
                uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
              }
              while (v12);
            }
            ++v8;
          }
          while (v8 != v6);
          uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v6);
      }
    }
    [(TSDConnectionLineAbstractLayout *)self invalidatePath];
    [(TSDShapeLayout *)self invalidateFrame];
    *(_WORD *)&self->super.mShapeInvalidFlags |= 0x20u;
    [(TSDDrawableLayout *)self invalidate];
    [(TSDConnectionLineAbstractLayout *)self updateRepPath];
    [(TSDDrawableLayout *)self i_invalidateWrap];
  }
}

- (void)removeConnections
{
  self->mValidConnections = 0;
  mConnectedFrom = self->mConnectedFrom;
  if (mConnectedFrom) {
    [(TSDLayout *)mConnectedFrom removeConnectedLayout:self];
  }
  mConnectedTo = self->mConnectedTo;
  if (mConnectedTo) {
    [(TSDLayout *)mConnectedTo removeConnectedLayout:self];
  }
  self->mConnectedFrom = 0;
  self->mConnectedTo = 0;
}

- (void)invalidateConnections
{
  self->mValidConnections = 0;
  [(TSDConnectionLineAbstractLayout *)self invalidatePath];
  [(TSDShapeLayout *)self invalidateFrame];

  [(TSDDrawableLayout *)self invalidate];
}

- (void)validate
{
  if ([(TSDLayout *)self invalidGeometry]) {
    [(TSDConnectionLineAbstractLayout *)self invalidatePath];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDLayout *)&v3 validate];
}

- (void)checkConnections
{
  if (!self->mValidConnections)
  {
    id v3 = [(TSDLayout *)self layoutController];
    id v4 = [(TSDConnectionLineAbstractLayout *)self connectionLineInfo];
    id v5 = -[TSDConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", [v4 connectedFrom]);
    id v6 = -[TSDConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", [v4 connectedTo]);
    uint64_t v7 = [(TSDAbstractLayout *)self parent];
    uint64_t v8 = (TSDLayout *)[v3 layoutForInfo:v5 childOfLayout:v7];
    v9 = (TSDLayout *)[v3 layoutForInfo:v6 childOfLayout:v7];
    mConnectedFrom = self->mConnectedFrom;
    if (v8 != mConnectedFrom)
    {
      if (mConnectedFrom) {
        [(TSDLayout *)mConnectedFrom removeConnectedLayout:self];
      }
      self->mConnectedFrom = v8;
      if (v8) {
        [(TSDLayout *)v8 addConnectedLayout:self];
      }
    }
    mConnectedTo = self->mConnectedTo;
    if (v9 != mConnectedTo)
    {
      if (mConnectedTo) {
        [(TSDLayout *)mConnectedTo removeConnectedLayout:self];
      }
      self->mConnectedTo = v9;
      if (v9) {
        [(TSDLayout *)v9 addConnectedLayout:self];
      }
    }
    if ((v5 == 0) != (v8 != 0) && (v6 == 0) != (v9 != 0))
    {
      self->mValidConnections = 1;
      [(TSDConnectionLineAbstractLayout *)self updateRepPath];
      [(TSDDrawableLayout *)self invalidateExteriorWrap];
    }
  }
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  return 0;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  v60[2] = *MEMORY[0x263EF8340];
  [a3 length];
  double v14 = v13;
  v15 = (TSDBezierPath *)objc_msgSend(a4, "i_externalWrapPath");
  if (!v15) {
    return 0;
  }
  v16 = v15;
  if ([(TSDBezierPath *)v15 isEmpty]) {
    return 0;
  }
  v56 = a7;
  if (a5 <= 0.0)
  {
    long long v19 = v16;
  }
  else
  {
    if (self->mCachedFromWrapPath == v16 && self->mCachedFromOutset == a5)
    {
      uint64_t v21 = 696;
    }
    else
    {
      if (self->mCachedToWrapPath != v16 || self->mCachedToOutset != a5)
      {
        -[TSDBezierPath setLineWidth:](v16, "setLineWidth:", a5 + a5, a7);
        [(TSDBezierPath *)v16 setLineJoinStyle:1];
        [(TSDBezierPath *)v16 setLineCapStyle:1];
        v60[0] = v16;
        v60[1] = [(TSDBezierPath *)v16 outlineStroke];
        long long v19 = +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2]);
        if (self->mConnectedFrom == a4)
        {

          self->mCachedFromOutsetWrapPath = v19;
          self->mCachedFromWrapPath = v16;
          uint64_t v20 = 680;
        }
        else
        {

          self->mCachedToOutsetWrapPath = v19;
          self->mCachedToWrapPath = v16;
          uint64_t v20 = 688;
        }
        *(double *)((char *)&self->super.super.super.super.super.super.isa + v20) = a5;
        goto LABEL_18;
      }
      uint64_t v21 = 704;
    }
    long long v19 = *(TSDBezierPath **)((char *)&self->super.super.super.super.super.super.isa + v21);
  }
LABEL_18:
  id v22 = (id)[(TSDBezierPath *)v19 copy];
  long long v23 = (void *)[a4 geometry];
  if (v23) {
    [v23 transform];
  }
  else {
    memset(v59, 0, sizeof(v59));
  }
  [v22 transformUsingAffineTransform:v59];
  long long v24 = (void *)[MEMORY[0x263EFF980] array];
  [v11 addIntersectionsWithPath:v22 to:v24 allIntersections:1 reversed:0];
  if (![v24 count]) {
    goto LABEL_49;
  }
  [v24 sortUsingSelector:sel_compareSegmentAndT_];
  uint64_t v25 = [v24 count];
  if (v25 < 0)
  {
    v54 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v55 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:]"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 344, @"Out-of-bounds type assignment was clamped to max");
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8) {
    uint64_t v26 = v25 - 1;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = -1;
  if (!v8) {
    uint64_t v27 = 1;
  }
  uint64_t v58 = v27;
  if (v26 >= v25 || v26 < 0)
  {
LABEL_49:
    v47 = v57;
    unsigned char *v57 = 1;
    goto LABEL_50;
  }
  double v28 = 1.0 / v14;
  double v29 = 1.0 - 1.0 / v14;
  while (1)
  {
    long long v17 = (TSDPathIntersection *)[v24 objectAtIndex:v26];
    v26 += v58;
    BOOL v30 = v26 >= v25 || v26 < 0;
    BOOL v31 = !v30;
    if (v31)
    {
      id v32 = v11;
      id v33 = v22;
      BOOL v34 = v8;
      v35 = (void *)[v24 objectAtIndex:v26];
      uint64_t v36 = [v35 segment];
      v37 = v35;
      BOOL v8 = v34;
      id v22 = v33;
      id v11 = v32;
      [v37 t];
      double v39 = v38;
    }
    else if (v8)
    {
      uint64_t v36 = 0;
      double v39 = 0.0;
    }
    else
    {
      uint64_t v36 = [v11 elementCount] - 1;
      double v39 = 1.0;
    }
    double v40 = (double)([(TSDPathIntersection *)v17 segment] + v36) * 0.5;
    double v41 = ceil(v40);
    double v42 = floor(v40);
    if (v8) {
      double v42 = v41;
    }
    uint64_t v43 = (uint64_t)v42;
    [(TSDPathIntersection *)v17 t];
    [v11 pointAt:v43 fromElement:(v39 + v44) * 0.5];
    if ((objc_msgSend(v22, "containsPoint:") & 1) == 0)
    {
      [(TSDPathIntersection *)v17 t];
      if (v45 > v28)
      {
        [(TSDPathIntersection *)v17 t];
        if (v46 < v29) {
          break;
        }
      }
    }
    if (!v31) {
      goto LABEL_49;
    }
  }
  v47 = v57;
  unsigned char *v57 = 1;
  if (!v17)
  {
LABEL_50:
    if (v8)
    {
      objc_msgSend(v11, "pointAt:fromElement:", objc_msgSend(v11, "elementCount") - 1, 0.99);
      if (objc_msgSend(v22, "containsPoint:"))
      {
        v48 = [TSDPathIntersection alloc];
        double v49 = *MEMORY[0x263F00148];
        double v50 = *(double *)(MEMORY[0x263F00148] + 8);
        double v51 = 0.0;
        uint64_t v52 = 0;
LABEL_55:
        long long v17 = -[TSDPathIntersection initWithSegment:atT:atPoint:](v48, "initWithSegment:atT:atPoint:", v52, v51, v49, v50);
        unsigned char *v47 = 0;
        return v17;
      }
    }
    else
    {
      [v11 pointAt:1 fromElement:0.01];
      if (objc_msgSend(v22, "containsPoint:"))
      {
        v53 = [TSDPathIntersection alloc];
        uint64_t v52 = [v11 elementCount] - 1;
        double v49 = *MEMORY[0x263F00148];
        double v50 = *(double *)(MEMORY[0x263F00148] + 8);
        double v51 = 1.0;
        v48 = v53;
        goto LABEL_55;
      }
    }
    return 0;
  }
  return v17;
}

- (void)updateConnectedPath
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  [(TSDConnectionLineAbstractLayout *)self checkConnections];
  mConnectedFrom = self->mConnectedFrom;
  if (mConnectedFrom
    && (id v4 = [(TSDAbstractLayout *)mConnectedFrom parent], v4 == [(TSDAbstractLayout *)self parent]))
  {
    id v5 = self->mConnectedFrom;
  }
  else
  {
    id v5 = 0;
  }
  mConnectedTo = self->mConnectedTo;
  if (mConnectedTo
    && (double v7 = [(TSDAbstractLayout *)mConnectedTo parent], v7 == [(TSDAbstractLayout *)self parent]))
  {
    BOOL v8 = self->mConnectedTo;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_opt_class();
  if (!self->super.mResizePathSource) {
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  }
  id v9 = (id)TSUDynamicCast();
  mResizeInfoGeometrdouble y = self->super.mResizeInfoGeometry;
  if (!mResizeInfoGeometry) {
    mResizeInfoGeometrdouble y = (TSDInfoGeometry *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  }
  id v11 = (double *)MEMORY[0x263F00148];
  long long v58 = *MEMORY[0x263F00148];
  long long v57 = v58;
  objc_msgSend((id)objc_msgSend(v9, "bezierPath"), "getStartPoint:andEndPoint:", &v58, &v57);
  if (![(TSDConnectionLineAbstractLayout *)self canEndpointsCoincide]
    && TSDNearlyEqualPoints(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v58, *((double *)&v58 + 1)))
  {
    id v9 = +[TSDConnectionLinePathSource pathSourceOfLength:100.0];
    objc_msgSend((id)objc_msgSend(v9, "bezierPath"), "getStartPoint:andEndPoint:", &v58, &v57);
    uint64_t v12 = [TSDInfoGeometry alloc];
    [(TSDInfoGeometry *)mResizeInfoGeometry position];
    mResizeInfoGeometrdouble y = -[TSDInfoGeometry initWithPosition:size:](v12, "initWithPosition:size:");
    if (TSDNearlyEqualPoints(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v58, *((double *)&v58 + 1)))
    {
      double v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSDConnectionLineAbstractLayout updateConnectedPath]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 435, @"head and tail should no longer be equal");
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  if (mResizeInfoGeometry)
  {
    [(TSDInfoGeometry *)mResizeInfoGeometry transform];
    double v15 = *((double *)&v54 + 1);
    double v16 = *(double *)&v54;
    double v17 = *((double *)&v55 + 1);
    double v18 = *(double *)&v55;
    double v19 = *((double *)&v56 + 1);
    double v20 = *(double *)&v56;
  }
  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
  }
  double v21 = v20 + *((double *)&v58 + 1) * v18 + v16 * *(double *)&v58;
  double v22 = v19 + *((double *)&v58 + 1) * v17 + v15 * *(double *)&v58;
  *(double *)&long long v58 = v21;
  *((double *)&v58 + 1) = v22;
  double v23 = v20 + v18 * *((double *)&v57 + 1) + v16 * *(double *)&v57;
  double v24 = v19 + v17 * *((double *)&v57 + 1) + v15 * *(double *)&v57;
  *(double *)&long long v57 = v23;
  *((double *)&v57 + 1) = v24;
  double x = v21;
  double y = v22;
  if (v5)
  {
    [(TSDLayout *)v5 centerForConnecting];
    double x = v27;
    double y = v28;
  }
  if (v8)
  {
    [(TSDLayout *)v8 centerForConnecting];
    double v30 = v29;
    double v32 = v31;
  }
  else
  {
    double v32 = *((double *)&v57 + 1);
    double v30 = *(double *)&v57;
  }
  if (self->mUseResizePoints[0])
  {
    double x = self->mResizeControlPoints[0].x;
    double y = self->mResizeControlPoints[0].y;
  }
  if (self->mUseResizePoints[2])
  {
    double v30 = self->mResizeControlPoints[2].x;
    double v32 = self->mResizeControlPoints[2].y;
  }
  if (![(TSDConnectionLineAbstractLayout *)self canEndpointsCoincide]
    && TSDNearlyEqualPoints(x, y, v30, v32)
    || (TSDPointHasNaNComponents() & 1) != 0
    || TSDPointHasNaNComponents())
  {
    self->mValidLine = 0;
    self->mVisibleLine = 0;

    self->mConnectedInfoGeometrdouble y = mResizeInfoGeometry;
    self->mConnectedPathSource = (TSDConnectionLinePathSource *)[v9 copy];

    id v33 = (TSDBezierPath *)+[TSDBezierPath bezierPath];
    self->mClippedBezierPath = v33;
    double v34 = *v11;
    double v35 = v11[1];
    -[TSDBezierPath moveToPoint:](v33, "moveToPoint:", *v11, v35);
    -[TSDBezierPath lineToPoint:](self->mClippedBezierPath, "lineToPoint:", v34, v35);
  }
  else
  {
    self->mValidLine = 1;
    double v59 = x;
    double v60 = y;
    if (self->mUseResizePoints[1])
    {
      CGPoint v61 = self->mResizeControlPoints[1];
    }
    else
    {
      -[TSDConnectionLineAbstractLayout controlPointForPointA:pointB:andOriginalA:originalB:](self, "controlPointForPointA:pointB:andOriginalA:originalB:", x, y, v30, v32, v21, v22, v23, v24);
      v61.double x = v36;
      v61.double y = v37;
    }
    double v62 = v30;
    double v63 = v32;
    id v38 = [(TSDConnectionLineAbstractLayout *)self createConnectedPathFrom:v5 to:v8 withControlPoints:&v59];
    [v38 bounds];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    self->mConnectedInfoGeometrdouble y = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v40, v42, v44, v46);
    id v47 = +[TSDBezierPath bezierPath];
    objc_msgSend(v47, "moveToPoint:", v59, v60);
    [v47 lineToPoint:v61];
    objc_msgSend(v47, "lineToPoint:", v62, v63);
    mConnectedInfoGeometrdouble y = self->mConnectedInfoGeometry;
    if (mConnectedInfoGeometry) {
      [(TSDInfoGeometry *)mConnectedInfoGeometry transform];
    }
    else {
      memset(&v52, 0, sizeof(v52));
    }
    CGAffineTransformInvert(&v53, &v52);
    [v47 transformUsingAffineTransform:&v53];

    self->mConnectedPathSource = [[TSDConnectionLinePathSource alloc] initWithBezierPath:v47];
    -[TSDConnectionLinePathSource setType:](self->mConnectedPathSource, "setType:", [v9 type]);
    [v9 outsetFrom];
    -[TSDConnectionLinePathSource setOutsetFrom:](self->mConnectedPathSource, "setOutsetFrom:");
    [v9 outsetTo];
    -[TSDConnectionLinePathSource setOutsetTo:](self->mConnectedPathSource, "setOutsetTo:");
    double v49 = self->mConnectedInfoGeometry;
    if (v49) {
      [(TSDInfoGeometry *)v49 transform];
    }
    else {
      memset(&v50, 0, sizeof(v50));
    }
    CGAffineTransformInvert(&v51, &v50);
    [v38 transformUsingAffineTransform:&v51];

    self->mClippedBezierPath = (TSDBezierPath *)v38;
  }
}

- (BOOL)isInvisible
{
  return !self->mValidConnections || !self->mVisibleLine;
}

- (BOOL)canEndpointsCoincide
{
  return 0;
}

- (BOOL)canFlip
{
  return !self->mConnectedFrom && self->mConnectedTo == 0;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (int)wrapType
{
  if ([(TSDConnectionLineAbstractLayout *)self isInvisible]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineAbstractLayout;
  return [(TSDDrawableLayout *)&v4 wrapType];
}

- (TSDConnectionLinePathSource)connectedPathSource
{
  CGPoint result = self->mConnectedPathSource;
  if (!result || !self->mValidConnections)
  {
    [(TSDConnectionLineAbstractLayout *)self updateConnectedPath];
    return self->mConnectedPathSource;
  }
  return result;
}

- (id)pathSource
{
  [(TSDConnectionLineAbstractLayout *)self checkConnections];
  id v3 = [(TSDConnectionLineAbstractLayout *)self connectedPathSource];

  return v3;
}

- (id)layoutInfoGeometry
{
  mConnectedInfoGeometrdouble y = self->mConnectedInfoGeometry;
  if (!mConnectedInfoGeometry || !self->mValidConnections)
  {
    [(TSDConnectionLineAbstractLayout *)self updateConnectedPath];
    mConnectedInfoGeometrdouble y = self->mConnectedInfoGeometry;
  }
  objc_super v4 = mConnectedInfoGeometry;

  return v4;
}

- (CGRect)boundsForStandardKnobs
{
  objc_msgSend(-[TSDConnectionLineAbstractLayout path](self, "path"), "bounds");
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(TSDShapeLayout *)self pathBounds];
  double v12 = -v11;
  double v14 = -v13;
  uint64_t v15 = v4;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;

  return CGRectOffset(*(CGRect *)&v15, v12, v14);
}

- (void)invalidatePosition
{
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDLayout *)&v3 invalidatePosition];

  self->mConnectedInfoGeometrdouble y = 0;
}

- (void)invalidatePath
{
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDShapeLayout *)&v3 invalidatePath];
  [(TSDDrawableLayout *)self invalidate];
  [(TSDConnectionLineAbstractLayout *)self invalidatePosition];

  self->mConnectedPathSource = 0;
  self->mClippedBezierPath = 0;
}

- (BOOL)pathIsLineSegment
{
  return 1;
}

- (BOOL)pathIsOpen
{
  return 1;
}

- (id)path
{
  id result = self->mClippedBezierPath;
  if (!result || !self->mValidConnections)
  {
    [(TSDConnectionLineAbstractLayout *)self updateConnectedPath];
    return self->mClippedBezierPath;
  }
  return result;
}

- (CGPoint)unclippedHeadPoint
{
  [(TSDConnectionLineAbstractLayout *)self checkConnections];
  if (self->mConnectedTo)
  {
    double v7 = 0.0;
    double v8 = 0.0;
    objc_msgSend(-[TSDConnectionLinePathSource bezierPath](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0), "bezierPath"), "getStartPoint:andEndPoint:", &v5, &v7);
    double v3 = v7;
    double v4 = v8;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDConnectionLineAbstractLayout;
    [(TSDShapeLayout *)&v6 unclippedHeadPoint];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)unclippedTailPoint
{
  [(TSDConnectionLineAbstractLayout *)self checkConnections];
  if (self->mConnectedFrom)
  {
    double v7 = 0.0;
    double v8 = 0.0;
    objc_msgSend(-[TSDConnectionLinePathSource bezierPath](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0), "bezierPath"), "getStartPoint:andEndPoint:", &v7, &v5);
    double v3 = v7;
    double v4 = v8;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDConnectionLineAbstractLayout;
    [(TSDShapeLayout *)&v6 unclippedTailPoint];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)shouldDisplayGuides
{
  return !self->mConnectedFrom && self->mConnectedTo == 0;
}

- (void)beginDynamicOperation
{
  v13.receiver = self;
  v13.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDShapeLayout *)&v13 beginDynamicOperation];
  self->mOriginalPathSource = (TSDConnectionLinePathSource *)objc_msgSend(-[TSDConnectionLineAbstractLayout pathSource](self, "pathSource"), "copy");

  self->super.mResizePathSource = 0;
  self->super.mResizePathSource = (TSDPathSource *)objc_msgSend(-[TSDConnectionLineAbstractLayout pathSource](self, "pathSource"), "copy");

  self->super.mInitialInfoGeometrdouble y = (TSDInfoGeometry *)[(TSDConnectionLineAbstractLayout *)self layoutInfoGeometry];
  self->mOldConnectedFrom = self->mConnectedFrom;
  self->mOldConnectedTo = self->mConnectedTo;
  self->mAcumulatedDrag = (CGPoint)*MEMORY[0x263F00148];
  p_mLooseEndPosition = &self->mLooseEndPosition;
  if (self->mConnectedTo) {
    [(TSDConnectionLineAbstractLayout *)self unclippedTailPoint];
  }
  else {
    [(TSDConnectionLineAbstractLayout *)self unclippedHeadPoint];
  }
  p_mLooseEndPosition->double x = v4;
  self->mLooseEndPosition.double y = v5;
  id v6 = [(TSDLayout *)self pureGeometry];
  if (v6)
  {
    [v6 transform];
    float64x2_t v7 = v10;
    float64x2_t v8 = v11;
    float64x2_t v9 = v12;
  }
  else
  {
    float64x2_t v9 = 0uLL;
    float64x2_t v7 = 0uLL;
    float64x2_t v8 = 0uLL;
  }
  *(float64x2_t *)p_mLooseEndPosition = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, self->mLooseEndPosition.y), v7, p_mLooseEndPosition->x));
  *(_WORD *)self->mUseResizePoints = 0;
  self->mUseResizePoints[2] = 0;
}

- (void)endDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDShapeLayout *)&v3 endDynamicOperation];

  self->mOriginalPathSource = 0;
  self->mOldConnectedFrom = 0;

  self->mOldConnectedTo = 0;
  *(_WORD *)self->mUseResizePoints = 0;
  self->mUseResizePoints[2] = 0;
}

- (CGPoint)i_accumulatedDrag
{
  double x = self->mAcumulatedDrag.x;
  double y = self->mAcumulatedDrag.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)pauseDynamicTransformation
{
  v22.receiver = self;
  v22.super_class = (Class)TSDConnectionLineAbstractLayout;
  [(TSDLayout *)&v22 pauseDynamicTransformation];
  if ([(TSDLayout *)self layoutState] == 2)
  {
    if (self->mConnectedTo) {
      [(TSDConnectionLineAbstractLayout *)self unclippedTailPoint];
    }
    else {
      [(TSDConnectionLineAbstractLayout *)self unclippedHeadPoint];
    }
    double v16 = v3;
    id v6 = [(TSDLayout *)self pureGeometry];
    if (v6)
    {
      [v6 transform];
      float64x2_t v7 = v19;
      float64x2_t v8 = v20;
      float64x2_t v9 = v21;
    }
    else
    {
      float64x2_t v9 = 0uLL;
      float64x2_t v20 = 0u;
      float64x2_t v21 = 0u;
      float64x2_t v19 = 0u;
      float64x2_t v7 = 0uLL;
      float64x2_t v8 = 0uLL;
    }
    float64x2_t v10 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, v15), v7, v16));
    double v11 = TSDSubtractPoints(v10.f64[0], v10.f64[1], self->mLooseEndPosition.x);
    self->mAcumulatedDrag.double x = v11;
    self->mAcumulatedDrag.double y = v12;
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, v11, v12);
    mInitialInfoGeometrdouble y = self->super.mInitialInfoGeometry;
    CGAffineTransform v17 = v18;
    id v14 = [(TSDInfoGeometry *)mInitialInfoGeometry geometryByAppendingTransform:&v17];

    self->super.mResizeInfoGeometrdouble y = (TSDInfoGeometry *)v14;
  }
}

- (BOOL)isStraightLine
{
  objc_opt_class();
  [(TSDConnectionLineAbstractLayout *)self pathSource];
  double v3 = (void *)TSUDynamicCast();
  [v3 getControlKnobPosition:10];
  double v5 = v4;
  double v7 = v6;
  [v3 getControlKnobPosition:12];
  double v9 = v8;
  double v11 = v10;
  [v3 getControlKnobPosition:11];
  double v13 = v12;
  double v15 = v14;
  BOOL v16 = TSDNearlyCollinearPoints(v5, v7, v9, v11, v12, v14);
  if (v16)
  {
    double v17 = TSDMultiplyPointScalar(v5, v7, 0.25);
    double v18 = TSDSubtractPoints(v9, v11, v17);
    double v20 = v19;
    double v21 = TSDMultiplyPointScalar(v13, v15, 0.25);
    double v22 = TSDSubtractPoints(v18, v20, v21);
    double v24 = TSDMultiplyPointScalar(v22, v23, 2.0);
    double v26 = v25;
    double v27 = TSDSubtractPoints(v5, v7, v24);
    double v29 = v28;
    double v30 = TSDSubtractPoints(v24, v26, v13);
    LOBYTE(v16) = TSDDotPoints(v27, v29, v30, v31) > 0.0;
  }
  return v16;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v4 = [(TSDConnectionLineAbstractLayout *)self connectedPathSource];

  [(TSDConnectionLinePathSource *)v4 getControlKnobPosition:a3];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (id)p_infoForConnectingToInfo:(id)a3
{
  objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "delegate");
  double v4 = (void *)TSUProtocolCast();
  if (!v4) {
    return a3;
  }

  return (id)[v4 infoToConnectToForConnectionLineConnectedToInfo:a3];
}

- (TSDLayout)connectedFrom
{
  return self->mConnectedFrom;
}

- (TSDLayout)connectedTo
{
  return self->mConnectedTo;
}

- (BOOL)validLine
{
  return self->mValidLine;
}

- (BOOL)useDynamicOutsets
{
  return self->mUseDynamicOutsets;
}

- (void)setUseDynamicOutsets:(BOOL)a3
{
  self->mUseDynamicOutsets = a3;
}

- (double)dynamicOutsetFrom
{
  return self->mDynamicOutsetFrom;
}

- (void)setDynamicOutsetFrom:(double)a3
{
  self->mDynamicOutsetFrom = a3;
}

- (double)dynamicOutsetTo
{
  return self->mDynamicOutsetTo;
}

- (void)setDynamicOutsetTo:(double)a3
{
  self->mDynamicOutsetTo = a3;
}

@end