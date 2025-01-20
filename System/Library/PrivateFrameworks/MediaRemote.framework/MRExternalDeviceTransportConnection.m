@interface MRExternalDeviceTransportConnection
- (BOOL)hasAccessToPlayerPath:(id)a3;
- (BOOL)isAllowedToSendCommand:(unsigned int)a3;
- (BOOL)isAllowedToSendMessageType:(unint64_t)a3;
- (BOOL)isValid;
- (MRExternalDeviceTransportConnection)init;
- (NSArray)allObservers;
- (NSDictionary)connectUserInfo;
- (NSError)error;
- (NSHashTable)observers;
- (NSString)destinationGroupUID;
- (NSString)destinationOutputDeviceUID;
- (NSString)label;
- (id)exportEndpoint:(id)a3;
- (id)exportEndpoints:(id)a3;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)exportOutputDevices:(id)a3 endpoint:(id)a4;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (unsigned)connectOptions;
- (void)_notifyDelegateDidCloseWithError:(id)a3;
- (void)_notifyDelegateDidReceiveData:(id)a3;
- (void)addObserver:(id)a3;
- (void)close;
- (void)removeObserver:(id)a3;
- (void)setConnectOptions:(unsigned int)a3;
- (void)setConnectUserInfo:(id)a3;
- (void)setDestinationGroupUID:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setLabel:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MRExternalDeviceTransportConnection

- (MRExternalDeviceTransportConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRExternalDeviceTransportConnection;
  v2 = [(MRExternalDeviceTransportConnection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (NSArray)allObservers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MRExternalDeviceTransportConnection *)v2 observers];
  v4 = [v3 allObjects];

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (BOOL)isValid
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransportConnection isValid]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSError)error
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransportConnection sendTransportData:options:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)close
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransportConnection close]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)_notifyDelegateDidCloseWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MRExternalDeviceTransportConnection *)self allObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 transportDidClose:self error:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDelegateDidReceiveData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MRExternalDeviceTransportConnection *)self allObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 transport:self didReceiveData:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)exportEndpoint:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)exportEndpoints:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRExternalDeviceTransportConnection_exportEndpoints___block_invoke;
  v5[3] = &unk_1E57D5018;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "mr_compactMap:", v5);

  return v3;
}

uint64_t __55__MRExternalDeviceTransportConnection_exportEndpoints___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) exportEndpoint:a2];
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v4 = (MRAVDistantOutputDevice *)a3;
  if ([(MRAVDistantOutputDevice *)v4 isLocalDevice])
  {
    id v5 = +[MROrigin localOrigin];
    uint64_t v6 = +[MRDeviceInfoRequest deviceInfoForOrigin:v5];

    uint64_t v7 = [[MRDeviceInfoOutputDevice alloc] initWithDeviceInfo:v6 fallbackOutputDevice:v4 forExporting:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__MRExternalDeviceTransportConnection_exportOutputDevice_endpoint___block_invoke;
    v13[3] = &unk_1E57D3838;
    long long v14 = v4;
    uint64_t v8 = v4;
    uint64_t v9 = (unsigned int (**)(void))MEMORY[0x1997190F0](v13);
    id v10 = [(MRAVOutputDevice *)v7 descriptor];
    if (v9[2](v9))
    {
      long long v11 = [v6 WHAIdentifier];
      [v10 setUniqueIdentifier:v11];
    }
    id v4 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v10];
  }

  return v4;
}

BOOL __67__MRExternalDeviceTransportConnection_exportOutputDevice_endpoint___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) parentUID];

  return v1 == 0;
}

- (id)exportOutputDevices:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__MRExternalDeviceTransportConnection_exportOutputDevices_endpoint___block_invoke;
  v10[3] = &unk_1E57D2C78;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a3, "mr_compactMap:", v10);

  return v8;
}

uint64_t __68__MRExternalDeviceTransportConnection_exportOutputDevices_endpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) exportOutputDevice:a2 endpoint:*(void *)(a1 + 40)];
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  return 1;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  return 1;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
}

- (unsigned)connectOptions
{
  return self->_connectOptions;
}

- (void)setConnectOptions:(unsigned int)a3
{
  self->_connectOptions = a3;
}

- (NSDictionary)connectUserInfo
{
  return self->_connectUserInfo;
}

- (void)setConnectUserInfo:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectUserInfo, 0);
  objc_storeStrong((id *)&self->_destinationGroupUID, 0);
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end