@interface CRLMediaLayout
- (BOOL)isStrokeBeingManipulated;
- (BOOL)supportsRotation;
- (CGRect)alignmentFrame;
- (CGRect)alignmentFrameInRoot;
- (CGRect)boundsForStandardKnobs;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CRLMediaLayout)initWithInfo:(id)a3;
- (_TtC8Freeform12CRLMediaItem)mediaItem;
- (id)commandToResetMediaToRawPixelSize;
- (id)commandToResetToSize:(CGSize)a3;
- (id)stroke;
- (void)dynamicStrokeWidthChangeDidBegin;
- (void)dynamicStrokeWidthChangeDidEnd;
- (void)dynamicStrokeWidthUpdateToValue:(double)a3;
- (void)invalidateAlignmentFrame;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setBoundsForStandardKnobs:(CGRect)a3;
- (void)setGeometry:(id)a3;
@end

@implementation CRLMediaLayout

- (BOOL)supportsRotation
{
  return 0;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLMediaLayout;
  -[CRLCanvasLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 15)
  {
    [(CRLCanvasLayout *)self invalidateFrame];
    [(CRLMediaLayout *)self invalidateAlignmentFrame];
  }
}

- (CRLMediaLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLMediaLayout;
  result = [(CRLCanvasLayout *)&v4 initWithInfo:a3];
  if (result) {
    BYTE3(result->_cachedAlignmentFrame.size.width) |= 1u;
  }
  return result;
}

- (_TtC8Freeform12CRLMediaItem)mediaItem
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLCanvasLayout *)self info];
  objc_super v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLMediaItem *)v5;
}

- (BOOL)isStrokeBeingManipulated
{
  return *(void *)((char *)&self->_cachedAlignmentFrame.size.height + 3) != 0;
}

- (id)stroke
{
  v2 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_super v4 = [(CRLMediaLayout *)self mediaItem];
    id v3 = [v4 stroke];
  }

  return v3;
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  id v6 = [(CRLMediaLayout *)self mediaItem];
  id v3 = [v6 stroke];
  id v4 = [v3 mutableCopy];
  objc_super v5 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  *(void *)((char *)&self->_cachedAlignmentFrame.size.height + 3) = v4;
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  [*(id *)((char *)&self->_cachedAlignmentFrame.size.height + 3) setWidth:a3];
  [(CRLMediaLayout *)self processChangedProperty:15];
  id v4 = [(CRLCanvasLayout *)self layoutController];
  objc_super v5 = [v4 canvas];
  id v7 = [v5 canvasController];

  id v6 = [v7 repForLayout:self];
  [v6 processChangedProperty:15];
}

- (void)dynamicStrokeWidthChangeDidEnd
{
  v2 = *(void **)((char *)&self->_cachedAlignmentFrame.size.height + 3);
  *(CGFloat *)((char *)&self->_cachedAlignmentFrame.size.height + 3) = 0.0;
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  if ((BYTE3(self->_cachedAlignmentFrame.size.width) & 1) == 0)
  {
    objc_super v5 = [(CRLCanvasAbstractLayout *)self geometry];
    id v6 = v5;
    if (v5 && ([v5 differsInMoreThanTranslationFrom:v4] & 1) == 0)
    {
      if (v4)
      {
        [v4 transform];
        double v8 = *((double *)&v16 + 1);
        double v7 = *(double *)&v16;
        double v10 = *((double *)&v17 + 1);
        double v9 = *(double *)&v17;
        double v11 = *((double *)&v18 + 1);
        double v12 = *(double *)&v18;
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
        double v11 = 0.0;
        double v10 = 0.0;
        double v8 = 0.0;
        double v12 = 0.0;
        double v9 = 0.0;
        double v7 = 0.0;
      }
      [v6 transform];
      if ((BYTE3(self->_cachedAlignmentFrame.size.width) & 1) == 0)
      {
        double v13 = sub_100064680(v12 + CGPointZero.y * v9 + v7 * CGPointZero.x, v11 + CGPointZero.y * v10 + v8 * CGPointZero.x, vaddq_f64((float64x2_t)v15[3], vmlaq_n_f64(vmulq_n_f64((float64x2_t)v15[2], CGPointZero.y), (float64x2_t)v15[1], CGPointZero.x)).f64[0]);
        *(double *)((char *)&self->super.mDynamicOpacity + 3) = sub_100064698(*(double *)((char *)&self->super.mDynamicOpacity + 3), *(double *)(&self->super._suppressesShadowsAndReflections+ 3), v13);
        *(void *)(&self->super._suppressesShadowsAndReflections + 3) = v14;
      }
    }
    else
    {
      [(CRLMediaLayout *)self invalidateAlignmentFrame];
    }
  }
  v15[0].receiver = self;
  v15[0].super_class = (Class)CRLMediaLayout;
  [(objc_super *)v15 setGeometry:v4];
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E78F8);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    v22 = "-[CRLMediaLayout computeAlignmentFrameInRoot:]";
    __int16 v23 = 2082;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaLayout.m";
    __int16 v25 = 1024;
    int v26 = 118;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E7918);
  }
  double v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    double v9 = v8;
    double v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaLayout computeAlignmentFrameInRoot:]");
  double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaLayout.m"];
  double v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 118, 0, "Abstract method not overridden by %{public}@", v14);

  v15 = (objc_class *)objc_opt_class();
  long long v16 = NSStringFromClass(v15);
  long long v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLMediaLayout computeAlignmentFrameInRoot:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (CGRect)alignmentFrame
{
  if (BYTE3(self->_cachedAlignmentFrame.size.width))
  {
    unsigned int v3 = (CRLMediaLayout *)((char *)&self->super.mDynamicOpacity + 3);
    [(CRLMediaLayout *)self computeAlignmentFrameInRoot:0];
    v3->super.super.super.super.super.isa = v4;
    v3->super.super.super.super._parent = v5;
    v3->super.super.super.super._children = v6;
    v3->super.super.super.super._geometry = v7;
    BYTE3(self->_cachedAlignmentFrame.size.width) &= ~1u;
  }
  double v8 = *(double *)((char *)&self->super.mDynamicOpacity + 3);
  double v9 = *(double *)(&self->super._suppressesShadowsAndReflections + 3);
  double v10 = *(double *)((char *)&self->_cachedAlignmentFrame.origin.x + 3);
  double v11 = *(double *)((char *)&self->_cachedAlignmentFrame.origin.y + 3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  uint64_t v3 = [(CRLCanvasAbstractLayout *)self parent];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  objc_super v5 = [(CRLCanvasAbstractLayout *)self parent];
  id v6 = [(CRLCanvasLayout *)self layoutController];
  double v7 = [v6 rootLayout];

  if (v5 == v7) {
LABEL_4:
  }
    [(CRLMediaLayout *)self alignmentFrame];
  else {
    [(CRLMediaLayout *)self computeAlignmentFrameInRoot:1];
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)invalidateAlignmentFrame
{
  BYTE3(self->_cachedAlignmentFrame.size.width) |= 1u;
  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
}

- (id)commandToResetToSize:(CGSize)a3
{
  id v4 = [(CRLBoardItemLayout *)self boardItem];
  objc_super v5 = [v4 geometry];
  id v6 = [v5 geometryWithNewBounds:sub_100064070()];

  double v7 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
  double v8 = [(CRLBoardItemLayout *)self boardItem];
  double v9 = [(CRLCommandSetInfoGeometry *)v7 initWithBoardItem:v8 geometry:v6];

  return v9;
}

- (id)commandToResetMediaToRawPixelSize
{
  uint64_t v3 = [(CRLMediaLayout *)self mediaItem];
  [v3 mediaRawPixelSize];
  double v5 = v4;
  double v7 = v6;

  if (v5 == CGSizeZero.width && v7 == CGSizeZero.height)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = -[CRLMediaLayout commandToResetToSize:](self, "commandToResetToSize:", v5, v7);
  }

  return v9;
}

- (CGRect)boundsForStandardKnobs
{
  double v2 = *(double *)((char *)&self->_mediaInvalidFlags + 3);
  double v3 = *(double *)((char *)&self->_dynamicStroke + 3);
  double v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 3);
  double v5 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundsForStandardKnobs:(CGRect)a3
{
  *(CGFloat *)((char *)&self->_mediaInvalidFlags + 3) = a3.origin.x;
  *(CRLMutableStroke **)((char *)&self->_dynamicStroke + 3) = *(CRLMutableStroke **)&a3.origin.y;
  *(CGFloat *)((char *)&self->_boundsForStandardKnobs.origin.x + 3) = a3.size.width;
  *(CGFloat *)((char *)&self->_boundsForStandardKnobs.origin.y + 3) = a3.size.height;
}

- (void).cxx_destruct
{
}

@end