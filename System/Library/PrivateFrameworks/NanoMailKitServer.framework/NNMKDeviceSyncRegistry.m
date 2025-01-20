@interface NNMKDeviceSyncRegistry
- (BOOL)containsSyncedMessageForMessageWithId:(id)a3;
- (BOOL)hasMailboxSyncedActive;
- (BOOL)isMessagesSyncSuspendedByConnectivity;
- (BOOL)organizeByThread;
- (BOOL)protectedContentChannelSupported;
- (BOOL)recreatedFromScratch;
- (NNMKDeviceSyncRegistry)initWithPath:(id)a3;
- (NNMKSQLiteConnection)database;
- (NSDate)disconnectedSince;
- (NSMutableDictionary)pendingComposedMessages;
- (NSNumber)supportsWebKit;
- (NSString)path;
- (double)deviceScreenScale;
- (double)deviceScreenWidth;
- (id)_attachmentDirectory;
- (id)_idsIdentifiersForObjectId:(id)a3 type:(id)a4;
- (id)_mailboxFromCurrentRowInStatement:(sqlite3_stmt *)a3;
- (id)_selectMailboxesWhere:(id)a3 blockForBinding:(id)a4;
- (id)_selectSyncedAccountsWhere:(id)a3 blockForBinding:(id)a4;
- (id)_selectSyncedMessagesIdsWhere:(id)a3 count:(unint64_t)a4 blockForBinding:(id)a5;
- (id)_selectSyncedMessagesWhere:(id)a3 blockForBinding:(id)a4;
- (id)_ungroupGroupedValue:(id)a3;
- (id)_urlForAttachmentsWithComposedMessageId:(id)a3;
- (id)accountIdForUsername:(id)a3;
- (id)activeMailboxes;
- (id)allSyncedAccountsKeyedByAccountId;
- (id)attachmentsForComposedMessageId:(id)a3;
- (id)attachmentsFromURL:(id)a3;
- (id)datesForIDSIdentifiersScheduledToBeResent;
- (id)firstSyncedMessageIdsContentNotSyncedOrRequestedByUser:(unint64_t)a3;
- (id)mailboxIdForDeletedMessageId:(id)a3;
- (id)mailboxWithId:(id)a3;
- (id)mailboxes;
- (id)mailboxesForAccountId:(id)a3;
- (id)messageIdForSanitizedMessageId:(id)a3;
- (id)objectIdsForIDSIdentifierNotYetAckd:(id)a3 type:(id *)a4 resendInterval:(unint64_t *)a5;
- (id)objectIdsForType:(id)a3;
- (id)oldestDateReceivedForMailboxId:(id)a3;
- (id)pendingComposedMessageIds;
- (id)pendingComposedMessageWithId:(id)a3;
- (id)syncEnabledMailboxes;
- (id)syncedAccountForAccountWithId:(id)a3;
- (id)syncedAccountIdsResendRequested;
- (id)syncedMessageForMessageWithId:(id)a3;
- (id)syncedMessageIdsContentRequestedByUser;
- (id)syncedMessageIdsResendRequested;
- (id)syncedMessagesForConversationWithId:(id)a3;
- (id)syncedMessagesKeyedByMessageIdAfterDateReceived:(id)a3 mailboxId:(id)a4;
- (id)typeForIDSIdentifierNotYetAckd:(id)a3;
- (int64_t)progressForComposedMessageWithId:(id)a3;
- (unint64_t)accountSourceTypeForAccountId:(id)a3;
- (unint64_t)accountSourceTypeForMailboxId:(id)a3;
- (unint64_t)accountSourceTypeForMessageId:(id)a3;
- (unint64_t)currentDatabaseSchemaVersion;
- (unint64_t)fullSyncVersion;
- (unint64_t)syncVersionForMailboxId:(id)a3;
- (unint64_t)syncedMessagesCount;
- (unint64_t)syncedMessagesCountForMailboxId:(id)a3;
- (void)_deleteAllObjectsFromTable:(id)a3;
- (void)_deleteAllObjectsFromTable:(id)a3 mailboxId:(id)a4;
- (void)_insureTransactionFor:(id)a3;
- (void)_loadAllControlValues;
- (void)_removeAllPendingAttachments;
- (void)_removeAttachmentsForComposedMessageId:(id)a3;
- (void)_removeControlValueForKey:(id)a3;
- (void)_setControlValueForKey:(id)a3 withBlockForBinding:(id)a4;
- (void)addObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 forIDSIdentifierNotYetAckd:(id)a6;
- (void)addOrUpdateMailbox:(id)a3;
- (void)addOrUpdateSyncedAccount:(id)a3;
- (void)addOrUpdateSyncedMessage:(id)a3;
- (void)beginUpdates;
- (void)cleanUpForFullSyncWithMailbox:(id)a3;
- (void)cleanUpForInitialSync;
- (void)datesForIDSIdentifiersScheduledToBeResent;
- (void)deleteAllMailboxes;
- (void)deleteMailboxWithId:(id)a3;
- (void)deleteMailboxWithId:(id)a3 startTransaction:(BOOL)a4;
- (void)deleteObjectId:(id)a3 fromIDSIdentifiersNotYetAckdOfType:(id)a4;
- (void)endUpdates;
- (void)hasMailboxSyncedActive;
- (void)incrementSyncVersionForMailboxId:(id)a3;
- (void)insertDeletedMessageId:(id)a3 mailboxId:(id)a4;
- (void)markIDSIdentifierAsAckd:(id)a3;
- (void)pendingComposedMessageIds;
- (void)prepareIDSIdentifiersForResendForErrorCode:(int64_t)a3;
- (void)removePendingComposedMessages;
- (void)removeProgressForComposedMessageWithId:(id)a3;
- (void)removeSyncedAccountForAccountWithId:(id)a3;
- (void)removeSyncedMessageForMessageWithId:(id)a3;
- (void)removeSyncedMessagesBeforeDateReceived:(id)a3 mailbox:(id)a4;
- (void)rescheduleIDSIdentifier:(id)a3 resendInterval:(unint64_t)a4 withDateToResend:(id)a5 errorCode:(int64_t)a6;
- (void)resetSyncRequestedFromMailboxes;
- (void)saveAttachmentsForComposedMessageId:(id)a3 temporaryURL:(id)a4;
- (void)setCurrentDatabaseSchemaVersion:(unint64_t)a3;
- (void)setDatabase:(id)a3;
- (void)setDeviceScreenScale:(double)a3;
- (void)setDeviceScreenWidth:(double)a3;
- (void)setDisconnectedSince:(id)a3;
- (void)setFullSyncVersion:(unint64_t)a3;
- (void)setIsMessagesSyncSuspendedByConnectivity:(BOOL)a3;
- (void)setOrganizeByThread:(BOOL)a3;
- (void)setPendingComposedMessages:(id)a3;
- (void)setProgress:(int64_t)a3 forComposedMessageWithId:(id)a4;
- (void)setProtectedContentChannelSupported:(BOOL)a3;
- (void)setSupportsWebKit:(id)a3;
- (void)storePendingComposedMessage:(id)a3;
- (void)syncedAccountIdsResendRequested;
- (void)updateSourceType:(unint64_t)a3 forAccountId:(id)a4;
- (void)updateSyncActiveForMailbox:(id)a3;
- (void)updateSyncEnabledForMailbox:(id)a3;
- (void)updateSyncRequestedForMailbox:(id)a3;
- (void)updateSyncVersion:(unint64_t)a3 forMailboxId:(id)a4;
@end

@implementation NNMKDeviceSyncRegistry

- (NNMKDeviceSyncRegistry)initWithPath:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NNMKDeviceSyncRegistry;
  v5 = [(NNMKDeviceSyncRegistry *)&v35 init];
  if (!v5) {
    goto LABEL_29;
  }
  unsigned int v34 = 0;
  v6 = [[NNMKSQLiteConnection alloc] initWithPath:v4 errorCode:&v34];
  p_database = (id *)&v5->_database;
  database = v5->_database;
  v5->_database = v6;

  uint64_t v9 = objc_opt_new();
  pendingComposedMessages = v5->_pendingComposedMessages;
  v5->_pendingComposedMessages = (NSMutableDictionary *)v9;

  BOOL v11 = +[NNMKSQLiteConnection errorCodeMeansCorruptedDatabase:v34];
  v12 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "Initializing database...", buf, 2u);
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry initWithPath:]();
    }
    goto LABEL_15;
  }
  v13 = [MEMORY[0x263F08850] defaultManager];
  int v14 = [v13 fileExistsAtPath:v4 isDirectory:0];

  if (!v14)
  {
LABEL_15:
    v5->_recreatedFromScratch = 1;
    v22 = v5->_database;
    v5->_database = 0;

    v23 = [MEMORY[0x263F08850] defaultManager];
    [v23 removeItemAtPath:v4 error:0];

    v24 = [[NNMKSQLiteConnection alloc] initWithPath:v4 errorCode:&v34];
    v25 = v5->_database;
    v5->_database = v24;

    if (+[NNMKSQLiteConnection errorCodeMeansCorruptedDatabase:v34]&& os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry initWithPath:]();
    }
    goto LABEL_18;
  }
  if ([*p_database tableExists:@"CONTROL" inDatabase:0])
  {
    [(NNMKDeviceSyncRegistry *)v5 _loadAllControlValues];
    uint64_t v15 = [(NNMKDeviceSyncRegistry *)v5 currentDatabaseSchemaVersion];
    v16 = (void *)qword_26AC21850;
    BOOL v17 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
    if (v15 != 36)
    {
      if (v17)
      {
        v20 = v16;
        uint64_t v21 = [(NNMKDeviceSyncRegistry *)v5 currentDatabaseSchemaVersion];
        *(_DWORD *)buf = 134218240;
        uint64_t v37 = v21;
        __int16 v38 = 2048;
        uint64_t v39 = 36;
        _os_log_impl(&dword_23D3DF000, v20, OS_LOG_TYPE_DEFAULT, "Database from a previous version (%lu) already existed (Correct version should be %lu). Recreating...", buf, 0x16u);
      }
      goto LABEL_15;
    }
    if (v17)
    {
      v18 = v16;
      uint64_t v19 = [(NNMKDeviceSyncRegistry *)v5 currentDatabaseSchemaVersion];
      *(_DWORD *)buf = 134218496;
      uint64_t v37 = 36;
      __int16 v38 = 2048;
      uint64_t v39 = v19;
      __int16 v40 = 2048;
      uint64_t v41 = 1;
      _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Database migration does not need to run. (Expected schema version: %lu, Current schema version: %lu, Path exist: %lu)", buf, 0x20u);
    }
  }
  v5->_recreatedFromScratch = 0;
LABEL_18:
  if (([*p_database tableExists:@"CONTROL" inDatabase:0] & 1) == 0)
  {
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 pathForResource:@"DeviceSyncRegistryTables" ofType:@"sql"];

    v28 = [NSString stringWithContentsOfFile:v27 encoding:1 error:0];
    int v29 = [(NNMKSQLiteConnection *)v5->_database executeSQL:v28];
    v30 = qword_26AC21850;
    if (v29)
    {
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        -[NNMKDeviceSyncRegistry initWithPath:]((uint64_t)&v5->_database, v30);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D3DF000, v30, OS_LOG_TYPE_DEFAULT, "Database tables created.", buf, 2u);
      }
      [(NNMKDeviceSyncRegistry *)v5 setCurrentDatabaseSchemaVersion:36];
      v31 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t fullSyncVersion = v5->_fullSyncVersion;
        *(_DWORD *)buf = 134217984;
        uint64_t v37 = fullSyncVersion;
        _os_log_impl(&dword_23D3DF000, v31, OS_LOG_TYPE_DEFAULT, "Restoring full sync version. %lu", buf, 0xCu);
      }
      [(NNMKDeviceSyncRegistry *)v5 setFullSyncVersion:v5->_fullSyncVersion];
    }
  }
  [(NNMKDeviceSyncRegistry *)v5 _loadAllControlValues];
LABEL_29:

  return v5;
}

- (void)setFullSyncVersion:(unint64_t)a3
{
  self->_unint64_t fullSyncVersion = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__NNMKDeviceSyncRegistry_setFullSyncVersion___block_invoke;
  v3[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  v3[4] = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kFullMessagesSyncVersionKey" withBlockForBinding:v3];
}

uint64_t __45__NNMKDeviceSyncRegistry_setFullSyncVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindUnsignedInteger:*(void *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)setSupportsWebKit:(id)a3
{
  id v4 = (NSNumber *)a3;
  self->_supportsWebKit = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__NNMKDeviceSyncRegistry_setSupportsWebKit___block_invoke;
  v6[3] = &unk_264E9A278;
  v7 = v4;
  v5 = v4;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kSupportsWebKitKey" withBlockForBinding:v6];
}

uint64_t __44__NNMKDeviceSyncRegistry_setSupportsWebKit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v6 = [v5 BOOLValue];
  }
  else {
    uint64_t v6 = 0;
  }
  return +[NNMKSQLiteUtils bindBool:v6 intoStatement:a2 paramIndex:a3];
}

- (void)setCurrentDatabaseSchemaVersion:(unint64_t)a3
{
  self->_currentDatabaseSchemaVersion = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__NNMKDeviceSyncRegistry_setCurrentDatabaseSchemaVersion___block_invoke;
  v3[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  v3[4] = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"DBSchemaVersion" withBlockForBinding:v3];
}

uint64_t __58__NNMKDeviceSyncRegistry_setCurrentDatabaseSchemaVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindUnsignedInteger:*(void *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)setIsMessagesSyncSuspendedByConnectivity:(BOOL)a3
{
  self->_isMessagesSyncSuspendedByConnectivity = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__NNMKDeviceSyncRegistry_setIsMessagesSyncSuspendedByConnectivity___block_invoke;
  v3[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  BOOL v4 = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kIsMessagesSyncSuspendedByConnectivity" withBlockForBinding:v3];
}

uint64_t __67__NNMKDeviceSyncRegistry_setIsMessagesSyncSuspendedByConnectivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:*(unsigned __int8 *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)setOrganizeByThread:(BOOL)a3
{
  self->_organizeByThread = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__NNMKDeviceSyncRegistry_setOrganizeByThread___block_invoke;
  v3[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  BOOL v4 = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kOrganizeByThreadKey" withBlockForBinding:v3];
}

uint64_t __46__NNMKDeviceSyncRegistry_setOrganizeByThread___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:*(unsigned __int8 *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)setDeviceScreenWidth:(double)a3
{
  self->_deviceScreenWidth = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__NNMKDeviceSyncRegistry_setDeviceScreenWidth___block_invoke;
  v3[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  *(double *)&void v3[4] = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kDeviceScreenWidthKey" withBlockForBinding:v3];
}

uint64_t __47__NNMKDeviceSyncRegistry_setDeviceScreenWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDouble:a2 intoStatement:a3 paramIndex:*(double *)(a1 + 32)];
}

- (void)setDeviceScreenScale:(double)a3
{
  self->_deviceScreenScale = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__NNMKDeviceSyncRegistry_setDeviceScreenScale___block_invoke;
  v3[3] = &__block_descriptor_40_e26_v20__0__sqlite3_stmt__8i16l;
  *(double *)&void v3[4] = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kDeviceScreenScaleKey" withBlockForBinding:v3];
}

uint64_t __47__NNMKDeviceSyncRegistry_setDeviceScreenScale___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDouble:a2 intoStatement:a3 paramIndex:*(double *)(a1 + 32)];
}

- (void)setProtectedContentChannelSupported:(BOOL)a3
{
  self->_protectedContentChannelSupported = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__NNMKDeviceSyncRegistry_setProtectedContentChannelSupported___block_invoke;
  v3[3] = &__block_descriptor_33_e26_v20__0__sqlite3_stmt__8i16l;
  BOOL v4 = a3;
  [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kProtectedContentChannelSupportedKey" withBlockForBinding:v3];
}

uint64_t __62__NNMKDeviceSyncRegistry_setProtectedContentChannelSupported___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindBool:*(unsigned __int8 *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)setDisconnectedSince:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_disconnectedSince, a3);
  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__NNMKDeviceSyncRegistry_setDisconnectedSince___block_invoke;
    v6[3] = &unk_264E9A278;
    id v7 = v5;
    [(NNMKDeviceSyncRegistry *)self _setControlValueForKey:@"kDisconnectedSinceKey" withBlockForBinding:v6];
  }
  else
  {
    [(NNMKDeviceSyncRegistry *)self _removeControlValueForKey:@"kDisconnectedSinceKey"];
  }
}

uint64_t __47__NNMKDeviceSyncRegistry_setDisconnectedSince___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NNMKSQLiteUtils bindDate:*(void *)(a1 + 32) intoStatement:a2 paramIndex:a3];
}

- (void)beginUpdates
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Trying to start a transaction, but a transaction has already been started.", v2, v3, v4, v5, v6);
}

- (void)endUpdates
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Trying to commit a transaction, but a transaction has not been started.", v2, v3, v4, v5, v6);
}

- (void)cleanUpForFullSyncWithMailbox:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__NNMKDeviceSyncRegistry_cleanUpForFullSyncWithMailbox___block_invoke;
  v6[3] = &unk_264E99F48;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v6];
}

void __56__NNMKDeviceSyncRegistry_cleanUpForFullSyncWithMailbox___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSyncActive:0];
  [*(id *)(a1 + 40) updateSyncActiveForMailbox:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) mailboxId];
  [v2 _deleteAllObjectsFromTable:@"SYNCED_MESSAGE" mailboxId:v3];

  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) mailboxId];
  [v4 _deleteAllObjectsFromTable:@"DELETED_MESSAGE" mailboxId:v5];

  uint8_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) mailboxId];
  [v6 _deleteAllObjectsFromTable:@"ATTACHMENT_NOT_SYNCED" mailboxId:v7];

  v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) mailboxId];
  [v8 incrementSyncVersionForMailboxId:v9];

  v10 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    BOOL v11 = *(void **)(a1 + 40);
    v13 = v10;
    int v14 = [v12 mailboxId];
    uint64_t v15 = [v11 syncVersionForMailboxId:v14];
    v16 = [*(id *)(a1 + 32) mailboxId];
    int v17 = 134218242;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    v20 = v16;
    _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "Incrementing #mailbox-sync-version. %lu, %{public}@", (uint8_t *)&v17, 0x16u);
  }
}

- (void)incrementSyncVersionForMailboxId:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(NNMKDeviceSyncRegistry *)self syncVersionForMailboxId:v4];
  uint8_t v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    unint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Incrementing #mailbox-sync-version. Current #mailbox-sync-version:%lu, mailbox: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(NNMKDeviceSyncRegistry *)self updateSyncVersion:v5 + 1 forMailboxId:v4];
}

- (void)cleanUpForInitialSync
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__NNMKDeviceSyncRegistry_cleanUpForInitialSync__block_invoke;
  v2[3] = &unk_264E99F20;
  v2[4] = self;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v2];
}

void __47__NNMKDeviceSyncRegistry_cleanUpForInitialSync__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 40);
  double v4 = *(double *)(v2 + 48);
  uint64_t v5 = *(unsigned __int8 *)(v2 + 10);
  uint8_t v6 = *(void **)(v2 + 56);
  uint64_t v7 = *(void *)(v2 + 64);
  *(void *)(v2 + 48) = 0;
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  unint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[3];
  id v10 = v6;
  [v8 _deleteAllObjectsFromTable:@"SYNCED_ACCOUNT"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"MAILBOX"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"MAILBOX_SYNC_VERSION"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"CONTROL"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"SYNCED_MESSAGE"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"DELETED_MESSAGE"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"ATTACHMENT_NOT_SYNCED"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"IDS_IDENTIFIER_NOT_YET_ACKD"];
  [*(id *)(a1 + 32) _deleteAllObjectsFromTable:@"IDS_IDENTIFIER_OBJECT"];
  [*(id *)(a1 + 32) setFullSyncVersion:v9 + 1];
  [*(id *)(a1 + 32) setCurrentDatabaseSchemaVersion:v7];
  [*(id *)(a1 + 32) setDeviceScreenScale:v4];
  [*(id *)(a1 + 32) setDeviceScreenWidth:v3];
  [*(id *)(a1 + 32) setProtectedContentChannelSupported:v5];
  [*(id *)(a1 + 32) setDisconnectedSince:v10];
}

- (BOOL)containsSyncedMessageForMessageWithId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT 1 FROM SYNCED_MESSAGE WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    BOOL v8 = v7 == 100;
  }
  else
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry containsSyncedMessageForMessageWithId:]((uint64_t)p_database, v9);
    }
    BOOL v8 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (id)syncedMessageForMessageWithId:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NNMKDeviceSyncRegistry_syncedMessageForMessageWithId___block_invoke;
  v9[3] = &unk_264E9A2C0;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesWhere:@"ID = ?" blockForBinding:v9];
  if ([v6 count])
  {
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __56__NNMKDeviceSyncRegistry_syncedMessageForMessageWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (void)addOrUpdateSyncedMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke;
  v6[3] = &unk_264E99F48;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v6];
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"INSERT OR REPLACE INTO SYNCED_MESSAGE (ID, STATUS, STATUS_VERSION, DATE_RECEIVED, USED_PROTECTED_CHANNEL, USED_NOTIFICATION_PRIORITY, CONTENT_SYNCED, CONTENT_SYNCED_NOTIFICATION_PRIORITY, CONTENT_SYNCED_BECAUSE_USER_REQUESTED, CONTENT_REQUESTED_BY_USER, CONVERSATION_ID, RESEND_REQUESTED, RESEND_INTERVAL, CONTENT_RESEND_INTERVAL, MAILBOX_ID, THREAD_SPECIFIC, SPECIAL_MAILBOX_SPECIFIC, SANITIZED_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
  id v4 = [v2[1] messageId];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v3 paramIndex:1];

  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v2[1] status], v3, 2);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v2[1] statusVersion], v3, 3);
  id v5 = [v2[1] dateReceived];
  +[NNMKSQLiteUtils bindDate:v5 intoStatement:v3 paramIndex:4];

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] usedProtectedChannelForMessageSync], v3, 5);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] usedNotificationPriorityForMessageSync], v3, 6);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] contentSynced], v3, 7);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] contentSyncedUsingNotificationPriority], v3, 8);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] contentSyncedBecauseUserRequested], v3, 9);
  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] contentRequestedByUser], v3, 10);
  uint64_t v6 = [v2[1] conversationId];
  +[NNMKSQLiteUtils bindString:v6 intoStatement:v3 paramIndex:11];

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] resendRequested], v3, 12);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v2[1] resendInterval], v3, 13);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v2[1] contentResendInterval], v3, 14);
  id v7 = [v2[1] mailboxId];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v3 paramIndex:15];

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v2[1] isThreadSpecific], v3, 16);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v2[1] isSpecialMailboxSpecific], v3, 17);
  BOOL v8 = [v2[1] sanitizedMessageId];
  +[NNMKSQLiteUtils bindString:v8 intoStatement:v3 paramIndex:18];

  uint64_t v23 = (uint64_t)v2;
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*((id *)*v2 + 9) stepPreparedStatement:v3]))
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_3((uint64_t)v2, v9);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"DELETE FROM ATTACHMENT_NOT_SYNCED WHERE MESSAGE_ID = ?"];
  uint64_t v11 = [*(id *)(a1 + 40) messageId];
  +[NNMKSQLiteUtils bindString:v11 intoStatement:v10 paramIndex:1];

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*(id *)(*(void *)(a1 + 32) + 72) stepPreparedStatement:v10]))
  {
    v12 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_2((uint64_t)v2, v12);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v10];
  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"INSERT INTO ATTACHMENT_NOT_SYNCED (MESSAGE_ID, CONTENT_ID, MAILBOX_ID) VALUES (?, ?, ?)"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v14 = [*(id *)(a1 + 40) attachmentsContentIdsNotYetSynced];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    v22 = &v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
        v20 = objc_msgSend(*(id *)(a1 + 40), "messageId", v22);
        +[NNMKSQLiteUtils bindString:v20 intoStatement:v13 paramIndex:1];

        +[NNMKSQLiteUtils bindString:v19 intoStatement:v13 paramIndex:2];
        +[NNMKSQLiteUtils bindString:v19 intoStatement:v13 paramIndex:3];
        if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*(id *)(*(void *)(a1 + 32) + 72) stepPreparedStatement:v13]))
        {
          uint64_t v21 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
            __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_1(v28, v23, v21, v22);
          }
        }
        +[NNMKSQLiteUtils closeExecutedPreparedStatement:v13];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)removeSyncedMessageForMessageWithId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"DELETE FROM SYNCED_MESSAGE WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6]])
  {
    id v7 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry removeSyncedMessageForMessageWithId:]((uint64_t)p_database, v7);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
}

- (id)syncedMessagesForConversationWithId:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__NNMKDeviceSyncRegistry_syncedMessagesForConversationWithId___block_invoke;
  v8[3] = &unk_264E9A2C0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesWhere:@"CONVERSATION_ID = ?" blockForBinding:v8];

  return v6;
}

uint64_t __62__NNMKDeviceSyncRegistry_syncedMessagesForConversationWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (id)syncedMessageIdsResendRequested
{
  return [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesIdsWhere:@"RESEND_REQUESTED = ?" count:0 blockForBinding:&__block_literal_global_3];
}

uint64_t __57__NNMKDeviceSyncRegistry_syncedMessageIdsResendRequested__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindBool:1 intoStatement:a2 paramIndex:1];
}

- (id)syncedMessageIdsContentRequestedByUser
{
  return [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesIdsWhere:@"CONTENT_REQUESTED_BY_USER = ?" count:0 blockForBinding:&__block_literal_global_98];
}

uint64_t __64__NNMKDeviceSyncRegistry_syncedMessageIdsContentRequestedByUser__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindBool:1 intoStatement:a2 paramIndex:1];
}

- (id)firstSyncedMessageIdsContentNotSyncedOrRequestedByUser:(unint64_t)a3
{
  return [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesIdsWhere:@"((CONTENT_SYNCED = ?) OR ((SELECT COUNT(1) FROM ATTACHMENT_NOT_SYNCED WHERE MESSAGE_ID = ID) > 0)) AND (CONTENT_REQUESTED_BY_USER = ?)" count:a3 blockForBinding:&__block_literal_global_103];
}

uint64_t __81__NNMKDeviceSyncRegistry_firstSyncedMessageIdsContentNotSyncedOrRequestedByUser___block_invoke(uint64_t a1, uint64_t a2)
{
  +[NNMKSQLiteUtils bindBool:0 intoStatement:a2 paramIndex:1];
  return +[NNMKSQLiteUtils bindBool:1 intoStatement:a2 paramIndex:2];
}

- (id)oldestDateReceivedForMailboxId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT MIN(DATE_RECEIVED) FROM SYNCED_MESSAGE WHERE THREAD_SPECIFIC = 0 AND SPECIAL_MAILBOX_SPECIFIC = 0 AND MAILBOX_ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    if (v7 == 100)
    {
      BOOL v8 = +[NNMKSQLiteUtils dateFromStatement:v6 columnIndex:0];
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry oldestDateReceivedForMailboxId:]((uint64_t)p_database, v9);
    }
  }
  BOOL v8 = 0;
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (unint64_t)syncedMessagesCount
{
  return [(NNMKDeviceSyncRegistry *)self syncedMessagesCountForMailboxId:0];
}

- (unint64_t)syncedMessagesCountForMailboxId:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] stringWithFormat:@"SELECT COUNT(ID) FROM SYNCED_MESSAGE "];
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 appendString:@"WHERE MAILBOX_ID = ? "];
    database = self->_database;
    p_database = &self->_database;
    uint64_t v9 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:v6];
    +[NNMKSQLiteUtils bindString:v4 intoStatement:v9 paramIndex:1];
  }
  else
  {
    uint64_t v10 = self->_database;
    p_database = &self->_database;
    uint64_t v9 = [(NNMKSQLiteConnection *)v10 preparedStatementForPattern:v5];
  }
  uint64_t v11 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v9];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v11])
  {
    uint64_t v13 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry syncedMessagesCountForMailboxId:]((uint64_t)p_database, v13);
    }
    goto LABEL_9;
  }
  if (v11 != 100)
  {
LABEL_9:
    unint64_t v12 = 0;
    goto LABEL_10;
  }
  unint64_t v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:0];
LABEL_10:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v9];

  return v12;
}

- (id)messageIdForSanitizedMessageId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT ID FROM SYNCED_MESSAGE WHERE SANITIZED_ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    if (v7 == 100)
    {
      BOOL v8 = +[NNMKSQLiteUtils stringFromStatement:v6 columnIndex:0];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry messageIdForSanitizedMessageId:]((uint64_t)p_database, v9);
    }
  }
  BOOL v8 = 0;
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (void)removeSyncedMessagesBeforeDateReceived:(id)a3 mailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke;
  v10[3] = &unk_264E9A308;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v10];
}

uint64_t __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"DELETE FROM SYNCED_MESSAGE WHERE DATE_RECEIVED < ? AND MAILBOX_ID = ?"];
  +[NNMKSQLiteUtils bindDate:*(void *)(v1 + 8) intoStatement:v2 paramIndex:1];
  uint64_t v3 = [*(id *)(v1 + 16) mailboxId];
  +[NNMKSQLiteUtils bindString:v3 intoStatement:v2 paramIndex:2];

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*(id *)(*(void *)v1 + 72) stepPreparedStatement:v2]))
  {
    id v4 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke_cold_1(v1, v4);
    }
  }
  return +[NNMKSQLiteUtils closeExecutedPreparedStatement:v2];
}

- (id)syncedMessagesKeyedByMessageIdAfterDateReceived:(id)a3 mailboxId:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke;
    v26[3] = &unk_264E9A330;
    id v9 = &v27;
    id v27 = v7;
    id v28 = v6;
    uint64_t v10 = [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesWhere:@"MAILBOX_ID = ? AND DATE_RECEIVED >= ?" blockForBinding:v26];
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke_2;
    v24[3] = &unk_264E9A2C0;
    id v9 = &v25;
    id v25 = v7;
    uint64_t v10 = [(NNMKDeviceSyncRegistry *)self _selectSyncedMessagesWhere:@"MAILBOX_ID = ? AND ID IS NOT NULL" blockForBinding:v24];
  }

  id v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "messageId", (void)v20);
        [v11 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v14);
  }

  return v11;
}

uint64_t __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke(uint64_t a1, uint64_t a2)
{
  +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
  uint64_t v4 = *(void *)(a1 + 40);
  return +[NNMKSQLiteUtils bindDate:v4 intoStatement:a2 paramIndex:2];
}

uint64_t __84__NNMKDeviceSyncRegistry_syncedMessagesKeyedByMessageIdAfterDateReceived_mailboxId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (id)allSyncedAccountsKeyedByAccountId
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(NNMKDeviceSyncRegistry *)self _selectSyncedAccountsWhere:0 blockForBinding:&__block_literal_global_127];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "accountId", (void)v12);
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)syncedAccountForAccountWithId:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NNMKDeviceSyncRegistry_syncedAccountForAccountWithId___block_invoke;
  v9[3] = &unk_264E9A2C0;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(NNMKDeviceSyncRegistry *)self _selectSyncedAccountsWhere:@"ID = ?" blockForBinding:v9];
  if ([v6 count])
  {
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __56__NNMKDeviceSyncRegistry_syncedAccountForAccountWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (void)addOrUpdateSyncedAccount:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO SYNCED_ACCOUNT (ID, DISPLAY_NAME, SHOULD_ARCHIVE, EMAIL_ADDRESSES, DEFAULT_ADDRESS, RESEND_REQUESTED, RESEND_INTERVAL, SOURCE_TYPE, USERNAME, LOCAL_ID, TYPE_IDENTIFIER, EMAIL_ADDRESS_TOKEN, PCC_EMAIL_ADDRESS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
  uint64_t v7 = [v5 accountId];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v6 paramIndex:1];

  id v8 = [v5 displayName];
  +[NNMKSQLiteUtils bindString:v8 intoStatement:v6 paramIndex:2];

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v5 shouldArchive], v6, 3);
  id v9 = [v5 emailAddresses];
  id v10 = [v9 componentsJoinedByString:@"\n"];
  +[NNMKSQLiteUtils bindString:v10 intoStatement:v6 paramIndex:4];

  id v11 = [v5 defaultEmailAddress];
  +[NNMKSQLiteUtils bindString:v11 intoStatement:v6 paramIndex:5];

  +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v5 resendRequested], v6, 6);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v5 resendInterval], v6, 7);
  +[NNMKSQLiteUtils bindUnsignedInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindUnsignedInteger:intoStatement:paramIndex:", [v5 sourceType], v6, 8);
  long long v12 = [v5 username];
  +[NNMKSQLiteUtils bindString:v12 intoStatement:v6 paramIndex:9];

  long long v13 = [v5 localId];
  +[NNMKSQLiteUtils bindString:v13 intoStatement:v6 paramIndex:10];

  long long v14 = [v5 typeIdentifier];
  +[NNMKSQLiteUtils bindString:v14 intoStatement:v6 paramIndex:11];

  long long v15 = [v5 emailAddressToken];
  +[NNMKSQLiteUtils bindString:v15 intoStatement:v6 paramIndex:12];

  uint64_t v16 = [v5 pccEmailAddress];

  +[NNMKSQLiteUtils bindString:v16 intoStatement:v6 paramIndex:13];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6]])
  {
    uint64_t v17 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry addOrUpdateSyncedAccount:]((uint64_t)p_database, v17);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
}

- (void)removeSyncedAccountForAccountWithId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"DELETE FROM SYNCED_ACCOUNT WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6]])
  {
    uint64_t v7 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry removeSyncedAccountForAccountWithId:]((uint64_t)p_database, v7);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
}

- (id)syncedAccountIdsResendRequested
{
  p_database = &self->_database;
  uint64_t v3 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"SELECT ID FROM SYNCED_ACCOUNT WHERE RESEND_REQUESTED = ?"];
  +[NNMKSQLiteUtils bindBool:1 intoStatement:v3 paramIndex:1];
  uint64_t v4 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v3];
  id v5 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v4])
  {
    if (v4 == 100)
    {
      do
      {
        uint64_t v6 = +[NNMKSQLiteUtils stringFromStatement:v3 columnIndex:0];
        if (v6) {
          [v5 addObject:v6];
        }
        int v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v3];
      }
      while (v7 == 100);
    }
  }
  else
  {
    id v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)p_database syncedAccountIdsResendRequested];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  return v5;
}

- (unint64_t)accountSourceTypeForMessageId:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT A.SOURCE_TYPE FROM SYNCED_MESSAGE SM LEFT OUTER JOIN  MAILBOX M ON SM.MAILBOX_ID = M.ID LEFT OUTER JOIN SYNCED_ACCOUNT A ON A.ID = M.ACCOUNT_ID  WHERE SM.ID = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v7 paramIndex:1];
  uint64_t v8 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7];
  BOOL v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v8];
  if (v8 != 100 || !v9)
  {
    id v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry accountSourceTypeForMessageId:]((uint64_t)p_database, v11);
    }
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v7 columnIndex:0];
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];

  return v12;
}

- (unint64_t)accountSourceTypeForMailboxId:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT A.SOURCE_TYPE FROM MAILBOX M LEFT OUTER JOIN SYNCED_ACCOUNT A ON A.ID = M.ACCOUNT_ID  WHERE M.ID = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v7 paramIndex:1];
  uint64_t v8 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7];
  BOOL v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v8];
  if (v8 != 100 || !v9)
  {
    id v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry accountSourceTypeForMailboxId:]((uint64_t)p_database, v11);
    }
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v7 columnIndex:0];
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];

  return v12;
}

- (unint64_t)accountSourceTypeForAccountId:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT SOURCE_TYPE FROM SYNCED_ACCOUNT WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v7 paramIndex:1];
  uint64_t v8 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7];
  BOOL v9 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v8];
  if (v8 != 100 || !v9)
  {
    id v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry accountSourceTypeForAccountId:]((uint64_t)p_database, v11);
    }
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v7 columnIndex:0];
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];

  return v12;
}

- (id)accountIdForUsername:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT ID FROM SYNCED_ACCOUNT WHERE USERNAME = ? COLLATE NOCASE"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  BOOL v8 = +[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7];
  if (v7 != 100 || !v8)
  {
    id v10 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry accountIdForUsername:]((uint64_t)p_database, v10);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = +[NNMKSQLiteUtils stringFromStatement:v6 columnIndex:0];
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v11;
}

- (void)updateSourceType:(unint64_t)a3 forAccountId:(id)a4
{
  id v6 = a4;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v9 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"UPDATE SYNCED_ACCOUNT SET SOURCE_TYPE = ? WHERE ID = ?"];
  +[NNMKSQLiteUtils bindUnsignedInteger:a3 intoStatement:v9 paramIndex:1];
  +[NNMKSQLiteUtils bindString:v6 intoStatement:v9 paramIndex:2];
  int v10 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v9];
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v9];
  id v11 = (void *)qword_26AC21850;
  if (v10 == 101)
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
      -[NNMKDeviceSyncRegistry updateSourceType:forAccountId:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKDeviceSyncRegistry updateSourceType:forAccountId:]((uint64_t)p_database, v11);
  }
}

- (void)addOrUpdateMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mailboxId];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 url];

    if (!v7)
    {
      BOOL v8 = (void *)qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_FAULT)) {
        -[NNMKDeviceSyncRegistry addOrUpdateMailbox:].cold.4(v8);
      }
    }
    database = self->_database;
    p_database = &self->_database;
    uint64_t v11 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO MAILBOX (ID, TYPE, FILTER_TYPE, CUSTOM_NAME, URL, SYNC_ACTIVE, ACCOUNT_ID, SYNC_ENABLED, SYNC_REQUESTED, ACCOUNT_LOCAL_ID, SYNC_REQUESTED_DATE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
    unint64_t v12 = [v4 mailboxId];
    +[NNMKSQLiteUtils bindString:v12 intoStatement:v11 paramIndex:1];

    +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", [v4 type], v11, 2);
    +[NNMKSQLiteUtils bindInteger:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindInteger:intoStatement:paramIndex:", [v4 filterType], v11, 3);
    long long v13 = [v4 customName];
    +[NNMKSQLiteUtils bindString:v13 intoStatement:v11 paramIndex:4];

    long long v14 = [v4 url];
    long long v15 = [v14 absoluteString];
    +[NNMKSQLiteUtils bindString:v15 intoStatement:v11 paramIndex:5];

    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v4 syncActive], v11, 6);
    uint64_t v16 = [v4 accountId];
    +[NNMKSQLiteUtils bindString:v16 intoStatement:v11 paramIndex:7];

    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v4 syncEnabled], v11, 8);
    +[NNMKSQLiteUtils bindBool:intoStatement:paramIndex:](NNMKSQLiteUtils, "bindBool:intoStatement:paramIndex:", [v4 syncRequested], v11, 9);
    uint64_t v17 = [v4 accountLocalId];
    +[NNMKSQLiteUtils bindString:v17 intoStatement:v11 paramIndex:10];

    uint64_t v18 = [v4 syncRequestedDate];
    +[NNMKSQLiteUtils bindDate:v18 intoStatement:v11 paramIndex:11];

    int v19 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v11];
    +[NNMKSQLiteUtils closeExecutedPreparedStatement:v11];
    long long v20 = (void *)qword_26AC21850;
    if (v19 == 101)
    {
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
        -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](v20);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry addOrUpdateMailbox:]((uint64_t)p_database, v20);
    }
  }
  else
  {
    long long v21 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry addOrUpdateMailbox:](v21);
    }
  }
}

- (id)mailboxes
{
  return [(NNMKDeviceSyncRegistry *)self _selectMailboxesWhere:0 blockForBinding:&__block_literal_global_160];
}

- (id)syncEnabledMailboxes
{
  return [(NNMKDeviceSyncRegistry *)self _selectMailboxesWhere:@"SYNC_ENABLED = 1" blockForBinding:&__block_literal_global_165];
}

- (id)activeMailboxes
{
  return [(NNMKDeviceSyncRegistry *)self _selectMailboxesWhere:@"SYNC_ENABLED = 1 AND SYNC_ACTIVE = 1" blockForBinding:&__block_literal_global_170];
}

- (void)deleteMailboxWithId:(id)a3
{
}

- (void)deleteMailboxWithId:(id)a3 startTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(NNMKSQLiteConnection *)self->_database beginTransaction];
  }
  p_database = &self->_database;
  BOOL v8 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"DELETE FROM MAILBOX WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v6 intoStatement:v8 paramIndex:1];
  int v9 = [(NNMKSQLiteConnection *)self->_database stepPreparedStatement:v8];
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v8];
  [(NNMKDeviceSyncRegistry *)self _deleteAllObjectsFromTable:@"SYNCED_MESSAGE" mailboxId:v6];
  [(NNMKDeviceSyncRegistry *)self _deleteAllObjectsFromTable:@"DELETED_MESSAGE" mailboxId:v6];
  [(NNMKDeviceSyncRegistry *)self _deleteAllObjectsFromTable:@"ATTACHMENT_NOT_SYNCED" mailboxId:v6];
  if (v9 != 101)
  {
    int v10 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      -[NNMKDeviceSyncRegistry deleteMailboxWithId:startTransaction:]((uint64_t)p_database, v10);
      if (!v4) {
        goto LABEL_11;
      }
    }
    else if (!v4)
    {
      goto LABEL_11;
    }
    [(NNMKSQLiteConnection *)*p_database rollbackTransaction];
    goto LABEL_11;
  }
  if (v4) {
    [(NNMKSQLiteConnection *)*p_database commitTransaction];
  }
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKDeviceSyncRegistry deleteMailboxWithId:startTransaction:]();
  }
LABEL_11:
}

- (void)resetSyncRequestedFromMailboxes
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error reseting sync requested flag for mailboxes. %{public}@", v6, v7, v8, v9, v10);
}

- (id)mailboxWithId:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__NNMKDeviceSyncRegistry_mailboxWithId___block_invoke;
  v9[3] = &unk_264E9A2C0;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(NNMKDeviceSyncRegistry *)self _selectMailboxesWhere:@"ID = ?" blockForBinding:v9];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

uint64_t __40__NNMKDeviceSyncRegistry_mailboxWithId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (id)mailboxesForAccountId:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NNMKDeviceSyncRegistry_mailboxesForAccountId___block_invoke;
  v8[3] = &unk_264E9A2C0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(NNMKDeviceSyncRegistry *)self _selectMailboxesWhere:@"ACCOUNT_ID = ?" blockForBinding:v8];

  return v6;
}

uint64_t __48__NNMKDeviceSyncRegistry_mailboxesForAccountId___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NNMKSQLiteUtils bindString:*(void *)(a1 + 32) intoStatement:a2 paramIndex:1];
}

- (unint64_t)syncVersionForMailboxId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT SYNC_VERSION FROM MAILBOX_SYNC_VERSION WHERE MAILBOX_ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    id v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry syncVersionForMailboxId:]((uint64_t)p_database, v9);
    }
    goto LABEL_6;
  }
  if (v7 != 100)
  {
LABEL_6:
    unint64_t v8 = 0;
    goto LABEL_7;
  }
  unint64_t v8 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v6 columnIndex:0];
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (void)updateSyncVersion:(unint64_t)a3 forMailboxId:(id)a4
{
  p_database = &self->_database;
  database = self->_database;
  id v7 = a4;
  uint64_t v8 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO MAILBOX_SYNC_VERSION (MAILBOX_ID, SYNC_VERSION) VALUES (?, ?)"];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v8 paramIndex:1];

  +[NNMKSQLiteUtils bindUnsignedInteger:a3 intoStatement:v8 paramIndex:2];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v8]])
  {
    id v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry updateSyncVersion:forMailboxId:]((uint64_t)p_database, v9);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v8];
}

- (void)insertDeletedMessageId:(id)a3 mailboxId:(id)a4
{
  p_database = &self->_database;
  database = self->_database;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO DELETED_MESSAGE (MESSAGE_ID, MAILBOX_ID) VALUES (?, ?)"];
  +[NNMKSQLiteUtils bindString:v8 intoStatement:v9 paramIndex:1];

  +[NNMKSQLiteUtils bindString:v7 intoStatement:v9 paramIndex:2];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v9]])
  {
    id v10 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry insertDeletedMessageId:mailboxId:]((uint64_t)p_database, v10);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v9];
}

- (id)mailboxIdForDeletedMessageId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT MAILBOX_ID FROM DELETED_MESSAGE WHERE MESSAGE_ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    if (v7 == 100)
    {
      id v8 = +[NNMKSQLiteUtils stringFromStatement:v6 columnIndex:0];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry mailboxIdForDeletedMessageId:]((uint64_t)p_database, v9);
    }
  }
  id v8 = 0;
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (void)deleteAllMailboxes
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting all mailboxes (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)updateSyncEnabledForMailbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mailboxId];
  id v7 = [(NNMKDeviceSyncRegistry *)self mailboxWithId:v5];

  uint64_t v6 = [v4 syncEnabled];
  [v7 setSyncEnabled:v6];
  [(NNMKDeviceSyncRegistry *)self addOrUpdateMailbox:v7];
}

- (void)updateSyncActiveForMailbox:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 syncActive];
    uint64_t v8 = [v4 mailboxId];
    int v11 = 134218242;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    long long v14 = v8;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Updating mailbox sync active: %lu (Mailbox: %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [v4 mailboxId];
  uint8_t v10 = [(NNMKDeviceSyncRegistry *)self mailboxWithId:v9];

  objc_msgSend(v10, "setSyncActive:", objc_msgSend(v4, "syncActive"));
  [(NNMKDeviceSyncRegistry *)self addOrUpdateMailbox:v10];
}

- (void)updateSyncRequestedForMailbox:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 syncRequested];
    uint64_t v8 = [v4 mailboxId];
    int v12 = 134218242;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Updating mailbox sync requested: %lu (Mailbox: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [v4 mailboxId];
  uint8_t v10 = [(NNMKDeviceSyncRegistry *)self mailboxWithId:v9];

  LODWORD(v9) = [v4 syncRequested];
  if (v9 != [v10 syncRequested])
  {
    objc_msgSend(v10, "setSyncRequested:", objc_msgSend(v4, "syncRequested"));
    if ([v4 syncRequested])
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF910]);
      [v10 setSyncRequestedDate:v11];
    }
    else
    {
      [v10 setSyncRequestedDate:0];
    }
    [(NNMKDeviceSyncRegistry *)self addOrUpdateMailbox:v10];
  }
}

- (id)_selectMailboxesWhere:(id)a3 blockForBinding:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, sqlite3_stmt *))a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  if (v6)
  {
    uint64_t v9 = [NSString stringWithFormat:@"WHERE %@", v6];
  }
  else
  {
    uint64_t v9 = &stru_26F11E918;
  }
  long long v22 = v9;
  long long v23 = v6;
  uint8_t v10 = [NSString stringWithFormat:@"SELECT ID, TYPE, FILTER_TYPE, CUSTOM_NAME, URL, SYNC_ACTIVE, ACCOUNT_ID, SYNC_ENABLED, SYNC_REQUESTED, ACCOUNT_LOCAL_ID, SYNC_REQUESTED_DATE FROM MAILBOX M %@", v9];
  p_database = &self->_database;
  int v12 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:v10];
  v7[2](v7, v12);
  uint64_t v13 = [(NNMKSQLiteConnection *)self->_database stepPreparedStatement:v12];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v13])
  {
    if (v13 == 100)
    {
      do
      {
        __int16 v14 = [(NNMKDeviceSyncRegistry *)self _mailboxFromCurrentRowInStatement:v12];
        uint64_t v15 = v14;
        if (v14
          && ([v14 mailboxId],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              uint64_t v17 = [v16 length],
              v16,
              v17))
        {
          [v8 addObject:v15];
        }
        else
        {
          uint64_t v18 = qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
            -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:](&buf, v25, v18);
          }
        }
        int v19 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v12];
      }
      while (v19 == 100);
    }
  }
  else
  {
    long long v20 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _selectMailboxesWhere:blockForBinding:]((uint64_t)v6, (uint64_t)p_database, v20);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v12];

  return v8;
}

- (id)_mailboxFromCurrentRowInStatement:(sqlite3_stmt *)a3
{
  id v4 = objc_alloc_init(NNMKMailbox);
  uint64_t v5 = +[NNMKSQLiteUtils stringFromStatement:a3 columnIndex:0];
  [(NNMKMailbox *)v4 setMailboxId:v5];

  [(NNMKMailbox *)v4 setType:+[NNMKSQLiteUtils integerFromStatement:a3 columnIndex:1]];
  [(NNMKMailbox *)v4 setFilterType:+[NNMKSQLiteUtils integerFromStatement:a3 columnIndex:2]];
  id v6 = +[NNMKSQLiteUtils stringFromStatement:a3 columnIndex:3];
  [(NNMKMailbox *)v4 setCustomName:v6];

  uint64_t v7 = NSURL;
  uint64_t v8 = +[NNMKSQLiteUtils stringFromStatement:a3 columnIndex:4];
  uint64_t v9 = [v7 URLWithString:v8];
  [(NNMKMailbox *)v4 setUrl:v9];

  [(NNMKMailbox *)v4 setSyncActive:+[NNMKSQLiteUtils BOOLFromStatement:a3 columnIndex:5]];
  uint8_t v10 = +[NNMKSQLiteUtils stringFromStatement:a3 columnIndex:6];
  [(NNMKMailbox *)v4 setAccountId:v10];

  [(NNMKMailbox *)v4 setSyncEnabled:+[NNMKSQLiteUtils BOOLFromStatement:a3 columnIndex:7]];
  [(NNMKMailbox *)v4 setSyncRequested:+[NNMKSQLiteUtils BOOLFromStatement:a3 columnIndex:8]];
  id v11 = +[NNMKSQLiteUtils stringFromStatement:a3 columnIndex:9];
  [(NNMKMailbox *)v4 setAccountLocalId:v11];

  int v12 = +[NNMKSQLiteUtils dateFromStatement:a3 columnIndex:10];
  [(NNMKMailbox *)v4 setSyncRequestedDate:v12];

  return v4;
}

- (void)setProgress:(int64_t)a3 forComposedMessageWithId:(id)a4
{
  p_database = &self->_database;
  database = self->_database;
  id v7 = a4;
  uint64_t v8 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO COMPOSED_MESSAGE (ID, PROGRESS) VALUES (?, ?)"];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v8 paramIndex:1];

  +[NNMKSQLiteUtils bindInteger:a3 intoStatement:v8 paramIndex:2];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v8]])
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry setProgress:forComposedMessageWithId:]((uint64_t)p_database, v9);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v8];
}

- (int64_t)progressForComposedMessageWithId:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT PROGRESS FROM COMPOSED_MESSAGE WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry progressForComposedMessageWithId:]((uint64_t)p_database, v9);
    }
    goto LABEL_6;
  }
  if (v7 != 100)
  {
LABEL_6:
    int64_t v8 = 0;
    goto LABEL_7;
  }
  int64_t v8 = +[NNMKSQLiteUtils integerFromStatement:v6 columnIndex:0];
LABEL_7:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v8;
}

- (id)pendingComposedMessageIds
{
  p_database = &self->_database;
  uint64_t v3 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"SELECT ID FROM COMPOSED_MESSAGE"];
  uint64_t v4 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v3];
  id v5 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v4])
  {
    if (v4 == 100)
    {
      do
      {
        uint64_t v6 = +[NNMKSQLiteUtils stringFromStatement:v3 columnIndex:0];
        if (v6) {
          [v5 addObject:v6];
        }
        int v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v3];
      }
      while (v7 == 100);
    }
  }
  else
  {
    int64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)p_database pendingComposedMessageIds];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  return v5;
}

- (void)removePendingComposedMessages
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting all composed messages (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)removeProgressForComposedMessageWithId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"DELETE FROM COMPOSED_MESSAGE WHERE ID = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v5 paramIndex:1];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)self->_database stepPreparedStatement:v5]])
  {
    uint64_t v6 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry removeProgressForComposedMessageWithId:]((uint64_t)&self->_database, v6);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v5];
  [(NNMKDeviceSyncRegistry *)self _removeAttachmentsForComposedMessageId:v4];
  [(NSMutableDictionary *)self->_pendingComposedMessages removeObjectForKey:v4];
}

- (id)attachmentsForComposedMessageId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NNMKDeviceSyncRegistry *)self _attachmentDirectory];
  uint64_t v6 = objc_msgSend(v4, "nnmk_sanitizedFileNameString");
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v7];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x263F08928];
    uint8_t v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    int v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    id v17 = 0;
    uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:&v17];
    id v14 = v17;

    if (!v13 || v14)
    {
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        -[NNMKDeviceSyncRegistry attachmentsForComposedMessageId:]();
      }
      id v15 = 0;
    }
    else
    {
      id v15 = v13;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)attachmentsFromURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v3];
  uint64_t v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v14 = 0;
  uint64_t v9 = [v5 unarchivedObjectOfClasses:v8 fromData:v4 error:&v14];
  id v10 = v14;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v12 = v9;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry attachmentsFromURL:]();
    }
    id v12 = 0;
  }

  return v12;
}

- (void)storePendingComposedMessage:(id)a3
{
  pendingComposedMessages = self->_pendingComposedMessages;
  id v4 = a3;
  id v5 = [v4 composedMessageId];
  [(NSMutableDictionary *)pendingComposedMessages setObject:v4 forKeyedSubscript:v5];
}

- (id)pendingComposedMessageWithId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pendingComposedMessages objectForKeyedSubscript:a3];
}

- (void)saveAttachmentsForComposedMessageId:(id)a3 temporaryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NNMKDeviceSyncRegistry *)self _urlForAttachmentsWithComposedMessageId:v6];
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  id v11 = 0;
  [v9 moveItemAtURL:v7 toURL:v8 error:&v11];

  id v10 = v11;
  if (v10 && os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    -[NNMKDeviceSyncRegistry saveAttachmentsForComposedMessageId:temporaryURL:]();
  }
}

- (void)_removeAttachmentsForComposedMessageId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKDeviceSyncRegistry *)self _urlForAttachmentsWithComposedMessageId:v4];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 absoluteString];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    [v9 removeItemAtURL:v5 error:&v11];
    id v10 = v11;

    if (v10 && os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _removeAttachmentsForComposedMessageId:]();
    }
  }
}

- (void)_removeAllPendingAttachments
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_ERROR, "Unable to delete all pending attachments. Error: %{public}@", v1, 0xCu);
}

- (id)_urlForAttachmentsWithComposedMessageId:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKDeviceSyncRegistry *)self _attachmentDirectory];
  id v6 = objc_msgSend(v4, "nnmk_sanitizedFileNameString");

  id v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

- (id)_attachmentDirectory
{
  uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [v2 pairingStorePath];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v3 isDirectory:1];
    id v5 = [v4 URLByAppendingPathComponent:@"NanoMail/ComposedMessage" isDirectory:1];

    id v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 forIDSIdentifierNotYetAckd:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke;
  v16[3] = &unk_264E9A358;
  v16[4] = self;
  id v17 = v12;
  id v19 = v10;
  unint64_t v20 = a5;
  id v18 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v12;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v16];
}

void __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"INSERT INTO IDS_IDENTIFIER_NOT_YET_ACKD (IDS_IDENTIFIER, TYPE, DATE_TO_RESEND, RESEND_INTERVAL) VALUES (?, ?, NULL, ?)"];
  +[NNMKSQLiteUtils bindString:v2[1] intoStatement:v3 paramIndex:1];
  +[NNMKSQLiteUtils bindString:v2[2] intoStatement:v3 paramIndex:2];
  +[NNMKSQLiteUtils bindUnsignedInteger:v2[4] intoStatement:v3 paramIndex:3];
  uint64_t v4 = [*(id *)(*v2 + 72) stepPreparedStatement:v3];
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"INSERT INTO IDS_IDENTIFIER_OBJECT (IDS_IDENTIFIER, OBJECT_ID) VALUES (?, ?)", (void)v14];
          +[NNMKSQLiteUtils bindString:*(void *)(a1 + 40) intoStatement:v11 paramIndex:1];
          +[NNMKSQLiteUtils bindString:v10 intoStatement:v11 paramIndex:2];
          uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 72) stepPreparedStatement:v11];
          +[NNMKSQLiteUtils closeExecutedPreparedStatement:v11];
          if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v12])
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_12:
    id v13 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke_cold_1((uint64_t)v2, v13);
    }
  }
}

- (id)objectIdsForIDSIdentifierNotYetAckd:(id)a3 type:(id *)a4 resendInterval:(unint64_t *)a5
{
  id v7 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v10 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT O.OBJECT_ID, I.TYPE, I.RESEND_INTERVAL FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE I.IDS_IDENTIFIER = ?"];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v10 paramIndex:1];
  uint64_t v11 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v10];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v11])
  {
    long long v17 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry objectIdsForIDSIdentifierNotYetAckd:type:resendInterval:]((uint64_t)p_database, v17);
    }
    goto LABEL_10;
  }
  if (v11 != 100)
  {
LABEL_10:
    unint64_t v14 = 0;
    id v13 = 0;
    goto LABEL_11;
  }
  id v13 = 0;
  unint64_t v14 = 0;
  do
  {
    long long v15 = +[NNMKSQLiteUtils stringFromStatement:v10 columnIndex:0];
    if (!v13)
    {
      id v13 = +[NNMKSQLiteUtils stringFromStatement:v10 columnIndex:1];
      unint64_t v14 = +[NNMKSQLiteUtils unsignedIntegerFromStatement:v10 columnIndex:2];
    }
    [v12 addObject:v15];
    int v16 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v10];
  }
  while (v16 == 100);
LABEL_11:
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v10];
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v14;
  }

  return v12;
}

- (id)objectIdsForType:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT O.OBJECT_ID FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE I.TYPE = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v7 paramIndex:1];
  uint64_t v8 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v8])
  {
    if (v8 == 100)
    {
      do
      {
        uint64_t v10 = +[NNMKSQLiteUtils stringFromStatement:v7 columnIndex:0];
        [v9 addObject:v10];
        int v11 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7];
      }
      while (v11 == 100);
    }
  }
  else
  {
    uint64_t v12 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)v4 objectIdsForType:v12];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];

  return v9;
}

- (id)typeForIDSIdentifierNotYetAckd:(id)a3
{
  p_database = &self->_database;
  database = self->_database;
  id v5 = a3;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT TYPE FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE IDS_IDENTIFIER = ?"];
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v6 paramIndex:1];

  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6]])
  {
    uint64_t v7 = +[NNMKSQLiteUtils stringFromStatement:v6 columnIndex:0];
  }
  else
  {
    uint64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry typeForIDSIdentifierNotYetAckd:]((uint64_t)p_database, v8);
    }
    uint64_t v7 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v7;
}

- (void)markIDSIdentifierAsAckd:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke;
  v6[3] = &unk_264E99F48;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NNMKDeviceSyncRegistry *)self _insureTransactionFor:v6];
}

uint64_t __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) preparedStatementForPattern:@"DELETE FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE IDS_IDENTIFIER = ?"];
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = (void *)(a1 + 40);
  +[NNMKSQLiteUtils bindString:v5 intoStatement:v3 paramIndex:1];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*(id *)(*(void *)v2 + 72) stepPreparedStatement:v3]))
  {
    uint64_t v6 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_2((uint64_t)v4, v2, v6);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  uint64_t v7 = [*(id *)(*(void *)v2 + 72) preparedStatementForPattern:@"DELETE FROM IDS_IDENTIFIER_OBJECT WHERE IDS_IDENTIFIER = ?"];
  +[NNMKSQLiteUtils bindString:*v4 intoStatement:v7 paramIndex:1];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:](NNMKSQLiteUtils, "isResponseOkFromPreparedStatementExecution:", [*(id *)(*(void *)v2 + 72) stepPreparedStatement:v7]))
  {
    uint64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_1((uint64_t)v4, v2, v8);
    }
  }
  return +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];
}

- (void)rescheduleIDSIdentifier:(id)a3 resendInterval:(unint64_t)a4 withDateToResend:(id)a5 errorCode:(int64_t)a6
{
  id v10 = a3;
  database = self->_database;
  p_database = &self->_database;
  id v13 = a5;
  uint64_t v14 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"UPDATE IDS_IDENTIFIER_NOT_YET_ACKD SET RESEND_INTERVAL = ?, DATE_TO_RESEND = ?, ERROR_CODE = ? WHERE IDS_IDENTIFIER = ?"];
  +[NNMKSQLiteUtils bindUnsignedInteger:a4 intoStatement:v14 paramIndex:1];
  +[NNMKSQLiteUtils bindDate:v13 intoStatement:v14 paramIndex:2];

  +[NNMKSQLiteUtils bindInteger:a6 intoStatement:v14 paramIndex:3];
  +[NNMKSQLiteUtils bindString:v10 intoStatement:v14 paramIndex:4];
  uint64_t v15 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v14];
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v14];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v15])
  {
    int v16 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry rescheduleIDSIdentifier:resendInterval:withDateToResend:errorCode:]((uint64_t)v10, (uint64_t)p_database, v16);
    }
  }
}

- (void)prepareIDSIdentifiersForResendForErrorCode:(int64_t)a3
{
  p_database = &self->_database;
  uint64_t v5 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"UPDATE IDS_IDENTIFIER_NOT_YET_ACKD SET DATE_TO_RESEND = ?, RESEND_INTERVAL = ?, ERROR_CODE = ? WHERE ERROR_CODE = ?"];
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  +[NNMKSQLiteUtils bindDate:v6 intoStatement:v5 paramIndex:1];

  +[NNMKSQLiteUtils bindUnsignedInteger:0 intoStatement:v5 paramIndex:2];
  +[NNMKSQLiteUtils bindInteger:0 intoStatement:v5 paramIndex:3];
  +[NNMKSQLiteUtils bindInteger:a3 intoStatement:v5 paramIndex:4];
  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v5];
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v5];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    uint64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry prepareIDSIdentifiersForResendForErrorCode:]((uint64_t)p_database, v8);
    }
  }
}

- (id)datesForIDSIdentifiersScheduledToBeResent
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  database = self->_database;
  p_database = &self->_database;
  uint64_t v6 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"SELECT IDS_IDENTIFIER, DATE_TO_RESEND FROM IDS_IDENTIFIER_NOT_YET_ACKD WHERE DATE_TO_RESEND IS NOT NULL"];
  uint64_t v7 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v7])
  {
    if (v7 == 100)
    {
      do
      {
        uint64_t v8 = +[NNMKSQLiteUtils stringFromStatement:v6 columnIndex:0];
        uint64_t v9 = +[NNMKSQLiteUtils dateFromStatement:v6 columnIndex:1];
        [v3 setObject:v9 forKeyedSubscript:v8];
        int v10 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v6];
      }
      while (v10 == 100);
    }
  }
  else
  {
    int v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)p_database datesForIDSIdentifiersScheduledToBeResent];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v6];
  return v3;
}

- (void)deleteObjectId:(id)a3 fromIDSIdentifiersNotYetAckdOfType:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NNMKDeviceSyncRegistry *)self _idsIdentifiersForObjectId:v6 type:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138543618;
    long long v17 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"DELETE FROM IDS_IDENTIFIER_OBJECT WHERE OBJECT_ID = ? AND IDS_IDENTIFIER = ?", v17];
        +[NNMKSQLiteUtils bindString:v6 intoStatement:v14 paramIndex:1];
        +[NNMKSQLiteUtils bindString:v13 intoStatement:v14 paramIndex:2];
        if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)self->_database stepPreparedStatement:v14]])
        {
          uint64_t v15 = (void *)qword_26AC21850;
          if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
          {
            database = self->_database;
            int v16 = v15;
            uint64_t v19 = [(NNMKSQLiteConnection *)database lastErrorMessage];
            *(_DWORD *)uint8_t buf = v17;
            id v25 = v6;
            __int16 v26 = 2114;
            id v27 = v19;
            _os_log_error_impl(&dword_23D3DF000, v16, OS_LOG_TYPE_ERROR, "Error deleting Object Id from IDS Identifiers (Object Id: %{public}@ - Error: %{public}@).", buf, 0x16u);
          }
        }
        +[NNMKSQLiteUtils closeExecutedPreparedStatement:v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
}

- (id)_idsIdentifiersForObjectId:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v10 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"select I.IDS_IDENTIFIER FROM IDS_IDENTIFIER_NOT_YET_ACKD I INNER JOIN IDS_IDENTIFIER_OBJECT O ON O.IDS_IDENTIFIER == I.IDS_IDENTIFIER WHERE O.OBJECT_ID = ? AND TYPE = ?"];
  +[NNMKSQLiteUtils bindString:v6 intoStatement:v10 paramIndex:1];
  +[NNMKSQLiteUtils bindString:v7 intoStatement:v10 paramIndex:2];
  uint64_t v11 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v10];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v11])
  {
    if (v11 == 100)
    {
      do
      {
        uint64_t v13 = +[NNMKSQLiteUtils stringFromStatement:v10 columnIndex:0];
        [v12 addObject:v13];
        int v14 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v10];
      }
      while (v14 == 100);
    }
  }
  else
  {
    uint64_t v15 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _idsIdentifiersForObjectId:type:]((uint64_t)p_database, v15);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v10];

  return v12;
}

- (void)_loadAllControlValues
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error loading control values (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)_setControlValueForKey:(id)a3 withBlockForBinding:(id)a4
{
  id v6 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v9 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v10 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"INSERT OR REPLACE INTO CONTROL (KEY, VALUE) VALUES (?, ?)"];
  +[NNMKSQLiteUtils bindString:v6 intoStatement:v10 paramIndex:1];
  v9[2](v9, v10, 2);

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v10]])
  {
    uint64_t v11 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _setControlValueForKey:withBlockForBinding:]((uint64_t)v6, (uint64_t)p_database, v11);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v10];
}

- (void)_removeControlValueForKey:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:@"DELETE FROM CONTROL WHERE KEY = ?"];
  +[NNMKSQLiteUtils bindString:v4 intoStatement:v7 paramIndex:1];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v7]])
  {
    uint64_t v8 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)v4 _removeControlValueForKey:v8];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v7];
}

- (void)_deleteAllObjectsFromTable:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v7 = [NSString stringWithFormat:@"DELETE FROM %@", v4];
  uint64_t v8 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:v7];

  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v8]])
  {
    uint64_t v9 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)v4 _deleteAllObjectsFromTable:v9];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v8];
}

- (void)_deleteAllObjectsFromTable:(id)a3 mailboxId:(id)a4
{
  id v6 = a3;
  database = self->_database;
  p_database = &self->_database;
  uint64_t v9 = NSString;
  id v10 = a4;
  uint64_t v11 = [v9 stringWithFormat:@"DELETE FROM %@ WHERE MAILBOX_ID = ?", v6];
  uint64_t v12 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:v11];

  +[NNMKSQLiteUtils bindString:v10 intoStatement:v12 paramIndex:1];
  if (!+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:[(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v12]])
  {
    uint64_t v13 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)v6 _deleteAllObjectsFromTable:v13];
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v12];
}

- (id)_selectSyncedMessagesWhere:(id)a3 blockForBinding:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, sqlite3_stmt *))a4;
  [NSString stringWithFormat:@"SELECT ID, STATUS, STATUS_VERSION, DATE_RECEIVED, USED_PROTECTED_CHANNEL, USED_NOTIFICATION_PRIORITY, CONTENT_SYNCED, CONTENT_SYNCED_NOTIFICATION_PRIORITY, CONTENT_SYNCED_BECAUSE_USER_REQUESTED, CONTENT_REQUESTED_BY_USER, (SELECT group_concat(T.CONTENT_ID, \"\n\") FROM ATTACHMENT_NOT_SYNCED T WHERE T.MESSAGE_ID == ID GROUP BY T.MESSAGE_ID) AS ATTACHMENTS_NOT_SYNCED, CONVERSATION_ID, RESEND_REQUESTED, RESEND_INTERVAL, CONTENT_RESEND_INTERVAL, MAILBOX_ID, THREAD_SPECIFIC, SPECIAL_MAILBOX_SPECIFIC, SANITIZED_ID FROM SYNCED_MESSAGE WHERE %@ ORDER BY DATE_RECEIVED DESC", v6];
  long long v24 = p_database = &self->_database;
  uint64_t v9 = -[NNMKSQLiteConnection preparedStatementForPattern:](self->_database, "preparedStatementForPattern:");
  v7[2](v7, v9);
  uint64_t v10 = [(NNMKSQLiteConnection *)self->_database stepPreparedStatement:v9];
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v10])
  {
    if (v10 == 100)
    {
      do
      {
        uint64_t v12 = objc_alloc_init(NNMKSyncedMessage);
        uint64_t v13 = +[NNMKSQLiteUtils stringFromStatement:v9 columnIndex:0];
        [(NNMKSyncedMessage *)v12 setMessageId:v13];

        int v14 = [(NNMKSyncedMessage *)v12 messageId];

        if (v14)
        {
          [(NNMKSyncedMessage *)v12 setStatus:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:1]];
          [(NNMKSyncedMessage *)v12 setStatusVersion:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:2]];
          uint64_t v15 = +[NNMKSQLiteUtils dateFromStatement:v9 columnIndex:3];
          [(NNMKSyncedMessage *)v12 setDateReceived:v15];

          [(NNMKSyncedMessage *)v12 setUsedProtectedChannelForMessageSync:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:4]];
          [(NNMKSyncedMessage *)v12 setUsedNotificationPriorityForMessageSync:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:5]];
          [(NNMKSyncedMessage *)v12 setContentSynced:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:6]];
          [(NNMKSyncedMessage *)v12 setContentSyncedUsingNotificationPriority:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:7]];
          [(NNMKSyncedMessage *)v12 setContentSyncedBecauseUserRequested:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:8]];
          [(NNMKSyncedMessage *)v12 setContentRequestedByUser:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:9]];
          int v16 = +[NNMKSQLiteUtils stringFromStatement:v9 columnIndex:10];
          long long v17 = [(NNMKDeviceSyncRegistry *)self _ungroupGroupedValue:v16];
          [(NNMKSyncedMessage *)v12 setAttachmentsContentIdsNotYetSynced:v17];

          id v18 = +[NNMKSQLiteUtils stringFromStatement:v9 columnIndex:11];
          [(NNMKSyncedMessage *)v12 setConversationId:v18];

          [(NNMKSyncedMessage *)v12 setResendRequested:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:12]];
          [(NNMKSyncedMessage *)v12 setResendInterval:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:13]];
          [(NNMKSyncedMessage *)v12 setContentResendInterval:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:14]];
          uint64_t v19 = +[NNMKSQLiteUtils stringFromStatement:v9 columnIndex:15];
          [(NNMKSyncedMessage *)v12 setMailboxId:v19];

          [(NNMKSyncedMessage *)v12 setIsThreadSpecific:+[NNMKSQLiteUtils BOOLFromStatement:v9 columnIndex:16]];
          [(NNMKSyncedMessage *)v12 setIsSpecialMailboxSpecific:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v9 columnIndex:17]];
          long long v20 = +[NNMKSQLiteUtils stringFromStatement:v9 columnIndex:18];
          [(NNMKSyncedMessage *)v12 setSanitizedMessageId:v20];

          [v11 addObject:v12];
        }
        int v21 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v9];
      }
      while (v21 == 100);
    }
  }
  else
  {
    long long v22 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _selectSyncedMessagesWhere:blockForBinding:]((uint64_t)v6, (uint64_t)p_database, v22);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v9];

  return v11;
}

- (id)_selectSyncedMessagesIdsWhere:(id)a3 count:(unint64_t)a4 blockForBinding:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = [NSString stringWithFormat:@"SELECT ID FROM SYNCED_MESSAGE WHERE %@ ORDER BY DATE_RECEIVED DESC", v8];
  uint64_t v11 = v10;
  if (a4)
  {
    uint64_t v12 = objc_msgSend(v10, "stringByAppendingFormat:", @" LIMIT %lu", a4);

    uint64_t v11 = (void *)v12;
  }
  database = self->_database;
  p_database = &self->_database;
  uint64_t v15 = [(NNMKSQLiteConnection *)database preparedStatementForPattern:v11];
  v9[2](v9, v15);
  uint64_t v16 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v15];
  long long v17 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v16])
  {
    if (v16 == 100)
    {
      do
      {
        id v18 = +[NNMKSQLiteUtils stringFromStatement:v15 columnIndex:0];
        if (v18) {
          [v17 addObject:v18];
        }
        int v19 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v15];
      }
      while (v19 == 100);
    }
  }
  else
  {
    long long v20 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _selectSyncedMessagesIdsWhere:count:blockForBinding:]((uint64_t)v8, (uint64_t)p_database, v20);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v15];

  return v17;
}

- (id)_selectSyncedAccountsWhere:(id)a3 blockForBinding:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    id v8 = [NSString stringWithFormat:@"WHERE %@", v6];
  }
  else
  {
    id v8 = &stru_26F11E918;
  }
  uint64_t v31 = v8;
  uint64_t v9 = [NSString stringWithFormat:@"SELECT ID, DISPLAY_NAME, SHOULD_ARCHIVE, EMAIL_ADDRESSES, DEFAULT_ADDRESS, RESEND_REQUESTED, RESEND_INTERVAL, SOURCE_TYPE, USERNAME, LOCAL_ID, TYPE_IDENTIFIER, EMAIL_ADDRESS_TOKEN, PCC_EMAIL_ADDRESS FROM SYNCED_ACCOUNT %@", v8];
  database = self->_database;
  p_database = &self->_database;
  uint64_t v30 = (void *)v9;
  uint64_t v12 = -[NNMKSQLiteConnection preparedStatementForPattern:](database, "preparedStatementForPattern:");
  v7[2](v7, v12);
  uint64_t v13 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v12];
  int v14 = [MEMORY[0x263EFF980] array];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v13])
  {
    if (v13 == 100)
    {
      do
      {
        uint64_t v15 = objc_alloc_init(NNMKSyncedAccount);
        uint64_t v16 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:0];
        [(NNMKSyncedAccount *)v15 setAccountId:v16];

        long long v17 = [(NNMKSyncedAccount *)v15 accountId];

        if (v17)
        {
          id v18 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:1];
          [(NNMKSyncedAccount *)v15 setDisplayName:v18];

          [(NNMKSyncedAccount *)v15 setShouldArchive:+[NNMKSQLiteUtils BOOLFromStatement:v12 columnIndex:2]];
          int v19 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:3];
          long long v20 = [v19 componentsSeparatedByString:@"\n"];
          [(NNMKSyncedAccount *)v15 setEmailAddresses:v20];

          int v21 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:4];
          [(NNMKSyncedAccount *)v15 setDefaultEmailAddress:v21];

          [(NNMKSyncedAccount *)v15 setResendRequested:+[NNMKSQLiteUtils BOOLFromStatement:v12 columnIndex:5]];
          [(NNMKSyncedAccount *)v15 setResendInterval:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v12 columnIndex:6]];
          [(NNMKSyncedAccount *)v15 setSourceType:+[NNMKSQLiteUtils unsignedIntegerFromStatement:v12 columnIndex:7]];
          long long v22 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:8];
          [(NNMKSyncedAccount *)v15 setUsername:v22];

          long long v23 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:9];
          [(NNMKSyncedAccount *)v15 setLocalId:v23];

          long long v24 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:10];
          [(NNMKSyncedAccount *)v15 setTypeIdentifier:v24];

          id v25 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:11];
          [(NNMKSyncedAccount *)v15 setEmailAddressToken:v25];

          __int16 v26 = +[NNMKSQLiteUtils stringFromStatement:v12 columnIndex:12];
          [(NNMKSyncedAccount *)v15 setPccEmailAddress:v26];

          [v14 addObject:v15];
        }
        int v27 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v12];
      }
      while (v27 == 100);
    }
  }
  else
  {
    id v28 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKDeviceSyncRegistry _selectSyncedAccountsWhere:blockForBinding:]((uint64_t)v31, (uint64_t)p_database, v28);
    }
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v12];

  return v14;
}

- (id)_ungroupGroupedValue:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [a3 componentsSeparatedByString:@"\n"];
  uint64_t v5 = [v3 setWithArray:v4];

  return v5;
}

- (void)_insureTransactionFor:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if ([(NNMKSQLiteConnection *)self->_database isInTransaction])
  {
    v5[2]();
  }
  else
  {
    BOOL v4 = [(NNMKSQLiteConnection *)self->_database beginTransaction];
    v5[2]();
    if (v4) {
      [(NNMKSQLiteConnection *)self->_database commitTransaction];
    }
  }
}

- (BOOL)hasMailboxSyncedActive
{
  p_database = &self->_database;
  uint64_t v3 = [(NNMKSQLiteConnection *)self->_database preparedStatementForPattern:@"SELECT 1 FROM MAILBOX WHERE SYNC_ACTIVE = 1"];
  uint64_t v4 = [(NNMKSQLiteConnection *)*p_database stepPreparedStatement:v3];
  if (+[NNMKSQLiteUtils isResponseOkFromPreparedStatementExecution:v4])
  {
    BOOL v5 = v4 == 100;
  }
  else
  {
    id v6 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      [(NNMKDeviceSyncRegistry *)(uint64_t)p_database hasMailboxSyncedActive];
    }
    BOOL v5 = 0;
  }
  +[NNMKSQLiteUtils closeExecutedPreparedStatement:v3];
  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSNumber)supportsWebKit
{
  return self->_supportsWebKit;
}

- (BOOL)isMessagesSyncSuspendedByConnectivity
{
  return self->_isMessagesSyncSuspendedByConnectivity;
}

- (BOOL)organizeByThread
{
  return self->_organizeByThread;
}

- (double)deviceScreenWidth
{
  return self->_deviceScreenWidth;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (BOOL)protectedContentChannelSupported
{
  return self->_protectedContentChannelSupported;
}

- (NSDate)disconnectedSince
{
  return self->_disconnectedSince;
}

- (unint64_t)currentDatabaseSchemaVersion
{
  return self->_currentDatabaseSchemaVersion;
}

- (BOOL)recreatedFromScratch
{
  return self->_recreatedFromScratch;
}

- (NNMKSQLiteConnection)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableDictionary)pendingComposedMessages
{
  return self->_pendingComposedMessages;
}

- (void)setPendingComposedMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingComposedMessages, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_disconnectedSince, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error creating database. (%{public}@)", v6, v7, v8, v9, v10);
}

- (void)initWithPath:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "After recreating the database, it got corrupted. We'll try to recreate it next time MobileMail restarts...", v2, v3, v4, v5, v6);
}

- (void)initWithPath:.cold.3()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_23D3DF000, v0, v1, "Database corrupted. Recreating...", v2, v3, v4, v5, v6);
}

- (void)containsSyncedMessageForMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error checking if synced message exists (%{public}@).", v6, v7, v8, v9, v10);
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_1(uint8_t *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void **)(*(void *)a2 + 72);
  uint64_t v7 = a3;
  uint64_t v8 = [v6 lastErrorMessage];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_23D3DF000, v7, OS_LOG_TYPE_ERROR, "Error adding attachment not synced (%{public}@).", a1, 0xCu);
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_12(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting attachments not synced (%{public}@).", v6, v7, v8, v9, v10);
}

void __51__NNMKDeviceSyncRegistry_addOrUpdateSyncedMessage___block_invoke_cold_3(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_12(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error adding synced message (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)removeSyncedMessageForMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting synced message (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)oldestDateReceivedForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error getting oldest date received (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)syncedMessagesCountForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error getting synced messages count (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)messageIdForSanitizedMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error querying message id from sanitized id. (%{public}@).", v6, v7, v8, v9, v10);
}

void __73__NNMKDeviceSyncRegistry_removeSyncedMessagesBeforeDateReceived_mailbox___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_12(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting synced messages (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)addOrUpdateSyncedAccount:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error adding synced account (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)removeSyncedAccountForAccountWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting synced account (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)syncedAccountIdsResendRequested
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting account ids for resend (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)accountSourceTypeForMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_15(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v4, v5, "Error selecting account source type for message (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);
}

- (void)accountSourceTypeForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_15(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v4, v5, "Error selecting account source type for mailbox (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);
}

- (void)accountSourceTypeForAccountId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_15(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v4, v5, "Error selecting account source type (%{public}@ - %{public}@).", v6, v7, v8, v9, v10);
}

- (void)accountIdForUsername:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting account id from username (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)updateSourceType:forAccountId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Account source type update for account (Id: %{public}@).", v1, 0xCu);
}

- (void)updateSourceType:(uint64_t)a1 forAccountId:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error updating account source type (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Attempting to save mailbox without id. %{public}@", v6, v7, v8, v9, v10);
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23D3DF000, v1, OS_LOG_TYPE_DEBUG, "Mailbox ADDED OR UPDATED to SQLite database (Id: %{public}@).", v4, 0xCu);
}

- (void)addOrUpdateMailbox:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error ADDING Mailbox to SQLite database (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)addOrUpdateMailbox:(void *)a1 .cold.4(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() mailboxId];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_23D3DF000, v1, OS_LOG_TYPE_FAULT, "Saving mailbox without url. %{public}@", v4, 0xCu);
}

- (void)deleteMailboxWithId:startTransaction:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_23D3DF000, v0, OS_LOG_TYPE_DEBUG, "Maibox with id %{public}@ deleted successfully.", v1, 0xCu);
}

- (void)deleteMailboxWithId:(uint64_t)a1 startTransaction:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_15(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v4, v5, "Error deleting  mailboxes with id %{public}@ (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)syncVersionForMailboxId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting sync_version for mailbox (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)updateSyncVersion:(uint64_t)a1 forMailboxId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error updating/adding sync version for mailbox (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)insertDeletedMessageId:(uint64_t)a1 mailboxId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error adding deleted message for mailbox (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)mailboxIdForDeletedMessageId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting mailbox id for deleted message %{public}@", v6, v7, v8, v9, v10);
}

- (void)_selectMailboxesWhere:(os_log_t)log blockForBinding:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Retrived mailbox with empty id. Ignoring...", buf, 2u);
}

- (void)_selectMailboxesWhere:(void *)a3 blockForBinding:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error selecting mailboxes where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)setProgress:(uint64_t)a1 forComposedMessageWithId:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error adding/updating composed message (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)progressForComposedMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting progress for composed message (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)pendingComposedMessageIds
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting composed message ids for resend (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)removeProgressForComposedMessageWithId:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error deleting composed message (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)attachmentsForComposedMessageId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v0, (uint64_t)v0, "Unable to unarchive attachments for composed message: %{public}@ Error: %{public}@", v1);
}

- (void)attachmentsFromURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v0, (uint64_t)v0, "Unable to unarchive attachments for URL: %{public}@ Error: %{public}@", v1);
}

- (void)saveAttachmentsForComposedMessageId:temporaryURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v0, (uint64_t)v0, "Unable to save attachments for composedMessageId: %{public}@ Error: %{public}@", v1);
}

- (void)_removeAttachmentsForComposedMessageId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v0, (uint64_t)v0, "Unable to delete attachments for composedMessageId: %{public}@ Error: %{public}@", v1);
}

void __86__NNMKDeviceSyncRegistry_addObjectIds_type_resendInterval_forIDSIdentifierNotYetAckd___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_12(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error adding Object for IDS Identifier (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)objectIdsForIDSIdentifierNotYetAckd:(uint64_t)a1 type:(void *)a2 resendInterval:.cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error retrieving Object Ids for IDS identifier (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)objectIdsForType:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error retrieving Object Ids for type. (%{public}@, %{public}@).", v7, v8, v9, v10, v11);
}

- (void)typeForIDSIdentifierNotYetAckd:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error retrieving Type for IDS identifier (%{public}@).", v6, v7, v8, v9, v10);
}

void __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_16(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v3, v5, "Error deleting objects for IDS Identifier (IDS Identifier: %{public}@ - Error: %{public}@).", v6);
}

void __50__NNMKDeviceSyncRegistry_markIDSIdentifierAsAckd___block_invoke_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_16(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_23D3DF000, v3, v5, "Error marking IDS Identifier as Ack'd (IDS Identifier: %{public}@ - Error: %{public}@).", v6);
}

- (void)rescheduleIDSIdentifier:(void *)a3 resendInterval:withDateToResend:errorCode:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error rescheduling Object for IDS Identifier (IDS Identifier: %{public}@ - Error: %{public}@).", v7, v8, v9, v10, v11);
}

- (void)prepareIDSIdentifiersForResendForErrorCode:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error preparing IDS Identifiers for Resend (Error: %{public}@).", v6, v7, v8, v9, v10);
}

- (void)datesForIDSIdentifiersScheduledToBeResent
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting IDS Identifiers scheduled to be resent (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)_idsIdentifiersForObjectId:(uint64_t)a1 type:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error selecting IDS Identifiers for object id and type (%{public}@).", v6, v7, v8, v9, v10);
}

- (void)_setControlValueForKey:(void *)a3 withBlockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error setting control value for key %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)_removeControlValueForKey:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error deleting control value for key %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)_deleteAllObjectsFromTable:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error deleting all values from table %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)_selectSyncedMessagesWhere:(void *)a3 blockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error selecting synced messages where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)_selectSyncedMessagesIdsWhere:(uint64_t)a1 count:(uint64_t)a2 blockForBinding:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error selecting synced message ids where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)_selectSyncedAccountsWhere:(void *)a3 blockForBinding:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10(a1, a2, a3);
  uint64_t v4 = [(id)OUTLINED_FUNCTION_7() lastErrorMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23D3DF000, v5, v6, "Error selecting synced accounts where %{public}@ (%{public}@).", v7, v8, v9, v10, v11);
}

- (void)hasMailboxSyncedActive
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() lastErrorMessage];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D3DF000, v4, v5, "Error checking if has synced mailbox active (%{public}@).", v6, v7, v8, v9, v10);
}

@end