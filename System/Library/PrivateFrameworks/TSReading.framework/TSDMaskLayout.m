@interface TSDMaskLayout
- (BOOL)hasSmartPath;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldSnapWhileResizing;
- (CGAffineTransform)affineTransformForTightPathBounds;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGAffineTransform)originalTransformForProvidingGuides;
- (CGPath)p_cachedPath;
- (CGPath)p_cachedPathNoScale;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameForProvidingGuidesInRoot;
- (CGRect)p_cachedTightPathBounds;
- (CGRect)p_cachedTightPathBoundsNoScale;
- (TSDMaskLayout)initWithInfo:(id)a3;
- (double)pathScale;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)infoGeometry;
- (id)maskInfo;
- (id)pathSource;
- (unint64_t)numberOfControlKnobs;
- (void)beginDynamicOperation;
- (void)dealloc;
- (void)dragBy:(CGPoint)a3;
- (void)dynamicMovePathKnobDidBegin;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)endDynamicOperation;
- (void)invalidate;
- (void)invalidatePath;
- (void)maskModeScaleDidBegin;
- (void)maskModeScaleDidEnd;
- (void)p_calculateCachedPathIfNecessary;
- (void)p_calculateTightPathBoundsIfNecessary;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)p_setDynamicInfoGeometry:(id)a3;
- (void)processChangedProperty:(int)a3;
- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setPathScale:(double)a3;
- (void)takeScaledMaskGeometry:(id)a3;
@end

@implementation TSDMaskLayout

- (TSDMaskLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDMaskLayout;
  v3 = [(TSDLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    if ([(TSDMaskLayout *)v3 maskInfo])
    {
      *(unsigned char *)&v4->mMaskInvalidFlags |= 3u;
      v4->mPathScale = 1.0;
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
  CGPathRelease(self->mCachedPath);
  CGPathRelease(self->mCachedPathNoScale);

  self->mPathSourceWithProvidedSize = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  [(TSDLayout *)&v3 dealloc];
}

- (id)dependentLayouts
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  objc_super v3 = [(TSDAbstractLayout *)self parent];

  return (id)[v2 arrayWithObject:v3];
}

- (id)computeLayoutGeometry
{
  id v3 = [(TSDLayout *)self i_layoutGeometryProvider];
  v4 = v3;
  if (v3 && (uint64_t v5 = [v3 layoutGeometryForLayout:self]) != 0)
  {
    objc_super v6 = (void *)v5;
    mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
    if (!mPathSourceWithProvidedSize)
    {
      self->mPathSourceWithProvidedSize = (TSDPathSource *)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "copy");
      *(unsigned char *)&self->mMaskInvalidFlags |= 3u;
      mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
    }
    [(TSDPathSource *)mPathSourceWithProvidedSize naturalSize];
    double v9 = v8;
    double v11 = v10;
    [v6 size];
    if (v9 != v13 || v11 != v12)
    {
      [v6 size];
      -[TSDPathSource setNaturalSize:](self->mPathSourceWithProvidedSize, "setNaturalSize:");
      *(unsigned char *)&self->mMaskInvalidFlags |= 3u;
    }
    [(TSDMaskLayout *)self p_cachedTightPathBoundsNoScale];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = [(TSDLayout *)self computeInfoGeometryFromLayoutGeometry:v6];
  }
  else
  {
    [(TSDMaskLayout *)self p_cachedTightPathBoundsNoScale];
    double v16 = v24;
    double v18 = v25;
    double v20 = v26;
    double v22 = v27;
    id v23 = (id)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  }
  v28 = v23;
  [v23 position];
  double v30 = v29;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  [v28 center];
  if (v28)
  {
    objc_msgSend(v28, "transformBasedOnPoint:centeredAtPoint:", TSDAddPoints(v16, v18, v30));
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
  }
  v31 = [TSDLayoutGeometry alloc];
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  v32 = -[TSDLayoutGeometry initWithSize:transform:](v31, "initWithSize:transform:", v34, v20, v22);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    return (id)[v4 adjustLayoutGeometry:v32 forLayout:self];
  }
  return v32;
}

- (CGAffineTransform)affineTransformForTightPathBounds
{
  [(TSDMaskLayout *)self p_cachedTightPathBounds];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(TSDMaskLayout *)self infoGeometry];
  [v9 position];
  double v11 = v10;
  result = (CGAffineTransform *)[v9 center];
  if (v9)
  {
    double v13 = TSDAddPoints(v6, v8, v11);
    return (CGAffineTransform *)objc_msgSend(v9, "transformBasedOnPoint:centeredAtPoint:", v13);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (void)processChangedProperty:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDMaskLayout;
  -[TSDLayout processChangedProperty:](&v8, sel_processChangedProperty_);
  if (a3 == 526)
  {
    [(TSDMaskLayout *)self invalidatePath];
    [(TSDLayout *)self invalidateFrame];

    self->mPathSourceWithProvidedSize = 0;
    double v5 = [(TSDMaskLayout *)self imageLayout];
  }
  else
  {
    if ((a3 & 0xFFFFFFFE) != 0x200)
    {
      [(TSDMaskLayout *)self imageLayout];
      return;
    }
    objc_opt_class();
    [(TSDAbstractLayout *)self parent];
    [(id)TSUDynamicCast() invalidateExteriorWrap];
    double v5 = [(TSDMaskLayout *)self imageLayout];
    if ([(TSDInfo *)[(TSDLayout *)v5 info] isInlineWithText])
    {
      uint64_t v6 = [(TSDAbstractLayout *)v5 parent];
      if (v6)
      {
        double v7 = (void *)v6;
        while ((objc_opt_respondsToSelector() & 1) == 0)
        {
          double v7 = (void *)[v7 parent];
          if (!v7) {
            goto LABEL_3;
          }
        }
        [v7 wrappableChildInvalidated:v5];
      }
    }
  }
LABEL_3:
  if (objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "repForLayout:", v5), "processChangedProperty:", 529);
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  [(TSDLayout *)&v3 invalidate];
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  [(id)TSUDynamicCast() invalidateFrame];
}

- (void)invalidatePath
{
  *(unsigned char *)&self->mMaskInvalidFlags |= 1u;
  CGPathRelease(self->mCachedPath);
  self->mCachedPath = 0;
  CGPathRelease(self->mCachedPathNoScale);
  self->mCachedPathNoScale = 0;
  *(unsigned char *)&self->mMaskInvalidFlags |= 2u;
  CGPoint v3 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->mCachedTightPathBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->mCachedTightPathBounds.size = v4;
  self->mCachedTightPathBoundsNoScale.origin = v3;
  self->mCachedTightPathBoundsNoScale.size = v4;
  objc_opt_class();
  [(TSDAbstractLayout *)self parent];
  double v5 = (void *)TSUDynamicCast();

  [v5 invalidateExteriorWrap];
}

- (CGRect)alignmentFrame
{
  if ([(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isResizingInMaskEditMode])
  {
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)self geometry] size];
    double v3 = TSDRectWithSize();
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = [(TSDMaskLayout *)self imageLayout];
    if (v10) {
      [(TSDImageLayout *)v10 layoutToMaskTransform];
    }
    else {
      memset(&v30, 0, sizeof(v30));
    }
    v32.origin.double x = v3;
    v32.origin.double y = v5;
    v32.size.CGFloat width = v7;
    v32.size.CGFloat height = v9;
    CGRect v33 = CGRectApplyAffineTransform(v32, &v30);
    double x = v33.origin.x;
    double y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  else
  {
    [(TSDAbstractLayout *)self frameInParent];
    CGFloat width = v11;
    CGFloat height = v13;
    [[(TSDAbstractLayout *)self parent] frame];
    double x = v15;
    double y = v17;
    double v19 = objc_msgSend(-[TSDImageLayout imageInfo](-[TSDMaskLayout imageLayout](self, "imageLayout"), "imageInfo"), "stroke");
    if (v19)
    {
      double v20 = v19;
      if ([v19 shouldRender])
      {
        Mutable = CGPathCreateMutable();
        v31.origin.double x = x;
        v31.origin.double y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGPathAddRect(Mutable, 0, v31);
        TSDPathBoundsIncludingStroke(Mutable, v20);
        double v23 = v22;
        CGPathRelease(Mutable);
        double v24 = TSDSubtractPoints(x, y, v23);
        double x = TSDAddPoints(x, y, v24);
        double y = v25;
      }
    }
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  if ([(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isResizingInMaskEditMode])
  {
    CGFloat v5 = [(TSDMaskLayout *)self imageLayout];
    if (v5)
    {
      double v6 = v5;
      [(TSDImageLayout *)v5 layoutToMaskTransform];
      [(TSDLayout *)v6 originalTransformForProvidingGuides];
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDMaskLayout;
    return (CGAffineTransform *)[(CGAffineTransform *)&v8 originalTransformForProvidingGuides];
  }
}

- (BOOL)shouldSnapWhileResizing
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMaskLayout;
  BOOL v3 = [(TSDAbstractLayout *)&v7 shouldSnapWhileResizing];
  if (v3)
  {
    double v4 = [(TSDAbstractLayout *)self parent];
    if (v4) {
      [(TSDAbstractLayout *)v4 transformInRoot];
    }
    else {
      memset(v6, 0, sizeof(v6));
    }
    LOBYTE(v3) = TSDIsTransformAxisAligned((double *)v6);
  }
  return v3;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  v2 = [(TSDMaskLayout *)self imageLayout];

  [(TSDImageLayout *)v2 alignmentFrameForProvidingGuidesInRoot];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)beginDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  [(TSDLayout *)&v3 beginDynamicOperation];
  [(TSDMaskLayout *)self p_createDynamicCopies];
}

- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4
{
  if ([(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isResizingInMaskEditMode]|| [(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isRotatingInMaskEditMode])
  {
    memset(&v27, 0, sizeof(v27));
    double v6 = objc_msgSend(-[TSDImageLayout imageInfo](-[TSDMaskLayout imageLayout](self, "imageLayout"), "imageInfo"), "geometry");
    if (v6) {
      [v6 transform];
    }
    else {
      memset(&v27, 0, sizeof(v27));
    }
    CGAffineTransform t1 = v27;
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v25, &t1, &t2);
    CGAffineTransform t1 = v27;
    CGAffineTransformInvert(&v23, &t1);
    CGAffineTransformConcat(&t1, &v25, &v23);
    long long v8 = *(_OWORD *)&t1.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&a3->c = v8;
    *(_OWORD *)&a3->tdouble x = *(_OWORD *)&t1.tx;
    memset(&t1, 0, sizeof(t1));
    CGFloat v9 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
    if (v9) {
      [v9 fullTransform];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    long long v10 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v10;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t1, &v22, &t2);
    CGAffineTransform t2 = t1;
    id v11 = +[TSDInfoGeometry geometryFromFullTransform:&t2];
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    id v12 = [(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] originalImageGeometry];
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v27, 0, sizeof(v27));
    }
    memset(&t1, 0, sizeof(t1));
    CGAffineTransform t2 = v27;
    long long v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v20.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v20.c = v13;
    *(_OWORD *)&v20.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v21, &t2, &v20);
    TSDTransformNormalizeScale((uint64_t)&v21, &t1);
    long long v14 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v14;
    long long v16 = *(_OWORD *)&a3->a;
    long long v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransform v20 = v27;
    *(_OWORD *)&v19.a = v16;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t2, &v20, &v19);
    CGAffineTransform v20 = t1;
    CGAffineTransformInvert(&v18, &v20);
    CGAffineTransform v19 = t2;
    CGAffineTransformConcat(&v20, &v19, &v18);
    CGAffineTransform t2 = v20;
    double v17 = (void *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
    CGAffineTransform v20 = t2;
    id v11 = (id)[v17 geometryByAppendingTransform:&v20];
  }
  [(TSDMaskLayout *)self p_setDynamicInfoGeometry:v11];
}

- (void)takeScaledMaskGeometry:(id)a3
{
  if (!self->mScalingInMaskMode)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMaskLayout takeScaledMaskGeometry:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 293, @"wrong mode");
  }

  [(TSDMaskLayout *)self p_setDynamicInfoGeometry:a3];
}

- (void)endDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  [(TSDLayout *)&v3 endDynamicOperation];
  [(TSDMaskLayout *)self p_destroyDynamicCopies];
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  CGRect result = [(TSDMaskLayout *)self imageLayout];
  if (result)
  {
    long long v7 = *(_OWORD *)&a4->c;
    v8[0] = *(_OWORD *)&a4->a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a4->tx;
    return (CGAffineTransform *)[(CGAffineTransform *)result layoutTransformInInfoSpace:v8];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isDraggingInMaskEditMode])
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMaskLayout dragBy:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 319, @"should be called only when dragging in mask mode");
  }
  long long v8 = [(TSDMaskLayout *)self imageLayout];
  id v9 = [(TSDImageLayout *)v8 imageGeometry];
  if (v9) {
    [v9 transform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGAffineTransformInvert(&v18, &v17);
  double v10 = TSDDeltaApplyAffineTransform((float64x2_t *)&v18, x, y);
  id v11 = (void *)[(TSDInfoGeometry *)self->mDynamicInfoGeometry mutableCopy];
  if ([(TSDImageLayout *)v8 maskEditModeForDragging] == 3)
  {
    [v11 position];
    double v14 = TSDSubtractPoints(v12, v13, v10);
LABEL_10:
    objc_msgSend(v11, "setPosition:", v14, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
    goto LABEL_11;
  }
  if ([(TSDImageLayout *)v8 maskEditModeForDragging] == 2)
  {
    [v11 position];
    double v14 = TSDAddPoints(v15, v16, v10);
    goto LABEL_10;
  }
LABEL_11:
  -[TSDMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v11, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
}

- (void)maskModeScaleDidBegin
{
  self->mScalingInMaskMode = 1;
}

- (void)maskModeScaleDidEnd
{
  self->mScalingInMaskMode = 0;
}

- (BOOL)shouldDisplayGuides
{
  if ([(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isResizingInMaskEditMode]|| self->mScalingInMaskMode)
  {
    return 0;
  }
  if ([(TSDImageLayout *)[(TSDMaskLayout *)self imageLayout] isDraggingInMaskEditMode])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDMaskLayout;
  return [(TSDLayout *)&v4 shouldDisplayGuides];
}

- (id)maskInfo
{
  objc_opt_class();
  [(TSDLayout *)self info];

  return (id)TSUDynamicCast();
}

- (id)pathSource
{
  mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
  if (mPathSourceWithProvidedSize) {
    return mPathSourceWithProvidedSize;
  }
  mPathSourceWithProvidedSize = self->mDynamicPathSource;
  if (mPathSourceWithProvidedSize) {
    return mPathSourceWithProvidedSize;
  }
  id v4 = [(TSDMaskLayout *)self maskInfo];

  return (id)[v4 pathSource];
}

- (void)setPathScale:(double)a3
{
  if (self->mPathScale != a3)
  {
    self->mPathScale = a3;
    [(TSDMaskLayout *)self invalidatePath];
    id v4 = [(TSDAbstractLayout *)self geometry];
    [(TSDAbstractLayout *)self setGeometry:v4];
  }
}

- (void)dynamicMovePathKnobDidBegin
{
  self->mDynamicPathSource = (TSDPathSource *)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "copy");
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  mDynamicPathSource = self->mDynamicPathSource;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "knob"), "tag");
  [(TSDMaskLayout *)self pathBounds];
  [(TSDPathSource *)mDynamicPathSource setControlKnobPosition:v8 toPoint:TSDAddPoints(x, y, v9)];
  [(TSDMaskLayout *)self invalidatePath];

  [(TSDLayout *)self invalidateFrame];
}

- (BOOL)hasSmartPath
{
  return TSUClassAndProtocolCast() != 0;
}

- (unint64_t)numberOfControlKnobs
{
  [(TSDMaskLayout *)self pathSource];
  objc_opt_class();
  v2 = (void *)TSUClassAndProtocolCast();

  return [v2 numberOfControlKnobs];
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(TSDMaskLayout *)self pathSource];
  objc_opt_class();
  uint64_t v8 = (void *)TSUClassAndProtocolCast();
  [(TSDMaskLayout *)self pathBounds];
  double v10 = TSDAddPoints(x, y, v9);

  [v8 setControlKnobPosition:a3 toPoint:v10];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  [(TSDMaskLayout *)self pathSource];
  objc_opt_class();
  objc_msgSend((id)TSUClassAndProtocolCast(), "getControlKnobPosition:", a3, &unk_26D78C0F8);
  double v6 = v5;
  double v8 = v7;
  [(TSDMaskLayout *)self pathBounds];

  double v10 = TSDSubtractPoints(v6, v8, v9);
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)infoGeometry
{
  if (self->mDynamicInfoGeometry) {
    return self->mDynamicInfoGeometry;
  }
  objc_super v3 = [(TSDLayout *)self info];

  return (id)[(TSDInfo *)v3 geometry];
}

- (void)p_calculateCachedPathIfNecessary
{
  if (*(unsigned char *)&self->mMaskInvalidFlags)
  {
    [(TSDMaskLayout *)self pathScale];
    CGFloat v4 = v3;
    [(TSDMaskLayout *)self pathScale];
    CGAffineTransformMakeScale(&v6, v4, v5);
    self->mCachedPathNoScale = CGPathCreateMutableCopy((CGPathRef)objc_msgSend((id)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "bezierPath"), "CGPath"));
    self->mCachedPath = (CGPath *)MEMORY[0x223CB7D50]();
    *(unsigned char *)&self->mMaskInvalidFlags &= ~1u;
  }
}

- (CGPath)p_cachedPath
{
  return self->mCachedPath;
}

- (CGPath)p_cachedPathNoScale
{
  return self->mCachedPathNoScale;
}

- (void)p_calculateTightPathBoundsIfNecessary
{
  if ((*(unsigned char *)&self->mMaskInvalidFlags & 2) != 0)
  {
    self->mCachedTightPathBounds = CGPathGetPathBoundingBox([(TSDMaskLayout *)self p_cachedPath]);
    self->mCachedTightPathBoundsNoScale = CGPathGetPathBoundingBox([(TSDMaskLayout *)self p_cachedPathNoScale]);
    *(unsigned char *)&self->mMaskInvalidFlags &= ~2u;
  }
}

- (CGRect)p_cachedTightPathBounds
{
  [(TSDMaskLayout *)self p_calculateTightPathBoundsIfNecessary];
  double x = self->mCachedTightPathBounds.origin.x;
  double y = self->mCachedTightPathBounds.origin.y;
  double width = self->mCachedTightPathBounds.size.width;
  double height = self->mCachedTightPathBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)p_cachedTightPathBoundsNoScale
{
  [(TSDMaskLayout *)self p_calculateTightPathBoundsIfNecessary];
  double x = self->mCachedTightPathBoundsNoScale.origin.x;
  double y = self->mCachedTightPathBoundsNoScale.origin.y;
  double width = self->mCachedTightPathBoundsNoScale.size.width;
  double height = self->mCachedTightPathBoundsNoScale.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)p_createDynamicCopies
{
  if (self->mDynamicInfoGeometry)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMaskLayout p_createDynamicCopies]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 502, @"expected nil value for '%s'", "mDynamicInfoGeometry");
  }
  if (self->mDynamicPathSource)
  {
    CGFloat v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMaskLayout p_createDynamicCopies]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 503, @"expected nil value for '%s'", "mDynamicPathSource");
  }
  id v7 = [(TSDMaskLayout *)self maskInfo];
  self->mDynamicInfoGeometrdouble y = (TSDInfoGeometry *)objc_msgSend((id)objc_msgSend(v7, "geometry"), "copy");
  self->mDynamicPathSource = (TSDPathSource *)objc_msgSend((id)objc_msgSend(v7, "pathSource"), "copy");
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  self->mDynamicInfoGeometrdouble y = (TSDInfoGeometry *)a3;
  CGFloat v5 = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDMaskLayout maskInfo](self, "maskInfo"), "pathSource"), "copy");
  self->mDynamicPathSource = v5;
  [(TSDInfoGeometry *)self->mDynamicInfoGeometry size];
  -[TSDPathSource scaleToNaturalSize:](v5, "scaleToNaturalSize:");
  [(TSDLayout *)self invalidateFrame];

  [(TSDMaskLayout *)self invalidatePath];
}

- (void)p_destroyDynamicCopies
{
  if (!self->mDynamicInfoGeometry)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMaskLayout p_destroyDynamicCopies]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 527, @"invalid nil value for '%s'", "mDynamicInfoGeometry");
  }
  if (!self->mDynamicPathSource)
  {
    CGFloat v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMaskLayout p_destroyDynamicCopies]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 528, @"invalid nil value for '%s'", "mDynamicPathSource");
  }

  self->mDynamicInfoGeometrdouble y = 0;
  self->mDynamicPathSource = 0;
  [(TSDLayout *)self invalidateFrame];

  [(TSDMaskLayout *)self invalidatePath];
}

- (double)pathScale
{
  return self->mPathScale;
}

@end