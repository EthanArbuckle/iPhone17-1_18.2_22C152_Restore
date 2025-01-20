@interface SKAInvitationManager
+ (id)_invalidInvitedHandlesError;
+ (id)_invalidSenderHandleError;
+ (id)_keyRollFailedErrorWithUnderlyingError:(id)a3;
+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3;
+ (id)_noPresenceChannelForIdentifier:(id)a3;
+ (id)_presenceDisabledError;
+ (id)_unableToFindAnyExistingInvitationToDeleteError;
+ (id)_unableToFindExistingInvitationForHandlesError:(id)a3;
+ (id)logger;
- (BOOL)_rollEncryptionKeyForChannel:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)_sendInvitationMessageForChannel:(id)a3 toInvitedUsers:(id)a4 subscriptionKeys:(id)a5 error:(id *)a6;
- (BOOL)_sendInvitationMessageForPresenceChannel:(id)a3 toInvitedUsers:(id)a4 error:(id *)a5;
- (BOOL)_shouldReauthForError:(id)a3;
- (BOOL)_validateInvitedHandle:(id)a3;
- (BOOL)presenceEnabledByServer;
- (BOOL)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:(id)a3 error:(id *)a4;
- (BOOL)trafficModeEnabled;
- (NSMutableDictionary)outgoingInvitationMapping;
- (OS_dispatch_queue)backgroundCleanupQueue;
- (SKAAccountProviding)accountProvider;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKAInvitationManager)initWithMessagingProvider:(id)a3 databaseManager:(id)a4 accountProvider:(id)a5 channelManager:(id)a6 presenceManager:(id)a7 trafficMode:(BOOL)a8;
- (SKAInvitationManagingDelegate)delegate;
- (SKAMessagingProviding)messagingProvider;
- (SKAPresenceManaging)presenceManager;
- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPersonalChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7;
- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPresenceChannel:(id)a5 databaseContext:(id)a6;
- (id)_invitationMessageForPresenceChannel:(id)a3;
- (id)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:(id)a3 databaseContext:(id)a4 invitationWasSentViaKeyRoll:(BOOL *)a5 error:(id *)a6;
- (id)_updateOrCreateInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 onChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7;
- (id)_validateInvitedHandles:(id)a3;
- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3;
- (void)_createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5;
- (void)_findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5;
- (void)_isHandleInviteable:(id)a3 completion:(id)a4;
- (void)_isPresenceHandleInviteable:(id)a3 completion:(id)a4;
- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6;
- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6;
- (void)handleIncomingInvitationMessage:(id)a3 fromHandle:(id)a4 fromID:(id)a5 toHandle:(id)a6 messageGuid:(id)a7;
- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)isPresenceHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)outgoingMessageWithIdentifier:(id)a3 fromHandle:(id)a4 toHandle:(id)a5 didSendWithSuccess:(BOOL)a6;
- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5;
- (void)revokeInvitationFromPresenceChannelWithPresenceIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5;
- (void)rollPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)rollPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5;
- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 withInvitationPayload:(id)a6 completion:(id)a7;
- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendSelfInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5;
- (void)setAccountProvider:(id)a3;
- (void)setBackgroundCleanupQueue:(id)a3;
- (void)setChannelManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessagingProvider:(id)a3;
- (void)setOutgoingInvitationMapping:(id)a3;
- (void)setPresenceEnabledByServer:(BOOL)a3;
- (void)setPresenceManager:(id)a3;
- (void)setTrafficModeEnabled:(BOOL)a3;
@end

@implementation SKAInvitationManager

- (SKAInvitationManager)initWithMessagingProvider:(id)a3 databaseManager:(id)a4 accountProvider:(id)a5 channelManager:(id)a6 presenceManager:(id)a7 trafficMode:(BOOL)a8
{
  id v29 = a3;
  id v28 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SKAInvitationManager;
  v18 = [(SKAInvitationManager *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messagingProvider, a3);
    objc_storeStrong((id *)&v19->_databaseManager, a4);
    objc_storeStrong((id *)&v19->_channelManager, a6);
    objc_storeStrong((id *)&v19->_accountProvider, a5);
    objc_storeStrong((id *)&v19->_presenceManager, a7);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.StatusKit.InvitationManager.cleanup", v21);
    backgroundCleanupQueue = v19->_backgroundCleanupQueue;
    v19->_backgroundCleanupQueue = (OS_dispatch_queue *)v22;

    v19->_trafficModeEnabled = a8;
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outgoingInvitationMapping = v19->_outgoingInvitationMapping;
    v19->_outgoingInvitationMapping = v24;

    v19->_presenceEnabledByServer = +[SKAServerBag presenceEnabledByServer];
    if (v19->_trafficModeEnabled)
    {
      v26 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will drop incoming status invitations", buf, 2u);
      }
    }
  }

  return v19;
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 withInvitationPayload:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SKAInvitationManager *)self _validateInvitedHandles:v13];
  if ([v17 count])
  {
    id v18 = [(SKAInvitationManager *)self resolveSenderHandleWithPreferredSenderHandle:v14];
    if (v18)
    {
      objc_initWeak(&location, self);
      v19 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke;
      v24[3] = &unk_2646E0BE8;
      objc_copyWeak(&v31, &location);
      id v30 = v16;
      id v25 = v12;
      id v26 = v17;
      id v18 = v18;
      id v27 = v18;
      id v28 = v15;
      id v20 = v19;
      id v29 = v20;
      [(SKAInvitationManager *)self _findOrCreatePersonalChannelForStatusTypeIdentifier:v25 databaseContext:v20 completion:v24];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_queue_t v22 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:]();
      }

      v23 = +[SKAInvitationManager _invalidSenderHandleError];
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v23);
    }
  }
  else
  {
    v21 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:]();
    }

    id v18 = +[SKAInvitationManager _invalidInvitedHandlesError];
    (*((void (**)(id, void, id))v16 + 2))(v16, 0, v18);
  }
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (v6)
  {
    v8 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_4();
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    v9 = v5;
    goto LABEL_20;
  }
  v10 = +[SKAInvitationManager logger];
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Adding invited handles %@ to database for channel: %@", buf, 0x16u);
    }

    id v13 = [WeakRetained _addInvitedHandles:*(void *)(a1 + 40) senderHandle:*(void *)(a1 + 48) toDatabaseForPersonalChannel:v5 withInvitationPayload:*(void *)(a1 + 56) databaseContext:*(void *)(a1 + 64)];
    char v26 = 0;
    uint64_t v14 = *(void *)(a1 + 64);
    id v25 = 0;
    v9 = [WeakRetained _ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:v5 databaseContext:v14 invitationWasSentViaKeyRoll:&v26 error:&v25];
    id v15 = v25;

    if (v15)
    {
      id v16 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_3((void *)(a1 + 40));
      }
    }
    else
    {
      if (!v26)
      {
        id v18 = [v9 currentOutgoingRatchet];
        v19 = [v18 currentSubscriptionKeys];

        id v24 = 0;
        char v20 = [WeakRetained _sendInvitationMessageForChannel:v9 toInvitedUsers:v13 subscriptionKeys:v19 error:&v24];
        id v21 = v24;
        if (v20)
        {
          dispatch_queue_t v22 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
        }
        else
        {
          v23 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2();
          }

          dispatch_queue_t v22 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
        }
        v22();

        goto LABEL_19;
      }
      id v16 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v17;
        _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Invitations for newly invited handles %@ was already sent during key roll, skipping individual message send.", buf, 0xCu);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1();
  }

  v9 = +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_20:
}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 toHandles:(id)a4 fromSenderHandle:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  if (![(SKAInvitationManager *)self presenceEnabledByServer])
  {
    char v26 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }
    goto LABEL_11;
  }
  uint64_t v17 = [v15 serviceIdentifier];
  if (v17)
  {
    id v18 = (void *)v17;
    v19 = [v15 serviceIdentifier];
    BOOL v20 = +[SKAServerBag presenceEnabledByServerForServiceIdentifier:v19];

    if (!v20)
    {
      char v26 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:](v15);
      }
LABEL_11:

      id v21 = +[SKAInvitationManager _presenceDisabledError];
      v16[2](v16, 0, v21);
      goto LABEL_19;
    }
  }
  id v21 = [(SKAInvitationManager *)self _validateInvitedHandles:v13];
  if ([v21 count])
  {
    id v22 = [(SKAInvitationManager *)self resolveSenderHandleWithPreferredSenderHandle:v14];
    if (v22)
    {
      objc_initWeak(&location, self);
      v23 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
      id v24 = [(SKAInvitationManager *)self presenceManager];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke;
      v30[3] = &unk_2646E0C10;
      objc_copyWeak(&v36, &location);
      v35 = v16;
      id v31 = v12;
      id v32 = v21;
      id v22 = v22;
      id v33 = v22;
      id v25 = v23;
      id v34 = v25;
      [v24 findOrCreatePresenceChannelForPresenceIdentifier:v31 options:v15 databaseContext:v25 completion:v30];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v28 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:]();
      }

      __int16 v29 = +[SKAInvitationManager _invalidSenderHandleError];
      v16[2](v16, 0, v29);
    }
  }
  else
  {
    id v27 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:]();
    }

    id v22 = +[SKAInvitationManager _invalidInvitedHandlesError];
    v16[2](v16, 0, v22);
  }

LABEL_19:
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (v6)
  {
    v8 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v9 = +[SKAInvitationManager logger];
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        id v21 = v5;
        _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Adding invited handles %@ to database for channel: %@", buf, 0x16u);
      }

      id v12 = [WeakRetained _addInvitedHandles:*(void *)(a1 + 40) senderHandle:*(void *)(a1 + 48) toDatabaseForPresenceChannel:v5 databaseContext:*(void *)(a1 + 56)];
      id v17 = 0;
      char v13 = [WeakRetained _sendInvitationMessageForPresenceChannel:v5 toInvitedUsers:v12 error:&v17];
      id v14 = v17;
      if (v13)
      {
        id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      else
      {
        id v16 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2();
        }

        id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      v15();
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_1();
      }

      id v12 = +[SKAInvitationManager _noPresenceChannelForIdentifier:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)sendSelfInvitationForPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(SKAInvitationManager *)self presenceEnabledByServer])
  {
    v10 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
    uint64_t v11 = [(SKAInvitationManager *)self presenceManager];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke;
    v13[3] = &unk_2646E0C38;
    id v14 = v8;
    id v15 = self;
    id v16 = v9;
    [v11 findPresenceChannelForPresenceIdentifier:v14 isPersonal:v6 databaseContext:v10 completion:v13];
  }
  else
  {
    id v12 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
    }

    v10 = +[SKAInvitationManager _presenceDisabledError];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v10);
  }
}

void __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    BOOL v6 = [*(id *)(a1 + 40) _invitationMessageForPresenceChannel:a2];
    v7 = [*(id *)(a1 + 40) messagingProvider];
    id v8 = (void *)[v6 copy];
    id v21 = 0;
    id v22 = 0;
    int v9 = [v7 sendMessageToSelfDevices:v8 limitToPresenceCapable:1 identifier:&v22 error:&v21];
    id v10 = v22;
    id v11 = v21;

    id v12 = +[SKAInvitationManager logger];
    char v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Presence invitation sent successfully to self-account devices. ID:%@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      char v26 = v6;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl(&dword_22480C000, v13, OS_LOG_TYPE_ERROR, "Self presence invitation send failed with error: %@ message: %@, ID:%@.  Maybe no other device on account?", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v14 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke_cold_1(a1, v14, v15, v16, v17, v18, v19, v20);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  int v9 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v6 databaseContext:v8];
  if (!v9)
  {
    uint64_t v15 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:v6];
    goto LABEL_14;
  }
  int v10 = [(SKADatabaseManaging *)self->_databaseManager deleteAllInvitedUsersForPersonalChannel:v9 databaseContext:v8];
  id v11 = +[SKAInvitationManager logger];
  id v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAInvitationManager _unableToFindAnyExistingInvitationToDeleteError];
LABEL_14:
    id v14 = (id)v16;
    v7[2](v7, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v9;
    _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Finished deleting all invited user database records for channel %@, initiating key roll", buf, 0xCu);
  }

  id v18 = 0;
  BOOL v13 = [(SKAInvitationManager *)self _rollEncryptionKeyForChannel:v9 databaseContext:v8 error:&v18];
  id v14 = v18;
  if (v14 || !v13)
  {
    uint64_t v17 = +[SKAInvitationManager _keyRollFailedErrorWithUnderlyingError:v14];
    v7[2](v7, (uint64_t)v17);
  }
  else
  {
    v7[2](v7, 0);
  }
LABEL_15:
}

- (void)revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t))a5;
  id v11 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  v38 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v8 databaseContext:v11];
  if (!v38)
  {
    id v30 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:]();
    }

    uint64_t v31 = +[SKAInvitationManager _noPersonalChannelErrorForStatusTypeIdentifier:v8];
    goto LABEL_28;
  }
  v35 = v10;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  unint64_t v14 = 0x2646E0000uLL;
  if (!v13)
  {

LABEL_25:
    id v32 = [*(id *)(v14 + 2480) logger];
    int v10 = v35;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:]();
    }

    uint64_t v31 = [*(id *)(v14 + 2480) _unableToFindExistingInvitationForHandlesError:v12];
LABEL_28:
    id v28 = (id)v31;
    v10[2](v10, v31);
    goto LABEL_29;
  }
  uint64_t v15 = v13;
  id v36 = v8;
  id obj = v12;
  id v34 = v9;
  char v16 = 0;
  uint64_t v17 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v41 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
      int v20 = -[SKADatabaseManaging deleteInvitedUserForHandle:personalChannel:databaseContext:](self->_databaseManager, "deleteInvitedUserForHandle:personalChannel:databaseContext:", v19, v38, v11, v34);
      unint64_t v21 = v14;
      id v22 = [*(id *)(v14 + 2480) logger];
      v23 = v22;
      if (v20)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v19;
          _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Successfully deleted database record for invited user: %@.  Adding to removed users", buf, 0xCu);
        }

        databaseManager = self->_databaseManager;
        v23 = [MEMORY[0x263EFF910] now];
        id v25 = (id)[(SKADatabaseManaging *)databaseManager createRemovedUserWithHandle:v19 dateRemoved:v23 statusTypeIdentifier:v36 databaseContext:v11];
        char v16 = 1;
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v19;
        _os_log_error_impl(&dword_22480C000, v23, OS_LOG_TYPE_ERROR, "Unable to find database record for invited user attempted to delete: %@", buf, 0xCu);
      }

      unint64_t v14 = v21;
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  }
  while (v15);
  id v12 = obj;

  id v8 = v36;
  id v9 = v34;
  if ((v16 & 1) == 0) {
    goto LABEL_25;
  }
  char v26 = [*(id *)(v21 + 2480) logger];
  int v10 = v35;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Finished deleting database records for uninvited users, initiating key roll", buf, 2u);
  }

  id v39 = 0;
  BOOL v27 = [(SKAInvitationManager *)self _rollEncryptionKeyForChannel:v38 databaseContext:v11 error:&v39];
  id v28 = v39;
  if (v28 || !v27)
  {
    id v33 = [*(id *)(v21 + 2480) _keyRollFailedErrorWithUnderlyingError:v28];
    v35[2](v35, (uint64_t)v33);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained invitationManager:self didRevokeInvitationOnChannel:v38];

    v35[2](v35, 0);
  }
LABEL_29:
}

- (void)revokeInvitationFromPresenceChannelWithPresenceIdentifier:(id)a3 forHandles:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SKAInvitationManager *)self presenceEnabledByServer])
  {
    id v11 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
    id v33 = [(SKADatabaseManaging *)self->_databaseManager existingChannelForPresenceIdentifier:v8 isPersonal:0 databaseContext:v11];
    if (v33)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v30 = v10;
        id v31 = v9;
        id v32 = v8;
        char v15 = 0;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            int v19 = -[SKADatabaseManaging deleteInvitedUserForHandle:personalChannel:databaseContext:](self->_databaseManager, "deleteInvitedUserForHandle:personalChannel:databaseContext:", v18, v33, v11, v30, v31);
            int v20 = +[SKAInvitationManager logger];
            unint64_t v21 = v20;
            if (v19)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v41 = v18;
                _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deleted database record for invited user: %@.  Adding to removed users", buf, 0xCu);
              }

              databaseManager = self->_databaseManager;
              unint64_t v21 = [MEMORY[0x263EFF910] now];
              id v23 = (id)[(SKADatabaseManaging *)databaseManager createRemovedUserWithHandle:v18 dateRemoved:v21 presenceIdentifier:v32 databaseContext:v11];
              char v15 = 1;
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v18;
              _os_log_error_impl(&dword_22480C000, v21, OS_LOG_TYPE_ERROR, "Unable to find database record for invited user attempted to delete: %@", buf, 0xCu);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v14);

        id v8 = v32;
        id v10 = v30;
        id v9 = v31;
        if (v15)
        {
          id v24 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22480C000, v24, OS_LOG_TYPE_DEFAULT, "Finished deleting database records for uninvited users, initiating key roll", buf, 2u);
          }

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __104__SKAInvitationManager_revokeInvitationFromPresenceChannelWithPresenceIdentifier_forHandles_completion___block_invoke;
          v34[3] = &unk_2646E0C60;
          id v35 = v30;
          [(SKAInvitationManager *)self rollPresenceChannelWithPresenceIdentifier:v32 isPersonal:0 completion:v34];
          id v25 = v35;
          goto LABEL_31;
        }
      }
      else
      {
      }
      uint64_t v29 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:]();
      }

      uint64_t v28 = +[SKAInvitationManager _unableToFindExistingInvitationForHandlesError:v12];
    }
    else
    {
      BOOL v27 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:]();
      }

      uint64_t v28 = +[SKAInvitationManager _noPresenceChannelForIdentifier:v8];
    }
    id v25 = (void *)v28;
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v28);
LABEL_31:

    goto LABEL_32;
  }
  char v26 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
  }

  id v11 = +[SKAInvitationManager _presenceDisabledError];
  (*((void (**)(id, void *))v10 + 2))(v10, v11);
LABEL_32:
}

void __104__SKAInvitationManager_revokeInvitationFromPresenceChannelWithPresenceIdentifier_forHandles_completion___block_invoke(uint64_t a1, int a2)
{
  v4 = +[SKAInvitationManager logger];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Finished rolling presence channel", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Error rolling presence channel", v7, 2u);
    }

    id v6 = +[SKAInvitationManager _keyRollFailedErrorWithUnderlyingError:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)resolveSenderHandleWithPreferredSenderHandle:(id)a3
{
  return (id)[(SKAMessagingProviding *)self->_messagingProvider resolveSenderHandleWithPreferredSenderHandle:a3];
}

- (BOOL)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Received request to roll encryption key for personal channel with statusTypeIdentifier: %@", buf, 0xCu);
  }

  id v8 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  id v9 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v6 databaseContext:v8];
  if (v9)
  {
    id v14 = 0;
    BOOL v10 = [(SKAInvitationManager *)self _rollEncryptionKeyForChannel:v9 databaseContext:v8 error:&v14];
    id v11 = v14;
    if (!v10)
    {
      id v12 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:]((uint64_t)v6);
      }

      if (a4)
      {
        id v11 = v11;
        *a4 = v11;
      }
    }
  }
  else
  {
    id v11 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:]();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)outgoingMessageWithIdentifier:(id)a3 fromHandle:(id)a4 toHandle:(id)a5 didSendWithSuccess:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  BOOL v10 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v9;
    __int16 v24 = 1024;
    BOOL v25 = v6;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Received callback for message with identifier: %@ did send with success: %d", (uint8_t *)&v22, 0x12u);
  }

  if (!v6)
  {
    id v11 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:]();
    }

    id v12 = [(SKAInvitationManager *)self outgoingInvitationMapping];
    uint64_t v13 = [v12 valueForKey:v9];

    if (v13)
    {
      id v14 = [v13 channelIdentifier];
      char v15 = [v13 toHandle];
      uint64_t v16 = [v14 length];
      if (a5 && v16)
      {
        uint64_t v17 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
        uint64_t v18 = [(SKAInvitationManager *)self databaseManager];
        int v19 = [v18 existingChannelForSubscriptionIdentifier:v14 databaseContext:v17];

        if (v19)
        {
          int v20 = [(SKAInvitationManager *)self databaseManager];
          [v20 deleteInvitedUserForHandle:v15 presenceChannel:v19 databaseContext:v17];
        }
        else
        {
          int v20 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:]();
          }
        }
      }
    }
    else
    {
      id v14 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:]();
      }
    }
  }
  unint64_t v21 = [(SKAInvitationManager *)self outgoingInvitationMapping];
  [v21 removeObjectForKey:v9];
}

- (void)rollPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Received request to roll personal channel with statusTypeIdentifier: %@", buf, 0xCu);
  }

  id v9 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  BOOL v10 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v6 databaseContext:v9];
  if (v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke;
    v12[3] = &unk_2646E0C88;
    id v16 = v7;
    v12[4] = self;
    id v13 = v10;
    id v14 = v9;
    id v15 = v6;
    [(SKAInvitationManager *)self _createPersonalChannelForStatusTypeIdentifier:v15 databaseContext:v14 completion:v12];
  }
  else
  {
    id v11 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager rollPersonalChannelWithStatusTypeIdentifier:completion:]();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v16 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1();
    }
    goto LABEL_12;
  }
  id v8 = [*(id *)(a1 + 32) databaseManager];
  int v9 = [v8 copyInvitedUsersFromChannel:*(void *)(a1 + 40) toChannel:v5 databaseContext:*(void *)(a1 + 48)];

  if (!v9)
  {
    id v16 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
    }
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_17;
  }
  BOOL v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  id v20 = 0;
  [v10 _rollEncryptionKeyForChannel:v5 databaseContext:v11 error:&v20];
  id v12 = v20;
  id v13 = +[SKAInvitationManager logger];
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully rolled personal channel with statusTypeIdentifier: %@", buf, 0xCu);
    }

    id v18 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v19 = [*(id *)(a1 + 40) identifier];
    [v18 decomissionChannelWithIdentifier:v19 databaseContext:*(void *)(a1 + 48)];

    id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v15();

LABEL_17:
}

- (void)rollPresenceChannelWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Received request to roll presence channel with presence identifier: %@", buf, 0xCu);
  }

  uint64_t v11 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  id v12 = [(SKADatabaseManaging *)self->_databaseManager existingChannelForPresenceIdentifier:v8 isPersonal:v6 databaseContext:v11];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F797F0]);
    id v14 = [v12 serviceIdentifier];
    id v15 = (void *)[v13 initWithServiceIdentifier:v14];

    [v15 setIsPersonal:v6];
    id v16 = [(SKAInvitationManager *)self presenceManager];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __88__SKAInvitationManager_rollPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke;
    v18[3] = &unk_2646E0C88;
    id v22 = v9;
    v18[4] = self;
    id v19 = v12;
    id v20 = v11;
    id v21 = v8;
    [v16 createPresenceChannelForPresenceIdentifier:v21 options:v15 databaseContext:v20 completion:v18];
  }
  else
  {
    uint64_t v17 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:]();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __88__SKAInvitationManager_rollPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v16 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) databaseManager];
    int v9 = [v8 copyInvitedUsersFromChannel:*(void *)(a1 + 40) toChannel:v5 databaseContext:*(void *)(a1 + 48)];

    if (v9)
    {
      BOOL v10 = *(void **)(a1 + 32);
      uint64_t v11 = [*(id *)(a1 + 40) invitedUsers];
      id v24 = 0;
      char v12 = [v10 _sendInvitationMessageForPresenceChannel:v5 toInvitedUsers:v11 error:&v24];
      id v13 = v24;

      if (v13 || (v12 & 1) == 0)
      {
        uint64_t v17 = [*(id *)(a1 + 40) invitedUsers];
        uint64_t v18 = [v17 count];

        id v19 = +[SKAInvitationManager logger];
        id v14 = v19;
        if (v13 || v18)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
          }

          uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
          goto LABEL_22;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v20;
          goto LABEL_17;
        }
      }
      else
      {
        id v14 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v15;
LABEL_17:
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully rolled presence channel with presenceIdentifier: %@", buf, 0xCu);
        }
      }

      id v21 = [*(id *)(a1 + 32) databaseManager];
      id v22 = [*(id *)(a1 + 40) identifier];
      [v21 decomissionChannelWithIdentifier:v22 databaseContext:*(void *)(a1 + 48)];

      uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_22:
      v23();

      goto LABEL_23;
    }
    id v16 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_23:
}

- (BOOL)_rollEncryptionKeyForChannel:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Generating new outgoing ratchet", buf, 2u);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F55678]);
  char v12 = [v11 serializedData];
  id v13 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Storing newly generated outgoing ratchet", buf, 2u);
  }

  id v14 = (id)[(SKADatabaseManaging *)self->_databaseManager createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:v12 personalChannel:v8 databaseContext:v9];
  uint64_t v15 = [(SKADatabaseManaging *)self->_databaseManager existingInvitedUsersForPersonalChannel:v8 databaseContext:v9];

  uint64_t v16 = [v15 count];
  uint64_t v17 = +[SKAInvitationManager logger];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v8;
      _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Not sending any invitations following key roll as there are no invited users for channel %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (v18)
  {
    uint64_t v19 = [v15 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v19;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Messaging %ld existing invited users with the newly generated subscription keys", buf, 0xCu);
  }

  uint64_t v17 = [v11 currentSubscriptionKeys];
  id v26 = 0;
  BOOL v20 = [(SKAInvitationManager *)self _sendInvitationMessageForChannel:v8 toInvitedUsers:v15 subscriptionKeys:v17 error:&v26];
  id v21 = v26;
  id v22 = v21;
  if (v20)
  {

LABEL_12:
    BOOL v23 = 1;
    goto LABEL_18;
  }
  id v24 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[SKAInvitationManager _rollEncryptionKeyForChannel:databaseContext:error:]();
  }

  if (a5) {
    *a5 = v22;
  }

  BOOL v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)_sendInvitationMessageForChannel:(id)a3 toInvitedUsers:(id)a4 subscriptionKeys:(id)a5 error:(id *)a6
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count])
  {
    id v12 = objc_alloc(MEMORY[0x263F55670]);
    uint64_t v13 = [v11 index];
    id v14 = [v11 chainKey];
    uint64_t v15 = [v11 signingKey];
    id v69 = 0;
    uint64_t v16 = (void *)[v12 initWithIndex:v13 chainKey:v14 signingKey:v15 error:&v69];
    uint64_t v17 = v69;

    if (!v16)
    {
      v49 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:]();
      }

      char v48 = 0;
      if (a6) {
        *a6 = v17;
      }
      goto LABEL_43;
    }
    v59 = [v16 serializedData];
    if ([v59 length])
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v10;
      uint64_t v18 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      if (v18)
      {
        v54 = a6;
        v51 = v16;
        v52 = v17;
        v56 = v11;
        id v53 = v10;
        char v55 = 0;
        unint64_t v19 = 0x2646E0000uLL;
        uint64_t v20 = *(void *)v66;
        uint64_t v21 = v18;
        uint64_t v57 = *(void *)v66;
        v58 = self;
        do
        {
          uint64_t v22 = 0;
          uint64_t v61 = v21;
          do
          {
            if (*(void *)v66 != v20) {
              objc_enumerationMutation(obj);
            }
            BOOL v23 = *(NSObject **)(*((void *)&v65 + 1) + 8 * v22);
            id v24 = [v23 invitedSKHandle];
            if (v24)
            {
              uint64_t v25 = [v23 senderSKHandle];
              id v26 = [v23 invitationPayload];
              BOOL v27 = [(SKAInvitationManager *)self _validateInvitedHandle:v25];
              uint64_t v28 = [*(id *)(v19 + 2480) logger];
              uint64_t v29 = v28;
              if (v27)
              {
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = [v56 index];
                  id v31 = [v25 handleString];
                  *(_DWORD *)buf = 134218498;
                  v71 = v30;
                  __int16 v72 = 2112;
                  v73 = v31;
                  __int16 v74 = 2112;
                  v75 = v26;
                  _os_log_impl(&dword_22480C000, v29, OS_LOG_TYPE_DEFAULT, "Sending invitation message with new encryption key ratchet index %ld to handle \"%@\" with invitation payload %@", buf, 0x20u);
                }
                uint64_t v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                id v32 = [v60 statusType];
                [v29 setObject:v32 forKeyedSubscript:@"s"];

                id v33 = [v60 identifier];
                [v29 setObject:v33 forKeyedSubscript:@"c"];

                id v34 = [v59 base64EncodedStringWithOptions:0];
                [v29 setObject:v34 forKeyedSubscript:@"r"];

                id v35 = NSNumber;
                long long v36 = [MEMORY[0x263EFF910] date];
                [v36 timeIntervalSince1970];
                long long v37 = objc_msgSend(v35, "numberWithDouble:");
                [v29 setObject:v37 forKeyedSubscript:@"d"];

                long long v38 = [v26 payloadData];
                long long v39 = v38;
                if (v38)
                {
                  long long v40 = [v38 base64EncodedStringWithOptions:0];
                  [v29 setObject:v40 forKeyedSubscript:@"p"];
                }
                messagingProvider = self->_messagingProvider;
                id v42 = [v29 copy];
                id v63 = 0;
                id v64 = 0;
                int v43 = [(SKAMessagingProviding *)messagingProvider sendMessage:v42 toHandle:v24 fromHandle:v25 limitToPresenceCapable:0 identifier:&v64 error:&v63];
                v44 = v64;
                uint64_t v45 = v63;

                v46 = +[SKAInvitationManager logger];
                uint64_t v47 = v46;
                if (v43)
                {
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v71 = v44;
                    _os_log_impl(&dword_22480C000, v47, OS_LOG_TYPE_DEFAULT, "Invitation sent successfully. ID: %@", buf, 0xCu);
                  }

                  char v55 = 1;
                }
                else
                {
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    v71 = v45;
                    __int16 v72 = 2112;
                    v73 = v29;
                    __int16 v74 = 2112;
                    v75 = v44;
                    _os_log_error_impl(&dword_22480C000, v47, OS_LOG_TYPE_ERROR, "Invitation send failed with error: %@ message: %@ ID: %@", buf, 0x20u);
                  }

                  if (v54) {
                    id *v54 = v45;
                  }
                }
                self = v58;
                unint64_t v19 = 0x2646E0000;

                uint64_t v21 = v61;
                uint64_t v20 = v57;
              }
              else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v25;
                _os_log_error_impl(&dword_22480C000, v29, OS_LOG_TYPE_ERROR, "Database InvitedUser sender handle fails validation, not inviting from %@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v25 = [*(id *)(v19 + 2480) logger];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v23;
                _os_log_error_impl(&dword_22480C000, v25, OS_LOG_TYPE_ERROR, "Database InvitedUser does not have an invited SKHandle: %@", buf, 0xCu);
              }
            }

            ++v22;
          }
          while (v21 != v22);
          uint64_t v21 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
        }
        while (v21);
        uint64_t v17 = v52;
        id v10 = v53;
        id v11 = v56;
        uint64_t v16 = v51;
        char v48 = v55;
        goto LABEL_42;
      }
    }
    else
    {
      id obj = +[SKAInvitationManager logger];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:]();
      }
    }
    char v48 = 0;
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  uint64_t v17 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:]();
  }
  char v48 = 0;
LABEL_44:

  return v48 & 1;
}

- (BOOL)_sendInvitationMessageForPresenceChannel:(id)a3 toInvitedUsers:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    id obj = +[SKAInvitationManager logger];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:]();
    }
    goto LABEL_26;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (!v35)
  {
LABEL_26:
    char v8 = 0;
    goto LABEL_27;
  }
  id v30 = a5;
  id v29 = v7;
  char v8 = 0;
  uint64_t v34 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      if (*(void *)v39 != v34) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      id v11 = [v10 invitedSKHandle];
      if (v11)
      {
        id v12 = [v10 senderSKHandle];
        uint64_t v13 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v11 handleString];
          *(_DWORD *)buf = 138412290;
          id v43 = v14;
          _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Sending presence invitation message to handle \"%@\"", buf, 0xCu);
        }
        uint64_t v15 = [(SKAInvitationManager *)self _invitationMessageForPresenceChannel:v33];
        messagingProvider = self->_messagingProvider;
        uint64_t v17 = (void *)[v15 copy];
        id v36 = 0;
        id v37 = 0;
        int v18 = [(SKAMessagingProviding *)messagingProvider sendMessage:v17 toHandle:v11 fromHandle:v12 limitToPresenceCapable:1 identifier:&v37 error:&v36];
        id v19 = v37;
        id v20 = v36;

        uint64_t v21 = +[SKAInvitationManager logger];
        uint64_t v22 = v21;
        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v19;
            _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Presence invitation sent successfully. ID:%@", buf, 0xCu);
          }

          BOOL v23 = [SKAOutgoingInvitationState alloc];
          id v24 = (void *)[v11 copy];
          id v25 = [v12 copy];
          id v26 = [v33 identifier];
          BOOL v27 = [(SKAOutgoingInvitationState *)v23 initWithToHandle:v24 fromHandle:v25 channelIdentifier:v26];

          [(NSMutableDictionary *)self->_outgoingInvitationMapping setObject:v27 forKeyedSubscript:v19];
          char v8 = 1;
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v43 = v20;
            __int16 v44 = 2112;
            uint64_t v45 = v15;
            __int16 v46 = 2112;
            id v47 = v19;
            _os_log_error_impl(&dword_22480C000, v22, OS_LOG_TYPE_ERROR, "Presence invitation send failed with error: %@ message: %@, ID:%@", buf, 0x20u);
          }

          if (v30) {
            *id v30 = v20;
          }
        }
      }
      else
      {
        id v12 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v10;
          _os_log_error_impl(&dword_22480C000, v12, OS_LOG_TYPE_ERROR, "Database InvitedUser does not have an invited SKHandle: %@", buf, 0xCu);
        }
      }
    }
    uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  }
  while (v35);
  id v7 = v29;
LABEL_27:

  return v8 & 1;
}

- (id)_invitationMessageForPresenceChannel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presenceServerKey];
  id v6 = [v4 presencePeerKey];
  id v7 = [v4 presenceMembershipKey];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = [v4 presenceIdentifier];
  [v8 setObject:v9 forKeyedSubscript:@"pr"];

  id v10 = [v4 identifier];
  [v8 setObject:v10 forKeyedSubscript:@"c"];

  id v11 = [v4 channelToken];
  id v12 = [v11 base64EncodedStringWithOptions:0];
  [v8 setObject:v12 forKeyedSubscript:@"ct"];

  uint64_t v13 = [v5 base64EncodedStringWithOptions:0];
  [v8 setObject:v13 forKeyedSubscript:@"sk"];

  id v14 = [v6 base64EncodedStringWithOptions:0];
  [v8 setObject:v14 forKeyedSubscript:@"pk"];

  uint64_t v15 = [v7 base64EncodedStringWithOptions:0];
  [v8 setObject:v15 forKeyedSubscript:@"mk"];

  uint64_t v16 = NSNumber;
  uint64_t v17 = [(SKAInvitationManager *)self channelManager];
  int v18 = [v17 serverTime];
  [v18 timeIntervalSince1970];
  id v19 = objc_msgSend(v16, "numberWithDouble:");
  [v8 setObject:v19 forKeyedSubscript:@"d"];

  id v20 = NSNumber;
  uint64_t v21 = [v4 dateChannelCreated];
  [v21 timeIntervalSince1970];
  uint64_t v22 = objc_msgSend(v20, "numberWithDouble:");
  [v8 setObject:v22 forKeyedSubscript:@"cd"];

  BOOL v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPersonal"));
  [v8 setObject:v23 forKeyedSubscript:@"ip"];

  id v24 = [v4 serviceIdentifier];

  [v8 setObject:v24 forKeyedSubscript:@"si"];
  return v8;
}

- (id)_validateInvitedHandles:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (-[SKAInvitationManager _validateInvitedHandle:](self, "_validateInvitedHandle:", v12, v18, (void)v19))
        {
          [v5 addObject:v12];
        }
        else
        {
          uint64_t v13 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v12;
            _os_log_error_impl(&dword_22480C000, v13, OS_LOG_TYPE_ERROR, "Invited handle failed validation, ignoring: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  id v14 = [v5 array];
  uint64_t v15 = [v14 count];
  if (v15 != [v6 count])
  {
    uint64_t v16 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _validateInvitedHandles:]((uint64_t)v14);
    }
  }
  return v14;
}

- (BOOL)_validateInvitedHandle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F4A258]);
  id v5 = [v3 handleString];
  id v6 = (void *)[v4 initWithUnprefixedURI:v5];

  if (!v6
    || ([v3 handleString],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        !v8))
  {
    uint64_t v12 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _validateInvitedHandle:]();
    }
    goto LABEL_7;
  }
  uint64_t v9 = [v6 unprefixedURI];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    uint64_t v12 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _validateInvitedHandle:](v6);
    }
LABEL_7:

    BOOL v11 = 0;
    goto LABEL_8;
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (void)handleIncomingInvitationMessage:(id)a3 fromHandle:(id)a4 fromID:(id)a5 toHandle:(id)a6 messageGuid:(id)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v57 = a5;
  id v58 = a6;
  id v14 = a7;
  uint64_t v15 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v13;
    _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Incoming invitation from handle: %@", buf, 0xCu);
  }

  uint64_t v16 = objc_msgSend(v12, "ska_stringForKey:", @"c");
  if ([v16 length])
  {
    uint64_t v17 = objc_msgSend(v12, "ska_dateFromUnixTimestampForKey:", @"d");
    if (!v17)
    {
      long long v18 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]();
      }
      goto LABEL_85;
    }
    long long v18 = objc_msgSend(v12, "ska_stringForKey:", @"s");
    char v55 = objc_msgSend(v12, "ska_stringForKey:", @"pr");
    v56 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
    v54 = [(SKADatabaseManaging *)self->_databaseManager existingChannelForSubscriptionIdentifier:v16 databaseContext:v56];
    if (-[NSObject length](v18, "length") && [v55 length])
    {
      long long v19 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]7();
      }
      goto LABEL_84;
    }
    if ([v18 length])
    {
      long long v20 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "Treating invite as a status invite", buf, 2u);
      }

      if (self->_trafficModeEnabled)
      {
        long long v19 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]6();
        }
        goto LABEL_84;
      }
      if ([v18 isEqualToString:@"com.apple.availability"])
      {
        long long v19 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]2();
        }
        goto LABEL_84;
      }
      if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v18])
      {
        long long v19 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]5();
        }
        goto LABEL_84;
      }
      v51 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"r");
      if (![v51 length])
      {
        id v36 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]3();
        }

        long long v19 = v54;
        goto LABEL_66;
      }
      long long v19 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"p");
      if (!v54)
      {
        id v29 = +[SKAInvitationManager logger];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22480C000, v29, OS_LOG_TYPE_DEFAULT, "No existing channel matches incoming invitation, creating new channel", buf, 2u);
        }

        v54 = [(SKADatabaseManaging *)self->_databaseManager createChannelForStatusTypeIdentifier:v18 channelIdentifier:v16 databaseContext:v56];
        if (!v54)
        {
          long long v40 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.8();
          }

          goto LABEL_66;
        }
      }
      __int16 v46 = 0;
      uint64_t v49 = 0;
      v52 = 0;
      id v53 = 0;
LABEL_50:
      id v30 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v30, OS_LOG_TYPE_DEFAULT, "Storing received invitation", buf, 2u);
      }

      id v31 = [(SKADatabaseManaging *)self->_databaseManager createReceivedInvitationForChannel:v54 senderHandle:v13 invitedHandle:v58 invitationIdentifier:v14 dateInvitationCreated:v17 incomingRatchetState:v51 presenceIdentifier:v55 channelToken:v53 serverKey:v52 peerKey:v49 invitationPayload:v19 databaseContext:v56];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained invitationManager:self didReceiveInvitation:v31 forChannel:v54];

      objc_initWeak((id *)buf, self);
      __int16 v44 = (void *)os_transaction_create();
      queue = self->_backgroundCleanupQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __95__SKAInvitationManager_handleIncomingInvitationMessage_fromHandle_fromID_toHandle_messageGuid___block_invoke;
      block[3] = &unk_2646E0CB0;
      objc_copyWeak(&v65, (id *)buf);
      id v60 = v13;
      uint64_t v61 = v18;
      id v62 = v56;
      id v63 = v31;
      id v64 = v44;
      id v45 = v44;
      id v33 = v31;
      dispatch_async(queue, block);

      objc_destroyWeak(&v65);
      objc_destroyWeak((id *)buf);

LABEL_66:
      id v37 = v51;
LABEL_83:
      v54 = v37;
LABEL_84:

LABEL_85:
      goto LABEL_86;
    }
    BOOL v21 = [v55 length] == 0;
    long long v22 = +[SKAInvitationManager logger];
    long long v19 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]();
      }
      goto LABEL_84;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "Treating invite as a presence invite", buf, 2u);
    }

    if (![(SKAInvitationManager *)self presenceEnabledByServer])
    {
      long long v19 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:].cold.4();
      }
      goto LABEL_84;
    }
    id v53 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"ct");
    if (![v53 length])
    {
      uint64_t v34 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.4();
      }

      long long v19 = v54;
      goto LABEL_82;
    }
    long long v19 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"pk");
    if (![v19 length])
    {
      uint64_t v35 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.5();
      }

      goto LABEL_82;
    }
    v52 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"sk");
    if ([v52 length])
    {
      BOOL v23 = objc_msgSend(v12, "ska_numberForKey:", @"ip");
      unsigned int v50 = [v23 BOOLValue];

      if (!v50
        || ([(SKAInvitationManager *)self messagingProvider],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            char v47 = [v24 isFromIDFromSelfAccount:v57],
            v24,
            (v47 & 1) != 0))
      {
        __int16 v46 = objc_msgSend(v12, "ska_dataFrombase64EncodedStringForKey:", @"mk");
        if ([v52 length])
        {
          char v48 = objc_msgSend(v12, "ska_dateFromUnixTimestampForKey:", @"cd");
          if (!v48)
          {
            id v25 = +[SKAInvitationManager logger];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.9();
            }

            uint64_t v26 = [(SKAInvitationManager *)self channelManager];
            char v48 = [v26 serverTime];
          }
          if (v54) {
            goto LABEL_37;
          }
          BOOL v27 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, "No existing channel matches incoming invitation, creating new channel", buf, 2u);
          }

          uint64_t v28 = objc_msgSend(v12, "ska_stringForKey:", @"si");
          id v43 = (void *)[objc_alloc(MEMORY[0x263F797F0]) initWithServiceIdentifier:v28];
          [v43 setIsPersonal:v50];
          v54 = [(SKADatabaseManaging *)self->_databaseManager createPresenceChannelForPresenceIdentifier:v55 channelIdentifier:v16 channelToken:v53 peerKey:v19 serverKey:v52 membershipKey:v46 creationDate:v48 options:v43 databaseContext:v56];

          if (v54)
          {
LABEL_37:

            uint64_t v49 = v19;
            v51 = 0;
            long long v19 = 0;
            goto LABEL_50;
          }
          long long v41 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.8();
          }
        }
        else
        {
          long long v39 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.7();
          }
        }
LABEL_82:
        id v37 = v53;
        goto LABEL_83;
      }
      long long v38 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]0();
      }
    }
    else
    {
      long long v38 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:].cold.6();
      }
    }

    goto LABEL_82;
  }
  uint64_t v17 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SKAInvitationManager handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:]();
  }
LABEL_86:
}

void __95__SKAInvitationManager_handleIncomingInvitationMessage_fromHandle_fromID_toHandle_messageGuid___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [WeakRetained databaseManager];
  id v4 = (void *)[v3 newBackgroundContext];

  id v5 = [WeakRetained databaseManager];
  id v6 = [v5 allExistingChannelsForHandle:*(void *)(a1 + 32) statusTypeIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];

  uint64_t v7 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v8;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up ReceivedInvitations from handle: %@", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(WeakRetained, "databaseManager", (void)v21);
        uint64_t v16 = [v14 identifier];
        [v15 cleanupOldReceivedInvitationsForChannelIdentifier:v16 excludingInvitation:*(void *)(a1 + 56) databaseContext:v4];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v17 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v18;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Removing old channels for handle: %@", buf, 0xCu);
  }

  long long v19 = [WeakRetained databaseManager];
  [v19 cleanupOldChannelsForHandle:*(void *)(a1 + 32) statusTypeIdentifier:*(void *)(a1 + 40) databaseContext:v4];

  id v20 = self;
}

- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if (v9
    && ([(SKAInvitationManager *)self messagingProvider],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isHandleAvailableToMessageFrom:v9],
        v11,
        (v12 & 1) == 0))
  {
    uint64_t v15 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager isHandleInviteable:fromHandle:completion:]();
    }

    id v14 = +[SKAInvitationManager _invalidSenderHandleError];
    v10[2](v10, 0, v14);
  }
  else
  {
    uint64_t v13 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "fromHandle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__SKAInvitationManager_isHandleInviteable_fromHandle_completion___block_invoke;
    v16[3] = &unk_2646E0CD8;
    id v17 = v8;
    uint64_t v18 = v10;
    [(SKAInvitationManager *)self _isHandleInviteable:v17 completion:v16];

    id v14 = v17;
  }
}

uint64_t __65__SKAInvitationManager_isHandleInviteable_fromHandle_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "toHandle \"%@\" inviteability check completed with result: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_isHandleInviteable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SKAInvitationManager *)self _validateInvitedHandle:v6])
  {
    uint64_t v8 = [(SKAInvitationManager *)self messagingProvider];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__SKAInvitationManager__isHandleInviteable_completion___block_invoke;
    v10[3] = &unk_2646E0C60;
    id v11 = v7;
    [v8 isHandleMessageable:v6 completion:v10];
  }
  else
  {
    __int16 v9 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _isHandleInviteable:completion:]();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __55__SKAInvitationManager__isHandleInviteable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isPresenceHandleInviteable:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  if (v9
    && ([(SKAInvitationManager *)self messagingProvider],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isHandleAvailableToMessageFrom:v9],
        v11,
        (v12 & 1) == 0))
  {
    uint64_t v15 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager isPresenceHandleInviteable:fromHandle:completion:]();
    }

    id v14 = +[SKAInvitationManager _invalidSenderHandleError];
    v10[2](v10, 0, v14);
  }
  else
  {
    uint64_t v13 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "fromHandle \"%@\" is a valid sender handle for active iCloud account", buf, 0xCu);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__SKAInvitationManager_isPresenceHandleInviteable_fromHandle_completion___block_invoke;
    v16[3] = &unk_2646E0CD8;
    id v17 = v8;
    uint64_t v18 = v10;
    [(SKAInvitationManager *)self _isPresenceHandleInviteable:v17 completion:v16];

    id v14 = v17;
  }
}

uint64_t __73__SKAInvitationManager_isPresenceHandleInviteable_fromHandle_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "toHandle \"%@\" inviteability check completed with result: %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_isPresenceHandleInviteable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SKAInvitationManager *)self _validateInvitedHandle:v6])
  {
    uint64_t v8 = [(SKAInvitationManager *)self messagingProvider];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__SKAInvitationManager__isPresenceHandleInviteable_completion___block_invoke;
    v10[3] = &unk_2646E0C60;
    id v11 = v7;
    [v8 isHandleMessageableForPresence:v6 completion:v10];
  }
  else
  {
    __int16 v9 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _isHandleInviteable:completion:]();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __63__SKAInvitationManager__isPresenceHandleInviteable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  databaseManager = self->_databaseManager;
  id v14 = a5;
  uint64_t v15 = (void *)[(SKADatabaseManaging *)databaseManager newBackgroundContext];
  uint64_t v16 = [(SKAInvitationManager *)self databaseManager];
  id v17 = [v16 existingRemovedUserWithHandle:v10 statusTypeIdentifier:v14 withDatabaseContext:v15];

  if (v17)
  {
    uint64_t v18 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "handle \"%@\" is present as a removed user", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __94__SKAInvitationManager_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v20[3] = &unk_2646E0D00;
  BOOL v22 = v17 != 0;
  id v21 = v12;
  id v19 = v12;
  [(SKAInvitationManager *)self isHandleInviteable:v10 fromHandle:v11 completion:v20];
}

void __94__SKAInvitationManager_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F797C8];
  id v6 = a3;
  id v7 = (id)[[v5 alloc] initWithIsInvitable:a2 wasRemoved:*(unsigned __int8 *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  databaseManager = self->_databaseManager;
  id v14 = a5;
  uint64_t v15 = (void *)[(SKADatabaseManaging *)databaseManager newBackgroundContext];
  uint64_t v16 = [(SKAInvitationManager *)self databaseManager];
  id v17 = [v16 existingRemovedUserWithHandle:v10 presenceIdentifier:v14 withDatabaseContext:v15];

  if (v17)
  {
    uint64_t v18 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "handle \"%@\" is present as a removed user", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __92__SKAInvitationManager_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke;
  v20[3] = &unk_2646E0D00;
  BOOL v22 = v17 != 0;
  id v21 = v12;
  id v19 = v12;
  [(SKAInvitationManager *)self isPresenceHandleInviteable:v10 fromHandle:v11 completion:v20];
}

void __92__SKAInvitationManager_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F797C8];
  id v6 = a3;
  id v7 = (id)[[v5 alloc] initWithIsInvitable:a2 wasRemoved:*(unsigned __int8 *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:(id)a3 databaseContext:(id)a4 invitationWasSentViaKeyRoll:(BOOL *)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 currentOutgoingRatchet];
  uint64_t v13 = +[SKAInvitationManager logger];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      uint64_t v15 = [v12 currentSubscriptionKeys];
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v15 index];
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Found existing encryption keys, attempting to ratchet forward from current ratchet index: %ld", buf, 0xCu);
    }
    if ([v12 ratchetForward])
    {
      uint64_t v16 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v12 currentSubscriptionKeys];
        unsigned int v18 = [v17 index];
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = v18;
        _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Ratchet forward succeeded. New ratchet index: %ld. Persisting this state.", buf, 0xCu);
      }
      id v19 = [v12 serializedData];
      id v20 = [(SKAInvitationManager *)self databaseManager];
      id v21 = [v20 updatePersonalChannel:v10 withCurrentOutgoingRatchetState:v19 databaseContext:v11];

      *a5 = 0;
      if (!a6) {
        goto LABEL_22;
      }
LABEL_16:
      *a6 = 0;
      goto LABEL_22;
    }
    id v26 = 0;
    BOOL v24 = [(SKAInvitationManager *)self _rollEncryptionKeyForChannel:v10 databaseContext:v11 error:&v26];
    id v19 = v26;
    if (v24)
    {
LABEL_15:
      *a5 = 1;
      id v21 = 0;
      if (!a6) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    long long v23 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:]();
    }
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Channel has no existing encryption key data, initiating key roll to generate first key", buf, 2u);
    }

    id v27 = 0;
    BOOL v22 = [(SKAInvitationManager *)self _rollEncryptionKeyForChannel:v10 databaseContext:v11 error:&v27];
    id v19 = v27;
    if (v22) {
      goto LABEL_15;
    }
    long long v23 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SKAInvitationManager _ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:]();
    }
  }

  if (a6) {
    *a6 = v19;
  }
  id v21 = 0;
  *a5 = 0;
LABEL_22:

  return v21;
}

- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPersonalChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v36 = a4;
  id v13 = a5;
  id v35 = a6;
  id v14 = a7;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v38;
    *(void *)&long long v16 = 138412290;
    long long v32 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v21 = objc_msgSend(v20, "handleString", v32);
        uint64_t v22 = [v21 length];

        if (v22)
        {
          long long v23 = [(SKAInvitationManager *)self _updateOrCreateInvitedUserWithHandle:v20 senderHandle:v36 onChannel:v13 withInvitationPayload:v35 databaseContext:v14];
          if ([v23 count])
          {
            [v33 addObjectsFromArray:v23];
            databaseManager = self->_databaseManager;
            uint64_t v25 = [v13 statusType];
            id v26 = [(SKADatabaseManaging *)databaseManager existingRemovedUserWithHandle:v20 statusTypeIdentifier:v25 withDatabaseContext:v14];

            if (!v26) {
              goto LABEL_17;
            }
            id v27 = +[SKAInvitationManager logger];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v32;
              id v42 = v20;
              _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, "Removing handle %@ from removed users because of invite", buf, 0xCu);
            }

            uint64_t v28 = self->_databaseManager;
            uint64_t v29 = [v13 statusType];
            [(SKADatabaseManaging *)v28 deleteRemovedUserWithHandle:v20 statusTypeIdentifier:v29 databaseContext:v14];
          }
          else
          {
            uint64_t v29 = +[SKAInvitationManager logger];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              id v42 = v20;
              _os_log_error_impl(&dword_22480C000, v29, OS_LOG_TYPE_ERROR, "Error fetching or update invited user for handle: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          long long v23 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            id v42 = v20;
            _os_log_error_impl(&dword_22480C000, v23, OS_LOG_TYPE_ERROR, "Invited handle has a nil handle string: %@", buf, 0xCu);
          }
        }
LABEL_17:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v17);
  }

  uint64_t v30 = (void *)[v33 copy];
  return v30;
}

- (id)_addInvitedHandles:(id)a3 senderHandle:(id)a4 toDatabaseForPresenceChannel:(id)a5 databaseContext:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v35;
    *(void *)&long long v14 = 138412290;
    long long v30 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "handleString", v30);
        uint64_t v20 = [v19 length];

        if (v20)
        {
          id v21 = [(SKAInvitationManager *)self _updateOrCreateInvitedUserWithHandle:v18 senderHandle:v33 onChannel:v11 withInvitationPayload:0 databaseContext:v12];
          if ([v21 count])
          {
            [v31 addObjectsFromArray:v21];
            databaseManager = self->_databaseManager;
            long long v23 = [v11 presenceIdentifier];
            BOOL v24 = [(SKADatabaseManaging *)databaseManager existingRemovedUserWithHandle:v18 presenceIdentifier:v23 withDatabaseContext:v12];

            if (!v24) {
              goto LABEL_17;
            }
            uint64_t v25 = +[SKAInvitationManager logger];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v30;
              long long v39 = v18;
              _os_log_impl(&dword_22480C000, v25, OS_LOG_TYPE_DEFAULT, "Removing handle %@ from removed users because of invite", buf, 0xCu);
            }

            id v26 = self->_databaseManager;
            id v27 = [v11 presenceIdentifier];
            [(SKADatabaseManaging *)v26 deleteRemovedUserWithHandle:v18 presenceIdentifier:v27 databaseContext:v12];
          }
          else
          {
            id v27 = +[SKAInvitationManager logger];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v30;
              long long v39 = v18;
              _os_log_error_impl(&dword_22480C000, v27, OS_LOG_TYPE_ERROR, "Error fetching or update invited user for handle: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          id v21 = +[SKAInvitationManager logger];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            long long v39 = v18;
            _os_log_error_impl(&dword_22480C000, v21, OS_LOG_TYPE_ERROR, "Invited handle has a nil handle string: %@", buf, 0xCu);
          }
        }
LABEL_17:
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v15);
  }

  uint64_t v28 = (void *)[v31 copy];
  return v28;
}

- (id)_updateOrCreateInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 onChannel:(id)a5 withInvitationPayload:(id)a6 databaseContext:(id)a7
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v45 = a7;
  id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v49 = self;
  uint64_t v16 = [(SKADatabaseManaging *)self->_databaseManager existingInvitedUsersForInvitedHandle:v12 onChannel:v14 databaseContext:v45];
  unint64_t v17 = 0x2646E0000uLL;
  if (![v16 count]) {
    goto LABEL_30;
  }
  uint64_t v18 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v60 = [v16 count];
    __int16 v61 = 2112;
    id v62 = v12;
    _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Found %ld existing invited user for invitedHandle %@ (ignoring sender handle).", buf, 0x16u);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v16;
  uint64_t v51 = [v19 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v51)
  {

LABEL_30:
    long long v38 = [*(id *)(v17 + 2480) logger];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v60 = (uint64_t)v12;
      __int16 v61 = 2112;
      id v62 = v13;
      _os_log_impl(&dword_22480C000, v38, OS_LOG_TYPE_DEFAULT, "Could not find an existing invited user matching handle: %@ and senderHandle %@, attempting to create a new one.", buf, 0x16u);
    }

    long long v39 = [(SKADatabaseManaging *)v49->_databaseManager createInvitedUserWithHandle:v12 senderHandle:v13 invitationPayload:v15 channel:v14 databaseContext:v45];
    if (v39)
    {
      [v46 addObject:v39];
    }
    else
    {
      long long v40 = [*(id *)(v17 + 2480) logger];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:]();
      }
    }
    goto LABEL_38;
  }
  id v43 = v16;
  id v44 = v12;
  char v47 = 0;
  uint64_t v50 = *(void *)v55;
  id v20 = v45;
  id obj = v19;
  do
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (*(void *)v55 != v50) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      long long v23 = [v22 senderSKHandle];
      int v24 = [v23 isNormalizedEqualToHandle:v13];
      unint64_t v25 = v17;
      id v26 = [*(id *)(v17 + 2480) logger];
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v27)
        {
          uint64_t v28 = [v13 handleString];
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v28;
          _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Existing invited user was invited from the same handle: %@. Updating payload, and not creating a new InvitedUser record.", buf, 0xCu);
        }
        char v47 = 1;
      }
      else if (v27)
      {
        uint64_t v29 = [v23 handleString];
        [v13 handleString];
        id v30 = v15;
        id v31 = v13;
        v33 = id v32 = v14;
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = (uint64_t)v29;
        __int16 v61 = 2112;
        id v62 = v33;
        _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Existing invited user was invited from %@, but we are attempting to invite from %@. Will update this users payload, but may still need to create a new InvitedUser record", buf, 0x16u);

        id v14 = v32;
        id v13 = v31;
        id v15 = v30;
        id v20 = v45;
      }
      id v34 = [v22 invitationPayload];
      long long v35 = [*(id *)(v25 + 2480) logger];
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34 == v15)
      {
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Invitation payload is already up to date", buf, 2u);
        }
      }
      else
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v22;
          _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Updating invitation payload on invitedUser: %@", buf, 0xCu);
        }

        long long v35 = [(SKADatabaseManaging *)v49->_databaseManager updateInvitationPayload:v15 onExistingInvitedUser:v22 channel:v14 databaseContext:v20];
        if (v35)
        {
          [v46 addObject:v35];
        }
        else
        {
          long long v37 = [*(id *)(v25 + 2480) logger];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[SKAInvitationManager _updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:](&v52, v53, v37);
          }
        }
      }

      unint64_t v17 = v25;
    }
    uint64_t v51 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  }
  while (v51);

  uint64_t v16 = v43;
  id v12 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_38:
  uint64_t v41 = (void *)[v46 copy];

  return v41;
}

- (void)_findOrCreatePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(SKADatabaseManaging *)self->_databaseManager existingPersonalChannelForStatusTypeIdentifier:v8 databaseContext:v9];
  if (v11)
  {
    v10[2](v10, v11, 0);
  }
  else
  {
    id v12 = +[SKAInvitationManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Could not find an existing personal status channel, attempting to create a new one.", buf, 2u);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __103__SKAInvitationManager__findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
    v13[3] = &unk_2646E0D28;
    id v14 = v10;
    [(SKAInvitationManager *)self _createPersonalChannelForStatusTypeIdentifier:v8 databaseContext:v9 completion:v13];
  }
}

uint64_t __103__SKAInvitationManager__findOrCreatePersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_createPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  channelManager = self->_channelManager;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke;
  v15[3] = &unk_2646E0DA0;
  objc_copyWeak(&v19, &location);
  v15[4] = self;
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

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v11 = WeakRetained;
  if (v9)
  {
    if ([WeakRetained _shouldReauthForError:v9])
    {
      id v12 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1();
      }

      id v13 = [a1[4] accountProvider];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85;
      v16[3] = &unk_2646E0D78;
      void v16[4] = v11;
      objc_copyWeak(&v20, a1 + 8);
      id v19 = a1[7];
      id v17 = a1[5];
      id v18 = a1[6];
      [v13 refreshCredentialForPrimaryAccountWithCompletion:v16];

      objc_destroyWeak(&v20);
    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }
  else
  {
    id v14 = [WeakRetained databaseManager];
    id v15 = [v14 createPersonalChannelForStatusTypeIdentifier:a1[5] channelIdentifier:v7 channelToken:v8 databaseContext:a1[6]];

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85(id *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SKAInvitationManager logger];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Account refresh succeeded, reattempting channel creation", buf, 2u);
    }

    id v8 = [a1[4] channelManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_86;
    v9[3] = &unk_2646E0D50;
    objc_copyWeak(&v13, a1 + 8);
    id v12 = a1[7];
    id v10 = a1[5];
    id v11 = a1[6];
    [v8 createChannelWithCompletion:v9];

    objc_destroyWeak(&v13);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1();
    }

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = WeakRetained;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = [WeakRetained databaseManager];
    id v12 = [v11 createPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 32) channelIdentifier:v13 channelToken:v7 databaseContext:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
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
      id v6 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _shouldReauthForError:]();
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
      id v6 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _shouldReauthForError:]();
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
      id v6 = +[SKAInvitationManager logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAInvitationManager _shouldReauthForError:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v6 = +[SKAInvitationManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Error does not appear to be auth related, we should not attempt reauth", v13, 2u);
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

+ (id)_invalidSenderHandleError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Sender handle is invalid, or could not determine a valid default sender handle."];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v3 errorWithDomain:v4 code:-8000 userInfo:v5];

  return v6;
}

+ (id)_invalidInvitedHandlesError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Invited handles are invalid"];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v3 errorWithDomain:v4 code:-4001 userInfo:v5];

  return v6;
}

+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"Could not find or create a channel to send invitation for status of type \"%@\".", a3];
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 errorWithDomain:v5 code:-3000 userInfo:v6];

  return v7;
}

+ (id)_noPresenceChannelForIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [NSString stringWithFormat:@"Could not find or create a channel to send invitation for presence \"%@\".", a3];
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 errorWithDomain:v5 code:-3100 userInfo:v6];

  return v7;
}

+ (id)_keyRollFailedErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:@"Key roll failed" forKeyedSubscript:*MEMORY[0x263F07F80]];
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F79860];
  id v7 = (void *)[v4 copy];
  uint64_t v8 = [v5 errorWithDomain:v6 code:-6000 userInfo:v7];

  return v8;
}

+ (id)_unableToFindExistingInvitationForHandlesError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) handleString];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  BOOL v11 = [v4 componentsJoinedByString:@", "];
  id v12 = [NSString stringWithFormat:@"Could not uninvite handle(s) \"%@\" because we could not find an existing invitation for those handle(s)", v11];
  id v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F79860];
  uint64_t v22 = *MEMORY[0x263F07F80];
  long long v23 = v12;
  id v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v16 = [v13 errorWithDomain:v14 code:-5000 userInfo:v15];

  return v16;
}

+ (id)_unableToFindAnyExistingInvitationToDeleteError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79860];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Could not any existing invitations to delete";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:v3 code:-5000 userInfo:v4];

  return v5;
}

+ (id)_presenceDisabledError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Presence has been disabled by the server";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:v3 code:-7010 userInfo:v4];

  return v5;
}

+ (id)logger
{
  if (logger_onceToken_0 != -1) {
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)logger__logger_0;
  return v2;
}

uint64_t __30__SKAInvitationManager_logger__block_invoke()
{
  logger__logger_0 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAInvitationManager");
  return MEMORY[0x270F9A758]();
}

- (SKAInvitationManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAInvitationManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
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

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
}

- (OS_dispatch_queue)backgroundCleanupQueue
{
  return self->_backgroundCleanupQueue;
}

- (void)setBackgroundCleanupQueue:(id)a3
{
}

- (NSMutableDictionary)outgoingInvitationMapping
{
  return self->_outgoingInvitationMapping;
}

- (void)setOutgoingInvitationMapping:(id)a3
{
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (BOOL)presenceEnabledByServer
{
  return self->_presenceEnabledByServer;
}

- (void)setPresenceEnabledByServer:(BOOL)a3
{
  self->_presenceEnabledByServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingInvitationMapping, 0);
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Request to invite handles contains no valid handles to invite. InvitedHandles: %@", v2, v3, v4, v5, v6);
}

- (void)sendInvitationForPersonalChannelWithStatusTypeIdentifier:toHandles:fromSenderHandle:withInvitationPayload:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error resolving sender handle. UnresolvedSenderHandle: %@", v2, v3, v4, v5, v6);
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find or create personal channel", v2, v3, v4, v5, v6);
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation failed with error: %@", v2, v3, v4, v5, v6);
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_3(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Invitation was not sent for handles %@ due to key roll error: %@", (void)v3, DWORD2(v3));
}

void __141__SKAInvitationManager_sendInvitationForPersonalChannelWithStatusTypeIdentifier_toHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching or creating personal channel: %@", v2, v3, v4, v5, v6);
}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:(void *)a1 toHandles:fromSenderHandle:options:completion:.cold.3(void *a1)
{
  uint64_t v1 = [a1 serviceIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_22480C000, v2, v3, "Presence has been disabled by the server for identifier %@.", v4, v5, v6, v7, v8);
}

- (void)sendInvitationForPresenceChannelWithPresenceIdentifier:toHandles:fromSenderHandle:options:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Presence has been disabled by the server.", v2, v3, v4, v5, v6);
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find or create presence channel", v2, v3, v4, v5, v6);
}

void __125__SKAInvitationManager_sendInvitationForPresenceChannelWithPresenceIdentifier_toHandles_fromSenderHandle_options_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching or creating presence channel: %@", v2, v3, v4, v5, v6);
}

void __105__SKAInvitationManager_sendSelfInvitationForPresenceChannelWithPresenceIdentifier_isPersonal_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find existing personal channel to revoke all invitations for", v2, v3, v4, v5, v6);
}

- (void)revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to find any invitations to revoke, taking no action, returning error", v2, v3, v4, v5, v6);
}

- (void)revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:forHandles:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find existing personal channel to revoke invitations for", v2, v3, v4, v5, v6);
}

- (void)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Not rolling encryption key because a personal channel does not exist for statusTypeIdentifier: %@", v2, v3, v4, v5, v6);
}

- (void)rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Error encountered during key roll for statusTypeIdentifier: %@ error: %@", (void)v3, DWORD2(v3));
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find channel ID matching message ID.", v2, v3, v4, v5, v6);
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find channel matching channel ID", v2, v3, v4, v5, v6);
}

- (void)outgoingMessageWithIdentifier:fromHandle:toHandle:didSendWithSuccess:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Invitation message failed to send! Removing record of invitation.", v2, v3, v4, v5, v6);
}

- (void)rollPersonalChannelWithStatusTypeIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Asked to roll personal channel for %@, but no channel exists", v2, v3, v4, v5, v6);
}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Channel creation failed! Aborting channel roll.", v2, v3, v4, v5, v6);
}

void __79__SKAInvitationManager_rollPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to copy invited users! Aborting channel roll.", v2, v3, v4, v5, v6);
}

- (void)rollPresenceChannelWithPresenceIdentifier:isPersonal:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Asked to roll presence channel for %@, but no channel exists", v2, v3, v4, v5, v6);
}

- (void)_rollEncryptionKeyForChannel:databaseContext:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Outgoing IDS messages for encryption key roll failed to send: %@", v2, v3, v4, v5, v6);
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failing to send invitation to zero invited users", v2, v3, v4, v5, v6);
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error generating incoming ratchet: %@", v2, v3, v4, v5, v6);
}

- (void)_sendInvitationMessageForChannel:toInvitedUsers:subscriptionKeys:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Error serializing incoming ratchet", v2, v3, v4, v5, v6);
}

- (void)_validateInvitedHandles:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22480C000, v1, v2, "Validated invited handle set does not match unvalidated handles. Unvalidated set may have contained duplicate or invalid handles. Validated: %@ Unvalidated: %@", (void)v3, DWORD2(v3));
}

- (void)_validateInvitedHandle:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invited handle has a nil handle string: %@", v2, v3, v4, v5, v6);
}

- (void)_validateInvitedHandle:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 unprefixedURI];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_22480C000, v2, v3, "Unprefixed uri for invited handle is nil: %@", v4, v5, v6, v7, v8);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing channel identifier, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing date invitation created, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation missing presence and status identifiers, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing channel token, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing peer key data, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing server key data, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing membership key data, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find or create channel for incoming invitation, dropping invitation.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Invitation message missing date channel created. Using current server time", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message is for a personal presence channel but does not come from a device on our account: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message uses legacy status type identifier, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message missing incoming ratchet state, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Status type %@ disabled by server. Dropping incoming status update", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.16()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "We're in traffic mode--dropping incoming invitation", v2, v3, v4, v5, v6);
}

- (void)handleIncomingInvitationMessage:fromHandle:fromID:toHandle:messageGuid:.cold.17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation message has both status and presence, dropping invitation: %@", v2, v3, v4, v5, v6);
}

- (void)isHandleInviteable:fromHandle:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "fromHandle \"%@\" is NOT a valid sender handle for active iCloud account", v2, v3, v4, v5, v6);
}

- (void)_isHandleInviteable:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Handle is invalid, and not inviteable: %@", v2, v3, v4, v5, v6);
}

- (void)isPresenceHandleInviteable:fromHandle:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "fromHandle \"%@\" is NOT a valid sender handle for active iCloud account", v2, v3, v4, v5, v6);
}

- (void)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Generating first encryption key for personal channel failed: %@", v2, v3, v4, v5, v6);
}

- (void)_ratchetEncryptionKeyForwardOrKeyRollForPersonalChannel:databaseContext:invitationWasSentViaKeyRoll:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Rolling encryption key for personal channel failed: %@", v2, v3, v4, v5, v6);
}

- (void)_updateOrCreateInvitedUserWithHandle:senderHandle:onChannel:withInvitationPayload:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Received a nil created user from createInvitedUserWithHandle", v2, v3, v4, v5, v6);
}

- (void)_updateOrCreateInvitedUserWithHandle:(os_log_t)log senderHandle:onChannel:withInvitationPayload:databaseContext:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Received a nil updated user from call to updateInvitationPayload", buf, 2u);
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Account refresh required for error: %@", v2, v3, v4, v5, v6);
}

void __97__SKAInvitationManager__createPersonalChannelForStatusTypeIdentifier_databaseContext_completion___block_invoke_85_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Account refresh failed with error: %@", v2, v3, v4, v5, v6);
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

@end