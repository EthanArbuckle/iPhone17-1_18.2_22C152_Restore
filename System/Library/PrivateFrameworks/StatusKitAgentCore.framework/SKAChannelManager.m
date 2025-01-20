@interface SKAChannelManager
+ (id)_jwtTokenNotFoundError;
+ (id)_serverResponseError;
+ (id)logger;
- (SKAAccountProviding)accountProvider;
- (SKAChannelManager)initWithPushManager:(id)a3 accountProvider:(id)a4 delegate:(id)a5;
- (SKAChannelManagingDelegate)delegate;
- (SKAPushManaging)pushManager;
- (id)_createPayloadDataFromData:(id)a3;
- (id)_getNonce;
- (id)_getPresenceJWTToken;
- (id)_getStatusJWTToken;
- (id)serverTime;
- (void)_getPresenceJWTToken;
- (void)_getStatusJWTTokenWithCompletion:(id)a3;
- (void)activePresenceChannelSubscriptionsWithCompletion:(id)a3;
- (void)activeStatusChannelSubscriptionsWithCompletion:(id)a3;
- (void)assertPresence:(id)a3 onChannel:(id)a4 membershipKey:(id)a5 serverKey:(id)a6 timestamp:(id)a7 withChannelToken:(id)a8 serviceIdentifier:(id)a9 isRefresh:(BOOL)a10 completion:(id)a11;
- (void)createChannelWithCompletion:(id)a3;
- (void)createPresenceChannelWithMembershipKey:(id)a3 serverKey:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6;
- (void)disableActivityTracking;
- (void)enableActivityTracking;
- (void)pollActiveParticipantsForChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 withChannelToken:(id)a6 serviceIdentifier:(id)a7 completion:(id)a8;
- (void)publishData:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 isPendingPublish:(BOOL)a7 isScheduledPublish:(BOOL)a8 retryCount:(unint64_t)a9 completion:(id)a10;
- (void)publishProvisionPayloads:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 retryCount:(unint64_t)a7 completion:(id)a8;
- (void)pushManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8;
- (void)pushManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5;
- (void)releasePresenceOnChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 timestamp:(id)a6 withChannelToken:(id)a7 serviceIdentifier:(id)a8 completion:(id)a9;
- (void)setAccountProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPushManager:(id)a3;
- (void)subscribeToPresenceChannels:(id)a3;
- (void)subscribeToStatusChannels:(id)a3;
- (void)unsubscribeFromPresenceChannels:(id)a3;
- (void)unsubscribeFromStatusChannels:(id)a3;
@end

@implementation SKAChannelManager

- (SKAChannelManager)initWithPushManager:(id)a3 accountProvider:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKAChannelManager;
  v12 = [(SKAChannelManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushManager, a3);
    [(SKAPushManaging *)v13->_pushManager setDelegate:v13];
    objc_storeStrong((id *)&v13->_accountProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)createChannelWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Received request to create a personal channel", buf, 2u);
  }

  v6 = objc_alloc_init(AuthCredential);
  v7 = [(SKAChannelManager *)self _getStatusJWTToken];
  if (v7)
  {
    [(AuthCredential *)v6 setSimpleJwt:v7];
    v8 = objc_alloc_init(SharedChannelCreateRequest);
    [(SharedChannelCreateRequest *)v8 setAuthCredential:v6];
    [(SharedChannelCreateRequest *)v8 setChannelOwnershipType:0];
    [(SharedChannelCreateRequest *)v8 setChannelTopic:@"com.apple.icloud.presence.mode.status"];
    id v9 = [(SharedChannelCreateRequest *)v8 data];
    id v10 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Asking push manager to execute create channel request", buf, 2u);
    }

    id v11 = [(SKAChannelManager *)self pushManager];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__SKAChannelManager_createChannelWithCompletion___block_invoke;
    v13[3] = &unk_2646E1018;
    id v14 = v4;
    [v11 createChannelWithProtoData:v9 completion:v13];
  }
  else
  {
    v12 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager createChannelWithCompletion:]();
    }

    v8 = +[SKAChannelManager _jwtTokenNotFoundError];
    (*((void (**)(id, void, void, SharedChannelCreateRequest *))v4 + 2))(v4, 0, 0, v8);
  }
}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = +[SKAChannelManager logger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Channel create response received", buf, 2u);
    }

    id v9 = [[SharedChannelCreateResponse alloc] initWithData:v5];
    uint64_t v10 = [(SharedChannelCreateResponse *)v9 status];
    id v11 = @"AUTH_EXPIRED";
    switch((int)v10)
    {
      case 0:
        v12 = +[SKAChannelManager logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Channel create success response received: %@", buf, 0xCu);
        }

        v13 = [(SharedChannelCreateResponse *)v9 channelIdentity];
        id v14 = [(__CFString *)v13 channelId];
        id v15 = [v14 base64EncodedStringWithOptions:0];

        v16 = [(__CFString *)v13 channelToken];
        v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_29;
      case 1:
        goto LABEL_19;
      case 2:
        id v11 = @"AUTH_FAILED";
        goto LABEL_19;
      case 3:
        id v11 = @"BAD_REQUEST";
        goto LABEL_19;
      case 4:
        id v11 = @"CHANNEL_IDENTITY_VALIDATION_FAILED";
        goto LABEL_19;
      case 5:
        id v11 = @"INTERNAL_ERROR";
        goto LABEL_19;
      case 6:
        id v11 = @"STALE_PUBLISH_REJECTED";
        goto LABEL_19;
      case 7:
        id v11 = @"RATE_LIMITED";
        goto LABEL_19;
      case 8:
        id v11 = @"INVALID_NONCE";
        goto LABEL_19;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v18 = @"Generic non-success response status";
        if (v11) {
          v18 = v11;
        }
        v13 = v18;

        v19 = +[SKAChannelManager logger];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_1();
        }

        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];
        if ([(SharedChannelCreateResponse *)v9 hasRetryIntervalSeconds]
          && [(SharedChannelCreateResponse *)v9 retryIntervalSeconds])
        {
          v20 = +[SKAChannelManager logger];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v21 = [(SharedChannelCreateResponse *)v9 retryIntervalSeconds];
            *(_DWORD *)buf = 134217984;
            v24 = (SharedChannelCreateResponse *)v21;
            _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"));
          [v15 setObject:v22 forKeyedSubscript:SKAChannelManagerErrorRetryIntervalKey];
        }
        v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SKPushManagerErrorDomain" code:(int)v10 userInfo:v15];
        v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_29:
        v17();

        break;
    }
  }
}

- (void)createPresenceChannelWithMembershipKey:(id)a3 serverKey:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v27 = a5;
  id v12 = a6;
  v13 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Received request to create a presence channel", buf, 2u);
  }

  id v14 = objc_alloc_init(AuthCredential);
  id v15 = objc_alloc_init(SharedOwnershipAuth);
  v16 = [(SKAChannelManager *)self _getPresenceJWTToken];
  if (v16)
  {
    [(SharedOwnershipAuth *)v15 setSimpleJwt:v16];
    v17 = [v10 publicKeyMaterial];
    [(SharedOwnershipAuth *)v15 setChannelPublicKey:v17];

    id v26 = v11;
    v18 = [v11 keyMaterial];
    [(SharedOwnershipAuth *)v15 setServerEncryptionKey:v18];

    v19 = [(SKAChannelManager *)self _getNonce];
    [(SharedOwnershipAuth *)v15 setNonce:v19];
    v20 = [v10 signPayload:v19];
    [(SharedOwnershipAuth *)v15 setSignNonce:v20];

    [(AuthCredential *)v14 setSharedOwnershipAuth:v15];
    unsigned int v21 = objc_alloc_init(SharedChannelCreateRequest);
    [(SharedChannelCreateRequest *)v21 setAuthCredential:v14];
    [(SharedChannelCreateRequest *)v21 setChannelOwnershipType:1];
    [(SharedChannelCreateRequest *)v21 setChannelTopic:@"com.apple.icloud.presence.shared.experience"];
    [(SharedChannelCreateRequest *)v21 setAdopter:v27];
    v22 = [(SharedChannelCreateRequest *)v21 data];
    v23 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Asking push manager to execute create presence channel request", buf, 2u);
    }

    v24 = [(SKAChannelManager *)self pushManager];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke;
    v28[3] = &unk_2646E1018;
    id v29 = v12;
    [v24 createChannelWithProtoData:v22 completion:v28];

    id v11 = v26;
  }
  else
  {
    uint64_t v25 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager createChannelWithCompletion:]();
    }

    v19 = +[SKAChannelManager _jwtTokenNotFoundError];
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v19);
  }
}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = +[SKAChannelManager logger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Presence channel create response received", buf, 2u);
    }

    id v9 = [[SharedChannelCreateResponse alloc] initWithData:v5];
    uint64_t v10 = [(SharedChannelCreateResponse *)v9 status];
    id v11 = @"AUTH_EXPIRED";
    switch((int)v10)
    {
      case 0:
        id v12 = +[SKAChannelManager logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Presence channel create success response received: %@", buf, 0xCu);
        }

        v13 = [(SharedChannelCreateResponse *)v9 channelIdentity];
        id v14 = [(__CFString *)v13 channelId];
        id v15 = [v14 base64EncodedStringWithOptions:0];

        v16 = [(__CFString *)v13 channelToken];
        v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_29;
      case 1:
        goto LABEL_19;
      case 2:
        id v11 = @"AUTH_FAILED";
        goto LABEL_19;
      case 3:
        id v11 = @"BAD_REQUEST";
        goto LABEL_19;
      case 4:
        id v11 = @"CHANNEL_IDENTITY_VALIDATION_FAILED";
        goto LABEL_19;
      case 5:
        id v11 = @"INTERNAL_ERROR";
        goto LABEL_19;
      case 6:
        id v11 = @"STALE_PUBLISH_REJECTED";
        goto LABEL_19;
      case 7:
        id v11 = @"RATE_LIMITED";
        goto LABEL_19;
      case 8:
        id v11 = @"INVALID_NONCE";
        goto LABEL_19;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v18 = @"Generic non-success response status";
        if (v11) {
          v18 = v11;
        }
        v13 = v18;

        v19 = +[SKAChannelManager logger];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_1();
        }

        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];
        if ([(SharedChannelCreateResponse *)v9 hasRetryIntervalSeconds]
          && [(SharedChannelCreateResponse *)v9 retryIntervalSeconds])
        {
          v20 = +[SKAChannelManager logger];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v21 = [(SharedChannelCreateResponse *)v9 retryIntervalSeconds];
            *(_DWORD *)buf = 134217984;
            v24 = (SharedChannelCreateResponse *)v21;
            _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SharedChannelCreateResponse retryIntervalSeconds](v9, "retryIntervalSeconds"));
          [v15 setObject:v22 forKeyedSubscript:SKAChannelManagerErrorRetryIntervalKey];
        }
        v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SKPushManagerErrorDomain" code:(int)v10 userInfo:v15];
        v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_29:
        v17();

        break;
    }
  }
}

- (void)publishProvisionPayloads:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 retryCount:(unint64_t)a7 completion:(id)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  v16 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v13;
    _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Received request to provision payloads on channel %@", buf, 0xCu);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke;
  v21[3] = &unk_2646E19A0;
  uint64_t v25 = self;
  id v26 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  id v17 = v12;
  id v18 = v13;
  id v19 = v14;
  id v20 = v15;
  [(SKAChannelManager *)self _getStatusJWTTokenWithCompletion:v21];
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v33 = objc_alloc_init(AuthCredential);
    id v34 = v3;
    [(AuthCredential *)v33 setSimpleJwt:v3];
    id v4 = objc_alloc_init(ChannelIdentity);
    [(ChannelIdentity *)v4 setChannelToken:*(void *)(a1 + 32)];
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:*(void *)(a1 + 40) options:0];
    [(ChannelIdentity *)v4 setChannelId:v5];

    [(ChannelIdentity *)v4 setChannelOwnershipType:0];
    [(ChannelIdentity *)v4 setChannelTopic:@"com.apple.icloud.presence.mode.status"];
    id v6 = objc_alloc_init(ChannelDeferredPublishInfo);
    v31 = v4;
    [(ChannelDeferredPublishInfo *)v6 setChannelIdentity:v4];
    [(ChannelDeferredPublishInfo *)v6 setPushPriority:1];
    [(ChannelDeferredPublishInfo *)v6 setRetryCount:0];
    v37 = v6;
    [(ChannelDeferredPublishInfo *)v6 setAdopter:@"CarrierPigeon"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v32 = a1;
    id obj = *(id *)(a1 + 48);
    uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v43 != v36) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v9 = objc_alloc_init(SharedChannelProvisionOffGridPacketInfo);
          uint64_t v10 = (void *)MEMORY[0x263EFF8F8];
          id v11 = [v8 decryptionKey];
          id v12 = [v11 SHA256Data];
          uint64_t v13 = [v12 bytes];
          id v14 = [v8 decryptionKey];
          id v15 = [v14 SHA256Data];
          unint64_t v16 = [v15 length];

          if (v16 >= 8) {
            uint64_t v17 = 8;
          }
          else {
            uint64_t v17 = v16;
          }
          id v18 = [v10 dataWithBytes:v13 length:v17];
          [(SharedChannelProvisionOffGridPacketInfo *)v9 setPacketId:v18];

          id v19 = [v8 encryptedStatusPayload];
          [(SharedChannelProvisionOffGridPacketInfo *)v9 setEncryptedPacket:v19];

          id v20 = [v8 validUntil];
          [v20 timeIntervalSince1970];
          [(SharedChannelProvisionOffGridPacketInfo *)v9 setPacketExpirationTimestampMillis:(unint64_t)(v21 * 1000.0)];

          id v22 = [v8 commitmentSalt];
          [(SharedChannelProvisionOffGridPacketInfo *)v9 setCommitmentSalt:v22];

          id v23 = [v8 initializationVector];
          [(SharedChannelProvisionOffGridPacketInfo *)v9 setInitializationVector:v23];

          [(ChannelDeferredPublishInfo *)v37 addChannelProvisionOffGridPacketInfo:v9];
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v38);
    }

    id v24 = objc_alloc_init(SharedChannelProvisionOffGridPayloadRequest);
    uint64_t v25 = v33;
    [(SharedChannelProvisionOffGridPayloadRequest *)v24 setAuthCredential:v33];
    [(SharedChannelProvisionOffGridPayloadRequest *)v24 setChannelDeferredPublishInfo:v37];
    id v26 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Sending provision request to push manager", buf, 2u);
    }

    id v27 = [*(id *)(v32 + 56) pushManager];
    id v28 = [(SharedChannelProvisionOffGridPayloadRequest *)v24 data];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32;
    v39[3] = &unk_2646E1018;
    id v40 = *(id *)(v32 + 64);
    [v27 provisionPayload:v28 completion:v39];

    id v3 = v34;
  }
  else
  {
    uint64_t v29 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1();
    }

    uint64_t v30 = *(void *)(a1 + 64);
    uint64_t v25 = +[SKAChannelManager _jwtTokenNotFoundError];
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v25);
  }
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v8 = +[SKAChannelManager logger];
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed provision request", buf, 2u);
      }

      uint64_t v10 = [[SharedChannelProvisionOffGridPayloadResponse alloc] initWithData:v5];
      int v11 = [(SharedChannelProvisionOffGridPayloadResponse *)v10 status];
      id v12 = +[SKAChannelManager logger];
      uint64_t v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_2(v10);
        }

        id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v15 = [(SharedChannelProvisionOffGridPayloadResponse *)v10 status];
        if (v15 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
          unint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          unint64_t v16 = off_2646E1A10[(int)v15];
        }
        [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];

        if ([(SharedChannelProvisionOffGridPayloadResponse *)v10 hasRetryIntervalSeconds]
          && [(SharedChannelProvisionOffGridPayloadResponse *)v10 retryIntervalSeconds])
        {
          id v18 = +[SKAChannelManager logger];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = [(SharedChannelProvisionOffGridPayloadResponse *)v10 retryIntervalSeconds];
            *(_DWORD *)buf = 134217984;
            uint64_t v23 = v19;
            _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SharedChannelProvisionOffGridPayloadResponse retryIntervalSeconds](v10, "retryIntervalSeconds"));
          [v14 setObject:v20 forKeyedSubscript:SKAChannelManagerErrorRetryIntervalKey];
        }
        double v21 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SKPushManagerErrorDomain", -[SharedChannelProvisionOffGridPayloadResponse status](v10, "status"), v14);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_27;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Provision request completed with success", buf, 2u);
      }

      uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_1();
      }

      uint64_t v10 = +[SKAChannelManager _serverResponseError];
      uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  v7 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_3();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_28:
}

- (void)publishData:(id)a3 onChannel:(id)a4 withChannelToken:(id)a5 publishInitiateTime:(id)a6 isPendingPublish:(BOOL)a7 isScheduledPublish:(BOOL)a8 retryCount:(unint64_t)a9 completion:(id)a10
{
  BOOL v34 = a8;
  BOOL v10 = a7;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v35 = a10;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  unsigned int v19 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v15;
    _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Received request to publish data on channel %@", buf, 0xCu);
  }

  id v20 = objc_alloc_init(ChannelIdentity);
  [(ChannelIdentity *)v20 setChannelToken:v17];

  uint64_t v36 = v15;
  double v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
  [(ChannelIdentity *)v20 setChannelId:v21];

  [(ChannelIdentity *)v20 setChannelOwnershipType:0];
  [(ChannelIdentity *)v20 setChannelTopic:@"com.apple.icloud.presence.mode.status"];
  id v22 = objc_alloc_init(ChannelPublishPayload);
  [v16 timeIntervalSince1970];
  double v24 = v23;

  [(ChannelPublishPayload *)v22 setPublishInitiateTimestampMillis:(unint64_t)(v24 * 1000.0)];
  [(ChannelPublishPayload *)v22 setPendingPublishHint:v10];
  [(ChannelPublishPayload *)v22 setScheduledPublishHint:v34];
  [(ChannelPublishPayload *)v22 setRetryCount:a9];
  [(ChannelPublishPayload *)v22 setChannelIdentity:v20];
  [(ChannelPublishPayload *)v22 setPublishPayloadExpiryTtlMillis:604800000];
  uint64_t v25 = [(SKAChannelManager *)self _createPayloadDataFromData:v18];

  [(ChannelPublishPayload *)v22 setPublishPayload:v25];
  [(ChannelPublishPayload *)v22 setPushPriority:1];
  id v26 = objc_alloc_init(AuthCredential);
  id v27 = [(SKAChannelManager *)self _getStatusJWTToken];
  if (v27)
  {
    [(AuthCredential *)v26 setSimpleJwt:v27];
    id v28 = objc_alloc_init(SharedChannelPublishRequest);
    [(SharedChannelPublishRequest *)v28 setAuthCredential:v26];
    [(SharedChannelPublishRequest *)v28 setChannelPublishPayload:v22];
    uint64_t v29 = [(SharedChannelPublishRequest *)v28 data];
    uint64_t v30 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v30, OS_LOG_TYPE_DEFAULT, "Sending publish request to push manager", buf, 2u);
    }

    v31 = [(SKAChannelManager *)self pushManager];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke;
    v37[3] = &unk_2646E1018;
    uint64_t v32 = v35;
    id v38 = v35;
    [v31 publishStatus:v29 completion:v37];
  }
  else
  {
    v33 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1();
    }

    id v28 = +[SKAChannelManager _jwtTokenNotFoundError];
    uint64_t v32 = v35;
    (*((void (**)(id, SharedChannelPublishRequest *))v35 + 2))(v35, v28);
  }
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v8 = +[SKAChannelManager logger];
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed status publish request", buf, 2u);
      }

      BOOL v10 = [[SharedChannelPublishResponse alloc] initWithData:v5];
      int v11 = [(SharedChannelPublishResponse *)v10 status];
      id v12 = +[SKAChannelManager logger];
      uint64_t v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_2(v10);
        }

        id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v15 = [(SharedChannelPublishResponse *)v10 status];
        if (v15 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
          id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v16 = off_2646E1A10[(int)v15];
        }
        [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];

        if ([(SharedChannelPublishResponse *)v10 hasRetryIntervalSeconds]
          && [(SharedChannelPublishResponse *)v10 retryIntervalSeconds])
        {
          id v18 = +[SKAChannelManager logger];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = [(SharedChannelPublishResponse *)v10 retryIntervalSeconds];
            *(_DWORD *)buf = 134217984;
            uint64_t v23 = v19;
            _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Retry interval specified: %ld", buf, 0xCu);
          }

          id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SharedChannelPublishResponse retryIntervalSeconds](v10, "retryIntervalSeconds"));
          [v14 setObject:v20 forKeyedSubscript:SKAChannelManagerErrorRetryIntervalKey];
        }
        double v21 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SKPushManagerErrorDomain", -[SharedChannelPublishResponse status](v10, "status"), v14);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_27;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Publish status request completed with success", buf, 2u);
      }

      id v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_1();
      }

      BOOL v10 = +[SKAChannelManager _serverResponseError];
      id v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  v7 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_3();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_28:
}

- (void)assertPresence:(id)a3 onChannel:(id)a4 membershipKey:(id)a5 serverKey:(id)a6 timestamp:(id)a7 withChannelToken:(id)a8 serviceIdentifier:(id)a9 isRefresh:(BOOL)a10 completion:(id)a11
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v17 = a4;
  id v48 = a5;
  id v18 = a6;
  id v47 = a7;
  id v46 = a9;
  id v19 = a11;
  id v20 = a8;
  double v21 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Received request to assert presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  id v22 = objc_alloc_init(ChannelIdentity);
  [(ChannelIdentity *)v22 setChannelToken:v20];

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v17 options:0];
  [(ChannelIdentity *)v22 setChannelId:v23];

  [(ChannelIdentity *)v22 setChannelOwnershipType:1];
  [(ChannelIdentity *)v22 setChannelTopic:@"com.apple.icloud.presence.shared.experience"];
  uint64_t v24 = objc_alloc_init(AuthCredential);
  uint64_t v25 = objc_alloc_init(SharedOwnershipAuth);
  id v26 = [(SKAChannelManager *)self _getPresenceJWTToken];
  long long v45 = v17;
  if (v26)
  {
    [(SharedOwnershipAuth *)v25 setSimpleJwt:v26];
    [v48 publicKeyMaterial];
    v28 = id v27 = v18;
    [(SharedOwnershipAuth *)v25 setChannelPublicKey:v28];

    long long v44 = v27;
    uint64_t v29 = [v27 keyMaterial];
    [(SharedOwnershipAuth *)v25 setServerEncryptionKey:v29];

    long long v43 = self;
    uint64_t v30 = [(SKAChannelManager *)self _getNonce];
    [(SharedOwnershipAuth *)v25 setNonce:v30];
    v31 = [v48 signPayload:v30];
    [(SharedOwnershipAuth *)v25 setSignNonce:v31];

    [(AuthCredential *)v24 setSharedOwnershipAuth:v25];
    uint64_t v32 = objc_alloc_init(ChannelActivityActivationRequest);
    long long v42 = v24;
    [(ChannelActivityActivationRequest *)v32 setAuthCredential:v24];
    [(ChannelActivityActivationRequest *)v32 setChannelIdentity:v22];
    [(ChannelActivityActivationRequest *)v32 setRequestFlag:a10];
    long long buf = 0uLL;
    v33 = [MEMORY[0x263F08C38] UUID];
    [v33 getUUIDBytes:&buf];

    BOOL v34 = [MEMORY[0x263EFF8F8] dataWithBytes:&buf length:16];
    [(ChannelActivityActivationRequest *)v32 setUuid:v34];
    [v47 timeIntervalSince1970];
    [(ChannelActivityActivationRequest *)v32 setClientTimestampSeconds:(unint64_t)v35];
    [(ChannelActivityActivationRequest *)v32 setEncryptedParticipantPayload:v49];
    [(ChannelActivityActivationRequest *)v32 setAdopter:v46];
    uint64_t v36 = objc_alloc_init(SharedChannelActivityRequest);
    [(SharedChannelActivityRequest *)v36 setActivationRequest:v32];
    [(SharedChannelActivityRequest *)v36 setRequest:1];
    v37 = [(SharedChannelActivityRequest *)v36 data];
    id v38 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v53 = 138412290;
      v54 = v34;
      _os_log_impl(&dword_22480C000, v38, OS_LOG_TYPE_DEFAULT, "Sending presence activation request %@ to push manager", v53, 0xCu);
    }

    v39 = [(SKAChannelManager *)v43 pushManager];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke;
    v50[3] = &unk_2646E19C8;
    id v51 = v34;
    id v52 = v19;
    id v40 = v34;
    [v39 sendPresenceMessage:v37 completion:v50];

    id v18 = v44;
    uint64_t v24 = v42;
  }
  else
  {
    uint64_t v41 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager createChannelWithCompletion:]();
    }

    uint64_t v30 = +[SKAChannelManager _jwtTokenNotFoundError];
    (*((void (**)(id, void *, void, void, double))v19 + 2))(v19, v30, 0, MEMORY[0x263EFFA68], 1.79769313e308);
  }
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_3();
    }

    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(1.79769313e308);
  }
  else
  {
    v8 = +[SKAChannelManager logger];
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed presence assertion request %@", (uint8_t *)&v19, 0xCu);
      }

      int v11 = [[SharedChannelActivityResponse alloc] initWithData:v5];
      id v12 = [(SharedChannelActivityResponse *)v11 activationResponse];
      int v13 = [v12 status];
      id v14 = +[SKAChannelManager logger];
      uint64_t v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_2(a1, v12);
        }

        id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SKPushManagerErrorDomain", (int)objc_msgSend(v12, "status"), v16);
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(1.79769313e308);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v19 = 138412290;
          uint64_t v20 = v18;
          _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Presence assertion request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        id v16 = [v12 participantPayloads];
        (*(void (**)(void, void, uint64_t, id, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, [v12 version], v16, (double)(unint64_t)objc_msgSend(v12, "activationExpirySeconds"));
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_1();
      }

      int v11 = +[SKAChannelManager _serverResponseError];
      (*(void (**)(double))(*(void *)(a1 + 40) + 16))(1.79769313e308);
    }
  }
}

- (void)releasePresenceOnChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 timestamp:(id)a6 withChannelToken:(id)a7 serviceIdentifier:(id)a8 completion:(id)a9
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v45 = a6;
  id v44 = a8;
  id v17 = a9;
  id v18 = a7;
  int v19 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Received request to release presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v20 = objc_alloc_init(ChannelIdentity);
  [(ChannelIdentity *)v20 setChannelToken:v18];

  long long v42 = v14;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0];
  [(ChannelIdentity *)v20 setChannelId:v21];

  [(ChannelIdentity *)v20 setChannelOwnershipType:1];
  [(ChannelIdentity *)v20 setChannelTopic:@"com.apple.icloud.presence.shared.experience"];
  id v22 = objc_alloc_init(AuthCredential);
  uint64_t v23 = objc_alloc_init(SharedOwnershipAuth);
  uint64_t v24 = [(SKAChannelManager *)self _getPresenceJWTToken];
  uint64_t v41 = v16;
  if (v24)
  {
    [(SharedOwnershipAuth *)v23 setSimpleJwt:v24];
    uint64_t v25 = [v15 publicKeyMaterial];
    [(SharedOwnershipAuth *)v23 setChannelPublicKey:v25];

    id v26 = [v16 keyMaterial];
    [(SharedOwnershipAuth *)v23 setServerEncryptionKey:v26];

    id v27 = [(SKAChannelManager *)self _getNonce];
    [(SharedOwnershipAuth *)v23 setNonce:v27];
    id v40 = v15;
    id v28 = [v15 signPayload:v27];
    [(SharedOwnershipAuth *)v23 setSignNonce:v28];

    [(AuthCredential *)v22 setSharedOwnershipAuth:v23];
    uint64_t v29 = objc_alloc_init(ChannelActivityDeactivationRequest);
    v39 = v22;
    [(ChannelActivityDeactivationRequest *)v29 setAuthCredential:v22];
    [(ChannelActivityDeactivationRequest *)v29 setChannelIdentity:v20];
    long long buf = 0uLL;
    uint64_t v30 = [MEMORY[0x263F08C38] UUID];
    [v30 getUUIDBytes:&buf];

    v31 = [MEMORY[0x263EFF8F8] dataWithBytes:&buf length:16];
    [(ChannelActivityDeactivationRequest *)v29 setUuid:v31];
    [v45 timeIntervalSince1970];
    [(ChannelActivityDeactivationRequest *)v29 setClientTimestampSeconds:(unint64_t)v32];
    [(ChannelActivityDeactivationRequest *)v29 setAdopter:v44];
    v33 = objc_alloc_init(SharedChannelActivityRequest);
    [(SharedChannelActivityRequest *)v33 setDeactivationRequest:v29];
    [(SharedChannelActivityRequest *)v33 setRequest:2];
    BOOL v34 = [(SharedChannelActivityRequest *)v33 data];
    double v35 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v49 = 138412290;
      v50 = v31;
      _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Sending presence deactivation request %@ to push manager", v49, 0xCu);
    }

    uint64_t v36 = [(SKAChannelManager *)self pushManager];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke;
    v46[3] = &unk_2646E19C8;
    id v47 = v31;
    id v48 = v17;
    id v37 = v31;
    [v36 sendPresenceMessage:v34 completion:v46];

    id v15 = v40;
    id v22 = v39;
  }
  else
  {
    id v38 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager createChannelWithCompletion:]();
    }

    id v27 = +[SKAChannelManager _jwtTokenNotFoundError];
    (*((void (**)(id, void *))v17 + 2))(v17, v27);
  }
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = +[SKAChannelManager logger];
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed presence assertion release request %@", (uint8_t *)&v19, 0xCu);
      }

      int v11 = [[SharedChannelActivityResponse alloc] initWithData:v5];
      id v12 = [(SharedChannelActivityResponse *)v11 deactivationResponse];
      int v13 = [v12 status];
      id v14 = +[SKAChannelManager logger];
      id v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(a1, v12);
        }

        id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SKPushManagerErrorDomain", (int)objc_msgSend(v12, "status"), v16);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v19 = 138412290;
          uint64_t v20 = v18;
          _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Presence assertion release request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1();
      }

      int v11 = +[SKAChannelManager _serverResponseError];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)pollActiveParticipantsForChannel:(id)a3 membershipKey:(id)a4 serverKey:(id)a5 withChannelToken:(id)a6 serviceIdentifier:(id)a7 completion:(id)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v45 = a7;
  id v43 = a8;
  id v17 = a6;
  uint64_t v18 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Received request to poll presence on channel %@", (uint8_t *)&buf, 0xCu);
  }

  int v19 = objc_alloc_init(ChannelIdentity);
  [(ChannelIdentity *)v19 setChannelToken:v17];

  id v44 = v14;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0];
  [(ChannelIdentity *)v19 setChannelId:v20];

  [(ChannelIdentity *)v19 setChannelOwnershipType:1];
  [(ChannelIdentity *)v19 setChannelTopic:@"com.apple.icloud.presence.shared.experience"];
  uint64_t v21 = objc_alloc_init(AuthCredential);
  id v22 = objc_alloc_init(SharedOwnershipAuth);
  [(SKAChannelManager *)self _getPresenceJWTToken];
  v24 = uint64_t v23 = self;
  if (v24)
  {
    [(SharedOwnershipAuth *)v22 setSimpleJwt:v24];
    uint64_t v25 = [v15 publicKeyMaterial];
    [(SharedOwnershipAuth *)v22 setChannelPublicKey:v25];

    id v41 = v16;
    id v26 = [v16 keyMaterial];
    [(SharedOwnershipAuth *)v22 setServerEncryptionKey:v26];

    id v40 = v23;
    id v27 = [(SKAChannelManager *)v23 _getNonce];
    [(SharedOwnershipAuth *)v22 setNonce:v27];
    id v42 = v15;
    id v28 = [v15 signPayload:v27];
    [(SharedOwnershipAuth *)v22 setSignNonce:v28];

    [(AuthCredential *)v21 setSharedOwnershipAuth:v22];
    uint64_t v29 = objc_alloc_init(ChannelActivityPollingRequest);
    v39 = v21;
    [(ChannelActivityPollingRequest *)v29 setAuthCredential:v21];
    [(ChannelActivityPollingRequest *)v29 setChannelIdentity:v19];
    [(ChannelActivityPollingRequest *)v29 setRequestFlag:2];
    long long buf = 0uLL;
    uint64_t v30 = [MEMORY[0x263F08C38] UUID];
    [v30 getUUIDBytes:&buf];

    v31 = [MEMORY[0x263EFF8F8] dataWithBytes:&buf length:16];
    [(ChannelActivityPollingRequest *)v29 setUuid:v31];
    [(ChannelActivityPollingRequest *)v29 setAdopter:v45];
    double v32 = objc_alloc_init(SharedChannelActivityRequest);
    [(SharedChannelActivityRequest *)v32 setPollingRequest:v29];
    [(SharedChannelActivityRequest *)v32 setRequest:3];
    v33 = [(SharedChannelActivityRequest *)v32 data];
    BOOL v34 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v49 = 138412290;
      v50 = v31;
      _os_log_impl(&dword_22480C000, v34, OS_LOG_TYPE_DEFAULT, "Sending polling request %@ to push manager", v49, 0xCu);
    }

    double v35 = [(SKAChannelManager *)v40 pushManager];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke;
    v46[3] = &unk_2646E19C8;
    id v47 = v31;
    uint64_t v36 = v43;
    id v48 = v43;
    id v37 = v31;
    [v35 sendPresenceMessage:v33 completion:v46];

    id v16 = v41;
    id v15 = v42;
    uint64_t v21 = v39;
  }
  else
  {
    id v38 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager createChannelWithCompletion:]();
    }

    id v27 = +[SKAChannelManager _jwtTokenNotFoundError];
    uint64_t v36 = v43;
    (*((void (**)(id, void *, void, void))v43 + 2))(v43, v27, 0, MEMORY[0x263EFFA68]);
  }
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = +[SKAChannelManager logger];
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Handling protobuf response data for completed polling request %@", (uint8_t *)&v19, 0xCu);
      }

      int v11 = [[SharedChannelActivityResponse alloc] initWithData:v5];
      id v12 = [(SharedChannelActivityResponse *)v11 pollingResponse];
      int v13 = [v12 status];
      id v14 = +[SKAChannelManager logger];
      id v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(a1, v12);
        }

        id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"SKPushManagerErrorDomain", (int)objc_msgSend(v12, "status"), v16);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v19 = 138412290;
          uint64_t v20 = v18;
          _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Polling request %@ completed with success", (uint8_t *)&v19, 0xCu);
        }

        id v16 = [v12 participantPayloads];
        (*(void (**)(void, void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, [v12 version], v16);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1();
      }

      int v11 = +[SKAChannelManager _serverResponseError];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)activeStatusChannelSubscriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Fetching subscribed Status channels", buf, 2u);
  }

  pushManager = self->_pushManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__SKAChannelManager_activeStatusChannelSubscriptionsWithCompletion___block_invoke;
  v8[3] = &unk_2646E19F0;
  id v9 = v4;
  id v7 = v4;
  [(SKAPushManaging *)pushManager subscribedStatusChannelsWithCompletion:v8];
}

void __68__SKAChannelManager_activeStatusChannelSubscriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218242;
    uint64_t v6 = [v3 count];
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld subscribed Status channels: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeToStatusChannels:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Subscribing to Status channels: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SKAPushManaging *)self->_pushManager subscribeToStatusChannels:v4];
}

- (void)unsubscribeFromStatusChannels:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing from Status channels: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SKAPushManaging *)self->_pushManager unsubscribeFromStatusChannels:v4];
}

- (void)activePresenceChannelSubscriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Fetching subscribed Presence channels", buf, 2u);
  }

  pushManager = self->_pushManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SKAChannelManager_activePresenceChannelSubscriptionsWithCompletion___block_invoke;
  v8[3] = &unk_2646E19F0;
  id v9 = v4;
  id v7 = v4;
  [(SKAPushManaging *)pushManager subscribedPresenceChannelsWithCompletion:v8];
}

void __70__SKAChannelManager_activePresenceChannelSubscriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218242;
    uint64_t v6 = [v3 count];
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld subscribed Presence channels: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeToPresenceChannels:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Subscribing to Presence channels: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SKAPushManaging *)self->_pushManager subscribeToPresenceChannels:v4];
}

- (void)unsubscribeFromPresenceChannels:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing from Presence channels: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SKAPushManaging *)self->_pushManager unsubscribeFromPresenceChannels:v4];
}

- (void)enableActivityTracking
{
  id v3 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Enabling activity tracking", v4, 2u);
  }

  [(SKAPushManaging *)self->_pushManager enableActivityTracking];
}

- (void)disableActivityTracking
{
  id v3 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Disabling activity tracking", v4, 2u);
  }

  [(SKAPushManaging *)self->_pushManager disableActivityTracking];
}

- (id)_createPayloadDataFromData:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = @"StatusKitDataKey";
  id v3 = [a3 base64EncodedStringWithOptions:0];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  int v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:0];

  return v5;
}

- (id)serverTime
{
  v2 = [(SKAChannelManager *)self pushManager];
  id v3 = [v2 serverTime];

  return v3;
}

- (id)_getPresenceJWTToken
{
  id v3 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  id v4 = [(SKAChannelManager *)self accountProvider];
  id v9 = 0;
  int v5 = [v4 presenceJwtTokenForPrimaryAccountWithError:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager _getPresenceJWTToken]();
    }
  }
  return v5;
}

- (id)_getStatusJWTToken
{
  id v3 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  id v4 = [(SKAChannelManager *)self accountProvider];
  id v9 = 0;
  int v5 = [v4 statusJwtTokenForPrimaryAccountWithError:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager _getPresenceJWTToken]();
    }
  }
  return v5;
}

- (void)_getStatusJWTTokenWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  int v5 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving JWT token from account provider", buf, 2u);
  }

  id v6 = [(SKAChannelManager *)self accountProvider];
  id v11 = 0;
  id v7 = [v6 statusJwtTokenForPrimaryAccountWithError:&v11];
  id v8 = v11;

  if (v7)
  {
    v4[2](v4, v7, v8);
  }
  else
  {
    id v9 = +[SKAChannelManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAChannelManager _getStatusJWTTokenWithCompletion:]();
    }

    uint64_t v10 = [(SKAChannelManager *)self accountProvider];
    [v10 refreshedStatusJwtTokenForPrimaryAccountWithCompletion:v4];
  }
}

- (id)_getNonce
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [(SKAChannelManager *)self pushManager];
  id v3 = [v2 serverTime];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  unint64_t v6 = 1000 * (unint64_t)v5;
  char v9 = 0;
  unint64_t v10 = (0xE800000000000000 * (unint64_t)v5) | HIBYTE(v6) | (256000 * (unint64_t)v5) & 0xFF00000000 | (0x3E8000000 * (unint64_t)v5) & 0xFF0000000000 | (0x3E80000000000 * (unint64_t)v5) & 0xFF000000000000 | (v6 >> 40) & 0xFF00 | (v6 >> 24) & 0xFF0000 | (v6 >> 8) & 0xFF000000;
  arc4random_buf(v11, 8uLL);
  id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v9 length:17];
  return v7;
}

- (void)pushManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v13;
    __int16 v21 = 2048;
    unint64_t v22 = a6;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Received data on channel: %@ with identifier %lu", (uint8_t *)&v19, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained channelManager:self didReceiveData:v16 onChannel:v13 identifier:a6 dateReceived:v15 dateExpired:v14];
}

- (void)pushManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  char v9 = +[SKAChannelManager logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SKAChannelManager pushManager:failedToSubscribeToChannel:withError:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained channelManager:self failedToSubscribeToChannel:v7 withError:v8];
}

+ (id)logger
{
  if (logger_onceToken_12 != -1) {
    dispatch_once(&logger_onceToken_12, &__block_literal_global_12);
  }
  v2 = (void *)logger__logger_12;
  return v2;
}

uint64_t __27__SKAChannelManager_logger__block_invoke()
{
  logger__logger_12 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAChannelManager");
  return MEMORY[0x270F9A758]();
}

+ (id)_jwtTokenNotFoundError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Could not fetch JWT token for authenticating request"];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = v2;
  double v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = [v3 errorWithDomain:@"SKAChannelManagerErrorDomain" code:-1000 userInfo:v4];

  return v5;
}

+ (id)_serverResponseError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Error in server response"];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = v2;
  double v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v5 = [v3 errorWithDomain:@"SKAChannelManagerErrorDomain" code:-1001 userInfo:v4];

  return v5;
}

- (SKAPushManaging)pushManager
{
  return self->_pushManager;
}

- (void)setPushManager:(id)a3
{
}

- (SKAAccountProviding)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (SKAChannelManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAChannelManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_pushManager, 0);
}

- (void)createChannelWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to fetch JWT token for icloud account.  Failing request.", v2, v3, v4, v5, v6);
}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Create channel response contains non success status: %ld - %@");
}

void __49__SKAChannelManager_createChannelWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Channel create request failed with error: %@", v2, v3, v4, v5, v6);
}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Create presence channel response contains non success status: %ld - %@");
}

void __99__SKAChannelManager_createPresenceChannelWithMembershipKey_serverKey_serviceIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Presence channel create request failed with error: %@", v2, v3, v4, v5, v6);
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to fetch JWT auth token.  Failing request.", v2, v3, v4, v5, v6);
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Provision request contains neither error nor proto response", v2, v3, v4, v5, v6);
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_2(void *a1)
{
  [a1 status];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_22480C000, v1, v2, "Provision request completed with nonsuccess response status: %ld", v3, v4, v5, v6, v7);
}

void __115__SKAChannelManager_publishProvisionPayloads_onChannel_withChannelToken_publishInitiateTime_retryCount_completion___block_invoke_32_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Provision request contains error: %@", v2, v3, v4, v5, v6);
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Publish status request contains neither error nor proto response", v2, v3, v4, v5, v6);
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_2(void *a1)
{
  [a1 status];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_22480C000, v1, v2, "Publish status request completed with nonsuccess response status: %ld", v3, v4, v5, v6, v7);
}

void __138__SKAChannelManager_publishData_onChannel_withChannelToken_publishInitiateTime_isPendingPublish_isScheduledPublish_retryCount_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Publish status request contains error: %@", v2, v3, v4, v5, v6);
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Presence assertion request %@ received response with neither error nor proto response", v2, v3, v4, v5, v6);
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0(&dword_22480C000, v2, v3, "Presence assertion request %@ completed with nonsuccess response status: %ld", v4, v5, v6, v7, v8);
}

void __136__SKAChannelManager_assertPresence_onChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_isRefresh_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Presence assertion request %@ received response with error: %@");
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Presence assertion release %@ received response contains neither error nor proto response", v2, v3, v4, v5, v6);
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0(&dword_22480C000, v2, v3, "Presence assertion release request %@ completed with nonsuccess response status: %ld", v4, v5, v6, v7, v8);
}

void __126__SKAChannelManager_releasePresenceOnChannel_membershipKey_serverKey_timestamp_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Presence assertion release %@ received response with error: %@");
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Polling request %@ response contains neither error nor proto response", v2, v3, v4, v5, v6);
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0(&dword_22480C000, v2, v3, "Polling request %@ completed with nonsuccess response status: %ld", v4, v5, v6, v7, v8);
}

void __124__SKAChannelManager_pollActiveParticipantsForChannel_membershipKey_serverKey_withChannelToken_serviceIdentifier_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Polling request %@ response contains error: %@");
}

- (void)_getPresenceJWTToken
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not fetch JWT token!: Error: %@", v2, v3, v4, v5, v6);
}

- (void)_getStatusJWTTokenWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not fetch JWT token! Attempting to refresh: Error: %@", v2, v3, v4, v5, v6);
}

- (void)pushManager:failedToSubscribeToChannel:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Failed to subscribe to channel: %@ Error: %@");
}

@end