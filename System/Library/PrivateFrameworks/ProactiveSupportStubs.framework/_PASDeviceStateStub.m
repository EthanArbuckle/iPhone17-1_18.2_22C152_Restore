@interface _PASDeviceStateStub
+ (void)setClassCLocked:(BOOL)a3;
+ (void)setCurrentOsBuild:(id)a3;
+ (void)setDeviceFormattedForProtection:(BOOL)a3;
+ (void)setLockState:(int)a3;
+ (void)setLockStateAKS:(int)a3;
+ (void)startMockingSystem;
+ (void)stopMockingSystem;
@end

@implementation _PASDeviceStateStub

+ (void)setCurrentOsBuild:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v4 = (void *)_currentOsBuild;
  _currentOsBuild = (uint64_t)v3;

  objc_sync_exit(obj);
}

+ (void)setDeviceFormattedForProtection:(BOOL)a3
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  _deviceFormattedForProtection = a3;
  objc_sync_exit(obj);
}

+ (void)setLockStateAKS:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  if (v3 <= 5) {
    _lockState = dword_23D381B38[v3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = (id)_callbackMapAKS;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)_callbackMapAKS, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v9[2](v9, v3);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

+ (void)setClassCLocked:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  int v5 = _classCLocked;
  _classCLocked = v3;
  if (v5) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6 || _firstUnlockCallback == 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = MEMORY[0x23ECFE970](_firstUnlockCallback);
    uint64_t v8 = (void *)_firstUnlockCallback;
    _firstUnlockCallback = 0;
  }
  objc_sync_exit(v4);

  v9 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
    v9 = (void *)v10;
  }
}

+ (void)setLockState:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  _lockState = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)_callbackMap;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)_callbackMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v9[2](v9, _lockState);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

+ (void)stopMockingSystem
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  [MEMORY[0x263F61E30] setDefaultSystemCallbacks];
  v2 = (void *)_callbackMap;
  _callbackMap = 0;

  BOOL v3 = (void *)_callbackMapAKS;
  _callbackMapAKS = 0;

  v4 = (void *)_firstUnlockCallback;
  _firstUnlockCallback = 0;

  objc_sync_exit(obj);
}

+ (void)startMockingSystem
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v2 = objc_opt_new();
  BOOL v3 = (void *)_callbackMap;
  _callbackMap = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)_callbackMapAKS;
  _callbackMapAKS = v4;

  uint64_t v6 = (void *)_firstUnlockCallback;
  _firstUnlockCallback = 0;

  _lockState = 1;
  _classCLocked = 0;
  _deviceFormattedForProtection = 1;
  uint64_t v7 = (void *)_currentOsBuild;
  _currentOsBuild = 0;

  _tokenCounter = 1;
  [MEMORY[0x263F61E30] setSystemCallbacks:&kMockSystemCallbacks];
  objc_sync_exit(obj);
}

@end