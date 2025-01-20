@interface SBAccessoryConnectionInfoProvider
+ (SBAccessoryConnectionInfoProvider)sharedInstance;
- (SBAccessoryConnectionInfoProvider)init;
- (int)accessoryConnectionType:(id)a3;
- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5;
- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SBAccessoryConnectionInfoProvider

+ (SBAccessoryConnectionInfoProvider)sharedInstance
{
  v2 = (void *)__sharedInstance_0;
  if (!__sharedInstance_0)
  {
    if (sharedInstance_onceToken_17 != -1) {
      dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_140);
    }
    v2 = (void *)__sharedInstance_0;
  }
  return (SBAccessoryConnectionInfoProvider *)v2;
}

void __51__SBAccessoryConnectionInfoProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAccessoryConnectionInfoProvider);
  v1 = (void *)__sharedInstance_0;
  __sharedInstance_0 = (uint64_t)v0;
}

- (SBAccessoryConnectionInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBAccessoryConnectionInfoProvider;
  v2 = [(SBAccessoryConnectionInfoProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5B178] sharedInstance];
    connectionInfo = v2->_connectionInfo;
    v2->_connectionInfo = (ACCConnectionInfo *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(ACCConnectionInfo *)self->_connectionInfo registerDelegate:0];
  connectionInfo = self->_connectionInfo;
  self->_connectionInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAccessoryConnectionInfoProvider;
  [(SBAccessoryConnectionInfoProvider *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  [(NSHashTable *)self->_observers addObject:a3];
  [(ACCConnectionInfo *)self->_connectionInfo registerDelegate:0];
  connectionInfo = self->_connectionInfo;
  [(ACCConnectionInfo *)connectionInfo registerDelegate:self];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    connectionInfo = self->_connectionInfo;
    [(ACCConnectionInfo *)connectionInfo registerDelegate:0];
  }
}

- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4
{
  return [(ACCConnectionInfo *)self->_connectionInfo accessoryEndpointTransportType:a3 connection:a4];
}

- (int)accessoryConnectionType:(id)a3
{
  return [(ACCConnectionInfo *)self->_connectionInfo accessoryConnectionType:a3];
}

- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v11 = a6;
  id v12 = a7;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = self->_observers;
  uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          [v18 accessoryConnectionInfoProvider:self accessoryEndpointAttached:v20 transportType:v9 protocol:a5 properties:v11 forConnection:v12];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = self->_observers;
  uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "accessoryConnectionInfoProvider:accessoryEndpointInfoPropertyChanged:properties:forConnection:", self, v8, v9, v10, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "accessoryConnectionInfoProvider:accessoryEndpointDetached:forConnection:", self, v6, v7, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
}

@end