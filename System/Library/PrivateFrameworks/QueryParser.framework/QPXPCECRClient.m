@interface QPXPCECRClient
+ (id)sharedClient;
- (BOOL)coolDownECRClientSyncWithError:(id *)a3;
- (BOOL)warmUpECRClientSyncWithError:(id *)a3;
- (QPXPCECRClient)init;
- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4;
@end

@implementation QPXPCECRClient

+ (id)sharedClient
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__QPXPCECRClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedClient_onceToken_109 != -1) {
    dispatch_once(&sharedClient_onceToken_109, block);
  }
  v2 = (void *)sharedClient_client_108;
  return v2;
}

void __30__QPXPCECRClient_sharedClient__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedClient_client_108;
  sharedClient_client_108 = (uint64_t)v1;
}

- (QPXPCECRClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)QPXPCECRClient;
  v2 = [(QPECRClient *)&v8 init];
  if (v2)
  {
    if (ecrClientLogger_token != -1) {
      dispatch_once(&ecrClientLogger_token, &__block_literal_global_14);
    }
    v3 = ecrClientLogger_log;
    if (os_log_type_enabled((os_log_t)ecrClientLogger_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_224D85000, v3, OS_LOG_TYPE_DEFAULT, "Initializing QPXPCECRClient", v7, 2u);
    }
    v4 = (GDEntityResolutionTextClient *)objc_alloc_init(MEMORY[0x263F4E890]);
    client = v2->_client;
    v2->_client = v4;
  }
  return v2;
}

- (id)resolveEntitiesWithRequest:(id)a3 error:(id *)a4
{
  return (id)[(GDEntityResolutionTextClient *)self->_client resolveEntitiesForRequest:a3 error:a4];
}

- (BOOL)warmUpECRClientSyncWithError:(id *)a3
{
  client = self->_client;
  id v8 = 0;
  [(GDEntityResolutionTextClient *)client warmupForMode:3 error:&v8];
  id v5 = v8;
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return v6 == 0;
}

- (BOOL)coolDownECRClientSyncWithError:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end