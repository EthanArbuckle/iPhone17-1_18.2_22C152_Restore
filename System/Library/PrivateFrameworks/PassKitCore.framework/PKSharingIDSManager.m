@interface PKSharingIDSManager
- (BOOL)_canPerformIDSMessageForSharingGroup:(unint64_t)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 error:(id *)a6;
- (NSArray)delegates;
- (PKSharingIDSManager)init;
- (PKSharingIDSManager)initWithIDSService:(id)a3;
- (PKSharingIDSManager)initWithTargetQueue:(id)a3;
- (PKSharingIDSManagerDataSource)dataSource;
- (id)_handlerConfigurationForInvitation:(id)a3 forHandle:(id)a4;
- (id)_idsIDForHandle:(id)a3;
- (id)_primaryAppleIDSharingDestination:(id)a3;
- (id)_sanitizedHande:(id)a3;
- (id)_sanitizedHandleWithFromID:(id)a3;
- (id)_timeoutErrorForIdentifier:(id)a3;
- (void)_cloudStoreZoneShareInvitationRequestInvitationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_cloudStoreZoneShareInvitationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_cloudStoreZoneShareInvitationRequestRemoved:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_cloudStoreZoneShareInvitationResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_deviceSharingCapabilitiesRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_deviceSharingCapabiltiesRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_queue_callCompletionHandlerForIdentifier:(id)a3 withError:(id)a4;
- (void)_registerListeners;
- (void)_remoteRegistrationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_remoteRegistrationRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_sendCloudStoreInvitationRequest:(id)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 type:(unsigned __int16)a6 completion:(id)a7;
- (void)_sendMessageWithProtobuf:(id)a3 destination:(id)a4 handleUserDetails:(id)a5 currentUserDetails:(id)a6 completion:(id)a7;
- (void)_sharingDestinationForHandles:(id)a3 completion:(id)a4;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)requestCloudStoreZoneInvitationData:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)sendCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 invitationError:(id)a5 completion:(id)a6;
- (void)sendCloudStoreZoneInvitationResponse:(id)a3 completion:(id)a4;
- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4;
- (void)sendRemoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)sendRemoteRegistrationRequestResult:(unint64_t)a3 forHandle:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDataSource:(id)a3;
@end

@implementation PKSharingIDSManager

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  delegates = self->_delegates;
  if (!delegates)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  [(NSHashTable *)delegates addObject:v7];
  os_unfair_lock_unlock(&self->_delegatesLock);
}

- (PKSharingIDSManager)init
{
  v3 = [[PKIDSService alloc] initWithServiceName:@"com.apple.private.alloy.applepay.sharing"];
  v4 = [(PKSharingIDSManager *)self initWithIDSService:v3];
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Initializing IDS Sharing manager", v7, 2u);
    }
  }
  return v4;
}

- (PKSharingIDSManager)initWithTargetQueue:(id)a3
{
  v4 = a3;
  v5 = [(PKSharingIDSManager *)self init];
  v6 = v5;
  if (v5)
  {
    dispatch_set_target_queue((dispatch_object_t)v5->_internalQueue, v4);
    dispatch_set_target_queue((dispatch_object_t)v6->_callbackQueue, v4);
  }

  return v6;
}

- (PKSharingIDSManager)initWithIDSService:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKSharingIDSManager;
  v6 = [(PKSharingIDSManager *)&v18 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passd.idssharingmanager.internal", 0);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passd.idssharingmanager.callback", 0);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_service, a3);
    v6->_delegatesLock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharingDestinations = v6->_sharingDestinations;
    v6->_sharingDestinations = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionTimers = v6->_completionTimers;
    v6->_completionTimers = v15;

    [(PKSharingIDSManager *)v6 _registerListeners];
  }

  return v6;
}

- (void)dealloc
{
  [(PKIDSService *)self->_service removeDelegate:self];
  [(PKIDSService *)self->_service unregisterListenersForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)PKSharingIDSManager;
  [(PKSharingIDSManager *)&v3 dealloc];
}

- (void)sendCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 invitationError:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke;
  block[3] = &unk_1E56DF5B8;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(internalQueue, block);
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke(id *a1)
{
  v2 = [a1[4] _handlerConfigurationForInvitation:a1[5] forHandle:a1[6]];
  uint64_t v3 = [v2 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_2;
  v5[3] = &unk_1E56DF590;
  v5[4] = a1[4];
  uint64_t v10 = v3;
  id v9 = a1[8];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  [WeakRetained handlerDetailsForConfiguration:v2 completion:v5];
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 72);
  id v29 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v29];
  id v10 = v29;
  if (!v10 && (v9 & 1) != 0)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_4;
    v19[3] = &unk_1E56DF568;
    id v13 = &v20;
    id v20 = *(id *)(a1 + 40);
    v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 32);
    id v25 = v15;
    v21[1] = v16;
    id v22 = *(id *)(a1 + 56);
    id v23 = v5;
    id v24 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  id v17 = *(void **)(a1 + 64);
  if (v17)
  {
    id v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_3;
    block[3] = &unk_1E56D83D8;
    id v13 = &v28;
    id v28 = v17;
    v14 = &v27;
    id v27 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      id v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      [(PKCloudStoreZoneInvitationRequest *)v5 setInvitation:*(void *)(a1 + 32)];
      [(PKCloudStoreZoneInvitationRequest *)v5 setDestination:v4];
      [(PKCloudStoreZoneInvitationRequest *)v5 setInvitationError:*(void *)(a1 + 56)];
      [*(id *)(a1 + 48) _sendCloudStoreInvitationRequest:v5 handleUserDetails:*(void *)(a1 + 64) currentUserDetails:*(void *)(a1 + 72) type:10 completion:*(void *)(a1 + 80)];
      goto LABEL_13;
    }
    id v5 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v10 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v11 = *(void **)(a1 + 80);
    if (v11)
    {
      id v12 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_32;
      v13[3] = &unk_1E56D83D8;
      id v15 = v11;
      v14 = v5;
      dispatch_async(v12, v13);

      char v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"No invitation defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v6 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 80);
    if (v7)
    {
      uint64_t v8 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_26;
      block[3] = &unk_1E56D83D8;
      id v18 = v7;
      id v17 = v5;
      dispatch_async(v8, block);

      char v9 = v18;
LABEL_12:
    }
  }
LABEL_13:
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_26(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __89__PKSharingIDSManager_sendCloudStoreZoneInvitation_forHandle_invitationError_completion___block_invoke_32(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)removeCloudStoreZoneInvitation:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke;
  v15[3] = &unk_1E56D8BA8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] _handlerConfigurationForInvitation:a1[5] forHandle:a1[6]];
  uint64_t v3 = [v2 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E56DF608;
  v5[4] = a1[4];
  uint64_t v9 = v3;
  id v8 = a1[7];
  id v6 = a1[5];
  id v7 = a1[6];
  [WeakRetained handlerDetailsForConfiguration:v2 completion:v5];
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v28 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v28];
  id v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E56DF5E0;
    id v13 = &v20;
    id v20 = *(id *)(a1 + 40);
    id v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v24 = v15;
    v21[1] = v16;
    id v22 = v5;
    id v23 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    id v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E56D83D8;
    id v13 = &v27;
    id v27 = v17;
    id v14 = &v26;
    id v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      id v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      [(PKCloudStoreZoneInvitationRequest *)v5 setInvitation:*(void *)(a1 + 32)];
      [(PKCloudStoreZoneInvitationRequest *)v5 setDestination:v4];
      [*(id *)(a1 + 48) _sendCloudStoreInvitationRequest:v5 handleUserDetails:*(void *)(a1 + 56) currentUserDetails:*(void *)(a1 + 64) type:11 completion:*(void *)(a1 + 72)];
      goto LABEL_13;
    }
    id v5 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v10 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v11 = *(void **)(a1 + 72);
    if (v11)
    {
      id v12 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_37;
      v13[3] = &unk_1E56D83D8;
      id v15 = v11;
      id v14 = v5;
      dispatch_async(v12, v13);

      char v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"No invitation defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v6 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 72);
    if (v7)
    {
      uint64_t v8 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_36;
      block[3] = &unk_1E56D83D8;
      id v18 = v7;
      id v17 = v5;
      dispatch_async(v8, block);

      char v9 = v18;
LABEL_12:
    }
  }
LABEL_13:
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_36(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __75__PKSharingIDSManager_removeCloudStoreZoneInvitation_forHandle_completion___block_invoke_37(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)sendCloudStoreZoneInvitationResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 protobuf];
  id v9 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v10 = [v8 data];
  id v11 = (void *)[v9 initWithProtobufData:v10 type:10 isResponse:1];

  id v12 = [v7 destination];
  id v13 = [v12 idsDestination];
  id v14 = [v13 name];

  id v15 = [v7 invitation];

  uint64_t v16 = [(PKSharingIDSManager *)self _handlerConfigurationForInvitation:v15 forHandle:v14];

  uint64_t v17 = [v16 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke;
  v22[3] = &unk_1E56DF608;
  id v25 = v6;
  uint64_t v26 = v17;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  id v19 = v12;
  id v20 = v11;
  id v21 = v6;
  [WeakRetained handlerDetailsForConfiguration:v16 completion:v22];
}

void __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v25 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v25];
  id v10 = v25;
  if (!v10 && (v9 & 1) != 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_3;
    block[3] = &unk_1E56D8BF8;
    void block[4] = v11;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = v5;
    id v20 = v6;
    id v21 = *(id *)(a1 + 56);
    dispatch_async(v12, block);

    id v13 = v17;
LABEL_6:

    goto LABEL_7;
  }
  id v14 = *(void **)(a1 + 56);
  if (v14)
  {
    id v15 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_2;
    v22[3] = &unk_1E56D83D8;
    id v24 = v14;
    id v23 = v10;
    dispatch_async(v15, v22);

    id v13 = v24;
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__PKSharingIDSManager_sendCloudStoreZoneInvitationResponse_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessageWithProtobuf:*(void *)(a1 + 40) destination:*(void *)(a1 + 48) handleUserDetails:*(void *)(a1 + 56) currentUserDetails:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)requestCloudStoreZoneInvitationData:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke;
  v15[3] = &unk_1E56D8BA8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] _handlerConfigurationForInvitation:a1[5] forHandle:a1[6]];
  uint64_t v3 = [v2 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 9);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E56DF608;
  v5[4] = a1[4];
  uint64_t v9 = v3;
  id v8 = a1[7];
  id v6 = a1[5];
  id v7 = a1[6];
  [WeakRetained handlerDetailsForConfiguration:v2 completion:v5];
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v28 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v28];
  id v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E56DF5E0;
    id v13 = &v20;
    id v20 = *(id *)(a1 + 40);
    id v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v24 = v15;
    v21[1] = v16;
    id v22 = v5;
    id v23 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    id v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E56D83D8;
    id v13 = &v27;
    id v27 = v17;
    id v14 = &v26;
    id v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      id v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
      [(PKCloudStoreZoneInvitationRequest *)v5 setInvitation:*(void *)(a1 + 32)];
      [(PKCloudStoreZoneInvitationRequest *)v5 setDestination:v4];
      [*(id *)(a1 + 48) _sendCloudStoreInvitationRequest:v5 handleUserDetails:*(void *)(a1 + 56) currentUserDetails:*(void *)(a1 + 64) type:12 completion:*(void *)(a1 + 72)];
      goto LABEL_13;
    }
    id v5 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v10 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v11 = *(void **)(a1 + 72);
    if (v11)
    {
      id v12 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_40;
      v13[3] = &unk_1E56D83D8;
      id v15 = v11;
      id v14 = v5;
      dispatch_async(v12, v13);

      char v9 = v15;
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"No invitation defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v6 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 72);
    if (v7)
    {
      uint64_t v8 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_39;
      block[3] = &unk_1E56D83D8;
      id v18 = v7;
      id v17 = v5;
      dispatch_async(v8, block);

      char v9 = v18;
LABEL_12:
    }
  }
LABEL_13:
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_39(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __80__PKSharingIDSManager_requestCloudStoreZoneInvitationData_forHandle_completion___block_invoke_40(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)_sendCloudStoreInvitationRequest:(id)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 type:(unsigned __int16)a6 completion:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v20 = [v15 protobuf];
  id v16 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v17 = [v20 data];
  id v18 = (void *)[v16 initWithProtobufData:v17 type:v7 isResponse:0];

  id v19 = [v15 destination];

  [(PKSharingIDSManager *)self _sendMessageWithProtobuf:v18 destination:v19 handleUserDetails:v14 currentUserDetails:v13 completion:v12];
}

- (void)sendRemoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke;
  v15[3] = &unk_1E56DEB98;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(internalQueue, v15);
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v2 setHandle:*(void *)(a1 + 32)];
  uint64_t v3 = [(PKSharingIDSManagerHandlerConfiguration *)v2 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_2;
  v5[3] = &unk_1E56DF608;
  v5[4] = *(void *)(a1 + 40);
  uint64_t v9 = v3;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  [WeakRetained handlerDetailsForConfiguration:v2 completion:v5];
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v28 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v28];
  id v10 = v28;
  if (!v10 && (v9 & 1) != 0)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E56DF5E0;
    id v13 = &v20;
    id v20 = *(id *)(a1 + 40);
    id v14 = (id *)v21;
    v21[0] = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v24 = v15;
    v21[1] = v16;
    id v22 = v5;
    id v23 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    id v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E56D83D8;
    id v13 = &v27;
    id v27 = v17;
    id v14 = &v26;
    id v26 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      id v5 = [v4 protobuf];
      id v6 = objc_alloc(MEMORY[0x1E4F6B528]);
      id v7 = [v5 data];
      uint64_t v8 = (void *)[v6 initWithProtobufData:v7 type:13 isResponse:0];

      [*(id *)(a1 + 48) _sendMessageWithProtobuf:v8 destination:v3 handleUserDetails:*(void *)(a1 + 56) currentUserDetails:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
      goto LABEL_13;
    }
    id v5 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    id v13 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v14 = *(void **)(a1 + 72);
    if (v14)
    {
      id v15 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_43;
      v16[3] = &unk_1E56D83D8;
      id v18 = v14;
      id v17 = v5;
      dispatch_async(v15, v16);

      id v12 = v18;
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"No invitation defined for handle %@. Cannot send message.", *(void *)(a1 + 40)];
    char v9 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v10 = *(void **)(a1 + 72);
    if (v10)
    {
      uint64_t v11 = *(NSObject **)(*(void *)(a1 + 48) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_42;
      block[3] = &unk_1E56D83D8;
      id v21 = v10;
      id v20 = v5;
      dispatch_async(v11, block);

      id v12 = v21;
LABEL_12:
    }
  }
LABEL_13:
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_42(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __74__PKSharingIDSManager_sendRemoteRegistrationRequest_forHandle_completion___block_invoke_43(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)sendRemoteRegistrationRequestResult:(unint64_t)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke;
  v13[3] = &unk_1E56D8A40;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v2 setHandle:*(void *)(a1 + 32)];
  uint64_t v3 = [(PKSharingIDSManagerHandlerConfiguration *)v2 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_2;
  v8[3] = &unk_1E56DF658;
  id v5 = *(void **)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  uint64_t v11 = v3;
  id v10 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v9 = v6;
  uint64_t v12 = v7;
  [WeakRetained handlerDetailsForConfiguration:v2 completion:v8];
}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  id v27 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v27];
  id v10 = v27;
  if (!v10 && (v9 & 1) != 0)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_4;
    v19[3] = &unk_1E56DF630;
    id v13 = (id *)v20;
    v20[0] = *(id *)(a1 + 40);
    id v14 = (id *)v23;
    id v15 = *(id *)(a1 + 48);
    v20[1] = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 64);
    v23[0] = v15;
    v23[1] = v16;
    id v21 = v5;
    id v22 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  unint64_t v17 = *(void **)(a1 + 48);
  if (v17)
  {
    id v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_3;
    block[3] = &unk_1E56D83D8;
    id v13 = &v26;
    id v26 = v17;
    id v14 = &v25;
    id v25 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(PKProtobufRemoteRegistrationRequestResult);
    [(PKProtobufRemoteRegistrationRequestResult *)v4 setResult:*(unsigned int *)(a1 + 72)];
    id v5 = objc_alloc(MEMORY[0x1E4F6B528]);
    id v6 = [(PKProtobufRemoteRegistrationRequestResult *)v4 data];
    uint64_t v7 = (void *)[v5 initWithProtobufData:v6 type:13 isResponse:1];

    [*(id *)(a1 + 40) _sendMessageWithProtobuf:v7 destination:v3 handleUserDetails:*(void *)(a1 + 48) currentUserDetails:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    v4 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 32)];
    uint64_t v8 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    char v9 = *(void **)(a1 + 64);
    if (v9)
    {
      id v10 = *(NSObject **)(*(void *)(a1 + 40) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_44;
      block[3] = &unk_1E56D83D8;
      id v13 = v9;
      uint64_t v12 = v4;
      dispatch_async(v10, block);
    }
  }
}

void __80__PKSharingIDSManager_sendRemoteRegistrationRequestResult_forHandle_completion___block_invoke_44(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
      [(PKSharingIDSManagerHandlerConfiguration *)v8 setHandle:v6];
      uint64_t v9 = [(PKSharingIDSManagerHandlerConfiguration *)v8 sharingGroup];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke;
      v12[3] = &unk_1E56DF720;
      v12[4] = self;
      uint64_t v15 = v9;
      id v14 = v7;
      id v13 = v6;
      [WeakRetained handlerDetailsForConfiguration:v8 completion:v12];
    }
    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v17 = "-[PKSharingIDSManager sendDeviceSharingCapabilitiesRequestForHandle:completion:]";
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error: cannot check apple cash capability for a nil receipient handle %s", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  id v27 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v27];
  id v10 = v27;
  if (!v10 && (v9 & 1) != 0)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v5 allHandles];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3;
    v19[3] = &unk_1E56DF6F8;
    id v13 = (id *)v20;
    v20[0] = *(id *)(a1 + 40);
    id v14 = &v23;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    id v23 = v15;
    v20[1] = v16;
    id v21 = v5;
    id v22 = v6;
    [v11 _sharingDestinationForHandles:v12 completion:v19];

LABEL_6:
    goto LABEL_7;
  }
  unint64_t v17 = *(void **)(a1 + 48);
  if (v17)
  {
    uint64_t v18 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2;
    block[3] = &unk_1E56D83D8;
    id v13 = &v26;
    id v26 = v17;
    id v14 = &v25;
    id v25 = v10;
    dispatch_async(v18, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 idsDestination];
  id v5 = [v4 deviceIdentifier];

  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__15;
    v41 = __Block_byref_object_dispose__15;
    id v42 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    id v7 = [MEMORY[0x1E4F6AB38] sharedInstance];
    v37 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_49;
    v28[3] = &unk_1E56DF680;
    id v29 = v5;
    v32 = v33;
    id v30 = *(id *)(a1 + 48);
    id v10 = v6;
    v31 = v10;
    [v7 currentRemoteDevicesForDestinations:v8 service:@"com.apple.private.alloy.applepay.sharing" listenerID:@"com.apple.private.alloy.applepay.sharing" queue:v9 completionBlock:v28];

    dispatch_group_enter(v10);
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F6B528]) initWithProtobufData:0 type:14 isResponse:0];
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_51;
    v25[3] = &unk_1E56DF6A8;
    p_long long buf = &buf;
    id v15 = v10;
    id v26 = v15;
    [v12 _sendMessageWithProtobuf:v11 destination:v3 handleUserDetails:v13 currentUserDetails:v14 completion:v25];
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2_53;
    block[3] = &unk_1E56DF6D0;
    id v22 = *(id *)(a1 + 64);
    id v23 = v33;
    uint64_t v24 = &buf;
    dispatch_group_notify(v15, v16, block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    unint64_t v17 = [NSString stringWithFormat:@"No IDS destination defined for handle %@. Cannot send message.", *(void *)(a1 + 32)];
    uint64_t v18 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }

    id v19 = *(void **)(a1 + 64);
    if (v19)
    {
      id v20 = *(NSObject **)(*(void *)(a1 + 40) + 24);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_46;
      v34[3] = &unk_1E56D83D8;
      id v36 = v19;
      id v35 = v17;
      dispatch_async(v20, v34);
    }
  }
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_46(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v4];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v5);
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count];
  v4 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Family member %@ has %ld possible devices", (uint8_t *)&v7, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_51(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__PKSharingIDSManager_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2_53(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_cloudStoreZoneShareInvitationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  uint64_t v12 = [v10 data];

  uint64_t v13 = [(PKProtobufCloudStoreZoneInvitationRequest *)v11 initWithData:v12];
  uint64_t v14 = [(PKProtobufCloudStoreZoneInvitationRequest *)v13 invitation];
  id v15 = +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:v14];

  uint64_t v16 = +[PKCloudStoreZoneInvitationRequest invitationErrorWithProtobuf:v13];
  unint64_t v17 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  uint64_t v18 = [(PKSharingIDSManager *)self _handlerConfigurationForInvitation:v15 forHandle:v17];
  uint64_t v19 = [v18 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke;
  v23[3] = &unk_1E56DF748;
  v23[4] = self;
  id v24 = v15;
  id v25 = v16;
  uint64_t v26 = v19;
  id v21 = v16;
  id v22 = v15;
  [WeakRetained handlerDetailsForConfiguration:v18 completion:v23];
}

void __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v17 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v17];
  id v9 = v17;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_56;
    block[3] = &unk_1E56DB988;
    void block[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v11, block);
  }
}

void __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_56(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v23 = v4;
    __int16 v24 = 2112;
    id v25 = v2;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud zone invitiation: %@, from destination %@, with error %@", buf, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) delegates];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_57;
        v13[3] = &unk_1E56DB988;
        void v13[4] = v11;
        id v14 = *(id *)(a1 + 48);
        id v15 = *(id *)(a1 + 56);
        id v16 = v2;
        dispatch_async(v12, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

uint64_t __100__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context___block_invoke_57(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 didReceiveCloudStoreZoneInvitation:v4 invitationError:v5 fromDestination:v6];
  }
  return result;
}

- (void)_cloudStoreZoneShareInvitationRequestRemoved:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  uint64_t v12 = [v10 data];

  uint64_t v13 = [(PKProtobufCloudStoreZoneInvitationRequest *)v11 initWithData:v12];
  id v14 = [(PKProtobufCloudStoreZoneInvitationRequest *)v13 invitation];
  id v15 = +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:v14];

  id v16 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  long long v17 = [(PKSharingIDSManager *)self _handlerConfigurationForInvitation:v15 forHandle:v16];
  uint64_t v18 = [v17 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E56DF770;
  id v22 = v15;
  uint64_t v23 = v18;
  v21[4] = self;
  id v20 = v15;
  [WeakRetained handlerDetailsForConfiguration:v17 completion:v21];
}

void __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v16 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v16];
  id v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_60;
    v13[3] = &unk_1E56D8AB8;
    void v13[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);
  }
}

void __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_60(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Removed from cloud zone share: %@, from destination %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_61;
        block[3] = &unk_1E56D8AB8;
        void block[4] = v10;
        id v13 = *(id *)(a1 + 48);
        id v14 = v2;
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __99__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context___block_invoke_61(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 removedFromCloudStoreZoneInvitation:v4 fromDestination:v5];
  }
  return result;
}

- (void)_cloudStoreZoneShareInvitationResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufCloudStoreZoneInvitationResponse alloc];
  uint64_t v12 = [v10 data];

  id v13 = [(PKProtobufCloudStoreZoneInvitationResponse *)v11 initWithData:v12];
  id v14 = +[PKCloudStoreZoneInvitationResponse cloudStoreZoneInvitationResponseWithProtobuf:v13];
  long long v15 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  long long v16 = [v14 invitation];
  long long v17 = [(PKSharingIDSManager *)self _handlerConfigurationForInvitation:v16 forHandle:v15];

  uint64_t v18 = [v17 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E56DF770;
  id v22 = v14;
  uint64_t v23 = v18;
  v21[4] = self;
  id v20 = v14;
  [WeakRetained handlerDetailsForConfiguration:v17 completion:v21];
}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v16 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v16];
  id v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_66;
    v13[3] = &unk_1E56D8AB8;
    void v13[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);
  }
}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_66(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Cloud zone invitation response received: %@, from destination %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_67;
        block[3] = &unk_1E56D8AB8;
        void block[4] = v10;
        id v13 = *(id *)(a1 + 48);
        id v14 = v2;
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __101__PKSharingIDSManager__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context___block_invoke_67(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 40) status];
    id v4 = [*(id *)(a1 + 40) invitation];
    [v2 didReceiveCloudStoreZoneInvitationStatus:v3 forInvitation:v4 fromDestination:*(void *)(a1 + 48)];
  }
}

- (void)_cloudStoreZoneShareInvitationRequestInvitationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufCloudStoreZoneInvitationRequest alloc];
  uint64_t v12 = [v10 data];

  id v13 = [(PKProtobufCloudStoreZoneInvitationRequest *)v11 initWithData:v12];
  id v14 = [(PKProtobufCloudStoreZoneInvitationRequest *)v13 invitation];
  long long v15 = +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:v14];

  long long v16 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  long long v17 = [(PKSharingIDSManager *)self _handlerConfigurationForInvitation:v15 forHandle:v16];
  uint64_t v18 = [v17 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke;
  v21[3] = &unk_1E56DF770;
  id v22 = v15;
  uint64_t v23 = v18;
  v21[4] = self;
  id v20 = v15;
  [WeakRetained handlerDetailsForConfiguration:v17 completion:v21];
}

void __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v16 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v16];
  id v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_70;
    v13[3] = &unk_1E56D8AB8;
    void v13[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);
  }
}

void __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_70(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Received request to share invitation data: %@, from destination %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_71;
        block[3] = &unk_1E56D8AB8;
        void block[4] = v10;
        id v13 = *(id *)(a1 + 48);
        id v14 = v2;
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __106__PKSharingIDSManager__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context___block_invoke_71(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didRequestCloudStoreZoneInvitationData:v4 fromDestination:v5];
  }
  return result;
}

- (void)_remoteRegistrationRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufRemoteRegistrationRequest alloc];
  uint64_t v12 = [v10 data];

  id v13 = [(PKProtobufRemoteRegistrationRequest *)v11 initWithData:v12];
  id v14 = +[PKRemoteRegistrationRequest remoteRegistrationRequestWithProtobuf:v13];
  long long v15 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  long long v16 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v16 setHandle:v15];
  uint64_t v17 = [(PKSharingIDSManagerHandlerConfiguration *)v16 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke;
  v20[3] = &unk_1E56DF770;
  id v21 = v14;
  uint64_t v22 = v17;
  v20[4] = self;
  id v19 = v14;
  [WeakRetained handlerDetailsForConfiguration:v16 completion:v20];
}

void __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v16 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v16];
  id v9 = v16;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_76;
    v13[3] = &unk_1E56D8AB8;
    void v13[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v13);
  }
}

void __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_76(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Received request to register: %@, from destination %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_77;
        block[3] = &unk_1E56D8AB8;
        void block[4] = v10;
        id v13 = *(id *)(a1 + 48);
        id v14 = v2;
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __89__PKSharingIDSManager__remoteRegistrationRequestReceived_service_account_fromID_context___block_invoke_77(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didRequestToRegister:v4 fromDestination:v5];
  }
  return result;
}

- (void)_remoteRegistrationRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [PKProtobufRemoteRegistrationRequestResult alloc];
  uint64_t v12 = [v10 data];

  id v13 = [(PKProtobufRemoteRegistrationRequestResult *)v11 initWithData:v12];
  uint64_t v14 = [(PKProtobufRemoteRegistrationRequestResult *)v13 result];
  long long v15 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];

  long long v16 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v16 setHandle:v15];
  uint64_t v17 = [(PKSharingIDSManagerHandlerConfiguration *)v16 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke;
  v19[3] = &unk_1E56DF7C0;
  void v19[4] = self;
  v19[5] = v17;
  v19[6] = v14;
  [WeakRetained handlerDetailsForConfiguration:v16 completion:v19];
}

void __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v18 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v18];
  id v9 = v18;
  if (v9 || (v8 & 1) == 0)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = *(NSObject **)(v10 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_80;
    v15[3] = &unk_1E56DF798;
    void v15[4] = v10;
    id v12 = v5;
    uint64_t v13 = a1[6];
    id v16 = v12;
    uint64_t v17 = v13;
    dispatch_async(v11, v15);
  }
}

void __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_80(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  uint64_t v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = PKDeviceRegistrationResultToString(*(void *)(a1 + 48));
    *(_DWORD *)long long buf = 138412546;
    __int16 v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Remote registration request result received: %@, from destination %@", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) delegates];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_81;
        block[3] = &unk_1E56DF798;
        uint64_t v12 = *(void *)(a1 + 48);
        void block[4] = v10;
        uint64_t v15 = v12;
        id v14 = v2;
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __95__PKSharingIDSManager__remoteRegistrationRequestResultReceived_service_account_fromID_context___block_invoke_81(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = a1[5];
    uint64_t v3 = a1[6];
    id v5 = (void *)a1[4];
    return [v5 didReceiveRemoteRegistationResult:v3 fromDestination:v4];
  }
  return result;
}

- (void)_deviceSharingCapabiltiesRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v8 = -[PKSharingIDSManager _sanitizedHandleWithFromID:](self, "_sanitizedHandleWithFromID:", a6, a4, a5);
  uint64_t v9 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v9 setHandle:v8];
  uint64_t v10 = [(PKSharingIDSManagerHandlerConfiguration *)v9 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke;
  v12[3] = &unk_1E56DF810;
  v12[4] = self;
  void v12[5] = v10;
  [WeakRetained handlerDetailsForConfiguration:v9 completion:v12];
}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v21 = 0;
  char v9 = [v7 _canPerformIDSMessageForSharingGroup:v8 handleUserDetails:v5 currentUserDetails:v6 error:&v21];
  id v10 = v21;
  uint64_t v11 = PKLogFacilityTypeGetObject(9uLL);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 || (v9 & 1) == 0)
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Received request to provided apple cash sharing capabilities from destination %@", buf, 0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = [v5 allHandles];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_84;
    v17[3] = &unk_1E56DF7E8;
    uint64_t v15 = v6;
    uint64_t v16 = *(void *)(a1 + 32);
    long long v18 = v15;
    uint64_t v19 = v16;
    id v20 = v5;
    [v13 _sharingDestinationForHandles:v14 completion:v17];

    uint64_t v11 = v18;
  }
}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(PKDeviceSharingCapabilities);
  id v5 = [*(id *)(a1 + 32) familyMember];
  id v6 = [v5 appleID];
  [(PKDeviceSharingCapabilities *)v4 setHandle:v6];

  uint64_t v7 = [v5 altDSID];
  [(PKDeviceSharingCapabilities *)v4 setAltDSID:v7];

  [(PKDeviceSharingCapabilities *)v4 setSupportsManatee:PKSupportsManateeForAppleCashForIDS()];
  uint64_t v8 = PKCurrentRegion();
  [(PKDeviceSharingCapabilities *)v4 setDeviceRegion:v8];

  char v9 = +[PKOSVersionRequirement fromDeviceVersion];
  [(PKDeviceSharingCapabilities *)v4 setFromDeviceVersion:v9];

  id v10 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v22 = v4;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Sending apple cash sharing capabilities %@", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  BOOL v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_87;
  block[3] = &unk_1E56DB960;
  uint64_t v16 = v4;
  uint64_t v17 = v11;
  id v18 = v3;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 32);
  id v13 = v3;
  id v14 = v4;
  dispatch_async(v12, block);
}

void __95__PKSharingIDSManager__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context___block_invoke_87(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) protobuf];
  id v2 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v3 = [v5 data];
  uint64_t v4 = (void *)[v2 initWithProtobufData:v3 type:14 isResponse:1];

  [*(id *)(a1 + 40) _sendMessageWithProtobuf:v4 destination:*(void *)(a1 + 48) handleUserDetails:*(void *)(a1 + 56) currentUserDetails:*(void *)(a1 + 64) completion:0];
}

- (void)_deviceSharingCapabilitiesRequestResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a6;
  id v10 = [a3 data];
  if (v10)
  {
    uint64_t v11 = [[PKProtobufDeviceSharingCapabilities alloc] initWithData:v10];
    BOOL v12 = +[PKDeviceSharingCapabilities deviceSharingCapbilitesRequestWithProtobuf:v11];
  }
  else
  {
    BOOL v12 = 0;
  }
  id v13 = [(PKSharingIDSManager *)self _sanitizedHandleWithFromID:v9];
  id v14 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:1];
  [(PKSharingIDSManagerHandlerConfiguration *)v14 setHandle:v13];
  uint64_t v15 = [(PKSharingIDSManagerHandlerConfiguration *)v14 sharingGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke;
  v19[3] = &unk_1E56DF748;
  void v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  uint64_t v22 = v15;
  id v17 = v13;
  id v18 = v12;
  [WeakRetained handlerDetailsForConfiguration:v14 completion:v19];
}

void __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v17 = 0;
  char v8 = [v6 _canPerformIDSMessageForSharingGroup:v7 handleUserDetails:v5 currentUserDetails:a3 error:&v17];
  id v9 = v17;
  if (v9 || (v8 & 1) == 0)
  {
    BOOL v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot perform IDS action %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_89;
    block[3] = &unk_1E56DB988;
    void block[4] = v10;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v11, block);
  }
}

void __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_89(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _primaryAppleIDSharingDestination:*(void *)(a1 + 40)];
  id v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Device sharing capabilities received: %@, from destination %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) delegates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_90;
        block[3] = &unk_1E56D8AB8;
        void block[4] = v10;
        id v13 = *(id *)(a1 + 48);
        id v14 = *(id *)(a1 + 56);
        dispatch_async(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __102__PKSharingIDSManager__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context___block_invoke_90(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didReceiveDeviceSharingCapabilities:v4 forHandle:v5];
  }
  return result;
}

- (NSArray)delegates
{
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  uint64_t v4 = [(NSHashTable *)self->_delegates allObjects];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_delegatesLock);
  return (NSArray *)v5;
}

- (void)removeDelegate:(id)a3
{
  p_delegatesLock = &self->_delegatesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_unlock(p_delegatesLock);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = a6;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "IDS Service has delivered message: %@, context: %@", (uint8_t *)&v10, 0x16u);
  }

  [(PKSharingIDSManager *)self _queue_callCompletionHandlerForIdentifier:v8 withError:0];
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  __int16 v12 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316418;
    uint64_t v14 = "-[PKSharingIDSManager service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v15 = 2112;
    id v16 = a3;
    __int16 v17 = 2112;
    id v18 = a4;
    __int16 v19 = 2112;
    id v20 = a5;
    __int16 v21 = 2112;
    id v22 = a6;
    __int16 v23 = 2112;
    id v24 = a7;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %@ %@", (uint8_t *)&v13, 0x3Eu);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (char *)a5;
  id v15 = a7;
  id v16 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316418;
    id v18 = "-[PKSharingIDSManager service:account:identifier:didSendWithSuccess:error:]";
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 1024;
    BOOL v26 = v8;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %d %@", (uint8_t *)&v17, 0x3Au);
  }

  if (!v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v14;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed to send with success: %@", (uint8_t *)&v17, 0xCu);
    }

    [(PKSharingIDSManager *)self _queue_callCompletionHandlerForIdentifier:v14 withError:v15];
  }
}

- (id)_handlerConfigurationForInvitation:(id)a3 forHandle:(id)a4
{
  uint64_t v16 = 0;
  id v5 = a4;
  uint64_t v6 = [a3 zoneName];
  id v14 = 0;
  id v15 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:v6 outZoneType:&v16 outAccountIdentifier:&v15 altDSID:&v14];
  id v7 = v15;
  id v8 = v14;

  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = v16 - 2;
  if ((unint64_t)(v16 - 2) <= 4)
  {
    uint64_t v9 = qword_191673AF8[v11];
    uint64_t v10 = qword_191673B20[v11];
  }
  id v12 = [[PKSharingIDSManagerHandlerConfiguration alloc] initWithSharingGroup:v10];
  [(PKSharingIDSManagerHandlerConfiguration *)v12 setAccountIdentifier:v7];

  [(PKSharingIDSManagerHandlerConfiguration *)v12 setHandle:v5];
  [(PKSharingIDSManagerHandlerConfiguration *)v12 setAccessLevel:v9];

  return v12;
}

- (BOOL)_canPerformIDSMessageForSharingGroup:(unint64_t)a3 handleUserDetails:(id)a4 currentUserDetails:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!a3)
  {
    id v13 = NSString;
    id v14 = @"Error: cannot send IDS message because for an unknown account type";
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    id v15 = [v9 accountUser];

    if (!v15)
    {
      [NSString stringWithFormat:@"Error: cannot send IDS message because %@ does not have an account user defined", v9];
      goto LABEL_16;
    }
    uint64_t v16 = [v10 accountUser];

    if (v16)
    {
LABEL_10:
      int v17 = 0;
      BOOL v18 = 1;
      goto LABEL_19;
    }
    id v13 = NSString;
    id v23 = v10;
    id v14 = @"Error: cannot send IDS message because the current user %@ does not have an account user defined";
LABEL_15:
    objc_msgSend(v13, "stringWithFormat:", v14, v23);
    goto LABEL_16;
  }
  if (a3 != 1)
  {
    BOOL v18 = 0;
    int v17 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = [v9 familyMember];

  if (!v11)
  {
    [NSString stringWithFormat:@"Error: cannot send IDS message because %@ is not in the family circle", v9];
    goto LABEL_16;
  }
  id v12 = [v10 familyMember];

  if (v12) {
    goto LABEL_10;
  }
  [NSString stringWithFormat:@"Error: cannot send IDS message because the current user %@ is not in the family circle", v10];
  uint64_t v19 = LABEL_16:;
  int v17 = (void *)v19;
  BOOL v18 = 0;
  if (a6 && v19)
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v19;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    *a6 = [v20 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v21];

    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)_sendMessageWithProtobuf:(id)a3 destination:(id)a4 handleUserDetails:(id)a5 currentUserDetails:(id)a6 completion:(id)a7
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(PKIDSService *)self->_service underlyingService];
  uint64_t v16 = [v15 iCloudAccount];

  if ([v16 isActive])
  {
    uint64_t v43 = v14;
    int v17 = v12;
    BOOL v18 = v11;
    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    id v20 = [v16 registeredURIs];
    __int16 v21 = [v19 setWithArray:v20];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke;
    v47[3] = &unk_1E56DF838;
    v47[4] = self;
    id v22 = objc_msgSend(v21, "pk_setByApplyingBlock:", v47);

    id v23 = [v13 primaryAppleID];
    v40 = v23;
    if ([v22 count] && !objc_msgSend(v22, "containsObject:", v23)
      || (id v24 = v23) == 0)
    {
      __int16 v25 = [v13 aliases];
      BOOL v26 = (void *)[v25 mutableCopy];
      [v26 intersectSet:v22];
      __int16 v27 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        id v51 = v25;
        __int16 v52 = 2112;
        id v53 = v22;
        __int16 v54 = 2112;
        v55 = v26;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "The family member appleID is not in the list of registeredURIs with IDS. Checking the family members aliases %@ against the IDS registeredURIs %@. The overlapping appleIDs are %@", buf, 0x20u);
      }

      id v24 = [v26 anyObject];
    }
    v41 = v22;
    uint64_t v28 = [(PKSharingIDSManager *)self _idsIDForHandle:v24];
    uint64_t v29 = (void *)v28;
    id v44 = v13;
    id v42 = v16;
    if (v28)
    {
      uint64_t v48 = *MEMORY[0x1E4F6A9B8];
      uint64_t v49 = v28;
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v31 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v51 = v29;
        __int16 v52 = 2112;
        id v53 = v11;
        _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Using IDS fromID as %@ for request protobuf %@", buf, 0x16u);
      }
    }
    else
    {
      v31 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v51 = 0;
        __int16 v52 = 2112;
        id v53 = v11;
        _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Not defining IDS fromID as %@ for request protobuf %@", buf, 0x16u);
      }
      id v30 = 0;
    }

    id v36 = [(PKIDSService *)self->_service underlyingService];
    v37 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = v17;
    v38 = [v17 idsDestination];
    uint64_t v39 = [v37 setWithObject:v38];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_115;
    v45[3] = &unk_1E56D91C8;
    id v14 = v43;
    v45[4] = self;
    id v46 = v43;
    PKProtobufSendWithOptions(v36, v18, v39, 300, 0, 0, 1, v45, v30);

    id v11 = v18;
    id v13 = v44;
    uint64_t v16 = v42;
  }
  else
  {
    id v24 = [NSString stringWithFormat:@"Error: cannot sent IDS message since the Apple Account is not active %@", v16];
    v32 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v51 = v24;
      _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v14)
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      v57[0] = v24;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      id v35 = [v33 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v34];
      (*((void (**)(id, void *))v14 + 2))(v14, v35);
    }
  }
}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sanitizedHandleWithFromID:a2];
}

void __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      id v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_2;
      block[3] = &unk_1E56D83D8;
      uint64_t v28 = v7;
      id v27 = v6;
      dispatch_async(v8, block);

      dispatch_source_t v9 = v28;
LABEL_7:

      goto LABEL_8;
    }
  }
  if (v5 && *(void *)(a1 + 40))
  {
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_3;
    handler[3] = &unk_1E56D8A90;
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    id v24 = v11;
    uint64_t v25 = v12;
    dispatch_source_set_event_handler(v9, handler);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_116;
    id v20 = &unk_1E56D8A90;
    uint64_t v21 = *(void *)(a1 + 32);
    id v13 = v11;
    id v22 = v13;
    dispatch_source_set_cancel_handler(v9, &v17);
    id v14 = *(void **)(*(void *)(a1 + 32) + 40);
    id v15 = objc_msgSend(*(id *)(a1 + 40), "copy", v17, v18, v19, v20, v21);
    uint64_t v16 = _Block_copy(v15);
    [v14 setObject:v16 forKey:v13];

    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v9 forKey:v13];
    dispatch_resume(v9);

    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKSharingIDSManager request timer has fired for %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v6 + 8);
  id v7 = [v5 _timeoutErrorForIdentifier:v4];
  objc_msgSend(v5, "_queue_callCompletionHandlerForIdentifier:withError:", v4, v7);
}

uint64_t __108__PKSharingIDSManager__sendMessageWithProtobuf_destination_handleUserDetails_currentUserDetails_completion___block_invoke_116(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_queue_callCompletionHandlerForIdentifier:(id)a3 withError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to call completion block for %@ with error %@", buf, 0x16u);
    }

    uint64_t v9 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v6];
    uint64_t v10 = [(NSMutableDictionary *)self->_completionTimers objectForKey:v6];
    id v11 = v10;
    if (v10)
    {
      dispatch_source_cancel(v10);
      [(NSMutableDictionary *)self->_completionTimers removeObjectForKey:v6];
    }
    if (v9)
    {
      [(NSMutableDictionary *)self->_completionHandlers removeObjectForKey:v6];
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKSharingIDSManager__queue_callCompletionHandlerForIdentifier_withError___block_invoke;
      block[3] = &unk_1E56D89F0;
      id v14 = v6;
      id v15 = v7;
      id v16 = v9;
      dispatch_async(callbackQueue, block);
    }
  }
}

uint64_t __75__PKSharingIDSManager__queue_callCompletionHandlerForIdentifier_withError___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Calling completion block for %@ with error %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_timeoutErrorForIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = [NSString stringWithFormat:@"IDS request timed out for identifier %@", a3, *MEMORY[0x1E4F28568]];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  int v6 = [v3 errorWithDomain:@"PKPassKitErrorDomain" code:-8000 userInfo:v5];

  return v6;
}

- (void)_registerListeners
{
  [(PKIDSService *)self->_service setProtobufAction:sel__cloudStoreZoneShareInvitationRequestReceived_service_account_fromID_context_ target:self forIncomingRequestsOfType:10 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__cloudStoreZoneShareInvitationRequestRemoved_service_account_fromID_context_ target:self forIncomingRequestsOfType:11 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__cloudStoreZoneShareInvitationRequestInvitationData_service_account_fromID_context_ target:self forIncomingRequestsOfType:12 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__remoteRegistrationRequestReceived_service_account_fromID_context_ target:self forIncomingRequestsOfType:13 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__deviceSharingCapabiltiesRequestReceived_service_account_fromID_context_ target:self forIncomingRequestsOfType:14 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__cloudStoreZoneShareInvitationResponseReceived_service_account_fromID_context_ target:self forIncomingResponsesOfType:10 queue:self->_internalQueue];
  [(PKIDSService *)self->_service setProtobufAction:sel__remoteRegistrationRequestResultReceived_service_account_fromID_context_ target:self forIncomingResponsesOfType:13 queue:self->_internalQueue];
  service = self->_service;
  internalQueue = self->_internalQueue;
  [(PKIDSService *)service setProtobufAction:sel__deviceSharingCapabilitiesRequestResultReceived_service_account_fromID_context_ target:self forIncomingResponsesOfType:14 queue:internalQueue];
}

- (id)_sanitizedHandleWithFromID:(id)a3
{
  uint64_t v4 = (void *)IDSCopyAddressDestinationForDestination();
  id v5 = [(PKSharingIDSManager *)self _sanitizedHande:v4];

  return v5;
}

- (id)_sanitizedHande:(id)a3
{
  id v3 = a3;
  uint64_t v4 = @"mailto:";
  if (([v3 hasPrefix:@"mailto:"] & 1) != 0
    || (uint64_t v4 = @"tel:", [v3 hasPrefix:@"tel:"]))
  {
    uint64_t v5 = [v3 rangeOfString:v4];
    uint64_t v7 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v4, &stru_1EE0F5368, 0, v5, v6);

    id v3 = (id)v7;
  }
  return v3;
}

- (id)_idsIDForHandle:(id)a3
{
  id v3 = a3;
  if ([v3 _appearsToBeEmail])
  {
    uint64_t v4 = _IDSCopyIDForEmailAddress();
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 _appearsToBePhoneNumber])
  {
    uint64_t v4 = _IDSCopyIDForPhoneNumberWithOptions();
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (id)_primaryAppleIDSharingDestination:(id)a3
{
  uint64_t v4 = [a3 primaryAppleID];
  if (v4)
  {
    uint64_t v5 = [(PKSharingIDSManager *)self _idsIDForHandle:v4];
    if (v5) {
      uint64_t v6 = [[PKSharingDestination alloc] initWithDestinationIdentifier:v5];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_sharingDestinationForHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke;
  block[3] = &unk_1E56D8428;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    if (![*(id *)(a1 + 32) count])
    {
      id v2 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Cannot get sharing handle for undefined handles", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_141;
    v41[3] = &unk_1E56DF838;
    uint64_t v20 = a1;
    id v3 = *(void **)(a1 + 32);
    v41[4] = *(void *)(a1 + 40);
    uint64_t v4 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", v41);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = [*(id *)(a1 + 40) _idsIDForHandle:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          id v9 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKey:v8];
          if (v9)
          {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

            id v10 = obj;
            goto LABEL_23;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v10 = [MEMORY[0x1E4F6AB38] sharedInstance];
    uint64_t v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    *(void *)long long buf = 0;
    v32 = buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__15;
    id v35 = __Block_byref_object_dispose__15;
    id v36 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = obj;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2;
          v24[3] = &unk_1E56DF888;
          v24[4] = *(void *)(v20 + 40);
          v24[5] = v15;
          id v25 = v10;
          BOOL v26 = buf;
          [(PKAsyncUnaryOperationComposer *)v8 addOperation:v24];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v12);
    }

    id v16 = [MEMORY[0x1E4F1CA98] null];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_147;
    v21[3] = &unk_1E56DF8D8;
    uint64_t v17 = *(void **)(v20 + 48);
    v21[4] = *(void *)(v20 + 40);
    id v23 = buf;
    id v22 = v17;
    id v18 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v16 completion:v21];

    _Block_object_dispose(buf, 8);
LABEL_23:
  }
}

uint64_t __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_141(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sanitizedHande:a2];
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) _idsIDForHandle:*(void *)(a1 + 40)];
  id v9 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v8;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Checking IDS status for %@", buf, 0xCu);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_143;
  v17[3] = &unk_1E56DF860;
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v7;
  uint64_t v21 = v13;
  void v17[4] = v11;
  id v18 = v8;
  id v19 = v6;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  [v12 refreshIDStatusForDestination:v16 service:@"com.apple.private.alloy.applepay.sharing" listenerID:@"com.apple.private.alloy.applepay.sharing" queue:v10 completionBlock:v17];
}

uint64_t __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_143(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    id v6 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(v2 + 32);
      int v10 = 138412290;
      uint64_t v11 = v7;
      uint64_t v8 = "IDS status for %@ is unknown";
LABEL_11:
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
LABEL_12:

    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v2 + 56) + 16);
    return v5();
  }
  if (a2 == 2)
  {
    id v6 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(v2 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      uint64_t v8 = "IDS status for %@ is invalid";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a2 != 1) {
    return result;
  }
  id v3 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(v2 + 32);
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "IDS status for %@ is valid", (uint8_t *)&v10, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(v2 + 64) + 8) + 40), *(id *)(v2 + 40));
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v2 + 56) + 16);
  return v5();
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_147(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2_148;
  block[3] = &unk_1E56DF8B0;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __64__PKSharingIDSManager__sharingDestinationForHandles_completion___block_invoke_2_148(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v3 = [[PKSharingDestination alloc] initWithDestinationIdentifier:*(void *)(*(void *)(a1[6] + 8) + 40)];
    [*(id *)(a1[4] + 48) setObject:v3 forKey:*(void *)(*(void *)(a1[6] + 8) + 40)];
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "There is no handle registered with IDS to send a message", buf, 2u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (PKSharingIDSManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PKSharingIDSManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_completionTimers, 0);
  objc_storeStrong((id *)&self->_sharingDestinations, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end