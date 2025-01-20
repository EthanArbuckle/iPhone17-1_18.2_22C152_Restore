@interface SKADatabaseManager
+ (id)logger;
- (BOOL)copyInvitedUsersFromChannel:(id)a3 toChannel:(id)a4 databaseContext:(id)a5;
- (BOOL)createOrUpdateOrDeleteSubscribedLocalStatus:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)createOrUpdatePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)createOrUpdatePublishedLocalStatuses:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)decomissionAllPersonalChannelsWithStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (BOOL)decomissionChannelWithIdentifier:(id)a3 databaseContext:(id)a4;
- (BOOL)deleteAllInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4;
- (BOOL)deleteInvitedUserForHandle:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5;
- (BOOL)deleteInvitedUserForHandle:(id)a3 presenceChannel:(id)a4 databaseContext:(id)a5;
- (BOOL)deletePendingPublishRequestWithWithUniqueIdentifier:(id)a3 databaseContext:(id)a4;
- (BOOL)deletePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (BOOL)deletePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5;
- (BOOL)deleteRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5;
- (BOOL)deleteRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (BOOL)deleteSubscriptionAssertionWithSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5;
- (BOOL)incrementPendingPublishRequestRetryCountWithUniqueIdentifier:(id)a3 databaseContext:(id)a4;
- (BOOL)setCurrentCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4 databaseContext:(id)a5;
- (SKADatabaseManager)initWithDatabaseProvider:(id)a3 delegate:(id)a4;
- (SKADatabaseManagingDelegate)delegate;
- (SKADatabaseProviding)databaseProvider;
- (id)_existingChannelCheckpointForChannelIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingChannelsForChannelIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingChannelsForChannelIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5;
- (id)_existingChannelsForDatabaseChannel:(id)a3 databaseContext:(id)a4;
- (id)_existingChannelsForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5;
- (id)_existingDecomissionedPersonalChannelsWithDatabaseContext:(id)a3;
- (id)_existingInvitedUsersForDatabaseInvitedUser:(id)a3 databaseChannel:(id)a4 databaseContext:(id)a5;
- (id)_existingInvitedUsersForInvitedHandle:(id)a3 channel:(id)a4 databaseContext:(id)a5;
- (id)_existingPendingPublishRequestForUniqueIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingPendingPublishRequestsWithDatabaseContext:(id)a3;
- (id)_existingPersonalChannelForDatabaseChannel:(id)a3 databaseContext:(id)a4;
- (id)_existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingPersonalChannelsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingReceivedInvitationsForChannelIdentifier:(id)a3 sortedByDateReceived:(BOOL)a4 databaseContect:(id)a5;
- (id)_existingReceivedInvitationsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (id)_existingRemovedUsersForHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5;
- (id)_existingRemovedUsersForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (id)_existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5;
- (id)_existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5;
- (id)_existingTransientSubscriptionHistoryForChannelIdentifier:(id)a3 databaseContext:(id)a4;
- (id)_existingTransientSubscriptionHistoryWithLimit:(int64_t)a3 orderedByLastSubscriptionDateAscending:(BOOL)a4 databaseContext:(id)a5;
- (id)allExistingChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (id)allExistingChannelsForStatusTypeIdentifier:(id)a3 includingPersonalChannel:(BOOL)a4 databaseContext:(id)a5;
- (id)allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:(id)a3;
- (id)allPublishedLocalStatusDevicesInDatabaseContext:(id)a3 error:(id *)a4;
- (id)allPublishedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4;
- (id)allSubscribedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4;
- (id)createChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 databaseContext:(id)a5;
- (id)createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5;
- (id)createInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 invitationPayload:(id)a5 channel:(id)a6 databaseContext:(id)a7;
- (id)createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4 databaseContext:(id)a5;
- (id)createPendingPublishRequestWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusTypeIdentifier:(id)a6 databaseContext:(id)a7;
- (id)createPersonalChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 databaseContext:(id)a6;
- (id)createPresenceChannelForPresenceIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 peerKey:(id)a6 serverKey:(id)a7 membershipKey:(id)a8 creationDate:(id)a9 options:(id)a10 databaseContext:(id)a11;
- (id)createReceivedInvitationForChannel:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 invitationIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13 databaseContext:(id)a14;
- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 presenceIdentifier:(id)a5 databaseContext:(id)a6;
- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6;
- (id)createStatusWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 channelIdentifier:(id)a9 databaseContext:(id)a10;
- (id)createSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6;
- (id)existingChannelForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (id)existingChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5;
- (id)existingChannelForSubscriptionIdentifier:(id)a3 databaseContext:(id)a4;
- (id)existingInvitedUsersForInvitedHandle:(id)a3 onChannel:(id)a4 databaseContext:(id)a5;
- (id)existingInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4;
- (id)existingPendingPublishRequestForUniqueIdentifier:(id)a3 withDatabaseContext:(id)a4;
- (id)existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 withDatabaseContext:(id)a4;
- (id)existingPendingPublishRequestsWithDatabaseContext:(id)a3;
- (id)existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4;
- (id)existingRecentTransientSubscriptionHistoriesWithLimit:(int64_t)a3 databaseContext:(id)a4;
- (id)existingRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 withDatabaseContext:(id)a5;
- (id)existingRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 withDatabaseContext:(id)a5;
- (id)existingStatusForChannel:(id)a3 databaseContext:(id)a4;
- (id)existingStatusForUniqueIdentifier:(id)a3 databaseContext:(id)a4;
- (id)existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5;
- (id)existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5;
- (id)generatedEncryptionKeysForPersonalChannel:(id)a3 databaseContext:(id)a4;
- (id)newBackgroundContext;
- (id)receivedInvitationsForChannel:(id)a3 databaseContext:(id)a4;
- (id)updateInvitationPayload:(id)a3 onExistingInvitedUser:(id)a4 channel:(id)a5 databaseContext:(id)a6;
- (id)updatePersonalChannel:(id)a3 withCurrentOutgoingRatchetState:(id)a4 databaseContext:(id)a5;
- (unint64_t)currentCheckpointForChannel:(id)a3 databaseContext:(id)a4;
- (void)cleanupDecommisionedChannelsWithDatabaseContext:(id)a3;
- (void)cleanupOldChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (void)cleanupOldReceivedInvitationsForChannelIdentifier:(id)a3 excludingInvitation:(id)a4 databaseContext:(id)a5;
- (void)cleanupOldStatusUpdatesForChannelIdentifier:(id)a3 excludingStatusUniqueIdentifier:(id)a4 databaseContext:(id)a5;
- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3;
- (void)hasInitialCloudKitImportOccurred:(id)a3;
@end

@implementation SKADatabaseManager

- (SKADatabaseManager)initWithDatabaseProvider:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKADatabaseManager;
  v9 = [(SKADatabaseManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)newBackgroundContext
{
  return (id)[(SKADatabaseProviding *)self->_databaseProvider newBackgroundContext];
}

- (void)hasInitialCloudKitImportOccurred:(id)a3
{
}

- (id)existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__SKADatabaseManager_existingPersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __85__SKADatabaseManager_existingPersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v2)
  {
    v3 = [SKADatabaseChannel alloc];
    v8[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    uint64_t v5 = [(SKADatabaseChannel *)v3 initWithCoreDataChannels:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)_existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  v33[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = a4;
  uint64_t v6 = +[Channel fetchRequest];
  id v7 = (void *)MEMORY[0x263F08730];
  id v25 = v5;
  id v8 = +[Channel predicateForStatusTypeIdentifier:v5];
  v33[0] = v8;
  id v9 = +[Channel predicateForPersonal:1];
  v33[1] = v9;
  id v10 = +[Channel predicateForDecomissioned:0];
  v33[2] = v10;
  v11 = +[Channel predicateForChannelTypeStatus];
  v33[3] = v11;
  objc_super v12 = +[Channel predicateForCreationDateNotNil];
  v33[4] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:5];
  id v14 = [v7 andPredicateWithSubpredicates:v13];
  [v6 setPredicate:v14];

  v15 = +[Channel sortDescriptorForCreationDateAscending:1];
  v32 = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  [v6 setSortDescriptors:v16];

  [v6 setFetchLimit:1];
  id v27 = 0;
  v17 = [v26 executeFetchRequest:v6 error:&v27];

  id v18 = v27;
  if (v18)
  {
    v19 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingPersonalChannelForStatusTypeIdentifier:databaseContext:]();
    }
    v20 = 0;
    id v21 = v25;
  }
  else
  {
    v19 = [v17 firstObject];
    v22 = +[SKADatabaseManager logger];
    id v21 = v25;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v19 identifier];
      *(_DWORD *)buf = 138412546;
      id v29 = v25;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Fetch request for personal status channel type \"%@\" completed with result: %@", buf, 0x16u);
    }
    if (v19)
    {
      v19 = v19;
      v20 = v19;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (id)_existingDecomissionedPersonalChannelsWithDatabaseContext:(id)a3
{
  v24[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[Channel fetchRequest];
  id v5 = (void *)MEMORY[0x263F08730];
  uint64_t v6 = +[Channel predicateForPersonal:1];
  v24[0] = v6;
  id v7 = +[Channel predicateForDecomissioned:1];
  v24[1] = v7;
  id v8 = +[Channel predicateForChannelTypeStatus];
  v24[2] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  id v10 = [v5 andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  v11 = +[Channel sortDescriptorForCreationDateAscending:0];
  v23 = v11;
  objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v4 setSortDescriptors:v12];

  id v20 = 0;
  id v13 = [v3 executeFetchRequest:v4 error:&v20];

  id v14 = v20;
  v15 = +[SKADatabaseManager logger];
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingDecomissionedPersonalChannelsWithDatabaseContext:]();
    }

LABEL_5:
    id v17 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v18;
    _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Fetch request for decomissioned personal channels completed with %lu results", buf, 0xCu);
  }

  if (!v13) {
    goto LABEL_5;
  }
  id v17 = v13;
LABEL_10:

  return v17;
}

- (id)_existingPersonalChannelsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  v33[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[Channel fetchRequest];
  id v8 = (void *)MEMORY[0x263F08730];
  id v26 = v5;
  id v9 = +[Channel predicateForStatusTypeIdentifier:v5];
  v33[0] = v9;
  id v10 = +[Channel predicateForPersonal:1];
  v33[1] = v10;
  v11 = +[Channel predicateForDecomissioned:0];
  v33[2] = v11;
  objc_super v12 = +[Channel predicateForChannelTypeStatus];
  v33[3] = v12;
  id v13 = +[Channel predicateForCreationDateNotNil];
  v33[4] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:5];
  v15 = [v8 andPredicateWithSubpredicates:v14];
  [v7 setPredicate:v15];

  uint64_t v16 = +[Channel sortDescriptorForCreationDateAscending:1];
  v32 = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  [v7 setSortDescriptors:v17];

  id v27 = 0;
  uint64_t v18 = [v6 executeFetchRequest:v7 error:&v27];

  id v19 = v27;
  if (v19)
  {
    id v20 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingPersonalChannelForStatusTypeIdentifier:databaseContext:]();
    }
    id v21 = 0;
    uint64_t v22 = v26;
  }
  else
  {
    id v20 = [v18 firstObject];
    v23 = +[SKADatabaseManager logger];
    uint64_t v22 = v26;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v20 identifier];
      *(_DWORD *)buf = 138412546;
      id v29 = v26;
      __int16 v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Fetch request for personal status channel type \"%@\" completed with result: %@", buf, 0x16u);
    }
    if (v20) {
      id v21 = (void *)[v18 copy];
    }
    else {
      id v21 = 0;
    }
  }

  return v21;
}

- (BOOL)deletePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v2)
  {
    [*(id *)(a1 + 48) deleteObject:v2];
    id v3 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deleted existing channel.", v5, 2u);
    }
    char v4 = 1;
  }
  else
  {
    id v3 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }
    char v4 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
}

- (id)existingChannelForSubscriptionIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__SKADatabaseManager_existingChannelForSubscriptionIdentifier_databaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __79__SKADatabaseManager_existingChannelForSubscriptionIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _existingChannelsForChannelIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if ([v5 count])
  {
    v2 = [[SKADatabaseChannel alloc] initWithCoreDataChannels:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    char v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)existingChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__SKADatabaseManager_existingChannelForPresenceIdentifier_isPersonal_databaseContext___block_invoke;
  v14[3] = &unk_2646E2028;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  BOOL v18 = a4;
  id v11 = v9;
  id v16 = v11;
  uint64_t v17 = &v19;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __86__SKADatabaseManager_existingChannelForPresenceIdentifier_isPersonal_databaseContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _existingChannelsForPresenceIdentifier:*(void *)(a1 + 40) isPersonal:*(unsigned __int8 *)(a1 + 64) databaseContext:*(void *)(a1 + 48)];
  if ([v5 count])
  {
    v2 = [[SKADatabaseChannel alloc] initWithCoreDataChannels:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    char v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)_existingChannelsForDatabaseChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  uint64_t v9 = [v7 isPersonal];

  id v10 = [(SKADatabaseManager *)self _existingChannelsForChannelIdentifier:v8 isPersonal:v9 databaseContext:v6];

  return v10;
}

- (id)_existingPersonalChannelForDatabaseChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = [(SKADatabaseManager *)self _existingChannelsForDatabaseChannel:v6 databaseContext:a4];
  if ([v7 count] != 1)
  {
    id v8 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SKADatabaseManager _existingPersonalChannelForDatabaseChannel:databaseContext:](v6, v8);
    }
  }
  uint64_t v9 = [v7 firstObject];

  return v9;
}

- (id)_existingChannelsForChannelIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  BOOL v6 = a4;
  v23[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[Channel fetchRequest];
  id v10 = (void *)MEMORY[0x263F08730];
  id v11 = +[Channel predicateForChannelIdentifier:v7];
  v23[0] = v11;
  id v12 = +[Channel predicateForPersonal:v6];
  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  id v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  id v20 = 0;
  id v15 = [v8 executeFetchRequest:v9 error:&v20];

  id v16 = v20;
  if (v16)
  {
    uint64_t v17 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:]();
    }
  }
  if (v15)
  {
    if ([v15 count]) {
      goto LABEL_13;
    }
    BOOL v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by identifier %@ found no match.", buf, 0xCu);
    }
  }
  else
  {
    BOOL v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:]();
    }
    id v15 = (void *)MEMORY[0x263EFFA68];
  }

LABEL_13:
  return v15;
}

- (id)_existingChannelsForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[Channel fetchRequest];
  id v8 = (void *)MEMORY[0x263F08730];
  uint64_t v9 = +[Channel predicateForChannelIdentifier:v5];
  v20[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v11 = [v8 andPredicateWithSubpredicates:v10];
  [v7 setPredicate:v11];

  id v17 = 0;
  id v12 = [v6 executeFetchRequest:v7 error:&v17];

  id v13 = v17;
  if (v13)
  {
    id v14 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:]();
    }
  }
  if (v12)
  {
    if ([v12 count]) {
      goto LABEL_13;
    }
    id v15 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by identifier %@ found no match.", buf, 0xCu);
    }
  }
  else
  {
    id v15 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:databaseContext:]();
    }
    id v12 = (void *)MEMORY[0x263EFFA68];
  }

LABEL_13:
  return v12;
}

- (id)_existingChannelsForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  BOOL v6 = a4;
  v38[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a5;
  id v8 = +[Channel fetchRequest];
  uint64_t v9 = (void *)MEMORY[0x263F08730];
  id v10 = +[Channel predicateForPresenceIdentifier:v7];
  v38[0] = v10;
  id v11 = +[Channel predicateForDecomissioned:0];
  v38[1] = v11;
  id v12 = +[Channel predicateForChannelTypePresence];
  v38[2] = v12;
  id v13 = +[Channel predicateForPersonal:v6];
  v38[3] = v13;
  id v14 = +[Channel predicateForCreationDateNotNil];
  v38[4] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:5];
  id v16 = [v9 andPredicateWithSubpredicates:v15];
  [v8 setPredicate:v16];

  id v17 = v8;
  BOOL v18 = +[Channel sortDescriptorForCreationDateAscending:0];
  v37 = v18;
  id v19 = v7;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  [v17 setSortDescriptors:v20];

  uint64_t v21 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = (uint64_t)v7;
    _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for channels with presence identifier: %@", buf, 0xCu);
  }

  id v34 = 0;
  id v22 = [v33 executeFetchRequest:v17 error:&v34];

  id v23 = v34;
  if (v23)
  {
    id v24 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:]();
    }
  }
  if (v22)
  {
    uint64_t v25 = [v22 count];
    id v26 = +[SKADatabaseManager logger];
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (!v27) {
        goto LABEL_17;
      }
      uint64_t v28 = [v22 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v28;
      id v29 = "Fetch request for channel by identifier completed with %ld result(s)";
      __int16 v30 = v26;
      uint32_t v31 = 12;
    }
    else
    {
      if (!v27) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      id v29 = "Fetch request for channel by identifier found no match.";
      __int16 v30 = v26;
      uint32_t v31 = 2;
    }
    _os_log_impl(&dword_22480C000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
  }
  else
  {
    id v26 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:]();
    }
    id v22 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_17:

  return v22;
}

- (id)existingChannelForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingReceivedInvitationsForHandle:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  uint64_t v3 = [v2 firstObject];
  char v4 = v3;
  if (v3)
  {
    id v5 = [v3 invitationIdentifier];
    BOOL v6 = [v4 senderHandle];
    id v7 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = [v2 count];
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Preferring invitation %@ from %@ among %ld result(s)", (uint8_t *)&v17, 0x20u);
    }

    id v8 = [v4 channel];
    id v9 = [v8 identifier];

    uint64_t v10 = [v9 length];
    id v11 = +[SKADatabaseManager logger];
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Invitation %@ corresponds to channelIdentifier: %@", (uint8_t *)&v17, 0x16u);
      }

      id v12 = [*(id *)(a1 + 32) _existingChannelsForChannelIdentifier:v9 databaseContext:*(void *)(a1 + 56)];
      if ([v12 count])
      {
        id v13 = [[SKADatabaseChannel alloc] initWithCoreDataChannels:v12];
        uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
        id v15 = *(NSObject **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
      else
      {
        id v15 = +[SKADatabaseManager logger];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();
        }
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    goto LABEL_17;
  }
  id v5 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [*(id *)(a1 + 40) handleString];
    id v16 = *(NSObject **)(a1 + 48);
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "No received invitation found matching handle %@ statusTypeIdentifier: %@", (uint8_t *)&v17, 0x16u);
LABEL_17:
  }
}

- (id)allExistingChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__SKADatabaseManager_allExistingChannelsForHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  uint64_t v14 = (void *)[(id)v22[5] copy];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __88__SKADatabaseManager_allExistingChannelsForHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingReceivedInvitationsForHandle:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  context = (void *)MEMORY[0x22A619D40]();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = [v9 channel];
        id v11 = [v10 identifier];

        [*(id *)(a1 + 56) refreshObject:v9 mergeChanges:0];
        if ([v11 length])
        {
          [v3 addObject:v11];
        }
        else
        {
          id v12 = +[SKADatabaseManager logger];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            id v33 = v9;
            __int16 v34 = 2112;
            uint64_t v35 = v13;
            _os_log_error_impl(&dword_22480C000, v12, OS_LOG_TYPE_ERROR, "Invitation does not correspond to any channel. ReceivedInvitation: %@ handle: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        id v20 = [*(id *)(a1 + 32) _existingChannelsForChannelIdentifier:v19 databaseContext:*(void *)(a1 + 56)];
        if ([v20 count])
        {
          uint64_t v21 = [[SKADatabaseChannel alloc] initWithCoreDataChannels:v20];
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v21];
        }
        else
        {
          uint64_t v21 = +[SKADatabaseManager logger];
          if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v19;
            _os_log_error_impl(&dword_22480C000, &v21->super, OS_LOG_TYPE_ERROR, "Channel not found for channel identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
}

- (id)allExistingChannelsForStatusTypeIdentifier:(id)a3 includingPersonalChannel:(BOOL)a4 databaseContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__2;
  long long v25 = __Block_byref_object_dispose__2;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke;
  uint64_t v16 = &unk_2646E2078;
  id v9 = v7;
  id v17 = v9;
  BOOL v20 = a4;
  id v10 = v8;
  id v18 = v10;
  id v19 = &v21;
  [v10 performBlockAndWait:&v13];
  id v11 = objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  v51[3] = *MEMORY[0x263EF8340];
  v2 = +[Channel fetchRequest];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = +[Channel predicateForStatusTypeIdentifier:*(void *)(a1 + 32)];
  [v3 addObject:v4];

  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = +[Channel predicateForPersonal:0];
    [v3 addObject:v5];
  }
  if ((unint64_t)[v3 count] <= 1) {
    [v3 firstObject];
  }
  else {
  uint64_t v6 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v3];
  }
  [v2 setPredicate:v6];
  id v7 = +[Channel sortDescriptorForStatusTypeIdentifierOrderedAscending:1];
  v51[0] = v7;
  id v8 = +[Channel sortDescriptorForPersonalOrderedAscending:0];
  v51[1] = v8;
  id v9 = +[Channel sortDescriptorForChannelIdentifierOrderedAscending:1];
  v51[2] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
  [v2 setSortDescriptors:v10];

  id v11 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for channel by handle", buf, 2u);
  }

  id v12 = *(void **)(a1 + 40);
  id v46 = 0;
  uint64_t v13 = [v12 executeFetchRequest:v2 error:&v46];
  id v14 = v46;
  if (v14)
  {
    uint64_t v15 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v16 = [v13 count];
    uint64_t v15 = +[SKADatabaseManager logger];
    BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      uint64_t v35 = v6;
      id v36 = v3;
      uint64_t v37 = v2;
      if (v17)
      {
        uint64_t v18 = [v13 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v50 = v18;
        _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by handle completed with %ld result(s)", buf, 0xCu);
      }

      uint64_t v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      context = (void *)MEMORY[0x22A619D40]();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      __int16 v34 = v13;
      id v19 = v13;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            long long v25 = objc_msgSend(v24, "identifier", context);
            if ([v25 length])
            {
              id v26 = [v15 objectForKeyedSubscript:v25];
              if (!v26)
              {
                id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v15 setObject:v26 forKeyedSubscript:v25];
              }
              [v26 addObject:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v21);
      }

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v27 = [v15 allValues];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v47 count:16];
      uint64_t v6 = v35;
      id v14 = 0;
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [[SKADatabaseChannel alloc] initWithCoreDataChannels:*(void *)(*((void *)&v38 + 1) + 8 * j)];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v29);
      }

      id v3 = v36;
      v2 = v37;
      uint64_t v13 = v34;
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by handle found no match.", buf, 2u);
    }
  }
}

- (id)createPersonalChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 databaseContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  uint32_t v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke;
  v21[3] = &unk_2646E2050;
  id v14 = v13;
  id v22 = v14;
  id v15 = v10;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v26 = &v27;
  [v14 performBlockAndWait:v21];
  uint64_t v18 = [(SKADatabaseManager *)self delegate];
  [v18 databaseManager:self didCreateChannel:v28[5]];

  id v19 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke(void *a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [[Channel alloc] initWithContext:a1[4]];
  [(Channel *)v2 setStatusType:a1[5]];
  [(Channel *)v2 setChannelType:0];
  [(Channel *)v2 setDecomissioned:0];
  [(Channel *)v2 setPersonal:1];
  [(Channel *)v2 setIdentifier:a1[6]];
  [(Channel *)v2 setChannelToken:a1[7]];
  id v3 = [MEMORY[0x263EFF910] now];
  [(Channel *)v2 setDateChannelCreated:v3];
  id v4 = (void *)a1[4];
  id v12 = 0;
  [v4 save:&v12];
  id v5 = v12;
  if (v5)
  {
    uint64_t v6 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke_cold_1();
    }
  }
  id v7 = [SKADatabaseChannel alloc];
  v13[0] = v2;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  uint64_t v9 = [(SKADatabaseChannel *)v7 initWithCoreDataChannels:v8];
  uint64_t v10 = *(void *)(a1[8] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)createPresenceChannelForPresenceIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 peerKey:(id)a6 serverKey:(id)a7 membershipKey:(id)a8 creationDate:(id)a9 options:(id)a10 databaseContext:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v36 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  id v54 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke;
  v38[3] = &unk_2646E20A0;
  id v24 = v23;
  id v39 = v24;
  id v35 = v16;
  id v40 = v35;
  id v25 = v17;
  id v41 = v25;
  id v26 = v18;
  id v42 = v26;
  id v27 = v21;
  id v43 = v27;
  id v28 = v19;
  id v44 = v28;
  id v29 = v20;
  id v45 = v29;
  id v30 = v36;
  id v46 = v30;
  id v31 = v22;
  id v47 = v31;
  v48 = &v49;
  [v24 performBlockAndWait:v38];
  id v32 = [(SKADatabaseManager *)self delegate];
  [v32 databaseManager:self didCreateChannel:v50[5]];

  id v33 = (id)v50[5];
  _Block_object_dispose(&v49, 8);

  return v33;
}

void __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [[Channel alloc] initWithContext:*(void *)(a1 + 32)];
  [(Channel *)v2 setPresenceIdentifier:*(void *)(a1 + 40)];
  [(Channel *)v2 setChannelType:1];
  [(Channel *)v2 setDecomissioned:0];
  [(Channel *)v2 setIdentifier:*(void *)(a1 + 48)];
  [(Channel *)v2 setChannelToken:*(void *)(a1 + 56)];
  [(Channel *)v2 setDateChannelCreated:*(void *)(a1 + 64)];
  [(Channel *)v2 setPeerKey:*(void *)(a1 + 72)];
  [(Channel *)v2 setServerKey:*(void *)(a1 + 80)];
  [(Channel *)v2 setMembershipKey:*(void *)(a1 + 88)];
  -[Channel setPersonal:](v2, "setPersonal:", [*(id *)(a1 + 96) isPersonal]);
  id v3 = [*(id *)(a1 + 96) serviceIdentifier];
  [(Channel *)v2 setServiceIdentifier:v3];

  id v4 = *(void **)(a1 + 32);
  id v12 = 0;
  [v4 save:&v12];
  id v5 = v12;
  if (v5)
  {
    uint64_t v6 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke_cold_1();
    }
  }
  id v7 = [SKADatabaseChannel alloc];
  v13[0] = v2;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  uint64_t v9 = [(SKADatabaseChannel *)v7 initWithCoreDataChannels:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 104) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)createChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke;
  id v20 = &unk_2646E2000;
  id v11 = v10;
  id v21 = v11;
  id v12 = v8;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  id v24 = &v25;
  [v11 performBlockAndWait:&v17];
  id v14 = [(SKADatabaseManager *)self delegate];
  [v14 databaseManager:self didCreateChannel:v26[5]];

  id v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke(void *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [[Channel alloc] initWithContext:a1[4]];
  [(Channel *)v2 setStatusType:a1[5]];
  [(Channel *)v2 setChannelType:0];
  [(Channel *)v2 setPersonal:0];
  [(Channel *)v2 setDecomissioned:0];
  [(Channel *)v2 setIdentifier:a1[6]];
  id v3 = (void *)a1[4];
  id v11 = 0;
  [v3 save:&v11];
  id v4 = v11;
  if (v4)
  {
    id v5 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  uint64_t v6 = [SKADatabaseChannel alloc];
  v12[0] = v2;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v8 = [(SKADatabaseChannel *)v6 initWithCoreDataChannels:v7];
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)updatePersonalChannel:(id)a3 withCurrentOutgoingRatchetState:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v20 = &v21;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  [v2 setCurrentOutgoingRatchetState:*(void *)(a1 + 56)];
  id v3 = *(void **)(a1 + 48);
  id v11 = 0;
  [v3 save:&v11];
  id v4 = v11;
  if (v4)
  {
    id v5 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke_cold_1();
    }
  }
  uint64_t v6 = [SKADatabaseChannel alloc];
  v12[0] = v2;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v8 = [(SKADatabaseChannel *)v6 initWithCoreDataChannels:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (BOOL)decomissionAllPersonalChannelsWithStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelsForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v6++) setDecomissioned:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  id v7 = *(void **)(a1 + 48);
  id v10 = 0;
  [v7 save:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)decomissionChannelWithIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__SKADatabaseManager_decomissionChannelWithIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  long long v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __71__SKADatabaseManager_decomissionChannelWithIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingChannelsForChannelIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v6++) setDecomissioned:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  id v7 = *(void **)(a1 + 48);
  id v10 = 0;
  [v7 save:&v10];
  id v8 = v10;
  if (v8)
  {
    id v9 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __115__SKADatabaseManager_createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState_personalChannel_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v20 = &v21;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __115__SKADatabaseManager_createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState_personalChannel_databaseContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  [v2 setCurrentOutgoingRatchetState:*(void *)(a1 + 56)];
  uint64_t v3 = [[GeneratedEncryptionKey alloc] initWithContext:*(void *)(a1 + 48)];
  [(GeneratedEncryptionKey *)v3 setOriginalOutgoingRatchetState:*(void *)(a1 + 56)];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  [(GeneratedEncryptionKey *)v3 setDateGenerated:v4];

  [v2 addGeneratedEncryptionKeysObject:v3];
  uint64_t v5 = *(void **)(a1 + 48);
  id v11 = 0;
  [v5 save:&v11];
  id v6 = v11;
  if (v6)
  {
    id v7 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  id v8 = [[SKAGeneratedEncryptionKey alloc] initWithCoreDataGeneratedEncryptionKey:v3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)generatedEncryptionKeysForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke;
  id v17 = &unk_2646E20C8;
  id v18 = self;
  id v19 = v6;
  id v20 = v7;
  id v21 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [v10 performBlockAndWait:&v14];
  id v12 = objc_msgSend(v9, "copy", v14, v15, v16, v17, v18);

  return v12;
}

void __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 generatedEncryptionKeys];
    uint64_t v5 = (void *)MEMORY[0x263F08B30];
    id v6 = +[GeneratedEncryptionKey dateGeneratedKeyPath];
    id v7 = [v5 sortDescriptorWithKey:v6 ascending:0];

    v23[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v9 = [v4 sortedArrayUsingDescriptors:v8];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [SKAGeneratedEncryptionKey alloc];
          id v17 = -[SKAGeneratedEncryptionKey initWithCoreDataGeneratedEncryptionKey:](v16, "initWithCoreDataGeneratedEncryptionKey:", v15, (void)v18);
          if (v17) {
            [*(id *)(a1 + 56) addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v4 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke_cold_1();
    }
  }
}

- (id)allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke;
  uint64_t v12 = &unk_2646E1B98;
  id v13 = v3;
  id v14 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 performBlockAndWait:&v9];
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = +[SubscriptionAssertion fetchRequest];
  id v3 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for active subscription assertions", buf, 2u);
  }

  id v4 = *(void **)(a1 + 32);
  id v20 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v20];
  id v6 = v20;
  id v7 = +[SKADatabaseManager logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for active subscription assertions completed", buf, 2u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "channelIdentifier", (void)v16);
        [*(id *)(a1 + 32) refreshObject:v14 mergeChanges:0];
        if ([v15 length]) {
          [*(id *)(a1 + 40) addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)_existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[SubscriptionAssertion fetchRequest];
  uint64_t v11 = (void *)MEMORY[0x263F08730];
  uint64_t v12 = +[SubscriptionAssertion predicateForChannelIdentifier:v9];

  v22[0] = v12;
  id v13 = +[SubscriptionAssertion predicateForApplicationIdentifier:v8];

  v22[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  uint64_t v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  [v10 setFetchLimit:1];
  id v21 = 0;
  long long v16 = [v7 executeFetchRequest:v10 error:&v21];

  id v17 = v21;
  if (v17)
  {
    long long v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();
    }
  }
  long long v19 = [v16 firstObject];

  return v19;
}

- (id)existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __115__SKADatabaseManager_existingSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __115__SKADatabaseManager_existingSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _existingSubscriptionAssertionForSubscriptionIdentifier:*(void *)(a1 + 40) applicationIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  if (v5)
  {
    v2 = [[SKADatabaseSubscriptionAssertion alloc] initWithCoreDataSubscriptionAssertion:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __114__SKADatabaseManager_existingSubscriptionAssertionsForStatusTypeIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __114__SKADatabaseManager_existingSubscriptionAssertionsForStatusTypeIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingSubscriptionAssertionsForStatusTypeIdentifier:*(void *)(a1 + 40) applicationIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id v10 = [SKADatabaseSubscriptionAssertion alloc];
        id v11 = -[SKADatabaseSubscriptionAssertion initWithCoreDataSubscriptionAssertion:](v10, "initWithCoreDataSubscriptionAssertion:", v9, (void)v15);
        [*(id *)(a1 + 56) refreshObject:v9 mergeChanges:0];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)_existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SubscriptionAssertion fetchRequest];
  id v11 = (void *)MEMORY[0x263F08730];
  uint64_t v12 = +[SubscriptionAssertion predicateForStatusTypeIdentifier:v9];

  v21[0] = v12;
  uint64_t v13 = +[SubscriptionAssertion predicateForApplicationIdentifier:v8];

  v21[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  long long v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  [v10 setFetchLimit:1];
  id v20 = 0;
  long long v16 = [v7 executeFetchRequest:v10 error:&v20];

  id v17 = v20;
  if (v17)
  {
    long long v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();
    }
  }
  return v16;
}

- (id)createSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_2646E2050;
  id v13 = v12;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v24 = &v25;
  [v13 performBlockAndWait:v19];
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke(void *a1)
{
  v2 = [[SubscriptionAssertion alloc] initWithContext:a1[4]];
  [(SubscriptionAssertion *)v2 setChannelIdentifier:a1[5]];
  [(SubscriptionAssertion *)v2 setApplicationIdentifier:a1[6]];
  [(SubscriptionAssertion *)v2 setStatusTypeIdentifier:a1[7]];
  id v3 = (void *)a1[4];
  id v9 = 0;
  [v3 save:&v9];
  id v4 = v9;
  if (v4)
  {
    uint64_t v5 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  uint64_t v6 = [[SKADatabaseSubscriptionAssertion alloc] initWithCoreDataSubscriptionAssertion:v2];
  uint64_t v7 = *(void *)(a1[8] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)deleteSubscriptionAssertionWithSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v19 = &v20;
  [v13 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _existingSubscriptionAssertionForSubscriptionIdentifier:*(void *)(a1 + 40) applicationIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  if (v2)
  {
    [*(id *)(a1 + 56) deleteObject:v2];
    id v3 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deleted existing assertion.", v5, 2u);
    }
    char v4 = 1;
  }
  else
  {
    id v3 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke_cold_1();
    }
    char v4 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v4;
}

- (id)_existingTransientSubscriptionHistoryForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[TransientSubscriptionHistory fetchRequest];
  id v8 = (void *)MEMORY[0x263F08730];
  id v9 = +[TransientSubscriptionHistory predicateForChannelIdentifier:v6];

  v18[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  id v11 = [v8 andPredicateWithSubpredicates:v10];
  [v7 setPredicate:v11];

  [v7 setFetchLimit:1];
  id v17 = 0;
  id v12 = [v5 executeFetchRequest:v7 error:&v17];

  id v13 = v17;
  if (v13)
  {
    id v14 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingTransientSubscriptionHistoryForChannelIdentifier:databaseContext:]();
    }
  }
  id v15 = [v12 firstObject];

  return v15;
}

- (id)_existingTransientSubscriptionHistoryWithLimit:(int64_t)a3 orderedByLastSubscriptionDateAscending:(BOOL)a4 databaseContext:(id)a5
{
  BOOL v5 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = +[TransientSubscriptionHistory fetchRequest];
  id v9 = +[TransientSubscriptionHistory sortDescriptorForLastSubscriptionDateAscending:v5];
  v16[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v8 setSortDescriptors:v10];

  [v8 setFetchLimit:a3];
  id v15 = 0;
  id v11 = [v7 executeFetchRequest:v8 error:&v15];

  id v12 = v15;
  if (v12)
  {
    id v13 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingTransientSubscriptionHistoryWithLimit:orderedByLastSubscriptionDateAscending:databaseContext:]();
    }
  }
  return v11;
}

- (id)createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  uint64_t v20 = &v21;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _existingTransientSubscriptionHistoryForChannelIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  id v3 = +[SKADatabaseManager logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Found existing transient subscription history. Updating lastSubscrionDate.", buf, 2u);
    }

    [v2 setLastSubscriptionDate:*(void *)(a1 + 56)];
    BOOL v5 = *(void **)(a1 + 48);
    id v17 = 0;
    [v5 save:&v17];
    id v6 = (TransientSubscriptionHistory *)v17;
    if (v6)
    {
      id v7 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1();
      }
    }
    id v8 = [[SKADatabaseTransientSubscriptionHistory alloc] initWithCoreDataTransientSubscriptionHistory:v2];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Could not find existing transient subscription history. Creating a new one.", buf, 2u);
    }

    id v6 = [[TransientSubscriptionHistory alloc] initWithContext:*(void *)(a1 + 48)];
    [(TransientSubscriptionHistory *)v6 setChannelIdentifier:*(void *)(a1 + 40)];
    [(TransientSubscriptionHistory *)v6 setLastSubscriptionDate:*(void *)(a1 + 56)];
    id v11 = *(void **)(a1 + 48);
    id v16 = 0;
    [v11 save:&v16];
    id v10 = v16;
    if (v10)
    {
      id v12 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1();
      }
    }
    id v13 = [[SKADatabaseTransientSubscriptionHistory alloc] initWithCoreDataTransientSubscriptionHistory:v6];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)existingRecentTransientSubscriptionHistoriesWithLimit:(int64_t)a3 databaseContext:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__SKADatabaseManager_existingRecentTransientSubscriptionHistoriesWithLimit_databaseContext___block_invoke;
  v10[3] = &unk_2646E20F0;
  v10[4] = self;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  id v12 = &v14;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __92__SKADatabaseManager_existingRecentTransientSubscriptionHistoriesWithLimit_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingTransientSubscriptionHistoryWithLimit:*(void *)(a1 + 56) orderedByLastSubscriptionDateAscending:0 databaseContext:*(void *)(a1 + 40)];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id v10 = [SKADatabaseTransientSubscriptionHistory alloc];
        id v11 = -[SKADatabaseTransientSubscriptionHistory initWithCoreDataTransientSubscriptionHistory:](v10, "initWithCoreDataTransientSubscriptionHistory:", v9, (void)v15);
        [*(id *)(a1 + 40) refreshObject:v9 mergeChanges:0];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)createInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 invitationPayload:(id)a5 channel:(id)a6 databaseContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__2;
  id v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke;
  v24[3] = &unk_2646E2118;
  id v17 = v13;
  id v25 = v17;
  id v18 = v12;
  id v26 = v18;
  uint64_t v27 = self;
  id v19 = v15;
  id v28 = v19;
  id v20 = v16;
  id v29 = v20;
  id v21 = v14;
  id v30 = v21;
  id v31 = &v32;
  [v20 performBlockAndWait:v24];
  id v22 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) normalizedHandleString];
  id v3 = [*(id *)(a1 + 40) normalizedHandleString];
  id v4 = [*(id *)(a1 + 48) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 56) databaseContext:*(void *)(a1 + 64)];
  if (v4)
  {
    uint64_t v5 = [[InvitedUser alloc] initWithContext:*(void *)(a1 + 64)];
    [(InvitedUser *)v5 setInvitedHandle:v3];
    uint64_t v6 = [*(id *)(a1 + 72) payloadData];
    [(InvitedUser *)v5 setInvitationPayload:v6];

    uint64_t v7 = [*(id *)(a1 + 72) dateCreated];
    [(InvitedUser *)v5 setDateInvitationPayloadCreated:v7];

    [(InvitedUser *)v5 setSenderHandle:v2];
    [v4 addInvitedUsersObject:v5];
    uint64_t v8 = *(void **)(a1 + 64);
    id v14 = 0;
    [v8 save:&v14];
    id v9 = v14;
    if (v9)
    {
      id v10 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke_cold_1();
      }
    }
    id v11 = [[SKADatabaseInvitedUser alloc] initWithCoreDataInvitedUser:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (BOOL)copyInvitedUsersFromChannel:(id)a3 toChannel:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v19 = &v20;
  [v12 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 56) databaseContext:*(void *)(a1 + 48)];
  id v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    id v21 = v2;
    uint64_t v6 = [v2 invitedUsers];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v12 = [[InvitedUser alloc] initWithContext:*(void *)(a1 + 48)];
          id v13 = [v11 invitedHandle];
          [(InvitedUser *)v12 setInvitedHandle:v13];

          id v14 = [v11 invitationPayload];
          [(InvitedUser *)v12 setInvitationPayload:v14];

          id v15 = [v11 dateInvitationPayloadCreated];
          [(InvitedUser *)v12 setDateInvitationPayloadCreated:v15];

          id v16 = [v11 senderHandle];
          [(InvitedUser *)v12 setSenderHandle:v16];

          [v4 addInvitedUsersObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
    id v17 = *(void **)(a1 + 48);
    id v22 = 0;
    [v17 save:&v22];
    id v18 = v22;
    if (v18)
    {
      id v19 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke_cold_1();
      }

      char v20 = 0;
    }
    else
    {
      char v20 = 1;
    }
    v2 = v21;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20;
  }
}

- (id)updateInvitationPayload:(id)a3 onExistingInvitedUser:(id)a4 channel:(id)a5 databaseContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2;
  id v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke;
  v20[3] = &unk_2646E2140;
  v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  id v17 = v10;
  id v24 = v17;
  long long v25 = &v26;
  [v16 performBlockAndWait:v20];
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) _existingInvitedUsersForDatabaseInvitedUser:*(void *)(a1 + 40) databaseChannel:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] >= 2)
    {
      id v4 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_3(v3, v2, v4);
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
          id v11 = [*(id *)(a1 + 64) payloadData];
          [v10 setInvitationPayload:v11];

          id v12 = [*(id *)(a1 + 64) dateCreated];
          [v10 setDateInvitationPayloadCreated:v12];

          id v13 = [[SKADatabaseInvitedUser alloc] initWithCoreDataInvitedUser:v10];
          uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
          id v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    id v16 = *(void **)(a1 + 56);
    id v19 = 0;
    [v16 save:&v19];
    id v17 = v19;
    if (v17)
    {
      id v18 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v17 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_1();
    }
  }
}

- (id)existingInvitedUsersForInvitedHandle:(id)a3 onChannel:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __85__SKADatabaseManager_existingInvitedUsersForInvitedHandle_onChannel_databaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  long long v20 = &v21;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __85__SKADatabaseManager_existingInvitedUsersForInvitedHandle_onChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _existingInvitedUsersForInvitedHandle:*(void *)(a1 + 56) channel:v2 databaseContext:*(void *)(a1 + 48)];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
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
          id v11 = [SKADatabaseInvitedUser alloc];
          id v12 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:](v11, "initWithCoreDataInvitedUser:", v10, (void)v16);
          [*(id *)(a1 + 48) refreshObject:v10 mergeChanges:0];
          if (v12) {
            [v4 addObject:v12];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v13 = [v4 copy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)existingInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__2;
  long long v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = [v2 invitedUsers];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [[SKADatabaseInvitedUser alloc] initWithCoreDataInvitedUser:v9];
          [*(id *)(a1 + 48) refreshObject:v9 mergeChanges:0];
          [v3 addObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    uint64_t v11 = [v3 copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v3 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_1();
    }
  }
}

- (id)_existingInvitedUsersForDatabaseInvitedUser:(id)a3 databaseChannel:(id)a4 databaseContext:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SKADatabaseManager *)self _existingPersonalChannelForDatabaseChannel:a4 databaseContext:v8];
  uint64_t v11 = [v9 invitedHandle];
  uint64_t v12 = [v9 senderHandle];

  id v13 = +[InvitedUser fetchRequest];
  long long v14 = (void *)MEMORY[0x263F08730];
  long long v15 = +[InvitedUser predicateForInvitedHandle:v11];
  v28[0] = v15;
  long long v16 = +[InvitedUser predicateForSenderHandle:v12];
  v28[1] = v16;
  long long v17 = +[InvitedUser predicateForChannel:v10];
  v28[2] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  uint64_t v19 = [v14 andPredicateWithSubpredicates:v18];
  [v13 setPredicate:v19];

  id v25 = 0;
  long long v20 = [v8 executeFetchRequest:v13 error:&v25];

  id v21 = v25;
  long long v22 = +[SKADatabaseManager logger];
  uint64_t v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:]();
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v20;
    _os_log_impl(&dword_22480C000, v23, OS_LOG_TYPE_DEFAULT, "Fetch request for invited user executed with results: %@", buf, 0xCu);
  }

  return v20;
}

- (id)_existingInvitedUsersForInvitedHandle:(id)a3 channel:(id)a4 databaseContext:(id)a5
{
  v25[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 normalizedHandleString];
  if ([v10 length])
  {
    uint64_t v11 = +[InvitedUser fetchRequest];
    uint64_t v12 = (void *)MEMORY[0x263F08730];
    id v13 = +[InvitedUser predicateForInvitedHandle:v10];
    v25[0] = v13;
    long long v14 = +[InvitedUser predicateForChannel:v8];
    v25[1] = v14;
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    long long v16 = [v12 andPredicateWithSubpredicates:v15];
    [v11 setPredicate:v16];

    id v22 = 0;
    long long v17 = [v9 executeFetchRequest:v11 error:&v22];
    id v18 = v22;
    uint64_t v19 = +[SKADatabaseManager logger];
    long long v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SKADatabaseManager _existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:]();
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "Fetch request for invited user executed with results: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingInvitedUsersForInvitedHandle:channel:databaseContext:](v7, v11);
    }
    long long v17 = 0;
  }

  return v17;
}

- (BOOL)deleteInvitedUserForHandle:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  uint64_t v19 = &v20;
  [v12 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _existingInvitedUsersForInvitedHandle:*(void *)(a1 + 56) channel:v2 databaseContext:*(void *)(a1 + 48)];
    if ([v3 count])
    {
      id v18 = v3;
      uint64_t v19 = v2;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v22 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            id v10 = +[SKADatabaseManager logger];
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v11;
              _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Deleting existing invited user with handle: %@", buf, 0xCu);
            }

            [*(id *)(a1 + 48) deleteObject:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v6);
      }

      id v12 = *(void **)(a1 + 48);
      id v20 = 0;
      [v12 save:&v20];
      id v13 = v20;
      if (v13)
      {
        long long v14 = +[SKADatabaseManager logger];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3();
        }

        char v15 = 0;
      }
      else
      {
        char v15 = 1;
      }
      uint64_t v3 = v18;
      uint64_t v2 = v19;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;
    }
    else
    {
      id v17 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    id v16 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)deleteInvitedUserForHandle:(id)a3 presenceChannel:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__SKADatabaseManager_deleteInvitedUserForHandle_presenceChannel_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v9;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  uint64_t v19 = &v20;
  [v12 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_presenceChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingChannelsForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if ([v2 count])
  {
    uint64_t v3 = [v2 firstObject];
    id v4 = [*(id *)(a1 + 32) _existingInvitedUsersForInvitedHandle:*(void *)(a1 + 56) channel:v3 databaseContext:*(void *)(a1 + 48)];
    if ([v4 count])
    {
      uint64_t v20 = v2;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v19 = v4;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v23 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            id v11 = +[SKADatabaseManager logger];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v12;
              _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Deleting existing invited user with handle: %@", buf, 0xCu);
            }

            [*(id *)(a1 + 48) deleteObject:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v7);
      }

      id v13 = *(void **)(a1 + 48);
      id v21 = 0;
      [v13 save:&v21];
      id v14 = v21;
      if (v14)
      {
        char v15 = +[SKADatabaseManager logger];
        id v4 = v19;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3();
        }

        char v16 = 0;
        uint64_t v2 = v20;
      }
      else
      {
        char v16 = 1;
        uint64_t v2 = v20;
        id v4 = v19;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v16;
    }
    else
    {
      id v18 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    id v17 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (BOOL)deleteAllInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPersonalChannelForDatabaseChannel:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 invitedUsers];
    uint64_t v5 = [v4 count];
    id v6 = +[SKADatabaseManager logger];
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v4 count];
        id v9 = [v3 identifier];
        *(_DWORD *)buf = 134218242;
        uint64_t v27 = v8;
        __int16 v28 = 2112;
        uint64_t v29 = v9;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Deleting all %ld existing invited users for channel %@", buf, 0x16u);
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(a1 + 48) deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }

      uint64_t v15 = *(void **)(a1 + 48);
      id v20 = 0;
      [v15 save:&v20];
      id v16 = v20;
      if (v16)
      {
        uint64_t v17 = +[SKADatabaseManager logger];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_3();
        }

        char v18 = 0;
      }
      else
      {
        char v18 = 1;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v19 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)createStatusWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 channelIdentifier:(id)a9 databaseContext:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__2;
  id v47 = __Block_byref_object_dispose__2;
  id v48 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke;
  v33[3] = &unk_2646E2168;
  id v23 = v22;
  id v34 = v23;
  id v24 = v15;
  id v35 = v24;
  id v25 = v21;
  id v36 = v25;
  id v26 = v16;
  id v37 = v26;
  id v27 = v17;
  id v38 = v27;
  id v28 = v18;
  id v39 = v28;
  id v29 = v20;
  id v40 = v29;
  id v30 = v19;
  id v41 = v30;
  id v42 = &v43;
  [v23 performBlockAndWait:v33];
  id v31 = (id)v44[5];

  _Block_object_dispose(&v43, 8);
  return v31;
}

void __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke(void *a1)
{
  uint64_t v2 = [[Status alloc] initWithContext:a1[4]];
  [(Status *)v2 setUniqueIdentifier:a1[5]];
  [(Status *)v2 setChannelIdentifier:a1[6]];
  [(Status *)v2 setDateCreated:a1[7]];
  [(Status *)v2 setDatePublished:a1[8]];
  [(Status *)v2 setDateReceived:a1[9]];
  [(Status *)v2 setRawData:a1[10]];
  [(Status *)v2 setDateExpired:a1[11]];
  uint64_t v3 = (void *)a1[4];
  id v9 = 0;
  [v3 save:&v9];
  id v4 = v9;
  if (v4)
  {
    uint64_t v5 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  id v6 = [[SKADatabaseStatus alloc] initWithCoreDataStatus:v2];
  uint64_t v7 = *(void *)(a1[12] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)existingStatusForChannel:(id)a3 databaseContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke;
  v11[3] = &unk_2646E2190;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[Status fetchRequest];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  id v4 = +[Status predicateForChannelIdentifier:v3];
  [v2 setPredicate:v4];

  id v5 = +[Status sortDescriptorForDateCreatedAscending:0];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v2 setSortDescriptors:v6];

  [v2 setFetchLimit:1];
  id v7 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Beginning lookup of most recent status for channel", buf, 2u);
  }

  id v8 = *(void **)(a1 + 40);
  id v20 = 0;
  id v9 = [v8 executeFetchRequest:v2 error:&v20];
  id v10 = v20;
  if (v10)
  {
    uint64_t v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke_cold_1();
    }
LABEL_6:

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
    goto LABEL_11;
  }
  uint64_t v14 = [v9 count];
  uint64_t v11 = +[SKADatabaseManager logger];
  BOOL v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status by channel found no match.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v15)
  {
    uint64_t v16 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v16;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status by channel completed with %ld result(s)", buf, 0xCu);
  }

  id v13 = [v9 firstObject];
  uint64_t v17 = [[SKADatabaseStatus alloc] initWithCoreDataStatus:v13];
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

LABEL_11:
}

- (id)existingStatusForUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2190;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[Status fetchRequest];
  uint64_t v3 = +[Status predicateForStatusUniqueIdentifier:a1[4]];
  [v2 setPredicate:v3];

  [v2 setFetchLimit:1];
  id v4 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Beginning lookup of most recent status for unique id", buf, 2u);
  }

  id v5 = (void *)a1[5];
  id v17 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v17];
  id v7 = v17;
  if (v7)
  {
    id v8 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke_cold_1();
    }
LABEL_6:

    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
    goto LABEL_11;
  }
  uint64_t v11 = [v6 count];
  id v8 = +[SKADatabaseManager logger];
  BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for status by unique id found no match.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v12)
  {
    uint64_t v13 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v13;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for status by unique id completed with %ld result(s)", buf, 0xCu);
  }

  id v10 = [v6 firstObject];
  uint64_t v14 = [[SKADatabaseStatus alloc] initWithCoreDataStatus:v10];
  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_11:
}

- (unint64_t)currentCheckpointForChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __66__SKADatabaseManager_currentCheckpointForChannel_databaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  [v9 performBlockAndWait:v12];
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __66__SKADatabaseManager_currentCheckpointForChannel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 _existingChannelCheckpointForChannelIdentifier:v3 databaseContext:*(void *)(a1 + 48)];

  id v5 = +[SKADatabaseManager logger];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = [v4 checkpoint];
      id v8 = [*(id *)(a1 + 40) identifier];
      int v10 = 134218242;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Found existing checkpoint %lld for channel %@", (uint8_t *)&v10, 0x16u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 checkpoint];
  }
  else
  {
    if (v6)
    {
      id v9 = [*(id *)(a1 + 40) identifier];
      int v10 = 138412290;
      uint64_t v11 = (uint64_t)v9;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "No existing checkpoint for channel: %@. Creating a new checkpoint", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)setCurrentCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke;
  v13[3] = &unk_2646E21B8;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  id v11 = v9;
  uint64_t v16 = &v18;
  unint64_t v17 = a4;
  id v15 = v11;
  [v11 performBlockAndWait:v13];
  LOBYTE(a4) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return a4;
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 _existingChannelCheckpointForChannelIdentifier:v3 databaseContext:*(void *)(a1 + 48)];

  if (v4)
  {
    [(ChannelCheckpoint *)v4 setCheckpoint:*(void *)(a1 + 64)];
    id v5 = *(void **)(a1 + 48);
    id v17 = 0;
    [v5 save:&v17];
    id v6 = v17;
    uint64_t v7 = +[SKADatabaseManager logger];
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v15;
        _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Updated checkpoint for channel: %@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    id v9 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v10;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "No existing checkpoint for channel: %@. Creating a new checkpoint", buf, 0xCu);
    }
    id v4 = [[ChannelCheckpoint alloc] initWithContext:*(void *)(a1 + 48)];
    id v11 = [*(id *)(a1 + 40) identifier];
    [(ChannelCheckpoint *)v4 setChannelID:v11];

    [(ChannelCheckpoint *)v4 setCheckpoint:*(void *)(a1 + 64)];
    __int16 v12 = *(void **)(a1 + 48);
    id v16 = 0;
    [v12 save:&v16];
    id v6 = v16;
    if (v6)
    {
      id v13 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_1();
      }

      char v14 = 0;
    }
    else
    {
      char v14 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
  }
}

- (id)_existingChannelCheckpointForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[ChannelCheckpoint fetchRequest];
  id v8 = +[ChannelCheckpoint predicateForChannelIdentifier:v6];

  [v7 setPredicate:v8];
  [v7 setFetchLimit:1];
  id v14 = 0;
  id v9 = [v5 executeFetchRequest:v7 error:&v14];

  id v10 = v14;
  if (v10)
  {
    id v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:]();
    }
  }
  __int16 v12 = [v9 firstObject];

  return v12;
}

- (void)cleanupOldStatusUpdatesForChannelIdentifier:(id)a3 excludingStatusUniqueIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke;
  v13[3] = &unk_2646E1BE8;
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  [v11 performBlockAndWait:v13];
}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  v43[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[Status fetchRequest];
  uint64_t v3 = +[Status predicateForChannelIdentifier:*(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = +[Status sortDescriptorForDateCreatedAscending:0];
  v43[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:20];
  id v6 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = v7;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Beginning database cleanup of statuses on channel identifier: %@", buf, 0xCu);
  }

  id v8 = *(void **)(a1 + 40);
  id v39 = 0;
  id v9 = [v8 executeFetchRequest:v2 error:&v39];
  id v10 = v39;
  if (v10)
  {
    id v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_2();
    }
    goto LABEL_6;
  }
  uint64_t v12 = [v9 count];
  id v11 = +[SKADatabaseManager logger];
  BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    id v33 = v2;
    if (v13)
    {
      uint64_t v14 = [v9 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v14;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status cleanup completed with %ld result(s)", buf, 0xCu);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v32 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      char v19 = 1;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          char v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (v19)
          {
            uint64_t v22 = +[SKADatabaseManager logger];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v21 uniqueIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = (uint64_t)v23;
              _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Keeping status %@ because it is our most recent status", buf, 0xCu);
            }
LABEL_21:

            goto LABEL_25;
          }
          id v24 = *(void **)(a1 + 48);
          id v25 = [*(id *)(*((void *)&v35 + 1) + 8 * i) uniqueIdentifier];
          int v26 = [v24 isEqualToString:v25];

          uint64_t v22 = +[SKADatabaseManager logger];
          BOOL v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v26)
          {
            if (v27)
            {
              id v28 = [v21 uniqueIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = (uint64_t)v28;
              _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Keeping status %@ because it is excluded from this cleanup request", buf, 0xCu);
            }
            goto LABEL_21;
          }
          if (v27)
          {
            id v29 = [v21 uniqueIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v42 = (uint64_t)v29;
            _os_log_impl(&dword_22480C000, v22, OS_LOG_TYPE_DEFAULT, "Deleting status %@ as it is no longer the most recent", buf, 0xCu);
          }
          [*(id *)(a1 + 40) deleteObject:v21];
LABEL_25:
          char v19 = 0;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        char v19 = 0;
      }
      while (v17);
    }

    id v30 = *(void **)(a1 + 40);
    id v34 = 0;
    [v30 save:&v34];
    id v11 = v34;
    if (v11)
    {
      id v31 = +[SKADatabaseManager logger];
      uint64_t v2 = v33;
      id v10 = 0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_1();
      }

      id v9 = v32;
    }
    else
    {
      id v9 = v32;
      uint64_t v2 = v33;
      id v10 = 0;
    }
  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for cleanup of statuses found no matches.", buf, 2u);
  }
LABEL_6:
}

- (id)_existingPendingPublishRequestForUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PendingPublishRequest fetchRequest];
  id v8 = +[PendingPublishRequest predicateForStatusUniqueIdentifier:v6];

  [v7 setPredicate:v8];
  [v7 setFetchLimit:1];
  id v14 = 0;
  id v9 = [v5 executeFetchRequest:v7 error:&v14];

  id v10 = v14;
  if (v10)
  {
    id v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:]();
    }
  }
  uint64_t v12 = [v9 firstObject];

  return v12;
}

- (id)_existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PendingPublishRequest fetchRequest];
  id v8 = +[PendingPublishRequest predicateForStatusTypeIdentifier:v6];

  [v7 setPredicate:v8];
  id v13 = 0;
  id v9 = [v5 executeFetchRequest:v7 error:&v13];

  id v10 = v13;
  if (v10)
  {
    id v11 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:]();
    }
  }
  return v9;
}

- (id)_existingPendingPublishRequestsWithDatabaseContext:(id)a3
{
  id v3 = a3;
  id v4 = +[PendingPublishRequest fetchRequest];
  id v9 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v9];

  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:]();
    }
  }
  return v5;
}

- (id)createPendingPublishRequestWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusTypeIdentifier:(id)a6 databaseContext:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__2;
  id v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke;
  void v23[3] = &unk_2646E2140;
  id v16 = v15;
  id v24 = v16;
  id v17 = v12;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  id v19 = v13;
  id v27 = v19;
  id v20 = v14;
  id v28 = v20;
  id v29 = &v30;
  [v16 performBlockAndWait:v23];
  id v21 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke(void *a1)
{
  uint64_t v2 = [[PendingPublishRequest alloc] initWithContext:a1[4]];
  [(PendingPublishRequest *)v2 setDateCreated:a1[5]];
  [(PendingPublishRequest *)v2 setStatusUniqueIdentifier:a1[6]];
  [(PendingPublishRequest *)v2 setPayloadData:a1[7]];
  [(PendingPublishRequest *)v2 setStatusTypeIdentifier:a1[8]];
  [(PendingPublishRequest *)v2 setRetryCount:0];
  id v3 = (void *)a1[4];
  id v9 = 0;
  [v3 save:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  id v6 = [[SKADatabasePendingPublishRequest alloc] initWithCoreDataPendingPublishRequest:v2];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)existingPendingPublishRequestForUniqueIdentifier:(id)a3 withDatabaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __91__SKADatabaseManager_existingPendingPublishRequestForUniqueIdentifier_withDatabaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __91__SKADatabaseManager_existingPendingPublishRequestForUniqueIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _existingPendingPublishRequestForUniqueIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v5)
  {
    uint64_t v2 = [[SKADatabasePendingPublishRequest alloc] initWithCoreDataPendingPublishRequest:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 withDatabaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __96__SKADatabaseManager_existingPendingPublishRequestsForStatusTypeIdentifier_withDatabaseContext___block_invoke;
  v12[3] = &unk_2646E2000;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [v9 performBlockAndWait:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __96__SKADatabaseManager_existingPendingPublishRequestsForStatusTypeIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPendingPublishRequestsForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = [[SKADatabasePendingPublishRequest alloc] initWithCoreDataPendingPublishRequest:v7];
        [*(id *)(a1 + 48) refreshObject:v7 mergeChanges:0];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)existingPendingPublishRequestsWithDatabaseContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __72__SKADatabaseManager_existingPendingPublishRequestsWithDatabaseContext___block_invoke;
  v8[3] = &unk_2646E2190;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__SKADatabaseManager_existingPendingPublishRequestsWithDatabaseContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _existingPendingPublishRequestsWithDatabaseContext:*(void *)(a1 + 40)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = [[SKADatabasePendingPublishRequest alloc] initWithCoreDataPendingPublishRequest:v7];
        [*(id *)(a1 + 40) refreshObject:v7 mergeChanges:0];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)deletePendingPublishRequestWithWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _existingPendingPublishRequestForUniqueIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  if (v3)
  {
    [*(id *)(a1 + 48) deleteObject:v3];
    uint64_t v4 = *(void **)(a1 + 48);
    id v10 = 0;
    [v4 save:&v10];
    id v5 = v10;
    id v6 = +[SKADatabaseManager logger];
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Deleted existing pending publish request with identifier: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    id v8 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)incrementPendingPublishRequestRetryCountWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_2646E2000;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _existingPendingPublishRequestForUniqueIdentifier:*(void *)(a1 + 40) databaseContext:*(void *)(a1 + 48)];
  uint64_t v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setRetryCount:", objc_msgSend(v3, "retryCount") + 1);
    id v5 = *(void **)(a1 + 48);
    id v11 = 0;
    [v5 save:&v11];
    id v6 = v11;
    id v7 = +[SKADatabaseManager logger];
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Incremented pending publish request rc with identifier: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    id v9 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_2646E2050;
  id v13 = v12;
  id v20 = v13;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v9;
  id v23 = v16;
  id v24 = &v25;
  [v13 performBlockAndWait:v19];
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[RemovedUser alloc] initWithContext:*(void *)(a1 + 32)];
  [(RemovedUser *)v2 setDateRemoved:*(void *)(a1 + 40)];
  [(RemovedUser *)v2 setStatusTypeIdentifier:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 56) normalizedHandleString];
  [(RemovedUser *)v2 setRemovedHandle:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = 0;
  [v4 save:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  id v7 = [[SKADatabaseRemovedUser alloc] initWithCoreDataRemovedUser:v2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)existingRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 withDatabaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __93__SKADatabaseManager_existingRemovedUserWithHandle_statusTypeIdentifier_withDatabaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __93__SKADatabaseManager_existingRemovedUserWithHandle_statusTypeIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _existingRemovedUsersForHandle:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  uint64_t v2 = [v6 firstObject];
  if (v2)
  {
    uint64_t v3 = [[SKADatabaseRemovedUser alloc] initWithCoreDataRemovedUser:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (BOOL)deleteRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v19 = &v20;
  [v13 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _existingRemovedUsersForHandle:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 56) deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v6);
    }

    id v9 = *(void **)(a1 + 56);
    id v15 = 0;
    [v9 save:&v15];
    id v10 = v15;
    id v11 = +[SKADatabaseManager logger];
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Deleted existing removed user with handle: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    id v13 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (id)_existingRemovedUsersForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RemovedUser fetchRequest];
  id v11 = (void *)MEMORY[0x263F08730];
  id v12 = +[RemovedUser predicateForHandle:v9];

  v21[0] = v12;
  id v13 = +[RemovedUser predicateForStatusTypeIdentifier:v8];

  v21[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  [v10 setFetchLimit:1];
  id v20 = 0;
  long long v16 = [v7 executeFetchRequest:v10 error:&v20];

  id v17 = v20;
  if (v17)
  {
    long long v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:]();
    }
  }
  return v16;
}

- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 presenceIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __97__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_presenceIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_2646E2050;
  id v13 = v12;
  id v20 = v13;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v9;
  id v23 = v16;
  id v24 = &v25;
  [v13 performBlockAndWait:v19];
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __97__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_presenceIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[RemovedUser alloc] initWithContext:*(void *)(a1 + 32)];
  [(RemovedUser *)v2 setDateRemoved:*(void *)(a1 + 40)];
  [(RemovedUser *)v2 setPresenceIdentifier:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 56) normalizedHandleString];
  [(RemovedUser *)v2 setRemovedHandle:v3];

  id v4 = *(void **)(a1 + 32);
  id v10 = 0;
  [v4 save:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }
  }
  id v7 = [[SKADatabaseRemovedUser alloc] initWithCoreDataRemovedUser:v2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)existingRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 withDatabaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __91__SKADatabaseManager_existingRemovedUserWithHandle_presenceIdentifier_withDatabaseContext___block_invoke;
  v16[3] = &unk_2646E2050;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __91__SKADatabaseManager_existingRemovedUserWithHandle_presenceIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _existingRemovedUsersForHandle:*(void *)(a1 + 40) presenceIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  uint64_t v2 = [v6 firstObject];
  if (v2)
  {
    uint64_t v3 = [[SKADatabaseRemovedUser alloc] initWithCoreDataRemovedUser:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (BOOL)deleteRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__SKADatabaseManager_deleteRemovedUserWithHandle_presenceIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_2646E2050;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v19 = &v20;
  [v13 performBlockAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __85__SKADatabaseManager_deleteRemovedUserWithHandle_presenceIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _existingRemovedUsersForHandle:*(void *)(a1 + 40) presenceIdentifier:*(void *)(a1 + 48) databaseContext:*(void *)(a1 + 56)];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 56) deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v6);
    }

    id v9 = *(void **)(a1 + 56);
    id v15 = 0;
    [v9 save:&v15];
    id v10 = v15;
    id v11 = +[SKADatabaseManager logger];
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Deleted existing removed user with handle: %@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    id v13 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (id)_existingRemovedUsersForHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RemovedUser fetchRequest];
  id v11 = (void *)MEMORY[0x263F08730];
  id v12 = +[RemovedUser predicateForHandle:v9];

  v21[0] = v12;
  id v13 = +[RemovedUser predicateForPresenceIdentifier:v8];

  v21[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  [v10 setFetchLimit:1];
  id v20 = 0;
  long long v16 = [v7 executeFetchRequest:v10 error:&v20];

  id v17 = v20;
  if (v17)
  {
    long long v18 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:]();
    }
  }
  return v16;
}

- (id)_existingReceivedInvitationsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[ReceivedInvitation fetchRequest];
  id v11 = (void *)MEMORY[0x263F08730];
  id v12 = +[ReceivedInvitation predicateForSenderHandle:v7];
  v36[0] = v12;
  id v13 = +[ReceivedInvitation predicateForStatusTypeIdentifier:v8];
  v36[1] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  id v15 = [v11 andPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  long long v16 = +[ReceivedInvitation sortDescriptorForDateInvitationCreatedOrderedAscending:0];
  id v35 = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v10 setSortDescriptors:v17];

  long long v18 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v7 handleString];
    *(_DWORD *)buf = 138412546;
    uint64_t v32 = (uint64_t)v19;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for ReceivedInvitation from handle %@ statusTypeIdentifier: %@", buf, 0x16u);
  }
  id v30 = 0;
  id v20 = [v9 executeFetchRequest:v10 error:&v30];

  id v21 = v30;
  if (v21)
  {
    uint64_t v22 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:]();
    }
  }
  else
  {
    uint64_t v23 = [v20 count];
    uint64_t v22 = +[SKADatabaseManager logger];
    BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v24) {
        goto LABEL_12;
      }
      uint64_t v25 = [v20 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v25;
      id v26 = "Fetch request for ReceivedInvitation by handle completed with %ld result(s)";
      uint64_t v27 = v22;
      uint32_t v28 = 12;
    }
    else
    {
      if (!v24) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      id v26 = "Fetch request for ReceivedInvitation by handle found no match.";
      uint64_t v27 = v22;
      uint32_t v28 = 2;
    }
    _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
  }
LABEL_12:

  return v20;
}

- (id)createReceivedInvitationForChannel:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 invitationIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13 databaseContext:(id)a14
{
  id v36 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v38 = a7;
  id v39 = a8;
  id v45 = a9;
  id v40 = a10;
  id v43 = a11;
  id v44 = a12;
  id v22 = a13;
  id v23 = a14;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__2;
  v65 = __Block_byref_object_dispose__2;
  id v66 = 0;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke;
  v46[3] = &unk_2646E21E0;
  id v37 = v36;
  id v47 = v37;
  id v48 = self;
  id v24 = v23;
  id v49 = v24;
  id v42 = v19;
  id v50 = v42;
  id v35 = v20;
  id v51 = v35;
  id v25 = v21;
  id v52 = v25;
  id v26 = v38;
  id v53 = v26;
  id v27 = v39;
  id v54 = v27;
  id v28 = v22;
  id v55 = v28;
  id v29 = v40;
  id v56 = v29;
  id v30 = v45;
  id v57 = v30;
  id v31 = v43;
  id v58 = v31;
  id v32 = v44;
  id v59 = v32;
  v60 = &v61;
  [v24 performBlockAndWait:v46];
  id v33 = (id)v62[5];

  _Block_object_dispose(&v61, 8);
  return v33;
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) _existingChannelsForDatabaseChannel:*(void *)(a1 + 32) databaseContext:*(void *)(a1 + 48)];
  if (![v3 count])
  {
    id v4 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_2();
    }
  }
  uint64_t v5 = [v3 firstObject];
  uint64_t v6 = [*(id *)(a1 + 56) normalizedHandleString];
  id v7 = [*(id *)(a1 + 64) normalizedHandleString];
  id v8 = [*(id *)(a1 + 32) statusType];
  id v9 = [[ReceivedInvitation alloc] initWithContext:*(void *)(a1 + 48)];
  [(ReceivedInvitation *)v9 setSenderHandle:v6];
  [(ReceivedInvitation *)v9 setInvitedHandle:v7];
  [(ReceivedInvitation *)v9 setStatusTypeIdentifier:v8];
  [(ReceivedInvitation *)v9 setInvitationIdentifier:*(void *)(a1 + 72)];
  [(ReceivedInvitation *)v9 setDateInvitationCreated:*(void *)(a1 + 80)];
  [(ReceivedInvitation *)v9 setIncomingRatchetState:*(void *)(a1 + 88)];
  [(ReceivedInvitation *)v9 setInvitationPayload:*(void *)(a1 + 96)];
  [(ReceivedInvitation *)v9 setChannelToken:*(void *)(a1 + 104)];
  [(ReceivedInvitation *)v9 setPresenceIdentifier:*(void *)(a1 + 112)];
  [(ReceivedInvitation *)v9 setServerKey:*(void *)(a1 + 120)];
  [(ReceivedInvitation *)v9 setPeerKey:*(void *)(a1 + 128)];
  [v5 addReceivedInvitationsObject:v9];
  id v10 = *(void **)(a1 + 48);
  id v16 = 0;
  [v10 save:&v16];
  id v11 = v16;
  if (v11)
  {
    id v12 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_1();
    }
  }
  id v13 = [[SKADatabaseReceivedInvitation alloc] initWithCoreDataReceivedInvitation:v9];
  uint64_t v14 = *(void *)(*(void *)(a1 + 136) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)_existingReceivedInvitationsForChannelIdentifier:(id)a3 sortedByDateReceived:(BOOL)a4 databaseContect:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v31 = a5;
  id v9 = -[SKADatabaseManager _existingChannelsForChannelIdentifier:databaseContext:](self, "_existingChannelsForChannelIdentifier:databaseContext:", v8);
  if ([v9 count])
  {
    BOOL v28 = v6;
    id v30 = v8;
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v29 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v17 = [v16 receivedInvitations];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v33 != v20) {
                  objc_enumerationMutation(v17);
                }
                [v10 addObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v19);
          }
          [v31 refreshObject:v16 mergeChanges:0];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v13);
    }

    if (v28)
    {
      id v22 = (void *)MEMORY[0x263F08B30];
      id v23 = +[ReceivedInvitation dateInvitationCreatedKeyPath];
      id v24 = [v22 sortDescriptorWithKey:v23 ascending:0];

      id v40 = v24;
      id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      id v26 = [v10 sortedArrayUsingDescriptors:v25];
    }
    else
    {
      id v26 = [v10 copy];
    }
    id v9 = v29;
    id v8 = v30;
  }
  else
  {
    id v10 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKADatabaseManager _existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:]();
    }
    id v26 = (id)MEMORY[0x263EFFA68];
  }

  return v26;
}

- (id)receivedInvitationsForChannel:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __68__SKADatabaseManager_receivedInvitationsForChannel_databaseContext___block_invoke;
  id v17 = &unk_2646E20C8;
  id v18 = v6;
  uint64_t v19 = self;
  id v20 = v7;
  id v21 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [v10 performBlockAndWait:&v14];
  uint64_t v12 = objc_msgSend(v9, "copy", v14, v15, v16, v17);

  return v12;
}

void __68__SKADatabaseManager_receivedInvitationsForChannel_databaseContext___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] identifier];
  uint64_t v3 = [a1[5] _existingReceivedInvitationsForChannelIdentifier:v2 sortedByDateReceived:1 databaseContect:a1[6]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [[SKADatabaseReceivedInvitation alloc] initWithCoreDataReceivedInvitation:v8];
        [a1[6] refreshObject:v8 mergeChanges:0];
        if (v9) {
          [a1[7] addObject:v9];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)cleanupOldReceivedInvitationsForChannelIdentifier:(id)a3 excludingInvitation:(id)a4 databaseContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke;
  v14[3] = &unk_2646E20C8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [v12 performBlockAndWait:v14];
}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingReceivedInvitationsForChannelIdentifier:*(void *)(a1 + 40) sortedByDateReceived:1 databaseContect:*(void *)(a1 + 48)];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_2;
  v9[3] = &unk_2646E2208;
  id v10 = *(id *)(a1 + 56);
  id v4 = v3;
  id v11 = v4;
  id v12 = *(id *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v9];
  uint64_t v5 = *(void **)(a1 + 48);
  id v8 = 0;
  [v5 save:&v8];
  id v6 = v8;
  if (v6)
  {
    uint64_t v7 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_cold_1();
    }
  }
}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_2(id *a1, void *a2, unint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 senderHandle];
  if (a3 >= 5)
  {
    uint64_t v7 = [v5 invitationIdentifier];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [a1[4] invitationIdentifier];
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = [v5 invitationIdentifier];
        id v12 = [a1[4] invitationIdentifier];
        char v13 = [v11 isEqualToString:v12];

        if (v13) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
    if (![v6 length] || objc_msgSend(a1[5], "containsObject:", v6))
    {
      uint64_t v14 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v5 invitationIdentifier];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Deleting invitation %@ as it is no longer the most recent", (uint8_t *)&v16, 0xCu);
      }
      [a1[6] deleteObject:v5];
    }
  }
LABEL_12:
  if ([v6 length]) {
    [a1[5] addObject:v6];
  }
}

- (void)cleanupDecommisionedChannelsWithDatabaseContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke;
  v6[3] = &unk_2646E1B98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingDecomissionedPersonalChannelsWithDatabaseContext:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_2;
    v9[3] = &unk_2646E2230;
    id v10 = v2;
    id v11 = *(id *)(a1 + 40);
    [v10 enumerateObjectsUsingBlock:v9];
    id v3 = *(void **)(a1 + 40);
    id v8 = 0;
    [v3 save:&v8];
    id v4 = v8;
    if (v4)
    {
      id v5 = +[SKADatabaseManager logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_cold_1();
      }
    }
    id v6 = v10;
  }
  else
  {
    id v6 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "No decomissioned channel to clean up", v7, 2u);
    }
  }
}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) count];
  id v7 = +[SKADatabaseManager logger];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 > 5 || v6 - a3 >= 6)
  {
    if (v8)
    {
      id v10 = [v5 identifier];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Deleting channel %@ as it is decomissioned and not recent or old", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) deleteObject:v5];
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [v5 identifier];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Not deleting channel %@ as it is in our most recent and old decomissioned channels", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)cleanupOldChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v5 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Channel cleanup is disabled.", v6, 2u);
  }
}

- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SKADatabaseManager *)self databaseProvider];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__SKADatabaseManager_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke;
  v7[3] = &unk_2646E0C60;
  id v8 = v4;
  id v6 = v4;
  [v5 deviceToDeviceEncryptedDatabaseCapableWithCompletion:v7];
}

uint64_t __75__SKADatabaseManager_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)allPublishedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  id v24 = __Block_byref_object_dispose__2;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_2646E2258;
  id v6 = v5;
  id v11 = v6;
  id v12 = &v14;
  uint64_t v13 = &v20;
  [v6 performBlockAndWait:v10];
  id v7 = (void *)v21[5];
  if (v7)
  {
    id v8 = v7;
  }
  else if (a4)
  {
    *a4 = (id) v15[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[PublishedLocalStatus fetchRequest];
  id v3 = +[SKADatabaseManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for all published local statuses", buf, 2u);
  }

  id v4 = *(void **)(a1 + 32);
  id v22 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v22];
  id v6 = v22;
  id v7 = v22;
  id v8 = +[SKADatabaseManager logger];
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Fetch request for all published local statuses completed", buf, 2u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v16, 0, (void)v18);
          id v17 = [[SKADatabasePublishedLocalStatus alloc] initWithCoreDataPublishedLocalStatus:v16];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)createOrUpdatePublishedLocalStatuses:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke;
  v13[3] = &unk_2646E2280;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  uint64_t v16 = &v24;
  id v17 = &v18;
  [v10 performBlockAndWait:v13];
  int v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((unsigned char *)v25 + 24)) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v62 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v61 + 1) + 8 * i) identifier];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v5);
  }

  id v9 = +[PublishedLocalStatus fetchRequest];
  id v10 = +[PublishedLocalStatus predicateForPublishedLocalStatusIdentifiers:v2];
  [v9 setPredicate:v10];

  int v11 = *(void **)(a1 + 40);
  id v60 = 0;
  uint64_t v12 = [v11 executeFetchRequest:v9 error:&v60];
  id v13 = v60;
  id v14 = v60;
  id v15 = v14;
  if (v12)
  {
    id v47 = v14;
    id v49 = v9;
    uint64_t v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v48 = v12;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          id v23 = [v22 identifier];
          [v16 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v19);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v67 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v50 = a1;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          id v30 = [v29 identifier];
          id v31 = [v16 objectForKeyedSubscript:v30];

          if (v31) {
            long long v32 = v31;
          }
          else {
            long long v32 = [[PublishedLocalStatus alloc] initWithContext:*(void *)(v50 + 40)];
          }
          long long v33 = v32;
          long long v34 = [v29 creationDate];
          [(PublishedLocalStatus *)v33 setCreationDate:v34];

          long long v35 = [v29 keyDomain];
          [(PublishedLocalStatus *)v33 setKeyDomain:v35];

          long long v36 = [v29 identifier];
          [(PublishedLocalStatus *)v33 setIdentifier:v36];

          long long v37 = [v29 keyName];
          [(PublishedLocalStatus *)v33 setKeyName:v37];

          long long v38 = [v29 modificationDate];
          [(PublishedLocalStatus *)v33 setModificationDate:v38];

          long long v39 = [v29 payload];
          [(PublishedLocalStatus *)v33 setPayload:v39];

          -[PublishedLocalStatus setTargetDevicesFlags:](v33, "setTargetDevicesFlags:", [v29 targetDevicesFlags]);
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v67 count:16];
      }
      while (v26);

      id v40 = *(void **)(v50 + 40);
      id v51 = 0;
      int v41 = [v40 save:&v51];
      id v42 = v51;
      id v43 = v51;
      id v44 = +[SKADatabaseManager logger];
      id v45 = v44;
      if (v41)
      {
        uint64_t v12 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v50 + 32), "count"));
          *(_DWORD *)buf = 138412290;
          id v66 = v46;
          _os_log_impl(&dword_22480C000, v45, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatuses saved {statuses.count: %@}", buf, 0xCu);
        }
        *(unsigned char *)(*(void *)(*(void *)(v50 + 48) + 8) + 24) = 1;
      }
      else
      {
        uint64_t v12 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_2();
        }

        *(unsigned char *)(*(void *)(*(void *)(v50 + 48) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(void *)(*(void *)(v50 + 56) + 8) + 40), v42);
      }

      id v9 = v49;
    }
    else
    {

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v12 = v48;
      id v9 = v49;
    }
    id v15 = v47;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
    uint64_t v16 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_1();
    }
  }
}

- (id)allPublishedLocalStatusDevicesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  id v24 = __Block_byref_object_dispose__2;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_2646E2258;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = &v14;
  id v13 = &v20;
  [v6 performBlockAndWait:v10];
  id v7 = (void *)v21[5];
  if (v7)
  {
    id v8 = v7;
  }
  else if (a4)
  {
    *a4 = (id) v15[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = +[PublishedLocalStatusDevice fetchRequest];
  id v3 = (void *)a1[4];
  id v23 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v23];
  id v5 = v23;
  id v6 = v23;
  id v7 = +[SKADatabaseManager logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v5);
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v11;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "allPublishedLocalStatusDevicesInDatabaseContext fetch success {devices.count: %@}", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v4;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
          id v17 = [SKADatabasePublishedLocalStatusDevice alloc];
          uint64_t v18 = -[SKADatabasePublishedLocalStatusDevice initWithCoreDataPulishedLocalStatusDevice:](v17, "initWithCoreDataPulishedLocalStatusDevice:", v16, (void)v19);
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)createOrUpdatePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__2;
  long long v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke;
  v13[3] = &unk_2646E2280;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  uint64_t v16 = &v24;
  id v17 = &v18;
  [v10 performBlockAndWait:v13];
  int v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((unsigned char *)v25 + 24)) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v135 objects:v148 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v136 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v135 + 1) + 8 * i) idsIdentifier];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v135 objects:v148 count:16];
    }
    while (v5);
  }

  id v9 = +[PublishedLocalStatusDevice fetchRequest];
  id v10 = +[PublishedLocalStatusDevice predicateForPublishedLocalStatusDeviceIdentifiers:v2];
  [v9 setPredicate:v10];

  int v11 = *(void **)(a1 + 40);
  id v134 = 0;
  v90 = v9;
  uint64_t v12 = [v11 executeFetchRequest:v9 error:&v134];
  id v13 = v134;
  id v89 = v134;
  if (v12)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v88 = v12;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v130 objects:v147 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v131;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v131 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v130 + 1) + 8 * j);
          long long v21 = objc_msgSend(v20, "idsIdentifier", v88);
          [v14 setObject:v20 forKeyedSubscript:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v130 objects:v147 count:16];
      }
      while (v17);
    }

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v22 = *(id *)(a1 + 32);
    uint64_t v96 = [v22 countByEnumeratingWithState:&v126 objects:v146 count:16];
    if (!v96)
    {

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_83:
      id v9 = v90;
      uint64_t v12 = v88;
      goto LABEL_84;
    }
    uint64_t v95 = *(void *)v127;
    id v94 = v22;
    uint64_t v92 = a1;
    id v93 = v2;
    v91 = v14;
    while (2)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v127 != v95) {
          objc_enumerationMutation(v22);
        }
        v103 = *(void **)(*((void *)&v126 + 1) + 8 * v23);
        uint64_t v24 = objc_msgSend(v103, "idsIdentifier", v88);
        id v25 = [v14 objectForKeyedSubscript:v24];

        uint64_t v99 = v23;
        v102 = v25;
        if (v25) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = [[PublishedLocalStatusDevice alloc] initWithContext:*(void *)(a1 + 40)];
        }
        char v27 = v26;
        BOOL v28 = [v103 idsIdentifier];
        v101 = v27;
        [(PublishedLocalStatusDevice *)v27 setIdsIdentifier:v28];

        id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v30 = [v103 pendingStatuses];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v122 objects:v145 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v123;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v123 != v33) {
                objc_enumerationMutation(v30);
              }
              long long v35 = [*(id *)(*((void *)&v122 + 1) + 8 * k) identifier];
              [v29 addObject:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v122 objects:v145 count:16];
          }
          while (v32);
        }

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v36 = [v103 deliveredStatuses];
        uint64_t v37 = [v36 countByEnumeratingWithState:&v118 objects:v144 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v119;
          do
          {
            for (uint64_t m = 0; m != v38; ++m)
            {
              if (*(void *)v119 != v39) {
                objc_enumerationMutation(v36);
              }
              int v41 = [*(id *)(*((void *)&v118 + 1) + 8 * m) identifier];
              [v29 addObject:v41];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v118 objects:v144 count:16];
          }
          while (v38);
        }

        id v42 = +[PublishedLocalStatus fetchRequest];
        id v43 = +[PublishedLocalStatus predicateForPublishedLocalStatusIdentifiers:v29];
        [v42 setPredicate:v43];

        id v44 = *(void **)(a1 + 40);
        id v117 = 0;
        id v45 = [v44 executeFetchRequest:v42 error:&v117];
        id v46 = v117;
        id v47 = v46;
        v100 = v45;
        if (v45)
        {
          id v97 = v46;
          v98 = v42;
          id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v49 = v45;
          uint64_t v50 = [v49 countByEnumeratingWithState:&v113 objects:v143 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v114;
            do
            {
              for (uint64_t n = 0; n != v51; ++n)
              {
                if (*(void *)v114 != v52) {
                  objc_enumerationMutation(v49);
                }
                long long v54 = *(void **)(*((void *)&v113 + 1) + 8 * n);
                long long v55 = [v54 identifier];
                [v48 setObject:v54 forKeyedSubscript:v55];
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v113 objects:v143 count:16];
            }
            while (v51);
          }

          id v56 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v57 = [v103 pendingStatuses];
          uint64_t v58 = [v57 countByEnumeratingWithState:&v109 objects:v142 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v110;
            do
            {
              for (iuint64_t i = 0; ii != v59; ++ii)
              {
                if (*(void *)v110 != v60) {
                  objc_enumerationMutation(v57);
                }
                long long v62 = [*(id *)(*((void *)&v109 + 1) + 8 * ii) identifier];
                long long v63 = [v48 objectForKeyedSubscript:v62];

                if (v63) {
                  [v56 addObject:v63];
                }
              }
              uint64_t v59 = [v57 countByEnumeratingWithState:&v109 objects:v142 count:16];
            }
            while (v59);
          }

          id v64 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          v65 = [v103 deliveredStatuses];
          uint64_t v66 = [v65 countByEnumeratingWithState:&v105 objects:v141 count:16];
          if (v66)
          {
            uint64_t v67 = v66;
            uint64_t v68 = *(void *)v106;
            do
            {
              for (juint64_t j = 0; jj != v67; ++jj)
              {
                if (*(void *)v106 != v68) {
                  objc_enumerationMutation(v65);
                }
                uint64_t v70 = [*(id *)(*((void *)&v105 + 1) + 8 * jj) identifier];
                v71 = [v48 objectForKeyedSubscript:v70];

                if (v71) {
                  [v64 addObject:v71];
                }
              }
              uint64_t v67 = [v65 countByEnumeratingWithState:&v105 objects:v141 count:16];
            }
            while (v67);
          }

          v72 = +[SKADatabaseManager logger];
          id v42 = v98;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v140 = v56;
            _os_log_impl(&dword_22480C000, v72, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices setting devices. {pendingStatuses: %@}", buf, 0xCu);
          }

          v73 = +[SKADatabaseManager logger];
          id v14 = v91;
          id v22 = v94;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v140 = v56;
            _os_log_impl(&dword_22480C000, v73, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices setting devices. {deliveredStatuses: %@}", buf, 0xCu);
          }

          v74 = v101;
          [(PublishedLocalStatusDevice *)v101 setPendingStatuses:v56];
          [(PublishedLocalStatusDevice *)v101 setDeliveredStatuses:v64];

          a1 = v92;
          id v2 = v93;
          v75 = v102;
          v76 = v97;
        }
        else
        {
          v77 = +[SKADatabaseManager logger];
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v140 = v47;
            _os_log_error_impl(&dword_22480C000, v77, OS_LOG_TYPE_ERROR, "createOrUpdatePublishedLocalStatusDevices failed to fetch PublishedLocalStatusDevice {error: %@}", buf, 0xCu);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          uint64_t v78 = *(void *)(*(void *)(a1 + 56) + 8);
          id v79 = v47;
          id v48 = *(id *)(v78 + 40);
          *(void *)(v78 + 40) = v79;
          id v22 = v94;
          v76 = v47;
          v74 = v101;
          v75 = v102;
        }

        if (!v100)
        {

          goto LABEL_83;
        }
        uint64_t v23 = v99 + 1;
      }
      while (v99 + 1 != v96);
      uint64_t v96 = [v22 countByEnumeratingWithState:&v126 objects:v146 count:16];
      if (v96) {
        continue;
      }
      break;
    }

    v80 = *(void **)(a1 + 40);
    id v104 = 0;
    int v81 = [v80 save:&v104];
    id v82 = v104;
    id v83 = v104;
    v84 = +[SKADatabaseManager logger];
    v85 = v84;
    if (v81)
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v86 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
        *(_DWORD *)buf = 138412290;
        id v140 = v86;
        _os_log_impl(&dword_22480C000, v85, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices saved {devices.count: %@}", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v82);
    }
    uint64_t v12 = v88;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
    id v14 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v87 = v89;
      __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1();
      goto LABEL_85;
    }
  }
  id v9 = v90;
LABEL_84:
  v87 = v89;
LABEL_85:
}

- (BOOL)deletePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke;
  v13[3] = &unk_2646E2280;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  [v10 performBlockAndWait:v13];
  int v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((unsigned char *)v25 + 24)) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = +[PublishedLocalStatusDevice fetchRequest];
  id v3 = +[PublishedLocalStatusDevice predicateForPublishedLocalStatusDeviceIdentifiers:*(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  uint64_t v4 = *(void **)(a1 + 40);
  id v26 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v26];
  id v6 = v26;
  id v7 = v26;
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v22 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v10);

      id v13 = *(void **)(a1 + 40);
      id v21 = 0;
      int v14 = [v13 save:&v21];
      id v15 = v21;
      id v16 = v21;
      uint64_t v17 = +[SKADatabaseManager logger];
      uint64_t v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
          *(_DWORD *)buf = 138412290;
          BOOL v28 = v19;
          _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "deletePublishedLocalStatusDevices saved {deviceIdentifiers.count: %@}", buf, 0xCu);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        [*(id *)(a1 + 40) reset];
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2();
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
      }
    }
    else
    {

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v20 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)createOrUpdateOrDeleteSubscribedLocalStatus:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2;
  long long v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke;
  v13[3] = &unk_2646E2280;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v24;
  uint64_t v17 = &v18;
  [v10 performBlockAndWait:v13];
  int v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((unsigned char *)v25 + 24)) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = +[SubscribedLocalStatus fetchRequest];
  id v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = +[SubscribedLocalStatus predicateForSubscribedLocalStatusIdentifier:v3];
  [v2 setPredicate:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  id v47 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v47];
  id v7 = v47;
  id v8 = v47;
  if (!v6)
  {
    id v23 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_33;
  }
  id v40 = v2;
  if (![v6 count])
  {
    uint64_t v24 = [*(id *)(a1 + 32) payload];

    if (!v24) {
      goto LABEL_28;
    }
    long long v25 = [[SubscribedLocalStatus alloc] initWithContext:*(void *)(a1 + 40)];
    uint64_t v26 = [*(id *)(a1 + 32) creationDate];
    [(SubscribedLocalStatus *)v25 setCreationDate:v26];

    char v27 = [*(id *)(a1 + 32) modificationDate];
    [(SubscribedLocalStatus *)v25 setModificationDate:v27];

    BOOL v28 = [*(id *)(a1 + 32) identifier];
    [(SubscribedLocalStatus *)v25 setIdentifier:v28];

    id v29 = [*(id *)(a1 + 32) idsIdentifier];
    [(SubscribedLocalStatus *)v25 setIdsIdentifier:v29];

    uint64_t v30 = [*(id *)(a1 + 32) payload];
    [(SubscribedLocalStatus *)v25 setPayload:v30];

    uint64_t v31 = [*(id *)(a1 + 32) keyName];
    [(SubscribedLocalStatus *)v25 setKeyName:v31];

    uint64_t v32 = [*(id *)(a1 + 32) keyDomain];
    [(SubscribedLocalStatus *)v25 setKeyDomain:v32];

    goto LABEL_23;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v10)
  {

    goto LABEL_28;
  }
  uint64_t v11 = v10;
  id v39 = v8;
  uint64_t v12 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      id v15 = objc_msgSend(*(id *)(a1 + 32), "payload", v39);

      if (v15)
      {
        id v16 = [*(id *)(a1 + 32) payload];
        uint64_t v17 = [v14 payload];
        char v18 = [v16 isEqualToData:v17];

        if (v18)
        {
          int v19 = 0;
          continue;
        }
        uint64_t v20 = [*(id *)(a1 + 32) payload];
        [v14 setPayload:v20];

        id v21 = [*(id *)(a1 + 32) idsIdentifier];
        [v14 setIdsIdentifier:v21];

        long long v22 = [*(id *)(a1 + 32) modificationDate];
        [v14 setModificationDate:v22];
      }
      else
      {
        [*(id *)(a1 + 40) deleteObject:v14];
      }
      int v19 = 1;
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  }
  while (v11);

  id v8 = v39;
  if (!v19)
  {
LABEL_28:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v2 = v40;
    goto LABEL_33;
  }
LABEL_23:
  uint64_t v33 = *(void **)(a1 + 40);
  id v42 = 0;
  int v34 = [v33 save:&v42];
  id v35 = v42;
  id v36 = v42;
  uint64_t v37 = +[SKADatabaseManager logger];
  uint64_t v38 = v37;
  if (v34)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v38, OS_LOG_TYPE_DEFAULT, "createOrUpdateOrDeleteSubscribedLocalStatus saved", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_2();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v35);
  }
  id v2 = v40;
  [*(id *)(a1 + 40) reset];

LABEL_33:
}

- (id)allSubscribedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  char v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_2646E2258;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = &v20;
  id v13 = &v14;
  [v6 performBlockAndWait:v10];
  id v7 = (void *)v21[5];
  if (v7)
  {
    id v8 = v7;
  }
  else if (a4)
  {
    *a4 = (id) v15[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = +[SubscribedLocalStatus fetchRequest];
  id v3 = (void *)a1[4];
  id v24 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v24];
  id v5 = v24;
  id v6 = v24;
  id v7 = v6;
  if (v4)
  {
    id v19 = v6;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [[SKADatabaseSubscribedLocalStatus alloc] initWithCoreDataSubscirbedLocalStatus:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    uint64_t v15 = *(void *)(a1[5] + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v8;
    id v7 = v19;
  }
  else
  {
    uint64_t v17 = +[SKADatabaseManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
    uint64_t v18 = *(void *)(a1[5] + 8);
    uint64_t v16 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

+ (id)logger
{
  if (logger_onceToken_25 != -1) {
    dispatch_once(&logger_onceToken_25, &__block_literal_global_25);
  }
  id v2 = (void *)logger__logger_25;
  return v2;
}

uint64_t __28__SKADatabaseManager_logger__block_invoke()
{
  logger__logger_25 = (uint64_t)os_log_create("com.apple.StatusKit", "SKADatabaseManager");
  return MEMORY[0x270F9A758]();
}

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (SKADatabaseManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKADatabaseManagingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (void)_existingPersonalChannelForStatusTypeIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching personal status channel. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingDecomissionedPersonalChannelsWithDatabaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching decomissioned channel. Error: %@", v2, v3, v4, v5, v6);
}

void __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find existing channel", v2, v3, v4, v5, v6);
}

- (void)_existingPersonalChannelForDatabaseChannel:(void *)a1 databaseContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_22480C000, a2, OS_LOG_TYPE_FAULT, "More than one personal channel exists for channel identifier: %@", v4, 0xCu);
}

- (void)_existingChannelsForChannelIdentifier:isPersonal:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Fetch request for channels by identifier returned a nil result", v2, v3, v4, v5, v6);
}

- (void)_existingChannelsForChannelIdentifier:isPersonal:databaseContext:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for subscription validation. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingChannelsForChannelIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Fetch request for channels by identifier %@ returned a nil result", v2, v3, v4, v5, v6);
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation does not correspond to any channel. InvitationIdentifier: %@", v2, v3, v4, v5, v6);
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find any channels associated with channel identifier: %@", v2, v3, v4, v5, v6);
}

void __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for channel by handle. Error: %@", v2, v3, v4, v5, v6);
}

void __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing new personal channel. Error: %@", v2, v3, v4, v5, v6);
}

void __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing new presence channel. Error: %@", v2, v3, v4, v5, v6);
}

void __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing channel invitation. Error: %@", v2, v3, v4, v5, v6);
}

void __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for updated outgoing ratchet state. Error: %@", v2, v3, v4, v5, v6);
}

void __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for decomissioning. Error: %@", v2, v3, v4, v5, v6);
}

void __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find generated ratchet keys matching database channel. Channel: %@", v2, v3, v4, v5, v6);
}

void __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching subscription assertions. Error: %@", v2, v3, v4, v5, v6);
}

void __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing persistent subscription assertion. Error: %@", v2, v3, v4, v5, v6);
}

void __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find existing assertion", v2, v3, v4, v5, v6);
}

- (void)_existingTransientSubscriptionHistoryForChannelIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching transientSubscriptionHistory. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingTransientSubscriptionHistoryWithLimit:orderedByLastSubscriptionDateAscending:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching transientSubscriptionHistories. Error: %@", v2, v3, v4, v5, v6);
}

void __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing transient subscription history. Error: %@", v2, v3, v4, v5, v6);
}

void __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing invited user. Error: %@", v2, v3, v4, v5, v6);
}

void __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for copyinh invited users. Error: %@", v2, v3, v4, v5, v6);
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error finding core data invited user to update invitation. No match for SKADatabaseInvitedUser: %@", v2, v3, v4, v5, v6);
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for updating invitation payload on invited user. Error: %@", v2, v3, v4, v5, v6);
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_2();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_22480C000, a3, OS_LOG_TYPE_ERROR, "Multiple (%ld) entries in the database match a single invited user, updating all of them. InvitedUser: %@", v5, 0x16u);
}

void __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error finding core data channel matching SKADatabaseChannel: %@", v2, v3, v4, v5, v6);
}

- (void)_existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching invited user. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingInvitedUsersForInvitedHandle:(void *)a1 channel:(NSObject *)a2 databaseContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 handleString];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Failed to normalize handle: \"%@\", returning nil existing invited user", v4, 0xCu);
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find existing database channel matching channel %@", v2, v3, v4, v5, v6);
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find existing invited user matching handle: %@", v2, v3, v4, v5, v6);
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for deleting invited users by handle. Error: %@", v2, v3, v4, v5, v6);
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find any existing invited users to delete", v2, v3, v4, v5, v6);
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for deleting all invited users. Error: %@", v2, v3, v4, v5, v6);
}

void __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing status. Error: %@", v2, v3, v4, v5, v6);
}

void __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for status by channel. Error: %@", v2, v3, v4, v5, v6);
}

void __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for status by unique id. Error: %@", v2, v3, v4, v5, v6);
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing checkpoint. Error: %@", v2, v3, v4, v5, v6);
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for channel checkpoint. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingChannelCheckpointForChannelIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching pending requests. Error: %@", v2, v3, v4, v5, v6);
}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for status cleanup. Error: %@", v2, v3, v4, v5, v6);
}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for status cleanup. Error: %@", v2, v3, v4, v5, v6);
}

void __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing pending publish request. Error: %@", v2, v3, v4, v5, v6);
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find existing pending publish request with identifier: %@", v2, v3, v4, v5, v6);
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for deleting pending publish request. Error: %@", v2, v3, v4, v5, v6);
}

void __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for incrementing pending publish request. Error: %@", v2, v3, v4, v5, v6);
}

void __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing removed user. Error: %@", v2, v3, v4, v5, v6);
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find existing removed user with handle: %@", v2, v3, v4, v5, v6);
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for deleting removed user. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching removed users. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error executing fetch for ReceivedInvitation by handle. Error: %@", v2, v3, v4, v5, v6);
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for storing received invitation. Error: %@", v2, v3, v4, v5, v6);
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find core data channel to match channel identifier: %@", v2, v3, v4, v5, v6);
}

- (void)_existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Could not find any existing channels matching channel identifier. Returning no received invitations. Channel identifier: %@", v2, v3, v4, v5, v6);
}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for invitation cleanup. Error: %@", v2, v3, v4, v5, v6);
}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error saving managed object context for decomissioned channel cleanup. Error: %@", v2, v3, v4, v5, v6);
}

void __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error fetching all published local statuses. Error: %@", v2, v3, v4, v5, v6);
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdatePublishedLocalStatuses failed to fetch local statuses {error: %@}", v2, v3, v4, v5, v6);
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdatePublishedLocalStatuses save failed {error: %@}", v2, v3, v4, v5, v6);
}

void __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "allPublishedLocalStatusDevicesInDatabaseContext failed to fetch PublishedLocalStatusDevice. {error: %@}", v2, v3, v4, v5, v6);
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdatePublishedLocalStatusDevices failed to fetch published local status devices {error: %@}", v2, v3, v4, v5, v6);
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdatePublishedLocalStatusDevices save failed {error: %@}", v2, v3, v4, v5, v6);
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "deletePublishedLocalStatusDevices failed to PublishedLocalStatusDevice {error: %@}", v2, v3, v4, v5, v6);
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "deletePublishedLocalStatusDevices save failed {error: %@}", v2, v3, v4, v5, v6);
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdateOrDeleteSubscribedLocalStatus failed to SubscribedLocalStatus {error: %@}", v2, v3, v4, v5, v6);
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "createOrUpdateOrDeleteSubscribedLocalStatus save failed {error: %@}", v2, v3, v4, v5, v6);
}

void __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "allSubscribedLocalStatusesInDatabaseContext failed to fetch SKADatabaseSubscribedLocalStatus. {error: %@}", v2, v3, v4, v5, v6);
}

@end