@interface CRLBoardItemLayout
- (BOOL)allowsConnections;
- (BOOL)hasAlpha;
- (BOOL)isDraggable;
- (BOOL)supportsRotation;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (id)computeWrapPath;
- (id)i_wrapPath;
- (id)layoutGeometryFromInfo;
- (id)pathForClippingConnectionLines;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)dragBy:(CGPoint)a3;
- (void)endDynamicOperation;
- (void)invalidate;
- (void)invalidateExteriorWrap;
- (void)invalidateParentForWrap;
- (void)p_addVisibleGeometriesFromInfo:(id)a3 intoArray:(id)a4 withTransform:(CGAffineTransform *)a5;
- (void)p_createDynamicBoardItemCopies;
- (void)p_destroyDynamicBoardItemCopies;
- (void)parentDidChange;
- (void)setGeometry:(id)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
@end

@implementation CRLBoardItemLayout

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_10024715C(v3, v4);

  return (_TtC8Freeform12CRLBoardItem *)v5;
}

- (id)computeWrapPath
{
  v2 = [(CRLCanvasAbstractLayout *)self geometry];
  [v2 size];
  v3 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];

  return v3;
}

- (id)i_wrapPath
{
  v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (!v3)
  {
    v4 = [(CRLBoardItemLayout *)self computeWrapPath];
    v5 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
    *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v4;

    v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  }

  return v3;
}

- (id)pathForClippingConnectionLines
{
  v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  if (!v3)
  {
    v4 = [(CRLBoardItemLayout *)self i_wrapPath];
    v5 = +[CRLBezierPath exteriorOfBezierPath:v4];
    v6 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
    *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = v5;

    v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  }

  return v3;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v3 invalidate];
  [(CRLBoardItemLayout *)self invalidateParentForWrap];
}

- (void)invalidateExteriorWrap
{
  v5.receiver = self;
  v5.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v5 invalidateExteriorWrap];
  objc_super v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = 0;

  v4 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = 0;
}

- (id)layoutGeometryFromInfo
{
  if (*(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2))
  {
    v2 = [[CRLCanvasLayoutGeometry alloc] initWithInfoGeometry:*(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2)];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLBoardItemLayout;
    v2 = [(CRLCanvasLayout *)&v4 layoutGeometryFromInfo];
  }

  return v2;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v13 takeRotationFromTracker:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (v4) {
    [v4 rotateTransform];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v9];
  objc_super v5 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  v6 = [v5 geometryByAppendingTransform:v8];
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

  [(CRLCanvasLayout *)self invalidatePosition];
}

- (void)takeSizeFromTracker:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemLayout;
  id v4 = a3;
  [(CRLCanvasLayout *)&v8 takeSizeFromTracker:v4];
  objc_super v5 = [v4 currentGeometryForLayout:self];

  v6 = (CRLCanvasInfoGeometry *)[v5 copy];
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v13 takeFreeTransformFromTracker:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (v4) {
    [v4 freeTransformForLayout:self];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [(CRLCanvasLayout *)self layoutTransformInInfoSpace:v9];
  objc_super v5 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  v6 = [v5 geometryByAppendingTransform:v8];
  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v6;

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
  v4.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v4 beginDynamicOperationWithRealTimeCommands:a3];
  [(CRLBoardItemLayout *)self p_createDynamicBoardItemCopies];
}

- (void)endDynamicOperation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v3 endDynamicOperation];
  [(CRLBoardItemLayout *)self p_destroyDynamicBoardItemCopies];
}

- (void)p_createDynamicBoardItemCopies
{
  objc_super v3 = [(CRLCanvasLayout *)self info];
  objc_super v4 = [v3 geometry];

  if (*(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6418);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACD1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6438);
    }
    objc_super v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_createDynamicBoardItemCopies]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 159, 0, "expected nil value for '%{public}s'", "_infoGeometryBeforeDynamicOperation");
  }
  objc_super v8 = (CRLBezierPath *)[v4 copy];
  v9 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = v8;

  if (*(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6458);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACC88();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6478);
    }
    long long v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    long long v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_createDynamicBoardItemCopies]");
    long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 162, 0, "expected nil value for '%{public}s'", "_dynamicInfoGeometry");
  }
  objc_super v13 = (CRLCanvasInfoGeometry *)[v4 copy];
  v14 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v13;
}

- (void)p_destroyDynamicBoardItemCopies
{
  objc_super v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6498);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACE44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F64B8);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    objc_super v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_destroyDynamicBoardItemCopies]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 168, 0, "invalid nil value for '%{public}s'", "_infoGeometryBeforeDynamicOperation");

    objc_super v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  }
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = 0;

  v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F64D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACDB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F64F8);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_destroyDynamicBoardItemCopies]");
    long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 171, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v7 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = 0;
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLBoardItemLayout;
  -[CRLCanvasLayout dragBy:](&v13, "dragBy:");
  v6 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6518);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACED8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6538);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout dragBy:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 186, 0, "invalid nil value for '%{public}s'", "_dynamicInfoGeometry");

    v6 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  }
  CGAffineTransformMakeTranslation(&v12, x, y);
  long long v10 = [v6 geometryByAppendingTransform:&v12];
  long long v11 = *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->_infoGeometryBeforeDynamicOperation + 2) = v10;

  [(CRLBoardItemLayout *)self invalidateParentForWrap];
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLCanvasAbstractLayout *)self geometry];
  v6 = v5;
  if (!v5
    || ([v5 isEqual:v4] & 1) == 0
    && [v6 differsInMoreThanTranslationFrom:v4])
  {
    [(CRLBoardItemLayout *)self invalidateExteriorWrap];
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasAbstractLayout *)&v7 setGeometry:v4];
}

- (void)parentDidChange
{
  [(CRLBoardItemLayout *)self invalidateExteriorWrap];
  v3.receiver = self;
  v3.super_class = (Class)CRLBoardItemLayout;
  [(CRLCanvasLayout *)&v3 parentDidChange];
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)p_addVisibleGeometriesFromInfo:(id)a3 intoArray:(id)a4 withTransform:(CGAffineTransform *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(CRLCanvasLayout *)self layoutController];
  long long v11 = [v10 layoutForInfo:v8 childOfLayout:self];

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6558);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ACF6C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6578);
    }
    CGAffineTransform v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    objc_super v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemLayout p_addVisibleGeometriesFromInfo:intoArray:withTransform:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 219, 0, "invalid nil value for '%{public}s'", "layout");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = [v11 visibleGeometries];
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v21 = *(_OWORD *)&a5->c;
        v23[0] = *(_OWORD *)&a5->a;
        v23[1] = v21;
        v23[2] = *(_OWORD *)&a5->tx;
        v22 = [v20 geometryByTransformingBy:v23];
        [v9 addObject:v22];
      }
      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)invalidateParentForWrap
{
  if ([(CRLCanvasLayout *)self isBeingManipulated])
  {
    [(CRLBoardItemLayout *)self invalidateWrap];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_infoGeometryBeforeDynamicOperation + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedPathForClippingConnectionLines + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedWrapPath + 2), 0);

  objc_storeStrong((id *)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2), 0);
}

@end