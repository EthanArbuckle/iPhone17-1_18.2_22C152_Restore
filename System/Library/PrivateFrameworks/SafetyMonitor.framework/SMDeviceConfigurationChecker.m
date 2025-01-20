@interface SMDeviceConfigurationChecker
+ (id)convertLowPowerModeWarningStateToString:(int64_t)a3;
- (BOOL)isEffectivePairedDeviceNearby;
- (IDSService)ownAccountIDSService;
- (OS_dispatch_queue)queue;
- (SMDeviceConfigurationChecker)initWithQueue:(id)a3;
- (SMDeviceConfigurationChecker)initWithQueue:(id)a3 messagingService:(id)a4;
- (id)effectivePairedDevice;
- (int64_t)_determineLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3;
- (int64_t)_getDeviceConfigurationLowPowerModeWarningState;
- (int64_t)_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3;
- (int64_t)getDeviceConfigurationLowPowerModeWarningState;
- (int64_t)getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3;
- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3;
- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3;
- (void)setOwnAccountIDSService:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SMDeviceConfigurationChecker

- (SMDeviceConfigurationChecker)initWithQueue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)SMDeviceConfigurationChecker;
    v6 = [(SMDeviceConfigurationChecker *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      uint64_t v8 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.safetymonitor.ownaccount"];
      ownAccountIDSService = v7->_ownAccountIDSService;
      v7->_ownAccountIDSService = (IDSService *)v8;

      [v7->_ownAccountIDSService addDelegate:v7 queue:v7->_queue];
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SMDeviceConfigurationChecker)initWithQueue:(id)a3 messagingService:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SMDeviceConfigurationChecker;
  v6 = [(SMDeviceConfigurationChecker *)&v10 init];
  v7 = v6;
  if (!v6 || (uint64_t v8 = 0, a3) && a4) {
    uint64_t v8 = v6;
  }

  return v8;
}

- (int64_t)getDeviceConfigurationLowPowerModeWarningState
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(SMDeviceConfigurationChecker *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningState__block_invoke;
  v6[3] = &unk_265499228;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __78__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getDeviceConfigurationLowPowerModeWarningState];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v5 = [(SMDeviceConfigurationChecker *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby___block_invoke;
  block[3] = &unk_265499250;
  block[4] = self;
  block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  int64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __101__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:*(unsigned __int8 *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SMDeviceConfigurationChecker *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__SMDeviceConfigurationChecker_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v7[3] = &unk_265499278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __92__SMDeviceConfigurationChecker_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
}

- (int64_t)_getDeviceConfigurationLowPowerModeWarningState
{
  return 1;
}

- (int64_t)_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  return 1;
}

- (int64_t)_determineLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  return 1;
}

- (id)effectivePairedDevice
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SMDeviceConfigurationChecker *)self ownAccountIDSService];
  v3 = [v2 devices];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice] && objc_msgSend(v7, "relationship") == 1)
        {
          id v4 = v7;
          goto LABEL_12;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (BOOL)isEffectivePairedDeviceNearby
{
  v2 = [(SMDeviceConfigurationChecker *)self effectivePairedDevice];
  char v3 = [v2 isNearby];

  return v3;
}

+ (id)convertLowPowerModeWarningStateToString:(int64_t)a3
{
  char v3 = @"LowPowerModeWarningStateEnabled";
  if (a3 == 1) {
    char v3 = @"LowPowerModeStateWarningDisabled";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"LowPowerModeStateWarningUnknown";
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSService)ownAccountIDSService
{
  return self->_ownAccountIDSService;
}

- (void)setOwnAccountIDSService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownAccountIDSService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end