@interface StreamingFileWriterQueue
+ (id)sharedInstance;
- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4;
- (NSMutableArray)pendingOperations;
- (NSMutableDictionary)pendingOperationPathsByGroupPointer;
- (OS_dispatch_queue)fileWriterQueue;
- (StreamingFileWriterQueue)init;
- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6;
- (int64_t)maxPendingItemSize;
- (int64_t)maxPendingOperationSize;
- (int64_t)pendingOperationSize;
- (os_unfair_lock_s)pendingStateLock;
- (unint64_t)maxConcurrency;
- (unint64_t)runningOperationCount;
- (void)_runOperation:(id)a3;
- (void)setPendingOperationSize:(int64_t)a3;
- (void)setPendingStateLock:(os_unfair_lock_s)a3;
- (void)setRunningOperationCount:(unint64_t)a3;
@end

@implementation StreamingFileWriterQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingOperationPathsByGroupPointer, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);

  objc_storeStrong((id *)&self->_fileWriterQueue, 0);
}

- (void)setPendingStateLock:(os_unfair_lock_s)a3
{
  self->_pendingStateLock = a3;
}

- (os_unfair_lock_s)pendingStateLock
{
  return self->_pendingStateLock;
}

- (NSMutableDictionary)pendingOperationPathsByGroupPointer
{
  return self->_pendingOperationPathsByGroupPointer;
}

- (NSMutableArray)pendingOperations
{
  return self->_pendingOperations;
}

- (void)setRunningOperationCount:(unint64_t)a3
{
  self->_runningOperationCount = a3;
}

- (unint64_t)runningOperationCount
{
  return self->_runningOperationCount;
}

- (void)setPendingOperationSize:(int64_t)a3
{
  self->_pendingOperationSize = a3;
}

- (int64_t)pendingOperationSize
{
  return self->_pendingOperationSize;
}

- (unint64_t)maxConcurrency
{
  return self->_maxConcurrency;
}

- (int64_t)maxPendingItemSize
{
  return self->_maxPendingItemSize;
}

- (int64_t)maxPendingOperationSize
{
  return self->_maxPendingOperationSize;
}

- (OS_dispatch_queue)fileWriterQueue
{
  return self->_fileWriterQueue;
}

- (BOOL)insertAsyncFileOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 reservation];
  unsigned __int8 v8 = [v7 isValid];
  if (v8)
  {
    id v9 = [v7 reservedSize];
    [v7 setValid:0];
    v10 = [v6 trackingGroup];
    dispatch_group_enter(v10);
    v26 = [v6 path];
    os_unfair_lock_lock(&self->_pendingStateLock);
    unint64_t v11 = [(StreamingFileWriterQueue *)self runningOperationCount];
    unint64_t v12 = [(StreamingFileWriterQueue *)self maxConcurrency];
    unsigned __int8 v25 = v8;
    if (v11 >= v12)
    {
      id v24 = v9;
      v17 = [(StreamingFileWriterQueue *)self pendingOperations];
      [v17 addObject:v6];
      v18 = sub_100003830();
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134218240;
        id v30 = v24;
        __int16 v31 = 2048;
        id v32 = [v17 count];
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CONCURRENCY_LIMIT", "Added async operation for size %lld; queue count: %lu",
          buf,
          0x16u);
      }
    }
    else
    {
      [(StreamingFileWriterQueue *)self setRunningOperationCount:(char *)[(StreamingFileWriterQueue *)self runningOperationCount] + 1];
    }
    v19 = +[NSValue valueWithNonretainedObject:v10];
    v20 = [(StreamingFileWriterQueue *)self pendingOperationPathsByGroupPointer];
    v21 = [v20 objectForKeyedSubscript:v19];
    if (!v21)
    {
      v21 = objc_opt_new();
      [v20 setObject:v21 forKeyedSubscript:v19];
    }
    [v21 addObject:v26];

    os_unfair_lock_unlock(&self->_pendingStateLock);
    if (v11 < v12)
    {
      v22 = [(StreamingFileWriterQueue *)self fileWriterQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100011EF0;
      block[3] = &unk_100028BE8;
      block[4] = self;
      id v28 = v6;
      dispatch_group_async(v10, v22, block);
    }
    unsigned __int8 v8 = v25;
  }
  else
  {
    v13 = sub_100003788();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v30 = [v7 reservedSize];
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Rejecting insert of file operation because the reservation for size %llu was not valid", buf, 0xCu);
    }

    id v14 = [v7 reservedSize];
    v16 = sub_100004A7C((uint64_t)"-[StreamingFileWriterQueue insertAsyncFileOperation:error:]", 237, @"SZExtractorErrorDomain", 1, 0, 0, @"Rejecting insert of file operation because the reservation for size %llu was not valid", v15, (uint64_t)v14);
    v10 = v16;
    if (a4)
    {
      v10 = v16;
      *a4 = v10;
    }
  }

  return v8;
}

- (void)_runOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 reservation];
  id v6 = [v5 reservedSize];

  v7 = [v4 path];
  unsigned __int8 v8 = [v4 trackingGroup];
  [v4 executeAsyncOperation];

  dispatch_group_leave(v8);
  os_unfair_lock_lock(&self->_pendingStateLock);
  [(StreamingFileWriterQueue *)self setPendingOperationSize:(unsigned char *)[(StreamingFileWriterQueue *)self pendingOperationSize] - v6];
  id v9 = +[NSValue valueWithNonretainedObject:v8];
  v10 = [(StreamingFileWriterQueue *)self pendingOperationPathsByGroupPointer];
  unint64_t v11 = [v10 objectForKeyedSubscript:v9];
  unint64_t v12 = v11;
  if (v11)
  {
    [v11 removeObject:v7];
    if (![v12 count]) {
      [v10 removeObjectForKey:v9];
    }
  }
  else
  {
    v13 = sub_100003788();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "No pending operation paths found for group %@ when trying to remove path %@", buf, 0x16u);
    }
  }
  id v14 = [(StreamingFileWriterQueue *)self pendingOperations];
  if ([v14 count])
  {
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    [v14 removeObjectAtIndex:0];
  }
  else
  {
    [(StreamingFileWriterQueue *)self setRunningOperationCount:(char *)[(StreamingFileWriterQueue *)self runningOperationCount] - 1];
    uint64_t v15 = 0;
  }

  os_unfair_lock_unlock(&self->_pendingStateLock);
  if (v15)
  {
    v16 = [v15 trackingGroup];
    v17 = [(StreamingFileWriterQueue *)self fileWriterQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000121B4;
    v18[3] = &unk_100028BE8;
    v18[4] = self;
    id v19 = v15;
    dispatch_group_async(v16, v17, v18);
  }
}

- (id)reserveAsyncOperationForFileSize:(int64_t)a3 path:(id)a4 group:(id)a5 operationPendingForPath:(BOOL *)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([(StreamingFileWriterQueue *)self maxPendingItemSize] >= a3)
  {
    BOOL v12 = a3 >= 0;
  }
  else
  {
    unint64_t v11 = sub_100003830();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2048;
      int64_t v28 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FILE_TOO_BIG", "Too large for async: %@ size %lld", buf, 0x16u);
    }

    BOOL v12 = 0;
  }
  v13 = +[NSValue valueWithNonretainedObject:v10];
  os_unfair_lock_lock(&self->_pendingStateLock);
  id v14 = [(StreamingFileWriterQueue *)self pendingOperationPathsByGroupPointer];
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    unsigned int v16 = [v15 containsObject:v9];
    if (!v12)
    {
LABEL_11:

      os_unfair_lock_unlock(&self->_pendingStateLock);
      int v18 = 0;
      id v19 = 0;
      if (!v16) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unsigned int v16 = 0;
    if (!v12) {
      goto LABEL_11;
    }
  }
  v17 = (char *)[(StreamingFileWriterQueue *)self pendingOperationSize] + a3;
  if ((uint64_t)v17 > [(StreamingFileWriterQueue *)self maxPendingOperationSize]) {
    goto LABEL_11;
  }
  [(StreamingFileWriterQueue *)self setPendingOperationSize:v17];

  os_unfair_lock_unlock(&self->_pendingStateLock);
  v20 = sub_100003830();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v9;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2048;
    id v30 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_FILE_RESERVED", "Async op reserved for %@ size %lld (cur total: %lld)", buf, 0x20u);
  }

  id v19 = [[StreamingFileWriterQueueReservation alloc] initWithReservationSize:a3];
  int v18 = 1;
  if (v16)
  {
LABEL_16:
    v21 = sub_100003830();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_OP_EXISTS", "Async op exists for %@", buf, 0xCu);
    }
  }
LABEL_19:
  if (((v18 | !v12) & 1) == 0)
  {
    __int16 v22 = sub_100003830();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2048;
      int64_t v28 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_FILE_QUEUE_FULL", "Insufficient buffer avilable for %@ size %lld", buf, 0x16u);
    }
  }
  *a6 = v16;

  return v19;
}

- (StreamingFileWriterQueue)init
{
  v26.receiver = self;
  v26.super_class = (Class)StreamingFileWriterQueue;
  v2 = [(StreamingFileWriterQueue *)&v26 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StreamingZip.StreamingFileWriterQueue", v3);
    fileWriterQueue = v2->_fileWriterQueue;
    v2->_fileWriterQueue = (OS_dispatch_queue *)v4;

    v2->_pendingOperationSize = 0;
    v2->_runningOperationCount = 0;
    uint64_t v6 = objc_opt_new();
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    pendingOperationPathsByGroupPointer = v2->_pendingOperationPathsByGroupPointer;
    v2->_pendingOperationPathsByGroupPointer = (NSMutableDictionary *)v8;

    v2->_pendingStateLock._os_unfair_lock_opaque = 0;
    id v10 = +[NSUserDefaults standardUserDefaults];
    uint64_t v11 = (uint64_t)[v10 integerForKey:@"MaxAsyncOperationSize"];

    BOOL v12 = sub_100003788();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 < 1)
    {
      if (!v13)
      {
        uint64_t v11 = 10485760;
LABEL_9:

        v2->_maxPendingOperationSize = v11;
        uint64_t v15 = +[NSUserDefaults standardUserDefaults];
        uint64_t v16 = (uint64_t)[v15 integerForKey:@"MaxAsyncItemSize"];

        v17 = sub_100003788();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16 < 1)
        {
          if (!v18)
          {
            uint64_t v16 = 0x200000;
LABEL_16:

            v2->_maxPendingItemSize = v16;
            v20 = +[NSUserDefaults standardUserDefaults];
            uint64_t v21 = (uint64_t)[v20 integerForKey:@"MaxConcurrency"];

            __int16 v22 = sub_100003788();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v21 < 1)
            {
              if (!v23)
              {
                uint64_t v21 = 4;
                goto LABEL_23;
              }
              *(_DWORD *)buf = 134217984;
              uint64_t v21 = 4;
              uint64_t v28 = 4;
              id v24 = "Max concurrency is %lu";
            }
            else
            {
              if (!v23)
              {
LABEL_23:

                v2->_maxConcurrency = v21;
                return v2;
              }
              *(_DWORD *)buf = 134217984;
              uint64_t v28 = v21;
              id v24 = "Overriding max concurrency to %lu";
            }
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
            goto LABEL_23;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v16 = 0x200000;
          uint64_t v28 = 0x200000;
          id v19 = "Max async item size limit is %lld";
        }
        else
        {
          if (!v18) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 134217984;
          uint64_t v28 = v16;
          id v19 = "Overriding max async item size limit to %lld";
        }
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = 10485760;
      uint64_t v28 = 10485760;
      id v14 = "Max async operation size limit is %lld";
    }
    else
    {
      if (!v13) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v11;
      id v14 = "Overriding max async operation size limit to %lld";
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_9;
  }
  return v2;
}

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!qword_10002F3C0)
  {
    id v3 = objc_alloc_init((Class)v2);
    dispatch_queue_t v4 = (void *)qword_10002F3C0;
    qword_10002F3C0 = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)qword_10002F3C0;

  return v5;
}

@end