@interface MRAVOutputContext
+ (OS_dispatch_queue)notificationQueue;
+ (id)iTunesContext;
+ (id)sharedAudioPresentationContext;
+ (id)sharedSystemAudioContext;
+ (id)sharedSystemScreenContext;
- (BOOL)containsLocalDevice;
- (BOOL)containsOutputDevice:(id)a3;
- (BOOL)containsOutputDeviceUID:(id)a3;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeMuted;
- (BOOL)shouldLog;
- (BOOL)supportsMultipleBluetoothOutputDevices;
- (BOOL)supportsVolumeControl;
- (MRAVOutputDevice)predictedOutputDevice;
- (NSArray)outputDeviceUIDs;
- (NSArray)outputDevices;
- (NSArray)outputDevicesSnapshot;
- (NSArray)personalDeviceUIDs;
- (NSArray)personalDevices;
- (NSArray)predictedOutputDeviceUIDs;
- (NSString)contextID;
- (float)volume;
- (id)outputDeviceForUID:(id)a3;
- (unsigned)type;
- (unsigned)volumeControlCapabilities;
- (void)_compareOutputDeviceList:(id)a3 withNewOutputDeviceList:(id)a4;
- (void)_notfiyOutputDeviceRemoved:(id)a3;
- (void)_notifyChangesInOutputDevicesWithAdded:(id)a3 removed:(id)a4 updated:(id)a5 previous:(id)a6 newDevices:(id)a7;
- (void)_notifyOutputDeviceAdded:(id)a3;
- (void)_notifyOutputDeviceChanged:(id)a3;
- (void)_reloadOutputDevices;
- (void)_reloadWithOutputDevices:(id)a3;
- (void)_scheduleOutputContextDeviceDidChangeNotification;
- (void)_scheduleOutputContextDevicesDidChangeNotification;
- (void)_scheduleOutputContextDidChangeNotification;
- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7;
- (void)addOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6;
- (void)addOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5;
- (void)adjustVolume:(int64_t)a3 details:(id)a4;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)removeAllOutputDevicesWithCallbackQueue:(id)a3 block:(id)a4;
- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7;
- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6;
- (void)removeOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5;
- (void)resetPredictedOutputDevice;
- (void)setOutputDevices:(id)a3;
- (void)setOutputDevices:(id)a3 initiator:(id)a4 password:(id)a5 fadeAudio:(BOOL)a6 withCallbackQueue:(id)a7 block:(id)a8;
- (void)setOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6;
- (void)setOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5;
- (void)setOutputDevices:(id)a3 withPassword:(id)a4 withCallbackQueue:(id)a5 block:(id)a6;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 details:(id)a4;
- (void)setVolumeMuted:(BOOL)a3;
- (void)setVolumeMuted:(BOOL)a3 details:(id)a4;
@end

@implementation MRAVOutputContext

- (NSArray)outputDevices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSArray *)v2->_outputDevices copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

void __64__MRAVOutputContext__scheduleOutputContextDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MRAVOutputContextDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_notifyChangesInOutputDevicesWithAdded:(id)a3 removed:(id)a4 updated:(id)a5 previous:(id)a6 newDevices:(id)a7
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"kMRAVOutputContextDevicesDidChangeNotification" object:self];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v88 objects:v100 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(v18);
        }
        [(MRAVOutputContext *)self _notfiyOutputDeviceRemoved:*(void *)(*((void *)&v88 + 1) + 8 * i)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v88 objects:v100 count:16];
    }
    while (v20);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v12;
  uint64_t v23 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(obj);
        }
        [(MRAVOutputContext *)self _notifyOutputDeviceAdded:*(void *)(*((void *)&v84 + 1) + 8 * j)];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v24);
  }

  if ([obj count] || objc_msgSend(v18, "count"))
  {
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 postNotificationName:@"MRAVOutputContextOutputDevicesDidChangeNotification" object:self userInfo:0];
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v64 = v16;
  uint64_t v28 = [v64 countByEnumeratingWithState:&v80 objects:v98 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    unint64_t v30 = 0;
    uint64_t v31 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v81 != v31) {
          objc_enumerationMutation(v64);
        }
        v30 += [*(id *)(*((void *)&v80 + 1) + 8 * k) isPersonalRoute];
      }
      uint64_t v29 = [v64 countByEnumeratingWithState:&v80 objects:v98 count:16];
    }
    while (v29);
  }
  else
  {
    unint64_t v30 = 0;
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v67 = v15;
  uint64_t v33 = [v67 countByEnumeratingWithState:&v76 objects:v97 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    unint64_t v35 = 0;
    uint64_t v36 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v77 != v36) {
          objc_enumerationMutation(v67);
        }
        v35 += [*(id *)(*((void *)&v76 + 1) + 8 * m) isPersonalRoute];
      }
      uint64_t v34 = [v67 countByEnumeratingWithState:&v76 objects:v97 count:16];
    }
    while (v34);
  }
  else
  {
    unint64_t v35 = 0;
  }

  if (v30 > v35)
  {
    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 postNotificationName:@"MRAVOutputContextDidAddPersonalDeviceNotification" object:self];
  }
  v62 = v18;
  if (v30 < v35)
  {
    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 postNotificationName:@"MRAVOutputContextDidRemovePersonalDeviceNotification" object:self];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v63 = v14;
  uint64_t v40 = [v63 countByEnumeratingWithState:&v72 objects:v96 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v66 = *(void *)v73;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v73 != v66) {
          objc_enumerationMutation(v63);
        }
        v43 = *(void **)(*((void *)&v72 + 1) + 8 * v42);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke;
        v71[3] = &unk_1E57D07B8;
        v71[4] = v43;
        v44 = objc_msgSend(v67, "msv_firstWhere:", v71);
        if (!v44)
        {
          v60 = [MEMORY[0x1E4F28B00] currentHandler];
          [v60 handleFailureInMethod:a2, self, @"MRAVOutputContext.m", 368, @"Invalid parameter not satisfying: %@", @"previousOutputDevice" object file lineNumber description];
        }
        if (_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__onceToken != -1) {
          dispatch_once(&_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__onceToken, &__block_literal_global_151);
        }
        id v69 = 0;
        id v70 = 0;
        id v68 = 0;
        char v45 = [v44 isEqualToOutputDevice:v43 denyList:_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList addedProperties:&v70 removedProperties:&v69 changedProperties:&v68];
        id v46 = v70;
        id v47 = v69;
        id v48 = v68;
        if ((v45 & 1) == 0)
        {
          if ([(MRAVOutputContext *)self shouldLog])
          {
            v49 = _MRLogForCategory(0);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = [v43 debugName];
              *(_DWORD *)buf = 138543618;
              id v93 = v50;
              __int16 v94 = 2114;
              v95 = self;
              _os_log_impl(&dword_194F3C000, v49, OS_LOG_TYPE_DEFAULT, "[OutputContext] Updated outputDevice %{public}@ for context: %{public}@", buf, 0x16u);
            }
            if ([v46 count])
            {
              v51 = +[MRUserSettings currentSettings];
              int v52 = [v51 verboseOutputContextLogging];

              if (v52)
              {
                v53 = MRLogCategoryOutputContextUpdates();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v93 = v46;
                  _os_log_impl(&dword_194F3C000, v53, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added Fields: %{public}@", buf, 0xCu);
                }
              }
            }
            if ([v47 count])
            {
              v54 = +[MRUserSettings currentSettings];
              int v55 = [v54 verboseOutputContextLogging];

              if (v55)
              {
                v56 = MRLogCategoryOutputContextUpdates();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v93 = v47;
                  _os_log_impl(&dword_194F3C000, v56, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed Fields: %{public}@", buf, 0xCu);
                }
              }
            }
            if ([v48 count])
            {
              v57 = +[MRUserSettings currentSettings];
              int v58 = [v57 verboseOutputContextLogging];

              if (v58)
              {
                v59 = MRLogCategoryOutputContextUpdates();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v93 = v48;
                  _os_log_impl(&dword_194F3C000, v59, OS_LOG_TYPE_DEFAULT, "[OutputContext] Changed Values: %{public}@", buf, 0xCu);
                }
              }
            }
          }
          [(MRAVOutputContext *)self _notifyOutputDeviceChanged:v43];
        }

        ++v42;
      }
      while (v41 != v42);
      uint64_t v41 = [v63 countByEnumeratingWithState:&v72 objects:v96 count:16];
    }
    while (v41);
  }
}

+ (id)sharedAudioPresentationContext
{
  return +[MRAVConcreteOutputContext sharedAudioPresentationContext];
}

uint64_t __70__MRAVOutputContext__compareOutputDeviceList_withNewOutputDeviceList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyChangesInOutputDevicesWithAdded:*(void *)(a1 + 40) removed:*(void *)(a1 + 48) updated:*(void *)(a1 + 56) previous:*(void *)(a1 + 64) newDevices:*(void *)(a1 + 72)];
}

- (void)_scheduleOutputContextDidChangeNotification
{
  v3 = [(id)objc_opt_class() notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRAVOutputContext__scheduleOutputContextDidChangeNotification__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_reloadWithOutputDevices:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [(MRAVOutputContext *)self outputDevicesSnapshot];
  v7 = [v4 setWithArray:v6];

  [(MRAVOutputContext *)self setOutputDevices:v5];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(MRAVOutputContext *)self outputDevicesSnapshot];
  v10 = [v8 setWithArray:v9];

  uint64_t v11 = [v5 count];
  if (v11 != [v10 count])
  {
    id v12 = _MRLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MRAVOutputContext _reloadWithOutputDevices:](v12);
    }
  }
  id v13 = [v7 allObjects];
  id v14 = objc_msgSend(v13, "mr_allOutputDevices");
  id v15 = [v10 allObjects];
  id v16 = objc_msgSend(v15, "mr_allOutputDevices");
  [(MRAVOutputContext *)self _compareOutputDeviceList:v14 withNewOutputDeviceList:v16];
}

- (NSArray)outputDevicesSnapshot
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSArray *)v2->_outputDevicesSnapshot copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setOutputDevices:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = (NSArray *)v4;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = [MRAVDistantOutputDevice alloc];
        id v13 = objc_msgSend(v11, "descriptor", (void)v19);
        id v14 = [(MRAVDistantOutputDevice *)v12 initWithDescriptor:v13];
        [(NSArray *)v5 addObject:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v15 = self;
  objc_sync_enter(v15);
  outputDevices = v15->_outputDevices;
  v15->_outputDevices = v6;
  v17 = v6;

  outputDevicesSnapshot = v15->_outputDevicesSnapshot;
  v15->_outputDevicesSnapshot = v5;

  objc_sync_exit(v15);
}

- (void)_compareOutputDeviceList:(id)a3 withNewOutputDeviceList:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v12 = v6;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v48;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v48 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              if ([v11 isEqualFuzzy:v17])
              {
                [v37 addObject:v17];

                goto LABEL_16;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        [v36 addObject:v11];
LABEL_16:
        ;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * k);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v24 = obj;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v40;
          while (2)
          {
            for (uint64_t m = 0; m != v26; ++m)
            {
              if (*(void *)v40 != v27) {
                objc_enumerationMutation(v24);
              }
              if ([*(id *)(*((void *)&v39 + 1) + 8 * m) isEqualFuzzy:v23])
              {

                goto LABEL_33;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v55 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        [v35 addObject:v23];
LABEL_33:
        ;
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v20);
  }

  uint64_t v29 = [(id)objc_opt_class() notificationQueue];
  id v30 = v18;
  id v31 = obj;
  id v32 = v37;
  id v33 = v36;
  id v34 = v35;
  msv_dispatch_async_on_queue();
}

+ (OS_dispatch_queue)notificationQueue
{
  if (notificationQueue___once != -1) {
    dispatch_once(&notificationQueue___once, &__block_literal_global_135);
  }
  id v2 = (void *)notificationQueue_queue;

  return (OS_dispatch_queue *)v2;
}

- (void)_notifyOutputDeviceAdded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRAVOutputContext *)self shouldLog])
  {
    id v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 debugName];
      *(_DWORD *)buf = 138543618;
      id v24 = v6;
      __int16 v25 = 2114;
      uint64_t v26 = self;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added outputDevice %{public}@ for context: %{public}@", buf, 0x16u);
    }
    uint64_t v7 = +[MRUserSettings currentSettings];
    int v8 = [v7 verboseOutputContextLogging];

    if (v8)
    {
      uint64_t v9 = MRLogCategoryOutputContextUpdates();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v4 descriptor];
        *(_DWORD *)buf = 138543618;
        id v24 = v10;
        __int16 v25 = 2114;
        uint64_t v26 = self;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added outputDevice %{public}@ for context: %{public}@", buf, 0x16u);
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v21 = @"MRAVOutputContextOutputDeviceUserInfoKey";
  id v22 = v4;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v11 postNotificationName:@"MRAVOutputContextDidAddOutputDeviceNotification" object:self userInfo:v12];

  if ([v4 isLocalDevice])
  {
    if ([(MRAVOutputContext *)self shouldLog])
    {
      uint64_t v13 = +[MRUserSettings currentSettings];
      int v14 = [v13 verboseOutputContextLogging];

      if (v14)
      {
        uint64_t v15 = MRLogCategoryOutputContextUpdates();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v4 debugName];
          *(_DWORD *)buf = 138543618;
          id v24 = v16;
          __int16 v25 = 2114;
          uint64_t v26 = self;
          _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added localOutputDevice %{public}@ for context: %{public}@", buf, 0x16u);
        }
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = @"MRAVOutputContextOutputDeviceUserInfoKey";
    id v20 = v4;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [v17 postNotificationName:@"MRAVOutputContextDidAddLocalDeviceNotification" object:self userInfo:v18];
  }
}

- (BOOL)shouldLog
{
  return (MRProcessIsMediaRemoteDaemon() & 1) != 0 || [(MRAVOutputContext *)self type] == 3;
}

void __38__MRAVOutputContext_notificationQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MRAVOutputContext.notificationQueue", v2);
  v1 = (void *)notificationQueue_queue;
  notificationQueue_queue = (uint64_t)v0;
}

- (NSString)contextID
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext contextID]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (unsigned)type
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext type]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSArray)outputDeviceUIDs
{
  id v2 = [(MRAVOutputContext *)self outputDevices];
  uint64_t v3 = objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_54);

  return (NSArray *)v3;
}

uint64_t __37__MRAVOutputContext_outputDeviceUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

- (NSArray)personalDevices
{
  id v2 = [(MRAVOutputContext *)self outputDevices];
  uint64_t v3 = objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_129_0);

  return (NSArray *)v3;
}

id __36__MRAVOutputContext_personalDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPersonalRoute]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSArray)personalDeviceUIDs
{
  id v2 = [(MRAVOutputContext *)self personalDevices];
  uint64_t v3 = objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_131);

  return (NSArray *)v3;
}

uint64_t __39__MRAVOutputContext_personalDeviceUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

- (BOOL)containsOutputDevice:(id)a3
{
  id v4 = [a3 uid];
  LOBYTE(self) = [(MRAVOutputContext *)self containsOutputDeviceUID:v4];

  return (char)self;
}

- (BOOL)containsOutputDeviceUID:(id)a3
{
  uint64_t v3 = [(MRAVOutputContext *)self outputDeviceForUID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)outputDeviceForUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MRAVOutputContext *)self outputDevices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsUID:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsLocalDevice
{
  uint64_t v3 = (void *)MRMediaRemoteCopyDeviceUID();
  LOBYTE(self) = [(MRAVOutputContext *)self containsOutputDeviceUID:v3];

  return (char)self;
}

- (MRAVOutputDevice)predictedOutputDevice
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext predictedOutputDevice]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSArray)predictedOutputDeviceUIDs
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext predictedOutputDeviceUIDs]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (unsigned)volumeControlCapabilities
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext volumeControlCapabilities]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isVolumeControlAvailable
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext isVolumeControlAvailable]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)supportsVolumeControl
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext supportsVolumeControl]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (float)volume
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext volume]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setVolume:(float)a3
{
}

- (void)setVolume:(float)a3 details:(id)a4
{
  id v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext setVolume:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)setVolumeMuted:(BOOL)a3
{
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  id v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext setVolumeMuted:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)isVolumeMuted
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext isVolumeMuted]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  id v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext adjustVolume:details:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext supportsMultipleBluetoothOutputDevices]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

+ (id)sharedSystemAudioContext
{
  return +[MRAVConcreteOutputContext sharedSystemAudioContext];
}

+ (id)sharedSystemScreenContext
{
  return +[MRAVConcreteOutputContext sharedSystemScreenContext];
}

+ (id)iTunesContext
{
  return +[MRAVConcreteOutputContext iTunesContext];
}

- (void)_scheduleOutputContextDeviceDidChangeNotification
{
  uint64_t v3 = [(id)objc_opt_class() notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRAVOutputContext__scheduleOutputContextDeviceDidChangeNotification__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __70__MRAVOutputContext__scheduleOutputContextDeviceDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadOutputDevices];
}

- (void)_scheduleOutputContextDevicesDidChangeNotification
{
  uint64_t v3 = [(id)objc_opt_class() notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MRAVOutputContext__scheduleOutputContextDevicesDidChangeNotification__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __71__MRAVOutputContext__scheduleOutputContextDevicesDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadOutputDevices];
}

- (void)_reloadOutputDevices
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext _reloadOutputDevices]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

uint64_t __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualFuzzy:*(void *)(a1 + 32)];
}

void __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke_2()
{
  dispatch_queue_t v0 = (void *)_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList;
  _notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList = (uint64_t)&unk_1EE66F348;
}

- (void)_notfiyOutputDeviceRemoved:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRAVOutputContext *)self shouldLog])
  {
    id v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 debugName];
      *(_DWORD *)buf = 138543618;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = self;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed outputDevice %{public}@ for context: %{public}@", buf, 0x16u);
    }
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v17 = @"MRAVOutputContextOutputDeviceUserInfoKey";
  id v18 = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v7 postNotificationName:@"MRAVOutputContextDidRemoveOutputDeviceNotification" object:self userInfo:v8];

  if ([v4 isLocalDevice])
  {
    if ([(MRAVOutputContext *)self shouldLog])
    {
      id v9 = +[MRUserSettings currentSettings];
      int v10 = [v9 verboseOutputContextLogging];

      if (v10)
      {
        uint64_t v11 = MRLogCategoryOutputContextUpdates();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = [v4 debugName];
          *(_DWORD *)buf = 138543618;
          id v20 = v12;
          __int16 v21 = 2114;
          id v22 = self;
          _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed localOutputDevice %{public}@ for context: %{public}@", buf, 0x16u);
        }
      }
    }
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v15 = @"MRAVOutputContextOutputDeviceUserInfoKey";
    id v16 = v4;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v13 postNotificationName:@"MRAVOutputContextDidRemoveLocalDeviceNotification" object:self userInfo:v14];
  }
}

- (void)_notifyOutputDeviceChanged:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v11 = @"MRAVOutputContextOutputDeviceUserInfoKey";
  v12[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v5 postNotificationName:@"MRAVOutputContextOutputDeviceDidChangeNotification" object:self userInfo:v6];

  if ([v4 isLocalDevice])
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = @"MRAVOutputContextOutputDeviceUserInfoKey";
    id v10 = v4;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v7 postNotificationName:@"MRAVOutputContextLocalDeviceDidChangeNotification" object:self userInfo:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevicesSnapshot, 0);

  objc_storeStrong((id *)&self->_outputDevices, 0);
}

- (void)addOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v14];

  uint64_t v17 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v16 type:1 outputDevices:v15];
  [(MRGroupTopologyModificationRequest *)v17 setFadeAudio:v8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__MRAVOutputContext_Deprecated__addOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke;
  v19[3] = &unk_1E57D0FE8;
  id v20 = v12;
  id v18 = v12;
  [(MRAVOutputContext *)self modifyTopologyWithRequest:v17 withReplyQueue:v13 completion:v19];
}

uint64_t __94__MRAVOutputContext_Deprecated__addOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
}

- (void)setOutputDevices:(id)a3 withPassword:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 password:(id)a5 fadeAudio:(BOOL)a6 withCallbackQueue:(id)a7 block:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v17];

  id v20 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v19 type:3 outputDevices:v18];
  [(MRGroupTopologyModificationRequest *)v20 setFadeAudio:v9];
  [(MRGroupTopologyModificationRequest *)v20 setPassword:v16];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__MRAVOutputContext_Deprecated__setOutputDevices_initiator_password_fadeAudio_withCallbackQueue_block___block_invoke;
  v22[3] = &unk_1E57D0FE8;
  id v23 = v14;
  id v21 = v14;
  [(MRAVOutputContext *)self modifyTopologyWithRequest:v20 withReplyQueue:v15 completion:v22];
}

uint64_t __103__MRAVOutputContext_Deprecated__setOutputDevices_initiator_password_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:v14];

  id v17 = [[MRGroupTopologyModificationRequest alloc] initWithRequestDetails:v16 type:2 outputDevices:v15];
  [(MRGroupTopologyModificationRequest *)v17 setFadeAudio:v8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__MRAVOutputContext_Deprecated__removeOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke;
  v19[3] = &unk_1E57D0FE8;
  id v20 = v12;
  id v18 = v12;
  [(MRAVOutputContext *)self modifyTopologyWithRequest:v17 withReplyQueue:v13 completion:v19];
}

uint64_t __97__MRAVOutputContext_Deprecated__removeOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeAllOutputDevicesWithCallbackQueue:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [[MRRequestDetails alloc] initWithInitiator:@"Infer" requestID:0 reason:@"API"];
  BOOL v9 = [MRGroupTopologyModificationRequest alloc];
  id v10 = [(MRAVOutputContext *)self outputDevices];
  uint64_t v11 = [(MRGroupTopologyModificationRequest *)v9 initWithRequestDetails:v8 type:2 outputDevices:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__MRAVOutputContext_Deprecated__removeAllOutputDevicesWithCallbackQueue_block___block_invoke;
  v13[3] = &unk_1E57D0FE8;
  id v14 = v6;
  id v12 = v6;
  [(MRAVOutputContext *)self modifyTopologyWithRequest:v11 withReplyQueue:v7 completion:v13];
}

uint64_t __79__MRAVOutputContext_Deprecated__removeAllOutputDevicesWithCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetPredictedOutputDevice
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRAVOutputContext(Deprecated) resetPredictedOutputDevice]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)_reloadWithOutputDevices:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[OutputContext] Output devices became nil during processing", v1, 2u);
}

@end