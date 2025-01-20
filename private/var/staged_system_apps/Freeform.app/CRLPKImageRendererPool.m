@interface CRLPKImageRendererPool
+ (CRLPKImageRendererPool)sharedPool;
- (CRLPKImageRendererPool)init;
- (void)asyncFlushAllUnlockedRenderers;
- (void)p_applicationDidEnterBackground:(id)a3;
- (void)p_didReceiveMemoryWarning:(id)a3;
- (void)p_flushUnlockedRenderersLeavingMaxCount:(unint64_t)a3;
- (void)provideImageRendererOfMinimumSize:(CGSize)a3 sixChannelBlending:(BOOL)a4 inBlock:(id)a5;
@end

@implementation CRLPKImageRendererPool

- (CRLPKImageRendererPool)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRLPKImageRendererPool;
  v2 = [(CRLPKImageRendererPool *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    rendererContainers = v2->_rendererContainers;
    v2->_rendererContainers = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.freeform.CRLPKImageRendererPool", 0);
    containerAccessQueue = v2->_containerAccessQueue;
    v2->_containerAccessQueue = (OS_dispatch_queue *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    v8 = +[UIApplication sharedApplication];
    [v7 addObserver:v2 selector:"p_didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:v8];

    v9 = +[UIApplication sharedApplication];
    [v7 addObserver:v2 selector:"p_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:v9];
  }
  return v2;
}

+ (CRLPKImageRendererPool)sharedPool
{
  if (qword_1016A9A40 != -1) {
    dispatch_once(&qword_1016A9A40, &stru_1014F6AA8);
  }
  v2 = (void *)qword_1016A9A38;

  return (CRLPKImageRendererPool *)v2;
}

- (void)asyncFlushAllUnlockedRenderers
{
  containerAccessQueue = self->_containerAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003E4E5C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(containerAccessQueue, block);
}

- (void)provideImageRendererOfMinimumSize:(CGSize)a3 sixChannelBlending:(BOOL)a4 inBlock:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = (void (**)(id, void *))a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1003E5180;
  v23 = sub_1003E5190;
  id v24 = 0;
  if ((sub_100065BC8(width, height) & 1) == 0)
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6AC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD8AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6AE8);
    }
    objc_super v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      v12 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v12, buf, v10, (os_log_t)v11);
    }

    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKImageRendererPool provideImageRendererOfMinimumSize:sixChannelBlending:inBlock:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPencilKitRenderer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:194 isFatal:0 description:"Can't provide an image renderer for a non-finite size"];
  }
  containerAccessQueue = self->_containerAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003E5220;
  block[3] = &unk_1014F6B50;
  *(double *)&block[6] = width;
  *(double *)&block[7] = height;
  BOOL v18 = a4;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(containerAccessQueue, block);
  v16 = [(id)v20[5] imageRenderer];
  v9[2](v9, v16);

  [(id)v20[5] unlockRenderer];
  _Block_object_dispose(&v19, 8);
}

- (void)p_flushUnlockedRenderersLeavingMaxCount:(unint64_t)a3
{
  dispatch_queue_t v5 = (char *)[(NSMutableArray *)self->_rendererContainers count];
  if ((unint64_t)v5 > a3)
  {
    v6 = v5;
    id v15 = +[NSMutableIndexSet indexSet];
    v7 = 0;
    do
    {
      v8 = [(NSMutableArray *)self->_rendererContainers objectAtIndexedSubscript:v7];
      if ([v8 tryLockingRenderer]) {
        [v15 addIndex:v7];
      }

      ++v7;
    }
    while (v6 != v7);
    id v9 = [v15 count];
    int v10 = +[NSMutableIndexSet indexSet];
    id v11 = [v15 firstIndex];
    if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = v11;
      unint64_t v13 = (unint64_t)v9 - a3;
      do
      {
        if ((unint64_t)[v10 count] >= v13)
        {
          v14 = [(NSMutableArray *)self->_rendererContainers objectAtIndexedSubscript:v12];
          [v14 unlockRenderer];
        }
        else
        {
          [v10 addIndex:v12];
        }
        id v12 = [v15 indexGreaterThanIndex:v12];
      }
      while (v12 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    [(NSMutableArray *)self->_rendererContainers removeObjectsAtIndexes:v10];
  }
}

- (void)p_didReceiveMemoryWarning:(id)a3
{
}

- (void)p_applicationDidEnterBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerAccessQueue, 0);

  objc_storeStrong((id *)&self->_rendererContainers, 0);
}

@end