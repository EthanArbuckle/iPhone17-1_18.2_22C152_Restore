@interface GTDownloadPoint
- (GTDownloadContext)downloadContext;
- (MTLCommandQueue)downloadQueue;
- (MTLSharedEvent)downloadEvent;
- (MTLSharedEvent)waitEvent;
- (unint64_t)downloadValue;
- (unint64_t)waitValue;
- (void)createContext:(apr_array_header_t *)a3;
- (void)setDownloadEvent:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setDownloadValue:(unint64_t)a3;
- (void)setWaitEvent:(id)a3;
- (void)setWaitValue:(unint64_t)a3;
@end

@implementation GTDownloadPoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->waitEvent, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->downloadEvent, 0);

  objc_storeStrong((id *)&self->_downloadContext, 0);
}

- (void)setWaitEvent:(id)a3
{
}

- (MTLSharedEvent)waitEvent
{
  return self->waitEvent;
}

- (void)setWaitValue:(unint64_t)a3
{
  self->waitValue = a3;
}

- (unint64_t)waitValue
{
  return self->waitValue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (MTLCommandQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadEvent:(id)a3
{
}

- (MTLSharedEvent)downloadEvent
{
  return self->downloadEvent;
}

- (void)setDownloadValue:(unint64_t)a3
{
  self->downloadValue = a3;
}

- (unint64_t)downloadValue
{
  return self->downloadValue;
}

- (GTDownloadContext)downloadContext
{
  return self->_downloadContext;
}

- (void)createContext:(apr_array_header_t *)a3
{
  v4 = [[GTDownloadContext alloc] initWithQueue:self->_downloadQueue forRequest:a3];
  downloadContext = self->_downloadContext;
  self->_downloadContext = v4;

  _objc_release_x1(v4, downloadContext);
}

@end