@interface PSGMousePointerController
+ (id)sharedInstance;
- (BOOL)hasMagicMouse;
- (BOOL)hasMouse;
- (BOOL)hasTrackpad;
- (BOOL)trackpadSupportsSilentClick;
- (BOOL)trackpadSupportsSystemHaptics;
- (BSInvalidatable)observerToken;
- (NSMutableSet)pointerDevices;
- (PSGMousePointerController)init;
- (id)globalDevicePreferences;
- (int)trackingSpeedIndex;
- (void)mousePointerDevicesDidConnect:(id)a3;
- (void)mousePointerDevicesDidDisconnect:(id)a3;
- (void)setGlobalDevicePreferences:(id)a3;
- (void)setObserverToken:(id)a3;
- (void)setPointerDevices:(id)a3;
- (void)setTrackingSpeedIndex:(int)a3;
@end

@implementation PSGMousePointerController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSGMousePointerController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __43__PSGMousePointerController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (NSMutableSet)pointerDevices
{
  return self->_pointerDevices;
}

- (PSGMousePointerController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSGMousePointerController;
  v2 = [(PSGMousePointerController *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PSGMousePointerController *)v2 setPointerDevices:v3];

    v4 = [MEMORY[0x263F29878] sharedInstance];
    v5 = [v4 addPointerDeviceObserver:v2];
    [(PSGMousePointerController *)v2 setObserverToken:v5];
  }
  return v2;
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = _PSGLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PSGMousePointerController mousePointerDevicesDidConnect:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  objc_super v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (productName CONTAINS[c] %@)", @"UC Automouse"];
  v8 = [v4 filteredSetUsingPredicate:v7];
  v9 = [(PSGMousePointerController *)v5 pointerDevices];
  [v9 unionSet:v8];

  objc_sync_exit(v5);
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_5);
}

void __59__PSGMousePointerController_mousePointerDevicesDidConnect___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:PSGPointerDevicesDidChangeNotification object:0];
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = _PSGLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[PSGMousePointerController mousePointerDevicesDidDisconnect:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_super v7 = [(PSGMousePointerController *)v5 pointerDevices];
  [v7 minusSet:v4];

  objc_sync_exit(v5);
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_12);
}

void __62__PSGMousePointerController_mousePointerDevicesDidDisconnect___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:PSGPointerDevicesDidChangeNotification object:0];
}

- (id)globalDevicePreferences
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263F29878] sharedInstance];
  id v4 = [v3 globalDevicePreferences];

  if (!v4)
  {
    id v4 = [MEMORY[0x263F29870] defaultPreferencesForHardwareType:9];
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setGlobalDevicePreferences:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [MEMORY[0x263F29878] sharedInstance];
  [v5 setGlobalDevicePreferences:v6];

  objc_sync_exit(v4);
}

- (int)trackingSpeedIndex
{
  v2 = [(PSGMousePointerController *)self globalDevicePreferences];
  [v2 pointerAccelerationFactor];
  float v4 = v3;

  for (uint64_t i = 0; i != 10; ++i)
  {
    if (PSGTrackingSpeedFactors[i] >= v4) {
      break;
    }
  }
  return i;
}

- (void)setTrackingSpeedIndex:(int)a3
{
  float v4 = +[PSGMousePointerController sharedInstance];
  id v7 = [v4 globalDevicePreferences];

  double v5 = PSGTrackingSpeedFactors[a3];
  *(float *)&double v5 = v5;
  [v7 setPointerAccelerationFactor:v5];
  id v6 = +[PSGMousePointerController sharedInstance];
  [v6 setGlobalDevicePreferences:v7];
}

- (BOOL)hasTrackpad
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v3 = [(PSGMousePointerController *)v2 pointerDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) senderDescriptor];
        BOOL v8 = [v7 hardwareType] == 9;

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)hasMouse
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float v3 = [(PSGMousePointerController *)v2 pointerDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) senderDescriptor];
        BOOL v8 = [v7 hardwareType] == 8;

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)hasMagicMouse
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  float v3 = [(PSGMousePointerController *)v2 pointerDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hasVirtualMouseButtons])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)trackpadSupportsSilentClick
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(PSGMousePointerController *)self hasTrackpad])
  {
    float v3 = self;
    objc_sync_enter(v3);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(PSGMousePointerController *)v3 pointerDevices];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) supportsLightClick])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)trackpadSupportsSystemHaptics
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(PSGMousePointerController *)self hasTrackpad])
  {
    float v3 = self;
    objc_sync_enter(v3);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(PSGMousePointerController *)v3 pointerDevices];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) supportsSystemHaptics])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setPointerDevices:(id)a3
{
}

- (BSInvalidatable)observerToken
{
  return (BSInvalidatable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_pointerDevices, 0);
}

@end