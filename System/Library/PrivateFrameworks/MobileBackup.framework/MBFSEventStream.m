@interface MBFSEventStream
+ (BOOL)_verifyFSEventDatabase:(id)a3 device:(int)a4 error:(id *)a5;
- (BOOL)cancelled;
- (MBFSEventStream)initWithQueue:(id)a3 volumeMountPoint:(id)a4 databaseUUID:(id)a5 eventID:(unint64_t)a6 rootPathToMonitor:(id)a7 eventHandler:(id)a8;
- (NSDate)dateWhenCallbackWasFired;
- (NSString)databaseUUID;
- (NSString)rootPathToMonitor;
- (NSString)volumeMountPoint;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)eventQueue;
- (__FSEventStream)_startStreamWithError:(id *)a3;
- (__FSEventStream)streamRef;
- (id)eventHandler;
- (unint64_t)eventID;
- (void)_cancel;
- (void)_invalidateStreamRef;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
- (void)setDateWhenCallbackWasFired:(id)a3;
- (void)setGroup:(id)a3;
- (void)setStreamRef:(__FSEventStream *)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation MBFSEventStream

- (MBFSEventStream)initWithQueue:(id)a3 volumeMountPoint:(id)a4 databaseUUID:(id)a5 eventID:(unint64_t)a6 rootPathToMonitor:(id)a7 eventHandler:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MBFSEventStream;
  v18 = [(MBFSEventStream *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventQueue, a3);
    objc_storeStrong((id *)&v19->_volumeMountPoint, a4);
    objc_storeStrong((id *)&v19->_databaseUUID, a5);
    v19->_eventID = a6;
    objc_storeStrong((id *)&v19->_rootPathToMonitor, a7);
    id v20 = objc_retainBlock(v17);
    id eventHandler = v19->_eventHandler;
    v19->_id eventHandler = v20;

    v19->_cancelled = 0;
  }

  return v19;
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MBFSEventStream *)self eventQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002AE09C;
  v7[3] = &unk_1004124D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)cancel
{
  v3 = [(MBFSEventStream *)self eventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AE2F8;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_cancel
{
  v3 = [(MBFSEventStream *)self eventQueue];
  dispatch_assert_queue_V2(v3);

  [(MBFSEventStream *)self _invalidateStreamRef];
  group = [(MBFSEventStream *)self group];
  if (group) {
    dispatch_group_leave(group);
  }
  [(MBFSEventStream *)self setGroup:0];
}

- (__FSEventStream)_startStreamWithError:(id *)a3
{
  v5 = [(MBFSEventStream *)self eventQueue];
  dispatch_assert_queue_V2(v5);

  if (!a3) {
    __assert_rtn("-[MBFSEventStream _startStreamWithError:]", "MBFSEventStream.m", 84, "error");
  }
  memset(&v29, 0, sizeof(v29));
  id v6 = [(MBFSEventStream *)self volumeMountPoint];
  int v7 = stat((const char *)[v6 fileSystemRepresentation], &v29);

  if (v7)
  {
    uint64_t v8 = *__error();
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(MBFSEventStream *)self volumeMountPoint];
      LODWORD(buf.version) = 138412546;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
      WORD2(buf.info) = 1024;
      *(_DWORD *)((char *)&buf.info + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "stat failed for %@ %{errno}d", (uint8_t *)&buf, 0x12u);

      v28 = [(MBFSEventStream *)self volumeMountPoint];
      _MBLog();
    }
    v11 = [(MBFSEventStream *)self volumeMountPoint];
    *a3 = +[MBError errorWithErrno:v8 path:v11 format:@"stat failed"];

    return 0;
  }
  uint64_t st_dev = v29.st_dev;
  uint64_t v13 = objc_opt_class();
  v14 = [(MBFSEventStream *)self databaseUUID];
  LOBYTE(v13) = [(id)v13 _verifyFSEventDatabase:v14 device:st_dev error:a3];

  if ((v13 & 1) == 0)
  {
    id v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to verify FSEvents database", (uint8_t *)&buf, 2u);
      _MBLog();
    }

    return 0;
  }
  buf.version = 0;
  memset(&buf.retain, 0, 24);
  buf.info = self;
  id v15 = [(MBFSEventStream *)self rootPathToMonitor];
  v36 = v15;
  id v16 = FSEventStreamCreateRelativeToDevice(0, (FSEventStreamCallback)sub_1002AE920, &buf, st_dev, (CFArrayRef)+[NSArray arrayWithObjects:&v36 count:1], [(MBFSEventStream *)self eventID], 0.0, 1u);

  if (!v16)
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not create FSEvent stream", v30, 2u);
      _MBLog();
    }

    CFStringRef v27 = @"Failed to create FSEvent stream";
    goto LABEL_23;
  }
  id v17 = [(MBFSEventStream *)self eventQueue];
  FSEventStreamSetDispatchQueue(v16, v17);

  int v18 = FSEventStreamStart(v16);
  v19 = MBGetDefaultLog();
  id v20 = v19;
  if (!v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to start FSEvent stream", v30, 2u);
      _MBLog();
    }

    FSEventStreamRelease(v16);
    CFStringRef v27 = @"Failed to start FSEvent stream";
LABEL_23:
    +[MBError errorWithCode:1 format:v27];
    id v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v16;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(MBFSEventStream *)self volumeMountPoint];
    unint64_t v22 = [(MBFSEventStream *)self eventID];
    *(_DWORD *)v30 = 138543874;
    v31 = v21;
    __int16 v32 = 2048;
    unint64_t v33 = v22;
    __int16 v34 = 2048;
    v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Started collecting FSEvents for %{public}@ from FSEventId:%llu streamRef:%p", v30, 0x20u);

    id v23 = [(MBFSEventStream *)self volumeMountPoint];
    [(MBFSEventStream *)self eventID];
    _MBLog();
  }
  return v16;
}

+ (BOOL)_verifyFSEventDatabase:(id)a3 device:(int)a4 error:(id *)a5
{
  id v7 = a3;
  if (!a5) {
    __assert_rtn("+[MBFSEventStream _verifyFSEventDatabase:device:error:]", "MBFSEventStream.m", 128, "error");
  }
  uint64_t v8 = v7;
  CFUUIDRef v9 = FSEventsCopyUUIDForDevice(a4);
  if (v9)
  {
    CFUUIDRef v10 = v9;
    v11 = (__CFString *)CFUUIDCreateString(0, v9);
    CFRelease(v10);
    unsigned __int8 v12 = [(__CFString *)v11 isEqualToString:v8];
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)FSEventStreamContext buf = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "FSEvents database has changed %@ != %@", buf, 0x16u);
        _MBLog();
      }

      *a5 = +[MBError errorWithCode:4 format:@"Invalid FSEvents database"];
    }
  }
  else
  {
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)FSEventStreamContext buf = 67109120;
      LODWORD(v17) = a4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "FSEventsCopyUUIDForDevice returned nil for device:%d", buf, 8u);
      _MBLog();
    }

    +[MBError errorWithCode:4 format:@"FSEventsCopyUUIDFotDevice returned nil"];
    unsigned __int8 v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_invalidateStreamRef
{
  v3 = [(MBFSEventStream *)self streamRef];
  if (v3)
  {
    id v4 = v3;
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)FSEventStreamContext buf = 134218242;
      id v7 = v4;
      __int16 v8 = 2112;
      CFUUIDRef v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalidating the FSEvent stream %p %@", buf, 0x16u);
      _MBLog();
    }

    FSEventStreamStop(v4);
    FSEventStreamInvalidate(v4);
    FSEventStreamRelease(v4);
    [(MBFSEventStream *)self setStreamRef:0];
  }
}

- (NSDate)dateWhenCallbackWasFired
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDateWhenCallbackWasFired:(id)a3
{
}

- (__FSEventStream)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(__FSEventStream *)a3
{
  self->_streamRef = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (NSString)databaseUUID
{
  return self->_databaseUUID;
}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (NSString)rootPathToMonitor
{
  return self->_rootPathToMonitor;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_rootPathToMonitor, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_dateWhenCallbackWasFired, 0);
}

@end