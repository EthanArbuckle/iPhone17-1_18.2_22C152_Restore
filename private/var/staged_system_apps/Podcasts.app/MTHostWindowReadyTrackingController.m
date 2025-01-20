@interface MTHostWindowReadyTrackingController
- (MTHostWindowReadyTrackingController)init;
- (void)_hostWindowDidBecomeReady;
- (void)performPendingBlocksIfReady;
- (void)runBlockWhenReady:(id)a3;
- (void)start;
@end

@implementation MTHostWindowReadyTrackingController

- (MTHostWindowReadyTrackingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTHostWindowReadyTrackingController;
  v2 = [(MTHostWindowReadyTrackingController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pendingBlocks = v2->_pendingBlocks;
    v2->_pendingBlocks = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)runBlockWhenReady:(id)a3
{
  if (a3)
  {
    pendingBlocks = self->_pendingBlocks;
    id v5 = objc_retainBlock(a3);
    [(NSMutableArray *)pendingBlocks addObject:v5];

    [(MTHostWindowReadyTrackingController *)self performPendingBlocksIfReady];
  }
}

- (void)start
{
  if (!self->_observing || self->_isReady)
  {
    self->_observing = 1;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_hostWindowDidBecomeReady" name:@"UISBHSMainHostWindowDidBecomeKeyNotification" object:0];
  }
}

- (void)_hostWindowDidBecomeReady
{
  self->_isReady = 1;
  self->_observing = 0;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"UISBHSMainHostWindowDidBecomeKeyNotification" object:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011764C;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)performPendingBlocksIfReady
{
  if (self->_isReady)
  {
    id v3 = [(NSMutableArray *)self->_pendingBlocks copy];
    [(NSMutableArray *)self->_pendingBlocks removeAllObjects];
    [v3 enumerateObjectsUsingBlock:&stru_100552088];
  }
}

- (void).cxx_destruct
{
}

@end