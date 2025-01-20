@interface MBChunkStore
- (BOOL)getBatch:(id)a3 error:(id *)a4;
- (BOOL)isCancelled;
- (BOOL)isOpen;
- (BOOL)putBatch:(id)a3 error:(id *)a4;
- (BOOL)registerItem:(id)a3 error:(id *)a4;
- (MBChunkStore)init;
- (MBChunkStoreProgressModel)progressModel;
- (id)delegate;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)destroy;
- (void)getBatch:(id)a3 block:(id)a4;
- (void)open;
- (void)registerItems:(id)a3;
- (void)remove;
- (void)setDelegate:(id)a3;
- (void)uncancel;
@end

@implementation MBChunkStore

- (MBChunkStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBChunkStore;
  v2 = [(MBChunkStore *)&v4 init];
  if (v2) {
    v2->_progressModel = objc_alloc_init(MBChunkStoreProgressModel);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBChunkStore;
  [(MBChunkStore *)&v3 dealloc];
}

- (BOOL)isOpen
{
  return 0;
}

- (void)open
{
}

- (void)close
{
}

- (void)destroy
{
  self->_progressModel = 0;
}

- (void)remove
{
}

- (BOOL)registerItem:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)registerItems:(id)a3
{
  uint64_t v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (![(MBChunkStore *)self registerItem:v10 error:&v15])
        {
          if (!v15) {
            [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBChunkStore.m" lineNumber:59 description:@"Registering item silently failed"];
          }
          objc_msgSend(v10, "setError:");
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)getBatch:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)getBatch:(id)a3 block:(id)a4
{
  global_queue = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F9DBC;
  block[3] = &unk_1004165D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(global_queue, block);
}

- (BOOL)putBatch:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)uncancel
{
  self->_cancelled = 0;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (MBChunkStoreProgressModel)progressModel
{
  return self->_progressModel;
}

@end