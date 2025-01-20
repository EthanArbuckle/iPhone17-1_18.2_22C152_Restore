@interface NPKNanoPassDaemonConnection
- (NPKNanoPassDaemonConnection)init;
- (PKXPCService)remoteService;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_remoteObjectProxySynchronous:(BOOL)a3 withFailureHandler:(id)a4;
- (void)_addLegacyExpressModeEnabledUserNotificationForPassUniqueID:(id)a3 completion:(id)a4;
- (void)addRemoteDevicePendingProvisionings:(id)a3;
- (void)addUserNotificationForEnabledExpressMode:(unint64_t)a3 passUniqueID:(id)a4 completion:(id)a5;
- (void)addUserNotificationOfType:(unint64_t)a3 passUniqueID:(id)a4 completion:(id)a5;
- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4;
- (void)canNotifyAboutExpressModeWithCompletion:(id)a3;
- (void)fetchIdentityProofingConfigurationForCountry:(id)a3 state:(id)a4 completion:(id)a5;
- (void)fetchRelevantPassInformationWithCompletion:(id)a3;
- (void)handleApplicationRedirectRequestOnPairedDeviceForPaymentPass:(id)a3 transaction:(id)a4;
- (void)handleMetadataRequestOnPairedDevice:(id)a3 withAssociatedApplicationIdentifiers:(id)a4 completion:(id)a5;
- (void)identityPassPrearmStatusSynchronous:(BOOL)a3 completion:(id)a4;
- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9;
- (void)noteWillDeleteAccountsSynchronous:(BOOL)a3 completion:(id)a4;
- (void)remoteService:(id)a3 didEstablishConnection:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)remoteServiceDidResume:(id)a3;
- (void)remoteServiceDidSuspend:(id)a3;
- (void)setRemoteService:(id)a3;
- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5;
- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3;
- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4;
@end

@implementation NPKNanoPassDaemonConnection

- (NPKNanoPassDaemonConnection)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)NPKNanoPassDaemonConnection;
  v2 = [(NPKNanoPassDaemonConnection *)&v11 init];
  if (v2)
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v2;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] New connection created: %@", buf, 0xCu);
      }
    }
    id v6 = objc_alloc(MEMORY[0x263F5C2F0]);
    v7 = NPKNanoPassDaemonConnectionProtocolInterface();
    uint64_t v8 = [v6 initWithMachServiceName:@"com.apple.NPKNanoPassDaemonConnection.XPC" remoteObjectInterface:v7 exportedObjectInterface:0 exportedObject:0];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;

    [(PKXPCService *)v2->_remoteService setDelegate:v2];
    [(PKXPCService *)v2->_remoteService setForceConnectionOnResume:1];
  }
  return v2;
}

- (void)handleMetadataRequestOnPairedDevice:(id)a3 withAssociatedApplicationIdentifiers:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    objc_super v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v8;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection handleMetadataRequestOnPairedDevice %@", buf, 0xCu);
      }
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke;
    v20[3] = &unk_2644D2B10;
    id v14 = v9;
    id v21 = v14;
    v15 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v20];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke_2;
    v16[3] = &unk_2644D2F90;
    id v17 = v8;
    v18 = self;
    id v19 = v14;
    [v15 handleMetadataRequestOnPairedDevice:v17 withAssociatedApplicationIdentifiers:v10 completion:v16];
  }
}

void __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for request %@", (uint8_t *)&v11, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)handleApplicationRedirectRequestOnPairedDeviceForPaymentPass:(id)a3 transaction:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection applicationRedirectRequestOnPairDevice %@-%@", (uint8_t *)&v12, 0x16u);
    }
  }
  int v11 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:&__block_literal_global_1];
  [v11 handleApplicationRedirectRequestOnPairedDeviceForPaymentPass:v6 transaction:v7];
}

void __104__NPKNanoPassDaemonConnection_handleApplicationRedirectRequestOnPairedDeviceForPaymentPass_transaction___block_invoke()
{
  v0 = pk_General_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    id v2 = pk_General_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }
  }
}

- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)MEMORY[0x223C37380](v7);
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection canAcceptInvitationOnRemoteDeviceForInvitation: %@ completion: %@", buf, 0x16u);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke;
  v20[3] = &unk_2644D2B10;
  id v12 = v7;
  id v21 = v12;
  id v13 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke_49;
  v16[3] = &unk_2644D2FD8;
  v18 = self;
  id v19 = v12;
  id v17 = v6;
  id v14 = v12;
  id v15 = v6;
  [v13 canAcceptInvitationOnRemoteDeviceForInvitation:v15 completion:v16];
}

void __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = @"NO";
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412802;
      if (a2) {
        BOOL v9 = @"YES";
      }
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for invitation %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnRemoteDeviceForInvitation: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v8 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:&__block_literal_global_58];
  [v8 startSubcredentialProvisioningOnRemoteDeviceForInvitation:v4];
}

void __89__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke()
{
  v0 = pk_General_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    id v2 = pk_General_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }
  }
}

- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138478083;
      id v13 = v6;
      __int16 v14 = 2113;
      id v15 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress: %{private}@, activationCode: %{private}@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v11 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:&__block_literal_global_60];
  [v11 startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:v6 activationCode:v7];
}

void __108__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress_activationCode___block_invoke()
{
  v0 = pk_General_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    id v2 = pk_General_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }
  }
}

- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        id v13 = @"YES";
      }
      else {
        id v13 = @"NO";
      }
      __int16 v14 = (void *)MEMORY[0x223C37380](v9);
      *(_DWORD *)buf = 138412802;
      id v26 = v8;
      __int16 v27 = 2112;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnLocalDeviceMatchingInvitation: %@ shouldFetchAnonymizationSaltFromRemoteDevice: %@ completion: %@", buf, 0x20u);
    }
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke;
  v23[3] = &unk_2644D2B10;
  id v15 = v9;
  id v24 = v15;
  uint64_t v16 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v23];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_61;
  v19[3] = &unk_2644D3000;
  id v21 = self;
  id v22 = v15;
  id v20 = v8;
  id v17 = v15;
  id v18 = v8;
  [v16 startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:v18 shouldFetchAnonymizationSaltFromRemoteDevice:v6 completion:v19];
}

void __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    BOOL v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for invitation %@", (uint8_t *)&v11, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addRemoteDevicePendingProvisionings:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection addRemoteDevicePendingProvisionings: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v8 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:&__block_literal_global_64];
  [v8 addRemoteDevicePendingProvisionings:v4];
}

void __67__NPKNanoPassDaemonConnection_addRemoteDevicePendingProvisionings___block_invoke()
{
  v0 = pk_General_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    id v2 = pk_General_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }
  }
}

- (void)noteWillDeleteAccountsSynchronous:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v19 = v4;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection stated noteWillDeleteAccountsSynchronous: %d", buf, 8u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v10 = v6;
  id v17 = v10;
  uint64_t v11 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:v4 withFailureHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke_65;
  v13[3] = &unk_2644D3028;
  BOOL v15 = v4;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 noteWillDeleteAccountsWithCompletion:v13];
}

uint64_t __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke_65(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection finished noteWillDeleteAccountsSynchronous: %d", (uint8_t *)v7, 8u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)identityPassPrearmStatusSynchronous:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v18 = v4;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started identityPassPrearmStatusSynchronous %d", buf, 8u);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke;
  v15[3] = &unk_2644D2B10;
  id v10 = v6;
  id v16 = v10;
  uint64_t v11 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:v4 withFailureHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke_66;
  v13[3] = &unk_2644D3050;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 identityPassPrearmStatusWithCompletion:v13];
}

uint64_t __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke_66(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromNPKIDVDeviceCredentialPrearmStatus(a2);
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Received identity Pass Prearm status: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addUserNotificationOfType:(unint64_t)a3 passUniqueID:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromNPKNanoPassbookUserNotificationType(a3);
      int v14 = 138412546;
      BOOL v15 = v13;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Request to add user notification of type: %@ for passUniqueID: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  switch(a3)
  {
    case 0uLL:
      [(NPKNanoPassDaemonConnection *)self _addLegacyExpressModeEnabledUserNotificationForPassUniqueID:v8 completion:v9];
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      goto LABEL_8;
    default:
      a3 = 0;
LABEL_8:
      [(NPKNanoPassDaemonConnection *)self addUserNotificationForEnabledExpressMode:a3 passUniqueID:v8 completion:v9];
      break;
  }
}

- (void)addUserNotificationForEnabledExpressMode:(unint64_t)a3 passUniqueID:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started addUserNotificationForEnabledExpressMode: %lu, pass unique ID: %@", buf, 0x16u);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __96__NPKNanoPassDaemonConnection_addUserNotificationForEnabledExpressMode_passUniqueID_completion___block_invoke;
  v22[3] = &unk_2644D2B10;
  id v13 = v9;
  id v23 = v13;
  int v14 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v22];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96__NPKNanoPassDaemonConnection_addUserNotificationForEnabledExpressMode_passUniqueID_completion___block_invoke_68;
  v17[3] = &unk_2644D3078;
  id v20 = v13;
  unint64_t v21 = a3;
  id v18 = v8;
  uint64_t v19 = self;
  id v15 = v13;
  id v16 = v8;
  [v14 addUserNotificationForEnabledExpressMode:a3 passUniqueID:v16 completion:v17];
}

void __96__NPKNanoPassDaemonConnection_addUserNotificationForEnabledExpressMode_passUniqueID_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __96__NPKNanoPassDaemonConnection_addUserNotificationForEnabledExpressMode_passUniqueID_completion___block_invoke_68(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[7];
      uint64_t v8 = a1[4];
      int v10 = 134218498;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection finished addUserNotificationForEnabledExpressMode: %lu, passUniqueID: %@, error?: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)canNotifyAboutExpressModeWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)MEMORY[0x223C37380](v4);
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started canNotifyAboutExpressModeWithCompletion %@", buf, 0xCu);
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke;
  v14[3] = &unk_2644D2B10;
  id v9 = v4;
  id v15 = v9;
  int v10 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke_70;
  v12[3] = &unk_2644D2B68;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 canNotifyAboutExpressModeWithCompletion:v12];
}

void __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    BOOL v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5 != 0);
  }
}

uint64_t __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (a2) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with canNotify: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)fetchRelevantPassInformationWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)MEMORY[0x223C37380](v4);
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started fetchRelevantPassInformationWithCompletion %@", buf, 0xCu);
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke;
  v14[3] = &unk_2644D2B10;
  id v9 = v4;
  id v15 = v9;
  int v10 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke_72;
  v12[3] = &unk_2644D30A0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 fetchRelevantPassInformationWithCompletion:v12];
}

void __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    BOOL v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with relevantPassInformation: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v3, 0);
  }
}

- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9
{
  BOOL v10 = a7;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = pk_General_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    id v24 = pk_General_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started insertBridgeBulletinWithTitle:message:actionURL:forPass:playSound:notificationIdentifier:expirationDate:", buf, 2u);
    }
  }
  unint64_t v25 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:&__block_literal_global_75];
  [v25 insertBridgeBulletinWithTitle:v21 message:v20 actionURL:v19 forPass:v18 playSound:v10 notificationIdentifier:v17 expirationDate:v16];
}

void __135__NPKNanoPassDaemonConnection_insertBridgeBulletinWithTitle_message_actionURL_forPass_playSound_notificationIdentifier_expirationDate___block_invoke()
{
  v0 = pk_General_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    id v2 = pk_General_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }
  }
}

- (void)fetchIdentityProofingConfigurationForCountry:(id)a3 state:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_General_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (void *)MEMORY[0x223C37380](v8);
      *(_DWORD *)buf = 138412290;
      BOOL v23 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started fetchIdentityProofingConfigurationForCountry:state:completion %@", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke;
  v20[3] = &unk_2644D2B10;
  id v15 = v8;
  id v21 = v15;
  id v16 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke_76;
  v18[3] = &unk_2644D30C8;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 fetchIdentityProofingConfigurationForCountry:v10 state:v9 completion:v18];
}

void __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    BOOL v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with configuration: %@, error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (id)_remoteObjectProxySynchronous:(BOOL)a3 withFailureHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(NPKNanoPassDaemonConnection *)self remoteService];
  BOOL v8 = [(NPKNanoPassDaemonConnection *)self _errorHandlerWithCompletion:v6];
  if (v4) {
    [v7 synchronousRemoteObjectProxyWithErrorHandler:v8];
  }
  else {
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v8];
  }

  if (!v9)
  {
    uint64_t v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446978;
        uint64_t v15 = "-[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:]";
        __int16 v16 = 2082;
        id v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKNanoPassDaemonConnection.m";
        __int16 v18 = 2048;
        uint64_t v19 = 307;
        __int16 v20 = 1024;
        BOOL v21 = v4;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:] (synchronous:%d) would have returned nil)", (uint8_t *)&v14, 0x26u);
      }
    }
    _NPKAssertAbort();
  }

  return v9;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__NPKNanoPassDaemonConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2644D2B90;
  id v9 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x223C37380](v8);
  id v6 = (void *)MEMORY[0x223C37380]();

  return v6;
}

void __59__NPKNanoPassDaemonConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Error on NPKNanoPassDaemonConnection connection: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)_addLegacyExpressModeEnabledUserNotificationForPassUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Handling legacy express mode enabled codepath for pass unique ID: %@", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __102__NPKNanoPassDaemonConnection__addLegacyExpressModeEnabledUserNotificationForPassUniqueID_completion___block_invoke;
  v20[3] = &unk_2644D2B10;
  id v11 = v7;
  id v21 = v11;
  id v12 = [(NPKNanoPassDaemonConnection *)self _remoteObjectProxySynchronous:0 withFailureHandler:v20];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__NPKNanoPassDaemonConnection__addLegacyExpressModeEnabledUserNotificationForPassUniqueID_completion___block_invoke_79;
  v15[3] = &unk_2644D3078;
  id v18 = v11;
  uint64_t v19 = 0;
  id v16 = v6;
  id v17 = self;
  id v13 = v11;
  id v14 = v6;
  [v12 addUserNotificationOfType:0 passUniqueID:v14 completion:v15];
}

void __102__NPKNanoPassDaemonConnection__addLegacyExpressModeEnabledUserNotificationForPassUniqueID_completion___block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __102__NPKNanoPassDaemonConnection__addLegacyExpressModeEnabledUserNotificationForPassUniqueID_completion___block_invoke_79(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[7];
      uint64_t v8 = a1[4];
      int v10 = 134218498;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection finished addUserNotificationOfType: %lu, passUniqueID: %@, error?: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service %@ didEstablishConnection: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service %@ didInterruptConnection: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)remoteServiceDidResume:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service didResume: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)remoteServiceDidSuspend:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service didSuspend: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end