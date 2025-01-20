@interface SKAPresenceManager
+ (id)_channelCreationTimeoutError;
+ (id)_keyGenerationError;
+ (id)_noExistingAssertionError;
+ (id)_noExistingChannelError;
+ (id)_payloadGenerationError;
+ (id)_payloadOversizeError;
+ (id)_presenceDisabledError;
+ (id)_unexpectedInternalError;
+ (id)logger;
+ (id)oversizeLogger;
- (BOOL)_activePresenceAssertionsExist;
- (BOOL)_addPresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4 options:(id)a5 payload:(id)a6;
- (BOOL)_addPresentDeviceForChannel:(id)a3 presentDevice:(id)a4;
- (BOOL)_clientPayload:(id)a3 isValidWithError:(id *)a4;
- (BOOL)_removePresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4;
- (BOOL)_removePresentDeviceForChannel:(id)a3 presentDevice:(id)a4;
- (BOOL)_shouldCryptoRoll;
- (BOOL)_shouldReassert;
- (BOOL)_shouldReauthForError:(id)a3;
- (BOOL)presenceEnabledByServer;
- (NSMapTable)activeParticipantsByChannel;
- (NSMapTable)activePresenceAssertionsByClient;
- (OS_dispatch_queue)channelFetchQueue;
- (OS_dispatch_queue)internalWorkQueue;
- (OS_dispatch_queue)payloadUpdateProcessingQueue;
- (SKAAccountProviding)accountProvider;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKAMessagingProviding)messagingProvider;
- (SKAPresenceManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 subscriptionManager:(id)a5 accountProvider:(id)a6 messagingProvider:(id)a7 delegate:(id)a8;
- (SKAPresenceManagingDelegate)delegate;
- (SKAStatusSubscriptionManaging)subscriptionManager;
- (id)_activePresenceAssertionForPresenceIdentifier:(id)a3;
- (id)_activePresenceAssertionsForClient:(id)a3;
- (id)_activePresentDevicesForChannel:(id)a3;
- (id)_currentPayloadForPresenceIdentifier:(id)a3;
- (id)_deviceIdentifierForToken:(id)a3;
- (id)_mostRecentAssertionTimeForTokenURI:(id)a3 onChannel:(id)a4;
- (id)_presentDeviceFromPayload:(id)a3 onChannel:(id)a4;
- (id)_sortAndDedupePresenceIdentifiers:(id)a3;
- (int64_t)_cryptoRollResetTimeSeconds;
- (int64_t)_maxPayloadSizeBytes;
- (int64_t)_reassertResetTimeSeconds;
- (unint64_t)_currentCheckpointForChannel:(id)a3;
- (void)_clearPresentDevicesForChannel:(id)a3;
- (void)_createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)_findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)_findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)_handleBulkUpdateParticipantPayloads:(id)a3 forChannel:(id)a4;
- (void)_handleIncomingPayloadUpdate:(id)a3 onChannel:(id)a4 withIdentifier:(unint64_t)a5;
- (void)_markCryptoRoll;
- (void)_markReassert;
- (void)_presencePayloadForChannel:(id)a3 clientPayload:(id)a4 options:(id)a5 timestamp:(id)a6 completion:(id)a7;
- (void)_presentDevicesChangedForChannel:(id)a3;
- (void)_recalculateActivityTracking;
- (void)_rollChannelForCryptoFailureIfAllowed:(id)a3;
- (void)_sendPollingMessageForChannel:(id)a3 completion:(id)a4;
- (void)_sendPresenceAssertionMessageForChannel:(id)a3 withPayload:(id)a4 options:(id)a5 isRefresh:(BOOL)a6 completion:(id)a7;
- (void)_sendPresenceDeactivationMessageForChannel:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_setCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4;
- (void)channelReceivedIncomingPayloadUpdate:(id)a3 channel:(id)a4 withIdentifier:(unint64_t)a5;
- (void)createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6;
- (void)presentDevicesForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5;
- (void)releaseAllPresenceAssertionsAssociatedWithClient:(id)a3 options:(id)a4 completion:(id)a5;
- (void)releasePresenceAssertionForPresenceIdentifier:(id)a3 options:(id)a4 client:(id)a5 completion:(id)a6;
- (void)retainPresenceAssertionForPresenceIdentifier:(id)a3 withPresencePayload:(id)a4 options:(id)a5 client:(id)a6 completion:(id)a7;
- (void)sendPollingMessageForChannel:(id)a3;
- (void)setAccountProvider:(id)a3;
- (void)setActiveParticipantsByChannel:(id)a3;
- (void)setActivePresenceAssertionsByClient:(id)a3;
- (void)setChannelFetchQueue:(id)a3;
- (void)setChannelManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalWorkQueue:(id)a3;
- (void)setMessagingProvider:(id)a3;
- (void)setPayloadUpdateProcessingQueue:(id)a3;
- (void)setPresenceEnabledByServer:(BOOL)a3;
- (void)setSubscriptionManager:(id)a3;
@end

@implementation SKAPresenceManager

- (SKAPresenceManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 subscriptionManager:(id)a5 accountProvider:(id)a6 messagingProvider:(id)a7 delegate:(id)a8
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v39.receiver = self;
  v39.super_class = (Class)SKAPresenceManager;
  v18 = [(SKAPresenceManager *)&v39 init];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    activePresenceAssertionsByClient = v18->_activePresenceAssertionsByClient;
    v18->_activePresenceAssertionsByClient = (NSMapTable *)v19;

    uint64_t v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    activeParticipantsByChannel = v18->_activeParticipantsByChannel;
    v18->_activeParticipantsByChannel = (NSMapTable *)v21;

    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_channelManager, a4);
    objc_storeStrong((id *)&v18->_accountProvider, a6);
    objc_storeStrong((id *)&v18->_messagingProvider, a7);
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeStrong((id *)&v18->_subscriptionManager, a5);
    v18->_presenceEnabledByServer = +[SKAServerBag presenceEnabledByServer];
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.StatusKitAgent.PresenceManager", v24);
    internalWorkQueue = v18->_internalWorkQueue;
    v18->_internalWorkQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.StatusKitAgent.ChannelFetchQueue", v28);
    channelFetchQueue = v18->_channelFetchQueue;
    v18->_channelFetchQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v33 = dispatch_queue_create("com.apple.StatusKitAgent.PayloadUpdateProcessing", v32);
    payloadUpdateProcessingQueue = v18->_payloadUpdateProcessingQueue;
    v18->_payloadUpdateProcessingQueue = (OS_dispatch_queue *)v33;
  }
  return v18;
}

- (void)retainPresenceAssertionForPresenceIdentifier:(id)a3 withPresencePayload:(id)a4 options:(id)a5 client:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke;
  v23[3] = &unk_2646E1290;
  objc_copyWeak(&v30, &location);
  id v24 = v14;
  dispatch_queue_t v25 = self;
  id v26 = v13;
  id v27 = v12;
  id v28 = v15;
  id v29 = v16;
  id v18 = v15;
  id v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v22 = v16;
  dispatch_async(internalWorkQueue, v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (([WeakRetained presenceEnabledByServer] & 1) == 0)
  {
    id v20 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    uint64_t v21 = *(void *)(a1 + 72);
    goto LABEL_15;
  }
  uint64_t v4 = [*(id *)(a1 + 32) serviceIdentifier];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [*(id *)(a1 + 32) serviceIdentifier];
    BOOL v7 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:v6];

    if (!v7)
    {
      id v24 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_2(a1 + 32, v24);
      }

      uint64_t v21 = *(void *)(a1 + 72);
LABEL_15:
      id v11 = +[SKAPresenceManager _presenceDisabledError];
      v23 = *(void (**)(void))(v21 + 16);
LABEL_16:
      v23();
      goto LABEL_17;
    }
  }
  v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v34 = 0;
  char v10 = [v8 _clientPayload:v9 isValidWithError:&v34];
  id v11 = v34;
  if ((v10 & 1) == 0)
  {
    id v22 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_1();
    }

    v23 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_16;
  }
  id v12 = [WeakRetained databaseManager];
  id v13 = (void *)[v12 newBackgroundContext];

  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_15;
  v25[3] = &unk_2646E1268;
  objc_copyWeak(&v33, v2);
  id v26 = *(id *)(a1 + 64);
  id v27 = *(id *)(a1 + 56);
  id v28 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  id v29 = v17;
  uint64_t v30 = v18;
  id v19 = *(id *)(a1 + 72);
  id v31 = WeakRetained;
  id v32 = v19;
  [v16 _findOrCreatePresenceChannelForPresenceIdentifier:v14 options:v15 databaseContext:v13 completion:v25];

  objc_destroyWeak(&v33);
LABEL_17:
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v8 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (([WeakRetained _addPresenceAssertionForClient:*(void *)(a1 + 32) presenceIdentifier:*(void *)(a1 + 40) options:*(void *)(a1 + 48) payload:*(void *)(a1 + 56)] & 1) == 0)
    {
      uint64_t v9 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Presence assertion already existed, but still sending presence assertion to ensure apsd is in sync.", buf, 2u);
      }
    }
    [*(id *)(a1 + 64) _recalculateActivityTracking];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_16;
    v14[3] = &unk_2646E1240;
    id v17 = *(id *)(a1 + 80);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 72);
    id v15 = v12;
    uint64_t v16 = v13;
    [v8 _sendPresenceAssertionMessageForChannel:v12 withPayload:v10 options:v11 isRefresh:0 completion:v14];
  }
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    BOOL v7 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) _handleBulkUpdateParticipantPayloads:v5 forChannel:*(void *)(a1 + 32)];
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

- (BOOL)_clientPayload:(id)a3 isValidWithError:(id *)a4
{
  id v6 = a3;
  if (v6
    && (unint64_t v7 = [(SKAPresenceManager *)self _maxPayloadSizeBytes],
        [v6 payloadData],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 length],
        v8,
        v9 > v7))
  {
    uint64_t v10 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _clientPayload:isValidWithError:]();
    }

    if (a4)
    {
      +[SKAPresenceManager _payloadOversizeError];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_sendPresenceAssertionMessageForChannel:(id)a3 withPayload:(id)a4 options:(id)a5 isRefresh:(BOOL)a6 completion:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v33 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = [v11 identifier];
  id v15 = [SKAPresenceMembershipKey alloc];
  uint64_t v16 = [v11 presenceMembershipKey];
  id v17 = [(SKAPresenceMembershipKey *)v15 initWithPrivateKeyMaterial:v16];

  uint64_t v18 = [SKAPresenceEncryptionKey alloc];
  id v19 = [v11 presenceServerKey];
  id v20 = [(SKAPresenceEncryptionKey *)v18 initWithKeyMaterial:v19];

  if (v17 && v20)
  {
    uint64_t v21 = +[SKAPresenceManager oversizeLogger];
    id v31 = v11;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [v11 identifier];
      v23 = id v22 = self;
      id v24 = [v31 presenceIdentifier];
      *(_DWORD *)buf = 138412802;
      v45 = v23;
      __int16 v46 = 2112;
      v47 = v24;
      __int16 v48 = 2112;
      id v49 = v33;
      _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to assert on channel %@ for presence identifier %@ with payload %@", buf, 0x20u);

      self = v22;
      id v11 = v31;
    }

    dispatch_queue_t v25 = [v11 channelToken];
    id v26 = [(SKAPresenceManager *)self channelManager];
    id v27 = [v26 serverTime];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke;
    v34[3] = &unk_2646E1380;
    id v42 = v13;
    v34[4] = self;
    id v35 = v11;
    id v36 = v14;
    id v37 = v17;
    id v38 = v20;
    id v39 = v27;
    id v40 = v25;
    id v41 = v12;
    BOOL v43 = a6;
    id v28 = v25;
    id v29 = v27;
    id v11 = v31;
    [(SKAPresenceManager *)self _presencePayloadForChannel:v35 clientPayload:v33 options:v41 timestamp:v29 completion:v34];
  }
  else
  {
    uint64_t v30 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _sendPresenceAssertionMessageForChannel:withPayload:options:isRefresh:completion:]((uint64_t)v17);
    }

    id v29 = +[SKAPresenceManager _keyGenerationError];
    [(SKAPresenceManager *)self _rollChannelForCryptoFailureIfAllowed:v11];
    (*((void (**)(id, id, void, double))v13 + 2))(v13, v29, MEMORY[0x263EFFA68], 1.79769313e308);
  }
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v21 = a2;
  if (v21)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = [*(id *)(a1 + 32) payloadUpdateProcessingQueue];
    dispatch_suspend(v3);

    uint64_t v4 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 40) presenceIdentifier];
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      id v37 = v5;
      __int16 v38 = 2112;
      uint64_t v39 = v6;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue suspended. Sending presence assertion message for presence identifier %@ on channel %@", buf, 0x16u);
    }
    unint64_t v7 = [*(id *)(a1 + 32) channelManager];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v20 = *(void *)(a1 + 80);
    id v12 = [*(id *)(a1 + 88) serviceIdentifier];
    BOOL v13 = *(unsigned char *)(a1 + 104) != 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_22;
    v22[3] = &unk_2646E1358;
    objc_copyWeak(&v33, &location);
    id v23 = v21;
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 64);
    id v27 = *(id *)(a1 + 72);
    id v28 = *(id *)(a1 + 80);
    id v29 = *(id *)(a1 + 88);
    char v34 = *(unsigned char *)(a1 + 104);
    id v14 = *(id *)(a1 + 96);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(a1 + 40);
    id v32 = v14;
    uint64_t v30 = v15;
    id v31 = v16;
    LOBYTE(v19) = v13;
    [v7 assertPresence:v23 onChannel:v8 membershipKey:v9 serverKey:v11 timestamp:v10 withChannelToken:v20 serviceIdentifier:v12 isRefresh:v19 completion:v22];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_cold_1();
    }

    uint64_t v18 = +[SKAPresenceManager _payloadGenerationError];
    (*(void (**)(double))(*(void *)(a1 + 96) + 16))(1.79769313e308);
  }
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_22(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  id v12 = [WeakRetained internalWorkQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2;
  v18[3] = &unk_2646E1330;
  id v19 = v9;
  id v20 = WeakRetained;
  id v21 = *(id *)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 72);
  id v27 = *(id *)(a1 + 80);
  char v34 = *(unsigned char *)(a1 + 120);
  id v13 = *(id *)(a1 + 104);
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v15 = *(void **)(a1 + 96);
  id v31 = v13;
  uint64_t v28 = v14;
  double v32 = a5;
  id v29 = v15;
  id v30 = v10;
  uint64_t v33 = a3;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v12, v18);
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v10 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Presence assertion completed with success.", v13, 2u);
    }

    [*(id *)(a1 + 104) _setCheckpointForChannel:*(void *)(a1 + 112) checkpoint:*(void *)(a1 + 144)];
    (*(void (**)(double))(*(void *)(a1 + 128) + 16))(*(double *)(a1 + 136));
    uint64_t v11 = +[SKAPresenceManager logger];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)id v13 = 0;
    goto LABEL_14;
  }
  int v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  v3 = +[SKAPresenceManager logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2();
    }

    (*(void (**)(double))(*(void *)(a1 + 128) + 16))(*(double *)(a1 + 136));
    uint64_t v11 = +[SKAPresenceManager logger];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)id v13 = 0;
LABEL_14:
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", v13, 2u);
LABEL_15:

    id v12 = [*(id *)(a1 + 40) payloadUpdateProcessingQueue];
    dispatch_resume(v12);

    return;
  }
  if (v4) {
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();
  }

  id v5 = [*(id *)(a1 + 40) accountProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_23;
  v14[3] = &unk_2646E1308;
  uint64_t v6 = *(void **)(a1 + 48);
  void v14[4] = *(void *)(a1 + 40);
  id v15 = v6;
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 80);
  id v20 = *(id *)(a1 + 88);
  id v21 = *(id *)(a1 + 96);
  char v27 = *(unsigned char *)(a1 + 152);
  id v7 = *(id *)(a1 + 128);
  uint64_t v8 = *(void *)(a1 + 104);
  id v9 = *(void **)(a1 + 112);
  id v25 = v7;
  uint64_t v22 = v8;
  id v23 = v9;
  uint64_t v26 = *(void *)(a1 + 136);
  id v24 = *(id *)(a1 + 120);
  [v5 refreshCredentialForPrimaryAccountWithCompletion:v14];
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_23(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[SKAPresenceManager logger];
  id v7 = v6;
  if (a2)
  {
    id v23 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting presence assertion", buf, 2u);
    }

    uint64_t v8 = [*(id *)(a1 + 32) channelManager];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = [*(id *)(a1 + 88) serviceIdentifier];
    char v15 = *(unsigned char *)(a1 + 136);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_24;
    v24[3] = &unk_2646E12E0;
    v24[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 120);
    uint64_t v17 = *(void *)(a1 + 96);
    id v18 = *(void **)(a1 + 104);
    id v26 = v16;
    v24[5] = v17;
    id v25 = v18;
    LOBYTE(v21) = v15;
    [v8 assertPresence:v22 onChannel:v9 membershipKey:v10 serverKey:v11 timestamp:v12 withChannelToken:v13 serviceIdentifier:v14 isRefresh:v21 completion:v24];

    id v5 = v23;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }

    (*(void (**)(double))(*(void *)(a1 + 120) + 16))(*(double *)(a1 + 128));
    id v19 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", buf, 2u);
    }

    id v20 = [*(id *)(a1 + 32) payloadUpdateProcessingQueue];
    dispatch_resume(v20);
  }
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_24(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = [*(id *)(a1 + 32) internalWorkQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25;
  v18[3] = &unk_2646E12B8;
  id v19 = v9;
  id v24 = *(id *)(a1 + 56);
  double v25 = a5;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void **)(a1 + 48);
  id v20 = v10;
  uint64_t v21 = v12;
  id v14 = v13;
  uint64_t v26 = a3;
  uint64_t v15 = *(void *)(a1 + 32);
  id v22 = v14;
  uint64_t v23 = v15;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v11, v18);
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = +[SKAPresenceManager logger];
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Presence assertion completed with success.", buf, 2u);
    }

    [*(id *)(a1 + 48) _setCheckpointForChannel:*(void *)(a1 + 56) checkpoint:*(void *)(a1 + 88)];
  }
  (*(void (**)(double))(*(void *)(a1 + 72) + 16))(*(double *)(a1 + 80));
  id v5 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "payloadUpdateProcessingQueue resumed", v7, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 64) payloadUpdateProcessingQueue];
  dispatch_resume(v6);
}

- (void)sendPollingMessageForChannel:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Polling for channel: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke;
  v7[3] = &unk_2646E13A8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(SKAPresenceManager *)self _sendPollingMessageForChannel:v6 completion:v7];
}

void __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKAPresenceManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@  based on polling response", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) _handleBulkUpdateParticipantPayloads:v5 forChannel:*(void *)(a1 + 32)];
  }
}

- (void)_sendPollingMessageForChannel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Sending polling request for channel: ", (uint8_t *)buf, 2u);
  }

  int v9 = [v6 identifier];
  uint64_t v10 = [SKAPresenceMembershipKey alloc];
  uint64_t v11 = [v6 presenceMembershipKey];
  uint64_t v12 = [(SKAPresenceMembershipKey *)v10 initWithPrivateKeyMaterial:v11];

  uint64_t v13 = [SKAPresenceEncryptionKey alloc];
  id v14 = [v6 presenceServerKey];
  uint64_t v15 = [(SKAPresenceEncryptionKey *)v13 initWithKeyMaterial:v14];

  if (v12 && v15)
  {
    id v16 = [v6 channelToken];
    objc_initWeak(buf, self);
    uint64_t v21 = self;
    id v17 = [(SKAPresenceManager *)self channelManager];
    id v18 = [v6 serviceIdentifier];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke;
    v22[3] = &unk_2646E1470;
    objc_copyWeak(&v30, buf);
    id v29 = v7;
    id v23 = v9;
    id v24 = v12;
    double v25 = v15;
    id v19 = v16;
    id v26 = v19;
    id v27 = v6;
    uint64_t v28 = v21;
    [v17 pollActiveParticipantsForChannel:v23 membershipKey:v24 serverKey:v25 withChannelToken:v19 serviceIdentifier:v18 completion:v22];

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
  else
  {
    id v20 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _sendPollingMessageForChannel:completion:]((uint64_t)v12);
    }

    id v19 = +[SKAPresenceManager _keyGenerationError];
    [(SKAPresenceManager *)self _rollChannelForCryptoFailureIfAllowed:v6];
    (*((void (**)(id, id, void))v7 + 2))(v7, v19, MEMORY[0x263EFFA68]);
  }
}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v10 = [WeakRetained internalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2;
  block[3] = &unk_2646E1448;
  id v16 = v7;
  id v17 = WeakRetained;
  id v25 = *(id *)(a1 + 80);
  id v18 = v8;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v23 = v11;
  uint64_t v24 = v12;
  uint64_t v26 = a3;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, block);
}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    uint64_t v10 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Polling completed with success.", v11, 2u);
    }

    [*(id *)(a1 + 96) _setCheckpointForChannel:*(void *)(a1 + 88) checkpoint:*(void *)(a1 + 112)];
    goto LABEL_12;
  }
  int v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  v3 = +[SKAPresenceManager logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2();
    }

LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    return;
  }
  if (v4) {
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();
  }

  id v5 = [*(id *)(a1 + 40) accountProvider];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_30;
  v12[3] = &unk_2646E1420;
  id v21 = *(id *)(a1 + 104);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v8 = *(id *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 96);
  id v19 = v8;
  uint64_t v20 = v9;
  [v5 refreshCredentialForPrimaryAccountWithCompletion:v12];
}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) channelManager];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    id v11 = [*(id *)(a1 + 80) serviceIdentifier];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_31;
    v15[3] = &unk_2646E13F8;
    v15[4] = *(void *)(a1 + 40);
    int8x16_t v14 = *(int8x16_t *)(a1 + 80);
    id v12 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    id v17 = *(id *)(a1 + 96);
    [v6 pollActiveParticipantsForChannel:v7 membershipKey:v8 serverKey:v9 withChannelToken:v10 serviceIdentifier:v11 completion:v15];
  }
  else
  {
    id v13 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
}

void __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) internalWorkQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2_32;
  v15[3] = &unk_2646E13D0;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  id v16 = v7;
  uint64_t v17 = v10;
  id v18 = v11;
  uint64_t v21 = a3;
  id v12 = *(id *)(a1 + 56);
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v9, v15);
}

uint64_t __63__SKAPresenceManager__sendPollingMessageForChannel_completion___block_invoke_2_32(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = +[SKAPresenceManager logger];
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25_cold_1();
    }

    [*(id *)(a1 + 40) _setCheckpointForChannel:*(void *)(a1 + 48) checkpoint:*(void *)(a1 + 72)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Polling completed with success.", v6, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_handleBulkUpdateParticipantPayloads:(id)a3 forChannel:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 identifier];
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Updating present devices for channel: %@", buf, 0xCu);
  }
  [(SKAPresenceManager *)self _clearPresentDevicesForChannel:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = -[SKAPresenceManager _presentDeviceFromPayload:onChannel:](self, "_presentDeviceFromPayload:onChannel:", *(void *)(*((void *)&v17 + 1) + 8 * v14), v7, (void)v17);
        if (v15)
        {
          [(SKAPresenceManager *)self _addPresentDeviceForChannel:v7 presentDevice:v15];
        }
        else
        {
          id v16 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleBulkUpdateParticipantPayloads:forChannel:](buf, &buf[1], v16);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [(SKAPresenceManager *)self _presentDevicesChangedForChannel:v7];
}

- (void)releasePresenceAssertionForPresenceIdentifier:(id)a3 options:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke;
  block[3] = &unk_2646E14E8;
  objc_copyWeak(&v25, &location);
  id v23 = self;
  id v24 = v13;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if ([WeakRetained presenceEnabledByServer])
  {
    BOOL v4 = [WeakRetained databaseManager];
    id v5 = (void *)[v4 newBackgroundContext];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) isPersonal];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_34;
    v12[3] = &unk_2646E0C10;
    objc_copyWeak(&v18, v2);
    id v17 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    id v15 = v8;
    uint64_t v16 = v9;
    [WeakRetained findPresenceChannelForPresenceIdentifier:v6 isPersonal:v7 databaseContext:v5 completion:v12];

    objc_destroyWeak(&v18);
  }
  else
  {
    id v10 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    uint64_t v11 = *(void *)(a1 + 64);
    id v5 = +[SKAPresenceManager _presenceDisabledError];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
  }
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained internalWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2;
    block[3] = &unk_2646E14C0;
    void block[4] = v8;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v16 = v5;
    id v17 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = v10;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = +[SKAPresenceManager _unexpectedInternalError];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 48);
  int v3 = [*(id *)(a1 + 32) _removePresenceAssertionForClient:*(void *)(a1 + 40) presenceIdentifier:*(void *)(a1 + 48)];
  BOOL v4 = +[SKAPresenceManager logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *v2;
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully removed presence assertion from in memory model for subscription identifier: %@", buf, 0xCu);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_35;
    v13[3] = &unk_2646E1498;
    id v14 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 72);
    id v16 = v10;
    [v7 _sendPresenceDeactivationMessageForChannel:v8 options:v9 completion:v13];

    uint64_t v11 = v14;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 80);
    uint64_t v11 = +[SKAPresenceManager _noExistingAssertionError];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = +[SKAPresenceManager logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_35_cold_1();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Deactivation message succeeded for %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
  [*(id *)(a1 + 40) _recalculateActivityTracking];
}

- (void)_sendPresenceDeactivationMessageForChannel:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 identifier];
  uint64_t v12 = [SKAPresenceMembershipKey alloc];
  id v13 = [v8 presenceMembershipKey];
  id v14 = [(SKAPresenceMembershipKey *)v12 initWithPrivateKeyMaterial:v13];

  uint64_t v15 = [SKAPresenceEncryptionKey alloc];
  id v16 = [v8 presenceServerKey];
  id v17 = [(SKAPresenceEncryptionKey *)v15 initWithKeyMaterial:v16];

  if (v14 && v17)
  {
    uint64_t v26 = v11;
    uint64_t v18 = [v8 channelToken];
    uint64_t v19 = [(SKAPresenceManager *)self channelManager];
    id v20 = [v19 serverTime];

    objc_initWeak(location, self);
    id v25 = [(SKAPresenceManager *)self channelManager];
    id v21 = [v9 serviceIdentifier];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke;
    v27[3] = &unk_2646E1588;
    objc_copyWeak(&v35, location);
    id v34 = v10;
    id v28 = v26;
    id v29 = v14;
    id v30 = v17;
    id v22 = v20;
    id v31 = v22;
    id v23 = v18;
    id v32 = v23;
    id v33 = v9;
    [v25 releasePresenceOnChannel:v28 membershipKey:v29 serverKey:v30 timestamp:v22 withChannelToken:v23 serviceIdentifier:v21 completion:v27];

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);

    uint64_t v11 = v26;
  }
  else
  {
    id v24 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _sendPresenceDeactivationMessageForChannel:options:completion:]((uint64_t)v14);
    }

    id v23 = +[SKAPresenceManager _keyGenerationError];
    [(SKAPresenceManager *)self _rollChannelForCryptoFailureIfAllowed:v8];
    (*((void (**)(id, id))v10 + 2))(v10, v23);
  }
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  id v5 = [WeakRetained internalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2;
  block[3] = &unk_2646E1560;
  id v8 = v3;
  id v9 = WeakRetained;
  id v16 = a1[10];
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  id v13 = a1[7];
  id v14 = a1[8];
  id v15 = a1[9];
  id v6 = v3;
  dispatch_async(v5, block);
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v9 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Presence release completed with success.", v10, 2u);
    }

    goto LABEL_12;
  }
  int v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldReauthForError:");
  id v3 = +[SKAPresenceManager logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (!v2)
  {
    if (v4) {
      __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_cold_2();
    }

LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    return;
  }
  if (v4) {
    __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();
  }

  id v5 = [*(id *)(a1 + 40) accountProvider];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_37;
  v11[3] = &unk_2646E1538;
  id v6 = *(id *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v18 = v6;
  v11[4] = v7;
  id v12 = v8;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 88);
  [v5 refreshCredentialForPrimaryAccountWithCompletion:v11];
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_37(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) channelManager];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = [*(id *)(a1 + 80) serviceIdentifier];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_38;
    v14[3] = &unk_2646E1158;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 88);
    [v6 releasePresenceOnChannel:v7 membershipKey:v8 serverKey:v9 timestamp:v10 withChannelToken:v11 serviceIdentifier:v12 completion:v14];
  }
  else
  {
    id v13 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) internalWorkQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_39;
  v6[3] = &unk_2646E1510;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_39(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[SKAPresenceManager logger];
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Release completed with success.", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)releaseAllPresenceAssertionsAssociatedWithClient:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke;
  v15[3] = &unk_2646E1600;
  objc_copyWeak(&v20, &location);
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(internalWorkQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  from = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (([WeakRetained presenceEnabledByServer] & 1) == 0)
  {
    id v20 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }
    goto LABEL_17;
  }
  uint64_t v2 = [*(id *)(a1 + 32) serviceIdentifier];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) serviceIdentifier];
    BOOL v4 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:v3];

    if (!v4)
    {
      id v20 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_cold_1(a1 + 32, v20);
      }
LABEL_17:

      uint64_t v21 = *(void *)(a1 + 56);
      id obj = +[SKAPresenceManager _presenceDisabledError];
      (*(void (**)(uint64_t, id))(v21 + 16))(v21, obj);
      goto LABEL_24;
    }
  }
  id obj = [WeakRetained _activePresenceAssertionsForClient:*(void *)(a1 + 40)];
  BOOL v5 = [obj count] == 0;
  id v6 = +[SKAPresenceManager logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had no active presence assertions, not updating registered subscriptions", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = [obj count];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = obj;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting client had %ld presence assertion, removing presence assertions and updating registrations for channels: %@", buf, 0x16u);
    }

    id v8 = [WeakRetained activePresenceAssertionsByClient];
    [v8 removeObjectForKey:*(void *)(a1 + 40)];

    id v9 = [WeakRetained databaseManager];
    id v24 = (void *)[v9 newBackgroundContext];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v38 = __Block_byref_object_copy__0;
    uint64_t v39 = __Block_byref_object_dispose__0;
    id v40 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = obj;
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v14 = [v13 presenceIdentifier];
          id v15 = [v13 options];
          uint64_t v16 = [v15 isPersonal];

          id v17 = *(void **)(a1 + 48);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_40;
          v26[3] = &unk_2646E15D8;
          objc_copyWeak(&v31, from);
          id v27 = *(id *)(a1 + 32);
          id v30 = buf;
          id v18 = v14;
          uint64_t v19 = *(void *)(a1 + 48);
          id v28 = v18;
          uint64_t v29 = v19;
          [v17 findPresenceChannelForPresenceIdentifier:v18 isPersonal:v16 databaseContext:v24 completion:v26];

          objc_destroyWeak(&v31);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    _Block_object_dispose(buf, 8);
  }
LABEL_24:
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a3)
  {
    BOOL v7 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_40_cold_1();
    }

    uint64_t v8 = +[SKAPresenceManager _noExistingAssertionError];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_2;
    v14[3] = &unk_2646E15B0;
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v15 = v12;
    uint64_t v16 = v13;
    [WeakRetained _sendPresenceDeactivationMessageForChannel:v5 options:v11 completion:v14];
    uint64_t v10 = v15;
  }
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    id v5 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Completed sending deactivation message for presence identifier: %@ because of a disconnected client", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 40) _recalculateActivityTracking];
}

- (void)presentDevicesForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke;
  v13[3] = &unk_2646E1678;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  void v13[4] = self;
  BOOL v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalWorkQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained presenceEnabledByServer])
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    id v4 = (id)[v3 newBackgroundContext];

    objc_initWeak(&location, WeakRetained);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_42;
    v10[3] = &unk_2646E1650;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 48);
    [WeakRetained findPresenceChannelForPresenceIdentifier:v5 isPersonal:v6 databaseContext:v4 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    int v7 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    id v4 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    id v9 = +[SKAPresenceManager _presenceDisabledError];
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v4, v9);
  }
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[10];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_2;
    block[3] = &unk_2646E1628;
    id v8 = v3;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __80__SKAPresenceManager_presentDevicesForPresenceIdentifier_isPersonal_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_activePresentDevicesForChannel:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v2 array];
    id v4 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = [v3 count];
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "presentDevicesForPresenceIdentifier returning %lu devices", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "No channel currently exists, so returning empty set of present devices", (uint8_t *)&v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    id v2 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v2, 0);
  }
}

- (void)channelReceivedIncomingPayloadUpdate:(id)a3 channel:(id)a4 withIdentifier:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SKAPresenceManager *)self presenceEnabledByServer];
  id v11 = +[SKAPresenceManager logger];
  id v12 = (ChannelActivityUpdate *)v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_22480C000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Received incoming payload on channel %@", buf, 0xCu);
    }

    id v12 = [[ChannelActivityUpdate alloc] initWithData:v8];
    if (v12)
    {
      uint64_t v13 = [(SKAPresenceManager *)self payloadUpdateProcessingQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke;
      v15[3] = &unk_2646E16A0;
      void v15[4] = self;
      id v12 = v12;
      id v16 = v12;
      id v17 = v9;
      unint64_t v18 = a5;
      dispatch_async(v13, v15);
    }
    else
    {
      id v14 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceManager channelReceivedIncomingPayloadUpdate:channel:withIdentifier:]();
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
  }
}

void __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalWorkQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke_2;
  v6[3] = &unk_2646E16A0;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  dispatch_async(v2, v6);
}

uint64_t __82__SKAPresenceManager_channelReceivedIncomingPayloadUpdate_channel_withIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleIncomingPayloadUpdate:*(void *)(a1 + 40) onChannel:*(void *)(a1 + 48) withIdentifier:*(void *)(a1 + 56)];
}

- (void)_handleIncomingPayloadUpdate:(id)a3 onChannel:(id)a4 withIdentifier:(unint64_t)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(SKAPresenceManager *)self _currentCheckpointForChannel:v9];
  uint64_t v11 = [v8 prevVersion];
  unint64_t v12 = [v8 currentVersion];
  uint64_t v13 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v83 = a5;
    __int16 v84 = 2048;
    unint64_t v85 = v11;
    __int16 v86 = 2048;
    unint64_t v87 = v12;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Handling payload update %lu with lastCheckpoint %lld and previous checkpoint %lld", buf, 0x20u);
  }

  if (v10 == v11)
  {
    id v14 = +[SKAPresenceManager logger];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v15 = "Last checkpoint matches current checkpoint -- not polling";
    goto LABEL_6;
  }
  if (v10 == v12)
  {
    uint64_t v41 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v41, OS_LOG_TYPE_DEFAULT, "Our current checkpoint matches the update's checkpoint.  We're up to date -- dropping", buf, 2u);
    }
  }
  else
  {
    if (!v11)
    {
      id v14 = +[SKAPresenceManager logger];
      BOOL v46 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12 <= v10)
      {
        if (v46)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Payload last checkpoint is 0 with older updates -- dropping", buf, 2u);
        }
        goto LABEL_84;
      }
      if (!v46)
      {
LABEL_7:

        [(SKAPresenceManager *)self _setCheckpointForChannel:v9 checkpoint:v12];
        id v14 = [v8 encryptedUpdatePayload];
        if (!v14)
        {
          unint64_t v18 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:]();
          }
          goto LABEL_83;
        }
        id v16 = [SKAPresenceEncryptionKey alloc];
        id v17 = [v9 presenceServerKey];
        unint64_t v18 = [(SKAPresenceEncryptionKey *)v16 initWithKeyMaterial:v17];

        if (!v18)
        {
          uint64_t v19 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:]();
          }
          goto LABEL_82;
        }
        uint64_t v19 = [v18 decryptPayload:v14];
        if (!v19)
        {
          p_super = +[SKAPresenceManager logger];
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:]();
          }
          goto LABEL_81;
        }
        id v20 = [[ChannelActivityUpdatePayload alloc] initWithData:v19];
        p_super = &v20->super.super;
        if (!v20)
        {
          __int16 v48 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.4();
          }
          goto LABEL_80;
        }
        uint64_t v22 = [(ChannelActivityUpdatePayload *)v20 participantPayloads];
        id v23 = p_super;
        id v24 = v22;
        if (!v22)
        {
          uint64_t v50 = v23;
          id v25 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.5();
          }
          __int16 v48 = 0;
          p_super = v50;
          goto LABEL_79;
        }
        id v62 = v8;
        v63 = v23;
        v59 = v19;
        v60 = v18;
        v61 = v14;
        id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v58 = v24;
        uint64_t v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v81 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v73;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v73 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = -[SKAPresenceManager _presentDeviceFromPayload:onChannel:](self, "_presentDeviceFromPayload:onChannel:", *(void *)(*((void *)&v72 + 1) + 8 * i), v9, v58);
              if (!v31)
              {
                id v49 = +[SKAPresenceManager logger];
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                  -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.7();
                }

                goto LABEL_77;
              }
              long long v32 = (void *)v31;
              [v25 addObject:v31];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v81 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        p_super = v63;
        int v33 = [v63 updateType];
        if (v10 != v11)
        {
          long long v34 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22480C000, v34, OS_LOG_TYPE_DEFAULT, "The last checkpoint was 0, so we're clearing any previously present devices before adding the new one", buf, 2u);
          }

          [(SKAPresenceManager *)self _clearPresentDevicesForChannel:v9];
          p_super = v63;
        }
        if (v33 == 1)
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v25 = v25;
          uint64_t v51 = [v25 countByEnumeratingWithState:&v64 objects:v79 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v65 != v53) {
                  objc_enumerationMutation(v25);
                }
                unint64_t v55 = *(void *)(*((void *)&v64 + 1) + 8 * j);
                v56 = +[SKAPresenceManager logger];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  unint64_t v83 = v55;
                  __int16 v84 = 2112;
                  unint64_t v85 = (unint64_t)v9;
                  _os_log_impl(&dword_22480C000, v56, OS_LOG_TYPE_DEFAULT, "Removing device %@ from channel %@", buf, 0x16u);
                }

                [(SKAPresenceManager *)self _removePresentDeviceForChannel:v9 presentDevice:v55];
              }
              uint64_t v52 = [v25 countByEnumeratingWithState:&v64 objects:v79 count:16];
            }
            while (v52);
          }
        }
        else
        {
          if (v33)
          {
            v57 = +[SKAPresenceManager logger];
            id v14 = v61;
            id v8 = v62;
            unint64_t v18 = v60;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
              -[SKAPresenceManager _handleIncomingPayloadUpdate:onChannel:withIdentifier:].cold.6();
            }

            uint64_t v19 = v59;
LABEL_78:
            __int16 v48 = v58;
LABEL_79:

LABEL_80:
LABEL_81:

LABEL_82:
LABEL_83:

LABEL_84:
            goto LABEL_85;
          }
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v25 = v25;
          uint64_t v35 = [v25 countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v69;
            do
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v69 != v37) {
                  objc_enumerationMutation(v25);
                }
                unint64_t v39 = *(void *)(*((void *)&v68 + 1) + 8 * k);
                id v40 = +[SKAPresenceManager logger];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  unint64_t v83 = v39;
                  __int16 v84 = 2112;
                  unint64_t v85 = (unint64_t)v9;
                  _os_log_impl(&dword_22480C000, v40, OS_LOG_TYPE_DEFAULT, "Adding device %@ to channel %@", buf, 0x16u);
                }

                [(SKAPresenceManager *)self _addPresentDeviceForChannel:v9 presentDevice:v39];
              }
              uint64_t v36 = [v25 countByEnumeratingWithState:&v68 objects:v80 count:16];
            }
            while (v36);
          }
        }

        [(SKAPresenceManager *)self _presentDevicesChangedForChannel:v9];
LABEL_77:
        id v14 = v61;
        id v8 = v62;
        uint64_t v19 = v59;
        unint64_t v18 = v60;
        p_super = v63;
        goto LABEL_78;
      }
      *(_WORD *)buf = 0;
      id v15 = "Payload last checkpoint is 0 with newer updates -- not polling";
LABEL_6:
      _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_7;
    }
    id v42 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v83 = v11;
      __int16 v84 = 2048;
      unint64_t v85 = v10;
      _os_log_impl(&dword_22480C000, v42, OS_LOG_TYPE_DEFAULT, "Last checkpoint does not match current checkpoint -- polling because we missed something. Payload last checkpoint: %lld ; Current saved checkpoint: %lld ",
        buf,
        0x16u);
    }

    BOOL v43 = [(SKAPresenceManager *)self subscriptionManager];
    v44 = [v9 identifier];
    char v45 = [v43 activePresenceSubscriptionAssertionsExistForChannelIdentifier:v44];

    if (v45)
    {
      [(SKAPresenceManager *)self _setCheckpointForChannel:v9 checkpoint:v12];
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __76__SKAPresenceManager__handleIncomingPayloadUpdate_onChannel_withIdentifier___block_invoke;
      v76[3] = &unk_2646E13A8;
      id v77 = v9;
      v78 = self;
      [(SKAPresenceManager *)self _sendPollingMessageForChannel:v77 completion:v76];
    }
    else
    {
      v47 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v47, OS_LOG_TYPE_DEFAULT, "We want to poll but we currently have no connected clients with an active subscription.  Resetting state and dropping payload", buf, 2u);
      }

      [(SKAPresenceManager *)self _clearPresentDevicesForChannel:v9];
    }
  }
LABEL_85:
}

void __76__SKAPresenceManager__handleIncomingPayloadUpdate_onChannel_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[SKAPresenceManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@  based on polling response", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) _handleBulkUpdateParticipantPayloads:v5 forChannel:*(void *)(a1 + 32)];
  }
}

- (void)findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  v19[3] = &unk_2646E1600;
  objc_copyWeak(&v24, &location);
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(internalWorkQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (([WeakRetained presenceEnabledByServer] & 1) == 0)
  {
    id v13 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    uint64_t v14 = *(void *)(a1 + 56);
    goto LABEL_13;
  }
  uint64_t v3 = [*(id *)(a1 + 32) serviceIdentifier];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [*(id *)(a1 + 32) serviceIdentifier];
    BOOL v6 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:v5];

    if (!v6)
    {
      id v15 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1(a1 + 32, v15);
      }

      uint64_t v14 = *(void *)(a1 + 56);
LABEL_13:
      id v12 = +[SKAPresenceManager _presenceDisabledError];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v12);
      goto LABEL_14;
    }
  }
  id v7 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v8;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Finding channel for presence identifier %@", buf, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_46;
  v16[3] = &unk_2646E0D28;
  uint64_t v11 = *(void *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  [WeakRetained _findOrCreatePresenceChannelForPresenceIdentifier:v9 options:v10 databaseContext:v11 completion:v16];
  id v12 = v17;
LABEL_14:
}

uint64_t __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  channelFetchQueue = self->_channelFetchQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke;
  v17[3] = &unk_2646E1678;
  objc_copyWeak(&v21, &location);
  id v19 = v11;
  id v20 = v12;
  BOOL v22 = a4;
  id v18 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(channelFetchQueue, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained presenceEnabledByServer])
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke_47;
    v9[3] = &unk_2646E0D28;
    id v10 = *(id *)(a1 + 48);
    [WeakRetained _findPresenceChannelForPresenceIdentifier:v4 isPersonal:v3 databaseContext:v5 completion:v9];
    BOOL v6 = v10;
  }
  else
  {
    id v7 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v6 = +[SKAPresenceManager _presenceDisabledError];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v6);
  }
}

uint64_t __101__SKAPresenceManager_findPresenceChannelForPresenceIdentifier_isPersonal_databaseContext_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  internalWorkQueue = self->_internalWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  block[3] = &unk_2646E14E8;
  objc_copyWeak(&v25, &location);
  id v23 = v12;
  id v24 = v13;
  id v20 = v11;
  id v21 = self;
  id v22 = v10;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(internalWorkQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (([WeakRetained presenceEnabledByServer] & 1) == 0)
  {
    uint64_t v9 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    id v10 = (void (**)(id, void, void *))a1[8];
    goto LABEL_13;
  }
  uint64_t v3 = [a1[4] serviceIdentifier];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [a1[4] serviceIdentifier];
    BOOL v6 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:v5];

    if (!v6)
    {
      id v11 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1((uint64_t)(a1 + 4), v11);
      }

      id v10 = (void (**)(id, void, void *))a1[8];
LABEL_13:
      id v12 = +[SKAPresenceManager _presenceDisabledError];
      v10[2](v10, 0, v12);

      goto LABEL_14;
    }
  }
  id v7 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "CreateChannel: Creating a presence channel", buf, 2u);
  }

  uint64_t v8 = [a1[5] channelFetchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_48;
  block[3] = &unk_2646E16F0;
  void block[4] = WeakRetained;
  id v14 = a1[6];
  id v15 = a1[4];
  id v16 = a1[7];
  id v17 = a1[8];
  dispatch_async(v8, block);

LABEL_14:
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_48(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2;
  id v15 = &unk_2646E16C8;
  id v7 = v2;
  id v16 = v7;
  id v17 = *(id *)(a1 + 64);
  [v4 _createPresenceChannelForPresenceIdentifier:v3 options:v5 databaseContext:v6 completion:&v12];
  dispatch_time_t v8 = dispatch_time(0, 20000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    uint64_t v9 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_48_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = +[SKAPresenceManager _channelCreationTimeoutError];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v8 = 0;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "CreateChannel: Presence channel created", v8, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_presentDevicesChangedForChannel:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 presenceIdentifier];
  id v6 = [(SKAPresenceManager *)self _activePresenceAssertionForPresenceIdentifier:v5];

  if (v6)
  {
    id v24 = self;
    id v7 = [(SKAPresenceManager *)self _activePresentDevicesForChannel:v4];
    dispatch_time_t v8 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Looking for self device in channel: %@", buf, 0xCu);
    }
    id v25 = v4;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v15 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v14;
            _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Present device: %@", buf, 0xCu);
          }

          if ([v14 isSelfDevice])
          {
            id v18 = v9;
            self = v24;
            id v4 = v25;
            goto LABEL_23;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v16 = +[SKAPresenceManager logger];
    id v4 = v25;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _presentDevicesChangedForChannel:]();
    }

    self = v24;
    BOOL v17 = [(SKAPresenceManager *)v24 _shouldReassert];
    id v18 = +[SKAPresenceManager logger];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19) {
        -[SKAPresenceManager _presentDevicesChangedForChannel:]();
      }

      [(SKAPresenceManager *)v24 _markReassert];
      id v20 = [v25 presenceIdentifier];
      id v18 = [(SKAPresenceManager *)v24 _currentPayloadForPresenceIdentifier:v20];

      id v21 = [v6 options];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke;
      v26[3] = &unk_2646E1718;
      id v27 = v25;
      uint64_t v28 = v24;
      [(SKAPresenceManager *)v24 _sendPresenceAssertionMessageForChannel:v27 withPayload:v18 options:v21 isRefresh:1 completion:v26];
    }
    else if (v19)
    {
      -[SKAPresenceManager _presentDevicesChangedForChannel:]();
    }
LABEL_23:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v23 = [v4 presenceIdentifier];
  [WeakRetained presenceManager:self didReceivePresentDevicesUpdateForPresenceIdentifier:v23];
}

void __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKAPresenceManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Updating active particpants for channel %@ following reassert", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) _handleBulkUpdateParticipantPayloads:v5 forChannel:*(void *)(a1 + 32)];
  }
}

- (unint64_t)_currentCheckpointForChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(SKAPresenceManager *)self databaseManager];
  id v6 = (void *)[v5 newBackgroundContext];

  id v7 = [(SKAPresenceManager *)self databaseManager];
  unint64_t v8 = [v7 currentCheckpointForChannel:v4 databaseContext:v6];

  return v8;
}

- (void)_setCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SKAPresenceManager *)self databaseManager];
  unint64_t v8 = (void *)[v7 newBackgroundContext];

  int v9 = [(SKAPresenceManager *)self databaseManager];
  int v10 = [v9 setCurrentCheckpointForChannel:v6 checkpoint:a4 databaseContext:v8];

  uint64_t v11 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    unint64_t v13 = a4;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Updated checkpoint to %lld on channel %@ with result %d", (uint8_t *)&v12, 0x1Cu);
  }
}

- (BOOL)_addPresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4 options:(id)a5 payload:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v30 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  long long v29 = v10;
  int v12 = [(SKAPresenceManager *)self _activePresenceAssertionsForClient:v10];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  uint64_t v15 = v13;
  char v16 = 0;
  uint64_t v17 = *(void *)v33;
  *(void *)&long long v14 = 138412802;
  long long v28 = v14;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v33 != v17) {
        objc_enumerationMutation(v12);
      }
      BOOL v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v20 = objc_msgSend(v19, "presenceIdentifier", v28);
      if ([v20 isEqualToString:v11])
      {
        id v21 = [v19 options];
        int v22 = [v21 isEqual:v31];

        if (v22)
        {
          id v23 = +[SKAPresenceManager logger];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v28;
            id v37 = v11;
            __int16 v38 = 2112;
            id v39 = v29;
            __int16 v40 = 2112;
            uint64_t v41 = v19;
            _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Found an existing presence assertion for \"%@\" and client: %@. ExistingAssertion: %@", buf, 0x20u);
          }

          [v19 setPayload:v30];
          char v16 = 1;
        }
      }
      else
      {
      }
    }
    uint64_t v15 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
  }
  while (v15);
  if (v16)
  {
    id v24 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, &v24->super, OS_LOG_TYPE_DEFAULT, "Not creating a new presence assertion, one already exists.", buf, 2u);
    }
    BOOL v25 = 0;
  }
  else
  {
LABEL_18:
    id v24 = [[SKAPresenceAssertion alloc] initWithPresenceIdentifier:v11 options:v31 payload:v30];
    [v12 addObject:v24];
    uint64_t v26 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = v31;
      _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Successfully added presence assertion to in memory model for presence identifier: %@ options: %@", buf, 0x16u);
    }

    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)_removePresenceAssertionForClient:(id)a3 presenceIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  unint64_t v8 = [(SKAPresenceManager *)self _activePresenceAssertionsForClient:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  BOOL v19 = __75__SKAPresenceManager__removePresenceAssertionForClient_presenceIdentifier___block_invoke;
  id v20 = &unk_2646E1740;
  id v10 = v7;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v8 enumerateObjectsUsingBlock:&v17];
  uint64_t v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  if (v12)
  {
    uint64_t v13 = [v8 count];
    [v8 removeObjectsAtIndexes:v11];
    uint64_t v14 = [v8 count];
    uint64_t v15 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully removed presence assertion for identifier: %@. Client had %ld presence assertions, now has %ld. Client: %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v15 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v8;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v6;
      _os_log_error_impl(&dword_22480C000, v15, OS_LOG_TYPE_ERROR, "Could not find presence assertion for subscription identifier: \"%@\". Active presence assertions: %@ for client: %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __75__SKAPresenceManager__removePresenceAssertionForClient_presenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 presenceIdentifier];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (id)_activePresenceAssertionsForClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalWorkQueue);
  id v5 = [(NSMapTable *)self->_activePresenceAssertionsByClient objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    [(NSMapTable *)self->_activePresenceAssertionsByClient setObject:v5 forKey:v4];
  }

  return v5;
}

- (BOOL)_addPresentDeviceForChannel:(id)a3 presentDevice:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKAPresenceManager *)self _activePresentDevicesForChannel:v6];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v8)
  {
    id v10 = 0;
LABEL_19:
    [obj addObject:v7];
    id v22 = +[SKAPresenceManager logger];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:
      BOOL v23 = 1;
      goto LABEL_23;
    }
    id v24 = [v6 identifier];
    *(_DWORD *)buf = 138412290;
    long long v35 = v24;
    _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Successfully added present device to in memory model for channel identifier: %@", buf, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v9 = v8;
  __int16 v27 = self;
  uint64_t v28 = v6;
  id v10 = 0;
  char v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v15 = [v14 deviceIdentifier];
      char v16 = [v7 deviceIdentifier];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        uint64_t v18 = +[SKAPresenceManager logger];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v19 = [v28 identifier];
          id v20 = [v7 deviceIdentifier];
          *(_DWORD *)buf = 138412546;
          long long v35 = v19;
          __int16 v36 = 2112;
          id v37 = v20;
          _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Found an existing present device for channel: %@ and device:%@", buf, 0x16u);
        }
        id v21 = v14;

        char v11 = 1;
        id v10 = v21;
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  }
  while (v9);
  if ((v11 & 1) == 0)
  {
    id v6 = v28;
    goto LABEL_19;
  }
  if (([v10 isEqual:v7] & 1) == 0)
  {
    id v6 = v28;
    [(SKAPresenceManager *)v27 _removePresentDeviceForChannel:v28 presentDevice:v10];
    [obj addObject:v7];
    id v22 = +[SKAPresenceManager logger];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    id v24 = [v28 identifier];
    uint64_t v26 = [v7 deviceIdentifier];
    *(_DWORD *)buf = 138412546;
    long long v35 = v24;
    __int16 v36 = 2112;
    id v37 = v26;
    _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Updated existing present device for channel: %@ and device:%@", buf, 0x16u);

    goto LABEL_21;
  }
  id v22 = +[SKAPresenceManager logger];
  id v6 = v28;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Not creating a new present device, one already exists.", buf, 2u);
  }
  BOOL v23 = 0;
LABEL_23:

  return v23;
}

- (BOOL)_removePresentDeviceForChannel:(id)a3 presentDevice:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKAPresenceManager *)self _activePresentDevicesForChannel:v6];
  id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __67__SKAPresenceManager__removePresentDeviceForChannel_presentDevice___block_invoke;
  id v21 = &unk_2646E1768;
  id v10 = v7;
  id v22 = v10;
  id v11 = v9;
  id v23 = v11;
  [v8 enumerateObjectsUsingBlock:&v18];
  uint64_t v12 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  if (v12)
  {
    uint64_t v13 = [v8 count];
    [v8 removeObjectsAtIndexes:v11];
    uint64_t v14 = [v8 count];
    uint64_t v15 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = [v6 identifier];
      *(_DWORD *)buf = 138412802;
      __int16 v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = v14;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully removed present devices for identifier: %@. Channel had %ld presence assertions, now has %ld", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v15 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceManager _removePresentDeviceForChannel:presentDevice:](v6);
    }
  }

  return v12 != 0;
}

void __67__SKAPresenceManager__removePresentDeviceForChannel_presentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 deviceIdentifier];
  uint64_t v8 = [v6 deviceIdentifier];

  LODWORD(v6) = [v7 isEqualToString:v8];
  if (v6)
  {
    id v9 = *(void **)(a1 + 40);
    [v9 addIndex:a3];
  }
}

- (id)_activePresentDevicesForChannel:(id)a3
{
  id v4 = a3;
  activeParticipantsByChannel = self->_activeParticipantsByChannel;
  id v6 = [v4 identifier];
  id v7 = [(NSMapTable *)activeParticipantsByChannel objectForKey:v6];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    uint64_t v8 = self->_activeParticipantsByChannel;
    id v9 = [v4 identifier];
    [(NSMapTable *)v8 setObject:v7 forKey:v9];
  }
  return v7;
}

- (void)_clearPresentDevicesForChannel:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Clearing present devices for channel: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  activeParticipantsByChannel = self->_activeParticipantsByChannel;
  uint64_t v8 = [v4 identifier];
  [(NSMapTable *)activeParticipantsByChannel setObject:v6 forKey:v8];
}

- (id)_sortAndDedupePresenceIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArray:v4];

  id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
  v10[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (void)_recalculateActivityTracking
{
  BOOL v3 = [(SKAPresenceManager *)self _activePresenceAssertionsExist];
  id v4 = [(SKAPresenceManager *)self channelManager];
  id v5 = v4;
  if (v3) {
    [v4 enableActivityTracking];
  }
  else {
    [v4 disableActivityTracking];
  }
}

- (BOOL)_activePresenceAssertionsExist
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  dispatch_semaphore_t v2 = [(NSMapTable *)self->_activePresenceAssertionsByClient objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) count])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_activePresenceAssertionForPresenceIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(NSMapTable *)self->_activePresenceAssertionsByClient objectEnumerator];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        long long v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = objc_msgSend(v14, "presenceIdentifier", v19);
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)_currentPayloadForPresenceIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(NSMapTable *)self->_activePresenceAssertionsByClient objectEnumerator];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        long long v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = objc_msgSend(v14, "presenceIdentifier", v19);
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = [v14 payload];

                goto LABEL_18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  id v17 = (void *)[objc_alloc(MEMORY[0x263F79800]) initWithData:0];
LABEL_18:

  return v17;
}

- (void)_findOrCreatePresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  channelFetchQueue = self->_channelFetchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
  block[3] = &unk_2646E16F0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(channelFetchQueue, block);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v2, OS_LOG_TYPE_DEFAULT, "CreateChannel: Proceeding to find/create a presence channel", buf, 2u);
  }

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) isPersonal];
  uint64_t v7 = *(void *)(a1 + 56);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_59;
  v16[3] = &unk_2646E1808;
  long long v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  id v22 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [v4 _findPresenceChannelForPresenceIdentifier:v5 isPersonal:v6 databaseContext:v7 completion:v16];
  id v10 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "CreateChannel: Waiting for channel creation completion", buf, 2u);
  }

  dispatch_time_t v11 = dispatch_time(0, 20000000000);
  if (dispatch_semaphore_wait(v8, v11))
  {
    id v12 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1();
    }

    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_63;
    block[3] = &unk_2646E1830;
    id v15 = *(id *)(a1 + 64);
    dispatch_async(v13, block);
  }
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAPresenceManager logger];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "CreateChannel: Found an existing presence channel", buf, 2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_60;
    block[3] = &unk_2646E1790;
    uint64_t v7 = &v22;
    id v22 = *(id *)(a1 + 72);
    long long v8 = &v21;
    id v21 = v3;
    dispatch_async(v6, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "CreateChannel: Could not find an existing presence channel, attempting to create a new one.", buf, 2u);
    }

    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    dispatch_time_t v11 = *(void **)(a1 + 64);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_61;
    v16[3] = &unk_2646E17E0;
    uint64_t v7 = &v17;
    id v13 = v11;
    id v17 = v13;
    long long v8 = (id *)v18;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    v18[0] = v14;
    v18[1] = v15;
    id v19 = *(id *)(a1 + 72);
    [v9 _createPresenceChannelForPresenceIdentifier:v10 options:v12 databaseContext:v13 completion:v16];
  }
}

uint64_t __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v18 = 0;
    [v7 save:&v18];
  }
  long long v8 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "CreateChannel: Finished creating a presence channel", buf, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_62;
  block[3] = &unk_2646E17B8;
  id v10 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v9, block);
}

uint64_t __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_62(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_63(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SKAPresenceManager _channelCreationTimeoutError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_findPresenceChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v16 = (void (**)(id, void *, void))a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(SKAPresenceManager *)self channelFetchQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(SKAPresenceManager *)self databaseManager];
  id v14 = [v13 existingChannelForPresenceIdentifier:v11 isPersonal:v7 databaseContext:v10];

  if (v14)
  {
    v16[2](v16, v14, 0);
  }
  else
  {
    id v15 = +[SKAPresenceManager _noExistingChannelError];
    ((void (**)(id, void *, void *))v16)[2](v16, 0, v15);
  }
}

- (void)_createPresenceChannelForPresenceIdentifier:(id)a3 options:(id)a4 databaseContext:(id)a5 completion:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_channelFetchQueue);
  id v14 = [[SKAPresenceMembershipKey alloc] initWithNewKeyMaterial];
  id v15 = [[SKAPresenceEncryptionKey alloc] initWithNewKeyMaterial];
  id v16 = [[SKAPresenceEncryptionKey alloc] initWithNewKeyMaterial];
  id v17 = v16;
  if (v14 && v15 && v16)
  {
    uint64_t v18 = [(SKAPresenceMembershipKey *)v14 privateKeyMaterial];
    uint64_t v29 = [(SKAPresenceEncryptionKey *)v15 keyMaterial];
    long long v28 = [(SKAPresenceEncryptionKey *)v17 keyMaterial];
    if (v18 && v29 && v28)
    {
      objc_initWeak((id *)location, self);
      long long v27 = [(SKAPresenceManager *)self channelManager];
      long long v26 = [v11 serviceIdentifier];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke;
      v30[3] = &unk_2646E18F8;
      objc_copyWeak(&v41, (id *)location);
      uint64_t v31 = v14;
      id v19 = v15;
      id v20 = v11;
      id v21 = v19;
      long long v32 = v19;
      long long v25 = v20;
      id v33 = v20;
      id v40 = v13;
      id v34 = v10;
      id v35 = v28;
      id v36 = v29;
      id v37 = v18;
      id v38 = v12;
      uint64_t v39 = self;
      [v27 createPresenceChannelWithMembershipKey:v31 serverKey:v21 serviceIdentifier:v26 completion:v30];

      id v11 = v25;
      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v23 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceManager _createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:]();
      }

      long long v24 = +[SKAPresenceManager _keyGenerationError];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
    }
  }
  else
  {
    id v22 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = v14;
      __int16 v43 = 2112;
      v44 = v15;
      __int16 v45 = 2112;
      BOOL v46 = v17;
      _os_log_error_impl(&dword_22480C000, v22, OS_LOG_TYPE_ERROR, "_sendPresenceDeactivationMessageForChannel - Failed to create one or more required crypto keys. membershipKey %@ serverKey %@ peerKey %@", location, 0x20u);
    }

    uint64_t v18 = +[SKAPresenceManager _keyGenerationError];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v18);
  }
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  id v11 = [WeakRetained internalWorkQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2;
  v17[3] = &unk_2646E18D0;
  id v18 = v9;
  id v19 = WeakRetained;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  id v31 = *(id *)(a1 + 104);
  id v23 = *(id *)(a1 + 56);
  id v24 = *(id *)(a1 + 64);
  id v25 = *(id *)(a1 + 72);
  id v26 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  id v27 = v12;
  uint64_t v28 = v13;
  id v29 = v7;
  id v30 = v8;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  dispatch_async(v11, v17);
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    if (objc_msgSend(v2, "_shouldReauthForError:"))
    {
      id v4 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1();
      }

      id v5 = [*(id *)(a1 + 40) accountProvider];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_64;
      v15[3] = &unk_2646E18A8;
      id v6 = *(void **)(a1 + 48);
      void v15[4] = *(void *)(a1 + 40);
      id v16 = v6;
      id v17 = *(id *)(a1 + 56);
      id v18 = *(id *)(a1 + 64);
      id v26 = *(id *)(a1 + 136);
      id v19 = *(id *)(a1 + 32);
      id v20 = *(id *)(a1 + 72);
      id v21 = *(id *)(a1 + 80);
      id v22 = *(id *)(a1 + 88);
      id v23 = *(id *)(a1 + 96);
      id v7 = *(id *)(a1 + 104);
      uint64_t v8 = *(void *)(a1 + 112);
      id v24 = v7;
      uint64_t v25 = v8;
      [v5 refreshCredentialForPrimaryAccountWithCompletion:v15];
    }
    else
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 136) + 16);
      v13();
    }
  }
  else
  {
    id v9 = [v2 channelManager];
    id v14 = [v9 serverTime];

    id v10 = [*(id *)(a1 + 40) databaseManager];
    id v11 = [v10 createPresenceChannelForPresenceIdentifier:*(void *)(a1 + 72) channelIdentifier:*(void *)(a1 + 120) channelToken:*(void *)(a1 + 128) peerKey:*(void *)(a1 + 80) serverKey:*(void *)(a1 + 88) membershipKey:*(void *)(a1 + 96) creationDate:v14 options:*(void *)(a1 + 64) databaseContext:*(void *)(a1 + 104)];

    id v12 = [*(id *)(a1 + 40) delegate];
    [v12 presenceManager:*(void *)(a1 + 112) didCreateChannel:v11];

    (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
  }
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SKAPresenceManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting channel creation", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    uint64_t v8 = [*(id *)(a1 + 32) channelManager];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 56) serviceIdentifier];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_65;
    v14[3] = &unk_2646E1880;
    objc_copyWeak(&v24, buf);
    id v23 = *(id *)(a1 + 120);
    id v15 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    id v18 = *(id *)(a1 + 88);
    id v19 = *(id *)(a1 + 96);
    id v20 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 104);
    uint64_t v13 = *(void *)(a1 + 112);
    id v21 = v12;
    uint64_t v22 = v13;
    [v8 createPresenceChannelWithMembershipKey:v9 serverKey:v10 serviceIdentifier:v11 completion:v14];

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 120) + 16))();
  }
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  id v11 = [WeakRetained internalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2_66;
  block[3] = &unk_2646E1858;
  id v18 = v9;
  id v30 = *(id *)(a1 + 96);
  id v19 = *(id *)(a1 + 32);
  id v20 = WeakRetained;
  id v21 = *(id *)(a1 + 40);
  id v22 = v7;
  id v23 = v8;
  id v24 = *(id *)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  id v27 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  id v28 = v12;
  uint64_t v29 = v13;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  dispatch_async(v11, block);
}

void __101__SKAPresenceManager__createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_2_66(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 128) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 48) channelManager];
    id v7 = [v3 serverTime];

    id v4 = [*(id *)(a1 + 48) databaseManager];
    id v5 = [v4 createPresenceChannelForPresenceIdentifier:*(void *)(a1 + 56) channelIdentifier:*(void *)(a1 + 64) channelToken:*(void *)(a1 + 72) peerKey:*(void *)(a1 + 80) serverKey:*(void *)(a1 + 88) membershipKey:*(void *)(a1 + 96) creationDate:v7 options:*(void *)(a1 + 104) databaseContext:*(void *)(a1 + 112)];

    id v6 = [*(id *)(a1 + 48) delegate];
    [v6 presenceManager:*(void *)(a1 + 120) didCreateChannel:v5];

    (*(void (**)(void))(*(void *)(a1 + 128) + 16))();
  }
}

- (void)_presencePayloadForChannel:(id)a3 clientPayload:(id)a4 options:(id)a5 timestamp:(id)a6 completion:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v14 clientSpecifiedURI];

  if (v17)
  {
    messagingProvider = self->_messagingProvider;
    id v19 = [v14 clientSpecifiedURI];
    LODWORD(messagingProvider) = [(SKAMessagingProviding *)messagingProvider isValidURI:v19];

    if (!messagingProvider)
    {
      id v23 = 0;
      goto LABEL_11;
    }
    id v20 = self->_messagingProvider;
    id v21 = [v14 clientSpecifiedURI];
    uint64_t v22 = [(SKAMessagingProviding *)v20 selfAddressedURIForURI:v21];
  }
  else
  {
    id v21 = [(SKAPresenceManager *)self messagingProvider];
    uint64_t v22 = [v21 tokenURI];
  }
  id v23 = (void *)v22;

  if (v23 && ![v23 isEqualToString:&stru_26D7A90B0])
  {
    id v24 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v23;
      _os_log_impl(&dword_22480C000, v24, OS_LOG_TYPE_DEFAULT, "SenderTokenURI: %@", buf, 0xCu);
    }

    id v25 = objc_alloc_init(DecryptedParticipantPayload);
    [(DecryptedParticipantPayload *)v25 setTokenUri:v23];
    id v26 = [v12 identifier];
    [(DecryptedParticipantPayload *)v25 setChannelIdentifier:v26];

    id v27 = [v12 presenceIdentifier];
    [(DecryptedParticipantPayload *)v25 setPresenceIdentifier:v27];

    id v28 = [v13 payloadData];
    uint64_t v29 = (void *)[v28 copy];
    [(DecryptedParticipantPayload *)v25 setClientPayload:v29];

    [v15 timeIntervalSince1970];
    [(DecryptedParticipantPayload *)v25 setTimestamp:(unint64_t)v30];
    id v31 = [(SKAPresenceManager *)self messagingProvider];
    long long v32 = [(DecryptedParticipantPayload *)v25 data];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke;
    v35[3] = &unk_2646E1920;
    id v38 = v16;
    id v36 = v25;
    id v37 = v12;
    id v33 = v25;
    [v31 signPayload:v32 completion:v35];

    goto LABEL_14;
  }
LABEL_11:
  id v34 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[SKAPresenceManager _presencePayloadForChannel:clientPayload:options:timestamp:completion:]((uint64_t)v23, v14);
  }

  (*((void (**)(id, void))v16 + 2))(v16, 0);
LABEL_14:
}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v15 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(SignedParticipantPayload);
    [(SignedParticipantPayload *)v8 setPayload:*(void *)(a1 + 32)];
    [(SignedParticipantPayload *)v8 setSignature:v7];
    id v9 = [SKAPresenceEncryptionKey alloc];
    uint64_t v10 = [*(id *)(a1 + 40) presencePeerKey];
    id v11 = [(SKAPresenceEncryptionKey *)v9 initWithKeyMaterial:v10];

    if (v11)
    {
      id v12 = [(SignedParticipantPayload *)v8 data];
      id v13 = [(SKAPresenceEncryptionKey *)v11 encryptPayload:v12];

      id v14 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        uint64_t v18 = [v13 length];
        _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Payload size: %ld", (uint8_t *)&v17, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v16 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_2();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (id)_presentDeviceFromPayload:(id)a3 onChannel:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 serverUpdateTimestampSeconds];
  id v9 = [v6 encryptedParticipantPayload];
  if (v9)
  {
    uint64_t v10 = [SKAPresenceEncryptionKey alloc];
    id v11 = [v7 presencePeerKey];
    id v12 = [(SKAPresenceEncryptionKey *)v10 initWithKeyMaterial:v11];

    if (!v12)
    {
      id v13 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]();
      }
      id v23 = 0;
      goto LABEL_65;
    }
    id v13 = [v12 decryptPayload:v9];
    if (!v13)
    {
      id v24 = +[SKAPresenceManager logger];
      id v25 = (SignedParticipantPayload *)v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]();
        id v23 = 0;
        id v25 = (SignedParticipantPayload *)v24;
      }
      else
      {
        id v23 = 0;
      }
      goto LABEL_64;
    }
    v80 = [[SignedParticipantPayload alloc] initWithData:v13];
    id v14 = [(SignedParticipantPayload *)v80 signature];
    if (!v14)
    {
      id v26 = +[SKAPresenceManager logger];
      id v27 = v26;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.4();
        id v23 = 0;
        id v27 = v26;
      }
      else
      {
        id v23 = 0;
      }
      goto LABEL_63;
    }
    v79 = [(SignedParticipantPayload *)v80 payload];
    v78 = [v79 channelIdentifier];
    id v15 = [v7 identifier];
    id v16 = v14;
    char v17 = [v15 isEqualToString:v78];

    if ((v17 & 1) == 0)
    {
      id v28 = +[SKAPresenceManager logger];
      id v14 = v16;
      uint64_t v29 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]2();
        id v23 = 0;
        uint64_t v29 = v28;
      }
      else
      {
        id v23 = 0;
      }
      goto LABEL_62;
    }
    uint64_t v77 = [v79 presenceIdentifier];
    uint64_t v18 = [v7 presenceIdentifier];
    char v19 = [v18 isEqualToString:v77];

    if ((v19 & 1) == 0)
    {
      double v30 = +[SKAPresenceManager logger];
      id v14 = v16;
      id v21 = v30;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]1();
        id v23 = 0;
        id v21 = v30;
LABEL_61:

        uint64_t v29 = (void *)v77;
LABEL_62:

        id v27 = v79;
LABEL_63:

        id v25 = v80;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
LABEL_29:
      id v23 = 0;
      goto LABEL_61;
    }
    id v20 = [v79 tokenUri];
    id v21 = v20;
    id v14 = v16;
    if (!v20 || [v20 isEqualToString:&stru_26D7A90B0])
    {
      uint64_t v22 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.5();
      }

      goto LABEL_29;
    }
    uint64_t v86 = 0;
    unint64_t v87 = &v86;
    uint64_t v88 = 0x2020000000;
    char v89 = 0;
    dispatch_semaphore_t dsemaa = dispatch_semaphore_create(0);
    long long v73 = [(SKAPresenceManager *)self messagingProvider];
    long long v71 = [(SignedParticipantPayload *)v80 signature];
    long long v75 = [(SignedParticipantPayload *)v80 payload];
    long long v69 = [v75 data];
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke;
    v82[3] = &unk_2646E1948;
    unint64_t v83 = v21;
    unint64_t v85 = &v86;
    long long v66 = v83;
    dispatch_semaphore_t dsema = dsemaa;
    dispatch_semaphore_t v84 = dsema;
    [v73 verifySignedPayload:v71 matchesPayload:v69 fromTokenURI:v83 completion:v82];

    dispatch_time_t v31 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(dsema, v31);
    if (!*((unsigned char *)v87 + 24))
    {
      uint64_t v41 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.6();
      }
      id v23 = 0;
      goto LABEL_60;
    }
    unint64_t v32 = [v79 timestamp];
    v76 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v32];
    id v33 = [(SKAPresenceManager *)self channelManager];
    long long v74 = [v33 serverTime];

    id v34 = [(SKAPresenceManager *)self _mostRecentAssertionTimeForTokenURI:v66 onChannel:v7];
    [v34 timeIntervalSince1970];
    double v36 = v35;
    [v76 timeIntervalSince1970];
    if (v36 > v37)
    {
      id v38 = +[SKAPresenceManager logger];
      uint64_t v39 = v34;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.7();
LABEL_44:
        id v23 = 0;
        id v38 = v40;
LABEL_59:

        uint64_t v41 = v76;
LABEL_60:

        _Block_object_dispose(&v86, 8);
        id v21 = v66;
        goto LABEL_61;
      }
      goto LABEL_45;
    }
    [v76 timeIntervalSince1970];
    if (vabdd_f64(v42, (double)v8) > 600.0)
    {
      id v38 = +[SKAPresenceManager logger];
      uint64_t v39 = v34;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.8();
        goto LABEL_44;
      }
LABEL_45:
      id v23 = 0;
      goto LABEL_59;
    }
    [v76 timeIntervalSince1970];
    double v44 = v43;
    [v74 timeIntervalSince1970];
    if (v44 - v45 > 86400.0)
    {
      uint64_t v39 = v34;
      id v38 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v40 = v38;
        -[SKAPresenceManager _presentDeviceFromPayload:onChannel:].cold.9();
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    long long v72 = [v79 clientPayload];
    if (v72)
    {
      uint64_t v46 = [objc_alloc(MEMORY[0x263F79800]) initWithData:v72];
      uint64_t v39 = v34;
      id v81 = 0;
      BOOL v47 = [(SKAPresenceManager *)self _clientPayload:v46 isValidWithError:&v81];
      long long v70 = v81;
      v63 = v46;
      if (!v47)
      {
        v58 = +[SKAPresenceManager logger];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]0();
        }
        id v23 = 0;
        goto LABEL_58;
      }
      __int16 v48 = v70;
    }
    else
    {
      uint64_t v49 = [objc_alloc(MEMORY[0x263F79800]) initWithData:0];
      __int16 v48 = +[SKAPresenceManager logger];
      v63 = v49;
      uint64_t v39 = v34;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v48, OS_LOG_TYPE_DEFAULT, "Incoming present device has no client-specified payload", buf, 2u);
      }
    }

    uint64_t v50 = [(SKAPresenceManager *)self messagingProvider];
    long long v70 = [v50 deviceTokenForTokenURI:v66];

    uint64_t v51 = [(SKAPresenceManager *)self messagingProvider];
    uint64_t v61 = [v51 deviceToken];

    long long v65 = [(SKAPresenceManager *)self _deviceIdentifierForToken:v70];
    id v62 = [(SKAPresenceManager *)self _deviceIdentifierForToken:v61];
    uint64_t v52 = [(SKAPresenceManager *)self messagingProvider];
    long long v64 = [v52 handleForTokenURI:v66];

    uint64_t v53 = [(SKAPresenceManager *)self messagingProvider];
    uint64_t v54 = [v53 isHandleAvailableToMessageFrom:v64];

    unint64_t v55 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v62;
      _os_log_impl(&dword_22480C000, v55, OS_LOG_TYPE_DEFAULT, "Self device identifier: %@", buf, 0xCu);
    }

    v56 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v65;
      _os_log_impl(&dword_22480C000, v56, OS_LOG_TYPE_DEFAULT, "Other device identifier: %@", buf, 0xCu);
    }

    LOBYTE(v60) = [v65 isEqualToString:v62];
    id v23 = (void *)[objc_alloc(MEMORY[0x263F79810]) initWithHandle:v64 deviceIdentifier:v65 deviceTokenURI:v66 payload:v63 assertionTime:v76 selfHandle:v54 selfDevice:v60];
    v57 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v23;
      _os_log_impl(&dword_22480C000, v57, OS_LOG_TYPE_DEFAULT, "Constructed SKPresentDevice from payload: %@", buf, 0xCu);
    }

    v58 = v61;
LABEL_58:

    id v38 = v63;
    goto LABEL_59;
  }
  id v12 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[SKAPresenceManager _presentDeviceFromPayload:onChannel:]();
  }
  id v23 = 0;
LABEL_66:

  return v23;
}

void __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5 || (a3 & 1) == 0)
  {
    id v6 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_mostRecentAssertionTimeForTokenURI:(id)a3 onChannel:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SKAPresenceManager *)self _activePresentDevicesForChannel:a4];
  unint64_t v8 = [(SKAPresenceManager *)self messagingProvider];
  id v9 = [v8 deviceTokenForTokenURI:v6];

  uint64_t v10 = [(SKAPresenceManager *)self _deviceIdentifierForToken:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        char v17 = objc_msgSend(v16, "deviceIdentifier", (void)v20);
        if ([v17 isEqualToString:v10])
        {
          uint64_t v18 = [v16 assertionTime];

          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
LABEL_11:

  return v18;
}

- (id)_deviceIdentifierForToken:(id)a3
{
  if (a3)
  {
    uint64_t v3 = objc_msgSend(a3, "ska_hexString");
    id v4 = objc_msgSend(v3, "ska_sha256Hash");

    id v5 = v4;
    uint64_t v6 = [v5 cStringUsingEncoding:1];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v6];
    unint64_t v8 = [v7 UUIDString];
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)_shouldReauthForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"SKPushManagerErrorDomain"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 1)
    {
      uint64_t v6 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingManager _shouldReauthForError:]();
      }
LABEL_15:
      BOOL v11 = 1;
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v7 = [v3 domain];
  if ([v7 isEqualToString:@"SKPushManagerErrorDomain"])
  {
    uint64_t v8 = [v3 code];

    if (v8 == 2)
    {
      uint64_t v6 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingManager _shouldReauthForError:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v9 = [v3 domain];
  if ([v9 isEqualToString:@"SKAChannelManagerErrorDomain"])
  {
    uint64_t v10 = [v3 code];

    if (v10 == -1000)
    {
      uint64_t v6 = +[SKAPresenceManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingManager _shouldReauthForError:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = +[SKAPresenceManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Error does not appear to be auth related, we should not attempt reauth", v13, 2u);
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (void)_rollChannelForCryptoFailureIfAllowed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKAPresenceManager *)self _shouldCryptoRoll];
  uint64_t v6 = +[SKAPresenceManager logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7) {
      -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:]();
    }

    [(SKAPresenceManager *)self _markCryptoRoll];
    uint64_t v6 = [(SKAPresenceManager *)self delegate];
    [v6 presenceManager:self didRequestToRollChannel:v4];
  }
  else if (v7)
  {
    -[SKAPresenceManager _rollChannelForCryptoFailureIfAllowed:]();
  }
}

+ (id)_noExistingAssertionError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"No existing assertion exists";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7001 userInfo:v4];

  return v5;
}

+ (id)_noExistingChannelError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"No channel exists for presence identifier";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7002 userInfo:v4];

  return v5;
}

+ (id)_keyGenerationError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Failed to generate cryptographic keys for channel";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7005 userInfo:v4];

  return v5;
}

+ (id)_payloadGenerationError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Failed to generate payload for presence message";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7006 userInfo:v4];

  return v5;
}

+ (id)_payloadOversizeError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Payload is too large";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7008 userInfo:v4];

  return v5;
}

+ (id)_presenceDisabledError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Presence has been disabled by the server";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7010 userInfo:v4];

  return v5;
}

+ (id)_channelCreationTimeoutError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Timed out creating presence channel";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7012 userInfo:v4];

  return v5;
}

+ (id)_unexpectedInternalError
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"An unexpected internal error occurred, please file a radar.";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v5 = [v2 errorWithDomain:v3 code:-7013 userInfo:v4];

  return v5;
}

- (BOOL)_shouldReassert
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"lastReassertTime", @"com.apple.StatusKitAgent");
  uint64_t v4 = [(SKAPresenceManager *)self _reassertResetTimeSeconds];
  if (v3)
  {
    double v5 = (double)v4;
    uint64_t v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceDate:v3];
    BOOL v8 = v7 > v5;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_markReassert
{
  id v2 = [MEMORY[0x263EFF910] now];
  CFPreferencesSetAppValue(@"lastReassertTime", v2, @"com.apple.StatusKitAgent");
}

- (BOOL)_shouldCryptoRoll
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"lastCryptoRollTime", @"com.apple.StatusKitAgent");
  uint64_t v4 = [(SKAPresenceManager *)self _cryptoRollResetTimeSeconds];
  if (v3)
  {
    double v5 = (double)v4;
    uint64_t v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceDate:v3];
    BOOL v8 = v7 > v5;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_markCryptoRoll
{
  id v2 = [MEMORY[0x263EFF910] now];
  CFPreferencesSetAppValue(@"lastCryptoRollTime", v2, @"com.apple.StatusKitAgent");
}

- (int64_t)_reassertResetTimeSeconds
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-reassert-reset-time-seconds"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    double v5 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reset time for reasserting presence should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 60;
  }

  return v4;
}

- (int64_t)_cryptoRollResetTimeSeconds
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-crypto-roll-reset-time-seconds"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    double v5 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reset time for resetting crypto roll rate limits presence should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 18000;
  }

  return v4;
}

- (int64_t)_maxPayloadSizeBytes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"shared-channels-max-presence-payload-size-bytes"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = (int)[v3 intValue];
    double v5 = +[SKAPresenceManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our maxPayload size should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 2048;
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_10 != -1) {
    dispatch_once(&logger_onceToken_10, &__block_literal_global_10);
  }
  id v2 = (void *)logger__logger_10;
  return v2;
}

uint64_t __28__SKAPresenceManager_logger__block_invoke()
{
  logger__logger_10 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceManager");
  return MEMORY[0x270F9A758]();
}

+ (id)oversizeLogger
{
  if (oversizeLogger_onceToken != -1) {
    dispatch_once(&oversizeLogger_onceToken, &__block_literal_global_118);
  }
  id v2 = (void *)oversizeLogger__logger;
  return v2;
}

uint64_t __36__SKAPresenceManager_oversizeLogger__block_invoke()
{
  oversizeLogger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  return MEMORY[0x270F9A758]();
}

- (NSMapTable)activePresenceAssertionsByClient
{
  return self->_activePresenceAssertionsByClient;
}

- (void)setActivePresenceAssertionsByClient:(id)a3
{
}

- (NSMapTable)activeParticipantsByChannel
{
  return self->_activeParticipantsByChannel;
}

- (void)setActiveParticipantsByChannel:(id)a3
{
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
}

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
{
}

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (SKAPresenceManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAPresenceManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)payloadUpdateProcessingQueue
{
  return self->_payloadUpdateProcessingQueue;
}

- (void)setPayloadUpdateProcessingQueue:(id)a3
{
}

- (BOOL)presenceEnabledByServer
{
  return self->_presenceEnabledByServer;
}

- (void)setPresenceEnabledByServer:(BOOL)a3
{
  self->_presenceEnabledByServer = a3;
}

- (OS_dispatch_queue)channelFetchQueue
{
  return self->_channelFetchQueue;
}

- (void)setChannelFetchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelFetchQueue, 0);
  objc_storeStrong((id *)&self->_payloadUpdateProcessingQueue, 0);
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_activeParticipantsByChannel, 0);
  objc_storeStrong((id *)&self->_activePresenceAssertionsByClient, 0);
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Payload is invalid! Aborting presence assertion. Error: %@", v2, v3, v4, v5, v6);
}

void __113__SKAPresenceManager_retainPresenceAssertionForPresenceIdentifier_withPresencePayload_options_client_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10_0(a1) serviceIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22480C000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);
}

- (void)_clientPayload:isValidWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Payload is oversized! Payload size:%lu Max size:%lu", v2, v3);
}

- (void)_sendPresenceAssertionMessageForChannel:(uint64_t)a1 withPayload:options:isRefresh:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "_sendPresenceAssertionMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (void)v3, DWORD2(v3));
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Presence payload is nil", v2, v3, v4, v5, v6);
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Account refresh required for error: %@", v2, v3, v4, v5, v6);
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Should not reauth for error: %@", v2, v3, v4, v5, v6);
}

void __103__SKAPresenceManager__sendPresenceAssertionMessageForChannel_withPayload_options_isRefresh_completion___block_invoke_2_25_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Account refresh did not fix secondary attempt %@", v2, v3, v4, v5, v6);
}

void __51__SKAPresenceManager_sendPollingMessageForChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error updating active particpants for channel %@  based on polling response", v2, v3, v4, v5, v6);
}

- (void)_sendPollingMessageForChannel:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "_sendPollingMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (void)v3, DWORD2(v3));
}

- (void)_handleBulkUpdateParticipantPayloads:(os_log_t)log forChannel:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Participant payload failed to be processed", buf, 2u);
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find presence assertion to remove from in memory model for subscription identifier: %@", v2, v3, v4, v5, v6);
}

void __94__SKAPresenceManager_releasePresenceAssertionForPresenceIdentifier_options_client_completion___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Deactivation message failed for %@ with error: %@", (void)v3, DWORD2(v3));
}

- (void)_sendPresenceDeactivationMessageForChannel:(uint64_t)a1 options:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "_sendPresenceDeactivationMessageForChannel - Failed to retrieve one or more required crypto keys. membershipKey %@ serverKey %@", (void)v3, DWORD2(v3));
}

void __84__SKAPresenceManager__sendPresenceDeactivationMessageForChannel_options_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Should not reauth for error releasing presence: %@", v2, v3, v4, v5, v6);
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10_0(a1) serviceIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22480C000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);
}

void __90__SKAPresenceManager_releaseAllPresenceAssertionsAssociatedWithClient_options_completion___block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find presence assertion to remove from in memory model for presence identifier: %@", v2, v3, v4, v5, v6);
}

- (void)channelReceivedIncomingPayloadUpdate:channel:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to deserialize data on channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Encrypted update data missing on channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to instantiate server key for channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to decrypt payload for channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to deserialize update on channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Missing participant payloads for update on channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unkown update type on channel %@", v2, v3, v4, v5, v6);
}

- (void)_handleIncomingPayloadUpdate:onChannel:withIdentifier:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to validate device on channel %@", v2, v3, v4, v5, v6);
}

void __106__SKAPresenceManager_findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10_0(a1) serviceIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22480C000, a2, v4, "Presence has been disabled by the server for identifier %@.", v5);
}

void __100__SKAPresenceManager_createPresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_48_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "CreateChannel: Timed out waiting for presence channel %@ to create", v2, v3, v4, v5, v6);
}

- (void)_presentDevicesChangedForChannel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Attempting to reassert to fix state", v2, v3, v4, v5, v6);
}

- (void)_presentDevicesChangedForChannel:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Not reasserting because of rate limit", v2, v3, v4, v5, v6);
}

- (void)_presentDevicesChangedForChannel:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Active assertion exists but we're missing or have expired from this channel: %@", v2, v3, v4, v5, v6);
}

void __55__SKAPresenceManager__presentDevicesChangedForChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error reasserting presence for channel %@", v2, v3, v4, v5, v6);
}

- (void)_removePresentDeviceForChannel:(void *)a1 presentDevice:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_11_0(&dword_22480C000, v2, v3, "Could not find present device for subscription identifier: \"%@\". Present devices: %@", v4, v5, v6, v7, 2u);
}

void __107__SKAPresenceManager__findOrCreatePresenceChannelForPresenceIdentifier_options_databaseContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "CreateChannel: Timed out waiting for channel creation to complete", v2, v3, v4, v5, v6);
}

- (void)_createPresenceChannelForPresenceIdentifier:options:databaseContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to obtain material for one or more required crypto keys", v2, v3, v4, v5, v6);
}

- (void)_presencePayloadForChannel:(uint64_t)a1 clientPayload:(void *)a2 options:timestamp:completion:.cold.1(uint64_t a1, void *a2)
{
  int64_t v8 = [a2 clientSpecifiedURI];
  OUTLINED_FUNCTION_11_0(&dword_22480C000, v2, v3, "Failed to get senderTokenURI: %@ clientSpecifiedURI %@", v4, v5, v6, v7, 2u);
}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to get signature: %@", v2, v3, v4, v5, v6);
}

void __92__SKAPresenceManager__presencePayloadForChannel_clientPayload_options_timestamp_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to get peer key", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload data empty", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to instantiate peer key for decryption", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload data failed to decrypt", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload data missing signature", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Missing token URI", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload data signature failed to verify", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Assertion time is older than existing presence, dropping", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Assertion time deviated too much from server received time! Asserting device clock out of sync or replay attack", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Assertion time is more than a day in the future, dropping. Our clock might be out of sync", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Incoming payload failed validation. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload presence ID does not match the identifier of the channel it was published on", v2, v3, v4, v5, v6);
}

- (void)_presentDeviceFromPayload:onChannel:.cold.12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Payload channel ID does not match the channel it was published on", v2, v3, v4, v5, v6);
}

void __58__SKAPresenceManager__presentDeviceFromPayload_onChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Signature verification for %@ failed with error %@", (void)v3, DWORD2(v3));
}

- (void)_rollChannelForCryptoFailureIfAllowed:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Rolling channel to attempt to solve crypto error.", v2, v3, v4, v5, v6);
}

- (void)_rollChannelForCryptoFailureIfAllowed:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "It's been too recent since our last crypto roll. Not rolling", v2, v3, v4, v5, v6);
}

@end