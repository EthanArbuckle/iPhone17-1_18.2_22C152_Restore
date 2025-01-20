@interface MTNMSDefaultsUpdater
- (MTCoalescableWorkController)updatePodcastSizeEstimationWorkController;
- (MTNMSDefaultsUpdater)init;
- (MTPropertyChangeQueryObserver)downloadedQueryObserver;
- (NSMutableSet)existingDownloadedEpisodes;
- (OS_dispatch_queue)workQueue;
- (void)_onWorkQueueUpdatePodcastSizeEstimation;
- (void)setDownloadedQueryObserver:(id)a3;
- (void)setExistingDownloadedEpisodes:(id)a3;
- (void)setUpdatePodcastSizeEstimationWorkController:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startObservingDownloadedPodcastsChanges;
- (void)stopObservingDownloadedPodcastsChanges;
- (void)updatePodcastSizeEstimation;
@end

@implementation MTNMSDefaultsUpdater

- (MTNMSDefaultsUpdater)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTNMSDefaultsUpdater;
  v2 = [(MTNMSDefaultsUpdater *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MTNMSDefaultsUpdater", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)startObservingDownloadedPodcastsChanges
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109E00;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)stopObservingDownloadedPodcastsChanges
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A104;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updatePodcastSizeEstimation
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A1D0;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_onWorkQueueUpdatePodcastSizeEstimation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = [(MTNMSDefaultsUpdater *)self downloadedQueryObserver];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010A3AC;
  v4[3] = &unk_100550320;
  v4[4] = self;
  [v3 results:v4];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MTPropertyChangeQueryObserver)downloadedQueryObserver
{
  return self->_downloadedQueryObserver;
}

- (void)setDownloadedQueryObserver:(id)a3
{
}

- (NSMutableSet)existingDownloadedEpisodes
{
  return self->_existingDownloadedEpisodes;
}

- (void)setExistingDownloadedEpisodes:(id)a3
{
}

- (MTCoalescableWorkController)updatePodcastSizeEstimationWorkController
{
  return self->_updatePodcastSizeEstimationWorkController;
}

- (void)setUpdatePodcastSizeEstimationWorkController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePodcastSizeEstimationWorkController, 0);
  objc_storeStrong((id *)&self->_existingDownloadedEpisodes, 0);
  objc_storeStrong((id *)&self->_downloadedQueryObserver, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end