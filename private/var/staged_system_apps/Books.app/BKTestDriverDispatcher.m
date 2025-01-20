@interface BKTestDriverDispatcher
+ (id)shared;
+ (void)prewarm;
- (BKTestDriverDispatcher)init;
- (BOOL)bookPageCurlAnimationIsRunning;
- (BOOL)bookPageSlideAnimationIsRunning;
- (BOOL)pageScrollerAnimationIsRunning;
- (BOOL)pagedToScrolledAnimationIsRunning;
- (NSMutableDictionary)types;
- (NSObject)bookController;
- (NSObject)libraryController;
- (OS_dispatch_queue)queue;
- (id)getReceivers:(id)a3;
- (void)addReceiver:(id)a3 type:(id)a4;
- (void)async:(id)a3;
- (void)dealloc;
- (void)notifyBookController:(id)a3;
- (void)notifyLibraryController:(id)a3;
- (void)notifyTHBookControllerChange:(id)a3;
- (void)onEventType:(id)a3 update:(id)a4 receive:(id)a5;
- (void)setBookController:(id)a3;
- (void)setBookPageCurlAnimationIsRunning:(BOOL)a3;
- (void)setBookPageSlideAnimationIsRunning:(BOOL)a3;
- (void)setLibraryController:(id)a3;
- (void)setPageScrollerAnimationIsRunning:(BOOL)a3;
- (void)setPagedToScrolledAnimationIsRunning:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTypes:(id)a3;
- (void)subscribeForBookController:(id)a3;
- (void)subscribeForLibraryController:(id)a3;
- (void)sync:(id)a3;
- (void)unsubscribe:(id)a3;
@end

@implementation BKTestDriverDispatcher

+ (void)prewarm
{
  if (qword_100B4A218 != -1) {
    dispatch_once(&qword_100B4A218, &stru_100A443A0);
  }
}

+ (id)shared
{
  return (id)qword_100B4A210;
}

- (BKTestDriverDispatcher)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKTestDriverDispatcher;
  v2 = [(BKTestDriverDispatcher *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iBooks.TestDriverDispatcher", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    types = v2->_types;
    v2->_types = (NSMutableDictionary *)v5;

    v7 = +[AETestDriver shared];
    [v7 setEventDispatcher:v2];

    v8 = +[BKTestDriver shared];
    [v8 setEventDispatcher:v2];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"notifyTHBookControllerChange:" name:kTHPPT_bookControllerChange object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKTestDriverDispatcher;
  [(BKTestDriverDispatcher *)&v4 dealloc];
}

- (id)getReceivers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_types objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = +[NSMutableSet set];
    [(NSMutableDictionary *)self->_types setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)addReceiver:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BKTestDriverDispatcher *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009EEE8;
  block[3] = &unk_100A443C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)subscribeForBookController:(id)a3
{
}

- (void)subscribeForLibraryController:(id)a3
{
}

- (void)unsubscribe:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKTestDriverDispatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F00C;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)async:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKTestDriverDispatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F1CC;
  v7[3] = &unk_100A443F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKTestDriverDispatcher *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F294;
  v7[3] = &unk_100A443F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)onEventType:(id)a3 update:(id)a4 receive:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009F38C;
  v15[3] = &unk_100A44418;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)notifyTHBookControllerChange:(id)a3
{
  id v4 = [a3 object];
  [(BKTestDriverDispatcher *)self notifyBookController:v4];
}

- (void)notifyBookController:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009F5D4;
  v5[3] = &unk_100A43DD8;
  id v6 = self;
  id v7 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F5E0;
  v4[3] = &unk_100A44440;
  v4[4] = v6;
  id v3 = v7;
  [(BKTestDriverDispatcher *)v6 onEventType:@"BookController" update:v5 receive:v4];
}

- (void)notifyLibraryController:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009F720;
  v5[3] = &unk_100A43DD8;
  id v6 = self;
  id v7 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F72C;
  v4[3] = &unk_100A44440;
  v4[4] = v6;
  id v3 = v7;
  [(BKTestDriverDispatcher *)v6 onEventType:@"LibraryController" update:v5 receive:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (NSObject)bookController
{
  return self->_bookController;
}

- (void)setBookController:(id)a3
{
}

- (NSObject)libraryController
{
  return self->_libraryController;
}

- (void)setLibraryController:(id)a3
{
}

- (BOOL)bookPageCurlAnimationIsRunning
{
  return self->_bookPageCurlAnimationIsRunning;
}

- (void)setBookPageCurlAnimationIsRunning:(BOOL)a3
{
  self->_bookPageCurlAnimationIsRunning = a3;
}

- (BOOL)bookPageSlideAnimationIsRunning
{
  return self->_bookPageSlideAnimationIsRunning;
}

- (void)setBookPageSlideAnimationIsRunning:(BOOL)a3
{
  self->_bookPageSlideAnimationIsRunning = a3;
}

- (BOOL)pagedToScrolledAnimationIsRunning
{
  return self->_pagedToScrolledAnimationIsRunning;
}

- (void)setPagedToScrolledAnimationIsRunning:(BOOL)a3
{
  self->_pagedToScrolledAnimationIsRunning = a3;
}

- (BOOL)pageScrollerAnimationIsRunning
{
  return self->_pageScrollerAnimationIsRunning;
}

- (void)setPageScrollerAnimationIsRunning:(BOOL)a3
{
  self->_pageScrollerAnimationIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryController, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_types, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end