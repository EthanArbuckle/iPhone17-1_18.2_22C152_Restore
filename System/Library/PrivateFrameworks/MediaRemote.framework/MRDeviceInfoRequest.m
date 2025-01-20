@interface MRDeviceInfoRequest
+ (MRDeviceInfo)localDeviceInfo;
+ (id)cachedDeviceInfoForOrigin:(id)a3;
+ (id)deviceInfoForOrigin:(id)a3;
+ (void)deviceInfoForOrigin:(id)a3 queue:(id)a4 completion:(id)a5;
+ (void)deviceInfoForUID:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRDeviceInfoRequest

+ (void)deviceInfoForOrigin:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      v8 = MEMORY[0x1E4F14428];
      id v10 = MEMORY[0x1E4F14428];
    }
    kdebug_trace();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke;
    v21[3] = &unk_1E57D9F48;
    v8 = v8;
    v22 = v8;
    id v23 = v9;
    v11 = (void *)MEMORY[0x1997190F0](v21);
    v12 = v11;
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_4;
      block[3] = &unk_1E57D0DB8;
      v13 = &v20;
      v20 = v11;
      id v19 = v7;
      id v14 = v12;
      dispatch_async(v8, block);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_5;
      v16[3] = &unk_1E57D9F70;
      v13 = &v17;
      v17 = v11;
      id v15 = v11;
      MRMediaRemoteGetActiveOrigin(v8, v16);
    }
  }
}

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)cachedDeviceInfoForOrigin:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"MRDeviceInfoRequest.m" lineNumber:46 description:@"origin cannot be nil"];
  }
  v6 = [[MRPlayerPath alloc] initWithOrigin:v5 client:0 player:0];
  id v7 = +[MRNowPlayingOriginClientManager sharedManager];
  v8 = [v7 originClientRequestsForPlayerPath:v6];

  id v9 = [v8 deviceInfo];
  if (!v9)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke;
    v16 = &unk_1E57D2098;
    id v18 = a1;
    id v17 = v5;
    if (cachedDeviceInfoForOrigin__onceToken != -1) {
      dispatch_once(&cachedDeviceInfoForOrigin__onceToken, &v13);
    }
  }
  id v10 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v10;
}

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  kdebug_trace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_3;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

+ (id)deviceInfoForOrigin:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[MRMediaRemoteServiceClient sharedServiceClient];
    id v6 = [v5 activePlayerPath];
    id v4 = [v6 origin];

    if (!v4) {
      goto LABEL_4;
    }
  }
  id v7 = [a1 cachedDeviceInfoForOrigin:v4];
  if (!v7)
  {
LABEL_4:
    id v8 = [[MRPlayerPath alloc] initWithOrigin:v4 client:0 player:0];
    id v9 = (void *)MRGetSharedService();
    id v7 = MRMediaRemoteServiceCopyDeviceInfo(v9, v8);
  }
  id v10 = (void *)[v7 copy];

  return v10;
}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_3(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 40) cachedDeviceInfoForOrigin:*(void *)(a1 + 32)];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [[MRPlayerPath alloc] initWithOrigin:*(void *)(a1 + 32) client:0 player:0];
  MRAddPlayerPathToUserInfo(v2, v3);

  MRAddDeviceInfoToUserInfo(v2, v7);
  id v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v5 = [v4 notificationClient];
  id v6 = MRCreateDecodedUserInfo(v2);
  [v5 postNotification:@"kMRDeviceInfoDidChangeNotification" userInfo:v6 object:0];
}

+ (MRDeviceInfo)localDeviceInfo
{
  id v2 = objc_opt_class();
  v3 = +[MROrigin localOrigin];
  id v4 = [v2 deviceInfoForOrigin:v3];

  return (MRDeviceInfo *)v4;
}

void __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MRPlayerPath alloc] initWithOrigin:v3 client:0 player:0];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_2;
  id v12 = &unk_1E57D9F20;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v5 = (void (**)(void, void, void))MEMORY[0x1997190F0](&v9);
  if (v3)
  {
    id v6 = +[MRNowPlayingOriginClientManager sharedManager];
    id v7 = [v6 originClientRequestsForPlayerPath:v4];

    [v7 handleDeviceInfoRequestWithCompletion:v5];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v7 = objc_msgSend(v8, "initWithMRError:", 5, v9, v10, v11, v12, v13);
    ((void (**)(void, void, void *))v5)[2](v5, 0, v7);
  }
}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  qos_class_t v4 = qos_class_self();
  id v5 = dispatch_get_global_queue(v4, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_2;
  v8[3] = &unk_1E57D9EF8;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  [v2 deviceInfoForOrigin:v3 queue:v5 completion:v8];
}

void __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = +[MRMediaRemoteServiceClient sharedServiceClient];
    qos_class_t v4 = [v3 notificationClient];
    id v5 = [v4 notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MRDeviceInfoRequest_cachedDeviceInfoForOrigin___block_invoke_3;
    block[3] = &unk_1E57D2098;
    long long v7 = *(_OWORD *)(a1 + 32);
    id v6 = (id)v7;
    long long v9 = v7;
    dispatch_async(v5, block);
  }
}

uint64_t __60__MRDeviceInfoRequest_deviceInfoForOrigin_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)deviceInfoForUID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MRDeviceInfoRequest.m", 115, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v10)
  {
LABEL_3:
    id v10 = (id)MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
  }
LABEL_4:
  id v13 = [[MRDestination alloc] initWithOutputDeviceUID:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke;
  v17[3] = &unk_1E57D9F98;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  +[MRDestinationResolver resolveDestination:v13 level:0 timeout:v17 completion:7.0];
}

void __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 origin];
  long long v7 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_2;
    v12[3] = &unk_1E57D2318;
    id v8 = &v13;
    id v13 = *(id *)(a1 + 40);
    MRMediaRemoteGetDeviceInfo((uint64_t)v6, (uint64_t)v7, v12);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_3;
    block[3] = &unk_1E57D0DB8;
    id v8 = &v11;
    id v11 = *(id *)(a1 + 40);
    id v10 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__MRDeviceInfoRequest_deviceInfoForUID_queue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:5];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
  }
}

@end