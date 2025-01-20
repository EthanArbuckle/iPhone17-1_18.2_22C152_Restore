@interface CRLMovieLayout
- (BOOL)supportsRotation;
- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3;
- (CRLMovieLayout)initWithInfo:(id)a3;
- (_TtC8Freeform12CRLMovieItem)movieInfo;
- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4;
- (id)computeLayoutGeometry;
- (id)layoutGeometryFromInfo;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)dragBy:(CGPoint)a3;
- (void)endDynamicOperation;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
@end

@implementation CRLMovieLayout

- (CRLMovieLayout)initWithInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLMovieLayout;
  v3 = [(CRLMediaLayout *)&v6 initWithInfo:a3];
  v4 = v3;
  if (v3) {
    [(CRLCanvasLayout *)v3 invalidateFrame];
  }
  return v4;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (id)layoutGeometryFromInfo
{
  if (*(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3))
  {
    v2 = [[CRLCanvasLayoutGeometry alloc] initWithInfoGeometry:*(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3)];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLMovieLayout;
    v2 = [(CRLBoardItemLayout *)&v4 layoutGeometryFromInfo];
  }

  return v2;
}

- (_TtC8Freeform12CRLMovieItem)movieInfo
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLMovieItem *)v5;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLMovieLayout;
  -[CRLBoardItemLayout dragBy:](&v13, "dragBy:");
  objc_super v6 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6630);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010926B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6650);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout dragBy:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 65, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    objc_super v6 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  uint64_t v10 = [v6 geometryByAppendingTransform:&v12];
  v11 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v10;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLMovieLayout;
  [(CRLBoardItemLayout *)&v14 takeRotationFromTracker:v4];
  v5 = [(CRLCanvasLayout *)self info];
  objc_super v6 = [v5 geometry];

  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    id v7 = [v6 copy];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    if (v4) {
      [v4 rotateTransform];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v10];
    v9[0] = v11;
    v9[1] = v12;
    v9[2] = v13;
    id v7 = [v6 geometryByAppendingTransform:v9];
  }
  v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;

  [(CRLCanvasLayout *)self invalidatePosition];
}

- (void)takeSizeFromTracker:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLMovieLayout;
  id v4 = a3;
  [(CRLBoardItemLayout *)&v8 takeSizeFromTracker:v4];
  v5 = [v4 currentGeometryForLayout:self];

  id v6 = [v5 copy];
  id v7 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v6;

  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLMovieLayout;
  [(CRLBoardItemLayout *)&v14 takeFreeTransformFromTracker:v4];
  v5 = [(CRLCanvasLayout *)self info];
  id v6 = [v5 geometry];

  if ([(CRLCanvasLayout *)self isInRealTimeDynamicOperation])
  {
    id v7 = [v6 copy];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    if (v4) {
      [v4 freeTransformForLayout:self];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v10];
    v9[0] = v11;
    v9[1] = v12;
    v9[2] = v13;
    id v7 = [v6 geometryByAppendingTransform:v9];
  }
  objc_super v8 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v7;

  if ([v4 isResizing])
  {
    [(CRLCanvasLayout *)self invalidateFrame];
    [(CRLBoardItemLayout *)self invalidateExteriorWrap];
  }
  else
  {
    [(CRLCanvasLayout *)self invalidatePosition];
  }
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLMovieLayout;
  [(CRLBoardItemLayout *)&v4 beginDynamicOperationWithRealTimeCommands:a3];
  [(CRLMovieLayout *)self p_createDynamicCopies];
}

- (void)endDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieLayout;
  [(CRLBoardItemLayout *)&v3 endDynamicOperation];
  [(CRLMovieLayout *)self p_destroyDynamicCopies];
}

- (id)computeLayoutGeometry
{
  objc_super v3 = [(CRLMovieLayout *)self layoutGeometryFromInfo];
  if ([(CRLCanvasLayout *)self layoutState] == 3
    || [(CRLCanvasLayout *)self layoutState] == 5)
  {
    objc_super v4 = [CRLCanvasLayoutGeometry alloc];
    v5 = [(CRLCanvasLayout *)self originalPureGeometry];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    if (v3) {
      [v3 transform];
    }
    else {
      memset(v30, 0, sizeof(v30));
    }
    uint64_t v10 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v4, "initWithSize:transform:", v30, v7, v9);

    objc_super v3 = v10;
  }
  uint64_t v11 = objc_opt_class();
  long long v12 = [(CRLMediaLayout *)self stroke];
  long long v13 = sub_1002469D0(v11, v12);

  uint64_t v14 = objc_opt_class();
  v15 = [(CRLCanvasAbstractLayout *)self parent];
  v16 = sub_1002469D0(v14, v15);

  if (v16)
  {
    [v3 size];
    double v18 = v17;
    double v20 = v19;
    if (v3) {
      [v3 transform];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    -[CRLMovieLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", v29, v18, v20);
    CGAffineTransformMakeScale(&v28, v21, v21);
    uint64_t v22 = [v3 geometryByTransformingBy:&v28];

    objc_super v3 = (void *)v22;
  }
  if (v13 && [v13 shouldRender])
  {
    [v13 renderedWidth];
    CGFloat v24 = v23 * 0.5;
    [v3 geometryByOutsettingBy:v24, v24];
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    [v3 size];
    v31.origin.CGFloat x = sub_100064070();
    CGRect v32 = CGRectOffset(v31, v24, v24);
  }
  else
  {
    id v25 = v3;
    [v25 size];
    v32.origin.CGFloat x = sub_100064070();
  }
  -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  id v26 = v25;

  return v26;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4
{
  double v6 = -[CRLBezierPathSource initWithNaturalSize:]([CRLBezierPathSource alloc], "initWithNaturalSize:", a3.width, a3.height);
  long long v7 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a4->tx;
  [(CRLStyledLayout *)self scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:v11 withStartingPathSource:v6];
  double v9 = v8;

  return v9;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  BOOL v3 = a3;
  memset(&v13, 0, sizeof(v13));
  v5 = [(CRLCanvasAbstractLayout *)self geometry];
  double v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }

  if (v3)
  {
    long long v7 = [(CRLCanvasAbstractLayout *)self parent];

    if (v7)
    {
      double v8 = [(CRLCanvasAbstractLayout *)self parent];
      double v9 = v8;
      if (v8) {
        [v8 transformInRoot];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      CGAffineTransform v10 = v13;
      CGAffineTransformConcat(&v12, &v10, &t2);
      CGAffineTransform v13 = v12;
    }
  }
  CGAffineTransform v12 = v13;
  v14.origin.CGFloat x = 0.0;
  v14.origin.CGFloat y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  return CGRectApplyAffineTransform(v14, &v12);
}

- (void)p_createDynamicCopies
{
  if (*(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6670);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109274C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6690);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout p_createDynamicCopies]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 185, 0, "expected nil value for '%{public}s'", "_dynamicInfoGeometry");
  }
  double v6 = [(CRLCanvasLayout *)self info];
  long long v7 = [v6 geometry];
  id v8 = [v7 copy];
  double v9 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  *(void *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = v8;
}

- (void)p_destroyDynamicCopies
{
  BOOL v3 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E66B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010927E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E66D0);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieLayout p_destroyDynamicCopies]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 190, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    BOOL v3 = *(void **)((char *)&self->super._boundsForStandardKnobs.size.width + 3);
  }
  *(CGFloat *)((char *)&self->super._boundsForStandardKnobs.size.width + 3) = 0.0;
}

- (void).cxx_destruct
{
}

@end