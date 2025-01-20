@interface WLWiFiDeviceClient
- (BOOL)_completionMapsAreEmpty;
- (WLWiFiDeviceClient)initWithWiFiDeviceClientRef:(__WiFiDeviceClient *)a3;
- (__WiFiDeviceClient)ref;
- (id)_hostedNetworks;
- (id)_initWithoutWiFiDeviceClientRef;
- (id)hostedNetworkMatchingSSID:(id)a3;
- (int)_startNetworkWithRole:(int)a3 request:(id)a4 session:(id)a5;
- (int)_stopNetwork:(id)a3 session:(id)a4;
- (void)dealloc;
- (void)disassociate;
- (void)setRef:(__WiFiDeviceClient *)a3;
- (void)startNetworkWithHostRole:(int)a3 request:(id)a4 completion:(id)a5;
- (void)stopNetwork:(id)a3 completion:(id)a4;
@end

@implementation WLWiFiDeviceClient

- (WLWiFiDeviceClient)initWithWiFiDeviceClientRef:(__WiFiDeviceClient *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WLWiFiDeviceClient;
  v4 = [(WLWiFiDeviceClient *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(WLWiFiDeviceClient *)v4 setRef:a3];
    CFRetain([(WLWiFiDeviceClient *)v5 ref]);
  }
  return v5;
}

- (id)_initWithoutWiFiDeviceClientRef
{
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiDeviceClient;
  return [(WLWiFiDeviceClient *)&v3 init];
}

- (void)dealloc
{
  if ([(WLWiFiDeviceClient *)self ref]) {
    CFRelease([(WLWiFiDeviceClient *)self ref]);
  }
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiDeviceClient;
  [(WLWiFiDeviceClient *)&v3 dealloc];
}

- (id)hostedNetworkMatchingSSID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WLWiFiDeviceClient *)self _hostedNetworks];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "ssid", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_hostedNetworks
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(WLWiFiDeviceClient *)self ref];
  WiFiDeviceClientCopyHostedNetworks();
  _WLLog();
  return v3;
}

- (void)disassociate
{
  v2 = [(WLWiFiDeviceClient *)self ref];
  MEMORY[0x270F4B440](v2, 0);
}

- (void)startNetworkWithHostRole:(int)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v16 = a4;
  v8 = (void (**)(id, void))a5;
  v9 = _startSessionToCompletionMap();
  v10 = objc_msgSend(NSString, "wl_uniqueIdentifier");
  id v11 = v9;
  objc_sync_enter(v11);
  v12 = (void *)MEMORY[0x230F5E7D0](v8);
  [v11 setObject:v12 forKeyedSubscript:v10];

  objc_sync_exit(v11);
  uint64_t v13 = [(WLWiFiDeviceClient *)self _startNetworkWithRole:v6 request:v16 session:v10];
  if (v13)
  {
    uint64_t v15 = v13;
    _WLLog();
    id v14 = v11;
    objc_sync_enter(v14);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v10, v15);
    objc_sync_exit(v14);

    v8[2](v8, 0);
  }
}

- (int)_startNetworkWithRole:(int)a3 request:(id)a4 session:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(WLWiFiDeviceClient *)self ref];
  int started = WiFiDeviceClientStartNetwork();

  return started;
}

- (void)stopNetwork:(id)a3 completion:(id)a4
{
  id v14 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  id v7 = _stopSessionToCompletionMap();
  id v8 = objc_msgSend(NSString, "wl_uniqueIdentifier");
  id v9 = v7;
  objc_sync_enter(v9);
  v10 = (void *)MEMORY[0x230F5E7D0](v6);
  [v9 setObject:v10 forKeyedSubscript:v8];

  objc_sync_exit(v9);
  uint64_t v11 = [(WLWiFiDeviceClient *)self _stopNetwork:v14 session:v8];
  if (v11)
  {
    uint64_t v13 = v11;
    _WLLog();
    id v12 = v9;
    objc_sync_enter(v12);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v8, v13);
    objc_sync_exit(v12);

    v6[2](v6, 0);
  }
}

- (int)_stopNetwork:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WLWiFiDeviceClient *)self ref];
  [v7 ref];

  LODWORD(v7) = WiFiDeviceClientStopNetwork();
  return (int)v7;
}

- (BOOL)_completionMapsAreEmpty
{
  v2 = _startSessionToCompletionMap();
  objc_sync_enter(v2);
  id v3 = _startSessionToCompletionMap();
  uint64_t v4 = [v3 count];

  objc_sync_exit(v2);
  id v5 = _stopSessionToCompletionMap();
  objc_sync_enter(v5);
  id v6 = _stopSessionToCompletionMap();
  uint64_t v7 = v4 | [v6 count];

  objc_sync_exit(v5);
  return v7 == 0;
}

- (__WiFiDeviceClient)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiDeviceClient *)a3
{
  self->_ref = a3;
}

@end