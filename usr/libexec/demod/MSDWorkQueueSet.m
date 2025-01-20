@interface MSDWorkQueueSet
+ (id)sharedInstance;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)backgroundDownloadQueue;
- (OS_dispatch_queue)contentDownloadConcurrentQueue;
- (OS_dispatch_queue)demoUpdateQueue;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)pollingQueue;
- (void)setBackgroundDownloadQueue:(id)a3;
- (void)setContentDownloadConcurrentQueue:(id)a3;
- (void)setDemoUpdateQueue:(id)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPollingQueue:(id)a3;
@end

@implementation MSDWorkQueueSet

+ (id)sharedInstance
{
  if (qword_100189CC8 != -1) {
    dispatch_once(&qword_100189CC8, &stru_100153F78);
  }
  v2 = (void *)qword_100189CC0;

  return v2;
}

- (OS_dispatch_queue)demoUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDemoUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (OS_dispatch_queue)pollingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPollingQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundDownloadQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBackgroundDownloadQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)contentDownloadConcurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContentDownloadConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDownloadConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundDownloadQueue, 0);
  objc_storeStrong((id *)&self->_pollingQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_demoUpdateQueue, 0);
}

@end