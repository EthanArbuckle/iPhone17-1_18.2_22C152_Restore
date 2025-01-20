@interface ICDCloudBadgeService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDCloudBadgeService)init;
- (OS_dispatch_queue)serialQueue;
- (id)badgeActionMetricsEventForIdentifier:(id)a3;
- (id)badgeActionMetricsEventPathForIdentifier:(id)a3;
- (id)createBag;
- (void)clearBadgeActionMetricsEventForIdentifier:(id)a3;
- (void)enqueueMetricsEvent:(id)a3;
- (void)reportAppIconBadgeActionMetrics;
- (void)storeBadgeActionMetricsEvent:(id)a3 identifier:(id)a4;
@end

@implementation ICDCloudBadgeService

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)reportAppIconBadgeActionMetrics
{
  v3 = [(ICDCloudBadgeService *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DD8B8;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = objc_msgSend(v5, "icd_isConnectionAllowedForService:", 7);
  if (v6)
  {
    unsigned int v7 = [v5 processIdentifier];
    if (v5) {
      [v5 auditToken];
    }
    v8 = MSVBundleIDForAuditToken();
    v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ICCloudReportBadgeActionRequest %p - XPC connection from %{public}@[%d]", buf, 0x1Cu);
    }

    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCloudBadgingProtocol];
    [v5 setExportedInterface:v10];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  return v6;
}

- (void)storeBadgeActionMetricsEvent:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(ICDCloudBadgeService *)self badgeActionMetricsEventPathForIdentifier:v7];
    if (!v8)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v21 = 0;
    v9 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v21];
    id v10 = v21;
    if (v10)
    {
      id v11 = v10;
      v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CloudBadgeService: failed to serialize action metrics event - error=%{public}@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v12 = [v8 path];
    id v20 = 0;
    unsigned int v13 = [v9 writeToFile:v12 options:1 error:&v20];
    id v11 = v20;
    if (v13)
    {
      __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v7;
        v15 = "CloudBadgeService: Stored %{public}@ badging action metrics event";
        __int16 v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
LABEL_12:
        uint32_t v19 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v19);
      }
    }
    else
    {
      __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
      BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (!v11)
      {
        if (!v18) {
          goto LABEL_14;
        }
        *(_WORD *)buf = 0;
        v15 = "CloudBadgeService: failed to store action metrics event without an error";
        __int16 v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 2;
        goto LABEL_13;
      }
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v11;
        v15 = "CloudBadgeService: failed to store action metrics event - error=%{public}@";
        __int16 v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
LABEL_17:
}

- (void)clearBadgeActionMetricsEventForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDCloudBadgeService *)self badgeActionMetricsEventPathForIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 path];
    v8 = +[NSFileManager defaultManager];
    unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

    if ((v9 & 1) == 0)
    {
      v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CloudBadgeService: No stored action metrics event", buf, 2u);
      }
      goto LABEL_16;
    }
    id v10 = +[NSFileManager defaultManager];
    id v19 = 0;
    unsigned int v11 = [v10 removeItemAtPath:v7 error:&v19];
    v12 = v19;

    if (v11)
    {
      unsigned int v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v4;
        __int16 v14 = "CloudBadgeService: Cleared %{public}@ badging action metrics event";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_13:
        uint32_t v18 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      unsigned int v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      BOOL v17 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v17)
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v4;
          __int16 v22 = 2114;
          id v23 = v12;
          __int16 v14 = "CloudBadgeService: failed to clear stored %{public}@ action metrics event - error=%{public}@";
          v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v18 = 22;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v18);
        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v4;
        __int16 v14 = "CloudBadgeService: failed to clear stored %{public}@ action metrics event without an error";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
    }

LABEL_16:
  }
}

- (void)enqueueMetricsEvent:(id)a3
{
  id v7 = a3;
  id v4 = [(ICDCloudBadgeService *)self createBag];
  id v5 = [objc_alloc((Class)AMSEngagement) initWithBag:v4];
  id v6 = [v5 enqueueData:v7];
}

- (id)badgeActionMetricsEventForIdentifier:(id)a3
{
  v3 = [(ICDCloudBadgeService *)self badgeActionMetricsEventPathForIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 path];
    id v14 = 0;
    id v6 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5 options:0 error:&v14];
    id v7 = v14;
    if (v6)
    {
      id v13 = 0;
      v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v13];
      id v9 = v13;

      if (v9)
      {
        id v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CloudBadgeService: failed to deserialize stored action metrics event - error=%{public}@", buf, 0xCu);
        }

        unsigned int v11 = 0;
      }
      else
      {
        v8 = v8;
        unsigned int v11 = v8;
      }
    }
    else
    {
      v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CloudBadgeService: Failed to read badge action metrics either because there are none, or the file is corrupt - error=%{public}@", buf, 0xCu);
      }
      unsigned int v11 = 0;
      id v9 = v7;
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CloudBadgeService: Failed to generate badge action path", buf, 2u);
    }
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)badgeActionMetricsEventPathForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = MSVMobileHomeDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"Library/Caches/com.apple.iTunesCloud/"];

  id v6 = [v3 stringByAppendingString:@"_badging_action_metric_event.plist"];

  id v7 = [v5 stringByAppendingPathComponent:v6];
  v8 = +[NSURL fileURLWithPath:v7];

  return v8;
}

- (id)createBag
{
  return +[AMSBag bagForProfile:@"Music" profileVersion:@"1"];
}

- (ICDCloudBadgeService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDCloudBadgeService;
  v2 = [(ICDCloudBadgeService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.ICCloudBadgeService.serial.queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end