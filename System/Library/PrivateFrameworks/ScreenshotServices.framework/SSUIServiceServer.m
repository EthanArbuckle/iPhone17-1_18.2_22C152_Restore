@interface SSUIServiceServer
- (BOOL)_handleHasAnySSUIServiceEntitlement:(id)a3;
- (SSUIServiceServer)initWithDelegate:(id)a3;
- (SSUIServiceServerDelegate)delegate;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SSUIServiceServer

- (SSUIServiceServer)initWithDelegate:(id)a3
{
  v4 = SSUIServiceIdentifier;
  v5 = (void *)MEMORY[0x263F3F7E8];
  id v6 = a3;
  v7 = [v5 queueWithDispatchQueue:MEMORY[0x263EF83A0]];
  v10.receiver = self;
  v10.super_class = (Class)SSUIServiceServer;
  v8 = [(FBSServiceFacility *)&v10 initWithIdentifier:v4 queue:v7];

  [(SSUIServiceServer *)v8 setDelegate:v6];
  return v8;
}

- (BOOL)_handleHasAnySSUIServiceEntitlement:(id)a3
{
  id v3 = a3;
  if ([v3 hasEntitlement:SSUIShowScreenshotUIEntitlement]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasEntitlement:SSUIRunPPTEntitlement];
  }

  return v4;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v7 = a3;
  v8 = [a5 processHandle];
  if ([(SSUIServiceServer *)self _handleHasAnySSUIServiceEntitlement:v8])
  {
    v9 = [v7 payload];
    objc_super v10 = xpc_dictionary_get_value(v9, "SSUIServiceRequest");
    v11 = [MEMORY[0x263F29D08] coderWithMessage:v10];
    v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"SSUIServiceRequest"];
    v13 = [(id)objc_opt_class() entitlement];
    int v14 = [v8 hasEntitlement:v13];

    if (v14)
    {
      v15 = [(SSUIServiceServer *)self delegate];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__SSUIServiceServer_noteDidReceiveMessage_withType_fromClient___block_invoke;
      v17[3] = &unk_2644EDB30;
      v18 = v7;
      [v15 server:self handleRequest:v12 withCompletion:v17];

      v16 = v18;
    }
    else
    {
      v16 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SSUIServiceServer noteDidReceiveMessage:withType:fromClient:](v8, (uint64_t)v12, v16);
      }
    }
  }
  else
  {
    objc_super v10 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SSUIServiceServer noteDidReceiveMessage:withType:fromClient:](v8, v10);
    }
    v9 = v10;
  }
}

uint64_t __63__SSUIServiceServer_noteDidReceiveMessage_withType_fromClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyMessageWithPacker:&__block_literal_global_6];
}

- (SSUIServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSUIServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)noteDidReceiveMessage:(void *)a1 withType:(uint64_t)a2 fromClient:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = [a1 pid];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v7[0] = 67109378;
  v7[1] = v4;
  __int16 v8 = 2112;
  v9 = v6;
  _os_log_error_impl(&dword_21ECED000, a3, OS_LOG_TYPE_ERROR, "Client at pid %d attempted to send invalid request %@ for its entitlements, ignoring", (uint8_t *)v7, 0x12u);
}

- (void)noteDidReceiveMessage:(void *)a1 withType:(NSObject *)a2 fromClient:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 pid];
  _os_log_error_impl(&dword_21ECED000, a2, OS_LOG_TYPE_ERROR, "Unauthorized client at pid %d attempted connection to SSUIService, ignoring", (uint8_t *)v3, 8u);
}

@end