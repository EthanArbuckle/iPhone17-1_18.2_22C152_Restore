@interface WLNETRBClient
- (BOOL)_completionsAreNil;
- (BOOL)_startDHCPWithInterface:(id)a3;
- (BOOL)_stopDHCP;
- (BOOL)isIPAddressInRange:(id)a3;
- (NETRBClient)_netrbClient;
- (WLNETRBClient)init;
- (void)_didStartDHCPWithSuccess:(BOOL)a3;
- (void)_didStopDHCPWithSuccess:(BOOL)a3;
- (void)startDHCPWithCompletion:(id)a3;
- (void)stopDHCPWithCompletion:(id)a3;
@end

@implementation WLNETRBClient

- (WLNETRBClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLNETRBClient;
  return [(WLNETRBClient *)&v3 init];
}

- (void)startDHCPWithCompletion:(id)a3
{
  v12 = (void (**)(id, void))a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263F581E8], "255.255.255.0");
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263F581F0], "10.17.1.199");
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263F581D8], "10.17.1.254");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x263F581D0], 3uLL);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263F581E0], "ap1");
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_dhcpStartCompletionBlock)
  {
    v10 = "_dhcpStartCompletionBlock == nil";
    int v11 = 52;
    goto LABEL_10;
  }
  if (v5->_dhcpStopCompletionBlock)
  {
    v10 = "_dhcpStopCompletionBlock == nil";
    int v11 = 53;
LABEL_10:
    __assert_rtn("-[WLNETRBClient startDHCPWithCompletion:]", "WLNETRBClient.m", v11, v10);
  }
  uint64_t v6 = MEMORY[0x230F5E7D0](v12);
  id dhcpStartCompletionBlock = v5->_dhcpStartCompletionBlock;
  v5->_id dhcpStartCompletionBlock = (id)v6;

  objc_sync_exit(v5);
  if (![(WLNETRBClient *)v5 _startDHCPWithInterface:v4])
  {
    _WLLog();
    v8 = v5;
    objc_sync_enter(v8);
    id v9 = v5->_dhcpStartCompletionBlock;
    v5->_id dhcpStartCompletionBlock = 0;

    objc_sync_exit(v8);
    v12[2](v12, 0);
  }
}

- (BOOL)_startDHCPWithInterface:(id)a3
{
  id v4 = a3;
  [(WLNETRBClient *)self _netrbClient];
  LOBYTE(self) = _NETRBClientStartService();

  return (char)self;
}

- (void)_didStartDHCPWithSuccess:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v19 = a3;
  _WLLog();
  v22 = 0;
  id v5 = 0;
  uint64_t v6 = 0;
  if (getifaddrs(&v22)) {
    goto LABEL_2;
  }
  v10 = v22;
  if (!v22)
  {
    MEMORY[0x230F5E4E0](0);
    id v5 = 0;
    uint64_t v6 = 0;
    goto LABEL_2;
  }
  v21 = self;
  uint64_t v6 = 0;
  id v5 = 0;
  do
  {
    ifa_addr = v10->ifa_addr;
    if (ifa_addr->sa_family != 2) {
      goto LABEL_14;
    }
    inet_ntop(2, &ifa_addr->sa_data[2], v23, 0x100u);
    ifa_name = v10->ifa_name;
    _WLLog();
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", v10->ifa_name, ifa_name, v23);
    v13 = [NSString stringWithUTF8String:v23];
    int v14 = [v12 isEqualToString:@"ap1"];
    int v15 = [v13 isEqualToString:@"10.17.1.199"];
    if (v14)
    {
      if ((v15 & 1) == 0)
      {
        uint64_t v16 = [NSString stringWithUTF8String:v23];
        v17 = v6;
        uint64_t v6 = (void *)v16;
LABEL_12:
      }
    }
    else if (v15)
    {
      id v18 = v12;
      v17 = v5;
      id v5 = v18;
      goto LABEL_12;
    }

LABEL_14:
    v10 = v10->ifa_next;
  }
  while (v10);
  MEMORY[0x230F5E4E0](v22);
  if (v6)
  {
    objc_msgSend(v6, "UTF8String", v19);
    _WLLog();
  }
  uint64_t v3 = v3;
  self = v21;
  if (v5)
  {
    id v5 = v5;
    [v5 UTF8String];
    _WLLog();
  }
LABEL_2:
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void (**)(void, void))MEMORY[0x230F5E7D0](v7->_dhcpStartCompletionBlock);
  id dhcpStartCompletionBlock = v7->_dhcpStartCompletionBlock;
  v7->_id dhcpStartCompletionBlock = 0;

  objc_sync_exit(v7);
  if (v8) {
    v8[2](v8, v3);
  }
  else {
    _WLLog();
  }
}

- (void)stopDHCPWithCompletion:(id)a3
{
  int v11 = (void (**)(id, void))a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_dhcpStartCompletionBlock)
  {
    id v9 = "_dhcpStartCompletionBlock == nil";
    int v10 = 135;
    goto LABEL_10;
  }
  if (v4->_dhcpStopCompletionBlock)
  {
    id v9 = "_dhcpStopCompletionBlock == nil";
    int v10 = 136;
LABEL_10:
    __assert_rtn("-[WLNETRBClient stopDHCPWithCompletion:]", "WLNETRBClient.m", v10, v9);
  }
  uint64_t v5 = MEMORY[0x230F5E7D0](v11);
  id dhcpStopCompletionBlock = v4->_dhcpStopCompletionBlock;
  v4->_id dhcpStopCompletionBlock = (id)v5;

  objc_sync_exit(v4);
  if (![(WLNETRBClient *)v4 _stopDHCP])
  {
    _WLLog();
    v7 = v4;
    objc_sync_enter(v7);
    id v8 = v4->_dhcpStopCompletionBlock;
    v4->_id dhcpStopCompletionBlock = 0;

    objc_sync_exit(v7);
    v11[2](v11, 0);
  }
}

- (BOOL)_stopDHCP
{
  v2 = [(WLNETRBClient *)self _netrbClient];
  return MEMORY[0x270F4DCA0](v2);
}

- (void)_didStopDHCPWithSuccess:(BOOL)a3
{
  _WLLog();
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v6 = (void (**)(void))MEMORY[0x230F5E7D0](v4->_dhcpStopCompletionBlock);
  id dhcpStopCompletionBlock = v4->_dhcpStopCompletionBlock;
  v4->_id dhcpStopCompletionBlock = 0;

  objc_sync_exit(v4);
  if (v6) {
    v6[2](v6);
  }
  else {
    _WLLog();
  }
}

- (NETRBClient)_netrbClient
{
  result = self->_netrbClientRef;
  if (!result)
  {
    dispatch_queue_t v4 = dispatch_queue_create("WelcomeKitCore netrbClientQueue", 0);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__WLNETRBClient__netrbClient__block_invoke;
    v6[3] = &unk_26490CE40;
    objc_copyWeak(&v7, &location);
    uint64_t v5 = (void *)MEMORY[0x230F5E7D0](v6);
    self->_netrbClientRef = (NETRBClient *)_NETRBClientCreate();

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

    return self->_netrbClientRef;
  }
  return result;
}

uint64_t __29__WLNETRBClient__netrbClient__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  _WLLog();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == 1002)
    {
      objc_msgSend(WeakRetained, "_didStopDHCPWithSuccess:", xpc_dictionary_get_uint64(v5, (const char *)*MEMORY[0x263F581F8]) == 5002, a2, v5);
    }
    else if (a2 == 1001)
    {
      objc_msgSend(WeakRetained, "_didStartDHCPWithSuccess:", xpc_dictionary_get_uint64(v5, (const char *)*MEMORY[0x263F581F8]) == 5002, a2, v5);
    }
  }

  return 0;
}

- (BOOL)_completionsAreNil
{
  return !self->_dhcpStartCompletionBlock && self->_dhcpStopCompletionBlock == 0;
}

- (BOOL)isIPAddressInRange:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = (void *)[[NSString alloc] initWithCString:"10.17.1.199" encoding:4];
  id v5 = (void *)[[NSString alloc] initWithCString:"10.17.1.254" encoding:4];
  if (![v4 length] || !objc_msgSend(v5, "length") || !objc_msgSend(v3, "length"))
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = 0;
  unsigned int v9 = 0;
  BOOL v6 = 0;
  if (inet_pton(2, (const char *)[v4 UTF8String], (char *)&v10 + 4) == 1)
  {
    if (inet_pton(2, (const char *)[v5 UTF8String], &v10) == 1
      && inet_pton(2, (const char *)[v3 UTF8String], &v9) == 1)
    {
      unsigned int v7 = bswap32(v9);
      if (v7 >= bswap32(HIDWORD(v10)))
      {
        BOOL v6 = v7 <= bswap32(v10);
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dhcpStopCompletionBlock, 0);
  objc_storeStrong(&self->_dhcpStartCompletionBlock, 0);
}

@end