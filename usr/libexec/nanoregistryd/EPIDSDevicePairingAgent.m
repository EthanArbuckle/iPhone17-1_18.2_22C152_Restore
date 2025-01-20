@interface EPIDSDevicePairingAgent
- (EPIDSDevicePairingAgent)initWithRemoteObjects:(id)a3;
- (void)addIDSPairingAgentObserver:(id)a3;
- (void)disablePairingCheck:(BOOL)a3;
- (void)removeIDSPairingAgentObserver:(id)a3;
- (void)update;
@end

@implementation EPIDSDevicePairingAgent

- (EPIDSDevicePairingAgent)initWithRemoteObjects:(id)a3
{
  id v5 = a3;
  v6 = [(EPIDSDevicePairingAgent *)self init];
  if (v6)
  {
    uint64_t v7 = +[NSPointerArray weakObjectsPointerArray];
    pairingAgentObservers = v6->_pairingAgentObservers;
    v6->_pairingAgentObservers = (NSPointerArray *)v7;

    objc_storeStrong((id *)&v6->_remoteObjects, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = v6->_remoteObjects;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) addConnectivityObserver:v6 (void)v15];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  return v6;
}

- (void)addIDSPairingAgentObserver:(id)a3
{
  [(NSPointerArray *)self->_pairingAgentObservers addPointer:a3];
  pairingAgentObservers = self->_pairingAgentObservers;

  [(NSPointerArray *)pairingAgentObservers compact];
}

- (void)removeIDSPairingAgentObserver:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(NSPointerArray *)self->_pairingAgentObservers count];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while ([(NSPointerArray *)self->_pairingAgentObservers pointerAtIndex:v6] != v7)
    {
      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_pairingAgentObservers removePointerAtIndex:v6];
  }
LABEL_7:
}

- (void)disablePairingCheck:(BOOL)a3
{
  if (self->_isDisabled != a3)
  {
    BOOL v3 = a3;
    self->_isDisabled = a3;
    if (a3) {
      self->_isPaired = 0;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = self->_remoteObjects;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setDisconnected:v3, (void)v9];
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)update
{
  if (!self->_isDisabled && !self->_isPaired)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v3 = self->_remoteObjects;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v3);
          }
          long long v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) defaultPairedDevice];
          if ([v9 maxCompatibilityVersion] != (id)0x7FFFFFFFFFFFFFFFLL) {
            ++v6;
          }
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }
    else
    {
      id v6 = 0;
    }

    if (v6 == (char *)[(NSArray *)self->_remoteObjects count])
    {
      self->_isPaired = 1;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v10 = [(NSPointerArray *)self->_pairingAgentObservers allObjects];
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) idsPairingAgentIDSDidPair:self];
          }
          id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingAgentObservers, 0);

  objc_storeStrong((id *)&self->_remoteObjects, 0);
}

@end