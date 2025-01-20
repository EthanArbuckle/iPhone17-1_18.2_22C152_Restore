@interface SUBInstallationMonitor
+ (id)sharedInstallationMonitor;
- (BOOL)_installIntervalHasPassedSinceDate:(id)a3;
- (BOOL)didCheckInstallMarker;
- (NSDate)markerCreationDate;
- (NSUUID)activeDeviceUUID;
- (OS_dispatch_queue)queue;
- (SUBDescriptor)descriptor;
- (SUBInstallationMonitor)init;
- (double)installTimeout;
- (id)_installMarkerPath;
- (id)descriptorBeingInstalled;
- (void)gizmoDidBeginInstallingDescriptor:(id)a3;
- (void)gizmoUpdateCompleted;
- (void)setActiveDeviceUUID:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDidCheckInstallMarker:(BOOL)a3;
- (void)setInstallTimeout:(double)a3;
- (void)setMarkerCreationDate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUBInstallationMonitor

+ (id)sharedInstallationMonitor
{
  if (qword_100033D20 != -1) {
    dispatch_once(&qword_100033D20, &stru_10002D480);
  }
  v2 = (void *)qword_100033D18;
  return v2;
}

- (SUBInstallationMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUBInstallationMonitor;
  v2 = [(SUBInstallationMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SUBInstallationMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_installTimeout = 5400.0;
  }
  return v2;
}

- (id)_installMarkerPath
{
  v3 = [(SUBInstallationMonitor *)self getActiveDevice];
  dispatch_queue_t v4 = v3;
  activeDeviceUUID = self->_activeDeviceUUID;
  if (!activeDeviceUUID
    || ([v3 pairingID],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [(NSUUID *)activeDeviceUUID isEqual:v6],
        v6,
        (v7 & 1) == 0))
  {
    self->_didCheckInstallMarker = 0;
    v8 = [v4 pairingID];
    v9 = self->_activeDeviceUUID;
    self->_activeDeviceUUID = v8;
  }
  if (v4)
  {
    v10 = [v4 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 stringByAppendingPathComponent:@"gizmo-is-installing"];
    }
    else
    {
      v14 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "paired device exists, but no pairing path exists", v16, 2u);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "no active device exists", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

- (void)gizmoDidBeginInstallingDescriptor:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000129CC;
  v7[3] = &unk_10002D120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)gizmoUpdateCompleted
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D24;
  block[3] = &unk_10002CAE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_installIntervalHasPassedSinceDate:(id)a3
{
  if (!a3) {
    return 1;
  }
  v3 = [a3 dateByAddingTimeInterval:self->_installTimeout];
  id v4 = +[NSDate date];
  BOOL v5 = [v4 compare:v3] != (id)-1;

  return v5;
}

- (id)descriptorBeingInstalled
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100013114;
  v10 = sub_100013124;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001312C;
  v5[3] = &unk_10002D4A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)didCheckInstallMarker
{
  return self->_didCheckInstallMarker;
}

- (void)setDidCheckInstallMarker:(BOOL)a3
{
  self->_didCheckInstallMarker = a3;
}

- (SUBDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (NSDate)markerCreationDate
{
  return self->_markerCreationDate;
}

- (void)setMarkerCreationDate:(id)a3
{
}

- (NSUUID)activeDeviceUUID
{
  return self->_activeDeviceUUID;
}

- (void)setActiveDeviceUUID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)installTimeout
{
  return self->_installTimeout;
}

- (void)setInstallTimeout:(double)a3
{
  self->_installTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeDeviceUUID, 0);
  objc_storeStrong((id *)&self->_markerCreationDate, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end