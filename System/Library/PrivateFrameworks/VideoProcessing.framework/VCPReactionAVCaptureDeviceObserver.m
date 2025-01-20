@interface VCPReactionAVCaptureDeviceObserver
- (VCPReactionAVCaptureDeviceObserver)initWithCallerID:(unint64_t)a3 listener:(void *)a4 callback:(void *)a5;
- (id)discoverCaptureDevices;
- (void)addDevice:(id)a3;
- (void)dealloc;
- (void)discoverCaptureDevicesAndSetupReactionObserver;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDevice:(id)a3;
- (void)setupReactionObserverForDevice:(id)a3 observe:(BOOL)a4;
@end

@implementation VCPReactionAVCaptureDeviceObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDisconnectedObserver, 0);
  objc_storeStrong((id *)&self->_deviceConnectedObserver, 0);

  objc_storeStrong((id *)&self->_captureDevices, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    int v12 = [v9 isEqualToString:@"reactionEffectsInProgress"] ^ 1;
    if (!v11) {
      LOBYTE(v12) = 1;
    }
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = *MEMORY[0x1E4F284C8];
      v14 = [v11 objectForKey:*MEMORY[0x1E4F284C8]];

      if (v14)
      {
        v15 = [v11 objectForKeyedSubscript:v13];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t callerID = self->_callerID;
          int v19 = 134218498;
          unint64_t v20 = callerID;
          __int16 v21 = 2112;
          id v22 = v10;
          __int16 v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): reactionEffectsInProgress change in device: %@, new change: %@\n", (uint8_t *)&v19, 0x20u);
        }
        int hasReactions = self->_hasReactions;
        if (v15) {
          int v18 = [v15 count] != 0;
        }
        else {
          int v18 = 0;
        }
        self->_int hasReactions = v18;
        if (hasReactions != v18) {
          ((void (*)(void *))self->_callback)(self->_listener);
        }
      }
    }
  }
}

- (void)setupReactionObserverForDevice:(id)a3 observe:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t callerID = self->_callerID;
    v8 = "remove observer";
    int v9 = 134218498;
    if (v4) {
      v8 = "add observer";
    }
    unint64_t v10 = callerID;
    __int16 v11 = 2080;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): %s for device %@", (uint8_t *)&v9, 0x20u);
  }
  if (v4) {
    [v6 addObserver:self forKeyPath:@"reactionEffectsInProgress" options:1 context:0];
  }
  else {
    [v6 removeObserver:self forKeyPath:@"reactionEffectsInProgress" context:0];
  }
}

- (void)removeDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    unint64_t callerID = self->_callerID;
    int v12 = 134217984;
    unint64_t v13 = callerID;
    v7 = MEMORY[0x1E4F14500];
    v8 = "VCPReactionObserverSession (0x%llx): old device is nil\n";
LABEL_10:
    uint32_t v9 = 12;
    goto LABEL_11;
  }
  captureDevices = self->_captureDevices;
  if (!captureDevices) {
    goto LABEL_12;
  }
  if (([(NSMutableArray *)captureDevices containsObject:v4] & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    unint64_t v11 = self->_callerID;
    int v12 = 134217984;
    unint64_t v13 = v11;
    v7 = MEMORY[0x1E4F14500];
    v8 = "VCPReactionObserverSession (0x%llx): old device does not exist\n";
    goto LABEL_10;
  }
  [(VCPReactionAVCaptureDeviceObserver *)self setupReactionObserverForDevice:v4 observe:0];
  [(NSMutableArray *)self->_captureDevices removeObject:v4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = self->_callerID;
    int v12 = 134218242;
    unint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v4;
    v7 = MEMORY[0x1E4F14500];
    v8 = "VCPReactionObserverSession (0x%llx): old device is removed: %@";
    uint32_t v9 = 22;
LABEL_11:
    _os_log_impl(&dword_1BB9B9000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v9);
  }
LABEL_12:
}

- (void)addDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    captureDevices = self->_captureDevices;
    if (captureDevices)
    {
      if ([(NSMutableArray *)captureDevices containsObject:v4])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t callerID = self->_callerID;
          int v13 = 134218242;
          unint64_t v14 = callerID;
          __int16 v15 = 2112;
          id v16 = v4;
          v7 = MEMORY[0x1E4F14500];
          v8 = "VCPReactionObserverSession (0x%llx): new device is duplicated: %@\n";
LABEL_13:
          uint32_t v10 = 22;
          goto LABEL_14;
        }
      }
      else
      {
        [(VCPReactionAVCaptureDeviceObserver *)self setupReactionObserverForDevice:v4 observe:1];
        [(NSMutableArray *)self->_captureDevices addObject:v4];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = self->_callerID;
          int v13 = 134218242;
          unint64_t v14 = v12;
          __int16 v15 = 2112;
          id v16 = v4;
          v7 = MEMORY[0x1E4F14500];
          v8 = "VCPReactionObserverSession (0x%llx): new device is added: %@";
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = self->_callerID;
        int v13 = 134217984;
        unint64_t v14 = v11;
        _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VCPReactionObserverSession (0x%llx): buffered capture devices are empty; re-setup\n",
          (uint8_t *)&v13,
          0xCu);
      }
      [(VCPReactionAVCaptureDeviceObserver *)self discoverCaptureDevicesAndSetupReactionObserver];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = self->_callerID;
    int v13 = 134217984;
    unint64_t v14 = v9;
    v7 = MEMORY[0x1E4F14500];
    v8 = "VCPReactionObserverSession (0x%llx): new device is nil\n";
    uint32_t v10 = 12;
LABEL_14:
    _os_log_impl(&dword_1BB9B9000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  captureDevices = self->_captureDevices;
  if (captureDevices)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = captureDevices;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          [(VCPReactionAVCaptureDeviceObserver *)self setupReactionObserverForDevice:*(void *)(*((void *)&v10 + 1) + 8 * v7++) observe:0];
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  if (self->_deviceConnectedObserver || self->_deviceDisconnectedObserver)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self->_deviceConnectedObserver];
    [v8 removeObserver:self->_deviceDisconnectedObserver];
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPReactionAVCaptureDeviceObserver;
  [(VCPReactionAVCaptureDeviceObserver *)&v9 dealloc];
}

- (VCPReactionAVCaptureDeviceObserver)initWithCallerID:(unint64_t)a3 listener:(void *)a4 callback:(void *)a5
{
  self->_unint64_t callerID = (unint64_t)self;
  self->_callback = a5;
  self->_listener = a4;
  [(VCPReactionAVCaptureDeviceObserver *)self discoverCaptureDevicesAndSetupReactionObserver];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1BB9CB5E8;
  v16[3] = &unk_1E6247508;
  objc_copyWeak(&v17, &location);
  uint64_t v7 = (void *)MEMORY[0x1C1860DE0](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1BB9CB698;
  v14[3] = &unk_1E6247508;
  objc_copyWeak(&v15, &location);
  v8 = (void *)MEMORY[0x1C1860DE0](v14);
  objc_super v9 = [v6 addObserverForName:*MEMORY[0x1E4F15848] object:0 queue:0 usingBlock:v7];
  deviceConnectedObserver = self->_deviceConnectedObserver;
  self->_deviceConnectedObserver = v9;

  long long v11 = [v6 addObserverForName:*MEMORY[0x1E4F15850] object:0 queue:0 usingBlock:v8];
  deviceDisconnectedObserver = self->_deviceDisconnectedObserver;
  self->_deviceDisconnectedObserver = v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return self;
}

- (void)discoverCaptureDevicesAndSetupReactionObserver
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(VCPReactionAVCaptureDeviceObserver *)self discoverCaptureDevices];
  id v4 = (NSMutableArray *)[v3 mutableCopy];
  captureDevices = self->_captureDevices;
  self->_captureDevices = v4;

  uint64_t v6 = self->_captureDevices;
  if (v6 && [(NSMutableArray *)v6 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = self->_captureDevices;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          -[VCPReactionAVCaptureDeviceObserver setupReactionObserverForDevice:observe:](self, "setupReactionObserverForDevice:observe:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)discoverCaptureDevices
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F16448];
  uint64_t v3 = *MEMORY[0x1E4F15830];
  v9[0] = *MEMORY[0x1E4F15838];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F15828];
  v9[2] = *MEMORY[0x1E4F15808];
  v9[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  uint64_t v6 = [v2 discoverySessionWithDeviceTypes:v5 mediaType:*MEMORY[0x1E4F15C18] position:0];

  uint64_t v7 = [v6 devices];

  return v7;
}

@end