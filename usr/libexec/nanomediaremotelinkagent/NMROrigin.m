@interface NMROrigin
+ (id)_transientOriginWithEndpointRoute:(id)a3;
- (BOOL)isCompanion;
- (BOOL)isLocal;
- (MPAVRoute)route;
- (NMROrigin)init;
- (NMROrigin)initWithOrigin:(void *)a3 deviceInfo:(void *)a4;
- (NMROrigin)initWithRoute:(id)a3;
- (NSNumber)uniqueIdentifier;
- (NSString)deviceIdentifier;
- (NSString)displayName;
- (id)description;
- (id)playerPathWithBundleID:(id)a3 playerID:(id)a4;
- (int64_t)logicalDeviceCount;
- (unint64_t)connectionState;
- (unint64_t)type;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_handleRouteConnectionDidConnectNotification:(id)a3;
- (void)_handleRouteConnectionDidInvalidateNotification:(id)a3;
- (void)_updateConnectionState;
- (void)dealloc;
- (void)deviceInfo;
- (void)mediaRemoteOrigin;
- (void)updateOrigin:(void *)a3 deviceInfo:(void *)a4;
- (void)updateRoute:(id)a3;
@end

@implementation NMROrigin

- (NMROrigin)init
{
  v10.receiver = self;
  v10.super_class = (Class)NMROrigin;
  v2 = [(NMROrigin *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoMediaRemote.Origin", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleRouteConnectionDidConnectNotification:" name:_MPAVRouteConnectionDidConnectNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleRouteConnectionDidInvalidateNotification:" name:_MPAVRouteConnectionDidInvalidateNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_handleExternalDeviceConnectionStateDidChangeNotification:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:0];
  }
  return v2;
}

- (NMROrigin)initWithRoute:(id)a3
{
  id v5 = a3;
  v6 = [(NMROrigin *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v7->_connectionState = 2;
    [(NMROrigin *)v7 _updateConnectionState];
  }

  return v7;
}

- (NMROrigin)initWithOrigin:(void *)a3 deviceInfo:(void *)a4
{
  id v5 = [(NMROrigin *)self init];
  if (v5)
  {
    v5->_mediaRemoteOrigin = (void *)CFRetain(a3);
    uint64_t Copy = MRPairedDeviceCreateCopy();
    v5->_connectionState = 2;
    v5->_deviceInfo = (void *)Copy;
    [(NMROrigin *)v5 _updateConnectionState];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    CFRelease(deviceInfo);
  }
  mediaRemoteOrigin = self->_mediaRemoteOrigin;
  if (mediaRemoteOrigin) {
    CFRelease(mediaRemoteOrigin);
  }
  v6.receiver = self;
  v6.super_class = (Class)NMROrigin;
  [(NMROrigin *)&v6 dealloc];
}

- (MPAVRoute)route
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001A900;
  objc_super v10 = sub_10001A910;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A918;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPAVRoute *)v3;
}

- (void)mediaRemoteOrigin
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A9D8;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (void *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)type
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AAC4;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)connectionState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 2;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AD44;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)deviceIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001A900;
  objc_super v10 = sub_10001A910;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AE48;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)displayName
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001A900;
  objc_super v10 = sub_10001A910;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B038;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSNumber)uniqueIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001A900;
  objc_super v10 = sub_10001A910;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B21C;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

- (BOOL)isLocal
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B33C;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCompanion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B43C;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)logicalDeviceCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B538;
  v5[3] = &unk_100044E28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateRoute:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B660;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)updateOrigin:(void *)a3 deviceInfo:(void *)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B73C;
  block[3] = &unk_100045220;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (id)description
{
  int64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(NMROrigin *)self displayName];
  id v6 = [(NMROrigin *)self deviceIdentifier];
  v7 = [(NMROrigin *)self uniqueIdentifier];
  id v8 = +[NSString stringWithFormat:@"<%@:%p displayName: %@, deviceIdentifier: %@, originIdentifier: %@, type: %lu>", v4, self, v5, v6, v7, [(NMROrigin *)self type]];

  return v8;
}

- (id)playerPathWithBundleID:(id)a3 playerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10001A900;
  v17 = sub_10001A910;
  id v18 = 0;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001BB90;
  v12[3] = &unk_100044E00;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(queue, v12);
  uint64_t v9 = v14[5];
  if (v9)
  {
    objc_super v10 = +[MPCPlayerPath pathWithRoute:v9 bundleID:v6 playerID:v7];
  }
  else
  {
    objc_super v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)_handleRouteConnectionDidConnectNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BC3C;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleRouteConnectionDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BD54;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BE6C;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

+ (id)_transientOriginWithEndpointRoute:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 initWithRoute:v4];
  }
  else
  {
    id v8 = +[MPAVRoutingController systemRoute];
    id v7 = [v6 initWithRoute:v8];
  }

  return v7;
}

- (void)_updateConnectionState
{
  route = self->_route;
  if (route)
  {
    id v4 = [(MPAVRoute *)route connection];
    unsigned __int8 v5 = [v4 isInvalidated];

    if (v5)
    {
LABEL_3:
      unint64_t v6 = 2;
      goto LABEL_11;
    }
    id v7 = [(MPAVRoute *)self->_route connection];
    if ([v7 isConnected])
    {

LABEL_10:
      unint64_t v6 = 1;
      goto LABEL_11;
    }
    unsigned __int8 v8 = [(MPAVRoute *)self->_route isDeviceRoute];

    if (v8) {
      goto LABEL_10;
    }
    uint64_t v13 = [(MPAVRoute *)self->_route connection];
    id v14 = [v13 externalDevice];

    if (!v14) {
      goto LABEL_3;
    }
    uint64_t v15 = [(MPAVRoute *)self->_route connection];
    [v15 externalDevice];
    int ConnectionState = MRExternalDeviceGetConnectionState();

    if (ConnectionState == 2) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = 2 * (ConnectionState != 1);
    }
  }
  else if (self->_mediaRemoteOrigin)
  {
    unint64_t v6 = 1;
  }
  else
  {
    unint64_t v6 = 2;
  }
LABEL_11:
  if (v6 != self->_connectionState)
  {
    uint64_t v9 = sub_10002C428(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = self->_route;
      mediaRemoteOrigin = self->_mediaRemoteOrigin;
      unint64_t v12 = self->_connectionState;
      *(_DWORD *)buf = 138413058;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = mediaRemoteOrigin;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      __int16 v24 = 2048;
      unint64_t v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Origin] Updating connection state for route: %@ origin: %@ from: %lu to: %lu", buf, 0x2Au);
    }

    self->_connectionState = v6;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C198;
    block[3] = &unk_100044D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)deviceInfo
{
  return self->_deviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end