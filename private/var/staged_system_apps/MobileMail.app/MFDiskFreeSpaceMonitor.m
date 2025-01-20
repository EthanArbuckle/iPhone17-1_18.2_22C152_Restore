@interface MFDiskFreeSpaceMonitor
+ (id)defaultMonitor;
- (BOOL)hasAdequateFreeSpace;
- (BOOL)isFreeSpaceCritical;
- (MFDiskFreeSpaceMonitor)init;
- (unint64_t)_retrieveFreeSpaceStatus:(id *)a3;
- (unint64_t)freeSpaceStatus;
- (void)getFreeSpaceStatusWithCompletionHandler:(id)a3;
- (void)handleDidPurgeSpace:(id)a3;
- (void)setFreeSpaceStatus:(unint64_t)a3;
@end

@implementation MFDiskFreeSpaceMonitor

+ (id)defaultMonitor
{
  if (qword_100699AA8 != -1) {
    dispatch_once(&qword_100699AA8, &stru_10060B550);
  }
  v2 = (void *)qword_100699AB0;

  return v2;
}

- (MFDiskFreeSpaceMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)MFDiskFreeSpaceMonitor;
  id v2 = [(MFDiskFreeSpaceMonitor *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilemail.diskCacheMonitor.freeSpaceStatusQueue", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = objc_alloc_init((Class)NSLock);
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    [*((id *)v2 + 3) setName:@"com.apple.mobilemail.diskCacheMonitor.freeSpaceStatusLock"];
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0, 0xDF8475800uLL, 0x2540BE400uLL);
    v10 = *((void *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100057D48;
    handler[3] = &unk_1006047A0;
    id v11 = v2;
    id v18 = v11;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v11 selector:"handleDidPurgeSpace:" name:off_100690940 object:0];

    *((unsigned char *)v11 + 32) = +[EMInternalPreferences preferenceEnabled:49];
    v13 = +[NSUserDefaults em_userDefaults];
    id v14 = [v13 integerForKey:EMUserDefaultSimulateDelayedFreeSpaceStatusTime];
    uint64_t v15 = 10;
    if (v14) {
      uint64_t v15 = (uint64_t)v14;
    }
    *((void *)v11 + 5) = v15;
  }
  return (MFDiskFreeSpaceMonitor *)v2;
}

- (void)getFreeSpaceStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  freeSpaceStatusQueue = self->_freeSpaceStatusQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002687C;
  v7[3] = &unk_100608690;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(freeSpaceStatusQueue, v7);
}

- (unint64_t)_retrieveFreeSpaceStatus:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_freeSpaceStatusQueue);
  v5 = +[MFDiskCacheUtilities systemSpaceWithError:a3];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"MFFileSystemFreeSize"];
    id v8 = v7;
    if (v7)
    {
      if ((unint64_t)[v7 longLongValue] >> 21 >= 0x4B) {
        unint64_t v9 = 1;
      }
      else {
        unint64_t v9 = 2;
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else
  {
    if (a3)
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [*a3 ef_publicDescription];
        sub_10045C800(v11, buf, v10);
      }
    }
    unint64_t v9 = 0;
  }
  v12 = +[NSUserDefaults em_userDefaults];
  unsigned int v13 = [v12 BOOLForKey:@"SimulateCriticalFreeSpaceStatus"];

  if (v13)
  {
    id v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Simulate critical free space is enabled: returning MFDiskFreeSpaceMonitorStatusCritical", (uint8_t *)&v18, 2u);
    }

    unint64_t v9 = 2;
  }
  if (self->_shouldDelayFreeSpace)
  {
    sleep(self->_freeSpaceStatusDelay);
    uint64_t v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int64_t freeSpaceStatusDelay = self->_freeSpaceStatusDelay;
      int v18 = 134217984;
      int64_t v19 = freeSpaceStatusDelay;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Simulate delayed free space is enabled: waiting %lu seconds before returning status", (uint8_t *)&v18, 0xCu);
    }
  }
  [(MFDiskFreeSpaceMonitor *)self setFreeSpaceStatus:v9];

  return v9;
}

- (void)setFreeSpaceStatus:(unint64_t)a3
{
  [(NSLock *)self->_freeSpaceStatusLock lock];
  if (self->_freeSpaceStatus == a3)
  {
    freeSpaceStatusLock = self->_freeSpaceStatusLock;
    [(NSLock *)freeSpaceStatusLock unlock];
  }
  else
  {
    self->_freeSpaceStatus = a3;
    [(NSLock *)self->_freeSpaceStatusLock unlock];
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"MFDiskFreeSpaceMonitorDidChangeNotification" object:self];
  }
}

- (unint64_t)freeSpaceStatus
{
  [(NSLock *)self->_freeSpaceStatusLock lock];
  unint64_t freeSpaceStatus = self->_freeSpaceStatus;
  [(NSLock *)self->_freeSpaceStatusLock unlock];
  return freeSpaceStatus;
}

- (BOOL)isFreeSpaceCritical
{
  return (id)[(MFDiskFreeSpaceMonitor *)self freeSpaceStatus] == (id)2;
}

- (BOOL)hasAdequateFreeSpace
{
  return (id)[(MFDiskFreeSpaceMonitor *)self freeSpaceStatus] != (id)2;
}

- (void)handleDidPurgeSpace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeSpaceStatusLock, 0);
  objc_storeStrong((id *)&self->_freeSpaceStatusTimerSource, 0);

  objc_storeStrong((id *)&self->_freeSpaceStatusQueue, 0);
}

@end