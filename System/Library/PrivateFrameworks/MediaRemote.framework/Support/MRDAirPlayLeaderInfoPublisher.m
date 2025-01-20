@interface MRDAirPlayLeaderInfoPublisher
- (BOOL)isValidOutputDevice:(id)a3;
- (MRAVConcreteOutputContext)outputContext;
- (MRDAirPlayLeaderInfoPublisher)init;
- (MRDAirPlayLeaderInfoPublisher)initWithOrigin:(id)a3 outputContext:(id)a4;
- (MRDeviceInfo)deviceInfo;
- (MROrigin)origin;
- (OS_dispatch_queue)workerQueue;
- (id)currentData;
- (void)handleDeviceInfoDidChange:(id)a3;
- (void)publish;
- (void)publishToOutputDevices:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRDAirPlayLeaderInfoPublisher

- (MRDAirPlayLeaderInfoPublisher)initWithOrigin:(id)a3 outputContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDAirPlayLeaderInfoPublisher;
  v9 = [(MRDAirPlayLeaderInfoPublisher *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_origin, a3);
    objc_storeStrong((id *)&v10->_outputContext, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MediaRemote.MRDAirPlayLeaderInfoPublisher", v11);
    workerQueue = v10->_workerQueue;
    v10->_workerQueue = (OS_dispatch_queue *)v12;

    v14 = +[MRDMediaRemoteServer server];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005F518;
    v16[3] = &unk_100415CC8;
    v17 = v10;
    [v14 addMediaRemoteSeverStartedHandler:v16];
  }
  return v10;
}

- (MRDAirPlayLeaderInfoPublisher)init
{
  v3 = +[MROrigin localOrigin];
  v4 = +[MRAVConcreteOutputContext sharedAudioPresentationContext];
  v5 = [(MRDAirPlayLeaderInfoPublisher *)self initWithOrigin:v3 outputContext:v4];

  return v5;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_deviceInfo;
  id v7 = (MRDeviceInfo *)v4;
  v11 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    unsigned __int8 v8 = [(MRDeviceInfo *)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = (MRDeviceInfo *)[(MRDeviceInfo *)v11 copy];
      deviceInfo = v5->_deviceInfo;
      v5->_deviceInfo = v9;

      [(MRDAirPlayLeaderInfoPublisher *)v5 publish];
    }
  }
  objc_sync_exit(v5);
}

- (void)handleDeviceInfoDidChange:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  v5 = MRGetOriginFromUserInfo();

  v6 = [(MRDAirPlayLeaderInfoPublisher *)self origin];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    unsigned __int8 v8 = [v10 userInfo];
    v9 = MRGetDeviceInfoFromUserInfo();
    [(MRDAirPlayLeaderInfoPublisher *)self setDeviceInfo:v9];
  }
}

- (BOOL)isValidOutputDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 deviceType] == 1 && objc_msgSend(v3, "deviceSubtype") != 1;

  return v4;
}

- (id)currentData
{
  id v3 = objc_alloc_init((Class)_MRAirPlayLeaderInfoProtobuf);
  BOOL v4 = [(MRDAirPlayLeaderInfoPublisher *)self deviceInfo];
  v5 = [v4 protobuf];
  [v3 setDeviceInfo:v5];

  v6 = [v3 data];

  return v6;
}

- (void)publishToOutputDevices:(id)a3
{
  id v4 = a3;
  v5 = [(MRDAirPlayLeaderInfoPublisher *)self workerQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    v6 = [(MRDAirPlayLeaderInfoPublisher *)self currentData];
    if (v6)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v4;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            dispatch_queue_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "avOutputDevice", (void)v13);
            [v12 setMediaRemoteData:v6 completionHandler:&stru_100418258];

            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)publish
{
  id v3 = [(MRDAirPlayLeaderInfoPublisher *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FB48;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end