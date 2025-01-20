@interface GKDelayedSetPhotoNetworkWriter
+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4;
- (GKDataTransport)transport;
- (GKDelayedSetPhotoNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4;
- (NSNumber)avatarType;
- (NSString)bagKey;
- (void)setAvatarType:(id)a3;
- (void)setBagKey:(id)a3;
- (void)setTransport:(id)a3;
- (void)uploadImageData:(id)a3 toURL:(id)a4 handler:(id)a5;
- (void)uploadProfileImageMetadata:(id)a3 fromUploadURL:(id)a4 handler:(id)a5;
- (void)writeResources:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedSetPhotoNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[GKDelayedSetPhotoNetworkWriter alloc] initWithTransport:v6 forBagKey:v5];

  return v7;
}

- (GKDelayedSetPhotoNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDelayedSetPhotoNetworkWriter;
  v8 = [(GKDelayedSetPhotoNetworkWriter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKDelayedSetPhotoNetworkWriter *)v8 setTransport:v6];
    [(GKDelayedSetPhotoNetworkWriter *)v9 setBagKey:v7];
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _gkValuesForKeyPath:@"resourceID"];
  if ((unint64_t)[v8 count] >= 2)
  {
    uint64_t v19 = objc_opt_class();
    v20 = [(GKDelayedSetPhotoNetworkWriter *)self bagKey];
    v21 = +[NSString stringWithFormat:@"%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@", v8, v19, v20];
    id v22 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v21 userInfo:0];

    objc_exception_throw(v22);
  }
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKDelayedSetPhotoNetworkWriter: starting avatar image upload process.", buf, 2u);
  }
  objc_super v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedSetPhotoNetworkWriter.m", 57, "-[GKDelayedSetPhotoNetworkWriter writeResources:handler:]");
  v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000D1708;
  v27[3] = &unk_1002D48B0;
  id v28 = v8;
  id v29 = v6;
  v30 = self;
  id v13 = v12;
  id v31 = v13;
  id v14 = v6;
  id v15 = v8;
  [v13 perform:v27];
  v16 = dispatch_get_global_queue(0, 0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000D1A08;
  v23[3] = &unk_1002D3AE8;
  v25 = self;
  id v26 = v7;
  id v24 = v13;
  id v17 = v7;
  id v18 = v13;
  [v18 notifyOnQueue:v16 block:v23];
}

- (void)uploadImageData:(id)a3 toURL:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedSetPhotoNetworkWriter.m", 97, "-[GKDelayedSetPhotoNetworkWriter uploadImageData:toURL:handler:]");
  v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000D1CD4;
  v25[3] = &unk_1002D3980;
  id v13 = v9;
  id v26 = v13;
  id v27 = v8;
  id v14 = v12;
  id v28 = v14;
  id v15 = v8;
  [v14 perform:v25];
  v16 = dispatch_get_global_queue(0, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D2308;
  v20[3] = &unk_1002D39F8;
  id v21 = v14;
  id v22 = self;
  id v23 = v13;
  id v24 = v10;
  id v17 = v10;
  id v18 = v13;
  id v19 = v14;
  [v19 notifyOnQueue:v16 block:v20];
}

- (void)uploadProfileImageMetadata:(id)a3 fromUploadURL:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedSetPhotoNetworkWriter.m", 163, "-[GKDelayedSetPhotoNetworkWriter uploadProfileImageMetadata:fromUploadURL:handler:]");
  v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D2590;
  v20[3] = &unk_1002D48B0;
  id v13 = v9;
  id v21 = v13;
  id v14 = v8;
  id v22 = v14;
  id v23 = self;
  id v15 = v12;
  id v24 = v15;
  [v15 perform:v20];
  if (v10)
  {
    v16 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000D29E8;
    v17[3] = &unk_1002D3930;
    id v19 = v10;
    id v18 = v15;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (GKDataTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (NSNumber)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarType, 0);
  objc_storeStrong((id *)&self->_transport, 0);

  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end