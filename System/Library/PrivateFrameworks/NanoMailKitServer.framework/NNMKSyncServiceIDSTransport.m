@interface NNMKSyncServiceIDSTransport
- (IDSService)idsService;
- (NNMKSyncServiceIDSTransport)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5;
- (NNMKSyncServiceTransportDelegate)delegate;
- (NSString)serviceName;
- (double)_timeIntervalFromTimeoutCategory:(unint64_t)a3;
- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7;
- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7;
- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6;
- (unint64_t)_connectivityState;
- (unint64_t)connectivityState;
- (void)_handleConnectivityChange;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setConnectivityState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NNMKSyncServiceIDSTransport

- (NNMKSyncServiceIDSTransport)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NNMKSyncServiceIDSTransport;
  v12 = [(NNMKSyncServiceIDSTransport *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_serviceName, a3);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v9];
    idsService = v13->_idsService;
    v13->_idsService = (IDSService *)v14;

    [(IDSService *)v13->_idsService addDelegate:v13 queue:v10];
    v13->_connectivityState = [(NNMKSyncServiceIDSTransport *)v13 _connectivityState];
  }

  return v13;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncServiceIDSTransport;
  [(NNMKSyncServiceIDSTransport *)&v4 dealloc];
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [(NNMKSyncServiceIDSTransport *)self _timeIntervalFromTimeoutCategory:a6];
  v13 = -[NNMKSyncServiceIDSTransport sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v12, a4, a5, v7);

  return v13;
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7
{
  BOOL v7 = a7;
  v39[3] = *MEMORY[0x263EF8340];
  id v12 = (objc_class *)MEMORY[0x263F4A098];
  id v13 = a3;
  uint64_t v14 = (void *)[[v12 alloc] initWithProtobufData:v13 type:(unsigned __int16)a4 isResponse:0];

  uint64_t v15 = 200;
  if (a5 == 100) {
    uint64_t v15 = 100;
  }
  if (a5 == 300) {
    uint64_t v16 = 300;
  }
  else {
    uint64_t v16 = v15;
  }
  idsService = self->_idsService;
  v18 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  uint64_t v19 = *MEMORY[0x263F49F90];
  v39[0] = MEMORY[0x263EFFA88];
  uint64_t v20 = *MEMORY[0x263F49F80];
  v38[0] = v19;
  v38[1] = v20;
  v21 = [NSNumber numberWithDouble:a6];
  v39[1] = v21;
  v38[2] = *MEMORY[0x263F49EB0];
  v22 = [NSNumber numberWithBool:v7];
  v39[2] = v22;
  v23 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  id v30 = 0;
  id v31 = 0;
  [(IDSService *)idsService sendProtobuf:v14 toDestinations:v18 priority:v16 options:v23 identifier:&v31 error:&v30];
  id v24 = v31;
  id v25 = v30;

  v26 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543874;
    id v33 = v24;
    __int16 v34 = 2048;
    unint64_t v35 = a4;
    __int16 v36 = 2114;
    v37 = serviceName;
    _os_log_impl(&dword_23D3DF000, v26, OS_LOG_TYPE_DEFAULT, "#IDS sent message. (IDS Identifier: %{public}@, Type: %lu, Service: %{public}@)", buf, 0x20u);
  }
  id v28 = v24;

  return v28;
}

- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6
{
  v36[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = 200;
  if (a5 == 100) {
    uint64_t v11 = 100;
  }
  if (a5 == 300) {
    uint64_t v12 = 300;
  }
  else {
    uint64_t v12 = v11;
  }
  idsService = self->_idsService;
  uint64_t v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = *MEMORY[0x263F49E30];
  id v16 = a4;
  objc_super v17 = [v14 setWithObject:v15];
  uint64_t v18 = *MEMORY[0x263F49F80];
  v35[0] = *MEMORY[0x263F49F90];
  v35[1] = v18;
  v36[0] = MEMORY[0x263EFFA88];
  uint64_t v19 = NSNumber;
  [(NNMKSyncServiceIDSTransport *)self _timeIntervalFromTimeoutCategory:a6];
  uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
  v36[1] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  id v27 = 0;
  id v28 = 0;
  [(IDSService *)idsService sendResourceAtURL:v10 metadata:v16 toDestinations:v17 priority:v12 options:v21 identifier:&v28 error:&v27];

  id v22 = v28;
  id v23 = v27;

  id v24 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543874;
    id v30 = v22;
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2114;
    __int16 v34 = serviceName;
    _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "#IDS sent resource. (IDS Identifier: %{public}@, URL: %{public}@, Service: %{public}@)", buf, 0x20u);
  }

  return v22;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [a7 outgoingResponseIdentifier];
    int v13 = [v9 type];
    serviceName = self->_serviceName;
    int v17 = 138543874;
    uint64_t v18 = v12;
    __int16 v19 = 1024;
    int v20 = v13;
    __int16 v21 = 2114;
    id v22 = serviceName;
    _os_log_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_DEFAULT, "#IDS received message. (IDS Identifier: %{public}@, Type: %d, Service: %{public}@)", (uint8_t *)&v17, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v16 = [v9 data];
  objc_msgSend(WeakRetained, "syncServiceTransport:didReadProtobufData:type:", self, v16, objc_msgSend(v9, "type"));
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  int v13 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    uint64_t v15 = [a8 outgoingResponseIdentifier];
    serviceName = self->_serviceName;
    int v18 = 138543874;
    __int16 v19 = v15;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = serviceName;
    _os_log_impl(&dword_23D3DF000, v14, OS_LOG_TYPE_DEFAULT, "#IDS received resource. (IDS Identifier: %{public}@, URL: %@, Service: %{public}@)", (uint8_t *)&v18, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncServiceTransport:self didRecieveDataAtURL:v11 metadata:v12];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (!a6)
  {
    p_delegate = &self->_delegate;
    id v11 = a7;
    id v12 = a5;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v13 = [v11 code];

    [WeakRetained syncServiceTransport:self didFailSendingProtobufWithIdentifier:v12 errorCode:v13];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncServiceTransport:self didSendProtobufSuccessfullyWithIdentifier:v8];
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncServiceTransportDidReportSpaceBecameAvailable:self];
}

- (void)_handleConnectivityChange
{
  unint64_t v3 = [(NNMKSyncServiceIDSTransport *)self _connectivityState];
  if (v3 != self->_connectivityState)
  {
    self->_connectivityState = v3;
    id v4 = [(NNMKSyncServiceIDSTransport *)self delegate];
    [v4 syncServiceTransportDidChangeConnectivity:self];
  }
}

- (unint64_t)_connectivityState
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v7 isDefaultPairedDevice])
        {
          int v9 = __connected;
          if (v9 != [v7 isConnected]
            || (int v10 = __nearby, v10 != [v7 isNearby])
            || (int v11 = __cloudConnected, v11 != [v7 isCloudConnected]))
          {
            __connected = [v7 isConnected];
            __nearby = [v7 isNearby];
            __cloudConnected = [v7 isCloudConnected];
            id v12 = (void *)qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = v12;
              uint64_t v14 = [v7 isConnected];
              uint64_t v15 = [v7 isNearby];
              unsigned int v16 = [v7 isCloudConnected];
              *(_DWORD *)buf = 134218496;
              uint64_t v25 = v14;
              __int16 v26 = 2048;
              uint64_t v27 = v15;
              __int16 v28 = 2048;
              uint64_t v29 = v16;
              _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "#Connectivity IDS connectivity state. Connected: %lu, Nearby: %lu, Cloud Connected: %lu", buf, 0x20u);
            }
          }
          char v17 = [v7 isConnected];
          unsigned int v18 = [v7 isNearby];
          if (v17)
          {
            if (v18)
            {
              unint64_t v8 = 2;
            }
            else if ([v7 isCloudConnected])
            {
              unint64_t v8 = 4;
            }
            else
            {
              unint64_t v8 = 3;
            }
          }
          else
          {
            unint64_t v8 = v18;
          }
          goto LABEL_22;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  unint64_t v8 = 0;
LABEL_22:

  return v8;
}

- (double)_timeIntervalFromTimeoutCategory:(unint64_t)a3
{
  double result = 60.0;
  if (a3 == 1) {
    double result = 1800.0;
  }
  if (a3 == 2) {
    return 3600.0;
  }
  return result;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (unint64_t)connectivityState
{
  return self->_connectivityState;
}

- (void)setConnectivityState:(unint64_t)a3
{
  self->_connectivityState = a3;
}

- (NNMKSyncServiceTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKSyncServiceTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end