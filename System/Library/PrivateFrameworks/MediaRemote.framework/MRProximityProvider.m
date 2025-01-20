@interface MRProximityProvider
+ (BOOL)supportsSecureCoding;
+ (void)_migrate:(id)a3 destinationEndpoint:(id)a4 destinationUID:(id)a5 outputDevice:(id)a6 label:(id)a7 completion:(id)a8;
- (MRMigrationDevice)proactiveDevice;
- (MRProximityProvider)init;
- (MRProximityProvider)initWithCoder:(id)a3;
- (NSMutableDictionary)behaviorResults;
- (NSMutableDictionary)remoteDevices;
- (NSMutableSet)providingDevices;
- (NSString)description;
- (NSString)migratingDevice;
- (OS_dispatch_queue)dispatchQueue;
- (id)_deviceForUID:(id)a3;
- (id)_displayContextForDevice:(id)a3 withRemotePlayerState:(id)a4 proactivePlayerState:(id)a5 migrationBehavior:(id)a6;
- (id)_displayStringForContentItem:(id)a3;
- (id)_effectivePlayerStateForDevice:(id)a3;
- (id)_nameForDevice:(id)a3 inEndpoint:(id)a4;
- (id)_outputDeviceWithUID:(id)a3 fromSource:(id)a4 andDestination:(id)a5;
- (id)_persistArtworkData:(id)a3 forDevice:(id)a4;
- (id)behaviorCallback;
- (id)contentToDisplayForDevice:(id)a3;
- (id)dictionaryRepresentation;
- (id)displayContextHandler;
- (id)endpointForDevice:(id)a3;
- (id)progressEventHandler;
- (int64_t)migrationActionForProactivePlayer:(id)a3 proactiveEndpoint:(id)a4 remotePlayer:(id)a5 remoteEndpoint:(id)a6 reason:(id *)a7;
- (void)_addDeviceIfNeeded:(id)a3;
- (void)_beginProvidingDisplayContextIfNeeded:(id)a3;
- (void)_endProvidingDisplayContextIfNeeded:(id)a3;
- (void)_migrateForDevice:(id)a3 completion:(id)a4;
- (void)_migrationBehaviorForRemoteDevice:(id)a3 completion:(id)a4;
- (void)_migrationBehaviorForRemoteDevice:(id)a3 proactiveDevice:(id)a4 completion:(id)a5;
- (void)_provideDisplayContextForDevice:(id)a3;
- (void)_recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:(id)a3;
- (void)_removeDeviceIfNeeded:(id)a3;
- (void)device:(id)a3 stateDidChange:(unint64_t)a4;
- (void)handleGroupSessionNotification:(id)a3;
- (void)receiveEvent:(id)a3;
- (void)setBehaviorCallback:(id)a3;
- (void)setBehaviorResults:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDisplayContextHandler:(id)a3;
- (void)setMigratingDevice:(id)a3;
- (void)setProactiveDevice:(id)a3;
- (void)setProgressEventHandler:(id)a3;
- (void)setProvidingDevices:(id)a3;
- (void)setRemoteDevices:(id)a3;
@end

@implementation MRProximityProvider

- (MRProximityProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRProximityProvider;
  v2 = [(MRProximityProvider *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    remoteDevices = v2->_remoteDevices;
    v2->_remoteDevices = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    providingDevices = v2->_providingDevices;
    v2->_providingDevices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    behaviorResults = v2->_behaviorResults;
    v2->_behaviorResults = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_handleGroupSessionNotification_ name:@"MRActiveGroupSessionInfoDidChangeNotification" object:0];
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MRProximityProvider *)v2 proactiveDevice];
  [v3 setObject:v4 forKeyedSubscript:@"proactiveDevice"];

  v5 = [(MRProximityProvider *)v2 remoteDevices];
  [v3 setObject:v5 forKeyedSubscript:@"remoteDevices"];

  v6 = [(MRProximityProvider *)v2 behaviorResults];
  [v3 setObject:v6 forKeyedSubscript:@"behaviorResults"];

  v7 = [(MRProximityProvider *)v2 providingDevices];
  [v3 setObject:v7 forKeyedSubscript:@"providingDevices"];

  v8 = [(MRProximityProvider *)v2 migratingDevice];
  [v3 setObject:v8 forKeyedSubscript:@"migratingDevice"];

  objc_sync_exit(v2);

  return v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRProximityProvider *)self dictionaryRepresentation];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (void)handleGroupSessionNotification:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v5 = [(MRProximityProvider *)v4 proactiveDevice];
  objc_sync_exit(v4);

  if (v5) {
    [(MRProximityProvider *)v4 _recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:v5];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    id v3 = dispatchQueue;
  }
  else
  {
    id v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }

  return v3;
}

- (void)receiveEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 mediaRemoteID];
  id v6 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MRProximityProvider receiveEvent:]((uint64_t)v4, v6);
  }

  unint64_t v7 = [v4 eventType];
  if (v7 <= 8)
  {
    if (((1 << v7) & 0x105) != 0)
    {
      [(MRProximityProvider *)self _removeDeviceIfNeeded:v5];
    }
    else if (((1 << v7) & 0x18) != 0)
    {
      [(MRProximityProvider *)self _addDeviceIfNeeded:v5];
    }
    else if (v7 == 1)
    {
      v8 = [(MRProximityProvider *)self progressEventHandler];

      if (v8)
      {
        v9 = [(MRProximityProvider *)self dispatchQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__MRProximityProvider_receiveEvent___block_invoke;
        block[3] = &unk_1E57D0790;
        id v19 = v5;
        v20 = self;
        dispatch_async(v9, block);
      }
      v10 = [MEMORY[0x1E4F29128] UUID];
      objc_super v11 = [v10 UUIDString];

      v12 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        __int16 v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice<%@> beginning for device %@", buf, 0x16u);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __36__MRProximityProvider_receiveEvent___block_invoke_111;
      v14[3] = &unk_1E57D1AC8;
      id v15 = v11;
      id v16 = v5;
      v17 = self;
      id v13 = v11;
      [(MRProximityProvider *)self _migrateForDevice:v16 completion:v14];
    }
  }
  if ([v4 expectsDisplayContext]) {
    [(MRProximityProvider *)self _beginProvidingDisplayContextIfNeeded:v5];
  }
  else {
    [(MRProximityProvider *)self _endProvidingDisplayContextIfNeeded:v5];
  }
}

void __36__MRProximityProvider_receiveEvent___block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(getPCProgressEventClass()) initWithEventType:1];
  [v3 setMediaRemoteID:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) progressEventHandler];
  ((void (**)(void, id))v2)[2](v2, v3);
}

void __36__MRProximityProvider_receiveEvent___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice<%@> completed for device %@ with error: %@", buf, 0x20u);
  }

  unint64_t v7 = [*(id *)(a1 + 48) progressEventHandler];

  if (v7)
  {
    v8 = [*(id *)(a1 + 48) dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__MRProximityProvider_receiveEvent___block_invoke_112;
    block[3] = &unk_1E57D1B18;
    id v12 = v3;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    dispatch_async(v8, block);
  }
}

void __36__MRProximityProvider_receiveEvent___block_invoke_112(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(getPCProgressEventClass());
  if (v2) {
    id v4 = (void *)[v3 initWithError:*(void *)(a1 + 32)];
  }
  else {
    id v4 = (void *)[v3 initWithEventType:2];
  }
  id v6 = v4;
  [v4 setMediaRemoteID:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 48) progressEventHandler];
  ((void (**)(void, id))v5)[2](v5, v6);
}

- (MRProximityProvider)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)device:(id)a3 stateDidChange:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 3)
  {
    unint64_t v7 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 uid];
      id v9 = [v6 prepareError];
      *(_DWORD *)buf = 138412546;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Device %@ prepare failed with error %@.", buf, 0x16u);
    }
    id v10 = objc_alloc_init(getPCMediaRemoteDisplayContextClass());
    [v10 setInteractionDirection:0];
    objc_super v11 = [v6 uid];
    [v10 setMediaRemoteID:v11];

    id v12 = [(MRProximityProvider *)self dispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__MRProximityProvider_device_stateDidChange___block_invoke;
    v14[3] = &unk_1E57D0790;
    void v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    dispatch_async(v12, v14);
  }
  else if (a4 == 2)
  {
    [(MRProximityProvider *)self _recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:v6];
  }
}

void __45__MRProximityProvider_device_stateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) displayContextHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)_addDeviceIfNeeded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRProximityProvider *)v5 remoteDevices];
  unint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    v8 = [(MRProximityProvider *)v5 proactiveDevice];

    if (!v8)
    {
      id v9 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Initializing proactive device.", (uint8_t *)&v16, 2u);
      }

      id v10 = +[MRMigrationDevice proactiveDevice];
      [(MRProximityProvider *)v5 setProactiveDevice:v10];

      objc_super v11 = [(MRProximityProvider *)v5 proactiveDevice];
      [v11 setDelegate:v5];

      id v12 = [(MRProximityProvider *)v5 proactiveDevice];
      [v12 prepare];
    }
    id v13 = [[MRMigrationDevice alloc] initWithUID:v4];
    [(MRMigrationDevice *)v13 setDelegate:v5];
    [(MRMigrationDevice *)v13 prepare];
    uint64_t v14 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Adding device %@.", (uint8_t *)&v16, 0xCu);
    }

    id v15 = [(MRProximityProvider *)v5 remoteDevices];
    [v15 setObject:v13 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);
}

- (void)_removeDeviceIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  [(MRProximityProvider *)v5 _endProvidingDisplayContextIfNeeded:v4];
  id v6 = [(MRProximityProvider *)v5 behaviorResults];
  [v6 setObject:0 forKeyedSubscript:v4];

  unint64_t v7 = [(MRProximityProvider *)v5 remoteDevices];
  v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    id v9 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(MRProximityProvider *)v5 remoteDevices];
      objc_super v11 = [v10 objectForKeyedSubscript:v4];
      id v12 = [v11 uid];
      id v13 = [(MRProximityProvider *)v5 remoteDevices];
      uint64_t v14 = [v13 objectForKeyedSubscript:v4];
      id v15 = [v14 endpoint];
      int v16 = [(MRProximityProvider *)v5 _nameForDevice:v12 inEndpoint:v15];
      int v21 = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Removing device %@ (%@).", (uint8_t *)&v21, 0x16u);
    }
    id v17 = [(MRProximityProvider *)v5 remoteDevices];
    [v17 setObject:0 forKeyedSubscript:v4];

    uint64_t v18 = [(MRProximityProvider *)v5 remoteDevices];
    BOOL v19 = [v18 count] == 0;

    if (v19)
    {
      uint64_t v20 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Clearing proactive device.", (uint8_t *)&v21, 2u);
      }

      [(MRProximityProvider *)v5 setProactiveDevice:0];
    }
  }
  objc_sync_exit(v5);
}

- (void)_beginProvidingDisplayContextIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRProximityProvider *)v5 _deviceForUID:v4];
  if (v6)
  {
    unint64_t v7 = [(MRProximityProvider *)v5 providingDevices];
    char v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = [(MRProximityProvider *)v5 providingDevices];
      [v9 addObject:v4];

      id v10 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [v6 uid];
        int v16 = [v6 endpoint];
        id v17 = [(MRProximityProvider *)v5 _nameForDevice:v15 inEndpoint:v16];
        int v21 = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_debug_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Begin providing for device %@ (%@).", (uint8_t *)&v21, 0x16u);
      }
    }
    if ([v6 deviceState] == 2)
    {
      objc_super v11 = [(MRProximityProvider *)v5 behaviorResults];
      id v12 = [v6 uid];
      id v13 = [v11 objectForKeyedSubscript:v12];

      if (v13)
      {
        uint64_t v14 = [v6 uid];
        [(MRProximityProvider *)v5 _provideDisplayContextForDevice:v14];
      }
      else
      {
        uint64_t v14 = _MRLogForCategory(7uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v6 uid];
          BOOL v19 = [v6 endpoint];
          uint64_t v20 = [(MRProximityProvider *)v5 _nameForDevice:v18 inEndpoint:v19];
          int v21 = 138412546;
          id v22 = v4;
          __int16 v23 = 2112;
          v24 = v20;
          _os_log_debug_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Cannot provide because no result has been calculated yet for device %@ (%@).", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      id v13 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[MRProximityProvider _beginProvidingDisplayContextIfNeeded:]((uint64_t)v4, v13);
      }
    }
  }
  objc_sync_exit(v5);
}

- (void)_endProvidingDisplayContextIfNeeded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRProximityProvider *)v5 providingDevices];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    char v8 = [(MRProximityProvider *)v5 _deviceForUID:v4];
    id v9 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_super v11 = [v8 uid];
      id v12 = [v8 endpoint];
      id v13 = [(MRProximityProvider *)v5 _nameForDevice:v11 inEndpoint:v12];
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_debug_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEBUG, "[ProximityProvider] End providing for device %@ (%@).", (uint8_t *)&v14, 0x16u);
    }
    id v10 = [(MRProximityProvider *)v5 providingDevices];
    [v10 removeObject:v4];
  }
  objc_sync_exit(v5);
}

- (void)_provideDisplayContextForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRProximityProvider *)self displayContextHandler];

  if (v5)
  {
    id v6 = self;
    objc_sync_enter(v6);
    int v7 = [(MRProximityProvider *)v6 _deviceForUID:v4];
    char v8 = [(MRProximityProvider *)v6 _effectivePlayerStateForDevice:v7];
    id v9 = [(MRProximityProvider *)v6 proactiveDevice];
    id v10 = [v9 playerState];
    objc_super v11 = [(MRProximityProvider *)v6 behaviorResults];
    id v12 = [v7 uid];
    id v13 = [v11 objectForKeyedSubscript:v12];
    int v14 = [(MRProximityProvider *)v6 _displayContextForDevice:v7 withRemotePlayerState:v8 proactivePlayerState:v10 migrationBehavior:v13];

    id v15 = [(MRProximityProvider *)v6 dispatchQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__MRProximityProvider__provideDisplayContextForDevice___block_invoke;
    v17[3] = &unk_1E57D0790;
    v17[4] = v6;
    id v18 = v14;
    id v16 = v14;
    dispatch_async(v15, v17);

    objc_sync_exit(v6);
  }
  else
  {
    _MRLogForCategory(7uLL);
    id v6 = (MRProximityProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      -[MRProximityProvider _provideDisplayContextForDevice:](&v6->super);
    }
  }
}

void __55__MRProximityProvider__provideDisplayContextForDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) displayContextHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (id)_displayContextForDevice:(id)a3 withRemotePlayerState:(id)a4 proactivePlayerState:(id)a5 migrationBehavior:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(getPCMediaRemoteDisplayContextClass());
  [v14 setProxDeviceState:v11];
  [v14 setSelectedDeviceState:v12];
  v61 = v10;
  id v15 = [v10 uid];
  [v14 setMediaRemoteID:v15];

  v60 = v13;
  if ([v13 action] == 2)
  {
    uint64_t v16 = 2;
    id v17 = v11;
  }
  else
  {
    if (![v13 action])
    {
      [v14 setInteractionDirection:0];
      BOOL v19 = 0;
      goto LABEL_9;
    }
    uint64_t v16 = 1;
    id v17 = v12;
  }
  [v14 setInteractionDirection:v16];
  id v18 = [v17 playbackQueue];
  BOOL v19 = [v18 contentItemWithOffset:0];

  if (v19)
  {
    uint64_t v20 = [(MRProximityProvider *)self _displayStringForContentItem:v19];
    [v14 setLegacyBodyText:v20];

    int v21 = [v19 artwork];
    id v22 = [v21 imageData];

    if (v22)
    {
      __int16 v23 = [v19 artwork];
      v24 = [v23 imageData];
      uint64_t v25 = [v10 uid];
      v26 = [(MRProximityProvider *)self _persistArtworkData:v24 forDevice:v25];
      [v14 setLegacyAttachmentURL:v26];
    }
  }
LABEL_9:
  if (MRMediaRemotePlaybackStateIsAdvancing([v11 playbackState])
    || [v11 playerHasPlayedRecently])
  {
    v27 = [v11 playbackQueue];
    v28 = [v27 contentItemWithOffset:0];

    if (v28)
    {
      v29 = [(MRProximityProvider *)self _displayStringForContentItem:v28];
      [v14 setLocalizedSecondaryAltText:v29];
    }
  }
  v30 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v14 legacyBodyText];
    v32 = [v14 localizedSecondaryAltText];
    *(_DWORD *)buf = 138412546;
    v63 = v31;
    __int16 v64 = 2112;
    v65 = v32;
    _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Legacy: %@. V2: %@.", buf, 0x16u);
  }
  v33 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v59 = [v61 uid];
    v58 = MRMediaRemoteCopyPlaybackStateDescription([v12 playbackState]);
    v55 = [v12 playbackQueue];
    v54 = [v55 contentItemWithOffset:0];
    v57 = [v54 identifier];
    v53 = [v12 playbackQueue];
    v52 = [v53 contentItemWithOffset:0];
    v50 = [v52 artwork];
    v49 = [v50 imageData];
    v34 = @"YES";
    if (!v49) {
      v34 = @"NO";
    }
    v45 = v34;
    v44 = [v12 playerLastPlayingDate];
    id v51 = v14;
    v35 = MRMediaRemoteCopyPlaybackStateDescription([v11 playbackState]);
    v48 = [v11 playbackQueue];
    v47 = [v48 contentItemWithOffset:0];
    v36 = [v47 identifier];
    v46 = [v11 playbackQueue];
    [v46 contentItemWithOffset:0];
    v43 = v56 = v19;
    v37 = [v43 artwork];
    v38 = [v37 imageData];
    id v39 = v12;
    if (v38) {
      v40 = @"YES";
    }
    else {
      v40 = @"NO";
    }
    v41 = [v11 playerLastPlayingDate];
    *(_DWORD *)buf = 138545410;
    v63 = v59;
    __int16 v64 = 2112;
    v65 = v58;
    __int16 v66 = 2112;
    v67 = v57;
    __int16 v68 = 2112;
    v69 = v45;
    __int16 v70 = 2112;
    v71 = v44;
    __int16 v72 = 2112;
    v73 = v35;
    __int16 v74 = 2112;
    v75 = v36;
    __int16 v76 = 2112;
    v77 = v40;
    id v12 = v39;
    __int16 v78 = 2112;
    v79 = v41;
    _os_log_impl(&dword_194F3C000, v33, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Context for %{public}@ - Proactive: state=%@, item=%@, art=%@, lpd=%@. Remote: state=%@, item=%@, art=%@, lpd=%@", buf, 0x5Cu);

    BOOL v19 = v56;
    id v14 = v51;
  }

  return v14;
}

- (id)_displayStringForContentItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];
  uint64_t v5 = [v4 trackArtistName];

  id v6 = [v3 metadata];
  int v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 trackArtistName];
  }
  else
  {
    id v9 = [v6 albumArtistName];

    id v10 = [v3 metadata];
    int v7 = v10;
    if (v9)
    {
      uint64_t v8 = [v10 albumArtistName];
    }
    else
    {
      id v11 = [v10 radioStationName];

      if (!v11) {
        goto LABEL_9;
      }
      int v7 = [v3 metadata];
      uint64_t v8 = [v7 radioStationName];
    }
  }
  id v12 = (void *)v8;

  if (v12)
  {
    id v13 = NSString;
    id v14 = [v3 metadata];
    id v15 = [v14 localizedTitle];
    uint64_t v16 = MRLocalizedString(@"HANDOFF_PILL_TITLE_ARTIST_DELIMITER");
    id v17 = [v13 stringWithFormat:@"%@ %@ %@", v15, v16, v12];

    goto LABEL_10;
  }
LABEL_9:
  id v12 = [v3 metadata];
  id v14 = [v12 localizedTitle];
  id v17 = (void *)[v14 copy];
LABEL_10:

  return v17;
}

- (id)_persistArtworkData:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = NSTemporaryDirectory();
  id v9 = [v7 fileURLWithPath:v8];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v11 = v17;

  if (v11)
  {
    id v12 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MRProximityProvider _persistArtworkData:forDevice:]();
    }
LABEL_8:
    id v14 = 0;
    goto LABEL_9;
  }
  id v12 = [v9 URLByAppendingPathComponent:v6];
  id v16 = 0;
  [v5 writeToURL:v12 options:1 error:&v16];
  id v11 = v16;
  if (v11)
  {
    id v13 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MRProximityProvider _persistArtworkData:forDevice:]();
    }

    goto LABEL_8;
  }
  id v12 = v12;
  id v14 = v12;
LABEL_9:

  return v14;
}

- (void)_recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MRProximityProvider *)v4 proactiveDevice];
  if (v5 == v14)
  {
    int v7 = [(MRProximityProvider *)v4 remoteDevices];
    id v6 = [v7 allValues];
  }
  else
  {
    v21[0] = v14;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }

  objc_sync_exit(v4);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isPrepared])
        {
          id v13 = [v12 uid];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __93__MRProximityProvider__recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice___block_invoke;
          v15[3] = &unk_1E57D9C60;
          v15[4] = v4;
          v15[5] = v12;
          [(MRProximityProvider *)v4 _migrationBehaviorForRemoteDevice:v13 completion:v15];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void __93__MRProximityProvider__recalculateMigrationBehaviorAndProvideUpdatedDisplayContextForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uid];
  int v7 = [*(id *)(a1 + 40) endpoint];
  id v8 = [v5 _nameForDevice:v6 inEndpoint:v7];

  uint64_t v9 = [*(id *)(a1 + 32) behaviorResults];
  uint64_t v10 = [*(id *)(a1 + 40) uid];
  id v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = [*(id *)(a1 + 32) remoteDevices];
  id v13 = [*(id *)(a1 + 40) uid];
  id v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    id v15 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [*(id *)(a1 + 40) uid];
      int v36 = 138543618;
      v37 = v16;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Device %{public}@ (%@) was removed while updating result. Ignoring.", (uint8_t *)&v36, 0x16u);
    }
  }
  long long v17 = _MRLogForCategory(7uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v35 = [*(id *)(a1 + 40) uid];
    int v36 = 138412802;
    v37 = v35;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v3;
    _os_log_debug_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Result for device %@ (%@):\n%@", (uint8_t *)&v36, 0x20u);
  }
  if (([v11 isEqual:v3] & 1) == 0)
  {
    long long v18 = [v3 error];

    if (v18)
    {
      long long v19 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [*(id *)(a1 + 40) uid];
        int v21 = [v3 error];
        int v36 = 138543874;
        v37 = v20;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2114;
        id v41 = v21;
        _os_log_error_impl(&dword_194F3C000, v19, OS_LOG_TYPE_ERROR, "[ProximityProvider] Error for device %{public}@ (%@) : %{public}@", (uint8_t *)&v36, 0x20u);
      }
    }
    else
    {
      long long v19 = _MRLogForCategory(7uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [*(id *)(a1 + 40) uid];
        __int16 v23 = [v3 reason];
        int v36 = 138543874;
        v37 = v22;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2114;
        id v41 = v23;
        _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Behavior for device %{public}@ (%@) : %{public}@", (uint8_t *)&v36, 0x20u);
      }
    }

    v24 = [*(id *)(a1 + 32) behaviorResults];
    uint64_t v25 = [*(id *)(a1 + 40) uid];
    [v24 setObject:v3 forKeyedSubscript:v25];
  }
  v26 = [*(id *)(a1 + 32) providingDevices];
  v27 = [*(id *)(a1 + 40) uid];
  int v28 = [v26 containsObject:v27];

  if (v28)
  {
    v29 = *(void **)(a1 + 32);
    v30 = [*(id *)(a1 + 40) uid];
    [v29 _provideDisplayContextForDevice:v30];
  }
  v31 = [*(id *)(a1 + 32) behaviorCallback];
  BOOL v32 = v31 == 0;

  if (!v32)
  {
    v33 = [*(id *)(a1 + 32) behaviorCallback];
    v34 = [*(id *)(a1 + 40) uid];
    ((void (**)(void, void *, id))v33)[2](v33, v34, v3);
  }
  objc_sync_exit(v4);
}

- (id)_deviceForUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRProximityProvider *)self proactiveDevice];
  id v6 = [v5 uid];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(MRProximityProvider *)self proactiveDevice];
  }
  else
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    uint64_t v10 = [(MRProximityProvider *)v9 remoteDevices];
    id v8 = [v10 objectForKeyedSubscript:v4];

    objc_sync_exit(v9);
  }

  return v8;
}

- (void)_migrateForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = [(MRProximityProvider *)self migratingDevice];
  objc_sync_enter(v8);
  uint64_t v9 = [(MRProximityProvider *)self migratingDevice];

  if (v9)
  {
    uint64_t v10 = NSString;
    id v11 = [(MRProximityProvider *)self migratingDevice];
    id v12 = [v10 stringWithFormat:@"A migration is already in progress for device %@.", v11];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:3 description:v12];
    v7[2](v7, v13);

    objc_sync_exit(v8);
  }
  else
  {
    [(MRProximityProvider *)self setMigratingDevice:v6];
    objc_sync_exit(v8);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__MRProximityProvider__migrateForDevice_completion___block_invoke;
    v14[3] = &unk_1E57D9C88;
    void v14[4] = self;
    id v15 = v6;
    long long v16 = v7;
    [(MRProximityProvider *)self _migrationBehaviorForRemoteDevice:v15 completion:v14];
  }
}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 action] == 2)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v4 sourceUID];
      int v7 = [v5 _deviceForUID:v6];
      v43 = [v7 endpoint];

      id v8 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    }
    else
    {
      if ([v4 action] != 3 && objc_msgSend(v4, "action") != 1)
      {
        v37 = NSString;
        __int16 v38 = [v4 reason];
        id v39 = [v37 stringWithFormat:@"Action == None because %@", v38];

        __int16 v40 = [*(id *)(a1 + 32) migratingDevice];
        objc_sync_enter(v40);
        [*(id *)(a1 + 32) setMigratingDevice:0];
        objc_sync_exit(v40);

        uint64_t v41 = *(void *)(a1 + 48);
        uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:3 description:v39];
        (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);

        goto LABEL_17;
      }
      int v21 = *(void **)(a1 + 32);
      id v22 = [v4 sourceUID];
      __int16 v23 = [v21 _deviceForUID:v22];
      v43 = [v23 endpoint];

      v24 = *(void **)(a1 + 32);
      uint64_t v25 = [v4 destinationUID];
      v26 = [v24 _deviceForUID:v25];
      id v8 = [v26 endpoint];
    }
    v27 = [*(id *)(a1 + 32) _outputDeviceWithUID:*(void *)(a1 + 40) fromSource:v43 andDestination:v8];
    int v28 = [*(id *)(a1 + 32) _deviceForUID:*(void *)(a1 + 40)];
    v29 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(void **)(a1 + 32);
      v30 = *(void **)(a1 + 40);
      BOOL v32 = [v28 uid];
      v33 = [v28 endpoint];
      v34 = [v31 _nameForDevice:v32 inEndpoint:v33];
      *(_DWORD *)buf = 138543874;
      id v47 = v30;
      __int16 v48 = 2112;
      v49 = v34;
      __int16 v50 = 2112;
      id v51 = v4;
      _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] migrateForDevice %{public}@ (%@) evaluated result:\n%@", buf, 0x20u);
    }
    v35 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v47 = v43;
      __int16 v48 = 2114;
      v49 = v8;
      __int16 v50 = 2114;
      id v51 = v27;
      _os_log_impl(&dword_194F3C000, v35, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Will migrate with source %{public}@, dest %{public}@, outputDevice %{public}@.", buf, 0x20u);
    }

    int v36 = [v4 destinationUID];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __52__MRProximityProvider__migrateForDevice_completion___block_invoke_155;
    v44[3] = &unk_1E57D1DA0;
    v44[4] = *(void *)(a1 + 32);
    id v45 = *(id *)(a1 + 48);
    +[MRProximityProvider _migrate:v43 destinationEndpoint:v8 destinationUID:v36 outputDevice:v27 label:@"MRProximityProvider" completion:v44];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = [*(id *)(a1 + 32) proactiveDevice];
    [v9 setObject:v10 forKeyedSubscript:@"proactiveDevice"];

    id v11 = [*(id *)(a1 + 32) proactiveDevice];
    id v12 = [v11 playerState];
    [v9 setObject:v12 forKeyedSubscript:@"proactivePlayerState"];

    id v13 = [*(id *)(a1 + 32) _deviceForUID:*(void *)(a1 + 40)];
    [v9 setObject:v13 forKeyedSubscript:@"remoteDevice"];

    id v14 = [*(id *)(a1 + 32) _deviceForUID:*(void *)(a1 + 40)];
    id v15 = [v14 playerState];
    [v9 setObject:v15 forKeyedSubscript:@"remotePlayerState"];

    long long v16 = _MRLogForCategory(7uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __52__MRProximityProvider__migrateForDevice_completion___block_invoke_cold_1((uint64_t *)(a1 + 40), v16);
    }

    long long v17 = MRLogCategoryMigrationOversize();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v47 = v9;
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] %{public}@", buf, 0xCu);
    }

    long long v18 = [*(id *)(a1 + 32) migratingDevice];
    objc_sync_enter(v18);
    [*(id *)(a1 + 32) setMigratingDevice:0];
    objc_sync_exit(v18);

    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:3 description:@"No valid behavior exists for device."];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
LABEL_17:
}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke_155(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) migratingDevice];
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) setMigratingDevice:0];
  objc_sync_exit(v3);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_outputDeviceWithUID:(id)a3 fromSource:(id)a4 andDestination:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke;
  v19[3] = &unk_1E57D07B8;
  id v9 = v7;
  id v20 = v9;
  uint64_t v10 = [a4 outputDevicesMatchingPredicate:v19];
  id v11 = [v10 firstObject];

  if (!v11)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke_2;
    long long v17 = &unk_1E57D07B8;
    id v18 = v9;
    id v12 = [v8 outputDevicesMatchingPredicate:&v14];
    id v11 = objc_msgSend(v12, "firstObject", v14, v15, v16, v17);
  }

  return v11;
}

uint64_t __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

uint64_t __70__MRProximityProvider__outputDeviceWithUID_fromSource_andDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)_migrationBehaviorForRemoteDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(MRProximityProvider *)self _deviceForUID:a3];
  id v7 = [(MRProximityProvider *)self proactiveDevice];
  [(MRProximityProvider *)self _migrationBehaviorForRemoteDevice:v8 proactiveDevice:v7 completion:v6];
}

- (void)_migrationBehaviorForRemoteDevice:(id)a3 proactiveDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, MRMigrationBehaviorResult *))a5;
  if (v8 && v9 && [v9 isPrepared] && (objc_msgSend(v8, "isPrepared") & 1) != 0)
  {
    id v11 = objc_alloc_init(MRMigrationBehaviorResult);
    id v12 = [v9 playerState];
    id v13 = [(MRProximityProvider *)self _effectivePlayerStateForDevice:v8];
    uint64_t v14 = [v9 endpoint];
    uint64_t v15 = [v8 endpoint];
    id v31 = 0;
    int64_t v16 = [(MRProximityProvider *)self migrationActionForProactivePlayer:v12 proactiveEndpoint:v14 remotePlayer:v13 remoteEndpoint:v15 reason:&v31];
    id v17 = v31;

    [(MRMigrationBehaviorResult *)v11 setAction:v16];
    [(MRMigrationBehaviorResult *)v11 setReason:v17];
    if (v16 == 2)
    {
      v26 = v13;
      v27 = v12;
      id v18 = v8;
      uint64_t v19 = [v18 endpoint];
      id v20 = v9;
      uint64_t v21 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    }
    else
    {
      if (!v16)
      {
        v10[2](v10, v11);
LABEL_18:

        goto LABEL_9;
      }
      v26 = v13;
      v27 = v12;
      id v18 = v9;
      uint64_t v19 = [v18 endpoint];
      id v20 = v8;
      uint64_t v21 = [v20 endpoint];
    }
    id v22 = (void *)v21;
    __int16 v23 = [v18 uid];
    [(MRMigrationBehaviorResult *)v11 setSourceUID:v23];

    v24 = [v20 uid];
    [(MRMigrationBehaviorResult *)v11 setDestinationUID:v24];

    if (([v19 isLocalEndpoint] & 1) == 0
      && (([v19 isLocalEndpoint] & 1) != 0 || (objc_msgSend(v22, "isLocalEndpoint") & 1) != 0))
    {
      uint64_t v25 = dispatch_get_global_queue(0, 0);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __84__MRProximityProvider__migrationBehaviorForRemoteDevice_proactiveDevice_completion___block_invoke;
      v28[3] = &unk_1E57D1DA0;
      v29 = v11;
      v30 = v10;
      [v19 canMigrateToEndpoint:v22 queue:v25 completion:v28];
    }
    else
    {
      v10[2](v10, v11);
    }
    id v12 = v27;

    id v13 = v26;
    goto LABEL_18;
  }
  v10[2](v10, 0);
LABEL_9:
}

uint64_t __84__MRProximityProvider__migrationBehaviorForRemoteDevice_proactiveDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    [v3 setAction:0];
    [*(id *)(a1 + 32) setError:v4];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (id)_effectivePlayerStateForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 prepareError];
  uint64_t v6 = [v5 code];

  id v7 = [v4 playerState];

  id v8 = [v4 endpoint];
  char v9 = [v8 isLocalEndpoint];
  if (v9)
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [v4 endpoint];
    id v12 = [v11 outputDevices];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__MRProximityProvider__effectivePlayerStateForDevice___block_invoke;
    v20[3] = &unk_1E57D07B8;
    id v3 = &v21;
    id v21 = v4;
    id v13 = objc_msgSend(v12, "mr_first:", v20);
    int v10 = [v13 isProxyGroupPlayer];
  }
  if (v6 == 42 || !v7 || v10)
  {
    uint64_t v14 = objc_alloc_init(MRNowPlayingPlayerResponse);
    uint64_t v15 = [MRDestination alloc];
    int64_t v16 = [v4 endpoint];
    id v17 = [v16 origin];
    id v18 = [(MRDestination *)v15 initWithOrigin:v17];
    [(MRNowPlayingPlayerResponse *)v14 setDestination:v18];

    [(MRNowPlayingPlayerResponse *)v14 setPlaybackState:0];
    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v14 = [v4 playerState];
  if ((v9 & 1) == 0) {
LABEL_10:
  }

LABEL_11:

  return v14;
}

uint64_t __54__MRProximityProvider__effectivePlayerStateForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uid];
  uint64_t v5 = [v3 containsUID:v4];

  return v5;
}

- (int64_t)migrationActionForProactivePlayer:(id)a3 proactiveEndpoint:(id)a4 remotePlayer:(id)a5 remoteEndpoint:(id)a6 reason:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing([v11 playbackState]);
  BOOL v16 = MRMediaRemotePlaybackStateIsAdvancing([v13 playbackState]);
  id v17 = [v11 playerPath];
  id v18 = [v17 origin];
  int v19 = [v18 isLocal];

  if (!MRGroupSessionAllowsMigrationForEndpoint(v12))
  {
    int64_t v24 = 0;
    *a7 = @"Proactive endpoint is QHO-restricted group session endpoint.";
    goto LABEL_7;
  }
  uint64_t v42 = a7;
  id v20 = [v12 uniqueIdentifier];
  id v21 = [v14 uniqueIdentifier];
  int v22 = [v20 isEqualToString:v21];

  if (!v22)
  {
    int v26 = !v16;
    if (!IsAdvancing || (v26 & 1) != 0)
    {
      if (!IsAdvancing || v16)
      {
        if (((IsAdvancing | v26) & 1) == 0)
        {
          __int16 v23 = @"Remote is playing -> Pull from remote.";
          goto LABEL_4;
        }
        if (IsAdvancing || v16)
        {
          int64_t v24 = 0;
          goto LABEL_7;
        }
        v29 = [v11 playbackQueue];
        v30 = [v29 contentItems];
        if ([v30 count])
        {
          int v31 = [v11 playerHasPlayedRecently];

          if (v31)
          {
            BOOL v32 = NSString;
            v33 = [v11 playerLastPlayingDate];
            [v33 timeIntervalSinceNow];
            double v35 = -v34;
            if (v19)
            {
              [v32 stringWithFormat:@"Proactive == local, has queue, was playing recently (%.0lf seconds ago) -> Push to remote.", *(void *)&v35];
              *uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
            [v32 stringWithFormat:@"Proactive != local, has queue, was playing recently (%.0lf seconds ago) -> Add remote to group.", *(void *)&v35];
            *uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
            int64_t v24 = 3;
            goto LABEL_7;
          }
        }
        else
        {
        }
        int v36 = [v13 playbackQueue];
        v37 = [v36 contentItems];
        if ([v37 count])
        {
          int v38 = [v13 playerHasPlayedRecently];

          if (v38)
          {
            id v39 = NSString;
            __int16 v40 = [v11 playerLastPlayingDate];
            [v40 timeIntervalSinceNow];
            *uint64_t v42 = [v39 stringWithFormat:@"Remote has queue, was playing recently (%.0lf seconds ago) -> Pull from remote.", -v41];

            goto LABEL_5;
          }
        }
        else
        {
        }
        int64_t v24 = 0;
        *uint64_t v42 = @"Neither device has a recently played queue.";
        goto LABEL_7;
      }
      if (v19)
      {
        v27 = @"Proactive == local and proactive is playing -> Push to remote.";
        goto LABEL_19;
      }
      int v28 = @"Proactive != local and proactive is playing -> Add remote to group.";
    }
    else
    {
      if (v19)
      {
        v27 = @"Proactive == local and both proactive and remote are playing -> Push to remote.";
LABEL_19:
        *uint64_t v42 = v27;
LABEL_20:
        int64_t v24 = 1;
        goto LABEL_7;
      }
      int v28 = @"Proactive != local and both proactive and remote are playing -> Add remote to group.";
    }
    *uint64_t v42 = v28;
    goto LABEL_24;
  }
  __int16 v23 = @"Proactive == remote -> Pull from remote back to local.";
LABEL_4:
  *uint64_t v42 = v23;
LABEL_5:
  int64_t v24 = 2;
LABEL_7:

  return v24;
}

+ (void)_migrate:(id)a3 destinationEndpoint:(id)a4 destinationUID:(id)a5 outputDevice:(id)a6 label:(id)a7 completion:(id)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v36 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_alloc_init(MRPlaybackSessionMigrateRequest);
  [(MRPlaybackSessionMigrateRequest *)v18 setInitiator:@"proximity"];
  [(MRPlaybackSessionMigrateRequest *)v18 setPlayerOptions:[(MRPlaybackSessionMigrateRequest *)v18 playerOptions] | 4];
  [(MRPlaybackSessionMigrateRequest *)v18 setPlayerOptions:[(MRPlaybackSessionMigrateRequest *)v18 playerOptions] | 0x40];
  int v19 = [MEMORY[0x1E4F1C9C8] date];
  [(MRPlaybackSessionMigrateRequest *)v18 startEvent:@"migrateProximity"];
  id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v21 = [(MRPlaybackSessionMigrateRequest *)v18 requestID];
  int v22 = (void *)[v20 initWithFormat:@"%@<%@>", @"migrateProximity", v21];

  if (v16) {
    [v22 appendFormat:@" for %@", v16];
  }
  __int16 v23 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v22;
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke;
  v54[3] = &unk_1E57D7680;
  int64_t v24 = v18;
  v55 = v24;
  v56 = @"migrateProximity";
  id v35 = v16;
  id v57 = v35;
  id v25 = v19;
  id v58 = v25;
  id v26 = v17;
  id v59 = v26;
  v27 = (void (**)(void, void))MEMORY[0x1997190F0](v54);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_208;
  v49[3] = &unk_1E57D9CB0;
  id v28 = v15;
  id v50 = v28;
  id v29 = v14;
  id v51 = v29;
  uint64_t v52 = @"migrateProximity";
  v30 = v24;
  v53 = v30;
  int v31 = (void (**)(void, void))MEMORY[0x1997190F0](v49);
  if (([v13 isLocalEndpoint] & 1) == 0 && (!v36 || (objc_msgSend(v36, "isLocalEndpoint") & 1) == 0))
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2;
    v44[3] = &unk_1E57D9CD8;
    __int16 v48 = v27;
    id v45 = @"migrateProximity";
    v46 = v30;
    id v47 = v13;
    ((void (**)(void, void *))v31)[2](v31, v44);

    BOOL v32 = v13;
    goto LABEL_14;
  }
  BOOL v32 = v13;
  v33 = v36;
  if (![v36 isLocalEndpoint])
  {
    if ([v32 isLocalEndpoint])
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_219;
      v37[3] = &unk_1E57D9D00;
      v43 = v27;
      int v38 = v30;
      v33 = v36;
      id v39 = v36;
      __int16 v40 = @"migrateProximity";
      id v41 = v29;
      id v42 = v32;
      ((void (**)(void, void *))v31)[2](v31, v37);

      goto LABEL_15;
    }
    double v34 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"Error in migrate. No cases matched. Please examine the state prior to this error."];
    ((void (**)(void, void *))v27)[2](v27, v34);

LABEL_14:
    v33 = v36;
    goto LABEL_15;
  }
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 2];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 4];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 0x10];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] | 0x20];
  [(MRPlaybackSessionMigrateRequest *)v30 setEndpointOptions:[(MRPlaybackSessionMigrateRequest *)v30 endpointOptions] & 0xFFFFFFFFFFFFFFF7];
  [v32 migrateToEndpoint:v36 request:v30 queue:MEMORY[0x1E4F14428] completion:v27];
LABEL_15:
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) endEvent:*(void *)(a1 + 40) withError:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  uint64_t v6 = v5;
  if (v3)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (!v7) {
        goto LABEL_15;
      }
      id v8 = *(void **)(a1 + 40);
      char v9 = [*(id *)(a1 + 32) requestID];
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v30 = 138544386;
      int v31 = v8;
      __int16 v32 = 2114;
      v33 = v9;
      __int16 v34 = 2114;
      id v35 = v3;
      __int16 v36 = 2114;
      uint64_t v37 = v10;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      id v13 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      id v14 = v6;
      uint32_t v15 = 52;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      __int16 v23 = *(void **)(a1 + 40);
      char v9 = [*(id *)(a1 + 32) requestID];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v30 = 138544130;
      int v31 = v23;
      __int16 v32 = 2114;
      v33 = v9;
      __int16 v34 = 2114;
      id v35 = v3;
      __int16 v36 = 2048;
      uint64_t v37 = v24;
      id v13 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      id v14 = v6;
      uint32_t v15 = 42;
    }
    _os_log_error_impl(&dword_194F3C000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v30, v15);
  }
  else
  {
    BOOL v16 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v16) {
        goto LABEL_15;
      }
      id v17 = *(void **)(a1 + 40);
      char v9 = [*(id *)(a1 + 32) requestID];
      id v18 = *(void **)(a1 + 48);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v30 = 138544130;
      int v31 = v17;
      __int16 v32 = 2114;
      v33 = v9;
      __int16 v34 = 2114;
      id v35 = v18;
      __int16 v36 = 2048;
      uint64_t v37 = v19;
      id v20 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v21 = v6;
      uint32_t v22 = 42;
    }
    else
    {
      if (!v16) {
        goto LABEL_15;
      }
      id v25 = *(void **)(a1 + 40);
      char v9 = [*(id *)(a1 + 32) requestID];
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v30 = 138543874;
      int v31 = v25;
      __int16 v32 = 2114;
      v33 = v9;
      __int16 v34 = 2048;
      id v35 = v26;
      id v20 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v21 = v6;
      uint32_t v22 = 32;
    }
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v30, v22);
  }

LABEL_15:
  [*(id *)(a1 + 32) finalize];
  v27 = MRLogCategoryMigrationOversize();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [*(id *)(a1 + 32) report];
    int v30 = 138412290;
    int v31 = v28;
    _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v30, 0xCu);
  }
  uint64_t v29 = *(void *)(a1 + 64);
  if (v29) {
    (*(void (**)(uint64_t, id))(v29 + 16))(v29, v3);
  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_208(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void (*)(void))a2[2];
    uint64_t v10 = a2;
    v2();
  }
  else
  {
    uint64_t v4 = a2;
    uint64_t v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [NSString alloc];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 56) requestID];
    char v9 = (void *)[v6 initWithFormat:@"%@<%@>", v7, v8];
    [(MRAVLightweightReconnaissanceSession *)v10 searchForOutputDeviceUID:v5 timeout:v9 reason:MEMORY[0x1E4F14428] queue:v4 completion:7.0];
  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) requestID];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint32_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = @"Adding prox device to proactiveEndpoint";
      _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setRequestType:2];
    [*(id *)(a1 + 40) startEvent:@"addOutputDevices"];
    char v9 = *(void **)(a1 + 40);
    id v18 = v5;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [v9 addDestinationTypesFromDevices:v10];

    id v11 = *(void **)(a1 + 48);
    id v17 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    id v13 = [*(id *)(a1 + 40) requestID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_217;
    v14[3] = &unk_1E57D1DA0;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    [v11 addOutputDevices:v12 initiator:v13 withReplyQueue:MEMORY[0x1E4F14428] completion:v14];
  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_217(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) endEvent:@"addOutputDevices" withError:v4];
  if (!v4 && ([*(id *)(a1 + 32) playerOptions] & 4) != 0) {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v3();
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_219(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 2);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 0xFFFFFFFFFFFFFFFBLL);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 0x10);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") & 0xFFFFFFFFFFFFFFDFLL);
    objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 8);
    id v6 = +[MRUserSettings currentSettings];
    int v7 = [v6 supportNewMigrationBehaviorForProximity];

    if (v7) {
      objc_msgSend(*(id *)(a1 + 32), "setEndpointOptions:", objc_msgSend(*(id *)(a1 + 32), "endpointOptions") | 0x40);
    }
    if (*(void *)(a1 + 40))
    {
      id v8 = *(void **)(a1 + 64);
      id v20 = v5;
      char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      [v8 migrateToOutputDevices:v9 request:*(void *)(a1 + 32) initiator:0 queue:MEMORY[0x1E4F14428] completion:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v10 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v11;
        __int16 v24 = 2114;
        uint64_t v25 = v12;
        __int16 v26 = 2112;
        v27 = @"Falling back to setOutputDevice because destination is not remote-controllable.";
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      [*(id *)(a1 + 32) startEvent:@"setOutputDevice"];
      unint64_t v13 = ((unint64_t)[*(id *)(a1 + 32) playerOptions] >> 6) & 1;
      id v14 = *(void **)(a1 + 64);
      id v21 = v5;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_227;
      v16[3] = &unk_1E57D10A8;
      id v17 = *(id *)(a1 + 32);
      id v18 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 72);
      [v14 setOutputDevices:v15 initiator:@"MRProximityProvider" fadeAudio:v13 withReplyQueue:MEMORY[0x1E4F14428] completion:v16];
    }
  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_227(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) endEvent:@"setOutputDevice" withError:v3];
  if (!v3 && ([*(id *)(a1 + 32) playerOptions] & 4) != 0)
  {
    [*(id *)(a1 + 32) startEvent:@"play"];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = [*(id *)(a1 + 32) requestID];
    id v8 = (void *)[v5 initWithFormat:@"%@<%@>", v6, v7];
    [v4 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_231;
    v9[3] = &unk_1E57D3900;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    MRMediaRemoteSendCommandToPlayer(0, v4, 0, 0, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __97__MRProximityProvider__migrate_destinationEndpoint_destinationUID_outputDevice_label_completion___block_invoke_2_231(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"play" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_nameForDevice:(id)a3 inEndpoint:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [a4 outputDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    uint64_t v24 = *(void *)v31;
    uint64_t v25 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "clusterComposition", v24);

        if (v12)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          unint64_t v13 = [v11 clusterComposition];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = [*(id *)(*((void *)&v26 + 1) + 8 * j) uid];
                char v19 = [v18 isEqualToString:v5];

                if (v19)
                {
                  uint32_t v22 = [v11 name];

                  uint64_t v6 = v25;
                  goto LABEL_22;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v24;
          uint64_t v6 = v25;
        }
        else
        {
          id v20 = [v11 uid];
          int v21 = [v20 isEqualToString:v5];

          if (v21)
          {
            uint32_t v22 = [v11 name];
            goto LABEL_22;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      uint32_t v22 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint32_t v22 = 0;
  }
LABEL_22:

  return v22;
}

- (id)endpointForDevice:(id)a3
{
  id v3 = [(MRProximityProvider *)self _deviceForUID:a3];
  id v4 = [v3 endpoint];

  return v4;
}

- (id)contentToDisplayForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(MRProximityProvider *)self behaviorResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 sourceUID];
  uint64_t v8 = [(MRProximityProvider *)self _deviceForUID:v7];
  uint64_t v9 = [v8 playerState];

  return v9;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)displayContextHandler
{
  return self->_displayContextHandler;
}

- (void)setDisplayContextHandler:(id)a3
{
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
}

- (NSMutableDictionary)remoteDevices
{
  return self->_remoteDevices;
}

- (void)setRemoteDevices:(id)a3
{
}

- (NSMutableSet)providingDevices
{
  return self->_providingDevices;
}

- (void)setProvidingDevices:(id)a3
{
}

- (NSMutableDictionary)behaviorResults
{
  return self->_behaviorResults;
}

- (void)setBehaviorResults:(id)a3
{
}

- (MRMigrationDevice)proactiveDevice
{
  return self->_proactiveDevice;
}

- (void)setProactiveDevice:(id)a3
{
}

- (NSString)migratingDevice
{
  return self->_migratingDevice;
}

- (void)setMigratingDevice:(id)a3
{
}

- (id)behaviorCallback
{
  return self->_behaviorCallback;
}

- (void)setBehaviorCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_behaviorCallback, 0);
  objc_storeStrong((id *)&self->_migratingDevice, 0);
  objc_storeStrong((id *)&self->_proactiveDevice, 0);
  objc_storeStrong((id *)&self->_behaviorResults, 0);
  objc_storeStrong((id *)&self->_providingDevices, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
  objc_storeStrong(&self->_progressEventHandler, 0);
  objc_storeStrong(&self->_displayContextHandler, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)receiveEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Received event %@.", (uint8_t *)&v2, 0xCu);
}

- (void)_beginProvidingDisplayContextIfNeeded:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "[ProximityProvider] Begin providing for device %@, but device is not prepared, so must defer initial provide.", (uint8_t *)&v2, 0xCu);
}

- (void)_provideDisplayContextForDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[ProximityProvider] Cannot provide due to missing displayContextHandler.", v1, 2u);
}

- (void)_persistArtworkData:forDevice:.cold.1()
{
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[ProximityProvider] Failed to persist artwork data for device %@. Error: %@.");
}

void __52__MRProximityProvider__migrateForDevice_completion___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[ProximityProvider] No result for device %@. Was this device prepared before handoff was attempted?", (uint8_t *)&v3, 0xCu);
}

@end