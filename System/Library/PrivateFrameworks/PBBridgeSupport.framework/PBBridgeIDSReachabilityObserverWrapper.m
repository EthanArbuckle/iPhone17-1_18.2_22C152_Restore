@interface PBBridgeIDSReachabilityObserverWrapper
- (PBBridgeIDSReachabilityObserver)observer;
- (void)fireReachability:(id)a3 deviceStatus:(id)a4 devices:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation PBBridgeIDSReachabilityObserverWrapper

- (void)setObserver:(id)a3
{
}

- (void)fireReachability:(id)a3 deviceStatus:(id)a4 devices:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v9;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18 = [v17 idsDeviceID];
          v19 = [v10 objectForKeyedSubscript:v18];
          objc_msgSend(WeakRetained, "reachability:device:connectionStatus:", v8, v19, objc_msgSend(v17, "reachability"));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v9 = v20;
  }
}

- (PBBridgeIDSReachabilityObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBBridgeIDSReachabilityObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end