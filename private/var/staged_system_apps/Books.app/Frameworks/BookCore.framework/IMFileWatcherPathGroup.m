@interface IMFileWatcherPathGroup
- (BOOL)addEntry:(id)a3;
- (BOOL)setupSource;
- (IMFileWatcherPathGroup)initWithFilePath:(id)a3 targetQueue:(id)a4;
- (NSString)filePath;
- (unint64_t)numberOfEntries;
- (void)dealloc;
- (void)enqueueBlocksForEntries:(id)a3 withChange:(int)a4;
- (void)handleDeleteOrRename;
- (void)handleWrite;
- (void)invalidateEntries;
- (void)removeEntry:(id)a3;
- (void)teardown;
@end

@implementation IMFileWatcherPathGroup

- (IMFileWatcherPathGroup)initWithFilePath:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMFileWatcherPathGroup;
  v8 = [(IMFileWatcherPathGroup *)&v14 init];
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    entries = v8->_entries;
    v8->_entries = v9;

    v11 = (NSString *)[v6 copy];
    filePath = v8->_filePath;
    v8->_filePath = v11;

    objc_storeStrong((id *)&v8->_queue, a4);
    if (![(IMFileWatcherPathGroup *)v8 setupSource])
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMFileWatcherPathGroup;
  [(IMFileWatcherPathGroup *)&v2 dealloc];
}

- (BOOL)addEntry:(id)a3
{
  id v4 = a3;
  if (self->_source || [(IMFileWatcherPathGroup *)self setupSource])
  {
    v5 = [(IMFileWatcherPathGroup *)self filePath];
    [v4 setFilePath:v5];

    [(NSMutableSet *)self->_entries addObject:v4];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)removeEntry:(id)a3
{
  entries = self->_entries;
  id v5 = a3;
  [(NSMutableSet *)entries removeObject:v5];
  [v5 invalidate];

  if (![(NSMutableSet *)self->_entries count])
  {
    [(IMFileWatcherPathGroup *)self teardown];
  }
}

- (unint64_t)numberOfEntries
{
  return (unint64_t)[(NSMutableSet *)self->_entries count];
}

- (BOOL)setupSource
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_E62E0;
  v19[3] = &unk_2C8F68;
  v19[4] = self;
  v3 = objc_retainBlock(v19);
  id v4 = [(IMFileWatcherPathGroup *)self filePath];
  id v5 = ((void (*)(void *, void *))v3[2])(v3, v4);

  if (v5)
  {
    self->_watchingDirectory = 0;
LABEL_9:
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_E63DC;
    handler[3] = &unk_2C3AF8;
    v12 = v5;
    v17 = v12;
    v18 = self;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_activate(v12);
    source = self->_source;
    self->_source = (OS_dispatch_source *)v12;
    objc_super v14 = v12;

    BOOL v11 = 1;
    goto LABEL_10;
  }
  BOOL v6 = [(IMFileWatcherPathGroup *)self filePath];
  id v7 = [v6 stringByDeletingLastPathComponent];
  v8 = ((void (*)(void *, void *))v3[2])(v3, v7);

  if (v8)
  {
    v9 = [(IMFileWatcherPathGroup *)self filePath];
    id v5 = ((void (*)(void *, void *))v3[2])(v3, v9);

    if (v5)
    {
      dispatch_source_cancel(v8);
      BOOL v10 = 0;
    }
    else
    {
      id v5 = v8;
      BOOL v10 = 1;
    }
    self->_watchingDirectory = v10;

    goto LABEL_9;
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)teardown
{
  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    id v4 = self->_source;
    self->_source = 0;
  }
}

- (void)handleDeleteOrRename
{
  BOOL watchingDirectory = self->_watchingDirectory;
  [(IMFileWatcherPathGroup *)self teardown];
  if ([(IMFileWatcherPathGroup *)self setupSource])
  {
    if (self->_watchingDirectory)
    {
      if (watchingDirectory) {
        return;
      }
      entries = self->_entries;
      id v5 = self;
      uint64_t v6 = 2;
    }
    else
    {
      entries = self->_entries;
      id v5 = self;
      if (watchingDirectory) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 3;
      }
    }
    [(IMFileWatcherPathGroup *)v5 enqueueBlocksForEntries:entries withChange:v6];
  }
  else
  {
    [(IMFileWatcherPathGroup *)self invalidateEntries];
  }
}

- (void)handleWrite
{
  if (self->_watchingDirectory)
  {
    memset(&v9, 0, sizeof(v9));
    id v3 = [(IMFileWatcherPathGroup *)self filePath];
    int v4 = lstat((const char *)[v3 fileSystemRepresentation], &v9);

    if (v4 == -1)
    {
      if (*__error() != 2)
      {
        uint64_t v6 = [(IMFileWatcherPathGroup *)self filePath];
        id v7 = __error();
        v8 = strerror(*v7);
        NSLog(@"Unexpected error with lstat(\"%@\"): %s", v6, v8);
      }
    }
    else
    {
      [(IMFileWatcherPathGroup *)self teardown];
      if ([(IMFileWatcherPathGroup *)self setupSource])
      {
        if (!self->_watchingDirectory) {
          [(IMFileWatcherPathGroup *)self enqueueBlocksForEntries:self->_entries withChange:1];
        }
      }
      else
      {
        [(IMFileWatcherPathGroup *)self invalidateEntries];
      }
    }
  }
  else
  {
    entries = self->_entries;
    [(IMFileWatcherPathGroup *)self enqueueBlocksForEntries:entries withChange:3];
  }
}

- (void)invalidateEntries
{
  id v3 = [(NSMutableSet *)self->_entries copy];
  [(NSMutableSet *)self->_entries removeAllObjects];
  [(IMFileWatcherPathGroup *)self enqueueBlocksForEntries:v3 withChange:4];
  [v3 enumerateObjectsUsingBlock:&stru_2C8FA8];
}

- (void)enqueueBlocksForEntries:(id)a3 withChange:(int)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a3;
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        stat v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v10 = [v9 block];
        BOOL v11 = [v9 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_E6884;
        v14[3] = &unk_2C8FD0;
        int v16 = a4;
        v14[4] = v9;
        id v15 = v10;
        id v12 = v10;
        [v11 addOperationWithBlock:v14];
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end