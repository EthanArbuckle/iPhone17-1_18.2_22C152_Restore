@interface SFBLEClient
+ (id)sharedClient;
- (SFBLEClient)init;
- (id)addAirDropDelegate:(id)a3;
- (id)addNearbyDelegate:(id)a3;
- (id)addPairingDelegate:(id)a3;
- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4;
- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlAdvertisingPending:(id)a3;
- (void)awdlDidUpdateState:(id)a3;
- (void)awdlStartedAdvertising:(id)a3;
- (void)awdlStartedScanning:(id)a3;
- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3;
- (void)nearbyDidUpdateState:(id)a3;
- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7;
- (void)pairingDidUpdateState:(id)a3;
- (void)pairingStartedScanning:(id)a3;
- (void)pairingStoppedScanning:(id)a3;
- (void)removeAirDropDelegate:(id)a3;
- (void)removeNearbyDelegate:(id)a3;
- (void)removePairingDelegate:(id)a3;
@end

@implementation SFBLEClient

- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(NSMutableSet *)v7->_wpNearbyDelegates allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    v14 = v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = objc_msgSend(v12, "dispatchQueue", v14);
          if (v13 == v7->_dispatchQueue)
          {
            [v12 nearby:v6 didStartAdvertisingType:a4];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v16[0] = __46__SFBLEClient_nearby_didStartAdvertisingType___block_invoke;
            v16[1] = &unk_1E5BBF120;
            v16[2] = v12;
            id v17 = v6;
            int64_t v18 = a4;
            dispatch_async(v13, block);
          }
        }
        else
        {
          v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(NSMutableSet *)v7->_wpNearbyDelegates allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    v14 = v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = objc_msgSend(v12, "dispatchQueue", v14);
          if (v13 == v7->_dispatchQueue)
          {
            [v12 nearby:v6 didStartScanningForType:a4];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v16[0] = __46__SFBLEClient_nearby_didStartScanningForType___block_invoke;
            v16[1] = &unk_1E5BBF120;
            v16[2] = v12;
            id v17 = v6;
            int64_t v18 = a4;
            dispatch_async(v13, block);
          }
        }
        else
        {
          v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a5;
  id v21 = a6;
  id v11 = a7;
  v12 = self;
  objc_sync_enter(v12);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v13 = v12;
  v14 = [(NSMutableSet *)v12->_wpNearbyDelegates allObjects];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        int64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector())
        {
          long long v19 = [v18 dispatchQueue];
          if (v19 == v13->_dispatchQueue)
          {
            [v18 nearby:v23 didDiscoverType:a4 withData:v22 fromPeer:v21 peerInfo:v11];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __65__SFBLEClient_nearby_didDiscoverType_withData_fromPeer_peerInfo___block_invoke;
            block[3] = &unk_1E5BBF148;
            block[4] = v18;
            id v25 = v23;
            int64_t v29 = a4;
            id v26 = v22;
            id v27 = v21;
            id v28 = v11;
            dispatch_async(v19, block);
          }
        }
        else
        {
          long long v19 = 0;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (id)addNearbyDelegate:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpNearby)
  {
    uint64_t Int64 = CFPrefs_GetInt64();
    BOOL IsVirtualMachine = SFDeviceIsVirtualMachine();
    if (Int64) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = IsVirtualMachine;
    }
    if (v8) {
      uint64_t v9 = (objc_class *)WPBonjourNearBy;
    }
    else {
      uint64_t v9 = (Class)getWPNearbyClass[0]();
    }
    uint64_t v10 = [[v9 alloc] initWithDelegate:v5 queue:v5->_dispatchQueue];
    wpNearby = v5->_wpNearby;
    v5->_wpNearby = (WPNearby *)v10;
  }
  wpNearbyDelegates = v5->_wpNearbyDelegates;
  if (!wpNearbyDelegates)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v14 = v5->_wpNearbyDelegates;
    v5->_wpNearbyDelegates = v13;

    wpNearbyDelegates = v5->_wpNearbyDelegates;
  }
  [(NSMutableSet *)wpNearbyDelegates addObject:v4];
  uint64_t v15 = v5->_wpNearby;
  objc_sync_exit(v5);

  return v15;
}

+ (id)sharedClient
{
  if (sharedClient_sOnce != -1) {
    dispatch_once(&sharedClient_sOnce, &__block_literal_global_30);
  }
  v2 = (void *)sharedClient_sClient;

  return v2;
}

- (void)removeNearbyDelegate:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_wpNearbyDelegates removeObject:v6];
  if (![(NSMutableSet *)v4->_wpNearbyDelegates count])
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(WPNearby *)v4->_wpNearby invalidate];
    wpNearby = v4->_wpNearby;
    v4->_wpNearby = 0;
  }
  objc_sync_exit(v4);
}

void __27__SFBLEClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(SFBLEClient);
  v1 = (void *)sharedClient_sClient;
  sharedClient_sClient = (uint64_t)v0;
}

- (SFBLEClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFBLEClient;
  v2 = [(SFBLEClient *)&v6 init];
  if (v2)
  {
    if (CFPrefs_GetInt64()) {
      SFHighPriorityQueue();
    }
    else {
    uint64_t v3 = SFMainQueue(0);
    }
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)addAirDropDelegate:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpAirDrop)
  {
    uint64_t v6 = [objc_alloc((Class)getWPAWDLClass[0]()) initWithDelegate:v5 queue:v5->_dispatchQueue];
    wpAirDrop = v5->_wpAirDrop;
    v5->_wpAirDrop = (WPAWDL *)v6;
  }
  wpAirDropDelegates = v5->_wpAirDropDelegates;
  if (!wpAirDropDelegates)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = v5->_wpAirDropDelegates;
    v5->_wpAirDropDelegates = v9;

    wpAirDropDelegates = v5->_wpAirDropDelegates;
  }
  [(NSMutableSet *)wpAirDropDelegates addObject:v4];
  id v11 = v5->_wpAirDrop;
  objc_sync_exit(v5);

  return v11;
}

- (void)removeAirDropDelegate:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_wpAirDropDelegates removeObject:v6];
  if (![(NSMutableSet *)v4->_wpAirDropDelegates count])
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(WPAWDL *)v4->_wpAirDrop invalidate];
    wpAirDrop = v4->_wpAirDrop;
    v4->_wpAirDrop = 0;
  }
  objc_sync_exit(v4);
}

- (void)awdlDidUpdateState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpAirDropDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 awdlDidUpdateState:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __34__SFBLEClient_awdlDidUpdateState___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          id v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __34__SFBLEClient_awdlDidUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdlDidUpdateState:*(void *)(a1 + 40)];
}

- (void)awdlStartedAdvertising:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpAirDropDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 awdlStartedAdvertising:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_awdlStartedAdvertising___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          id v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_awdlStartedAdvertising___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdlStartedAdvertising:*(void *)(a1 + 40)];
}

- (void)awdlAdvertisingPending:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpAirDropDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 awdlAdvertisingPending:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_awdlAdvertisingPending___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          id v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_awdlAdvertisingPending___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdlAdvertisingPending:*(void *)(a1 + 40)];
}

- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(NSMutableSet *)v8->_wpAirDropDelegates allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    long long v15 = v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = objc_msgSend(v13, "dispatchQueue", v15);
          if (v14 == v8->_dispatchQueue)
          {
            [v13 awdl:v6 failedToStartAdvertisingWithError:v7];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v17[0] = __54__SFBLEClient_awdl_failedToStartAdvertisingWithError___block_invoke;
            v17[1] = &unk_1E5BBD418;
            v17[2] = v13;
            id v18 = v6;
            id v19 = v7;
            dispatch_async(v14, block);
          }
        }
        else
        {
          long long v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __54__SFBLEClient_awdl_failedToStartAdvertisingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdl:*(void *)(a1 + 40) failedToStartAdvertisingWithError:*(void *)(a1 + 48)];
}

- (void)awdlStartedScanning:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpAirDropDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 awdlStartedScanning:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __35__SFBLEClient_awdlStartedScanning___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __35__SFBLEClient_awdlStartedScanning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdlStartedScanning:*(void *)(a1 + 40)];
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(NSMutableSet *)v8->_wpAirDropDelegates allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    long long v15 = v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = objc_msgSend(v13, "dispatchQueue", v15);
          if (v14 == v8->_dispatchQueue)
          {
            [v13 awdl:v6 failedToStartScanningWithError:v7];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v17[0] = __51__SFBLEClient_awdl_failedToStartScanningWithError___block_invoke;
            v17[1] = &unk_1E5BBD418;
            v17[2] = v13;
            id v18 = v6;
            id v19 = v7;
            dispatch_async(v14, block);
          }
        }
        else
        {
          long long v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __51__SFBLEClient_awdl_failedToStartScanningWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdl:*(void *)(a1 + 40) failedToStartScanningWithError:*(void *)(a1 + 48)];
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpAirDropDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          long long v15 = [v14 dispatchQueue];
          if (v15 == v9->_dispatchQueue)
          {
            [v14 awdl:v17 foundDevice:v16 rssi:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __37__SFBLEClient_awdl_foundDevice_rssi___block_invoke;
            block[3] = &unk_1E5BBD050;
            block[4] = v14;
            id v19 = v17;
            id v20 = v16;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          long long v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __37__SFBLEClient_awdl_foundDevice_rssi___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awdl:*(void *)(a1 + 40) foundDevice:*(void *)(a1 + 48) rssi:*(void *)(a1 + 56)];
}

- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpNearbyDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 nearbyDidChangeBluetoothBandwidthState:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __54__SFBLEClient_nearbyDidChangeBluetoothBandwidthState___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __54__SFBLEClient_nearbyDidChangeBluetoothBandwidthState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearbyDidChangeBluetoothBandwidthState:*(void *)(a1 + 40)];
}

- (void)nearbyDidUpdateState:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v22 = @"SFBluetoothNotificationKeyState";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "state"));
  v23[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [v5 postNotificationName:@"SFBluetoothNotificationNameStateChanged" object:self userInfo:v7];

  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(NSMutableSet *)v8->_wpNearbyDelegates allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 nearbyDidUpdateState:v4];
          }
          else
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __36__SFBLEClient_nearbyDidUpdateState___block_invoke;
            v15[3] = &unk_1E5BBBD18;
            v15[4] = v13;
            id v16 = v4;
            dispatch_async(v14, v15);
          }
        }
        else
        {
          long long v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __36__SFBLEClient_nearbyDidUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearbyDidUpdateState:*(void *)(a1 + 40)];
}

uint64_t __46__SFBLEClient_nearby_didStartAdvertisingType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didStartAdvertisingType:*(void *)(a1 + 48)];
}

- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    id v16 = v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          long long v15 = objc_msgSend(v14, "dispatchQueue", v16);
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didStopAdvertisingType:a4 withError:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v19[0] = __55__SFBLEClient_nearby_didStopAdvertisingType_withError___block_invoke;
            v19[1] = &unk_1E5BBCC20;
            v19[2] = v14;
            id v20 = v17;
            int64_t v22 = a4;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          long long v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __55__SFBLEClient_nearby_didStopAdvertisingType_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didStopAdvertisingType:*(void *)(a1 + 56) withError:*(void *)(a1 + 48)];
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(NSMutableSet *)v7->_wpNearbyDelegates allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    long long v14 = v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_msgSend(v12, "dispatchQueue", v14);
          if (v13 == v7->_dispatchQueue)
          {
            [v12 nearby:v6 didDeferAdvertisingType:a4];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v16[0] = __46__SFBLEClient_nearby_didDeferAdvertisingType___block_invoke;
            v16[1] = &unk_1E5BBF120;
            v16[2] = v12;
            id v17 = v6;
            int64_t v18 = a4;
            dispatch_async(v13, block);
          }
        }
        else
        {
          uint64_t v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

uint64_t __46__SFBLEClient_nearby_didDeferAdvertisingType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didDeferAdvertisingType:*(void *)(a1 + 48)];
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    id v16 = v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          long long v15 = objc_msgSend(v14, "dispatchQueue", v16);
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didFailToStartAdvertisingOfType:a4 withError:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v19[0] = __64__SFBLEClient_nearby_didFailToStartAdvertisingOfType_withError___block_invoke;
            v19[1] = &unk_1E5BBCC20;
            v19[2] = v14;
            id v20 = v17;
            int64_t v22 = a4;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          long long v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __64__SFBLEClient_nearby_didFailToStartAdvertisingOfType_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didFailToStartAdvertisingOfType:*(void *)(a1 + 56) withError:*(void *)(a1 + 48)];
}

uint64_t __46__SFBLEClient_nearby_didStartScanningForType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didStartScanningForType:*(void *)(a1 + 48)];
}

- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    id v16 = v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          long long v15 = objc_msgSend(v14, "dispatchQueue", v16);
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didFailToStartScanningForType:a4 WithError:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v19[0] = __62__SFBLEClient_nearby_didFailToStartScanningForType_WithError___block_invoke;
            v19[1] = &unk_1E5BBCC20;
            v19[2] = v14;
            id v20 = v17;
            int64_t v22 = a4;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          long long v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __62__SFBLEClient_nearby_didFailToStartScanningForType_WithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didFailToStartScanningForType:*(void *)(a1 + 56) WithError:*(void *)(a1 + 48)];
}

uint64_t __65__SFBLEClient_nearby_didDiscoverType_withData_fromPeer_peerInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didDiscoverType:*(void *)(a1 + 72) withData:*(void *)(a1 + 48) fromPeer:*(void *)(a1 + 56) peerInfo:*(void *)(a1 + 64)];
}

- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    id v16 = v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          long long v15 = objc_msgSend(v14, "dispatchQueue", v16);
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didLosePeer:v8 type:a5];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v19[0] = __39__SFBLEClient_nearby_didLosePeer_type___block_invoke;
            v19[1] = &unk_1E5BBCC20;
            v19[2] = v14;
            id v20 = v17;
            id v21 = v8;
            int64_t v22 = a5;
            dispatch_async(v15, block);
          }
        }
        else
        {
          long long v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __39__SFBLEClient_nearby_didLosePeer_type___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didLosePeer:*(void *)(a1 + 48) type:*(void *)(a1 + 56)];
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  id v18 = a6;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = v10;
  uint64_t v12 = [(NSMutableSet *)v10->_wpNearbyDelegates allObjects];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector())
        {
          id v17 = [v16 dispatchQueue];
          if (v17 == v11->_dispatchQueue)
          {
            [v16 nearby:v20 didConnectToPeer:v19 transport:a5 error:v18];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __55__SFBLEClient_nearby_didConnectToPeer_transport_error___block_invoke;
            block[3] = &unk_1E5BBF170;
            block[4] = v16;
            id v22 = v20;
            id v23 = v19;
            int64_t v25 = a5;
            id v24 = v18;
            dispatch_async(v17, block);
          }
        }
        else
        {
          id v17 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

uint64_t __55__SFBLEClient_nearby_didConnectToPeer_transport_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didConnectToPeer:*(void *)(a1 + 48) transport:*(void *)(a1 + 64) error:*(void *)(a1 + 56)];
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = [v14 dispatchQueue];
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didDisconnectFromPeer:v16 error:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __50__SFBLEClient_nearby_didDisconnectFromPeer_error___block_invoke;
            block[3] = &unk_1E5BBD050;
            block[4] = v14;
            id v19 = v17;
            id v20 = v16;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          uint64_t v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __50__SFBLEClient_nearby_didDisconnectFromPeer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didDisconnectFromPeer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  id v18 = a5;
  id v10 = a6;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [(NSMutableSet *)v11->_wpNearbyDelegates allObjects];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector())
        {
          id v17 = [v16 dispatchQueue];
          if (v17 == v11->_dispatchQueue)
          {
            [v16 nearby:v20 didSendData:v19 toPeer:v18 error:v10];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __47__SFBLEClient_nearby_didSendData_toPeer_error___block_invoke;
            block[3] = &unk_1E5BBF198;
            block[4] = v16;
            id v22 = v20;
            id v23 = v19;
            id v24 = v18;
            id v25 = v10;
            dispatch_async(v17, block);
          }
        }
        else
        {
          id v17 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

uint64_t __47__SFBLEClient_nearby_didSendData_toPeer_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didSendData:*(void *)(a1 + 48) toPeer:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [(NSMutableSet *)v9->_wpNearbyDelegates allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = [v14 dispatchQueue];
          if (v15 == v9->_dispatchQueue)
          {
            [v14 nearby:v17 didReceiveData:v16 fromPeer:v8];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __46__SFBLEClient_nearby_didReceiveData_fromPeer___block_invoke;
            block[3] = &unk_1E5BBD050;
            block[4] = v14;
            id v19 = v17;
            id v20 = v16;
            id v21 = v8;
            dispatch_async(v15, block);
          }
        }
        else
        {
          uint64_t v15 = 0;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

uint64_t __46__SFBLEClient_nearby_didReceiveData_fromPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nearby:*(void *)(a1 + 40) didReceiveData:*(void *)(a1 + 48) fromPeer:*(void *)(a1 + 56)];
}

- (id)addPairingDelegate:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_wpPairing)
  {
    uint64_t v6 = [objc_alloc((Class)getWPPairingClass[0]()) initWithDelegate:v5 queue:v5->_dispatchQueue];
    wpPairing = v5->_wpPairing;
    v5->_wpPairing = (WPPairing *)v6;
  }
  wpPairingDelegates = v5->_wpPairingDelegates;
  if (!wpPairingDelegates)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v10 = v5->_wpPairingDelegates;
    v5->_wpPairingDelegates = v9;

    wpPairingDelegates = v5->_wpPairingDelegates;
  }
  [(NSMutableSet *)wpPairingDelegates addObject:v4];
  uint64_t v11 = v5->_wpPairing;
  objc_sync_exit(v5);

  return v11;
}

- (void)removePairingDelegate:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_wpPairingDelegates removeObject:v6];
  if (![(NSMutableSet *)v4->_wpPairingDelegates count])
  {
    if (gLogCategory_SFBLEClient <= 30 && (gLogCategory_SFBLEClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(WPPairing *)v4->_wpPairing invalidate];
    wpPairing = v4->_wpPairing;
    v4->_wpPairing = 0;
  }
  objc_sync_exit(v4);
}

- (void)pairingDidUpdateState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpPairingDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 pairingDidUpdateState:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __37__SFBLEClient_pairingDidUpdateState___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __37__SFBLEClient_pairingDidUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairingDidUpdateState:*(void *)(a1 + 40)];
}

- (void)pairingStartedScanning:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpPairingDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 pairingStartedScanning:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_pairingStartedScanning___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_pairingStartedScanning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairingStartedScanning:*(void *)(a1 + 40)];
}

- (void)pairingStoppedScanning:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(NSMutableSet *)v5->_wpPairingDelegates allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 pairingStoppedScanning:v4];
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __38__SFBLEClient_pairingStoppedScanning___block_invoke;
            v12[3] = &unk_1E5BBBD18;
            v12[4] = v10;
            id v13 = v4;
            dispatch_async(v11, v12);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

uint64_t __38__SFBLEClient_pairingStoppedScanning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairingStoppedScanning:*(void *)(a1 + 40)];
}

- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [(NSMutableSet *)v8->_wpPairingDelegates allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    long long v15 = v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = objc_msgSend(v13, "dispatchQueue", v15);
          if (v14 == v8->_dispatchQueue)
          {
            [v13 pairing:v6 failedToStartScanningWithError:v7];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v17[0] = __54__SFBLEClient_pairing_failedToStartScanningWithError___block_invoke;
            v17[1] = &unk_1E5BBD418;
            v17[2] = v13;
            id v18 = v6;
            id v19 = v7;
            dispatch_async(v14, block);
          }
        }
        else
        {
          long long v14 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

uint64_t __54__SFBLEClient_pairing_failedToStartScanningWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairing:*(void *)(a1 + 40) failedToStartScanningWithError:*(void *)(a1 + 48)];
}

- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v12 = a7;
  id v13 = self;
  objc_sync_enter(v13);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v14 = [(NSMutableSet *)v13->_wpPairingDelegates allObjects];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector())
        {
          id v19 = [v18 dispatchQueue];
          if (v19 == v13->_dispatchQueue)
          {
            [v18 pairing:v23 foundDevice:v22 payload:v21 rssi:v20 peerInfo:v12];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            void block[2] = __57__SFBLEClient_pairing_foundDevice_payload_rssi_peerInfo___block_invoke;
            block[3] = &unk_1E5BBF1C0;
            block[4] = v18;
            id v25 = v23;
            id v26 = v22;
            id v27 = v21;
            id v28 = v20;
            id v29 = v12;
            dispatch_async(v19, block);
          }
        }
        else
        {
          id v19 = 0;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

uint64_t __57__SFBLEClient_pairing_foundDevice_payload_rssi_peerInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairing:*(void *)(a1 + 40) foundDevice:*(void *)(a1 + 48) payload:*(void *)(a1 + 56) rssi:*(void *)(a1 + 64) peerInfo:*(void *)(a1 + 72)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpPairing, 0);
  objc_storeStrong((id *)&self->_wpPairingDelegates, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_wpNearbyDelegates, 0);
  objc_storeStrong((id *)&self->_wpAirDrop, 0);
  objc_storeStrong((id *)&self->_wpAirDropDelegates, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end