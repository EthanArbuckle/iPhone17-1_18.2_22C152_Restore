@interface SKAStatusPublishingManager
+ (id)_errorForDuplicateStatusPublishRequestWithIdentifier:(id)a3;
+ (id)_errorForRateLimit;
+ (id)_errorForStatusPublishRequestWithIdentifier:(id)a3 requestedStatusCreationDate:(id)a4 isOlderThanExistingStatus:(id)a5 existingStatusCreationDate:(id)a6;
+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3;
+ (id)logger;
- (BOOL)_shouldAbandonRequestForError:(id)a3;
- (BOOL)_shouldAllowPublishForPublishRequest:(id)a3 onChannel:(id)a4 error:(id *)a5;
- (BOOL)_shouldClientRateLimit;
- (BOOL)_shouldReauthForError:(id)a3;
- (BOOL)_shouldRetryWithDelayForError:(id)a3;
- (BOOL)_shouldRollChannelForError:(id)a3;
- (BOOL)clientIsRateLimited;
- (BOOL)pendingRequestScheduled;
- (OS_dispatch_queue)internalWorkQueue;
- (SKAAccountProviding)accountProvider;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKAInvitationManaging)invitationManager;
- (SKAStatusEncryptionManaging)encryptionManager;
- (SKAStatusPublishingManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 accountProvider:(id)a5 encryptionManager:(id)a6 invitationManager:(id)a7;
- (double)_pendingDelayTime;
- (double)_rapidPublishesTimescale;
- (double)_rateLimitDelayTime;
- (int64_t)_maxRapidPublishes;
- (int64_t)_maxRetryCount;
- (void)_markPublishAttempt;
- (void)_publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 retryCount:(unint64_t)a7 completion:(id)a8;
- (void)_removePendingPublishRequestWithUniqueIdentifier:(id)a3 databaseContext:(id)a4;
- (void)_removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4 databaseContext:(id)a5;
- (void)_shouldClientRateLimit;
- (void)createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5;
- (void)ensurePendingPublishRequestExistsWithPublishRequest:(id)a3 forStatusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (void)findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5;
- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)publishPendingRequestForReason:(int64_t)a3;
- (void)publishPendingRequestsWithDelay:(double)a3;
- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 completion:(id)a7;
- (void)removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4;
- (void)setAccountProvider:(id)a3;
- (void)setChannelManager:(id)a3;
- (void)setClientIsRateLimited:(BOOL)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setInternalWorkQueue:(id)a3;
- (void)setInvitationManager:(id)a3;
- (void)setPendingRequestScheduled:(BOOL)a3;
@end

@implementation SKAStatusPublishingManager

- (SKAStatusPublishingManager)initWithDatabaseManager:(id)a3 channelManager:(id)a4 accountProvider:(id)a5 encryptionManager:(id)a6 invitationManager:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SKAStatusPublishingManager;
  v17 = [(SKAStatusPublishingManager *)&v25 init];
  v18 = v17;
  if (v17)
  {
    *(_WORD *)&v17->_pendingRequestScheduled = 0;
    objc_storeStrong((id *)&v17->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_channelManager, a4);
    objc_storeStrong((id *)&v18->_encryptionManager, a6);
    objc_storeStrong((id *)&v18->_accountProvider, a5);
    objc_storeStrong((id *)&v18->_invitationManager, a7);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.StatusKitAgent.PublishingManager", v20);
    internalWorkQueue = v18->_internalWorkQueue;
    v18->_internalWorkQueue = (OS_dispatch_queue *)v21;
  }
  return v18;
}

- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void, void *))a7;
  if ([(SKAStatusPublishingManager *)self clientIsRateLimited])
  {
    id v15 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingManager publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:]();
    }

    id v16 = [(SKAStatusPublishingManager *)self databaseManager];
    v17 = (void *)[v16 newBackgroundContext];

    [(SKAStatusPublishingManager *)self ensurePendingPublishRequestExistsWithPublishRequest:v12 forStatusTypeIdentifier:v13 databaseContext:v17];
    [(SKAStatusPublishingManager *)self _rateLimitDelayTime];
    -[SKAStatusPublishingManager publishPendingRequestsWithDelay:](self, "publishPendingRequestsWithDelay:");
    v18 = +[SKAStatusPublishingManager _errorForRateLimit];
    v14[2](v14, 0, v18);
  }
  else
  {
    [(SKAStatusPublishingManager *)self _publishStatusRequest:v12 statusTypeIdentifier:v13 afterTime:v8 isPendingPublish:0 retryCount:v14 completion:a5];
  }
}

- (void)removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(SKAStatusPublishingManager *)self databaseManager];
  id v9 = (id)[v8 newBackgroundContext];

  [(SKAStatusPublishingManager *)self _removePendingPublishRequestsForStatusTypeIdentifier:v7 olderThanRequest:v6 databaseContext:v9];
}

- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)os_transaction_create();
  id v12 = [(SKAStatusPublishingManager *)self databaseManager];
  id v13 = (void *)[v12 newBackgroundContext];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_2646E0E88;
  id v19 = v8;
  v20 = self;
  id v22 = v9;
  id v23 = v10;
  id v21 = v11;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  id v17 = v8;
  [(SKAStatusPublishingManager *)self findOrCreatePersonalChannelForStatusTypeIdentifier:v14 databaseContext:v13 completion:v18];
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v27 = v6;
    id v8 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
          id v14 = [*(id *)(a1 + 40) channelManager];
          id v15 = [v14 serverTime];

          id v16 = [*(id *)(a1 + 40) encryptionManager];
          id v17 = [v13 identifier];
          v18 = [MEMORY[0x263EFF910] now];
          [v16 encodeStatusPayloadForProvisioning:v13 statusUniqueIdentifier:v17 dateCreated:v18 currentServerTime:v15 channel:v8];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    id v19 = [*(id *)(a1 + 40) channelManager];
    uint64_t v20 = *(void *)(a1 + 32);
    id v5 = v8;
    id v21 = [v8 identifier];
    id v22 = [v8 channelToken];
    id v23 = [MEMORY[0x263EFF910] now];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2;
    v29[3] = &unk_2646E0E60;
    id v32 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 32);
    id v31 = *(id *)(a1 + 48);
    [v19 publishProvisionPayloads:v20 onChannel:v21 withChannelToken:v22 publishInitiateTime:v23 retryCount:0 completion:v29];

    id v24 = v32;
    id v7 = v27;
  }
  else
  {
    objc_super v25 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_cold_1(a1);
    }

    id v24 = +[SKAStatusPublishingManager _noPersonalChannelErrorForStatusTypeIdentifier:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v26 = self;
  }
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SKAStatusPublishingManager logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully provisioned status payloads with the channel manager", v8, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
  id v7 = self;
}

- (void)_publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 afterTime:(double)a5 isPendingPublish:(BOOL)a6 retryCount:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = (void *)os_transaction_create();
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  id v19 = [(SKAStatusPublishingManager *)self internalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke;
  block[3] = &unk_2646E0F50;
  block[4] = self;
  id v25 = v14;
  BOOL v30 = a6;
  id v28 = v16;
  unint64_t v29 = a7;
  id v26 = v15;
  id v27 = v17;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  dispatch_after(v18, v19, block);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) databaseManager];
  id v3 = (void *)[v2 newBackgroundContext];

  [*(id *)(a1 + 32) ensurePendingPublishRequestExistsWithPublishRequest:*(void *)(a1 + 40) forStatusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v3];
  if ([*(id *)(a1 + 32) _shouldClientRateLimit])
  {
    v4 = +[SKAStatusPublishingManager _errorForRateLimit];
    [*(id *)(a1 + 32) setClientIsRateLimited:1];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setClientIsRateLimited:0];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2;
    v9[3] = &unk_2646E0F28;
    objc_copyWeak(v15, &location);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    char v16 = *(unsigned char *)(a1 + 80);
    v15[1] = *(id *)(a1 + 72);
    id v12 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 56);
    [v5 findOrCreatePersonalChannelForStatusTypeIdentifier:v6 databaseContext:v3 completion:v9];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = WeakRetained;
  if (v5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v52 = 0;
    int v10 = [WeakRetained _shouldAllowPublishForPublishRequest:v9 onChannel:v5 error:&v52];
    id v11 = v52;
    id v12 = v11;
    if (v10)
    {
      id v41 = v11;
      id v43 = v6;
      [*(id *)(a1 + 40) _markPublishAttempt];
      id v13 = [*(id *)(a1 + 32) statusUniqueIdentifier];
      id v14 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v5 identifier];
        *(_DWORD *)buf = 138412546;
        v54 = v13;
        __int16 v55 = 2112;
        v56 = v15;
        _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Publishing status unique identifier: %@ to channel: %@", buf, 0x16u);
      }
      uint64_t v39 = [*(id *)(a1 + 32) statusPayload];
      char v16 = [*(id *)(a1 + 40) channelManager];
      v40 = [v16 serverTime];

      id v17 = [v8 encryptionManager];
      dispatch_time_t v18 = [*(id *)(a1 + 32) dateCreated];
      uint64_t v38 = [v17 encodeStatusPayload:v39 statusUniqueIdentifier:v13 dateCreated:v18 currentServerTime:v40 channel:v5];

      id v19 = [v5 identifier];
      v37 = [v5 channelToken];
      unsigned int v36 = [*(id *)(a1 + 32) isScheduledRequest];
      char v20 = [*(id *)(a1 + 32) isSecondaryDeviceRepublish];
      id v21 = [v8 channelManager];
      [*(id *)(a1 + 32) dateCreated];
      id v22 = v42 = v8;
      uint64_t v23 = *(unsigned __int8 *)(a1 + 88);
      uint64_t v24 = *(void *)(a1 + 80);
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13;
      v44[3] = &unk_2646E0F00;
      int8x16_t v35 = *(int8x16_t *)(a1 + 32);
      id v25 = (id)v35.i64[0];
      int8x16_t v45 = vextq_s8(v35, v35, 8uLL);
      char v51 = v20;
      id v46 = *(id *)(a1 + 48);
      id v50 = *(id *)(a1 + 64);
      id v47 = v13;
      id v48 = v19;
      id v49 = *(id *)(a1 + 56);
      id v26 = v19;
      id v27 = v13;
      uint64_t v34 = v24;
      id v28 = (void *)v39;
      [v21 publishData:v38 onChannel:v26 withChannelToken:v37 publishInitiateTime:v22 isPendingPublish:v23 isScheduledPublish:v36 retryCount:v34 completion:v44];

      uint64_t v8 = v42;
      id v6 = v43;
      id v12 = v41;
    }
    else
    {
      BOOL v30 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_2((id *)(a1 + 32), (uint64_t)v12, v30);
      }

      id v31 = [*(id *)(a1 + 40) databaseManager];
      id v28 = (void *)[v31 newBackgroundContext];

      id v32 = *(void **)(a1 + 40);
      long long v33 = [*(id *)(a1 + 32) statusUniqueIdentifier];
      [v32 _removePendingPublishRequestWithUniqueIdentifier:v33 databaseContext:v28];

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    unint64_t v29 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_1(a1);
    }

    id v12 = +[SKAStatusPublishingManager _noPersonalChannelErrorForStatusTypeIdentifier:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = +[SKAStatusPublishingManager logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_6();
    }

    id v6 = [v3 userInfo];
    id v7 = [v6 objectForKey:SKAChannelManagerErrorRetryIntervalKey];

    if (v7)
    {
      uint64_t v8 = [v3 userInfo];
      uint64_t v9 = [v8 objectForKey:SKAChannelManagerErrorRetryIntervalKey];
      [v9 doubleValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 0.0;
    }
    if ([*(id *)(a1 + 32) _shouldReauthForError:v3])
    {
      dispatch_time_t v18 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Attempting reauth to resolve error", buf, 2u);
      }

      id v19 = [*(id *)(a1 + 32) accountProvider];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14;
      v34[3] = &unk_2646E0EB0;
      v34[4] = *(void *)(a1 + 32);
      *(double *)&v34[5] = v11;
      [v19 refreshCredentialForPrimaryAccountWithCompletion:v34];
    }
    if ([*(id *)(a1 + 32) _shouldAbandonRequestForError:v3])
    {
      char v20 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_5();
      }

      id v21 = [*(id *)(a1 + 32) databaseManager];
      id v22 = (void *)[v21 newBackgroundContext];

      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = [*(id *)(a1 + 40) statusUniqueIdentifier];
      [v23 _removePendingPublishRequestWithUniqueIdentifier:v24 databaseContext:v22];
    }
    if ([*(id *)(a1 + 32) _shouldRollChannelForError:v3])
    {
      int v25 = *(unsigned __int8 *)(a1 + 88);
      id v26 = +[SKAStatusPublishingManager logger];
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v27) {
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_4();
        }
      }
      else
      {
        if (v27) {
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_3();
        }

        id v26 = [*(id *)(a1 + 32) invitationManager];
        uint64_t v28 = *(void *)(a1 + 48);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_16;
        v33[3] = &unk_2646E0ED8;
        v33[4] = *(void *)(a1 + 32);
        *(double *)&v33[5] = v11;
        [v26 rollPersonalChannelWithStatusTypeIdentifier:v28 completion:v33];
      }
    }
    if ([*(id *)(a1 + 32) _shouldRetryWithDelayForError:v3])
    {
      unint64_t v29 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_2();
      }

      BOOL v30 = +[SKAStatusPublishingManager logger];
      id v31 = v30;
      if (v11 <= 0.0)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_1();
        }
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v36 = v11;
          _os_log_impl(&dword_22480C000, v31, OS_LOG_TYPE_DEFAULT, "Retrying after %f sec delay", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setClientIsRateLimited:1];
        [*(id *)(a1 + 32) publishPendingRequestsWithDelay:v11];
      }
    }
    else
    {
      [*(id *)(a1 + 32) setClientIsRateLimited:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = *(double *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      double v36 = v12;
      __int16 v37 = 2112;
      uint64_t v38 = v13;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully published status %@ to channel %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setClientIsRateLimited:0];
    id v14 = [*(id *)(a1 + 32) databaseManager];
    id v15 = (void *)[v14 newBackgroundContext];

    char v16 = *(void **)(a1 + 32);
    id v17 = [*(id *)(a1 + 40) statusUniqueIdentifier];
    [v16 _removePendingPublishRequestWithUniqueIdentifier:v17 databaseContext:v15];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  id v32 = self;
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SKAStatusPublishingManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, publishing pending publish requests", v8, 2u);
    }

    [*(id *)(a1 + 32) publishPendingRequestsWithDelay:*(double *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }
  }
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_16(uint64_t a1, int a2)
{
  v4 = +[SKAStatusPublishingManager logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Channel was rolled successfully.", v6, 2u);
    }

    [*(id *)(a1 + 32) publishPendingRequestsWithDelay:*(double *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_16_cold_1();
    }
  }
}

- (void)publishPendingRequestsWithDelay:(double)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v4 = self;
  objc_sync_enter(v4);
  if ([(SKAStatusPublishingManager *)v4 pendingRequestScheduled])
  {
    id v5 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Pending publish request has already been scheduled.  Not enqueuing again", buf, 2u);
    }
  }
  else
  {
    id v6 = [(SKAStatusPublishingManager *)v4 databaseManager];
    id v5 = [v6 newBackgroundContext];

    *(void *)buf = 0;
    dispatch_time_t v18 = buf;
    uint64_t v19 = 0x3032000000;
    char v20 = __Block_byref_object_copy_;
    id v21 = __Block_byref_object_dispose_;
    id v22 = [(SKADatabaseManaging *)v4->_databaseManager existingPendingPublishRequestsWithDatabaseContext:v5];
    if ([*((id *)v18 + 5) count])
    {
      id v7 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*((id *)v18 + 5) count];
        float v9 = a3;
        *(_DWORD *)uint64_t v23 = 134218240;
        uint64_t v24 = v8;
        __int16 v25 = 2048;
        double v26 = v9;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Will attempt to process %ld pending publish requests after a %.2f second delay", v23, 0x16u);
      }

      double v10 = (void *)os_transaction_create();
      [(SKAStatusPublishingManager *)v4 setPendingRequestScheduled:1];
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      double v12 = [(SKAStatusPublishingManager *)v4 internalWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke;
      block[3] = &unk_2646E0FA0;
      id v15 = v10;
      char v16 = buf;
      block[4] = v4;
      uint64_t v13 = v10;
      dispatch_after(v11, v12, block);
    }
    else
    {
      uint64_t v13 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "No pending publish requests", v23, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  objc_sync_exit(v4);
}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v60 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setPendingRequestScheduled:0];
  v2 = [*(id *)(v1 + 32) databaseManager];
  id v3 = (void *)[v2 newBackgroundContext];

  v4 = [*(id *)(v1 + 32) databaseManager];
  uint64_t v5 = [v4 existingPendingPublishRequestsWithDatabaseContext:v3];
  uint64_t v6 = *(void *)(*(void *)(v1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(v1 + 48) + 8) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    id v44 = v8;
    int8x16_t v45 = v3;
    uint64_t v43 = *(void *)v52;
    do
    {
      uint64_t v12 = 0;
      uint64_t v46 = v10;
      do
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
        id v14 = [v13 statusUniqueIdentifier];

        if (v14)
        {
          id v15 = [v13 dateCreated];
          char v16 = [MEMORY[0x263EFF910] now];
          [v16 timeIntervalSinceDate:v15];
          double v18 = v17;

          if (v18 <= 604800.0)
          {
            uint64_t v23 = [v13 retryCount];
            uint64_t v24 = [*(id *)(v1 + 32) _maxRetryCount];
            if (v23 >= v24)
            {
              uint64_t v39 = v24;
              v40 = +[SKAStatusPublishingManager logger];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = [v13 statusUniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                v56 = v41;
                __int16 v57 = 2048;
                uint64_t v58 = v39;
                _os_log_impl(&dword_22480C000, v40, OS_LOG_TYPE_DEFAULT, "Deleting pending status with ID %@ as it has passed the max retry count of %lu", buf, 0x16u);
              }
              v42 = *(void **)(v1 + 32);
              id v22 = [v13 statusUniqueIdentifier];
              [v42 _removePendingPublishRequestWithUniqueIdentifier:v22 databaseContext:v3];
            }
            else
            {
              id v25 = objc_alloc(MEMORY[0x263F79820]);
              [v13 payloadData];
              uint64_t v26 = v1;
              v28 = uint64_t v27 = v3;
              id v22 = (void *)[v25 initWithData:v28];

              unint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F79828]) initWithStatusPayload:v22];
              BOOL v30 = [v13 dateCreated];
              [v29 setDateCreated:v30];

              id v31 = [v13 statusUniqueIdentifier];
              [v29 setStatusUniqueIdentifier:v31];

              id v32 = [v13 statusTypeIdentifier];
              uint64_t v33 = v26;
              uint64_t v34 = [*(id *)(v26 + 32) databaseManager];
              int8x16_t v35 = [v13 statusUniqueIdentifier];
              [v34 incrementPendingPublishRequestRetryCountWithUniqueIdentifier:v35 databaseContext:v27];

              double v36 = +[SKAStatusPublishingManager logger];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v37 = [v29 statusUniqueIdentifier];
                *(_DWORD *)buf = 138412290;
                v56 = v37;
                _os_log_impl(&dword_22480C000, v36, OS_LOG_TYPE_DEFAULT, "Attempting to publish pending request with ID: %@", buf, 0xCu);
              }
              uint64_t v1 = v33;
              v47[0] = MEMORY[0x263EF8330];
              v47[1] = 3221225472;
              v47[2] = __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_21;
              v47[3] = &unk_2646E0F78;
              uint64_t v38 = *(void **)(v33 + 32);
              id v48 = *(id *)(v33 + 40);
              [v38 _publishStatusRequest:v29 statusTypeIdentifier:v32 afterTime:1 isPendingPublish:v23 + 1 retryCount:v47 completion:0.0];

              id v8 = v44;
              id v3 = v45;
              uint64_t v11 = v43;
            }
            uint64_t v10 = v46;
          }
          else
          {
            uint64_t v19 = +[SKAStatusPublishingManager logger];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              char v20 = [v13 statusUniqueIdentifier];
              *(_DWORD *)buf = 138412290;
              v56 = v20;
              _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Deleting pending status with ID %@ as it has expired", buf, 0xCu);

              uint64_t v10 = v46;
            }

            id v21 = *(void **)(v1 + 32);
            id v22 = [v13 statusUniqueIdentifier];
            [v21 _removePendingPublishRequestWithUniqueIdentifier:v22 databaseContext:v3];
          }
        }
        else
        {
          id v15 = +[SKAStatusPublishingManager logger];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_cold_1(&v49, v50, v15);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v10);
  }
}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Publish of pending status request with ID:%@ finished with error:%@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = self;
}

- (void)publishPendingRequestForReason:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Publish requested for reason: %lu", (uint8_t *)&v6, 0xCu);
  }

  [(SKAStatusPublishingManager *)self _pendingDelayTime];
  -[SKAStatusPublishingManager publishPendingRequestsWithDelay:](self, "publishPendingRequestsWithDelay:");
}

- (BOOL)_shouldAllowPublishForPublishRequest:(id)a3 onChannel:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(SKAStatusPublishingManager *)self databaseManager];
  id v11 = (void *)[v10 newBackgroundContext];

  uint64_t v12 = [(SKAStatusPublishingManager *)self databaseManager];
  uint64_t v13 = [v12 existingStatusForChannel:v9 databaseContext:v11];

  id v14 = [v13 uniqueIdentifier];
  id v15 = [v8 statusUniqueIdentifier];
  if ([v14 isEqualToString:v15])
  {
    char v16 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingManager _shouldAllowPublishForPublishRequest:onChannel:error:]((uint64_t)v14);
    }

    if (a5)
    {
      +[SKAStatusPublishingManager _errorForDuplicateStatusPublishRequestWithIdentifier:v14];
      BOOL v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    double v18 = [v13 dateCreated];
    uint64_t v19 = [v8 dateCreated];
    char v20 = (void *)v19;
    BOOL v17 = 1;
    if (v18 && v19 && [v18 compare:v19] != -1)
    {
      id v21 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138413058;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        BOOL v30 = v20;
        _os_log_error_impl(&dword_22480C000, v21, OS_LOG_TYPE_ERROR, "Dropping status publish request, existing status %@ was created at %@, publish request %@ from %@ is not newer.", (uint8_t *)&v23, 0x2Au);
      }

      if (a5)
      {
        +[SKAStatusPublishingManager _errorForStatusPublishRequestWithIdentifier:v15 requestedStatusCreationDate:v20 isOlderThanExistingStatus:v14 existingStatusCreationDate:v18];
        BOOL v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v17 = 0;
      }
    }
  }
  return v17;
}

- (BOOL)_shouldClientRateLimit
{
  id v3 = [MEMORY[0x263EFF910] now];
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"rapidPublishCount", @"com.apple.StatusKitAgent");
  if (v4) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = &unk_26D7BA100;
  }
  int64_t v6 = [(SKAStatusPublishingManager *)self _maxRapidPublishes];
  if (v6 < (int)[v5 intValue])
  {
    int64_t v7 = (void *)CFPreferencesCopyAppValue(@"lastPublishTime", @"com.apple.StatusKitAgent");
    if (v7)
    {
      [(SKAStatusPublishingManager *)self _rateLimitDelayTime];
      double v9 = v8;
      [v3 timeIntervalSinceDate:v7];
      if (v10 < v9)
      {
        id v11 = [v7 dateByAddingTimeInterval:v9];
        uint64_t v12 = +[SKAStatusPublishingManager logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[SKAStatusPublishingManager _shouldClientRateLimit]();
        }

        BOOL v13 = 1;
        goto LABEL_15;
      }
      id v14 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v16 = 0;
        _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "We've left the rate-limit backoff window.", v16, 2u);
      }

      CFPreferencesSetAppValue(@"rapidPublishCount", &unk_26D7BA100, @"com.apple.StatusKitAgent");
    }
    BOOL v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (void)_markPublishAttempt
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Incrementing rapid publish counter.", v2, v3, v4, v5, v6);
}

- (void)_removePendingPublishRequestsForStatusTypeIdentifier:(id)a3 olderThanRequest:(id)a4 databaseContext:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  double v10 = self;
  id v26 = v9;
  id v11 = -[SKADatabaseManaging existingPendingPublishRequestsForStatusTypeIdentifier:withDatabaseContext:](self->_databaseManager, "existingPendingPublishRequestsForStatusTypeIdentifier:withDatabaseContext:", a3);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v28;
    *(void *)&long long v13 = 138412546;
    long long v25 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        BOOL v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v18 = objc_msgSend(v17, "dateCreated", v25);
        uint64_t v19 = [v8 dateCreated];
        uint64_t v20 = [v18 compare:v19];

        if (v20 == -1)
        {
          id v21 = +[SKAStatusPublishingManager logger];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v17 statusUniqueIdentifier];
            int v23 = [v8 statusUniqueIdentifier];
            *(_DWORD *)buf = v25;
            id v32 = v22;
            __int16 v33 = 2112;
            uint64_t v34 = v23;
            _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Deleting pending publish request with ID: %@ because it is older than newly received publish request with ID %@", buf, 0x16u);
          }
          uint64_t v24 = [v17 statusUniqueIdentifier];
          [(SKAStatusPublishingManager *)v10 _removePendingPublishRequestWithUniqueIdentifier:v24 databaseContext:v26];
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }
}

- (void)ensurePendingPublishRequestExistsWithPublishRequest:(id)a3 forStatusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 statusUniqueIdentifier];
  uint64_t v12 = [(SKADatabaseManaging *)self->_databaseManager existingPendingPublishRequestForUniqueIdentifier:v11 withDatabaseContext:v10];

  long long v13 = +[SKAStatusPublishingManager logger];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v20 = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Pending status publish request already exists for status unique identifier: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    if (v14)
    {
      int v20 = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Creating new pending status publish request for status unique identifier: %@", (uint8_t *)&v20, 0xCu);
    }

    databaseManager = self->_databaseManager;
    long long v13 = [v8 statusUniqueIdentifier];
    char v16 = [v8 dateCreated];
    BOOL v17 = [v8 statusPayload];
    double v18 = [v17 payloadData];
    id v19 = (id)[(SKADatabaseManaging *)databaseManager createPendingPublishRequestWithUniqueIdentifier:v13 dateCreated:v16 payloadData:v18 statusTypeIdentifier:v9 databaseContext:v10];
  }
}

- (void)findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v8 databaseContext:v9];
  uint64_t v12 = +[SKAStatusPublishingManager logger];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      BOOL v14 = [v11 identifier];
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      int v20 = v14;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "StatusTypeIdentifier %@ corresponds to personal channel %@", buf, 0x16u);
    }
    v10[2](v10, v11, 0);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Could not find an existing personal status channel for statusTypeIdentifier %@, attempting to create a new one.", buf, 0xCu);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    id v15[2] = __108__SKAStatusPublishingManager_findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
    v15[3] = &unk_2646E0D28;
    char v16 = v10;
    [(SKAStatusPublishingManager *)self createPersonalChannelForStatusTypeIdentifier:v8 databaseContext:v9 completion:v15];
  }
}

uint64_t __108__SKAStatusPublishingManager_findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  channelManager = self->_channelManager;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  id v15[2] = __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
  v15[3] = &unk_2646E0DA0;
  objc_copyWeak(&v19, &location);
  void v15[4] = self;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v16 = v13;
  id v14 = v9;
  id v17 = v14;
  [(SKAChannelManaging *)channelManager createChannelWithCompletion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = +[SKAStatusPublishingManager logger];
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1();
    }

    if ([*(id *)(a1 + 32) _shouldReauthForError:v9])
    {
      id v13 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Attempting reauth to resolve error", buf, 2u);
      }

      id v14 = [*(id *)(a1 + 32) accountProvider];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_25;
      v18[3] = &unk_2646E0FC8;
      void v18[4] = *(void *)(a1 + 32);
      [v14 refreshCredentialForPrimaryAccountWithCompletion:v18];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Channel creation request succeeded, new personal channel for statusTypeIdentifier %@ has channel identifier %@", buf, 0x16u);
    }

    id v16 = [WeakRetained databaseManager];
    id v17 = [v16 createPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) channelIdentifier:v7 channelToken:v8 databaseContext:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_25(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = +[SKAStatusPublishingManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, publishing pending publish requests", v8, 2u);
    }

    [*(id *)(a1 + 32) publishPendingRequestsWithDelay:0.0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }
  }
}

- (void)_removePendingPublishRequestWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Deleting pending status publish request with identifier: %@", (uint8_t *)&v11, 0xCu);
  }

  char v9 = [(SKADatabaseManaging *)self->_databaseManager deletePendingPublishRequestWithWithUniqueIdentifier:v6 databaseContext:v7];
  if ((v9 & 1) == 0)
  {
    id v10 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingManager _removePendingPublishRequestWithUniqueIdentifier:databaseContext:]();
    }
  }
}

- (BOOL)_shouldReauthForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:@"SKPushManagerErrorDomain"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 1)
    {
      id v6 = +[SKAStatusPublishingManager logger];
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
      id v6 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingManager _shouldReauthForError:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  char v9 = [v3 domain];
  if ([v9 isEqualToString:@"SKAChannelManagerErrorDomain"])
  {
    uint64_t v10 = [v3 code];

    if (v10 == -1000)
    {
      id v6 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingManager _shouldReauthForError:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v6 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Error does not appear to be auth related, we should not attempt reauth", v13, 2u);
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_shouldAbandonRequestForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:@"SKPushManagerErrorDomain"])
  {

LABEL_6:
    id v7 = [v3 domain];
    if ([v7 isEqualToString:@"SKPushManagerErrorDomain"])
    {
      uint64_t v8 = [v3 code];

      if (v8 == 3)
      {
        id v6 = +[SKAStatusPublishingManager logger];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[SKAStatusPublishingManager _shouldAbandonRequestForError:]();
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
    BOOL v9 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 6) {
    goto LABEL_6;
  }
  id v6 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusPublishingManager _shouldAbandonRequestForError:]();
  }
LABEL_10:

  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)_shouldRollChannelForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:@"SKPushManagerErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 4)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  id v6 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusPublishingManager _shouldRollChannelForError:]();
  }

  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)_shouldRetryWithDelayForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:@"SKPushManagerErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 7)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  id v6 = +[SKAStatusPublishingManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusPublishingManager _shouldRetryWithDelayForError:]();
  }

  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (double)_pendingDelayTime
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-stale-publish-wait-time-seconds"];

  double v4 = 30.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
      id v6 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        float v7 = v4;
        int v9 = 134217984;
        double v10 = v7;
        _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Server bag indicates our pending publish request delay time should be %.2f", (uint8_t *)&v9, 0xCu);
      }
    }
  }

  return v4;
}

- (double)_rateLimitDelayTime
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-rate-limit-wait-time-seconds"];

  double v4 = 300.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
      id v6 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        float v7 = v4;
        int v9 = 134217984;
        double v10 = v7;
        _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Server bag indicates our rate limit delay time should be %.2f", (uint8_t *)&v9, 0xCu);
      }
    }
  }

  return v4;
}

- (int64_t)_maxRetryCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-request-retry-count"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 integerValue];
    double v5 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max retry count should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (int64_t)_maxRapidPublishes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-client-rate-limit-max-rapid-publishes"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 integerValue];
    double v5 = +[SKAStatusPublishingManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max rapid publishes should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 50;
  }

  return v4;
}

- (double)_rapidPublishesTimescale
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-client-rate-limit-rapid-publish-time-seconds"];

  double v4 = 10.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v4 = (double)[v3 integerValue];
      double v5 = +[SKAStatusPublishingManager logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = (uint64_t)v4;
        _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our rapid publish timescale should be %lu", (uint8_t *)&v7, 0xCu);
      }
    }
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_4 != -1) {
    dispatch_once(&logger_onceToken_4, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)logger__logger_4;
  return v2;
}

uint64_t __36__SKAStatusPublishingManager_logger__block_invoke()
{
  logger__logger_4 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusPublishingManager");
  return MEMORY[0x270F9A758]();
}

+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"Could not find or create a channel to publish status of type \"%@\".", a3];
  double v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v7 = [v4 errorWithDomain:v5 code:-3000 userInfo:v6];

  return v7;
}

+ (id)_errorForStatusPublishRequestWithIdentifier:(id)a3 requestedStatusCreationDate:(id)a4 isOlderThanExistingStatus:(id)a5 existingStatusCreationDate:(id)a6
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = [NSString stringWithFormat:@"Status Publish Request %@ created at %@ is not newer than existing status %@ at %@", a3, a4, a5, a6];
  int v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F79860];
  uint64_t v12 = *MEMORY[0x263F07F80];
  v13[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v10 = [v7 errorWithDomain:v8 code:-9002 userInfo:v9];

  return v10;
}

+ (id)_errorForDuplicateStatusPublishRequestWithIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"Status Publish Request has the same status unique identifier as existing status: %@", a3];
  double v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v7 = [v4 errorWithDomain:v5 code:-9001 userInfo:v6];

  return v7;
}

+ (id)_errorForRateLimit
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"Status Publish Request has been rate-limited"];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v3 errorWithDomain:v4 code:-9004 userInfo:v5];

  return v6;
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

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
}

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (OS_dispatch_queue)internalWorkQueue
{
  return self->_internalWorkQueue;
}

- (void)setInternalWorkQueue:(id)a3
{
}

- (BOOL)pendingRequestScheduled
{
  return self->_pendingRequestScheduled;
}

- (void)setPendingRequestScheduled:(BOOL)a3
{
  self->_pendingRequestScheduled = a3;
}

- (BOOL)clientIsRateLimited
{
  return self->_clientIsRateLimited;
}

- (void)setClientIsRateLimited:(BOOL)a3
{
  self->_clientIsRateLimited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkQueue, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)publishStatusRequest:statusTypeIdentifier:afterTime:isPendingPublish:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Client is currently rate-limited.  Enqueuing requests as pending publish.", v2, v3, v4, v5, v6);
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Could not find or create a personal channel for statusTypeIdentifier %@ error: %@", (void)v3, DWORD2(v3));
}

void __80__SKAStatusPublishingManager_provisionPayloads_statusTypeIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error provisioning status payloads with the channel manager: %@", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 48);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Could not find or create a personal channel for statusTypeIdentifier %@ error: %@", (void)v3, DWORD2(v3));
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_2_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 statusUniqueIdentifier];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_22480C000, a3, OS_LOG_TYPE_ERROR, "Dropping and removing status publish request with unique identifier %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Retry interval is 0--not retrying", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Attempting retry with delay.", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Rolling channel.", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Not rolling channel because this is a secondary device publish.", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Removing pending publish based on error", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_13_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error publishing status with the channel manager: %@", v2, v3, v4, v5, v6);
}

void __122__SKAStatusPublishingManager__publishStatusRequest_statusTypeIdentifier_afterTime_isPendingPublish_retryCount_completion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Channel roll failed.", v2, v3, v4, v5, v6);
}

void __62__SKAStatusPublishingManager_publishPendingRequestsWithDelay___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Skipping publish of pending request that lacks an status identifier", buf, 2u);
}

- (void)_shouldAllowPublishForPublishRequest:(uint64_t)a1 onChannel:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Dropping status publish request, a status with unique identifier %@ has already been published. PublishRequest: %@", (void)v3, DWORD2(v3));
}

- (void)_shouldClientRateLimit
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "In window for rate limit backoff.  We'll be free again at %@", v2, v3, v4, v5, v6);
}

void __102__SKAStatusPublishingManager_createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Channel creation request failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_removePendingPublishRequestWithUniqueIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Delete failed for pending status publish request with identifier: %@", v2, v3, v4, v5, v6);
}

- (void)_shouldReauthForError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Error is an auth expired error, we should attempt reauth", v2, v3, v4, v5, v6);
}

- (void)_shouldReauthForError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Error is an auth failed error, we should attempt reauth", v2, v3, v4, v5, v6);
}

- (void)_shouldReauthForError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Error is an auth missing auth token error, we should attempt reauth", v2, v3, v4, v5, v6);
}

- (void)_shouldAbandonRequestForError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Publish was rejected for being stale. Abandoning.", v2, v3, v4, v5, v6);
}

- (void)_shouldAbandonRequestForError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Publish was rejected for being malformed. Abandoning.", v2, v3, v4, v5, v6);
}

- (void)_shouldRollChannelForError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Channel identity validation failed. We should roll this channel.", v2, v3, v4, v5, v6);
}

- (void)_shouldRetryWithDelayForError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Publish was rejected because we've hit a rate limit.", v2, v3, v4, v5, v6);
}

@end