@interface CRLCounterRotateLayout
- (BOOL)descendentWrappablesContainsWrappable:(id)a3;
- (BOOL)supportsFlipping;
- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)boundsForStandardKnobs;
- (CGSize)minimumSize;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForChildLayouts;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)descendentWrappables;
- (id)reliedOnLayouts;
- (id)visibleGeometries;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
@end

@implementation CRLCounterRotateLayout

- (id)childInfosForChildLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCounterRotateLayout;
  v3 = [(CRLCanvasLayout *)&v8 childInfosForChildLayouts];
  v4 = [(CRLCounterRotateLayout *)self containerInfo];
  v5 = [v4 childInfos];

  if ([v5 count])
  {
    uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v3];

    v3 = (void *)v6;
  }

  return v3;
}

- (id)reliedOnLayouts
{
  v2 = [(CRLCanvasAbstractLayout *)self children];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  v4 = [(CRLCanvasAbstractLayout *)self children];
  v5 = [v4 firstObject];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9378);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101096FAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9398);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout commandToClampModelToLayoutSizeWithAdditionalTransform:]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 45, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  long long v9 = *(_OWORD *)&a3->c;
  v12[0] = *(_OWORD *)&a3->a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a3->tx;
  v10 = [v5 commandToClampModelToLayoutSizeWithAdditionalTransform:v12];

  return v10;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = [(CRLCanvasAbstractLayout *)self parent];
  v7 = sub_10024715C(v5, v6);

  if (v7) {
    [v4 addObject:v7];
  }

  return v4;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  v5 = [(CRLCanvasAbstractLayout *)self children];
  uint64_t v6 = [v5 firstObject];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E93B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097040();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E93D8);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout baseFrameForFrameForCullingWithAdditionalTransform:]");
    long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 64, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  [(CRLCanvasAbstractLayout *)self transform];
  long long v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v25, &t1, &t2);
  [v6 baseFrameForFrameForCullingWithAdditionalTransform:&v25];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)boundsForStandardKnobs
{
  v2 = [(CRLCanvasAbstractLayout *)self children];
  v3 = [v2 firstObject];

  if (v3)
  {
    [v3 boundsForStandardKnobs];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [v3 transform];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E93F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010970D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9418);
    }
    double v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout boundsForStandardKnobs]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 70, 0, "invalid nil value for '%{public}s'", "childLayout");

    [0 boundsForStandardKnobs];
    CGFloat v5 = v15;
    CGFloat v7 = v16;
    CGFloat v9 = v17;
    CGFloat v11 = v18;
    memset(&v27, 0, sizeof(v27));
  }
  v28.origin.CGFloat x = v5;
  v28.origin.CGFloat y = v7;
  v28.size.CGFloat width = v9;
  v28.size.CGFloat height = v11;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v27);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGSize)minimumSize
{
  v2 = [(CRLCanvasAbstractLayout *)self children];
  v3 = [v2 firstObject];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9438);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097168();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9458);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    CGFloat v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout minimumSize]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 77, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  [v3 minimumSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (BOOL)supportsFlipping
{
  v2 = [(CRLCanvasAbstractLayout *)self children];
  v3 = [v2 firstObject];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9478);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010971FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9498);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    CGFloat v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout supportsFlipping]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 83, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  unsigned __int8 v7 = [v3 supportsFlipping];

  return v7;
}

- (id)visibleGeometries
{
  v3 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  double v4 = [(CRLCanvasAbstractLayout *)self geometry];
  CGFloat v5 = v4;
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
  }

  double v6 = [(CRLCanvasAbstractLayout *)self children];
  unsigned __int8 v7 = [v6 firstObject];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E94B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097290();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E94D8);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout visibleGeometries]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 92, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  double v11 = [v7 visibleGeometries];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v19[0] = v24;
        v19[1] = v25;
        v19[2] = v26;
        double v17 = [v16 geometryByTransformingBy:v19];
        [v3 addObject:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }

  return v3;
}

- (id)descendentWrappables
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  double v4 = [(CRLCanvasAbstractLayout *)self children];
  CGFloat v5 = [v4 firstObject];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E94F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097324();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9518);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    unsigned __int8 v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout descendentWrappables]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 111, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasWrappable])
  {
    [v3 addObject:v5];
  }
  else if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasWrappableParent])
  {
    double v9 = [v5 descendentWrappables];
    [v3 addObjectsFromArray:v9];
  }

  return v3;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 parent];

  if (v5 == self)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    unsigned __int8 v7 = sub_1002469D0(v6, v4);
    double v8 = [(CRLCanvasAbstractLayout *)self childLayoutContainingPossibleDescendentLayout:v7];
    double v15 = sub_100246AC8(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLCanvasWrappableParent);

    if (v15) {
      unsigned __int8 v16 = [v15 descendentWrappablesContainsWrappable:v4];
    }
    else {
      unsigned __int8 v16 = 0;
    }
  }
  return v16;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CRLCanvasAbstractLayout *)self children];
  uint64_t v6 = [v5 firstObject];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9538);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010973B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9558);
    }
    unsigned __int8 v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout takeSizeFromTracker:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 143, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  [v6 takeSizeFromTracker:v4];
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CRLCanvasAbstractLayout *)self children];
  uint64_t v6 = [v5 firstObject];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9578);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109744C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9598);
    }
    unsigned __int8 v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateLayout takeFreeTransformFromTracker:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 150, 0, "invalid nil value for '%{public}s'", "childLayout");
  }
  [v6 takeFreeTransformFromTracker:v4];
}

@end