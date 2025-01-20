@interface SUClientQueueSession
- (NSArray)downloadKinds;
- (SSDownloadManagerOptions)managerOptions;
- (SUClientQueueSession)initWithQueue:(id)a3;
- (id)queue;
- (int64_t)count;
- (void)dealloc;
- (void)setCount:(int64_t)a3;
- (void)setDownloadKinds:(id)a3;
- (void)setManagerOptions:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUClientQueueSession

- (void)setManagerOptions:(id)a3
{
}

- (SUClientQueueSession)initWithQueue:(id)a3
{
  v4 = [(SUClientQueueSession *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_count = 1;
    v4->_queue = a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUClientQueueSession;
  [(SUClientQueueSession *)&v3 dealloc];
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSArray)downloadKinds
{
  return self->_downloadKinds;
}

- (void)setDownloadKinds:(id)a3
{
}

- (SSDownloadManagerOptions)managerOptions
{
  return self->_managerOptions;
}

- (id)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

@end