@interface PKSharingChannelHandle_Client
+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4;
+ (void)descriptorsForAccountDevices:(id)a3;
- (id)_fetchTransportIdentifier;
- (id)_initWithQueue:(id)a3;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)transportIdentifier;
- (void)attachWithCompletion:(id)a3;
- (void)closeWithCompletion:(id)a3;
- (void)didReceiveMessages:(id)a3 reply:(id)a4;
- (void)didReceiveUpdatedTransportIdentifier:(id)a3 reply:(id)a4;
- (void)fetchHandleTransferToken:(id)a3;
- (void)invalidateFromRemoteWithReply:(id)a3;
- (void)invalidateWithRemoteWithCompletion:(id)a3;
- (void)markMessageAsHandled:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)relinquishWithCompletion:(id)a3;
- (void)remoteDeviceInformation:(id)a3;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4;
- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4;
@end

@implementation PKSharingChannelHandle_Client

+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[PKSharingChannelHandle_Client alloc] _initWithQueue:v6];
  v8 = [v7 _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKSharingChannelHandle_Client_createHandleForDescriptor_queue___block_invoke;
  v13[3] = &unk_1E56DE248;
  v13[4] = &v14;
  [v8 configureHandleWithDescriptor:v5 completion:v13];
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v9 = [v7 _fetchTransportIdentifier];
    v10 = (void *)v7[16];
    v7[16] = v9;

    v11 = v7;
  }
  else
  {
    [v7 invalidate];
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)_initWithQueue:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKSharingChannelHandle_Client;
  v3 = [(PKSharingChannelHandle *)&v11 _initWithQueue:a3];
  v4 = (id *)v3;
  if (v3)
  {
    v3[30] = 0;
    id v5 = [PKXPCService alloc];
    id v6 = PDSharingChannelServiceInterface_Server();
    v7 = PKSharingChannelServiceInterface_Client();
    uint64_t v8 = [(PKXPCService *)v5 initWithMachServiceName:@"com.apple.passd.sharing-channel" remoteObjectInterface:v6 exportedObjectInterface:v7 exportedObject:v4];
    id v9 = v4[14];
    v4[14] = (id)v8;

    [v4[14] setDelegate:v4];
  }
  return v4;
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke;
    v10[3] = &unk_1E56F28E0;
    v10[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v11 = v5;
    v7 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_3;
    v8[3] = &unk_1E56D84A0;
    v8[4] = self;
    id v9 = v6;
    [v7 pingWithCompletion:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)attachWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke;
    v10[3] = &unk_1E56F28E0;
    v10[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v11 = v5;
    v7 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_3;
    v8[3] = &unk_1E56D84A0;
    v8[4] = self;
    id v9 = v6;
    [v7 attachWithCompletion:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke;
    v13[3] = &unk_1E56F28E0;
    v13[4] = self;
    id v9 = v7;
    id v15 = v9;
    id v14 = v8;
    v10 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_3;
    v11[3] = &unk_1E56D84A0;
    v11[4] = self;
    id v12 = v9;
    [v10 sendMessage:v6 completion:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)closeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke;
    v10[3] = &unk_1E56F28E0;
    v10[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v11 = v5;
    id v7 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_3;
    v8[3] = &unk_1E56D84A0;
    v8[4] = self;
    id v9 = v6;
    [v7 closeWithCompletion:v8];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)relinquishWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke;
    v10[3] = &unk_1E56F28E0;
    v10[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v11 = v5;
    id v7 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_3;
    v8[3] = &unk_1E56D84A0;
    v8[4] = self;
    id v9 = v6;
    [v7 relinquishWithCompletion:v8];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)markMessageAsHandled:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  id v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__PKSharingChannelHandle_Client_markMessageAsHandled___block_invoke;
    v11[3] = &unk_1E56DB8E8;
    id v7 = v5;
    id v12 = v7;
    uint64_t v8 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PKSharingChannelHandle_Client_markMessageAsHandled___block_invoke_2;
    v9[3] = &unk_1E56D8AE0;
    id v10 = v7;
    [v8 markMessageAsHandled:v4 completion:v9];
  }
}

- (void)invalidateWithRemoteWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke;
  v10[3] = &unk_1E56D8388;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke_2;
  v8[3] = &unk_1E56D8360;
  id v9 = v5;
  id v7 = v5;
  [v6 invalidateFromRemoteWithReply:v8];
}

- (void)fetchHandleTransferToken:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertionAllowWhileTransferring:1];
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke;
    v12[3] = &unk_1E56DB8E8;
    id v7 = v5;
    id v13 = v7;
    uint64_t v8 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v12];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke_2;
    v9[3] = &unk_1E56D89A0;
    id v11 = v4;
    id v10 = v7;
    [v8 fetchHandleTransferToken:v9];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)remoteDeviceInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke;
    v10[3] = &unk_1E56F28E0;
    void v10[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v11 = v5;
    id v7 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_3;
    v8[3] = &unk_1E56F2908;
    void v8[4] = self;
    id v9 = v6;
    [v7 remoteDeviceInformation:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)transportIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSString *)self->_transportIdentifier copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_fetchTransportIdentifier
{
  v2 = [(PKSharingChannelHandle_Client *)self _synchronousRemoteObjectProxyWithErrorHandler:0];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__136;
  id v14 = __Block_byref_object_dispose__137;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKSharingChannelHandle_Client__fetchTransportIdentifier__block_invoke;
  v9[3] = &unk_1E56DDF30;
  void v9[4] = &v10;
  [v2 transportIdentifierWithCompletion:v9];
  v3 = (void *)v11[5];
  if (!v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x22uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to get transport identifier!", v8, 2u);
    }

    id v5 = (void *)v11[5];
    void v11[5] = @"UNKNOWN";

    v3 = (void *)v11[5];
  }
  id v6 = v3;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke;
    v12[3] = &unk_1E56D9528;
    void v12[4] = self;
    id v8 = v6;
    id v13 = v8;
    id v9 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKSharingChannelHandle_Client_startProximityAdvertisementOfType_completion___block_invoke_3;
    v10[3] = &unk_1E56F2930;
    void v10[4] = self;
    id v11 = v8;
    [v9 startProximityAdvertisementOfType:a3 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKSharingChannelHandle *)self createActionAssertion];
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke;
    v13[3] = &unk_1E56D9528;
    v13[4] = self;
    id v9 = v7;
    id v14 = v9;
    uint64_t v10 = [(PKSharingChannelHandle_Client *)self _remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__PKSharingChannelHandle_Client_startProximityDetectionForAdvertisement_completion___block_invoke_3;
    v11[3] = &unk_1E56F2958;
    void v11[4] = self;
    id v12 = v9;
    [v10 startProximityDetectionForAdvertisement:v6 completion:v11];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

+ (void)descriptorsForAccountDevices:(id)a3
{
  id v3 = a3;
  id v4 = [PKSharingChannelHandle_Client alloc];
  uint64_t v5 = [(PKSharingChannelHandle_Client *)v4 _initWithQueue:MEMORY[0x1E4F14428]];
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = @"XPC-Helper";

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke;
    v14[3] = &unk_1E56D9528;
    id v8 = v6;
    id v15 = v8;
    id v9 = v3;
    id v16 = v9;
    uint64_t v10 = [v8 _remoteObjectProxyWithErrorHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_3;
    v11[3] = &unk_1E56D8810;
    id v12 = v8;
    id v13 = v9;
    [v10 descriptorsForAccountDevices:v11];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)invalidateFromRemoteWithReply:(id)a3
{
}

- (void)didReceiveMessages:(id)a3 reply:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKSharingChannelHandle_Client;
  uint64_t v5 = (void (**)(void))a4;
  [(PKSharingChannelHandle *)&v6 didReceiveMessages:a3];
  v5[2](v5);
}

- (void)didReceiveUpdatedTransportIdentifier:(id)a3 reply:(id)a4
{
  p_lock = &self->_lock;
  uint64_t v10 = (void (**)(void))a4;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = (NSString *)[v7 copy];

  transportIdentifier = self->_transportIdentifier;
  self->_transportIdentifier = v8;

  os_unfair_lock_unlock(p_lock);
  v10[2]();
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
}

- (id)_remoteObjectProxy
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxy];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end