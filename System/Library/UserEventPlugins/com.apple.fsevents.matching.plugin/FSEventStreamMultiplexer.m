@interface FSEventStreamMultiplexer
- (BOOL)unregisterClient:(int)a3;
- (FSEventStreamMultiplexer)init;
- (FSEventStreamMultiplexer)initWithLogHandle:(id)a3;
- (NSArray)pathsWatched;
- (NSMutableDictionary)clients;
- (NSMutableDictionary)pathToClientsMap;
- (NSString)streamState;
- (OS_dispatch_queue)queue;
- (OS_os_log)logHandle;
- (__FSEventStream)eventStream;
- (id)_copyResolvedPathToClientsMap;
- (id)summary;
- (int)nextAvailableID;
- (int)registerClient:(id)a3 ofPaths:(id)a4 withCallback:(id)a5;
- (unsigned)eventStreamCreateFlags;
- (void)_handleStream:(__FSEventStream *)a3 numEvents:(unint64_t)a4 eventPaths:(const char *)a5 eventFlags:(const unsigned int *)a6 eventIds:(const unint64_t *)a7;
- (void)_refreshStream;
- (void)dealloc;
- (void)setEventStream:(__FSEventStream *)a3;
- (void)setEventStreamCreateFlags:(unsigned int)a3;
- (void)setNextAvailableID:(int)a3;
- (void)setStreamState:(id)a3;
@end

@implementation FSEventStreamMultiplexer

- (id)_copyResolvedPathToClientsMap
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v3)
  {
    v21 = [(FSEventStreamMultiplexer *)self logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_58BC();
    }
    goto LABEL_12;
  }
  CFArrayRef v4 = FSEventStreamCopyPathsBeingWatchedWrapper([(FSEventStreamMultiplexer *)self eventStream]);
  if (!v4)
  {
    v21 = [(FSEventStreamMultiplexer *)self logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_58F0();
    }
LABEL_12:

    CFArrayRef v5 = 0;
LABEL_16:
    id v20 = 0;
    goto LABEL_17;
  }
  CFArrayRef v5 = v4;
  id v6 = [(__CFArray *)v4 count];
  v7 = [(FSEventStreamMultiplexer *)self pathsWatched];
  id v8 = [v7 count];

  if (v6 != v8)
  {
    v22 = [(FSEventStreamMultiplexer *)self logHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_5924();
    }

    goto LABEL_16;
  }
  v9 = [(FSEventStreamMultiplexer *)self pathsWatched];
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      v13 = [(FSEventStreamMultiplexer *)self pathsWatched];
      v14 = [v13 objectAtIndexedSubscript:v11];

      v15 = [(__CFArray *)v5 objectAtIndexedSubscript:v11];
      v16 = [(FSEventStreamMultiplexer *)self pathToClientsMap];
      v17 = [v16 objectForKeyedSubscript:v14];
      [v3 setObject:v17 forKeyedSubscript:v15];

      ++v11;
      v18 = [(FSEventStreamMultiplexer *)self pathsWatched];
      id v19 = [v18 count];
    }
    while (v11 < (unint64_t)v19);
  }
  id v20 = [objc_alloc((Class)NSDictionary) initWithDictionary:v3];
LABEL_17:

  return v20;
}

- (NSArray)pathsWatched
{
  v2 = [(FSEventStreamMultiplexer *)self pathToClientsMap];
  id v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSMutableDictionary)pathToClientsMap
{
  return self->_pathToClientsMap;
}

- (void)_handleStream:(__FSEventStream *)a3 numEvents:(unint64_t)a4 eventPaths:(const char *)a5 eventFlags:(const unsigned int *)a6 eventIds:(const unint64_t *)a7
{
  id v8 = a5;
  unint64_t v9 = a4;
  unint64_t v11 = [(FSEventStreamMultiplexer *)self queue];
  dispatch_assert_queue_V2(v11);

  if ((*(unsigned char *)a6 & 0x10) == 0)
  {
    id v12 = objc_alloc_init((Class)NSMutableSet);
    id v13 = [(FSEventStreamMultiplexer *)self _copyResolvedPathToClientsMap];
    if (v9)
    {
      uint64_t v14 = 0;
      unint64_t v39 = v9;
      v40 = v8;
      do
      {
        v16 = v15;
        if (v8 && v8[v14])
        {
          v42 = v15;
          v17 = [objc_alloc((Class)NSString) initWithCString:v8[v14] encoding:4];
          v18 = [(FSEventStreamMultiplexer *)self logHandle];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v17;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Received FSEvent about %{public}@", buf, 0xCu);
          }

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v41 = v17;
          id v19 = [v17 pathComponents];
          id v20 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v48;
            v23 = &stru_89B8;
            do
            {
              v24 = 0;
              v25 = v23;
              do
              {
                if (*(void *)v48 != v22) {
                  objc_enumerationMutation(v19);
                }
                v23 = [(__CFString *)v25 stringByAppendingPathComponent:*(void *)(*((void *)&v47 + 1) + 8 * (void)v24)];

                v26 = [v13 objectForKeyedSubscript:v23];

                if (v26)
                {
                  v27 = [v13 objectForKeyedSubscript:v23];
                  [v12 unionSet:v27];
                }
                v24 = (char *)v24 + 1;
                v25 = v23;
              }
              while (v21 != v24);
              id v21 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
            }
            while (v21);
          }
          else
          {
            v23 = &stru_89B8;
          }

          unint64_t v9 = v39;
          id v8 = v40;
          v28 = v41;
          v16 = v42;
        }
        else
        {
          v28 = [(FSEventStreamMultiplexer *)self logHandle];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_5958(&v51, v52, v28);
          }
        }

        ++v14;
      }
      while (v14 != v9);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = v12;
    id v30 = [v29 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v44;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v35 = [v34 callback];

          if (v35)
          {
            v36 = [(FSEventStreamMultiplexer *)self logHandle];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = [v34 name];
              *(_DWORD *)buf = 138543362;
              v56 = v37;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Notifying client '%{public}@'", buf, 0xCu);
            }
            v38 = [v34 callback];
            v38[2]();
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v31);
    }
  }
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (__FSEventStream)eventStream
{
  return self->_eventStream;
}

- (FSEventStreamMultiplexer)initWithLogHandle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FSEventStreamMultiplexer;
  id v6 = [(FSEventStreamMultiplexer *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_nextAvailableID = 0;
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UserEventAgent.fsevents.FSEventStreamMultiplexer", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    unint64_t v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v7->_clients;
    v7->_clients = v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pathToClientsMap = v7->_pathToClientsMap;
    v7->_pathToClientsMap = v13;

    v7->_eventStreamCreateFlags = 0;
    v7->_eventStream = 0;
    objc_storeStrong((id *)&v7->_logHandle, a3);
    v7->_streamState = (NSString *)@"not created";
  }

  return v7;
}

- (FSEventStreamMultiplexer)init
{
  return [(FSEventStreamMultiplexer *)self initWithLogHandle:&_os_log_default];
}

- (int)registerClient:(id)a3 ofPaths:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = -1;
  unint64_t v11 = [(FSEventStreamMultiplexer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4B84;
  block[3] = &unk_87F0;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = &v21;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, block);

  LODWORD(v10) = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v21, 8);
  return (int)v10;
}

- (BOOL)unregisterClient:(int)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(FSEventStreamMultiplexer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F70;
  block[3] = &unk_8818;
  int v8 = a3;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

- (id)summary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  CFArrayRef v4 = [(FSEventStreamMultiplexer *)self streamState];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  id v5 = +[NSNumber numberWithUnsignedInt:[(FSEventStreamMultiplexer *)self eventStreamCreateFlags]];
  [v3 setObject:v5 forKeyedSubscript:@"flags"];

  id v6 = [(FSEventStreamMultiplexer *)self streamState];

  if (v6 != @"not created")
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v8 = [(FSEventStreamMultiplexer *)self clients];
    uint64_t v9 = [v8 allValues];

    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) name];
          [v7 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v15 = [v7 sortedArrayUsingSelector:"compare:"];
    [v3 setObject:v15 forKeyedSubscript:@"clients"];

    objc_super v16 = [(FSEventStreamMultiplexer *)self pathsWatched];
    id v17 = [v16 sortedArrayUsingSelector:"compare:"];
    [v3 setObject:v17 forKeyedSubscript:@"paths"];
  }
  id v18 = [v3 copy];

  return v18;
}

- (void)_refreshStream
{
  FSEventStreamEventId CurrentEventIdWrapper = FSEventsGetCurrentEventIdWrapper();
  CFArrayRef v4 = [(FSEventStreamMultiplexer *)self queue];
  dispatch_assert_queue_V2(v4);

  v13.version = 0;
  memset(&v13.retain, 0, 24);
  v13.info = self;
  eventStream = self->_eventStream;
  if (eventStream)
  {
    FSEventStreamEventId CurrentEventIdWrapper = FSEventStreamGetLatestEventIdWrapper(eventStream);
    FSEventStreamStopWrapper(self->_eventStream);
    FSEventStreamInvalidateWrapper(self->_eventStream);
    FSEventStreamReleaseWrapper(self->_eventStream);
    self->_eventStream = 0;
    [(FSEventStreamMultiplexer *)self setStreamState:@"stopped", *(_OWORD *)&v13.version, *(_OWORD *)&v13.retain, v13.copyDescription];
  }
  id v6 = [(FSEventStreamMultiplexer *)self clients];
  id v7 = [v6 count];

  if (v7)
  {
    CFArrayRef v8 = [(FSEventStreamMultiplexer *)self pathsWatched];
    self->_eventStream = FSEventStreamCreateWrapper(kCFAllocatorDefault, (FSEventStreamCallback)sub_3498, &v13, v8, CurrentEventIdWrapper, 0.1, [(FSEventStreamMultiplexer *)self eventStreamCreateFlags]);

    if (self->_eventStream)
    {
      [(FSEventStreamMultiplexer *)self setStreamState:@"created"];
      uint64_t v9 = self->_eventStream;
      id v10 = [(FSEventStreamMultiplexer *)self queue];
      FSEventStreamSetDispatchQueueWrapper(v9, v10);

      if (FSEventStreamStartWrapper(self->_eventStream))
      {
        [(FSEventStreamMultiplexer *)self setStreamState:@"started"];
      }
      else
      {
        [(FSEventStreamMultiplexer *)self setStreamState:@"FAILED TO START"];
        uint64_t v12 = [(FSEventStreamMultiplexer *)self logHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_5A14(self);
        }

        FSEventStreamReleaseWrapper(self->_eventStream);
        self->_eventStream = 0;
      }
    }
    else
    {
      [(FSEventStreamMultiplexer *)self setStreamState:@"FAILED TO CREATE"];
      id v11 = [(FSEventStreamMultiplexer *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_5998(self);
      }
    }
  }
}

- (void)dealloc
{
  eventStream = self->_eventStream;
  if (eventStream)
  {
    FSEventStreamStopWrapper(eventStream);
    FSEventStreamInvalidateWrapper(self->_eventStream);
    FSEventStreamReleaseWrapper(self->_eventStream);
  }
  v4.receiver = self;
  v4.super_class = (Class)FSEventStreamMultiplexer;
  [(FSEventStreamMultiplexer *)&v4 dealloc];
}

- (unsigned)eventStreamCreateFlags
{
  return self->_eventStreamCreateFlags;
}

- (void)setEventStreamCreateFlags:(unsigned int)a3
{
  self->_eventStreamCreateFlags = a3;
}

- (int)nextAvailableID
{
  return self->_nextAvailableID;
}

- (void)setNextAvailableID:(int)a3
{
  self->_nextAvailableID = a3;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setEventStream:(__FSEventStream *)a3
{
  self->_eventStream = a3;
}

- (NSString)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(id)a3
{
  self->_streamState = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToClientsMap, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end