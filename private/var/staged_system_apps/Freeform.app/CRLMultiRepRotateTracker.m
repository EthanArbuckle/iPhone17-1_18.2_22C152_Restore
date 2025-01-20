@interface CRLMultiRepRotateTracker
- (BOOL)isEnqueueingCommandsInRealTime;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)supportsAlignmentGuides;
- (CGPoint)unscaledCenterForRotation;
- (CGRect)p_unscaledBoundingRectForReps:(id)a3;
- (CRLMultiRepRotateTracker)initWithReps:(id)a3;
- (NSSet)repsBeingRotated;
- (double)currentTotalAngleOfRotationInRadians;
- (double)snapThreshold;
- (id)p_trackersForReps:(id)a3;
- (void)addRotateDelta:(double)a3;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setScaledHUDPosition:(CGPoint)a3;
- (void)setUnscaledCenterForRotation:(CGPoint)a3;
@end

@implementation CRLMultiRepRotateTracker

- (CRLMultiRepRotateTracker)initWithReps:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLMultiRepRotateTracker;
  v5 = [(CRLMultiRepRotateTracker *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CRLMultiRepRotateTracker *)v5 p_trackersForReps:v4];
    trackers = v6->_trackers;
    v6->_trackers = (NSArray *)v7;
  }
  return v6;
}

- (NSSet)repsBeingRotated
{
  v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_trackers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) rep:v11];
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (CGPoint)unscaledCenterForRotation
{
  if (![(NSArray *)self->_trackers count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA920);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099920();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA940);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiRepRotateTracker unscaledCenterForRotation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiRepRotateTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:45 isFatal:0 description:"Must have at least one tracker to ask for its center of rotation"];
  }
  id v6 = [(NSArray *)self->_trackers firstObject];
  [v6 unscaledCenterForRotation];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setUnscaledCenterForRotation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_trackers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setUnscaledCenterForRotation:x, y, (void)v10];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)currentTotalAngleOfRotationInRadians
{
  if (![(NSArray *)self->_trackers count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA960);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010999B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA980);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiRepRotateTracker currentTotalAngleOfRotationInRadians]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiRepRotateTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:58 isFatal:0 description:"Must have at least one tracker to ask for its total angle of rotation"];
  }
  id v6 = [(NSArray *)self->_trackers firstObject];
  [v6 currentTotalAngleOfRotationInRadians];
  double v8 = v7;

  return v8;
}

- (id)p_trackersForReps:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  [(CRLMultiRepRotateTracker *)self p_unscaledBoundingRectForReps:v4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    double v17 = sub_100065738(v7, v9, v11, v13);
    double v19 = v18;
    uint64_t v20 = *(void *)v29;
    char v21 = 1;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v24 = [CRLCanvasRepRotateTracker alloc];
        v25 = -[CRLCanvasRepRotateTracker initWithRep:](v24, "initWithRep:", v23, (void)v28);
        -[CRLCanvasRepRotateTracker setUnscaledCenterForRotation:](v25, "setUnscaledCenterForRotation:", v17, v19);
        [(CRLCanvasRepRotateTracker *)v25 setShouldShowGuides:v21 & 1];
        [(CRLCanvasRepRotateTracker *)v25 setSnapThreshold:0.0];
        [(CRLCanvasRepRotateTracker *)v25 setShouldShowHUD:0];
        [v5 addObject:v25];

        char v21 = 0;
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      char v21 = 0;
    }
    while (v16);
  }

  id v26 = [v5 copy];

  return v26;
}

- (CGRect)p_unscaledBoundingRectForReps:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v3);
        }
        double v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v12 boundsForStandardKnobs];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        BOOL IsNull = CGRectIsNull(v39);
        [v12 convertNaturalRectToUnscaledCanvas:v14, v16, v18, v20];
        CGFloat v26 = v22;
        double v27 = v23;
        double v28 = v24;
        double v29 = v25;
        if (!IsNull)
        {
          v40.origin.CGFloat x = x;
          v40.origin.CGFloat y = y;
          v40.size.CGFloat width = width;
          v40.size.CGFloat height = height;
          *(CGRect *)&CGFloat v22 = CGRectUnion(v40, *(CGRect *)&v26);
        }
        CGFloat x = v22;
        CGFloat y = v23;
        CGFloat width = v24;
        CGFloat height = v25;
      }
      id v9 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }

  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (void)addRotateDelta:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_trackers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) addRotateDelta:a3, (void)v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)snapThreshold
{
  return 0.0;
}

- (void)setScaledHUDPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(NSArray *)self->_trackers firstObject];
  [v5 setScaledHUDPosition:x, y];
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  id v3 = [(NSArray *)self->_trackers firstObject];
  id v4 = [v3 rep];
  id v5 = [v4 interactiveCanvasController];
  unsigned int v6 = [v5 shouldSupportedDynamicOperationsEnqueueCommandsInRealTime];

  if (!v6) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_trackers;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) rep:v16];
        unsigned int v13 = [v12 allowsSupportedDynamicOperationsToBeRealTime];

        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_13;
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_trackers;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 rep:v11];
        uint64_t v10 = +[NSSet setWithObject:v9];
        [v8 changeDynamicLayoutsForReps:v10];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)commitChangesForReps:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_trackers;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 rep:v11];
        uint64_t v10 = +[NSSet setWithObject:v9];
        [v8 commitChangesForReps:v10];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 1;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->_isInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->_isInspectorDrivenTracking = a3;
}

- (void).cxx_destruct
{
}

@end