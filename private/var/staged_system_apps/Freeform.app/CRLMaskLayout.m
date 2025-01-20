@interface CRLMaskLayout
- (BOOL)hasSmartPath;
- (BOOL)shouldBeIncludedInParentFrameForCulling;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)wantsParentResizeTransform;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGAffineTransform)originalTransformForProvidingGuides;
- (CGPath)p_cachedPath;
- (CGPath)p_cachedPathNoScale;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameForProvidingGuidesInRoot;
- (CGRect)p_cachedTightPathBounds;
- (CGRect)p_cachedTightPathBoundsNoScale;
- (CGRect)pathBounds;
- (CRLMaskLayout)initWithInfo:(id)a3;
- (double)pathScale;
- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)infoGeometry;
- (id)maskInfo;
- (id)pathSource;
- (unint64_t)numberOfControlKnobs;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
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
- (void)processChangedProperty:(unint64_t)a3;
- (void)resetDynamicGeometryToModel;
- (void)resizeWithTransform:(CGAffineTransform *)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setPathScale:(double)a3;
- (void)takeScaledMaskGeometry:(id)a3;
@end

@implementation CRLMaskLayout

- (CRLMaskLayout)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMaskLayout;
  v3 = [(CRLCanvasLayout *)&v7 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CRLMaskLayout *)v3 maskInfo];

    if (v5)
    {
      BYTE2(v4->super.mInfoGeometryBeforeDynamicOperation) |= 3u;
      *(CGFloat *)((char *)&v4->mCachedTightPathBoundsNoScale.size.height + 2) = 1.0;
      *(double *)((char *)&v4->mPathScale + 2) = 1.0;
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
  CGPathRelease(*(CGPathRef *)((char *)&self->mMaskInvalidFlags + 2));
  CGPathRelease(*(CGPathRef *)((char *)&self->mCachedPath + 2));
  v3.receiver = self;
  v3.super_class = (Class)CRLMaskLayout;
  [(CRLMaskLayout *)&v3 dealloc];
}

- (id)dependentLayouts
{
  v2 = [(CRLCanvasAbstractLayout *)self parent];
  objc_super v3 = +[NSArray arrayWithObject:v2];

  return v3;
}

- (id)computeLayoutGeometry
{
  [(CRLMaskLayout *)self p_cachedTightPathBoundsNoScale];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CRLMaskLayout *)self infoGeometry];
  [v11 position];
  double v13 = v12;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  [v11 center];
  if (v11)
  {
    [v11 transformBasedOnPoint:sub_100064698(v4, v6, v13) centeredAtPoint:];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
  }
  v14 = [CRLCanvasLayoutGeometry alloc];
  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  v15 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v14, "initWithSize:transform:", v22, v8, v10);
  [(CRLMaskLayout *)self pathScale];
  CGFloat v17 = v16;
  [(CRLMaskLayout *)self pathScale];
  CGAffineTransformMakeScale(&v21, v17, v18);
  v19 = [(CRLCanvasLayoutGeometry *)v15 geometryByTransformingBy:&v21];

  return v19;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasLayout *)self originalGeometry];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CRLCanvasAbstractLayout *)self geometry];
  }
  double v8 = v7;

  double v9 = [(CRLCanvasLayout *)self infoGeometryBeforeDynamicOperation];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    double v12 = [(CRLCanvasLayout *)self info];
    id v11 = [v12 geometry];
  }
  double v13 = [(CRLCanvasLayout *)self originalGeometry];
  if (v13)
  {
    double v14 = *(double *)((char *)&self->mPathScale + 2);
  }
  else
  {
    [(CRLMaskLayout *)self pathScale];
    double v14 = v15;
  }

  CGAffineTransformMakeScale(&v27, 1.0 / v14, 1.0 / v14);
  uint64_t v16 = [v8 geometryByTransformingBy:&v27];
  CGFloat v17 = (void *)v16;
  memset(&v26, 0, sizeof(v26));
  if (v11)
  {
    [v11 fullTransform];
    if (v17)
    {
LABEL_12:
      [v17 fullTransform];
      goto LABEL_15;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v16) {
      goto LABEL_12;
    }
  }
  memset(&v23, 0, sizeof(v23));
LABEL_15:
  CGAffineTransformInvert(&t2, &v23);
  CGAffineTransformConcat(&v26, &t1, &t2);
  memset(&v22, 0, sizeof(v22));
  if (v4) {
    [v4 fullTransform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransform v20 = v26;
  CGAffineTransformConcat(&v22, &v20, &v21);
  CGAffineTransform v20 = v22;
  CGFloat v18 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v20];

  return v18;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CRLMaskLayout;
  -[CRLCanvasLayout processChangedProperty:](&v12, "processChangedProperty:");
  if (a3 == 19)
  {
    [(CRLMaskLayout *)self invalidatePath];
    [(CRLCanvasLayout *)self invalidateFrame];
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
  {
    return;
  }
  double v5 = [(CRLMaskLayout *)self imageLayout];
  double v6 = [(CRLCanvasLayout *)self layoutController];
  id v7 = [v6 canvas];

  double v8 = [v7 canvasController];

  if (v8)
  {
    double v9 = [(CRLCanvasLayout *)self layoutController];
    double v10 = [v9 canvas];
    id v11 = [v10 repForLayout:v5];

    [v11 processChangedProperty:36];
  }
}

- (void)invalidate
{
  v6.receiver = self;
  v6.super_class = (Class)CRLMaskLayout;
  [(CRLCanvasLayout *)&v6 invalidate];
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  double v5 = sub_1002469D0(v3, v4);
  [v5 invalidateFrame];
}

- (void)invalidatePath
{
  BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) |= 1u;
  CGPathRelease(*(CGPathRef *)((char *)&self->mMaskInvalidFlags + 2));
  *(void *)((char *)&self->mMaskInvalidFlags + 2) = 0;
  CGPathRelease(*(CGPathRef *)((char *)&self->mCachedPath + 2));
  *(CGPath **)((char *)&self->mCachedPath + 2) = 0;
  BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) |= 2u;
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  *(CGPoint *)((char *)&self->mCachedPathNoScale + 2) = CGRectZero.origin;
  *(CGSize *)((char *)&self->mCachedTightPathBounds.origin.y + 2) = size;
  *(CGPoint *)((char *)&self->mCachedTightPathBounds.size.height + 2) = origin;
  *(CGSize *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2) = size;
}

- (CGRect)alignmentFrame
{
  uint64_t v3 = [(CRLMaskLayout *)self imageLayout];
  unsigned int v4 = [v3 isResizingInMaskEditMode];

  if (v4)
  {
    double v5 = [(CRLCanvasAbstractLayout *)self geometry];
    [v5 size];
    double v6 = sub_100064070();
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = [(CRLMaskLayout *)self imageLayout];
    double v14 = v13;
    if (v13) {
      [v13 layoutToMaskTransform];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }
    v35.origin.double x = v6;
    v35.origin.double y = v8;
    v35.size.double width = v10;
    v35.size.double height = v12;
    CGRect v36 = CGRectApplyAffineTransform(v35, &v34);
    double x = v36.origin.x;
    double y = v36.origin.y;
    double width = v36.size.width;
    double height = v36.size.height;
  }
  else
  {
    [(CRLCanvasAbstractLayout *)self frameInParent];
    double width = v15;
    double height = v17;
    v19 = [(CRLCanvasAbstractLayout *)self parent];
    [v19 frame];
    double x = v20;
    double y = v22;

    long long v24 = [(CRLMaskLayout *)self imageLayout];
    long long v25 = [v24 imageInfo];
    double v14 = [v25 stroke];

    if (v14 && [v14 shouldRender])
    {
      CGAffineTransform v26 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", x, y, width, height);
      [v26 boundsIncludingCRLStroke:v14];
      double v28 = sub_100064680(x, y, v27);
      double x = sub_100064698(x, y, v28);
      double y = v29;
    }
  }

  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  double v5 = [(CRLMaskLayout *)self imageLayout];
  unsigned int v6 = [v5 isResizingInMaskEditMode];

  if (v6)
  {
    double v7 = [(CRLMaskLayout *)self imageLayout];
    CGFloat v8 = v7;
    if (v7)
    {
      [v7 layoutToMaskTransform];
      [v8 originalTransformForProvidingGuides];
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLMaskLayout;
    return (CGAffineTransform *)[(CGAffineTransform *)&v10 originalTransformForProvidingGuides];
  }
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  v8.receiver = self;
  v8.super_class = (Class)CRLMaskLayout;
  if (![(CRLCanvasAbstractLayout *)&v8 shouldSnapWhileResizing]) {
    return 0;
  }
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self parent];
  unsigned int v4 = v3;
  if (v3) {
    [v3 transformInRoot];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  BOOL v5 = sub_10007F964((double *)v7);

  return v5;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  v2 = [(CRLMaskLayout *)self imageLayout];
  [v2 alignmentFrameForProvidingGuidesInRoot];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLMaskLayout;
  [(CRLCanvasLayout *)&v4 beginDynamicOperationWithRealTimeCommands:a3];
  [(CRLMaskLayout *)self p_createDynamicCopies];
}

- (void)resizeWithTransform:(CGAffineTransform *)a3
{
  double v5 = [(CRLMaskLayout *)self imageLayout];
  if ([v5 isResizingInMaskEditMode])
  {

LABEL_4:
    memset(&v35, 0, sizeof(v35));
    double v8 = [(CRLMaskLayout *)self imageLayout];
    double v9 = [v8 originalImageGeometry];
    double v10 = v9;
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }

    CGAffineTransform t1 = v35;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v33, &t1, &t2);
    CGAffineTransform t1 = v35;
    CGAffineTransformInvert(&v31, &t1);
    CGAffineTransformConcat(&t1, &v33, &v31);
    long long v12 = *(_OWORD *)&t1.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&a3->c = v12;
    *(_OWORD *)&a3->tdouble x = *(_OWORD *)&t1.tx;
    double v13 = [(CRLCanvasLayout *)self originalGeometry];
    long long v14 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
    double v15 = [v13 geometryByTransformingBy:&t1];

    uint64_t v16 = [(CRLMaskLayout *)self computeInfoGeometryFromPureLayoutGeometry:v15];
    [(CRLMaskLayout *)self p_setDynamicInfoGeometry:v16];

    return;
  }
  double v6 = [(CRLMaskLayout *)self imageLayout];
  unsigned int v7 = [v6 isRotatingInMaskEditMode];

  if (v7) {
    goto LABEL_4;
  }
  memset(&v35, 0, sizeof(v35));
  double v17 = [(CRLMaskLayout *)self imageLayout];
  CGFloat v18 = [v17 originalImageGeometry];
  v19 = v18;
  if (v18) {
    [v18 transform];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }

  memset(&t1, 0, sizeof(t1));
  CGAffineTransform t2 = v35;
  long long v20 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v29.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v29.c = v20;
  *(_OWORD *)&v29.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v30, &t2, &v29);
  sub_10007F840((uint64_t)&v30, &t1);
  long long v21 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v21;
  long long v23 = *(_OWORD *)&a3->a;
  long long v22 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransform v29 = v35;
  *(_OWORD *)&v28.a = v23;
  *(_OWORD *)&v28.c = v22;
  *(_OWORD *)&v28.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&t2, &v29, &v28);
  CGAffineTransform v29 = t1;
  CGAffineTransformInvert(&v27, &v29);
  CGAffineTransform v28 = t2;
  CGAffineTransformConcat(&v29, &v28, &v27);
  CGAffineTransform t2 = v29;
  long long v24 = [(CRLCanvasLayout *)self originalGeometry];
  CGAffineTransform v29 = t2;
  long long v25 = [v24 geometryByTransformingBy:&v29];

  CGAffineTransform v26 = [(CRLMaskLayout *)self computeInfoGeometryFromPureLayoutGeometry:v25];
  [(CRLMaskLayout *)self p_setDynamicInfoGeometry:v26];
}

- (BOOL)wantsParentResizeTransform
{
  return 1;
}

- (void)takeScaledMaskGeometry:(id)a3
{
  id v4 = a3;
  if (!BYTE2(self->mDynamicPathSource))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9D50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098114();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9D70);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout takeScaledMaskGeometry:]");
    unsigned int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:242 isFatal:0 description:"wrong mode"];
  }
  [(CRLMaskLayout *)self p_setDynamicInfoGeometry:v4];
}

- (void)endDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMaskLayout;
  [(CRLCanvasLayout *)&v3 endDynamicOperation];
  [(CRLMaskLayout *)self p_destroyDynamicCopies];
}

- (void)resetDynamicGeometryToModel
{
  if (!*(void *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9D90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109819C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9DB0);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout resetDynamicGeometryToModel]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:254 isFatal:0 description:"Should only be called when we have a dynamic info geometry to reset!"];
  }
  double v6 = [(CRLMaskLayout *)self maskInfo];
  unsigned int v7 = [v6 geometry];
  [(CRLMaskLayout *)self p_setDynamicInfoGeometry:v7];
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  double v6 = [(CRLMaskLayout *)self imageLayout];
  unsigned int v7 = v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a4->c;
    v10[0] = *(_OWORD *)&a4->a;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a4->tx;
    [v6 layoutTransformInInfoSpace:v10];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  return 0;
}

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLMaskLayout *)self imageLayout];
  unsigned __int8 v7 = [v6 isDraggingInMaskEditMode];

  if ((v7 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9DD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098224();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9DF0);
    }
    long long v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout dragBy:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:273 isFatal:0 description:"should be called only when dragging in mask mode"];
  }
  long long v11 = [(CRLMaskLayout *)self imageLayout];
  long long v12 = [v11 imageGeometry];
  double v13 = v12;
  if (v12) {
    [v12 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformInvert(&v22, &v21);
  double v14 = sub_1000664E0((float64x2_t *)&v22, x, y);

  id v15 = [*(id *)((char *)&self->mOriginalPathScale + 2) mutableCopy];
  if ([v11 maskEditModeForDragging] == (id)3)
  {
    [v15 position];
    double v18 = sub_100064680(v16, v17, v14);
LABEL_18:
    [v15 setPosition:v18 *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx];
    goto LABEL_19;
  }
  if ([v11 maskEditModeForDragging] == (id)2)
  {
    [v15 position];
    double v18 = sub_100064698(v19, v20, v14);
    goto LABEL_18;
  }
LABEL_19:
  -[CRLMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v15, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
}

- (void)maskModeScaleDidBegin
{
  BYTE2(self->mDynamicPathSource) = 1;
}

- (void)maskModeScaleDidEnd
{
  BYTE2(self->mDynamicPathSource) = 0;
}

- (BOOL)shouldDisplayGuides
{
  objc_super v3 = [(CRLMaskLayout *)self imageLayout];
  if ([v3 isResizingInMaskEditMode])
  {

    return 0;
  }
  int v4 = BYTE2(self->mDynamicPathSource);

  if (v4) {
    return 0;
  }
  double v6 = [(CRLMaskLayout *)self imageLayout];
  int v7 = [v6 isDraggingInMaskEditMode];

  if (v7) {
    return 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLMaskLayout;
  return [(CRLCanvasLayout *)&v8 shouldDisplayGuides];
}

- (id)maskInfo
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(CRLCanvasLayout *)self info];
  double v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (CGRect)pathBounds
{
  [(CRLMaskLayout *)self p_cachedTightPathBounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)pathSource
{
  double v2 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    double v4 = [(CRLMaskLayout *)self maskInfo];
    id v3 = [v4 pathSource];
  }

  return v3;
}

- (void)setPathScale:(double)a3
{
  if (*(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2) != a3)
  {
    *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2) = a3;
    [(CRLMaskLayout *)self invalidatePath];
    id v4 = [(CRLCanvasAbstractLayout *)self geometry];
    [(CRLCanvasAbstractLayout *)self setGeometry:v4];
  }
}

- (void)dynamicMovePathKnobDidBegin
{
  id v5 = [(CRLMaskLayout *)self pathSource];
  id v3 = (CRLCanvasInfoGeometry *)[v5 copy];
  id v4 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v3;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CRLMaskLayout *)self pathScale];
  double v9 = sub_1000646A4(x, y, 1.0 / v8);
  double v11 = v10;
  id v12 = *(id *)((char *)&self->mDynamicInfoGeometry + 2);
  double v13 = [v7 knob];

  id v14 = [v13 tag];
  [(CRLMaskLayout *)self pathBounds];
  [v12 setControlKnobPosition:v14 toPoint:sub_100064698(v9, v11, v15)];

  [(CRLMaskLayout *)self invalidatePath];

  [(CRLCanvasLayout *)self invalidateFrame];
}

- (BOOL)hasSmartPath
{
  double v2 = [(CRLMaskLayout *)self pathSource];
  uint64_t v3 = objc_opt_class();
  double v9 = sub_100246DEC(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  return v9 != 0;
}

- (unint64_t)numberOfControlKnobs
{
  double v2 = [(CRLMaskLayout *)self pathSource];
  uint64_t v3 = objc_opt_class();
  double v9 = sub_100246DEC(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  id v10 = [v9 numberOfControlKnobs];
  return (unint64_t)v10;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [(CRLMaskLayout *)self pathSource];
  uint64_t v9 = objc_opt_class();
  sub_100246DEC(v8, v9, 1, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  [(CRLMaskLayout *)self pathBounds];
  [v16 setControlKnobPosition:a3 toPoint:sub_100064698(x, y, v15)];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  uint64_t v5 = [(CRLMaskLayout *)self pathSource];
  uint64_t v6 = objc_opt_class();
  uint64_t v12 = sub_100246DEC(v5, v6, 1, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

  [v12 getControlKnobPosition:a3];
  double v14 = v13;
  double v16 = v15;
  [(CRLMaskLayout *)self pathScale];
  double v18 = sub_1000646A4(v14, v16, v17);
  double v20 = v19;
  [(CRLMaskLayout *)self pathBounds];
  double v22 = sub_100064680(v18, v20, v21);
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (id)infoGeometry
{
  double v2 = *(void **)((char *)&self->mOriginalPathScale + 2);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [(CRLCanvasLayout *)self info];
    id v3 = [v4 geometry];
  }

  return v3;
}

- (void)p_calculateCachedPathIfNecessary
{
  if (BYTE2(self->super.mInfoGeometryBeforeDynamicOperation))
  {
    [(CRLMaskLayout *)self pathScale];
    CGFloat v4 = v3;
    [(CRLMaskLayout *)self pathScale];
    CGAffineTransformMakeScale(&v8, v4, v5);
    uint64_t v6 = [(CRLMaskLayout *)self pathSource];
    id v7 = [v6 bezierPath];
    *(CGPath **)((char *)&self->mCachedPath + 2) = CGPathCreateCopy((CGPathRef)[v7 CGPath]);

    *(void *)((char *)&self->mMaskInvalidFlags + 2) = CGPathCreateCopyByTransformingPath(*(CGPathRef *)((char *)&self->mCachedPath + 2), &v8);
    BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) &= ~1u;
  }
}

- (CGPath)p_cachedPath
{
  return *(CGPath **)((char *)&self->mMaskInvalidFlags + 2);
}

- (CGPath)p_cachedPathNoScale
{
  return *(CGPath **)((char *)&self->mCachedPath + 2);
}

- (void)p_calculateTightPathBoundsIfNecessary
{
  if ((BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) & 2) != 0)
  {
    double v3 = (CGFloat *)((char *)&self->mCachedPathNoScale + 2);
    PathBoundingBodouble x = CGPathGetPathBoundingBox([(CRLMaskLayout *)self p_cachedPath]);
    CGFloat *v3 = PathBoundingBox.origin.x;
    v3[1] = PathBoundingBox.origin.y;
    v3[2] = PathBoundingBox.size.width;
    v3[3] = PathBoundingBox.size.height;
    CGRect v5 = CGPathGetPathBoundingBox([(CRLMaskLayout *)self p_cachedPathNoScale]);
    *(CGFloat *)((char *)&self->mCachedTightPathBounds.size.height + 2) = v5.origin.x;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.origin.x + 2) = v5.origin.y;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2) = v5.size.width;
    *(CGFloat *)((char *)&self->mCachedTightPathBoundsNoScale.size.width + 2) = v5.size.height;
    BYTE2(self->super.mInfoGeometryBeforeDynamicOperation) &= ~2u;
  }
}

- (CGRect)p_cachedTightPathBounds
{
  [(CRLMaskLayout *)self p_calculateTightPathBoundsIfNecessary];
  double v3 = *(double *)((char *)&self->mCachedPathNoScale + 2);
  double v4 = *(double *)((char *)&self->mCachedTightPathBounds.origin.x + 2);
  double v5 = *(double *)((char *)&self->mCachedTightPathBounds.origin.y + 2);
  double v6 = *(double *)((char *)&self->mCachedTightPathBounds.size.width + 2);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_cachedTightPathBoundsNoScale
{
  [(CRLMaskLayout *)self p_calculateTightPathBoundsIfNecessary];
  double v3 = *(double *)((char *)&self->mCachedTightPathBounds.size.height + 2);
  double v4 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.origin.x + 2);
  double v5 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.origin.y + 2);
  double v6 = *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.width + 2);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)p_createDynamicCopies
{
  if (*(void *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9E10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098340();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9E30);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_createDynamicCopies]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 433, 0, "expected nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  if (*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9E50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010982AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9E70);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_createDynamicCopies]");
    CGAffineTransform v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 434, 0, "expected nil value for '%{public}s'", "mDynamicPathSource");
  }
  [(CRLMaskLayout *)self pathScale];
  *(void *)((char *)&self->mPathScale + 2) = v9;
  uint64_t v10 = [(CRLMaskLayout *)self maskInfo];
  uint64_t v11 = [(CRLCanvasAbstractLayout *)self geometry];
  uint64_t v12 = [(CRLMaskLayout *)self computeInfoGeometryFromPureLayoutGeometry:v11];
  double v13 = *(void **)((char *)&self->mOriginalPathScale + 2);
  *(void *)((char *)&self->mOriginalPathScale + 2) = v12;

  [(CRLMaskLayout *)self setPathScale:1.0];
  [(CRLMaskLayout *)self invalidatePath];
  double v14 = [v10 pathSource];
  double v15 = (CRLCanvasInfoGeometry *)[v14 copy];
  double v16 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v15;

  double v17 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  [*(id *)((char *)&self->mOriginalPathScale + 2) size];
  [v17 scaleToNaturalSize:];
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  id v14 = a3;
  double v5 = (id *)((char *)&self->mOriginalPathScale + 2);
  objc_storeStrong((id *)((char *)&self->mOriginalPathScale + 2), a3);
  double v6 = [(CRLMaskLayout *)self maskInfo];
  id v7 = [v6 pathSource];
  CGAffineTransform v8 = (CRLCanvasInfoGeometry *)[v7 copy];
  uint64_t v9 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = v8;

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = sub_1002469D0(v10, *(void **)((char *)&self->mDynamicInfoGeometry + 2));
  uint64_t v12 = v11;
  if (v11 && ([v11 shouldShowKnob] & 1) == 0)
  {
    [*v5 size];
    [*(id *)((char *)&self->mDynamicInfoGeometry + 2) setNaturalSize:];
  }
  else
  {
    double v13 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
    [*v5 size];
    [v13 scaleToNaturalSize];
  }
  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLMaskLayout *)self invalidatePath];
}

- (void)p_destroyDynamicCopies
{
  if (!*(void *)((char *)&self->mOriginalPathScale + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9E90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098468();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9EB0);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_destroyDynamicCopies]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 466, 0, "invalid nil value for '%{public}s'", "mDynamicInfoGeometry");
  }
  if (!*(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9ED0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010983D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9EF0);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskLayout p_destroyDynamicCopies]");
    CGAffineTransform v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 467, 0, "invalid nil value for '%{public}s'", "mDynamicPathSource");
  }
  uint64_t v9 = *(void **)((char *)&self->mOriginalPathScale + 2);
  *(double *)((char *)&self->mOriginalPathScale + 2) = 0.0;

  uint64_t v10 = *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->mDynamicInfoGeometry + 2) = 0;

  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLMaskLayout *)self invalidatePath];
}

- (double)pathScale
{
  return *(double *)((char *)&self->mCachedTightPathBoundsNoScale.size.height + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->mDynamicInfoGeometry + 2), 0);

  objc_storeStrong((id *)((char *)&self->mOriginalPathScale + 2), 0);
}

@end