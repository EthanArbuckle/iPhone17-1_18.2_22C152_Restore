@interface BKTouchAnnotationController
+ (id)workQueue;
- (BKDisplayAnnotationController)displayAnnotationController;
- (BKTouchAnnotationController)initWithDisplayUUID:(id)a3;
- (BOOL)shouldVisualizeHitTestRegions;
- (BOOL)shouldVisualizeTouches;
- (OS_dispatch_queue)workQueue;
- (id)_keyPathForTouchIdentifier:(unsigned int)a3;
- (id)_stringByRemovingPrefix:(id)a3 fromString:(id)a4;
- (id)_stringDescribingContextID:(unsigned int)a3 clientPort:(unsigned int)a4;
- (id)_stringDescribingPID:(int)a3;
- (int)_pidForClientPort:(unsigned int)a3;
- (void)_queue_annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6;
- (void)_queue_annotateTouch:(unsigned int)a3 withUniqueString:(id)a4;
- (void)_queue_applyBasicAnnotationTextForTouchIdentifier:(unsigned int)a3 pathIndex:(int64_t)a4;
- (void)_queue_removeAnnotationForTouch:(unsigned int)a3 withUniqueIdentifier:(id)a4;
- (void)_queue_setCenter:(CGPoint)a3 forTouchIdentifier:(unsigned int)a4;
- (void)_queue_touchWasHardCanceled:(unsigned int)a3;
- (void)_queue_touchWasSoftCanceled:(unsigned int)a3;
- (void)_queue_updateHoverStateForTouchIdentifier:(unsigned int)a3 z:(double)a4 maxZ:(double)a5;
- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5;
- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6;
- (void)annotateTouch:(unsigned int)a3 withUniqueString:(id)a4;
- (void)hitTestRegionsDidChange:(id)a3;
- (void)setDisplayAnnotationController:(id)a3;
- (void)setShouldVisualizeHitTestRegions:(BOOL)a3;
- (void)setShouldVisualizeTouches:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)touch:(unsigned int)a3 didAlwaysRouteToContext:(unsigned int)a4 clientPort:(unsigned int)a5;
- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5;
- (void)touch:(unsigned int)a3 didMoveToPoint:(CGPoint)a4 eventMask:(unsigned int)a5 z:(double)a6 maxZ:(double)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidHIDCancel:(unsigned int)a3;
- (void)touchDidSoftCancel:(unsigned int)a3;
- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4;
@end

@implementation BKTouchAnnotationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_displayAnnotationController, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setDisplayAnnotationController:(id)a3
{
}

- (BKDisplayAnnotationController)displayAnnotationController
{
  return self->_displayAnnotationController;
}

- (void)_queue_touchWasSoftCanceled:(unsigned int)a3
{
  displayAnnotationController = self->_displayAnnotationController;
  v4 = [(BKTouchAnnotationController *)self _keyPathForTouchIdentifier:*(void *)&a3];
  v5 = [v4 stringByAppendingString:@".ctx"];
  v6 = [(BKDisplayAnnotationController *)displayAnnotationController allAnnotationsForKeyPath:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
        v13 = +[BKDisplayAnnotationStyle canceledStyle];
        [v12 setStyleModifier:v13];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_queue_touchWasHardCanceled:(unsigned int)a3
{
  id v6 = [(BKTouchAnnotationController *)self _keyPathForTouchIdentifier:*(void *)&a3];
  v4 = [(BKDisplayAnnotationController *)self->_displayAnnotationController annotationForKeyPath:v6];
  v5 = +[BKDisplayAnnotationStyle canceledStyle];
  [v4 setStyleModifier:v5];

  [(BKDisplayAnnotationController *)self->_displayAnnotationController removeAnnotationsForKeyPath:v6 afterDelay:self->_workQueue queue:0.5];
}

- (void)_queue_setCenter:(CGPoint)a3 forTouchIdentifier:(unsigned int)a4
{
  double y = a3.y;
  double x = a3.x;
  id v11 = [(BKTouchAnnotationController *)self _keyPathForTouchIdentifier:*(void *)&a4];
  id v7 = -[BKDisplayAnnotationController annotationForKeyPath:](self->_displayAnnotationController, "annotationForKeyPath:");
  if (v7)
  {
    id v8 = +[BKDisplayAnnotationLocation centerAtPoint:](BKDisplayAnnotationLocation, "centerAtPoint:", x, y);
    [v7 setLocation:v8];
  }
  else
  {
    id v8 = +[BKDisplayAnnotation annotationWithEllipseSize:](BKDisplayAnnotation, "annotationWithEllipseSize:", 64.0, 64.0);
    id v9 = +[BKDisplayAnnotationLocation centerAtPoint:](BKDisplayAnnotationLocation, "centerAtPoint:", x, y);
    uint64_t v10 = objc_alloc_init(BKDisplayAnnotationContainedSubnodeRenderer);
    [v8 setLocation:v9];
    [v8 setRenderer:v10];
    [(BKDisplayAnnotationController *)self->_displayAnnotationController setAnnotation:v8 forKeyPath:v11];
  }
}

- (id)_keyPathForTouchIdentifier:(unsigned int)a3
{
  return +[NSString stringWithFormat:@"touch.%X", *(void *)&a3];
}

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = BKHIDEventRoutingGetClientConnectionManager();
  v5 = [v4 clientForTaskPort:v3];
  id v6 = v5;
  if (v5) {
    int v7 = [v5 pid];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (id)_stringDescribingContextID:(unsigned int)a3 clientPort:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [(BKTouchAnnotationController *)self _pidForClientPort:*(void *)&a4];
  if ((int)v6 < 1)
  {
    id v11 = +[NSString stringWithFormat:@"ctx:%X", v4];
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = BSBundleIDForPID();
    id v9 = [(BKTouchAnnotationController *)self _stringByRemovingPrefix:@"com.apple." fromString:v8];
    uint64_t v10 = [v9 stringByAppendingFormat:@" (%d)", v7];

    id v11 = +[NSString stringWithFormat:@"ctx:%X -- %@", v4, v10];
  }

  return v11;
}

- (id)_stringDescribingPID:(int)a3
{
  if (a3 < 1)
  {
    uint64_t v7 = &stru_1000FD108;
    goto LABEL_9;
  }
  uint64_t v3 = *(void *)&a3;
  v5 = BSBundleIDForPID();
  if ([v5 length])
  {
    uint64_t v6 = [(BKTouchAnnotationController *)self _stringByRemovingPrefix:@"com.apple." fromString:v5];
    [v6 stringByAppendingFormat:@" (%d)", v3];
  }
  else
  {
    uint64_t v6 = BSProcessNameForPID();
    if (![v6 length])
    {
      uint64_t v8 = +[NSString stringWithFormat:@"pid %d", v3];
      goto LABEL_8;
    }
    [v6 stringByAppendingFormat:@" (%d)", v3];
  uint64_t v8 = };
LABEL_8:
  uint64_t v7 = (__CFString *)v8;

LABEL_9:

  return v7;
}

- (id)_stringByRemovingPrefix:(id)a3 fromString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 length];
  if ([v6 length] > v7 && objc_msgSend(v6, "hasPrefix:", v5))
  {
    id v8 = [v6 substringFromIndex:v7];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (void)_queue_removeAnnotationForTouch:(unsigned int)a3 withUniqueIdentifier:(id)a4
{
}

- (void)_queue_annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  displayAnnotationController = self->_displayAnnotationController;
  v13 = [(BKTouchAnnotationController *)self _keyPathForTouchIdentifier:v8];
  long long v14 = [(BKDisplayAnnotationController *)displayAnnotationController annotationForKeyPath:v13];

  long long v15 = sub_10005FB14();
  long long v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v21 = v8;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 1024;
      int v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "touchIdentifier:%X annotation:%{public}@ pid:%d", buf, 0x18u);
    }

    long long v16 = +[NSString stringWithFormat:@"touch.%X.%@", v8, v11];
    if ([v10 length])
    {
      long long v17 = +[BKDisplayAnnotation annotationWithString:v10];
      v18 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
      [v17 setRenderer:v18];
      if ((int)v6 >= 1)
      {
        v19 = [(BKTouchAnnotationController *)self _stringDescribingPID:v6];
        [v17 setSection:v19];
      }
      [(BKDisplayAnnotationController *)self->_displayAnnotationController setAnnotation:v17 forKeyPath:v16];
    }
    else
    {
      [(BKDisplayAnnotationController *)self->_displayAnnotationController removeAnnotationsForKeyPath:v16];
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    int v21 = v8;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "touchIdentifier %X does not exist; dropping annotation:%{public}@",
      buf,
      0x12u);
  }
}

- (void)_queue_annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
}

- (void)_queue_updateHoverStateForTouchIdentifier:(unsigned int)a3 z:(double)a4 maxZ:(double)a5
{
  uint64_t v5 = *(void *)&a3;
  if (a4 > 0.0 || a5 > 0.0)
  {
    [@"in range" stringByAppendingFormat:@" max:%.4g z:%.4g", *(void *)&a5, *(void *)&a4];
    CFStringRef v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v7 = @"in range";
  }
  uint64_t v8 = (__CFString *)v7;
  [(BKTouchAnnotationController *)self _queue_annotateTouch:v5 withString:v7 uniqueIdentifier:@"withinRange" fromPID:0xFFFFFFFFLL];
}

- (void)hitTestRegionsDidChange:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044908;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044C74;
  v4[3] = &unk_1000F8A20;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)touch:(unsigned int)a3 didAlwaysRouteToContext:(unsigned int)a4 clientPort:(unsigned int)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044D00;
  block[3] = &unk_1000F6A90;
  block[4] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  unsigned int v9 = a3;
  dispatch_async(workQueue, block);
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044E44;
  v4[3] = &unk_1000F8A20;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044ECC;
  v6[3] = &unk_1000F8A20;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(workQueue, v6);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044FA4;
  v7[3] = &unk_1000F8A20;
  v7[4] = self;
  unsigned int v8 = a3;
  dispatch_async(workQueue, v7);
}

- (void)touch:(unsigned int)a3 didMoveToPoint:(CGPoint)a4 eventMask:(unsigned int)a5 z:(double)a6 maxZ:(double)a7
{
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045078;
  v8[3] = &unk_1000F6A68;
  v8[4] = self;
  CGPoint v9 = a4;
  unsigned int v12 = a3;
  double v10 = a7;
  double v11 = a6;
  dispatch_async(workQueue, v8);
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045184;
  block[3] = &unk_1000F8EC8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045278;
  v5[3] = &unk_1000F8A20;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async(workQueue, v5);
}

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v8 = a4;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100045340;
  v11[3] = &unk_1000F7890;
  v11[4] = self;
  id v12 = v8;
  unsigned int v14 = a3;
  int64_t v13 = a5;
  id v10 = v8;
  dispatch_async(workQueue, v11);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045474;
  block[3] = &unk_1000F6A40;
  block[4] = self;
  CGPoint v9 = a5;
  int64_t v10 = a4;
  unsigned int v11 = a3;
  unsigned int v12 = a6;
  dispatch_async(workQueue, block);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004564C;
  block[3] = &unk_1000F6A18;
  block[4] = self;
  CGPoint v11 = a5;
  unsigned int v15 = a3;
  int64_t v12 = a4;
  double v13 = a7;
  double v14 = a8;
  dispatch_async(workQueue, block);
}

- (void)_queue_applyBasicAnnotationTextForTouchIdentifier:(unsigned int)a3 pathIndex:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v12 = +[NSString stringWithFormat:@"touch.%X.id", *(void *)&a3];
  unsigned int v7 = -[BKDisplayAnnotationController annotationForKeyPath:](self->_displayAnnotationController, "annotationForKeyPath:");

  if (!v7)
  {
    id v8 = +[NSString stringWithFormat:@"t%X p%d", v5, a4];
    CGPoint v9 = +[BKDisplayAnnotation annotationWithString:v8];

    int64_t v10 = objc_alloc_init(BKDisplayAnnotationNullRenderer);
    CGPoint v11 = +[BKDisplayAnnotationStyle colorVariationStyleWithIndex:v5];
    [v9 setStyleModifier:v11];

    [v9 setRenderer:v10];
    [(BKDisplayAnnotationController *)self->_displayAnnotationController setAnnotation:v9 forKeyPath:v12];
  }
}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5 fromPID:(int)a6
{
  id v10 = a4;
  id v11 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000458AC;
  v15[3] = &unk_1000F8F60;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  unsigned int v18 = a3;
  int v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(workQueue, v15);
}

- (void)annotateTouch:(unsigned int)a3 withString:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004598C;
  v13[3] = &unk_1000F69F0;
  unsigned int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)annotateTouch:(unsigned int)a3 withUniqueString:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045A4C;
  block[3] = &unk_1000F8EC8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)setShouldVisualizeHitTestRegions:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045AD4;
  v4[3] = &unk_1000F8A48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)setShouldVisualizeTouches:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045B84;
  v4[3] = &unk_1000F8A48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

- (BOOL)shouldVisualizeHitTestRegions
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045C68;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldVisualizeTouches
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045D28;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BKTouchAnnotationController)initWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKTouchAnnotationController;
  BOOL v5 = [(BKTouchAnnotationController *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() workQueue];
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = sub_100038D5C(v4);
    uint64_t v9 = +[BKDisplayAnnotationController annotationControllerForDisplay:v8];
    displayAnnotationController = v5->_displayAnnotationController;
    v5->_displayAnnotationController = (BKDisplayAnnotationController *)v9;
  }
  return v5;
}

+ (id)workQueue
{
  if (qword_100122E90 != -1) {
    dispatch_once(&qword_100122E90, &stru_1000F69C8);
  }
  v2 = (void *)qword_100122E88;

  return v2;
}

@end