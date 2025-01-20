@interface PKTrustedDeviceEnrollmentInfoProvider
- (PKTrustedDeviceEnrollmentInfoProvider)init;
- (id)_existingRemoteObjectProxy;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (void)trustedDeviceEnrollmentInfoWithCompletion:(id)a3;
- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 completion:(id)a6;
@end

@implementation PKTrustedDeviceEnrollmentInfoProvider

- (PKTrustedDeviceEnrollmentInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKTrustedDeviceEnrollmentInfoProvider;
  v2 = [(PKTrustedDeviceEnrollmentInfoProvider *)&v8 init];
  if (v2)
  {
    v3 = [PKXPCService alloc];
    v4 = PDTrustedDeviceEnrollmentInfoProviderExportedInterface();
    uint64_t v5 = [(PKXPCService *)v3 initWithMachServiceName:@"com.apple.passd.trusted-device-enrollment-info-provider" remoteObjectInterface:v4 exportedObjectInterface:0 exportedObject:0];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;
  }
  return v2;
}

- (void)trustedDeviceEnrollmentInfoWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke;
    v10[3] = &unk_1E56D83D8;
    id v6 = v4;
    v10[4] = self;
    id v11 = v6;
    v7 = [(PKTrustedDeviceEnrollmentInfoProvider *)self _remoteObjectProxyWithFailureHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_3;
    v8[3] = &unk_1E56EB4E0;
    v8[4] = self;
    id v9 = v6;
    [v7 trustedDeviceEnrollmentInfoWithHandler:v8];
  }
}

void __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_2;
  v3[3] = &unk_1E56D83D8;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_4;
  v10[3] = &unk_1E56D8518;
  id v7 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = v10;
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke;
    v18[3] = &unk_1E56D8770;
    id v12 = v10;
    v18[4] = self;
    id v19 = v12;
    id v13 = a5;
    id v14 = a4;
    v15 = [(PKTrustedDeviceEnrollmentInfoProvider *)self _remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_3;
    v16[3] = &unk_1E56EB530;
    v16[4] = self;
    id v17 = v12;
    [v15 trustedDeviceEnrollmentSignatureForDevice:a3 accountDSID:v14 sessionData:v13 handler:v16];
  }
}

void __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v10 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, 0, 0, *(void *)(a1 + 32));
}

void __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_4;
  v16[3] = &unk_1E56EB508;
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = a3;
  id v17 = v9;
  id v18 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  id v19 = v11;
  uint64_t v20 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

uint64_t __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[9], a1[5], a1[6]);
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_existingRemoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService existingRemoteObjectProxy];
}

- (void).cxx_destruct
{
}

@end