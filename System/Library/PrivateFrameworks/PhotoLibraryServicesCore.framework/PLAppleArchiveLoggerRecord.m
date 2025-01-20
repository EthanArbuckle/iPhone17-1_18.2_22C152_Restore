@interface PLAppleArchiveLoggerRecord
- (NSURL)url;
- (PFAppleArchiveLogger)logger;
- (PLAppleArchiveLoggerRecord)initWithURL:(id)a3 logger:(id)a4;
- (int)refCount;
- (unint64_t)autoFlushCounter;
- (void)setAutoFlushCounter:(unint64_t)a3;
- (void)setRefCount:(int)a3;
@end

@implementation PLAppleArchiveLoggerRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (PFAppleArchiveLogger)logger
{
  return (PFAppleArchiveLogger *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAutoFlushCounter:(unint64_t)a3
{
  self->_autoFlushCounter = a3;
}

- (unint64_t)autoFlushCounter
{
  return self->_autoFlushCounter;
}

- (void)setRefCount:(int)a3
{
  self->_refCount = a3;
}

- (int)refCount
{
  return self->_refCount;
}

- (PLAppleArchiveLoggerRecord)initWithURL:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAppleArchiveLoggerRecord;
  v8 = [(PLAppleArchiveLoggerRecord *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_logger, a4);
    v8->_refCount = 0;
  }

  return v8;
}

@end