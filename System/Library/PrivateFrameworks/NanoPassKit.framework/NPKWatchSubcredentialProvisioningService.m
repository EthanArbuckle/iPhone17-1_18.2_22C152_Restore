@interface NPKWatchSubcredentialProvisioningService
- (NPKWatchSubcredentialProvisioningService)init;
- (void)canAcceptInvitationOnRemoteDeviceResponse:(id)a3;
- (void)fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion:(id)a3;
- (void)fetchAccountAttestationAnonymizationSaltResponse:(id)a3;
- (void)registerProtobufActionsForService:(id)a3;
- (void)sendAcceptSubcredentialProvisioningRequestForInvitation:(id)a3 metadata:(id)a4;
- (void)sendAcceptSubcredentialProvisioningRequestForMailboxAddress:(id)a3 activationCode:(id)a4;
- (void)sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation:(id)a3 completion:(id)a4;
@end

@implementation NPKWatchSubcredentialProvisioningService

- (NPKWatchSubcredentialProvisioningService)init
{
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Expected to instantiate NPKWatchSubcredentialProvisioningService on watch.", v7, 2u);
    }
  }
  return 0;
}

- (void)registerProtobufActionsForService:(id)a3
{
  id v3 = a3;
  [v3 setProtobufAction:sel_canAcceptInvitationOnRemoteDeviceResponse_ forIncomingResponsesOfType:73];
  [v3 setProtobufAction:sel_fetchAccountAttestationAnonymizationSaltResponse_ forIncomingResponsesOfType:74];
}

- (void)sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (void *)MEMORY[0x223C37380](v7);
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending can accept invitation on remote device request with completion: %@", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  v14 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke;
  v17[3] = &unk_2644D4668;
  objc_copyWeak(&v21, (id *)buf);
  v19 = self;
  id v20 = v7;
  id v18 = v6;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(v14, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_alloc_init(NPKProtoCanAcceptInvitationRequest);
  BOOL v4 = NPKSecureArchiveObject(*(void **)(a1 + 32));
  [(NPKProtoCanAcceptInvitationRequest *)v3 setInvitationData:v4];

  id v5 = objc_alloc(MEMORY[0x263F4A228]);
  id v6 = [(NPKProtoCanAcceptInvitationRequest *)v3 data];
  id v7 = (void *)[v5 initWithProtobufData:v6 type:73 isResponse:0];

  v8 = [WeakRetained sendProtobuf:v7 responseExpected:1];
  if (v8)
  {
    BOOL v9 = MEMORY[0x223C37380](*(void *)(a1 + 48));
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke_2;
    v18[3] = &unk_2644D4640;
    id v20 = *(id *)(a1 + 48);
    v18[4] = WeakRetained;
    id v10 = v8;
    id v19 = v10;
    v11 = (void *)MEMORY[0x223C37380](v18);
    v12 = *(void **)(a1 + 40);
    v13 = (void *)MEMORY[0x223C37380](v9);
    [v12 trackOutstandingRequestWithMessageIdentifier:v10 completionHandler:v13 errorHandler:v11];
  }
  else
  {
    v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15) {
      goto LABEL_4;
    }
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v7;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);
    }
  }

LABEL_4:
}

void __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else
  {
    BOOL v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138543618;
        v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: No response expected for message with identifier %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)canAcceptInvitationOnRemoteDeviceResponse:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v10 = [v4 npkDescription];
      int v34 = 138543618;
      v35 = v9;
      __int16 v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Received canAcceptInvitationOnRemoteDeviceResponse: incoming protobuf %@", (uint8_t *)&v34, 0x16u);
    }
  }
  v11 = [v4 context];
  __int16 v12 = [v11 incomingResponseIdentifier];

  if (!v12)
  {
    __int16 v23 = pk_Payment_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      uint64_t v25 = pk_Payment_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        int v34 = 138543362;
        v35 = v27;
        v28 = "Error: %{public}@: No associated message ID in response";
        v29 = v25;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_21E92F000, v29, v30, v28, (uint8_t *)&v34, 0xCu);
      }
LABEL_16:
    }
LABEL_17:
    id v19 = 0;
    v22 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = [(NPKSubcredentialProvisioningService *)self outstandingRequests];
  uint64_t v14 = [v13 objectForKey:v12];

  if (!v14)
  {
    v31 = pk_Payment_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      uint64_t v25 = pk_Payment_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v33);
        int v34 = 138543362;
        v35 = v27;
        v28 = "Warning: %{public}@: Got response with no associated message handler";
        v29 = v25;
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v15 = [NPKProtoCanAcceptInvitationResponse alloc];
  id v16 = [v4 data];
  v17 = [(NPKProtoCanAcceptInvitationResponse *)v15 initWithData:v16];

  id v18 = [(NPKSubcredentialProvisioningService *)self outstandingRequests];
  [v18 removeObjectForKey:v12];

  id v19 = [v14 completionHandler];
  id v20 = [(NPKProtoCanAcceptInvitationResponse *)v17 errorData];
  id v21 = objc_opt_class();
  v22 = NPKSecureUnarchiveObject(v20, v21);

  if (v19) {
    ((void (**)(void, BOOL, void *))v19)[2](v19, v22 == 0, v22);
  }
LABEL_18:
}

- (void)sendAcceptSubcredentialProvisioningRequestForInvitation:(id)a3 metadata:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      __int16 v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending subcredential provisioning request for invitation: %@", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  uint64_t v13 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForInvitation_metadata___block_invoke;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(v13, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __109__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForInvitation_metadata___block_invoke(void **a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = objc_alloc_init(NPKProtoAcceptSubcredentialInvitationRequest);
  id v4 = NPKSecureArchiveObject(a1[4]);
  [(NPKProtoAcceptSubcredentialInvitationRequest *)v3 setInvitationData:v4];

  BOOL v5 = NPKSecureArchiveObject(a1[5]);
  [(NPKProtoAcceptSubcredentialInvitationRequest *)v3 setMetadataData:v5];

  id v6 = objc_alloc(MEMORY[0x263F4A228]);
  id v7 = [(NPKProtoAcceptSubcredentialInvitationRequest *)v3 data];
  v8 = (void *)[v6 initWithProtobufData:v7 type:122 isResponse:0];

  BOOL v9 = NSString;
  int v10 = [a1[4] identifier];
  v11 = [v9 stringWithFormat:@"%@-%@", @"SubcredentialProvisioning", v10];

  uint64_t v23 = *MEMORY[0x263F49F60];
  v24[0] = v11;
  __int16 v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v13 = [WeakRetained sendProtobuf:v8 responseExpected:0 extraOptions:v12];
  if (!v13)
  {
    id v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      id v16 = pk_General_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543618;
        id v20 = v18;
        __int16 v21 = 2112;
        __int16 v22 = v8;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);
      }
    }
  }
}

- (void)sendAcceptSubcredentialProvisioningRequestForMailboxAddress:(id)a3 activationCode:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 length] == 0;
  BOOL v9 = pk_General_log();
  int v10 = v9;
  if (v8)
  {
    BOOL v16 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      id v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v19;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: %{public}@: Unable to initiate subcredential provisioning request for empty mailbox address", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      __int16 v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543875;
        uint64_t v25 = v14;
        __int16 v26 = 2113;
        id v27 = v6;
        __int16 v28 = 2113;
        id v29 = v7;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending subcredential provisioning request for mailbox address: %{private}@, activationCode: %{private}@", buf, 0x20u);
      }
    }
    objc_initWeak((id *)buf, self);
    BOOL v15 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __119__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForMailboxAddress_activationCode___block_invoke;
    block[3] = &unk_2644D34F0;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v6;
    id v22 = v7;
    dispatch_async(v15, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __119__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForMailboxAddress_activationCode___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_alloc_init(NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest);
  [(NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest *)v3 setMailboxAddress:*(void *)(a1 + 32)];
  [(NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest *)v3 setActivationCode:*(void *)(a1 + 40)];
  id v4 = objc_alloc(MEMORY[0x263F4A228]);
  BOOL v5 = [(NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest *)v3 data];
  id v6 = (void *)[v4 initWithProtobufData:v5 type:126 isResponse:0];

  id v7 = [NSString stringWithFormat:@"%@-%@", @"SubcredentialProvisioning", *(void *)(a1 + 32)];
  uint64_t v19 = *MEMORY[0x263F49F60];
  v20[0] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  BOOL v9 = [WeakRetained sendProtobuf:v6 responseExpected:0 extraOptions:v8];
  if (!v9)
  {
    int v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      __int16 v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        BOOL v16 = v14;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);
      }
    }
  }
}

- (void)fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      int v10 = (void *)MEMORY[0x223C37380](v4);
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending fetch account attestation anonymization salt request with completion: %@", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  BOOL v11 = [(NPKSubcredentialProvisioningService *)self subcredentialProvisioningQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke;
  block[3] = &unk_2644D4690;
  objc_copyWeak(&v15, (id *)buf);
  void block[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_alloc_init(NPKProtoAccountAttestationAnonymizationSaltRequest);
  id v4 = objc_alloc(MEMORY[0x263F4A228]);
  BOOL v5 = [(NPKProtoAccountAttestationAnonymizationSaltRequest *)v3 data];
  BOOL v6 = (void *)[v4 initWithProtobufData:v5 type:74 isResponse:0];

  uint64_t v25 = *MEMORY[0x263F49F60];
  v26[0] = @"SubcredentialProvisioning";
  id v7 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  BOOL v8 = [WeakRetained sendProtobuf:v6 responseExpected:1 extraOptions:v7];
  if (v8)
  {
    BOOL v9 = MEMORY[0x223C37380](*(void *)(a1 + 40));
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke_2;
    v18[3] = &unk_2644D4640;
    id v20 = *(id *)(a1 + 40);
    v18[4] = WeakRetained;
    id v10 = v8;
    id v19 = v10;
    BOOL v11 = (void *)MEMORY[0x223C37380](v18);
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = (void *)MEMORY[0x223C37380](v9);
    [v12 trackOutstandingRequestWithMessageIdentifier:v10 completionHandler:v13 errorHandler:v11];
  }
  else
  {
    id v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15) {
      goto LABEL_4;
    }
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);
    }
  }

LABEL_4:
}

void __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        BOOL v8 = NSStringFromClass(v7);
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138543618;
        BOOL v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: No response expected for message with identifier %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)fetchAccountAttestationAnonymizationSaltResponse:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v10 = [v4 npkDescription];
      int v35 = 138543618;
      __int16 v36 = v9;
      __int16 v37 = 2112;
      uint64_t v38 = v10;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Received accountAttestationAnonymizationSaltResponse: incoming protobuf %@", (uint8_t *)&v35, 0x16u);
    }
  }
  BOOL v11 = [v4 context];
  __int16 v12 = [v11 incomingResponseIdentifier];

  if (!v12)
  {
    uint64_t v24 = pk_Payment_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      __int16 v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = (objc_class *)objc_opt_class();
        __int16 v28 = NSStringFromClass(v27);
        int v35 = 138543362;
        __int16 v36 = v28;
        id v29 = "Error: %{public}@: No associated message ID in response";
        uint64_t v30 = v26;
        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_21E92F000, v30, v31, v29, (uint8_t *)&v35, 0xCu);
      }
LABEL_16:
    }
LABEL_17:
    id v19 = 0;
    id v20 = 0;
    __int16 v23 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = [(NPKSubcredentialProvisioningService *)self outstandingRequests];
  uint64_t v14 = [v13 objectForKey:v12];

  if (!v14)
  {
    BOOL v32 = pk_Payment_log();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      __int16 v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = (objc_class *)objc_opt_class();
        __int16 v28 = NSStringFromClass(v34);
        int v35 = 138543362;
        __int16 v36 = v28;
        id v29 = "Warning: %{public}@: Got response with no associated message handler";
        uint64_t v30 = v26;
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v15 = [NPKProtoAccountAttestationAnonymizationSaltResponse alloc];
  BOOL v16 = [v4 data];
  __int16 v17 = [(NPKProtoAccountAttestationAnonymizationSaltResponse *)v15 initWithData:v16];

  __int16 v18 = [(NPKSubcredentialProvisioningService *)self outstandingRequests];
  [v18 removeObjectForKey:v12];

  id v19 = [v14 completionHandler];
  id v20 = [(NPKProtoAccountAttestationAnonymizationSaltResponse *)v17 anonymizationSalt];
  id v21 = [(NPKProtoAccountAttestationAnonymizationSaltResponse *)v17 errorData];
  id v22 = objc_opt_class();
  __int16 v23 = NPKSecureUnarchiveObject(v21, v22);

  if (v19) {
    ((void (**)(void, void *, void *))v19)[2](v19, v20, v23);
  }
LABEL_18:
}

@end