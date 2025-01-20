@interface SpatialAudioClientXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (SpatialAudioClient)spatialAudioClient;
- (SpatialAudioXPCService)xpcService;
- (void)fetchSpatialSoundProfileRecordForClient:(id)a3 WithCompletion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setSpatialAudioClient:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcService:(id)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation SpatialAudioClientXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.SpatialAudioServices"];
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  v8 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.developer.spatial-audio.profile-access"];
  unsigned int v9 = [v8 isEqual:&__kCFBooleanTrue];

  if ((v7 & 1) != 0 || v9)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_1000089F8 <= 90)
    {
      if (dword_1000089F8 != -1 || _LogCategory_Initialize())
      {
        uint64_t v11 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        CFStringRef v12 = @"com.apple.SpatialAudioServices";
        LogPrintF();
      }
      if (dword_1000089F8 <= 90 && (dword_1000089F8 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
    }
    if (a3)
    {
      NSErrorF();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v10;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcConnectionInvalidated
{
  unsigned __int8 v7 = self->_spatialAudioClient;
  spatialAudioClient = self->_spatialAudioClient;
  self->_spatialAudioClient = 0;

  v4 = v7;
  if (v7)
  {
    if (dword_1000089F8 <= 30)
    {
      if (dword_1000089F8 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        v6 = v4;
        LogPrintF();
        v4 = v7;
      }
    }
    [(SpatialAudioClient *)v4 invalidate];
  }
  _objc_release_x1();
}

- (void)fetchSpatialSoundProfileRecordForClient:(id)a3 WithCompletion:(id)a4
{
  id v7 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1000026DC;
  v25 = sub_1000026EC;
  id v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000026F4;
  v18[3] = &unk_100004210;
  v20 = &v21;
  id v8 = a4;
  id v19 = v8;
  unsigned int v9 = objc_retainBlock(v18);
  if (dword_1000089F8 <= 30 && (dword_1000089F8 != -1 || _LogCategory_Initialize()))
  {
    id v14 = v7;
    LogPrintF();
  }
  id v10 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v11 = -[SpatialAudioClientXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v14);
  objc_storeStrong(v10, obj);
  if (v11)
  {
    objc_storeStrong((id *)&self->_spatialAudioClient, a3);
    if ((_os_feature_enabled_impl() & 1) != 0 && v8)
    {
      id v12 = objc_alloc_init((Class)BTCloudServicesClient);
      [v12 setDispatchQueue:self->_dispatchQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000027D0;
      v15[3] = &unk_100004238;
      id v16 = v8;
      [v12 fetchSoundProfileRecordWithCompletion:v15];
    }
    else
    {
      uint64_t v13 = NSErrorF();
      id v12 = (id)v22[5];
      v22[5] = v13;
    }
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v21, 8);
}

- (SpatialAudioClient)spatialAudioClient
{
  return self->_spatialAudioClient;
}

- (void)setSpatialAudioClient:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (SpatialAudioXPCService)xpcService
{
  return self->_xpcService;
}

- (void)setXpcService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcService, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_spatialAudioClient, 0);
}

@end