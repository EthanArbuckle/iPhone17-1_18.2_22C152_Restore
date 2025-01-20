@interface CRLFreehandDrawingTransformLayout
- (NSSet)representedShapeLayouts;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)computeLayoutGeometry;
- (id)p_transformInfo;
- (id)reliedOnLayouts;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)endDynamicOperation;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
@end

@implementation CRLFreehandDrawingTransformLayout

- (NSSet)representedShapeLayouts
{
  v3 = +[NSMutableSet set];
  v4 = [(CRLCanvasLayout *)self layoutController];
  v5 = [(CRLFreehandDrawingTransformLayout *)self p_transformInfo];
  v6 = [v5 representedShapeInfos];
  v7 = [v4 layoutsForInfos:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = (objc_class *)objc_opt_class();
        v15 = sub_10024715C(v14, v13);
        [v3 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSSet *)v3;
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  return 0;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v5 = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  if (v4) {
    [v4 transformForLayout:self];
  }
  v6 = [(CRLCanvasLayout *)self originalGeometry];
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  v7 = [v6 geometryByTransformingBy:v18];

  [(CRLCanvasLayout *)self setDynamicGeometry:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(CRLFreehandDrawingTransformLayout *)self representedShapeLayouts];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(CRLFreehandDrawingTransformLayout **)(*((void *)&v14 + 1) + 8 * i);
        if (v13 != self) {
          [(CRLFreehandDrawingTransformLayout *)v13 takeSizeFromTracker:v5];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  [(CRLCanvasLayout *)self invalidateFrame];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingTransformLayout;
  [(CRLCanvasLayout *)&v21 takeFreeTransformFromTracker:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  if (v4) {
    [v4 freeTransformForLayout:self];
  }
  v5 = [(CRLCanvasLayout *)self originalGeometry];
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v6 = [v5 geometryByTransformingBy:v17];

  [(CRLCanvasLayout *)self setDynamicGeometry:v6];
  if ([v4 isResizing])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = [(CRLFreehandDrawingTransformLayout *)self representedShapeLayouts];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(CRLFreehandDrawingTransformLayout **)(*((void *)&v13 + 1) + 8 * i);
          if (v12 != self) {
            [(CRLFreehandDrawingTransformLayout *)v12 takeFreeTransformFromTracker:v4];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v22 count:16];
      }
      while (v9);
    }

    [(CRLCanvasLayout *)self invalidateFrame];
  }
}

- (id)computeLayoutGeometry
{
  v3 = [(CRLCanvasAbstractLayout *)self parent];
  id v4 = [v3 children];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000867DC;
  v33[3] = &unk_1014CFA58;
  v33[4] = self;
  v5 = [v4 crl_arrayOfObjectsPassingTest:v33];
  v6 = +[NSSet setWithArray:v5];

  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) pureGeometry];
        [v16 frame];
        v39.origin.CGFloat x = v17;
        v39.origin.CGFloat y = v18;
        v39.size.double width = v19;
        v39.size.double height = v20;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.double width = width;
        v36.size.double height = height;
        CGRect v37 = CGRectUnion(v36, v39);
        CGFloat x = v37.origin.x;
        CGFloat y = v37.origin.y;
        double width = v37.size.width;
        double height = v37.size.height;
      }
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  if (!sub_100065AF4(x, y, width, height))
  {
    int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D08E8);
    }
    v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106F9FC(v22, v21, x, y, width, height);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0908);
    }
    v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v23);
    }
    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout computeLayoutGeometry]");
    v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"];
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    v26 = NSStringFromCGRect(v38);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 96, 0, "Unable to determine proper layout geometry! Got %{public}@", v26);

    CGFloat y = 0.0;
    double height = 1.0;
    double width = 1.0;
    CGFloat x = 0.0;
  }
  v27 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasLayoutGeometry alloc], "initWithFrame:", x, y, width, height);

  return v27;
}

- (id)reliedOnLayouts
{
  v3 = [(CRLCanvasLayout *)self layoutController];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0928);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106FB14();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0948);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout reliedOnLayouts]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 104, 0, "invalid nil value for '%{public}s'", "self.layoutController");
  }
  v7 = [(CRLCanvasLayout *)self layoutController];
  id v8 = [(CRLFreehandDrawingTransformLayout *)self p_transformInfo];
  id v9 = [v8 representedShapeInfos];
  uint64_t v10 = [v7 layoutsForInfos:v9];

  return v10;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRLFreehandDrawingTransformLayout;
  [(CRLCanvasLayout *)&v10 beginDynamicOperationWithRealTimeCommands:a3];
  id v4 = (objc_class *)objc_opt_class();
  v5 = [(CRLCanvasAbstractLayout *)self parent];
  v6 = sub_10024715C(v4, v5);

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0968);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106FBAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0988);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout beginDynamicOperationWithRealTimeCommands:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 115, 0, "invalid nil value for '%{public}s'", "parentDrawing");
  }
  [v6 transformLayoutDidBeginDynamicOperation];
}

- (void)endDynamicOperation
{
  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingTransformLayout;
  [(CRLCanvasLayout *)&v9 endDynamicOperation];
  v3 = (objc_class *)objc_opt_class();
  id v4 = [(CRLCanvasAbstractLayout *)self parent];
  v5 = sub_10024715C(v3, v4);

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D09A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106FC44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D09C8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformLayout endDynamicOperation]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 123, 0, "invalid nil value for '%{public}s'", "parentDrawing");
  }
  [v5 transformLayoutDidEndDynamicOperation];
}

- (id)p_transformInfo
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_1002469D0(v3, v4);

  return v5;
}

@end