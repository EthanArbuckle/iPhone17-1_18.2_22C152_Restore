@interface SSUIServiceClient
- (SSUIServiceClient)init;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
@end

@implementation SSUIServiceClient

- (SSUIServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSUIServiceClient;
  v2 = [(SSUIServiceClient *)&v6 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x263F3F7F0]) initWithConfigurator:&__block_literal_global_1];
  facilityClient = v2->_facilityClient;
  v2->_facilityClient = (FBSServiceFacilityClient *)v3;

  return v2;
}

void __25__SSUIServiceClient_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F3F7F0];
  id v5 = a2;
  uint64_t v3 = [v2 defaultShellEndpoint];
  [v5 setEndpoint:v3];

  [v5 setIdentifier:SSUIServiceIdentifier];
  v4 = [MEMORY[0x263F3F6A8] userInitiated];
  [v5 setServiceQuality:v4];

  [v5 setCalloutQueue:MEMORY[0x263EF83A0]];
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F3F818]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke;
  v14[3] = &unk_2644EDBC8;
  id v9 = v6;
  id v15 = v9;
  v10 = (void *)[v8 initWithMessagePacker:v14];
  facilityClient = self->_facilityClient;
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke_2;
    v12[3] = &unk_2644EDBF0;
    id v13 = v7;
    [(FBSServiceFacilityClient *)facilityClient sendMessage:v10 withType:0 replyHandler:v12 waitForReply:0 timeout:10.0];
  }
  else
  {
    [(FBSServiceFacilityClient *)facilityClient sendMessage:v10 withType:0];
  }
}

void __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F29D08];
  id v4 = a2;
  id v6 = [v3 coder];
  [v6 encodeObject:*(void *)(a1 + 32) forKey:@"SSUIServiceRequest"];
  id v5 = [v6 createMessage];
  xpc_dictionary_set_value(v4, "SSUIServiceRequest", v5);
}

uint64_t __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end