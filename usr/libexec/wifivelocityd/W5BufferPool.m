@interface W5BufferPool
+ (id)sharedW5BufferPool;
- (NSDate)dateOfInvalidPoolBuffer;
- (NSMutableArray)bufferPool;
- (NSObject)lockBufferPool;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)semaphore;
- (id)getBufferFromPool;
- (id)getPairOfBuffersFromPool;
- (id)initBuffersWithSize:(unint64_t)a3 bufferCount:(unint64_t)a4;
- (unint64_t)bufferSize;
- (unint64_t)getCountOfAllocatedBuffers;
- (unint64_t)getCountOfInUseBuffers;
- (void)freeIdleBufferOfTimer:(id)a3;
- (void)returnBufferToPool:(id)a3;
- (void)setBufferPool:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setDateOfInvalidPoolBuffer:(id)a3;
- (void)setLockBufferPool:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation W5BufferPool

+ (id)sharedW5BufferPool
{
  if (qword_100103698 != -1) {
    dispatch_once(&qword_100103698, &stru_1000DDD08);
  }
  v2 = (void *)qword_100103690;

  return v2;
}

- (id)initBuffersWithSize:(unint64_t)a3 bufferCount:(unint64_t)a4
{
  v25.receiver = self;
  v25.super_class = (Class)W5BufferPool;
  v6 = [(W5BufferPool *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->_bufferSize = a3;
    uint64_t v8 = +[NSMutableArray array];
    bufferPool = v7->_bufferPool;
    v7->_bufferPool = (NSMutableArray *)v8;

    dispatch_semaphore_t v10 = dispatch_semaphore_create(a4);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v10;

    v12 = objc_alloc_init((Class)NSObject);
    lockBufferPool = v7->_lockBufferPool;
    v7->_lockBufferPool = v12;

    uint64_t v14 = +[NSDate distantFuture];
    dateOfInvalidPoolBuffer = v7->_dateOfInvalidPoolBuffer;
    v7->_dateOfInvalidPoolBuffer = (NSDate *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("BufferPool", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    for (; a4; --a4)
    {
      v19 = +[NSMutableDictionary dictionary];
      [v19 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"allocDate"];
      v20 = +[NSNull null];
      [v19 setObject:v20 forKeyedSubscript:@"allocdBuffer"];

      [v19 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateBorrowed"];
      [v19 setObject:v7->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateReturned"];
      v21 = +[NSNumber numberWithBool:0];
      [v19 setObject:v21 forKeyedSubscript:@"inUse"];

      v22 = +[NSNull null];
      [v19 setObject:v22 forKeyedSubscript:@"timer"];

      [(NSMutableArray *)v7->_bufferPool addObject:v19];
    }
  }
  else
  {
    v24 = sub_10009756C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      v27 = "-[W5BufferPool initBuffersWithSize:bufferCount:]";
      __int16 v28 = 2080;
      v29 = "W5BufferPool.m";
      __int16 v30 = 1024;
      int v31 = 76;
      _os_log_send_and_compose_impl();
    }
  }
  return v7;
}

- (void)freeIdleBufferOfTimer:(id)a3
{
  id v4 = a3;
  v29 = self;
  id obj = [(W5BufferPool *)self lockBufferPool];
  objc_sync_enter(obj);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v28 = self->_bufferPool;
  id v5 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v5)
  {
    uint64_t v30 = *(void *)v32;
    uint64_t v6 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v8 objectForKeyedSubscript:@"timer" v25, v26];
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v10 = v9 == v4;

        if (v10)
        {
          v11 = [v8 objectForKeyedSubscript:@"inUse"];
          unsigned int v12 = [v11 BOOLValue];

          uint64_t v6 = (uint64_t)[(NSMutableArray *)v29->_bufferPool indexOfObject:v8];
          v13 = [v8 objectForKeyedSubscript:@"lastDateReturned"];
          [v13 timeIntervalSinceNow];
          double v15 = v14;

          v16 = sub_10009756C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v17 = [v8 objectForKeyedSubscript:@"allocDate"];
            v18 = [v8 objectForKeyedSubscript:@"lastDateBorrowed"];
            v19 = [v8 objectForKeyedSubscript:@"lastDateReturned"];
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v36 = v12;
            *(_WORD *)&v36[4] = 2048;
            *(void *)&v36[6] = v6;
            __int16 v37 = 2112;
            v38 = v17;
            __int16 v39 = 2112;
            v40 = v18;
            __int16 v41 = 2112;
            v42 = v19;
            LODWORD(v26) = 48;
            objc_super v25 = buf;
            _os_log_send_and_compose_impl();
          }
          if (v15 >= -10.0) {
            char v20 = 1;
          }
          else {
            char v20 = v12;
          }
          if ((v20 & 1) == 0)
          {
            v21 = sub_10009756C();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v36 = v6;
              LODWORD(v26) = 12;
              objc_super v25 = buf;
              _os_log_send_and_compose_impl();
            }

            [v8 setObject:v29->_dateOfInvalidPoolBuffer forKeyedSubscript:@"allocDate"];
            v22 = +[NSNull null];
            [v8 setObject:v22 forKeyedSubscript:@"allocdBuffer"];

            [v8 setObject:v29->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateBorrowed"];
            [v8 setObject:v29->_dateOfInvalidPoolBuffer forKeyedSubscript:@"lastDateReturned"];
            v23 = +[NSNumber numberWithBool:0];
            [v8 setObject:v23 forKeyedSubscript:@"inUse"];
          }
        }
      }
      id v5 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0x7FFFFFFFLL;
  }

  v24 = sub_100099000();
  if (os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v36 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Allocated idx %lu", buf, 0xCu);
  }

  objc_sync_exit(obj);
}

- (id)getBufferFromPool
{
  id obj = [(W5BufferPool *)self lockBufferPool];
  objc_sync_enter(obj);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  __int16 v37 = self->_bufferPool;
  id v2 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v46;
    uint64_t v4 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v46 != v3) {
          objc_enumerationMutation(v37);
        }
        uint64_t v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v7 = [v6 objectForKeyedSubscript:@"inUse"];
        if ([v7 BOOLValue])
        {
        }
        else
        {
          uint64_t v8 = [v6 objectForKeyedSubscript:@"allocdBuffer"];
          id v9 = +[NSNull null];
          unsigned __int8 v10 = [v8 isEqual:v9];

          if ((v10 & 1) == 0)
          {
            uint64_t v4 = (uint64_t)[(NSMutableArray *)self->_bufferPool indexOfObject:v6];
            v11 = +[NSNumber numberWithBool:1];
            [v6 setObject:v11 forKeyedSubscript:@"inUse"];

            unsigned int v12 = +[NSDate date];
            [v6 setObject:v12 forKeyedSubscript:@"lastDateBorrowed"];

            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000273F0;
            block[3] = &unk_1000DD230;
            block[4] = v6;
            dispatch_sync(queue, block);
            double v14 = [v6 objectForKeyedSubscript:@"allocdBuffer"];
            if (v14) {
              goto LABEL_30;
            }
          }
        }
      }
      id v2 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFLL;
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  __int16 v37 = self->_bufferPool;
  id v15 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v41;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v37);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        v19 = [v18 objectForKeyedSubscript:@"inUse" v34, v35];
        if ([v19 BOOLValue])
        {
        }
        else
        {
          char v20 = [v18 objectForKeyedSubscript:@"allocdBuffer"];
          v21 = +[NSNull null];
          unsigned int v22 = [v20 isEqual:v21];

          if (v22)
          {
            uint64_t v4 = (uint64_t)[(NSMutableArray *)self->_bufferPool indexOfObject:v18];
            v23 = +[NSMutableData dataWithLength:self->_bufferSize];
            v24 = sub_100099000();
            if (os_signpost_enabled(v24))
            {
              *(_DWORD *)buf = 134217984;
              unint64_t v50 = v4;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Allocated idx %lu", buf, 0xCu);
            }

            objc_super v25 = sub_10009756C();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t bufferSize = self->_bufferSize;
              *(_DWORD *)buf = 134218240;
              unint64_t v50 = bufferSize;
              __int16 v51 = 2048;
              uint64_t v52 = v4;
              LODWORD(v35) = 22;
              long long v34 = buf;
              _os_log_send_and_compose_impl();
            }

            v27 = +[NSDate date];
            [v18 setObject:v27 forKeyedSubscript:@"allocDate"];

            [v18 setObject:v23 forKeyedSubscript:@"allocdBuffer"];
            __int16 v28 = [v18 objectForKeyedSubscript:@"allocDate"];
            [v18 setObject:v28 forKeyedSubscript:@"lastDateBorrowed"];

            v29 = +[NSNumber numberWithBool:1];
            [v18 setObject:v29 forKeyedSubscript:@"inUse"];

            uint64_t v30 = self->_queue;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1000274F4;
            v39[3] = &unk_1000DD230;
            v39[4] = v18;
            dispatch_sync(v30, v39);
            double v14 = [v18 objectForKeyedSubscript:@"allocdBuffer"];

            if (v14) {
              goto LABEL_30;
            }
          }
        }
      }
      id v15 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v15);
  }
  double v14 = 0;
LABEL_30:

  long long v31 = sub_100099000();
  if (os_signpost_enabled(v31))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v50 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Borrowed idx %lu", buf, 0xCu);
  }

  long long v32 = sub_10009756C();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v50 = v4;
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(obj);

  return v14;
}

- (id)getPairOfBuffersFromPool
{
  uint64_t v3 = [(W5BufferPool *)self semaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v4 = [(W5BufferPool *)self getBufferFromPool];
  id v5 = [(W5BufferPool *)self getBufferFromPool];
  v8[0] = v4;
  v8[1] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)returnBufferToPool:(id)a3
{
  id v4 = a3;
  id obj = [(W5BufferPool *)self lockBufferPool];
  objc_sync_enter(obj);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v23 = self->_bufferPool;
  uint64_t v5 = 0;
  id v6 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    uint64_t v8 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v23);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"allocdBuffer"];
        BOOL v12 = v11 == v4;

        if (v12)
        {
          uint64_t v8 = (uint64_t)[(NSMutableArray *)self->_bufferPool indexOfObject:v10];
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100027A80;
          block[3] = &unk_1000DD060;
          block[4] = v10;
          void block[5] = self;
          dispatch_sync(queue, block);
          double v14 = [v10 objectForKeyedSubscript:@"inUse"];
          [v14 BOOLValue];

          id v15 = +[NSNumber numberWithBool:0];
          [v10 setObject:v15 forKeyedSubscript:@"inUse"];

          uint64_t v16 = +[NSDate date];
          [v10 setObject:v16 forKeyedSubscript:@"lastDateReturned"];

          [v4 setLength:self->_bufferSize];
        }
        dispatch_queue_t v17 = [v10 objectForKeyedSubscript:@"inUse"];
        unsigned int v18 = [v17 BOOLValue];

        v5 += v18 ^ 1;
      }
      id v6 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFLL;
  }

  v19 = sub_100099000();
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5BufferPool Buffer", "Borrowed idx %lu", buf, 0xCu);
  }

  char v20 = sub_10009756C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v30 = v8;
    __int16 v31 = 2048;
    uint64_t v32 = v5;
    _os_log_send_and_compose_impl();
  }

  if (v5 == 2)
  {
    v21 = [(W5BufferPool *)self semaphore];
    dispatch_semaphore_signal(v21);
  }
  objc_sync_exit(obj);
}

- (unint64_t)getCountOfAllocatedBuffers
{
  id obj = [(W5BufferPool *)self lockBufferPool];
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v14 = self->_bufferPool;
  unint64_t v3 = 0;
  id v4 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v14);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 objectForKeyedSubscript:@"allocdBuffer" obj];

        id v9 = [v7 objectForKeyedSubscript:@"allocdBuffer"];
        unsigned __int8 v10 = +[NSNull null];
        unsigned int v11 = [v9 isEqual:v10];

        v3 += (v8 != 0) & ~v11;
      }
      id v4 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);
  return v3;
}

- (unint64_t)getCountOfInUseBuffers
{
  unint64_t v3 = [(W5BufferPool *)self lockBufferPool];
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_bufferPool;
  unint64_t v5 = 0;
  id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [[*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) objectForKeyedSubscript:@"inUse"]
        unsigned int v10 = [v9 BOOLValue];

        v5 += v10;
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v3);
  return v5;
}

- (NSMutableArray)bufferPool
{
  return self->_bufferPool;
}

- (void)setBufferPool:(id)a3
{
}

- (NSObject)lockBufferPool
{
  return self->_lockBufferPool;
}

- (void)setLockBufferPool:(id)a3
{
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_unint64_t bufferSize = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSDate)dateOfInvalidPoolBuffer
{
  return self->_dateOfInvalidPoolBuffer;
}

- (void)setDateOfInvalidPoolBuffer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dateOfInvalidPoolBuffer, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_lockBufferPool, 0);

  objc_storeStrong((id *)&self->_bufferPool, 0);
}

@end