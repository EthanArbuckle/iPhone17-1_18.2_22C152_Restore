@interface IMFileWatcherEntry
- (IMFileWatcherEntry)initWithQueue:(id)a3 andBlock:(id)a4;
- (NSOperationQueue)queue;
- (NSString)filePath;
- (id)block;
- (unint64_t)hash;
- (void)invalidate;
- (void)setFilePath:(id)a3;
@end

@implementation IMFileWatcherEntry

- (IMFileWatcherEntry)initWithQueue:(id)a3 andBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMFileWatcherEntry;
  v9 = [(IMFileWatcherEntry *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = [v8 copy];
    id block = v10->_block;
    v10->_id block = v11;
  }
  return v10;
}

- (void)invalidate
{
  self->_id block = 0;
  _objc_release_x1();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_filePath hash];
  unint64_t v4 = (unint64_t)[(NSOperationQueue *)self->_queue hash] ^ v3;
  return v4 ^ (unint64_t)[self->_block hash];
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

@end