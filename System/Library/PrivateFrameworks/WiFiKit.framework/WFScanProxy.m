@interface WFScanProxy
+ (id)scanProxyWithClient:(id)a3;
- (BOOL)isChannel6GHzPSC:(id)a3;
- (BOOL)isScanningAllowed;
- (NSArray)scannableChannels;
- (WFClient)client;
- (WFScanProxy)initWithClient:(id)a3;
- (double)scanInterval;
- (void)initiateNoNetworksSoftError;
- (void)performScanWithRequest:(id)a3 reply:(id)a4;
- (void)setClient:(id)a3;
@end

@implementation WFScanProxy

+ (id)scanProxyWithClient:(id)a3
{
  id v3 = a3;
  v4 = [[WFScanProxy alloc] initWithClient:v3];

  return v4;
}

- (WFScanProxy)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFScanProxy;
  v6 = [(WFScanProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (double)scanInterval
{
  return 10.0;
}

- (BOOL)isScanningAllowed
{
  v2 = [(WFScanProxy *)self client];
  char v3 = [v2 powered];

  return v3;
}

- (BOOL)isChannel6GHzPSC:(id)a3
{
  id v3 = a3;
  if (([v3 flags] & 0x2000) != 0)
  {
    uint64_t v5 = [v3 channel];
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = isChannel6GHzPSC__pscChannels[v6];
      BOOL v4 = v5 == v7;
    }
    while (v5 != v7 && v6++ != 14);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSArray)scannableChannels
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(WFScanProxy *)self client];
  BOOL v4 = [v3 cInterface];
  uint64_t v5 = [v4 supported20MHzChannels];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v12, "flags", (void)v14) & 0x2000) == 0
            || [(WFScanProxy *)self isChannel6GHzPSC:v12])
          {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

- (void)initiateNoNetworksSoftError
{
  id v3 = [(WFScanProxy *)self client];
  v2 = [v3 interface];
  [v2 notifyNoNetworksFound];
}

- (void)performScanWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFScanProxy *)self client];
  uint64_t v9 = [v8 cInterface];
  uint64_t v10 = [v7 cScanParameters];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__WFScanProxy_performScanWithRequest_reply___block_invoke;
  v12[3] = &unk_26478EFB8;
  id v13 = v6;
  id v11 = v6;
  [v9 performScanWithParameters:v10 reply:v12];
}

void __44__WFScanProxy_performScanWithRequest_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__2;
    v8[4] = __Block_byref_object_dispose__2;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__WFScanProxy_performScanWithRequest_reply___block_invoke_3;
    v7[3] = &unk_26478F080;
    v7[4] = v8;
    [v6 enumerateObjectsUsingBlock:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    _Block_object_dispose(v8, 8);
  }
}

void __44__WFScanProxy_performScanWithRequest_reply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [[WFNetworkScanRecord alloc] initWithScanResults:v3];
  if (v4)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
  else
  {
    id v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[WFScanProxy performScanWithRequest:reply:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_226071000, v5, v6, "%s: unable to create WFNetworkScanRecord for %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end