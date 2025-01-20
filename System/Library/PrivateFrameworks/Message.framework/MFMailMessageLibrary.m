@interface MFMailMessageLibrary
+ (BOOL)canUsePersistence;
+ (MFMailMessageLibrary)defaultInstance;
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (id)propertyMapper;
+ (void)_renameLibraryAtPath:(id)a3;
+ (void)removeLibraryOnNextLaunch;
+ (void)test_setDefaultInstance:(id)a3;
- (BOOL)_addAddressesFromRecipientsForMessages:(id)a3 toSet:(id)a4 connection:(id)a5;
- (BOOL)_addRecipients:(id)a3 toMessageWithDatabaseID:(int64_t)a4 cache:(id)a5 connection:(id)a6;
- (BOOL)_canSelectMessagesWithOptions:(unsigned int)a3 connection:(id)a4;
- (BOOL)_deleteMessages:(id)a3 andCleanUpAddresses:(id)a4 subjects:(id)a5 summaries:(id)a6 brandIndicators:(id)a7 connection:(id)a8;
- (BOOL)_deleteMessages:(id)a3 connection:(id)a4;
- (BOOL)_deleteRows:(id)a3 fromTable:(id)a4 connection:(id)a5;
- (BOOL)_fileType:(int64_t)a3 orHigherExistsAtDirectory:(id)a4;
- (BOOL)_insertThreadReferences:(id)a3 toMessageWithLibraryID:(int64_t)a4 usingDatabaseConnection:(id)a5;
- (BOOL)_isSubjectIDUsedByOtherMessages:(int64_t)a3 besidesMessageWithDatabaseID:(int64_t)a4 connection:(id)a5;
- (BOOL)_setMessageData:(id)a3 libraryID:(int64_t)a4 part:(id)a5 partial:(BOOL)a6 complete:(BOOL)a7 connection:(id)a8;
- (BOOL)_setSummary:(id)a3 forMessageWithRowID:(int64_t)a4 connection:(id)a5;
- (BOOL)_shouldLogDatabaseStats;
- (BOOL)_shouldPerformDataDetectionForMessage:(id)a3;
- (BOOL)_shouldStoreRemoteContentForMessage:(id)a3;
- (BOOL)_storeRemoteContentLinksCachedOnMessage:(id)a3 linksToVerify:(id *)a4;
- (BOOL)_updateSubjectForMessageWithLibraryID:(int64_t)a3 to:(id)a4 connection:(id)a5;
- (BOOL)_updateSubjectWithRowID:(int64_t)a3 to:(id)a4 connection:(id)a5 outSubjectAlreadyExists:(BOOL *)a6;
- (BOOL)_writeEmlxData:(id)a3 toFile:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6;
- (BOOL)_writeEmlxFile:(id)a3 withData:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6;
- (BOOL)_writeEmlxFileOfType:(int64_t)a3 forAccount:(id)a4 toDirectory:(id)a5 withData:(id)a6 protectionClass:(int64_t)a7;
- (BOOL)allowedToAccessProtectedData;
- (BOOL)areMessageContentsLocallyAvailable:(id)a3 fullContentsAvailble:(BOOL *)a4;
- (BOOL)cleanupProtectedTables;
- (BOOL)hasCompleteDataForMimePart:(id)a3;
- (BOOL)isProtectedDataAvailable:(id)a3;
- (BOOL)messageDataExistsInDatabaseForMessageLibraryID:(int64_t)a3 part:(id)a4 length:(unint64_t *)a5;
- (BOOL)migrate;
- (BOOL)renameMailboxes:(id)a3 to:(id)a4;
- (BOOL)shouldCancel;
- (EDMessageQueryParser)queryParser;
- (EDPersistence)persistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDSearchableIndex)searchableIndex;
- (EDSearchableIndexScheduler)searchableIndexScheduler;
- (EDWebContentParser)remoteContentParser;
- (EFCancelable)stateCaptureCancelable;
- (EFObservable)unreconciledMessageCountObservable;
- (EFScheduler)fileRemovalAfterCompactionScheduler;
- (MFMailMessageLibrary)initWithPath:(id)a3;
- (MFMailMessageLibrary)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 userAgent:(id)a5;
- (MFMailMessageLibrarySwiftPropertiesProtocol)swiftProperties;
- (MFMailboxFrecencyController)mailboxFrecencyController;
- (MFMessageAttachmentMigrator)attachmentMigrator;
- (MFMessageBodyMigrator)bodyMigrator;
- (MFMessageChangeManager_iOS)messageChangeManager;
- (MFPersistenceDatabase_iOS)database;
- (NSCache)messagesParsedCache;
- (NSMutableDictionary)currentAddedMessagesMap;
- (OS_dispatch_queue)indexingQueue;
- (OS_dispatch_queue)mimePartParallelCompressionQueue;
- (id)UIDsToDeleteInMailbox:(id)a3;
- (id)_addThreadingInfoWithContext:(id)a3 usingDatabaseConnection:(id)a4;
- (id)_copyReferenceHashesWithoutMessagesForMessageWithConversation:(id)a3;
- (id)_equalToMailboxIDsFromCriterion:(id)a3;
- (id)_existingValuesForColumn:(id)a3 table:(id)a4 fromValues:(id)a5 connection:(id)a6;
- (id)_firstDateForQuery:(id)a3 inMailbox:(id)a4;
- (id)_getReferencesForHashesWithOwners:(id)a3;
- (id)_getStringFromPlainTextData:(id)a3 mimePart:(id)a4;
- (id)_keyForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4 mailboxAvailable:(BOOL)a5 mailboxCached:(BOOL)a6;
- (id)_libraryMessageCache;
- (id)_libraryMessageWithLibraryID:(int64_t)a3 wasCached:(BOOL *)a4;
- (id)_mailboxesClauseForAccounts:(id)a3;
- (id)_messageForRow:(id)a3 options:(unsigned int)a4 timestamp:(unint64_t)a5 connection:(id)a6 isProtectedDataAvailable:(BOOL)a7 recipientsCache:(id)a8;
- (id)_messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4 limit:(unint64_t)a5;
- (id)_nonLocalAccountsClause;
- (id)_queryForMailboxesIDsFromMailboxes:(id)a3;
- (id)_recipientsForMessageWithDatabaseID:(int64_t)a3 connection:(id)a4 recipientsCache:(id)a5;
- (id)_recipientsForMessagesWithDatabaseIDs:(id)a3 includeTo:(BOOL)a4 includeCC:(BOOL)a5 includeBCC:(BOOL)a6;
- (id)_remoteIDsStringForRemoteIDs:(id)a3 inMailbox:(id)a4;
- (id)_selectClauseForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4;
- (id)_selectExpressionForMessageWithAvailableTables:(unsigned int)a3;
- (id)_sqlSortByStringFromOptions:(unsigned int)a3;
- (id)_stringsForIndexSet:(id)a3;
- (id)accountForMessage:(id)a3;
- (id)activeMailboxesClause;
- (id)addMessages:(id)a3 withMailbox:(id)a4 newMessagesByOldMessage:(id)a5 remoteIDs:(id)a6 setFlags:(unint64_t)a7 addPOPUIDs:(BOOL)a8 dataSectionsByMessage:(id)a9 generationWindow:(id)a10;
- (id)allUIDsInMailbox:(id)a3;
- (id)bodyDataAtPath:(id)a3 headerData:(id *)a4;
- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4;
- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5;
- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 isPartial:(BOOL *)a6;
- (id)conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:(int64_t)a3 messageIDHash:(int64_t)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5;
- (id)dataConsumerForMessage:(id)a3;
- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4;
- (id)dataConsumerForMessage:(id)a3 part:(id)a4;
- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5;
- (id)dataDirectoryURLForMessage:(id)a3;
- (id)dataFileURLForMessage:(id)a3 type:(int64_t)a4;
- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4;
- (id)dataPathForMessage:(id)a3;
- (id)dataPathForMessage:(id)a3 part:(id)a4;
- (id)dataPathForMessage:(id)a3 type:(int64_t)a4;
- (id)dataProvider;
- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3;
- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3;
- (id)downloadedMessageDataForMessage:(id)a3;
- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 createNewCacheFiles:(BOOL)a7;
- (id)enabledAccountMailboxesExpression;
- (id)existingMIMEPartsForMessage:(id)a3;
- (id)fileAttributesForMessage:(id)a3;
- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5;
- (id)flagsForRemoteIDs:(id)a3 inRemoteMailbox:(id)a4;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4;
- (id)groupedMessagesCountForCriterion:(id)a3 groupBy:(unint64_t)a4;
- (id)headerDataAtPath:(id)a3;
- (id)headerDataForMessage:(id)a3;
- (id)hiddenPOPUIDsInMailbox:(id)a3;
- (id)indexableMessagesWhere:(id)a3 sortedBy:(id)a4 limit:(int64_t)a5 options:(unsigned int)a6;
- (id)loadData:(id)a3 forMessage:(id)a4 usingBlock:(id)a5;
- (id)loadMeetingDataForMessage:(id)a3;
- (id)loadMeetingExternalIDForMessage:(id)a3;
- (id)loadMeetingMetadataForMessage:(id)a3;
- (id)mailboxURLForMessage:(id)a3;
- (id)mailboxURLsForIDs:(id)a3;
- (id)mailboxUidForMessage:(id)a3;
- (id)messageBasePathForAccount:(id)a3;
- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5 temporarilyUnavailable:(BOOL *)a6;
- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4;
- (id)messagesForMailbox:(id)a3 limit:(unint64_t)a4;
- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6;
- (id)messagesWithMessageIDHeader:(id)a3;
- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4;
- (id)newestUIDsForMailbox:(id)a3 limit:(int64_t)a4;
- (id)newestUIDsMissingBodyDataForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7;
- (id)newestUIDsMissingPartsForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7;
- (id)orderedBatchOfMessagesEndingAtRowId:(int64_t)a3 limit:(unsigned int)a4 success:(BOOL *)a5;
- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5;
- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7;
- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7 range:(_NSRange)a8;
- (id)rangesOfIndexedUIDsInRange:(_NSRange)a3 requiresBody:(BOOL)a4 forMailbox:(id)a5 limit:(int64_t)a6;
- (id)referencesFromHeaders:(id)a3;
- (id)remoteStoreForMessage:(id)a3;
- (id)searchResultsWithRemoteIDs:(id)a3 requiresBody:(BOOL)a4 inRemoteMailbox:(id)a5;
- (id)senderForMessageWithLibraryID:(int64_t)a3;
- (id)sequenceIdentifierForMailbox:(id)a3;
- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4;
- (id)serverSearchResultMessagesForMailbox:(id)a3;
- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4;
- (id)storedIntegerPropertyWithName:(id)a3;
- (id)stringFromAllMailboxUnreadCount;
- (id)updateFlagsForMessages:(id)a3 changes:(id)a4 transformer:(id)a5;
- (id)urlForMailboxID:(int64_t)a3;
- (int)_integerForQuery:(id)a3 withTextArgument:(id)a4;
- (int64_t)_conversationIdForMessageIds:(id)a3;
- (int64_t)_findOrCreateDatabaseIDForAddress:(id)a3 cache:(id)a4 connection:(id)a5 isNewAddress:(BOOL *)a6;
- (int64_t)_findOrCreateDatabaseIDForAddress:(id)a3 hmeSenderAddress:(id)a4 cache:(id)a5 outBusinessID:(int64_t *)a6 connection:(id)a7 isNewAddress:(BOOL *)a8;
- (int64_t)_findOrCreateDatabaseIDForGlobalData:(int64_t)a3 cache:(id)a4 connection:(id)a5;
- (int64_t)_findOrCreateDatabaseIDForSubject:(id)a3 cache:(id)a4 connection:(id)a5;
- (int64_t)_findOrCreateDatabaseIDForSummary:(id)a3 cache:(id)a4 connection:(id)a5;
- (int64_t)_findOrCreateDatabaseIDForValue:(id)a3 inTable:(id)a4 column:(id)a5 cache:(id)a6 connection:(id)a7 created:(BOOL *)a8;
- (int64_t)_int64ForQuery:(id)a3 connection:(id)a4 textArgument:(id)a5;
- (int64_t)_maxRowIDInSet:(id)a3;
- (int64_t)_subjectIDForMessageWithLibraryID:(int64_t)a3 connection:(id)a4;
- (int64_t)addReferenceForContext:(id)a3 usingDatabaseConnection:(id)a4 generationWindow:(id)a5 mergeHandler:(id)a6;
- (int64_t)deleteAttachmentsForMessage:(id)a3 inMailboxFileURL:(id)a4;
- (int64_t)loadMoreMessagesForThreadContainingMessage:(id)a3 hasNoMoreMessages:(BOOL *)a4;
- (int64_t)mailboxIDForURLString:(id)a3;
- (int64_t)mailboxIDForURLString:(id)a3 createIfNecessary:(BOOL)a4;
- (unint64_t)_parserRemoteContentOptionsForMessage:(id)a3 shouldStoreRemoteContent:(BOOL)a4;
- (unint64_t)countMessagesMatchingCriterion:(id)a3;
- (unint64_t)flagsForConversationId:(int64_t)a3;
- (unint64_t)mostRecentStatusCountForMailbox:(id)a3;
- (unint64_t)protectedDataAvailability;
- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3;
- (unint64_t)signpostID;
- (unint64_t)unreconciledMessageCount;
- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5;
- (unsigned)attachmentCountForMailboxes:(id)a3;
- (unsigned)nonDeletedCountForMailbox:(id)a3;
- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5;
- (unsigned)totalCountForMailbox:(id)a3;
- (unsigned)unreadCountForMailbox:(id)a3;
- (void)_addMessageToThreadAtUnlock:(int64_t)a3;
- (void)_cancelPendingJournalReconciliation;
- (void)_captureAnalyticsForMailDatabase:(int64_t)a3 schema:(id)a4;
- (void)_didAddUnreconciledMessages:(unint64_t)a3;
- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 block:(id)a6;
- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 dateReceivedMax:(int64_t)a6 limit:(unint64_t)a7 kind:(unint64_t)a8 block:(id)a9;
- (void)_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 kind:(unint64_t)a6 block:(id)a7;
- (void)_findHTMLPartsFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5 linksToVerify:(id)a6 parsingOptions:(unint64_t)a7;
- (void)_iterateMessagesWithResultHandler:(id)a3 options:(unsigned int)a4 monitor:(id)a5 sqlQueryGenerator:(id)a6;
- (void)_iterateStatement:(id)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(id *)a7;
- (void)_logStatistics;
- (void)_notifyDidCompact:(BOOL)a3 messages:(id)a4 mailboxes:(id)a5;
- (void)_processMessageData:(id)a3 forMessage:(id)a4 linksToVerify:(id)a5 parsingOptions:(unint64_t)a6;
- (void)_processRemoteContentFromData:(id)a3 forMimePart:(id)a4 linksToVerify:(id)a5 forMessage:(id)a6 parsingOptions:(unint64_t)a7;
- (void)_removeDataFilesForGlobalID:(int64_t)a3;
- (void)_removeEmlxFilesOfTypeLessThanType:(int64_t)a3 inDirectory:(id)a4;
- (void)_removeGlobalDataForMessagesIfNecessary:(id)a3 connection:(id)a4;
- (void)_removeSearchableItemsWithLibraryIDs:(id)a3;
- (void)_scheduleIncrementalVacuum;
- (void)_scheduleJournalReconciliation;
- (void)_schedulePeriodicStatisticsLogging;
- (void)_sendMessagesForStatement:(id)a3 connection:(id)a4 to:(id)a5 options:(unsigned int)a6 timestamp:(unint64_t)a7;
- (void)_setProtectedDataAvailabilityState:(unint64_t)a3;
- (void)_setSuspendedUnderLock:(BOOL)a3;
- (void)_storeLinksToVerifyIfExistent:(void *)a1;
- (void)_updateUnreconciledMessageCount;
- (void)_waitForActiveAccountsRebuild;
- (void)_writeData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5;
- (void)addPostMigrationStep:(Class)a3;
- (void)attachmentMigrationFinished;
- (void)bodyMigrationFinished;
- (void)clearServerSearchFlagsForMessagesWithLibraryIDs:(id)a3;
- (void)closeDatabaseConnections;
- (void)compactMailbox:(id)a3;
- (void)compactMessages:(id)a3;
- (void)compactMessages:(id)a3 permanently:(BOOL)a4;
- (void)compactMessages:(id)a3 permanently:(BOOL)a4 notifyPersistence:(BOOL)a5;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)deleteAccount:(id)a3;
- (void)deleteMailboxes:(id)a3 account:(id)a4;
- (void)deletePOPUID:(id)a3 inMailbox:(id)a4;
- (void)detectDataFromPlainTextMessage:(id)a3 forMessage:(id)a4 mimePart:(id)a5;
- (void)didFinishPersistenceDidAddMessages:(id)a3;
- (void)fileURLForAttachmentPersistentID:(id)a3 messageID:(id)a4 result:(id)a5;
- (void)handleFailedMigration;
- (void)increaseProtectionOnFileForMessage:(id)a3;
- (void)invalidateAndWait;
- (void)iterateMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4 handler:(id)a5;
- (void)iterateMessagesMatchingCriterion:(id)a3 withResultHandler:(id)a4 options:(unsigned int)a5 withMonitor:(id)a6;
- (void)iterateStatement:(sqlite3_stmt *)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(void *)a7;
- (void)journalReconciliationFailed;
- (void)journalWasReconciled;
- (void)notifyNewData:(id)a3 availableForMessage:(id)a4;
- (void)performIncrementalVacuumForSchema:(id)a3;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5;
- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5;
- (void)prepareToRebuildActiveAccountsClausesAndExpressions;
- (void)rebuildActiveAccountMailboxesExpression:(id)a3;
- (void)rebuildActiveAccountsClausesAndExpressionsWithAccounts:(id)a3;
- (void)rebuildActiveMailboxesClauseWithActiveAccounts:(id)a3 inactiveAccounts:(id)a4;
- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4;
- (void)reloadMailboxCacheIfNecessaryWithConnection:(id)a3;
- (void)reloadMailboxCacheWithConnection:(id)a3;
- (void)removeAllMessagesFromMailbox:(id)a3 removeMailbox:(BOOL)a4 andNotify:(BOOL)a5;
- (void)removeMessagesFromCacheWithLibraryIDs:(id)a3;
- (void)removeSearchableItemsForAccount:(id)a3;
- (void)removeSearchableItemsForAccount:(id)a3 databaseID:(int64_t)a4;
- (void)removeSearchableItemsForMailbox:(id)a3;
- (void)removeSearchableItemsForMessages:(id)a3;
- (void)renameOrRemoveDatabaseIfNeeded;
- (void)scheduleRecurringActivity;
- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5;
- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6;
- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7;
- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7 success:(BOOL *)a8;
- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 range:(_NSRange)a6;
- (void)setAttachmentMigrator:(id)a3;
- (void)setBodyMigrator:(id)a3;
- (void)setCurrentAddedMessagesMap:(id)a3;
- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5;
- (void)setData:(id)a3 forMessageToAppend:(id)a4;
- (void)setFileRemovalAfterCompactionScheduler:(id)a3;
- (void)setFlags:(unint64_t)a3 forConversationId:(int64_t)a4;
- (void)setFlags:(unint64_t)a3 forMessage:(id)a4;
- (void)setLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailbox:(id)a4;
- (void)setMessage:(id)a3 isPartial:(BOOL)a4;
- (void)setMostRecentStatusCount:(unint64_t)a3 forMailbox:(id)a4;
- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6;
- (void)setQueryParser:(id)a3;
- (void)setSearchableIndexScheduler:(id)a3;
- (void)setSequenceIdentifier:(id)a3 forMailbox:(id)a4;
- (void)setSequenceIdentifier:(id)a3 forMessageWithLibraryID:(int64_t)a4;
- (void)setSequenceIdentifier:(id)a3 forMessagesWithRemoteIDs:(id)a4 inMailbox:(id)a5;
- (void)setServerUnreadOnlyOnServerCount:(unint64_t)a3 forMailbox:(id)a4;
- (void)setStoredIntegerPropertyWithName:(id)a3 value:(id)a4;
- (void)setSummary:(id)a3 forMessage:(id)a4;
- (void)start;
- (void)storeRemoteContentLinksFromData:(id)a3 forMessage:(id)a4 mimePart:(id)a5;
- (void)storeRemoteContentLinksFromFullData:(id)a3 forMessage:(id)a4;
- (void)storeRemoteContentLinksFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5;
- (void)test_tearDown;
- (void)updateAdditionalThreadingInfoForSentMessageWithHeaders:(id)a3 externalConversationID:(int64_t)a4;
- (void)updateFlagsForMessagesInPlace:(id)a3 success:(BOOL *)a4;
- (void)updateThreadingInfoForMessage:(id)a3 fromHeaders:(id)a4;
- (void)updateUnprefixedSubjectTo:(id)a3 forMessage:(id)a4;
- (void)willStartPersistenceDidAddMessages:(id)a3;
@end

@implementation MFMailMessageLibrary

- (id)_selectExpressionForMessageWithAvailableTables:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (tableNamesForTableOptions_onceToken != -1) {
    dispatch_once(&tableNamesForTableOptions_onceToken, &__block_literal_global_2617);
  }
  v5 = (void *)tableNamesForTableOptions_cachedSets;
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v3];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __tableNamesForTableOptions_block_invoke_2;
  v41[3] = &__block_descriptor_36_e12___NSSet_8__0l;
  int v42 = v3;
  v32 = [v5 objectForKey:v6 generator:v41];

  v7 = [(MFMailMessageLibrary *)self persistence];
  v8 = [v7 messagePersistence];
  v9 = [v8 queryParser];
  v31 = [v9 sqlPropertyMapper];

  v10 = [v31 mainTable];
  v11 = [v10 name];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithTable:v11];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v13 = [v31 keyPathMappers];
  v14 = [v13 allValues];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "selectResultExpression", v31);
        if (v19)
        {
          v20 = [v18 tableName];
          int v21 = [v32 containsObject:v20];

          if (v21)
          {
            v22 = [v18 selectResultExpression];
            v23 = [v18 selectResultAlias];
            [v12 addResult:v22 alias:v23];
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v15);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v24 = [v31 additionalColumns];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(v12, "addResultColumn:fromTable:", *(void *)(*((void *)&v33 + 1) + 8 * j), v11, v31);
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v25);
  }

  v28 = [v12 queryString];
  v29 = objc_msgSend(v28, "substringToIndex:", objc_msgSend(v28, "rangeOfString:options:", @"FROM", 4));

  return v29;
}

- (BOOL)_canSelectMessagesWithOptions:(unsigned int)a3 connection:(id)a4
{
  __int16 v4 = a3;
  id v6 = a4;
  v7 = [(MFMailMessageLibrary *)self persistence];
  v8 = [v7 messagePersistence];

  if (v8)
  {
    BOOL v9 = (v4 & 0x8000) == 0 || [(MFMailMessageLibrary *)self isProtectedDataAvailable:v6];
  }
  else
  {
    v10 = EDLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _canSelectMessagesWithOptions:connection:]();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (EDPersistence)persistence
{
  return (EDPersistence *)objc_getProperty(self, a2, 240, 1);
}

void __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) isEqualToString:v7])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 longLongValue];
    *a4 = 1;
  }
}

- (int64_t)mailboxIDForURLString:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  int64_t v22 = [(MFMailMessageLibrary *)self mailboxIDForURLString:v6];
  int64_t v7 = v20[3];
  if (v7 == *MEMORY[0x1E4F5FCC8] && v4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    v10 = [(MFMailMessageLibrary *)self database];
    v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary mailboxIDForURLString:createIfNecessary:]"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__MFMailMessageLibrary_mailboxIDForURLString_createIfNecessary___block_invoke;
    v14[3] = &unk_1E5D3CD60;
    id v12 = v9;
    v18 = &v19;
    id v15 = v12;
    uint64_t v16 = self;
    id v17 = v6;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

    int64_t v7 = v20[3];
  }
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (int64_t)mailboxIDForURLString:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v5 = *MEMORY[0x1E4F5FCC8];
  uint64_t v21 = *MEMORY[0x1E4F5FCC8];
  if ([v4 length])
  {
    if (self->_mailboxCache)
    {
      _MFLockGlobalLock();
      mailboxCache = self->_mailboxCache;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke;
      v15[3] = &unk_1E5D3CD88;
      id v16 = v4;
      id v17 = &v18;
      [(NSMutableDictionary *)mailboxCache enumerateKeysAndObjectsUsingBlock:v15];
      _MFUnlockGlobalLock();
    }
    if (v19[3] == v5)
    {
      int64_t v7 = [(MFMailMessageLibrary *)self database];
      id v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary mailboxIDForURLString:]"];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke_2;
      v11[3] = &unk_1E5D3CA40;
      v13 = self;
      v14 = &v18;
      id v12 = v4;
      objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);
    }
  }
  int64_t v9 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (id)_messageForRow:(id)a3 options:(unsigned int)a4 timestamp:(unint64_t)a5 connection:(id)a6 isProtectedDataAvailable:(BOOL)a7 recipientsCache:(id)a8
{
  BOOL v150 = a7;
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v144 = a6;
  id v140 = a8;
  v11 = [v10 objectForKeyedSubscript:@"ROWID"];
  uint64_t v158 = [v11 databaseIDValue];

  id v12 = [v10 objectForKeyedSubscript:@"remote_id"];
  v133 = [v12 stringValue];

  v13 = [v10 objectForKeyedSubscript:@"date_received"];
  v14 = [v13 numberValue];
  uint64_t v127 = [v14 longLongValue];

  id v15 = [v10 objectForKeyedSubscript:@"date_sent"];
  id v16 = [v15 numberValue];
  uint64_t v126 = [v16 longLongValue];

  id v17 = [v10 objectForKeyedSubscript:@"display_date"];
  v157 = [v17 dateValue];

  uint64_t v18 = [v10 objectForKeyedSubscript:@"flags"];
  uint64_t v19 = [v18 numberValue];
  uint64_t v124 = [v19 longLongValue];

  uint64_t v20 = [v10 objectForKeyedSubscript:@"size"];
  uint64_t v21 = [v20 numberValue];
  uint64_t v123 = [v21 unsignedIntegerValue];

  int64_t v22 = [v10 objectForKeyedSubscript:@"mailbox"];
  v23 = [v22 numberValue];

  v132 = v23;
  if (v23)
  {
    if ([v23 longLongValue] != -1) {
      goto LABEL_8;
    }
    v24 = EDLibraryLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.7();
    }
  }
  else
  {
    v24 = EDLibraryLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.6();
    }
  }

LABEL_8:
  uint64_t v25 = [v10 objectForKeyedSubscript:@"original_mailbox"];
  uint64_t v26 = [v25 numberValue];
  uint64_t v122 = [v26 longLongValue];

  v27 = [v10 objectForKeyedSubscript:@"content_type"];
  v149 = [v27 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v28 = (int)[v149 intValue] - 1;
    if (v28 <= 5)
    {
      v131 = off_1E5D3D4F0[v28];
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v131 = v149;
      goto LABEL_14;
    }
  }
  v131 = 0;
LABEL_14:
  if ([v10 columnExistsWithName:@"conversation_id"])
  {
    v29 = [v10 objectForKeyedSubscript:@"conversation_id"];
    uint64_t v129 = [v29 int64Value];

    if (v129) {
      goto LABEL_21;
    }
    v30 = EDLibraryLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.5();
    }
  }
  else
  {
    v30 = EDLibraryLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v158;
      _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "ConversationID not loaded for message (LibraryID = %lld)?", buf, 0xCu);
    }
  }

  uint64_t v129 = 0;
LABEL_21:
  if ([v10 columnExistsWithName:@"encoding"])
  {
    v31 = [v10 objectForKeyedSubscript:@"encoding"];
    v142 = [v31 numberValue];
  }
  else
  {
    v142 = 0;
  }
  if (![v10 columnExistsWithName:@"external_id"])
  {
LABEL_32:
    long long v33 = 0;
    goto LABEL_33;
  }
  v32 = [v10 objectForKeyedSubscript:@"external_id"];
  long long v33 = [v32 stringValue];

  if ([v33 length]) {
    long long v34 = v33;
  }
  else {
    long long v34 = 0;
  }
  id v35 = v34;

  if (!v35)
  {
    long long v36 = EDLibraryLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      [(MFMailMessageLibrary *)v36 _messageForRow:v38 options:v39 timestamp:v40 connection:v41 isProtectedDataAvailable:v42 recipientsCache:v43];
    }

    goto LABEL_32;
  }
LABEL_33:
  v151 = v33;
  if ([v10 columnExistsWithName:@"message_id"])
  {
    v44 = [v10 objectForKeyedSubscript:@"message_id"];
    uint64_t v45 = [v44 numberValue];
    uint64_t v121 = [v45 longLongValue];
  }
  else
  {
    uint64_t v121 = 0;
  }
  if ([v10 columnExistsWithName:@"global_message_id"])
  {
    v46 = [v10 objectForKeyedSubscript:@"global_message_id"];
    v47 = [v46 numberValue];
    uint64_t v145 = [v47 longLongValue];
  }
  else
  {
    uint64_t v145 = 0;
  }
  if ([v10 columnExistsWithName:@"unique_id"])
  {
    v48 = [v10 objectForKeyedSubscript:@"unique_id"];
    v49 = [v48 numberValue];
    uint64_t v120 = [v49 longLongValue];
  }
  else
  {
    uint64_t v120 = 0;
  }
  if ([v10 columnExistsWithName:@"conversation_flags"])
  {
    v50 = [v10 objectForKeyedSubscript:@"conversation_flags"];
    v156 = [v50 numberValue];
  }
  else
  {
    v156 = 0;
  }
  if ([v10 columnExistsWithName:@"list_id_hash"])
  {
    v51 = [v10 objectForKeyedSubscript:@"list_id_hash"];
    uint64_t v52 = [v51 int64Value];

    v155 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithHash:v52];
  }
  else
  {
    v155 = 0;
  }
  if ([v10 columnExistsWithName:@"document_id"])
  {
    v53 = [v10 objectForKeyedSubscript:@"document_id"];
    v54 = [v53 stringValue];

    if ([v54 length])
    {
      id v154 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v54];
    }
    else
    {
      id v154 = 0;
    }
  }
  else
  {
    id v154 = 0;
  }
  if ([v10 columnExistsWithName:@"read_later_date"])
  {
    v55 = [v10 objectForKeyedSubscript:@"read_later_date"];
    v153 = [v55 dateValue];
  }
  else
  {
    v153 = 0;
  }
  if ([v10 columnExistsWithName:@"follow_up_start_date"])
  {
    v56 = [v10 objectForKeyedSubscript:@"follow_up_start_date"];
    v160 = [v56 dateValue];
  }
  else
  {
    v160 = 0;
  }
  if ([v10 columnExistsWithName:@"follow_up_end_date"])
  {
    v57 = [v10 objectForKeyedSubscript:@"follow_up_end_date"];
    v162 = [v57 dateValue];
  }
  else
  {
    v162 = 0;
  }
  if ([v10 columnExistsWithName:@"follow_up_jsonstringformodelevaluationforsuggestions"])
  {
    v58 = [v10 objectForKeyedSubscript:@"follow_up_jsonstringformodelevaluationforsuggestions"];
    v139 = [v58 stringValue];
  }
  else
  {
    v139 = 0;
  }
  if ([v10 columnExistsWithName:@"send_later_date"])
  {
    v59 = [v10 objectForKeyedSubscript:@"send_later_date"];
    v152 = [v59 dateValue];
  }
  else
  {
    v152 = 0;
  }
  v143 = [MEMORY[0x1E4F60AA8] categoryForResultRow:v10];
  v60 = [MEMORY[0x1E4F60AA0] businessAddressesBusinessColumnName];
  int v61 = [v10 columnExistsWithName:v60];

  if (v61)
  {
    v62 = [MEMORY[0x1E4F60AA0] businessAddressesBusinessColumnName];
    v63 = [v10 objectForKeyedSubscript:v62];
    uint64_t v130 = [v63 databaseIDValue];

    if (!v130)
    {
      v64 = +[MFMailMessageLibrary log];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:]();
      }

      memset(buf, 170, 0x288uLL);
      *(_DWORD *)&buf[32] = 0;
      *(void *)v166 = 0xE00000001;
      *(_DWORD *)&v166[8] = 1;
      *(_DWORD *)v167 = getpid();
      size_t v164 = 648;
      uint64_t v130 = 0;
      if (!sysctl((int *)v166, 4u, buf, &v164, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
      {
        __debugbreak();
        JUMPOUT(0x1A7F1139CLL);
      }
    }
  }
  else
  {
    uint64_t v130 = *MEMORY[0x1E4F5FCC8];
  }
  v138 = [MEMORY[0x1E4F60AA0] brandIDForResultRow:v10];
  if ([v10 columnExistsWithName:@"subject"])
  {
    v65 = [v10 objectForKeyedSubscript:@"subject"];
    v147 = [v65 stringValue];

    if ((a4 & 1) == 0)
    {
      int v66 = 0;
      goto LABEL_97;
    }
    if (v147) {
      v67 = v147;
    }
    else {
      v67 = &stru_1EFF11268;
    }
    if (v147 || !v150) {
      goto LABEL_93;
    }
  }
  else
  {
    if ((a4 & 1) == 0)
    {
      int v66 = 0;
      v147 = 0;
      goto LABEL_97;
    }
    if (!v150) {
      goto LABEL_92;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = -1;
  v68 = [v144 preparedStatementForQueryString:@"SELECT subject FROM messages WHERE ROWID = ?"];
  v69 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v158];
  v170 = v69;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v170 count:1];
  v163[0] = MEMORY[0x1E4F143A8];
  v163[1] = 3221225472;
  v163[2] = __109__MFMailMessageLibrary__messageForRow_options_timestamp_connection_isProtectedDataAvailable_recipientsCache___block_invoke;
  v163[3] = &unk_1E5D3C7E8;
  v163[4] = buf;
  [v68 executeWithIndexedBindings:v70 usingBlock:v163 error:0];

  v71 = EDLibraryLog();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    uint64_t v117 = *(void *)(*(void *)&buf[8] + 24);
    *(_DWORD *)v166 = 134218496;
    *(void *)&v166[4] = v158;
    *(_WORD *)v167 = 2048;
    *(void *)&v167[2] = v145;
    __int16 v168 = 2048;
    uint64_t v169 = v117;
    _os_log_error_impl(&dword_1A7EFF000, v71, OS_LOG_TYPE_ERROR, "Message has no subject.  LibraryID = %lld, globalID = %lld, subjectID = %lld", v166, 0x20u);
  }

  _Block_object_dispose(buf, 8);
LABEL_92:
  v67 = &stru_1EFF11268;
LABEL_93:
  v72 = [v10 objectForKeyedSubscript:@"subject_prefix"];
  v73 = [v72 stringValue];

  if ([v73 length])
  {
    v147 = [NSString stringWithFormat:@"%@%@", v73, v67];
  }
  else
  {
    v147 = v67;
  }

  int v66 = 1;
LABEL_97:
  if ([v10 columnExistsWithName:@"sender_comment"])
  {
    v74 = [v10 objectForKeyedSubscript:@"sender_comment"];
    v148 = [v74 stringValue];
  }
  else
  {
    v148 = 0;
  }
  if ([v10 columnExistsWithName:@"sender_address"])
  {
    v75 = [v10 objectForKeyedSubscript:@"sender_address"];
    v159 = [v75 stringValue];
  }
  else
  {
    v159 = 0;
  }
  if ([v10 columnExistsWithName:@"journaled"])
  {
    v76 = [v10 objectForKeyedSubscript:@"journaled"];
    unsigned int v125 = [v76 BOOLValue];
  }
  else
  {
    unsigned int v125 = 0;
  }
  v77 = (void *)MEMORY[0x1E4F60800];
  v78 = [v159 emailAddressValue];
  v146 = [v77 componentsWithEmailAddress:v78];

  [v146 setDisplayName:v148];
  uint64_t v79 = [v146 stringValue];
  v80 = (void *)v79;
  v81 = v159;
  if (v79) {
    v81 = (void *)v79;
  }
  id v82 = v81;

  if ((a4 & 2) != 0)
  {
    if (!v159 && v150)
    {
      v83 = EDLibraryLog();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:]();
      }
    }
    v66 |= 4u;
  }
  else if (![v82 length])
  {

    id v82 = 0;
  }
  v84 = 0;
  if ((a4 & 4) != 0 && v150)
  {
    v85 = [(MFMailMessageLibrary *)self _recipientsForMessageWithDatabaseID:v158 connection:v144 recipientsCache:v140];
    v84 = [v85 toRecipientStrings];
    uint64_t v86 = [v85 ccRecipientStrings];
    v137 = [v85 bccRecipientStrings];

    v66 |= 2u;
  }
  else
  {
    uint64_t v86 = 0;
    v137 = 0;
  }
  v134 = (void *)v86;
  if ([v10 columnExistsWithName:@"summary"])
  {
    v87 = [v10 objectForKeyedSubscript:@"summary"];
    v136 = [v87 stringValue];

    v66 |= a4 & 8;
  }
  else
  {
    v136 = 0;
  }
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && [v10 columnExistsWithName:@"generated_summary"])
  {
    v88 = [v10 objectForKeyedSubscript:@"generated_summary"];
    v89 = [v88 dataValue];

    v119 = (void *)[objc_alloc(MEMORY[0x1E4F60338]) initWithGlobalMessageID:v145];
    if ([v89 length])
    {
      v90 = [v10 objectForKeyedSubscript:@"urgent"];
      uint64_t v91 = [v90 BOOLValue];

      v92 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v89 error:0];
      v93 = [v92 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F5FE80]];
      v94 = [v92 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F5FE78]];
      v135 = (void *)[objc_alloc(MEMORY[0x1E4F602A8]) initWithTopLine:v93 synopsis:v94 urgent:v91 messageItemID:v119];
    }
    else
    {
      v116 = [v10 objectForKeyedSubscript:@"urgent"];
      v92 = [v116 numberValue];

      if (v92) {
        v135 = objc_msgSend(objc_alloc(MEMORY[0x1E4F602A8]), "initWithTopLine:synopsis:urgent:messageItemID:", 0, 0, objc_msgSend(v92, "BOOLValue"), v119);
      }
      else {
        v135 = 0;
      }
    }
  }
  else
  {
    v135 = 0;
  }
  if ([v10 columnExistsWithName:@"unsubscribe_type"])
  {
    v95 = [v10 objectForKeyedSubscript:@"unsubscribe_type"];
    v96 = [v95 numberValue];
  }
  else
  {
    v96 = 0;
  }
  if ([v10 columnExistsWithName:@"sender_bucket"])
  {
    v97 = [v10 objectForKeyedSubscript:@"sender_bucket"];
    v98 = [v97 numberValue];
    uint64_t v99 = [v98 integerValue];
  }
  else
  {
    uint64_t v99 = 0;
  }
  if ([v10 columnExistsWithName:@"brand_indicator_location"])
  {
    v100 = [v10 objectForKeyedSubscript:@"brand_indicator_location"];
    v101 = [v100 stringValue];

    if (v101) {
      v102 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v101];
    }
    else {
      v102 = 0;
    }
  }
  else
  {
    v102 = 0;
  }
  buf[0] = 0;
  v103 = [(MFMailMessageLibrary *)self _libraryMessageWithLibraryID:v158 wasCached:buf];
  [v103 setGenerationNumber:a5];
  if (v150)
  {
    if (v82)
    {
      id v165 = v82;
      v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:1];
    }
    else
    {
      v104 = 0;
    }
    LODWORD(v118) = v66;
    [v103 setSubject:v147 to:v84 cc:v134 bcc:v137 sender:v104 dateReceived:v136 dateSent:(double)v127 summary:(double)v126 withOptions:v118];
    if (v82) {

    }
    if ((a4 & 0x200000) != 0) {
      [v103 setSenderBucket:v99];
    }
    [v103 setGeneratedSummary:v135];
  }
  else
  {
    [v103 setDateReceivedAsTimeIntervalSince1970:(double)v127];
    [v103 setDateSentAsTimeIntervalSince1970:(double)v126];
  }
  if (v157)
  {
    v105 = objc_msgSend(v157, "ec_integerDate");
    [v103 setDisplayDate:v105];
  }
  if (v155) {
    [v103 setListIDHash:v155];
  }
  if (v154) {
    [v103 setDocumentID:v154];
  }
  if (v145) {
    [v103 setGlobalMessageID:v145];
  }
  if (v156) {
    objc_msgSend(v103, "setConversationFlags:", objc_msgSend(v156, "longLongValue"));
  }
  if (v96) {
    objc_msgSend(v103, "setUnsubscribeType:", objc_msgSend(v96, "longLongValue"));
  }
  if (v153)
  {
    v106 = (void *)[objc_alloc(MEMORY[0x1E4F60420]) initWithDate:v153];
    [v103 setReadLater:v106];
  }
  if (v152) {
    [v103 setSendLaterDate:v152];
  }
  [v103 setBrandIndicatorLocation:v102 andData:0];
  [v103 setIsJournaled:v125];
  if (v160 && v162)
  {
    v107 = (void *)[objc_alloc(MEMORY[0x1E4F60298]) initWithStartDate:v160 endDate:v162 jsonStringForModelEvaluationForSuggestions:v139];
    [v103 setFollowUp:v107];
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    [v103 setCategory:v143];
  }
  if (_os_feature_enabled_impl())
  {
    [v103 setBusinessID:v130];
    v108 = [MEMORY[0x1E4F60B40] messageGlobalDataValidationState];
    int v109 = [v10 columnExistsWithName:v108];

    if (v109)
    {
      v110 = [MEMORY[0x1E4F60B40] messageGlobalDataValidationState];
      v111 = [v10 objectForKeyedSubscript:v110];
      v112 = [v111 numberValue];
      objc_msgSend(v103, "setAuthenticationState:", objc_msgSend(v112, "integerValue"));
    }
    [v103 setBusinessLogoID:v138];
  }
  objc_msgSend(v103, "mf_lock");
  if ([v103 mailboxID] == -1)
  {
    [v103 setContentType:v131];
    objc_msgSend(v103, "setRemoteID:flags:size:mailboxID:originalMailboxID:", v133, v124, v123, objc_msgSend(v132, "longLongValue"), v122);
    if (v151) {
      [v103 setExternalID:v151];
    }
    if (v142) {
      objc_msgSend(v103, "setPreferredEncoding:", objc_msgSend(v142, "unsignedIntValue"));
    }
    [v103 setUniqueRemoteId:v120];
    [v103 setConversationID:v129];
    [v103 setMessageIDHash:v121];
  }
  objc_msgSend(v103, "mf_unlock");
  if ([v103 mailboxID] == -1)
  {
    v113 = EDLibraryLog();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:](buf, v158, v113);
    }
  }
  id v114 = v103;

  return v114;
}

- (id)mailboxUidForMessage:(id)a3
{
  uint64_t v3 = [(MFMailMessageLibrary *)self mailboxURLForMessage:a3];
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];

  return v4;
}

- (id)accountForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MFMailMessageLibrary urlForMailboxID:](self, "urlForMailboxID:", [v4 mailboxID]);
  id v6 = +[MailAccount accountWithURLString:v5];

  return v6;
}

- (id)mailboxURLForMessage:(id)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 mailboxID] == -1)
  {
    uint64_t v5 = EDLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary mailboxURLForMessage:]((uint64_t)v8, [v4 libraryID], v5);
    }
  }
  id v6 = -[MFMailMessageLibrary urlForMailboxID:](self, "urlForMailboxID:", [v4 mailboxID]);

  return v6;
}

- (id)urlForMailboxID:(int64_t)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__6;
  uint64_t v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  if (*MEMORY[0x1E4F5FCC8] == a3) {
    goto LABEL_2;
  }
  if (!self->_mailboxCache) {
    goto LABEL_13;
  }
  _MFLockGlobalLock();
  mailboxCache = self->_mailboxCache;
  id v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  uint64_t v9 = [(NSMutableDictionary *)mailboxCache objectForKeyedSubscript:v8];
  id v10 = (void *)v17[5];
  v17[5] = v9;

  _MFUnlockGlobalLock();
  uint64_t v5 = (void *)v17[5];
  if (!v5)
  {
LABEL_13:
    v11 = [(MFMailMessageLibrary *)self database];
    id v12 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary urlForMailboxID:]"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__MFMailMessageLibrary_urlForMailboxID___block_invoke;
    v15[3] = &unk_1E5D3CD38;
    v15[5] = &v16;
    v15[6] = a3;
    void v15[4] = self;
    objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v15);

    uint64_t v5 = (void *)v17[5];
    if (!v5)
    {
LABEL_2:
      id v4 = EDLibraryLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[MFMailMessageLibrary urlForMailboxID:]();
      }

      uint64_t v5 = (void *)v17[5];
    }
  }
  id v13 = v5;
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)_libraryMessageWithLibraryID:(int64_t)a3 wasCached:(BOOL *)a4
{
  libraryMessageCache = self->_libraryMessageCache;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  int64_t v7 = [(MFWeakObjectCache *)libraryMessageCache objectForKey:v6 wasCached:a4];

  return v7;
}

id __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke(uint64_t a1, void *a2)
{
  v2 = +[MFLibraryMessage messageWithLibraryID:](MFLibraryMessage, "messageWithLibraryID:", [a2 longLongValue]);
  return v2;
}

+ (MFMailMessageLibrary)defaultInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&sSharedInstanceLock);
  if (!sSharedInstance_0 && [a1 canUsePersistence])
  {
    uint64_t v3 = [MFMailMessageLibrary alloc];
    id v4 = [a1 defaultPath];
    uint64_t v5 = [(MFMailMessageLibrary *)v3 initWithPath:v4];
    id v6 = (void *)sSharedInstance_0;
    sSharedInstance_0 = v5;
  }
  id v7 = (id)sSharedInstance_0;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSharedInstanceLock);
  return (MFMailMessageLibrary *)v7;
}

- (BOOL)allowedToAccessProtectedData
{
  return self->_allowedToAccessProtectedData;
}

+ (BOOL)canUsePersistence
{
  if (EFIsRunningUnitTests()) {
    return 1;
  }
  v2 = MFUserAgent();
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 isMobileMail]) {
      char v4 = [v3 isMaild];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)reloadMailboxCacheIfNecessaryWithConnection:(id)a3
{
  id v4 = a3;
  if (!self->_mailboxCache) {
    [(MFMailMessageLibrary *)self reloadMailboxCacheWithConnection:v4];
  }
}

void __87__MFMailMessageLibrary__recipientsForMessageWithDatabaseID_connection_recipientsCache___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 objectForKeyedSubscript:@"ROWID"];
  uint64_t v4 = [v3 int64Value];

  uint64_t v5 = [v16 objectForKeyedSubscript:@"type"];
  uint64_t v6 = [v5 integerValue];

  id v7 = *(void **)(a1 + 32);
  if (!v7
    || ([MEMORY[0x1E4F28ED0] numberWithLongLong:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v8],
        uint64_t v9 = (_MFEmailAddress *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v10 = [v16 objectForKeyedSubscript:@"address"];
    v11 = [v10 stringValue];

    id v12 = [v16 objectForKeyedSubscript:@"comment"];
    id v13 = [v12 stringValue];

    uint64_t v9 = [[_MFEmailAddress alloc] initWithAddress:v11 displayName:v13];
    v14 = *(void **)(a1 + 32);
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v4];
      [v14 setObject:v9 forKeyedSubscript:v15];
    }
  }
  switch(v6)
  {
    case 3:
      [*(id *)(a1 + 40) addBCCRecipient:v9];
      break;
    case 2:
      [*(id *)(a1 + 40) addCCRecipient:v9];
      break;
    case 1:
      [*(id *)(a1 + 40) addToRecipient:v9];
      break;
  }
}

void __95__MFMailMessageLibrary__iterateStatement_connection_withProgressMonitor_andRowHandler_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) shouldCancel] & 1) != 0
    || [*(id *)(a1 + 40) shouldCancel])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    char v6 = (*(uint64_t (**)(id, void, void, void))(a1 + 72))(v7, *(void *)(a1 + 80), *(void *)(a1 + 48), *(void *)(a1 + 56));
    *a4 = v6 ^ 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6 ^ 1;
  }
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v7 = *(void *)&a4;
  id v9 = a3;
  id v10 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:range:](self, "sendMessagesMatchingCriterion:to:options:range:", v9, v10, v7, location, length);
  v11 = [(_MFMessageCollector *)v10 messages];

  return v11;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 range:(_NSRange)a6
{
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(_MFMessageCollector);
  [(MFMailMessageLibrary *)self sendMessagesMatchingCriterion:v6 to:v7 options:v4];
  id v8 = [(_MFMessageCollector *)v7 messages];

  return v8;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5
{
}

- (id)indexableMessagesWhere:(id)a3 sortedBy:(id)a4 limit:(int64_t)a5 options:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(MFMailMessageLibrary *)self _nonLocalAccountsClause];
  if (v12)
  {
    *(void *)buf = 0;
    uint64_t v26 = buf;
    uint64_t v27 = 0x3032000000;
    unint64_t v28 = __Block_byref_object_copy__6;
    v29 = __Block_byref_object_dispose__6;
    id v30 = (id)MEMORY[0x1E4F1CBF0];
    id v13 = [(MFMailMessageLibrary *)self database];
    v14 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary indexableMessagesWhere:sortedBy:limit:options:]"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke;
    v18[3] = &unk_1E5D3D328;
    unsigned int v24 = a6;
    v18[4] = self;
    int64_t v23 = a5;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    int64_t v22 = buf;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v18);

    id v15 = *((id *)v26 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning SearchableIndex: Skipping message search request until we have determined our active non-local accounts", buf, 2u);
    }

    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)_nonLocalAccountsClause
{
  [(MFMailMessageLibrary *)self _waitForActiveAccountsRebuild];
  [(MFMailMessageLibrary *)self mf_lock];
  uint64_t v3 = self->_nonLocalAccountClause;
  [(MFMailMessageLibrary *)self mf_unlock];
  return v3;
}

- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 mimeBody];
  id v8 = [v7 message];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 partNumber];
    id v10 = _dataForMessageAndPart(self, v8, v9, 1, (uint64_t)a4);

    if (!v10)
    {
      id v11 = [v6 partNumber];
      id v12 = _dataPathForMessageAndPart(self, v8, v11);

      if (v12)
      {
        id v20 = 0;
        id v10 = [MEMORY[0x1E4F734C0] dataWithContentsOfFile:v12 options:3 error:&v20];
        id v13 = v20;
        if (v10)
        {
          if (a4) {
            *a4 = 1;
          }
          v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = [v10 length];
            id v16 = objc_msgSend(v8, "ef_publicDescription");
            id v17 = [v6 partNumber];
            *(_DWORD *)buf = 134218498;
            uint64_t v22 = v15;
            __int16 v23 = 2114;
            unsigned int v24 = v16;
            __int16 v25 = 2114;
            uint64_t v26 = v17;
            _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "#CacheLoads data from file of length %lu for message %{public}@ part %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v18 = objc_msgSend(v13, "ef_publicDescription");
            -[MFMailMessageLibrary dataForMimePart:isComplete:]((uint64_t)v12, v18, (uint64_t)buf);
          }
        }
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7 success:(BOOL *)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a4;
  id v16 = [(MFMailMessageLibrary *)self database];
  id v17 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__MFMailMessageLibrary_sendMessagesMatchingCriterion_to_options_baseTable_range_success___block_invoke;
  v20[3] = &unk_1E5D3D1A8;
  v20[4] = self;
  unsigned int v26 = a5;
  id v18 = v14;
  unsigned int v27 = a6;
  id v21 = v18;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  id v19 = v15;
  id v22 = v19;
  __int16 v25 = a8;
  objc_msgSend(v16, "__performReadWithCaller:usingBlock:", v17, v20);
}

- (id)dataDirectoryURLForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailMessageLibrary *)self bodyMigrator];
  [v5 migrateBodyForMessageIfNecessary:v4];

  uint64_t v6 = [v4 globalMessageID];
  uint64_t v7 = [v4 account];
  id v8 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v7];
  id v9 = objc_msgSend(MEMORY[0x1E4F60B30], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v6, v8, objc_msgSend(v7, "supportsPurge"));

  return v9;
}

- (id)messageBasePathForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 personaIdentifier];

  if (v5)
  {
    uint64_t v6 = [v4 path];
  }
  else
  {
    uint64_t v6 = self->_path;
  }
  uint64_t v7 = v6;

  return v7;
}

- (MFMessageBodyMigrator)bodyMigrator
{
  return (MFMessageBodyMigrator *)objc_getProperty(self, a2, 288, 1);
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 isPartial:(BOOL *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(MFMailMessageLibrary *)self dataPathForMessage:v10 type:0];
  if (v11)
  {
    uint64_t v12 = [(MFMailMessageLibrary *)self bodyDataAtPath:v11 headerData:a4];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v11;
      id v15 = (void *)v12;
LABEL_4:
      if (a5) {
        *a5 = 1;
      }
      if (a6) {
        *a6 = v13 == 0;
      }
      id v16 = MFLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v15 length];
        id v18 = objc_msgSend(v10, "ef_publicDescription");
        int v22 = 134218242;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        __int16 v25 = v18;
        _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "#CacheLoads body data from file of length %lu for message %{public}@", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_19;
    }
    id v14 = [(MFMailMessageLibrary *)self dataPathForMessage:v10 type:1];

    if (v14)
    {
      id v15 = [(MFMailMessageLibrary *)self bodyDataAtPath:v14 headerData:a4];
      if (v15) {
        goto LABEL_4;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  id v19 = _dataForMessageAndPart(self, v10, 0, 1, (uint64_t)a5);
  id v20 = v19;
  if (v19)
  {
    id v15 = _bodyDataFromData(v19, a4);

    if (a6) {
      *a6 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)dataPathForMessage:(id)a3 type:(int64_t)a4
{
  id v4 = [(MFMailMessageLibrary *)self dataFileURLForMessage:a3 type:a4];
  uint64_t v5 = [v4 path];

  return v5;
}

- (id)dataFileURLForMessage:(id)a3 type:(int64_t)a4
{
  uint64_t v6 = @"full.emlx";
  if (a4 == 1) {
    uint64_t v6 = @"partial.emlx";
  }
  if (a4 == 2) {
    uint64_t v6 = @"headers.emlx";
  }
  uint64_t v7 = v6;
  id v8 = [(MFMailMessageLibrary *)self dataDirectoryURLForMessage:a3];
  id v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];

  return v9;
}

- (id)bodyDataAtPath:(id)a3 headerData:(id *)a4
{
  void v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    id v9 = 0;
    goto LABEL_15;
  }
  v14[0] = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F734C0]) initWithContentsOfFile:v5 options:3 error:v14];
  id v7 = v14[0];
  id v8 = v7;
  if (!v6)
  {
    id v10 = [v7 domain];
    if ([v10 isEqual:*MEMORY[0x1E4F281F8]])
    {
      BOOL v11 = [v8 code] == 260;

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v12 = EDLibraryLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v5];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary bodyDataAtPath:headerData:]();
    }

    goto LABEL_13;
  }
  if (![v6 length])
  {
LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  id v9 = _bodyDataFromData(v6, a4);
LABEL_14:

LABEL_15:
  return v9;
}

uint64_t __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _canSelectMessagesWithOptions:*(unsigned int *)(a1 + 80) connection:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    id v5 = (void *)[*(id *)(a1 + 32) _selectClauseForOptions:*(unsigned int *)(a1 + 80) protectedDataAvailable:v4];
    int v6 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 80), 0, v4);
    id v7 = joinsForTables(v6);
    if (*(void *)(a1 + 72)) {
      id v8 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" LIMIT %ld", *(void *)(a1 + 72));
    }
    else {
      id v8 = &stru_1EFF11268;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 40))
    {
      if (v9) {
        uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ FROM messages %s WHERE %@ %@ ORDER BY %@%@", v5, v7, *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48), v8];
      }
      else {
        uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ FROM messages %s WHERE %@ %@%@", v5, v7, *(void *)(a1 + 40), *(void *)(a1 + 56), v8];
      }
    }
    else if (v9)
    {
      uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ FROM messages %s ORDER BY %@%@", v5, v7, *(void *)(a1 + 48), v8];
    }
    else
    {
      uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ FROM messages %s %@", v5, v7, v8];
    }
    BOOL v11 = (void *)v10;
    free(v7);
    uint64_t v12 = [v3 preparedStatementForQueryString:v11];
    if (v12)
    {
      uint64_t v13 = objc_alloc_init(_MFMessageCollector);
      [*(id *)(a1 + 32) _sendMessagesForStatement:v12 connection:v3 to:v13 options:*(unsigned int *)(a1 + 80) timestamp:mach_absolute_time()];
      uint64_t v14 = [(_MFMessageCollector *)v13 copyMessages];
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    else
    {
      uint64_t v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke_cold_1();
      }
    }
  }

  return 1;
}

- (id)_recipientsForMessageWithDatabaseID:(int64_t)a3 connection:(id)a4 recipientsCache:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(_MFRecipientCollection);
  uint64_t v10 = [v7 preparedStatementForQueryString:@"SELECT addresses.ROWID, addresses.address, addresses.comment, recipients.type FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message = ? ORDER BY recipients.position"];
  BOOL v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v24[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__MFMailMessageLibrary__recipientsForMessageWithDatabaseID_connection_recipientsCache___block_invoke;
  v21[3] = &unk_1E5D3CDB0;
  id v13 = v8;
  id v22 = v13;
  uint64_t v14 = v9;
  uint64_t v23 = v14;
  id v20 = 0;
  char v15 = [v10 executeWithIndexedBindings:v12 usingBlock:v21 error:&v20];
  id v16 = v20;

  if ((v15 & 1) == 0) {
    [v7 handleError:v16 message:@"Fetching recipients"];
  }
  uint64_t v17 = v23;
  id v18 = v14;

  return v18;
}

uint64_t __89__MFMailMessageLibrary_sendMessagesMatchingCriterion_to_options_baseTable_range_success___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _canSelectMessagesWithOptions:*(unsigned int *)(a1 + 80) connection:v3];
  char v5 = v4;
  if (v4)
  {
    int v6 = objc_msgSend(*(id *)(a1 + 32), "queryForCriterion:connection:options:baseTable:isSubquery:range:", *(void *)(a1 + 40), v3, *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84), 0, *(void *)(a1 + 56), *(void *)(a1 + 64));
    id v7 = [v3 preparedStatementForQueryString:v6];
    [*(id *)(a1 + 32) _sendMessagesForStatement:v7 connection:v3 to:*(void *)(a1 + 48) options:*(unsigned int *)(a1 + 80) timestamp:mach_absolute_time()];
  }
  id v8 = *(unsigned char **)(a1 + 72);
  if (v8) {
    unsigned char *v8 = v5;
  }

  return 1;
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7 range:(_NSRange)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  id v13 = a3;
  id v14 = a4;
  long long v36 = v14;
  if ([(MFMailMessageLibrary *)self _canSelectMessagesWithOptions:v10 connection:v14])
  {
    BOOL v15 = [(MFMailMessageLibrary *)self isProtectedDataAvailable:v14];
    id v16 = [v13 criterionForSQL];

    id v35 = [(MFMailMessageLibrary *)self _equalToMailboxIDsFromCriterion:v16];
    if (!v9) {
      uint64_t v9 = [v16 bestBaseTable];
    }
    unsigned int v37 = tablesForOptionsAndCriterion(v10, v16, v15);
    uint64_t v17 = [(MFMailMessageLibrary *)self persistence];
    id v18 = [v17 searchableIndexManager];
    id v19 = [(MFMailMessageLibrary *)self database];
    id v20 = [v19 propertyMapper];
    long long v34 = [v16 SQLExpressionWithTables:&v37 baseTable:v9 protectedDataAvailable:v15 searchableIndexManager:v18 mailboxIDs:v35 propertyMapper:v20];

    id v21 = tablesForBaseTableAndOtherTables(v9, v37);
    id v22 = [(MFMailMessageLibrary *)self _selectClauseForOptions:v10 protectedDataAvailable:v15];
    uint64_t v23 = [(MFMailMessageLibrary *)self activeMailboxesClause];
    if (v23) {
      [NSString stringWithFormat:@"%@ FROM %@ WHERE %@%@", v22, v21, v34, v23];
    }
    else {
    __int16 v24 = [NSString stringWithFormat:@"%@ FROM %@ WHERE %@", v22, v21, v34];
    }
    if (!a7)
    {
      if ((v10 & 0x3000180) != 0 || (v9 | 0x10) == 0x10)
      {
        __int16 v25 = NSString;
        id v26 = [(MFMailMessageLibrary *)self _sqlSortByStringFromOptions:v10];
        uint64_t v27 = [v26 UTF8String];
        unint64_t v28 = "ASC";
        if ((v10 & 0x400) == 0) {
          unint64_t v28 = "DESC";
        }
        v29 = [v25 stringWithFormat:@" ORDER BY %1$s %2$s, messages.ROWID %2$s", v27, v28];

        uint64_t v30 = [v24 stringByAppendingString:v29];

        __int16 v24 = (void *)v30;
      }
      if (a8.length != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = objc_msgSend(v24, "stringByAppendingFormat:", @" LIMIT %lu", a8.length);

        __int16 v24 = (void *)v31;
      }
      if (a8.location)
      {
        uint64_t v32 = objc_msgSend(v24, "stringByAppendingFormat:", @" OFFSET %lu", a8.location);

        __int16 v24 = (void *)v32;
      }
    }
  }
  else
  {
    __int16 v24 = 0;
    id v16 = v13;
  }

  return v24;
}

- (MFPersistenceDatabase_iOS)database
{
  return (MFPersistenceDatabase_iOS *)objc_getProperty(self, a2, 248, 1);
}

- (void)_sendMessagesForStatement:(id)a3 connection:(id)a4 to:(id)a5 options:(unsigned int)a6 timestamp:(unint64_t)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [v13 sqlDB];
  double Current = CFAbsoluteTimeGetCurrent();
  v33[0] = 0;
  uint64_t v39 = 0;
  v33[2] = (id)a7;
  uint64_t v31 = self;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  objc_storeStrong(v33, a5);
  v33[1] = (id)0x3F000000000003E8;
  double v34 = Current;
  int v35 = 0;
  unsigned int v36 = a6;
  uint64_t v37 = v15;
  BOOL v38 = [(MFMailMessageLibrary *)v31 isProtectedDataAvailable:v13];
  uint64_t v17 = v39;
  uint64_t v39 = 0;

  id v18 = (void *)MEMORY[0x1AD0E3E00]();
  [(MFMailMessageLibrary *)v31 _iterateStatement:v12 connection:v13 withProgressMonitor:v14 andRowHandler:handleMessageRow context:&v31];
  if ([v32 count])
  {
    id v19 = v32;
    id v20 = MFLogGeneral();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v35) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v21;
    }

    if (v22)
    {
      uint64_t v23 = MFLogGeneral();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        double v24 = CFAbsoluteTimeGetCurrent();
        double v25 = v34;
        uint64_t v26 = [v32 count];
        *(_DWORD *)buf = 134218240;
        *(double *)uint64_t v41 = v24 - v25;
        *(_WORD *)&v41[8] = 2048;
        *(void *)&v41[10] = v26;
        _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_INFO, "#SQLite #Performance %.3f seconds to load first batch of %lu messages", buf, 0x16u);
      }
    }
    [v14 newMessagesAvailable:v19];
    int v27 = [v19 count];
    v35 += v27;
  }
  unint64_t v28 = MFLogGeneral();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int v29 = v35;
    CFAbsoluteTime v30 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v41 = v29;
    *(_WORD *)&void v41[4] = 2048;
    *(double *)&v41[6] = v30 - Current;
    _os_log_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_INFO, "#SQLite #Performance loaded %d messages in %.3f seconds", buf, 0x12u);
  }

  __destructor_8_s0_s8_s16_s72((uint64_t)&v31);
}

- (BOOL)isProtectedDataAvailable:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:7076 description:@"Wrong kind of database connection"];
  }
  char v6 = [v5 protectedDatabaseAttached];

  return v6;
}

- (void)_iterateStatement:(id)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (sqlite3 *)objc_msgSend(v12, "sqlDB", v13);
  unsigned int v36 = v14;
  id v15 = v13;
  id v37 = v15;
  sqlite3_progress_handler(v14, 200, (int (__cdecl *)(void *))progressHandler, &v36);
  id v16 = +[MFActivityMonitor currentMonitor];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __95__MFMailMessageLibrary__iterateStatement_connection_withProgressMonitor_andRowHandler_context___block_invoke;
  v24[3] = &unk_1E5D3C888;
  id v18 = v16;
  id v25 = v18;
  id v19 = v15;
  id v26 = v19;
  int v29 = &v32;
  CFAbsoluteTime v30 = a6;
  uint64_t v31 = a7;
  id v20 = v12;
  id v27 = v20;
  id v21 = v17;
  id v28 = v21;
  id v23 = 0;
  LOBYTE(v13) = [v11 executeUsingBlock:v24 error:&v23];
  id v22 = v23;
  sqlite3_progress_handler(v14, 0, 0, 0);
  if ((v13 & 1) == 0 && !*((unsigned char *)v33 + 24)) {
    [v20 handleError:v22 message:@"loading messages"];
  }

  _Block_object_dispose(&v32, 8);
}

- (id)_selectClauseForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4
{
  if ((a3 & 0x4000) != 0) {
    return @"SELECT messages.conversation_id ";
  }
  if ((a3 & 0x2000) != 0) {
    return @"SELECT COUNT(DISTINCT(messages.message_id)) ";
  }
  if ((a3 & 0x10000) != 0) {
    return &stru_1EFF11268;
  }
  [(MFMailMessageLibrary *)self _selectExpressionForMessageWithAvailableTables:tablesForOptionsAndCriterion(a3, 0, a4) | 0x20];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activeMailboxesClause
{
  [(MFMailMessageLibrary *)self _waitForActiveAccountsRebuild];
  [(MFMailMessageLibrary *)self mf_lock];
  id v3 = self->_activeMailboxesClause;
  [(MFMailMessageLibrary *)self mf_unlock];
  return v3;
}

- (void)_waitForActiveAccountsRebuild
{
  activeAccountsCondition = self->_activeAccountsCondition;
  int v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2.0];
  LODWORD(activeAccountsCondition) = [(NSConditionLock *)activeAccountsCondition lockWhenCondition:0 beforeDate:v4];

  if (activeAccountsCondition)
  {
    id v5 = self->_activeAccountsCondition;
    [(NSConditionLock *)v5 unlock];
  }
}

- (id)_sqlSortByStringFromOptions:(unsigned int)a3
{
  id v3 = @"read_later_date";
  int v4 = @"send_later_date";
  if ((a3 & 0x2000000) == 0) {
    int v4 = @"date_received";
  }
  if ((a3 & 0x1000000) == 0) {
    id v3 = v4;
  }
  if ((a3 & 0x100) != 0) {
    return @"display_date";
  }
  else {
    return v3;
  }
}

- (id)_equalToMailboxIDsFromCriterion:(id)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MFMailMessageLibrary__equalToMailboxIDsFromCriterion___block_invoke;
  v7[3] = &unk_1E5D3D180;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  id v3 = (id)[a3 criterionByApplyingTransform:v7];
  if (*((unsigned char *)v9 + 24))
  {
    int v4 = (void *)v13[5];
    v13[5] = 0;
  }
  id v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

id __56__MFMailMessageLibrary__equalToMailboxIDsFromCriterion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && [v3 criterionType] == 23)
  {
    if ([v4 qualifier] == 3)
    {
      id v5 = [v4 expression];
      uint64_t v6 = [*(id *)(a1 + 32) mailboxIDForURLString:v5];
      if (v6 != *MEMORY[0x1E4F5FCC8])
      {
        id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v7)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
          uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        [v7 addIndex:v6];
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return v4;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MFMailMessageLibrary_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;
  return (OS_os_log *)v2;
}

void __27__MFMailMessageLibrary_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFMailMessageLibrary_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;
  return (OS_os_log *)v2;
}

void __35__MFMailMessageLibrary_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFMailMessageLibrary)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 userAgent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = MFIsMobileMail() ^ 1;
  if (v11) {
    LOBYTE(v12) = 1;
  }
  if ((v12 & 1) == 0)
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"MailMessageLibrary.m", 381, @"Invalid parameter not satisfying: %@", @"userAgent" object file lineNumber description];
  }
  v77.receiver = self;
  v77.super_class = (Class)MFMailMessageLibrary;
  id v13 = [(MFMailMessageLibrary *)&v77 init];
  if (v13)
  {
    uint64_t v14 = [v9 copy];
    id v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v14;

    [v13 renameOrRemoveDatabaseIfNeeded];
    id v16 = [[MFWeakObjectCache alloc] initWithBlock:&__block_literal_global_15];
    id v17 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v16;

    id v72 = v10;
    id v18 = [MFPersistence_iOS alloc];
    id v19 = [(id)objc_opt_class() propertyMapper];
    id v20 = [(MFPersistence_iOS *)v18 initWithPath:v9 inMemoryIdentifier:v10 library:v13 propertyMapper:v19];

    id v21 = [(EDPersistence *)v20 hookRegistry];
    [v21 registerMessageChangeHookResponder:v13];

    id v22 = [(EDPersistence *)v20 hookRegistry];
    [v22 registerProtectedDataReconciliationHookResponder:v13];

    objc_storeStrong((id *)v13 + 30, v20);
    uint64_t v23 = [(MFPersistence_iOS *)v20 database];
    double v24 = (void *)*((void *)v13 + 31);
    *((void *)v13 + 31) = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.message.library", 0);
    id v26 = (void *)*((void *)v13 + 5);
    *((void *)v13 + 5) = v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.message.library.indexing", 0);
    id v28 = (void *)*((void *)v13 + 39);
    *((void *)v13 + 39) = v27;

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.message.library.stats", 0);
    CFAbsoluteTime v30 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v29;

    uint64_t v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.message.library.keybag", v32);
    uint64_t v34 = (void *)*((void *)v13 + 12);
    *((void *)v13 + 12) = v33;

    char v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned int v36 = dispatch_queue_attr_make_with_qos_class(v35, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v37 = dispatch_queue_create("com.apple.message.library.conversationcalculation", v36);
    BOOL v38 = (void *)*((void *)v13 + 13);
    *((void *)v13 + 13) = v37;

    uint64_t v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v40 = dispatch_queue_attr_make_with_qos_class(v39, QOS_CLASS_UTILITY, -10);
    dispatch_queue_t v41 = dispatch_queue_create("com.apple.message.library.fs-compression", v40);
    uint64_t v42 = (void *)*((void *)v13 + 15);
    *((void *)v13 + 15) = v41;

    *((unsigned char *)v13 + 232) = [v11 isAllowedToAccessProtectedData];
    uint64_t v43 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    v44 = (void *)*((void *)v13 + 7);
    *((void *)v13 + 7) = v43;

    *((void *)v13 + 25) = 0;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v46 = (void *)*((void *)v13 + 27);
    *((void *)v13 + 27) = v45;

    id v47 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v48 = (void *)*((void *)v13 + 28);
    *((void *)v13 + 28) = v47;

    uint64_t v49 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.library.fileRemovalAfterCompaction" qualityOfService:9];
    v50 = (void *)*((void *)v13 + 34);
    *((void *)v13 + 34) = v49;

    uint64_t v51 = objc_opt_new();
    uint64_t v52 = (void *)*((void *)v13 + 35);
    *((void *)v13 + 35) = v51;

    *((_DWORD *)v13 + 52) = 0;
    uint64_t v53 = [MEMORY[0x1E4F60DD8] observableObserver];
    v54 = (void *)*((void *)v13 + 21);
    *((void *)v13 + 21) = v53;

    atomic_store(0xFFFFFFFF, (unsigned int *)v13 + 44);
    v55 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    EFVerifyFileProtectionType();
    v56 = [v55 URLByAppendingPathComponent:@"Envelope Index"];
    EFVerifyFileProtectionType();
    *((_DWORD *)v13 + 38) = 0;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v58 = (void *)*((void *)v13 + 20);
    *((void *)v13 + 20) = v57;

    id v59 = objc_alloc_init(MEMORY[0x1E4F60258]);
    v60 = (void *)*((void *)v13 + 23);
    *((void *)v13 + 23) = v59;

    if ([v13 allowedToAccessProtectedData])
    {
      int v61 = [v55 URLByAppendingPathComponent:@"Protected Index"];
      SEL v62 = a2;
      EFVerifyFileProtectionType();
      v63 = *((void *)v13 + 12);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_2;
      block[3] = &unk_1E5D3B5C0;
      id v76 = v13;
      dispatch_sync(v63, block);
    }
    else
    {
      *((void *)v13 + 11) = 2;
      int v61 = EDLibraryLog();
      SEL v62 = a2;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v61, OS_LOG_TYPE_INFO, "access to protected data is not allowed", buf, 2u);
      }
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v13);
    objc_copyWeak(&v73, (id *)buf);
    uint64_t v64 = EFLogRegisterStateCaptureBlock();
    v65 = (void *)*((void *)v13 + 37);
    *((void *)v13 + 37) = v64;

    int v66 = NSClassFromString(&cfstr_Mfmailmessagel_64.isa);
    if (!v66)
    {
      v70 = [MEMORY[0x1E4F28B00] currentHandler];
      [v70 handleFailureInMethod:v62 object:v13 file:@"MailMessageLibrary.m" lineNumber:461 description:@"Class not found."];
    }
    uint64_t v67 = [[v66 alloc] initWithMailMessageLibrary:v13];
    v68 = (void *)*((void *)v13 + 40);
    *((void *)v13 + 40) = v67;

    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)buf);

    id v10 = v72;
  }

  return (MFMailMessageLibrary *)v13;
}

uint64_t __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_2(uint64_t a1)
{
  EFRegisterContentProtectionObserver();
  v2 = EDLibraryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_INFO, "access to protected data is allowed", v6, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  if (EFProtectedDataAvailable()) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  return [v3 _setProtectedDataAvailabilityState:v4];
}

id __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_150(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained persistence];
    uint64_t v4 = [v3 persistenceStatistics];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (MFMailMessageLibrary)initWithPath:(id)a3
{
  id v4 = a3;
  id v5 = MFUserAgent();
  uint64_t v6 = [(MFMailMessageLibrary *)self initWithPath:v4 inMemoryIdentifier:0 userAgent:v5];

  return v6;
}

- (void)dealloc
{
  if ([(MFMailMessageLibrary *)self allowedToAccessProtectedData]) {
    EFUnregisterContentProtectionObserver();
  }
  [(MFMailMessageLibrary *)self _cancelPendingJournalReconciliation];
  xpc_activity_unregister("com.apple.message.statisticsLogging");
  [(MFMailMessageLibrary *)self closeDatabaseConnections];
  id v3 = [(MFMailMessageLibrary *)self stateCaptureCancelable];
  [v3 cancel];

  EFAtomicSetOnceObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageLibrary;
  [(MFMailMessageLibrary *)&v4 dealloc];
}

+ (id)propertyMapper
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F60EE0]) initWithAllowedProtocolPrefixes:&unk_1EFF50010];
  id v3 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"ROWID" table:v3 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_libraryID];

  objc_super v4 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"remote_id" table:v4 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_remoteID];

  id v5 = [MEMORY[0x1E4F60B40] messagesTableName];
  v65 = @"MFPropertyMapperLookupKeyCriterionType";
  v66[0] = &unk_1EFF50C28;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  [v2 registerColumnName:@"date_received" table:v5 lookupKeys:v6 forClass:objc_opt_class() property:sel_dateReceived];

  id v7 = [MEMORY[0x1E4F60B40] messagesTableName];
  v63 = @"MFPropertyMapperLookupKeyCriterionType";
  uint64_t v64 = &unk_1EFF50C40;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  [v2 registerColumnName:@"date_sent" table:v7 lookupKeys:v8 forClass:objc_opt_class() property:sel_dateSent];

  id v9 = [MEMORY[0x1E4F60B40] messagesTableName];
  int v61 = @"MFPropertyMapperLookupKeyCriterionType";
  SEL v62 = &unk_1EFF50C58;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  [v2 registerColumnName:@"display_date" table:v9 lookupKeys:v10 forClass:objc_opt_class() property:sel_displayDate];

  id v11 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"flags" table:v11 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_messageFlags];

  int v12 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"size" table:v12 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_messageSize];

  id v13 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"subject_prefix" table:v13 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_prefix];

  [v2 registerColumnName:@"subject" table:@"subjects" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_subjectWithoutPrefix];
  id v59 = @"MFColumnAlias";
  v60 = @"sender_comment";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  [v2 registerColumnName:@"comment" table:@"sender" lookupKeys:v14 forClass:objc_opt_class() property:sel_displayName];

  id v57 = @"MFColumnAlias";
  v58 = @"sender_address";
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  [v2 registerColumnName:@"address" table:@"sender" lookupKeys:v15 forClass:objc_opt_class() property:sel_address];

  [v2 registerColumnName:@"summary" table:@"summaries" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_summary];
  id v16 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"mailbox" table:v16 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_mailboxID];

  id v17 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"original_mailbox" table:v17 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_originalMailboxID];

  id v18 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"content_type" table:v18 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_contentType];

  id v19 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"conversation_id" table:v19 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_conversationID];

  id v20 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"encoding" table:v20 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_preferredEncoding];

  id v21 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"external_id" table:v21 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_externalID];

  id v22 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"global_message_id" table:v22 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_globalMessageID];

  uint64_t v23 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"message_id" table:v23 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_messageIDHash];

  double v24 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"unique_id" table:v24 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_uniqueRemoteId];

  v55 = @"MFColumnAlias";
  v56 = @"conversation_flags";
  dispatch_queue_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  [v2 registerColumnName:@"flags" table:@"conversations" lookupKeys:v25 forClass:objc_opt_class() property:sel_conversationFlags];

  id v26 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"list_id_hash" table:v26 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_listIDHash];

  dispatch_queue_t v27 = [MEMORY[0x1E4F60B40] messagesTableName];
  [v2 registerColumnName:@"document_id" table:v27 lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_documentID];

  id v28 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
  v53[0] = @"MFColumnAlias";
  v53[1] = @"MFPropertyMapperLookupKeyCriterionType";
  v54[0] = @"read_later_date";
  v54[1] = &unk_1EFF50C70;
  dispatch_queue_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  [v2 registerColumnName:@"read_later_date" table:v28 lookupKeys:v29 forClass:objc_opt_class() property:sel_date];

  CFAbsoluteTime v30 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
  v51[0] = @"MFColumnAlias";
  v51[1] = @"MFPropertyMapperLookupKeyCriterionType";
  v52[0] = @"send_later_date";
  v52[1] = &unk_1EFF50C88;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v2 registerColumnName:@"send_later_date" table:v30 lookupKeys:v31 forClass:objc_opt_class() property:sel_sendLaterDate];

  uint64_t v32 = [MEMORY[0x1E4F60B40] messagesTableName];
  uint64_t v49 = @"MFPropertyMapperLookupKeyCriterionType";
  v50 = &unk_1EFF50CA0;
  dispatch_queue_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  [v2 registerColumnName:@"unsubscribe_type" table:v32 lookupKeys:v33 forClass:objc_opt_class() property:sel_unsubscribeType];

  uint64_t v34 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
  v47[0] = @"MFColumnAlias";
  v47[1] = @"MFPropertyMapperLookupKeyCriterionType";
  v48[0] = @"follow_up_start_date";
  v48[1] = &unk_1EFF50CB8;
  char v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v2 registerColumnName:@"follow_up_start_date" table:v34 lookupKeys:v35 forClass:objc_opt_class() property:sel_startDate];

  unsigned int v36 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
  v45[0] = @"MFColumnAlias";
  v45[1] = @"MFPropertyMapperLookupKeyCriterionType";
  v46[0] = @"follow_up_end_date";
  v46[1] = &unk_1EFF50CD0;
  dispatch_queue_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v2 registerColumnName:@"follow_up_end_date" table:v36 lookupKeys:v37 forClass:objc_opt_class() property:sel_endDate];

  v43[0] = @"MFColumnAlias";
  v43[1] = @"MFDefaultValue";
  v44[0] = @"sender_bucket";
  v44[1] = &unk_1EFF50CE8;
  v43[2] = @"MFPropertyMapperLookupKeyCriterionType";
  v44[2] = &unk_1EFF50D00;
  BOOL v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  [v2 registerColumnName:@"bucket" table:@"senders" lookupKeys:v38 forClass:objc_opt_class() property:sel_senderBucket];

  dispatch_queue_t v41 = @"MFColumnAlias";
  uint64_t v42 = @"brand_indicator_location";
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  [v2 registerColumnName:@"url" table:@"brand_indicators" lookupKeys:v39 forClass:objc_opt_class() property:sel_brandIndicatorLocation];

  return v2;
}

+ (void)test_setDefaultInstance:(id)a3
{
  id v8 = a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MailMessageLibrary.m", 679, @"%s can only be called from unit tests", "+[MFMailMessageLibrary test_setDefaultInstance:]");
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sSharedInstanceLock);
  objc_storeStrong((id *)&sSharedInstance_0, a3);
  uint64_t v6 = +[MFLibraryStore sharedInstanceIfExists];
  [v6 setLibrary:sSharedInstance_0];

  os_unfair_lock_unlock((os_unfair_lock_t)&sSharedInstanceLock);
}

- (void)invalidateAndWait
{
  EFUnregisterContentProtectionObserver();
  id v3 = [(MFMailMessageLibrary *)self hookRegistry];
  [v3 persistenceDidInvalidate];

  id v4 = [(MFMailMessageLibrary *)self hookRegistry];
  [v4 unregisterAllHookResponders];

  id v5 = [(MFMailMessageLibrary *)self fileRemovalAfterCompactionScheduler];
  [v5 performSyncBlock:&__block_literal_global_365];
}

- (void)_setSuspendedUnderLock:(BOOL)a3
{
}

- (void)start
{
  id v3 = [(MFMailMessageLibrary *)self database];
  [v3 reconcileJournalWithCompletionBlock:0];

  id v4 = [(MFMailMessageLibrary *)self searchableIndex];
  [v4 applicationWillResume];

  id v5 = [(MFMailMessageLibrary *)self storedIntegerPropertyWithName:@"NeedToMigrateFiles"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [[MFMessageBodyMigrator alloc] initWithLibrary:self];
    [(MFMailMessageLibrary *)self setBodyMigrator:v7];

    id v8 = [(MFMailMessageLibrary *)self bodyMigrator];
    [v8 startMigratingBodies];
  }
  else
  {
    id v9 = [(MFMailMessageLibrary *)self storedIntegerPropertyWithName:@"NeedToMigrateAttachments"];
    int v10 = [v9 BOOLValue];

    if (!v10) {
      goto LABEL_6;
    }
    id v11 = [[MFMessageAttachmentMigrator alloc] initWithLibrary:self];
    [(MFMailMessageLibrary *)self setAttachmentMigrator:v11];

    id v8 = [(MFMailMessageLibrary *)self attachmentMigrator];
    [v8 startMigratingAttachments];
  }

LABEL_6:
  int v12 = [(MFMailMessageLibrary *)self storedIntegerPropertyWithName:@"UseLegacyMessageIDHashFormat"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = EDLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Using legacy message-id hash format", buf, 2u);
    }

    id v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    [v15 setBool:1 forKey:*MEMORY[0x1E4F601B0]];
  }
  else
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    [v15 removeObjectForKey:*MEMORY[0x1E4F601B0]];
  }

  MFSetUseLegacyMessageIDHashFormat();
  AnalyticsSendEventLazy();
}

id __29__MFMailMessageLibrary_start__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"useLegacyFormat";
  os_log_t v1 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)test_tearDown
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailMessageLibrary.m", 728, @"%s can only be called from unit tests", "-[MFMailMessageLibrary test_tearDown]");
  }
  id v4 = [(MFMailMessageLibrary *)self remoteContentParser];
  objc_msgSend(v4, "test_tearDown");

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = +[MailAccount mailAccounts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "test_tearDown");
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  +[MailAccount setMailAccounts:MEMORY[0x1E4F1CBF0]];
  +[MailAccount test_tearDown];
  +[MFInvocationQueue flushAllInvocationQueues];
  id v9 = [(MFMailMessageLibrary *)self mailboxFrecencyController];
  objc_msgSend(v9, "test_tearDown");

  int v10 = [(MFMailMessageLibrary *)self persistence];
  objc_msgSend(v10, "test_tearDown");

  [(MFMailMessageLibrary *)self invalidateAndWait];
  [(MFMailMessageLibrary *)self closeDatabaseConnections];
  +[MFMailMessageLibrary test_setDefaultInstance:0];
  MFSetUserAgent(0);
}

- (void)bodyMigrationFinished
{
  [(MFMailMessageLibrary *)self setStoredIntegerPropertyWithName:@"NeedToMigrateFiles" value:MEMORY[0x1E4F1CC28]];
  [(MFMailMessageLibrary *)self setBodyMigrator:0];
  id v3 = [[MFMessageAttachmentMigrator alloc] initWithLibrary:self];
  -[MFMailMessageLibrary setAttachmentMigrator:](self, "setAttachmentMigrator:");

  id v4 = [(MFMailMessageLibrary *)self attachmentMigrator];
  [v4 startMigratingAttachments];
}

- (void)attachmentMigrationFinished
{
  [(MFMailMessageLibrary *)self setStoredIntegerPropertyWithName:@"NeedToMigrateAttachments" value:MEMORY[0x1E4F1CC28]];
  [(MFMailMessageLibrary *)self setAttachmentMigrator:0];
}

- (EDSearchableIndex)searchableIndex
{
  v2 = [(MFMailMessageLibrary *)self persistence];
  id v3 = [v2 searchableIndexManager];
  id v4 = [v3 index];

  return (EDSearchableIndex *)v4;
}

- (MFMessageChangeManager_iOS)messageChangeManager
{
  v2 = [(MFMailMessageLibrary *)self persistence];
  id v3 = [v2 messageChangeManager];

  return (MFMessageChangeManager_iOS *)v3;
}

- (void)_didAddUnreconciledMessages:(unint64_t)a3
{
  unsigned int v3 = atomic_load(&self->_unreconciledMessageChangeCount);
  unsigned int v4 = v3;
  do
  {
    atomic_compare_exchange_strong((atomic_uint *volatile)&self->_unreconciledMessageChangeCount, &v4, v3 + a3);
    if (v3 + a3 < 0x3E8) {
      int v5 = 1;
    }
    else {
      int v5 = 3;
    }
    if (v4 != v3) {
      int v5 = 0;
    }
    unsigned int v3 = v4;
  }
  while (!v5);
  if (v5 == 3) {
    [(MFMailMessageLibrary *)self _updateUnreconciledMessageCount];
  }
}

- (EFObservable)unreconciledMessageCountObservable
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MFMailMessageLibrary *)self unreconciledMessageCount];
  unsigned int v4 = [(EFObserver *)self->_unreconciledMessageCountObservable distinctUntilChanged];
  int v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v7 = [v4 startWith:v6];

  return (EFObservable *)v7;
}

- (unint64_t)unreconciledMessageCount
{
  p_unreconciledMessageCount = &self->_unreconciledMessageCount;
  unint64_t result = atomic_load(&self->_unreconciledMessageCount);
  if (result == -1)
  {
    LODWORD(result) = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithLibrary:self];
    atomic_store(result, p_unreconciledMessageCount);
    return result;
  }
  return result;
}

- (void)_updateUnreconciledMessageCount
{
  atomic_store(+[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithLibrary:self], &self->_unreconciledMessageCount);
  atomic_store(0, &self->_unreconciledMessageChangeCount);
  unreconciledMessageCountObservable = self->_unreconciledMessageCountObservable;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFObserver observerDidReceiveResult:](unreconciledMessageCountObservable, "observerDidReceiveResult:");
}

- (void)setFlags:(unint64_t)a3 forMessage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 messageFlags];
  if (v7 != a3) {
    [v6 setMessageFlagsWithoutCommitting:a3];
  }
  uint64_t v8 = [(MFMailMessageLibrary *)self database];
  id v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setFlags:forMessage:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__MFMailMessageLibrary_setFlags_forMessage___block_invoke;
  v11[3] = &unk_1E5D3C4D8;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  unint64_t v13 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v11);

  [(MFMailMessageLibrary *)self postOldFlags:v7 newFlags:a3 forMessage:v10];
}

uint64_t __44__MFMailMessageLibrary_setFlags_forMessage___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3 == a4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    if (!v9) {
      goto LABEL_80;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = v10;
    if ((a3 & 1) != (a4 & 1))
    {
      if (a4) {
        uint64_t v12 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v12 = MEMORY[0x1E4F1CC28];
      }
      [v10 setObject:v12 forKey:@"MessageIsRead"];
    }
    unint64_t v13 = a4 ^ a3;
    if ((a4 ^ a3) < 2) {
      goto LABEL_77;
    }
    if (((a3 >> 1) & 1) != ((a4 >> 1) & 1))
    {
      if ((a4 & 2) != 0) {
        uint64_t v14 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v14 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v14 forKey:@"MessageIsDeleted"];
    }
    if (v13 < 4) {
      goto LABEL_77;
    }
    if (((a3 >> 2) & 1) != ((a4 >> 2) & 1))
    {
      if ((a4 & 4) != 0) {
        uint64_t v15 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v15 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v15 forKey:@"MessageWasRepliedTo"];
    }
    if (v13 < 8) {
      goto LABEL_77;
    }
    if (((a3 >> 3) & 1) != ((a4 >> 3) & 1))
    {
      if ((a4 & 8) != 0) {
        uint64_t v16 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v16 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v16 forKey:@"MessageIsEncrypted"];
    }
    if (v13 < 0x10) {
      goto LABEL_77;
    }
    if (((a3 >> 23) & 1) != ((a4 >> 23) & 1))
    {
      if ((a4 & 0x800000) != 0) {
        uint64_t v17 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v17 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v17 forKey:@"MessageIsSigned"];
    }
    if ((v13 & 0xFFFFFFFFFF7FFFF0) == 0) {
      goto LABEL_77;
    }
    if (((a3 >> 24) & 1) != ((a4 >> 24) & 1))
    {
      if ((a4 & 0x1000000) != 0) {
        uint64_t v18 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v18 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v18 forKey:@"MessageSenderIsVIP"];
    }
    if ((v13 & 0xFFFFFFFFFE7FFFF0) == 0) {
      goto LABEL_77;
    }
    if (((a3 >> 8) & 1) != ((a4 >> 8) & 1))
    {
      if ((a4 & 0x100) != 0) {
        uint64_t v19 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v19 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v19 forKey:@"MessageWasForwarded"];
    }
    if ((v13 & 0xFFFFFFFFFE7FFEF0) == 0) {
      goto LABEL_77;
    }
    if (((a3 >> 9) & 1) != ((a4 >> 9) & 1))
    {
      if ((a4 & 0x200) != 0) {
        uint64_t v20 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v20 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v20 forKey:@"MessageWasRedirected"];
    }
    if ((v13 & 0xFFFFFFFFFE7FFCF0) == 0) {
      goto LABEL_77;
    }
    if (((a3 >> 4) & 1) != ((a4 >> 4) & 1))
    {
      if ((a4 & 0x10) != 0) {
        uint64_t v21 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v21 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v21 forKey:@"MessageIsFlagged"];
    }
    if ((v13 & 0xFFFFFFFFFE7FFCE0) == 0) {
      goto LABEL_77;
    }
    if (((a3 >> 30) & 1) != ((a4 >> 30) & 1))
    {
      if ((a4 & 0x40000000) != 0) {
        uint64_t v22 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v22 = MEMORY[0x1E4F1CC28];
      }
      [v11 setObject:v22 forKey:@"MessageHighlightTextInTOC"];
    }
    if ((v13 & 0xFFFFFFFFBE7FFCE0) == 0) {
      goto LABEL_77;
    }
    if ((WORD1(a3) & 7) != (WORD1(a4) & 7))
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
      [v11 setObject:v23 forKey:@"MessagePriorityLevel"];
    }
    if ((v13 & 0xFFFFFFFFBE78FCE0) == 0) {
      goto LABEL_77;
    }
    unint64_t v24 = ((a3 >> 26) & 7) - 1;
    int v25 = v24 > 6 ? 0 : dword_1A8AC6450[v24];
    unint64_t v26 = ((a4 >> 26) & 7) - 1;
    int v27 = v26 > 6 ? 0 : dword_1A8AC6450[v26];
    if (v25 != v27)
    {
      id v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
      [v11 setObject:v28 forKey:@"MessageFontSizeDelta"];
    }
    if ((v13 & 0xFFFFFFFFA278FCE0) != 0) {
      id v9 = 0;
    }
    else {
LABEL_77:
    }
      id v9 = v11;

    if (!v9) {
      goto LABEL_80;
    }
  }
  if ([v9 count])
  {
LABEL_80:
    v34[0] = v8;
    dispatch_queue_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    CFAbsoluteTime v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", a3, v8);
    dispatch_queue_t v33 = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [(MFMailMessageLibrary *)self postFlagsChangedForMessages:v29 flags:v9 oldFlagsByMessage:v31];
  }
}

- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v12 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v12 forKey:@"messages"];
    if (v9) {
      [v10 setObject:v9 forKey:@"oldFlagsByMessage"];
    }
    if (v8) {
      [v10 setObject:v8 forKey:@"flags"];
    }
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"MailMessageStoreMessageFlagsChanged" object:self userInfo:v10];
  }
}

- (void)updateFlagsForMessagesInPlace:(id)a3 success:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 keyEnumerator];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  id v8 = [(MFMailMessageLibrary *)self database];
  id v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary updateFlagsForMessagesInPlace:success:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MFMailMessageLibrary_updateFlagsForMessagesInPlace_success___block_invoke;
  v12[3] = &unk_1E5D3C500;
  id v10 = v7;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  uint64_t v15 = &v16;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

  if (a4) {
    *a4 = *((_DWORD *)v17 + 6) == 101;
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __62__MFMailMessageLibrary_updateFlagsForMessagesInPlace_success___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  for (uint64_t i = 0; ; uint64_t i = v5)
  {
    int v5 = [*(id *)(a1 + 32) nextObject];

    if (!v5) {
      break;
    }
    id v6 = [*(id *)(a1 + 40) objectForKey:v5];
    sqlite3_int64 v7 = [v6 unsignedLongLongValue];

    [v3 preparedStatementForQueryString:@"UPDATE messages SET flags = (flags|:flags) WHERE rowid = :rowid"];
    id v8 = objc_claimAutoreleasedReturnValue();
    id v9 = (sqlite3_stmt *)[v8 compiled];
    id v10 = v9;
    if (v9)
    {
      int v11 = sqlite3_bind_parameter_index(v9, ":flags");
      sqlite3_bind_int64(v10, v11, v7);
      int v12 = sqlite3_bind_parameter_index(v10, ":rowid");
      sqlite3_bind_int64(v10, v12, [v5 libraryID]);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_step(v10);
      sqlite3_reset(v10);
      [v3 handleSQLResult:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) message:@"setting flags"];
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 101)
      {

        break;
      }
    }
  }
  return 1;
}

- (id)updateFlagsForMessages:(id)a3 changes:(id)a4 transformer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v10, v8);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 0;
  id v13 = [(MFMailMessageLibrary *)self database];
  id v14 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary updateFlagsForMessages:changes:transformer:]"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke;
  v21[3] = &unk_1E5D3C528;
  id v15 = v8;
  id v22 = v15;
  int v27 = v28;
  id v16 = v10;
  id v26 = v16;
  id v17 = v12;
  id v23 = v17;
  id v18 = v11;
  id v24 = v18;
  int v25 = self;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v21);

  [(MFMailMessageLibrary *)self postFlagsChangedForMessages:v17 flags:v9 oldFlagsByMessage:v18];
  id v19 = v17;

  _Block_object_dispose(v28, 8);
  return v19;
}

uint64_t __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT flags FROM messages WHERE ROWID = ?;"];
  id v4 = objc_claimAutoreleasedReturnValue();
  int v5 = (sqlite3_stmt *)[v4 compiled];
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
          break;
        }
        id v8 = [*(id *)(a1 + 32) objectAtIndex:i];
        objc_msgSend(v8, "mf_lock");
        uint64_t v9 = [v8 messageFlags];
        sqlite3_bind_int64(v5, 1, [v8 libraryID]);
        unint64_t v10 = v9;
        if (sqlite3_step(v5) == 100)
        {
          sqlite3_int64 v11 = sqlite3_column_int64(v5, 0);
          unint64_t v10 = v9;
          if (v11 != v9)
          {
            int v12 = MFLogGeneral();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke_cold_1(&v19, v20);
            }

            unint64_t v10 = v11;
          }
        }
        sqlite3_reset(v5);
        uint64_t v14 = *(void *)(a1 + 64);
        unint64_t v15 = v10;
        if (v14)
        {
          unint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(v14 + 16))(v14, v10);
          uint64_t v16 = *(void *)(a1 + 64);
          if (v16)
          {
            uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v16, v9);
            if (v13 != v9) {
              [v8 setMessageFlagsWithoutCommitting:v13];
            }
          }
        }
        objc_msgSend(v8, "mf_unlock", v13);
        if (v15 != v10)
        {
          [*(id *)(a1 + 40) addObject:v8];
          id v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v10];
          [*(id *)(a1 + 48) setObject:v17 forKeyedSubscript:v8];

          *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = setFlagsForMessage(v3, v8, v15);
        }
      }
    }
  }

  return 1;
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"MessageIsDeleted"];
  int v9 = [v8 BOOLValue];

  if (v9) {
    [(MFMailMessageLibrary *)self removeSearchableItemsForMessages:v7];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MFMailMessageLibrary_setFlagsFromDictionary_forMessages___block_invoke;
  v13[3] = &unk_1E5D3C550;
  id v10 = v6;
  id v14 = v10;
  sqlite3_int64 v11 = [(MFMailMessageLibrary *)self updateFlagsForMessages:v7 changes:v10 transformer:v13];

  return v11;
}

unint64_t __59__MFMailMessageLibrary_setFlagsFromDictionary_forMessages___block_invoke(uint64_t a1, unint64_t a2)
{
  return MFMessageFlagsByApplyingDictionary(a2, *(void **)(a1 + 32));
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  int v12 = [(MFMailMessageLibrary *)self database];
  uint64_t v13 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setNumberOfAttachments:isSigned:isEncrypted:forMessage:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke;
  v18[3] = &unk_1E5D3C5A0;
  id v14 = v11;
  id v19 = v14;
  uint64_t v20 = self;
  id v15 = v10;
  unsigned int v23 = a3;
  BOOL v24 = a4;
  BOOL v25 = a5;
  id v21 = v15;
  id v22 = &v26;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v18);

  if (*((unsigned char *)v27 + 24) && [v15 conformsToProtocol:&unk_1EFF60D58])
  {
    uint64_t v16 = [(MFMailMessageLibrary *)self hookRegistry];
    v30[0] = *MEMORY[0x1E4F60788];
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v16 persistenceDidUpdateProperties:v17 message:v15 generationWindow:v14];
  }
  _Block_object_dispose(&v26, 8);
}

uint64_t __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  id v4 = *(void **)(a1 + 40);
  v14[0] = *(void *)(a1 + 48);
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  int v12 = @"MessageNumberOfAttachmentsChanged";
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke_2;
  v9[3] = &unk_1E5D3C578;
  int v10 = *(_DWORD *)(a1 + 64);
  __int16 v11 = *(_WORD *)(a1 + 68);
  v9[4] = *(void *)(a1 + 56);
  id v7 = (id)[v4 updateFlagsForMessages:v5 changes:v6 transformer:v9];

  return 1;
}

unint64_t __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t result = _MFFlagsBySettingNumberOfAttachments(a2, *(_DWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
  if (result != a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)setMessage:(id)a3 isPartial:(BOOL)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __45__MFMailMessageLibrary_setMessage_isPartial___block_invoke;
  v9[3] = &__block_descriptor_33_e8_Q16__0Q8l;
  BOOL v10 = a4;
  id v8 = [(MFMailMessageLibrary *)self updateFlagsForMessages:v7 changes:0 transformer:v9];
}

unint64_t __45__MFMailMessageLibrary_setMessage_isPartial___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(a1 + 32) << 34);
}

- (BOOL)_fileType:(int64_t)a3 orHigherExistsAtDirectory:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  if (!a3) {
    goto LABEL_8;
  }
  if (a3 != 1)
  {
    if (a3 != 2) {
      goto LABEL_11;
    }
    id v8 = [v5 stringByAppendingPathComponent:@"headers.emlx"];
    if ([v6 fileExistsAtPath:v8]) {
      goto LABEL_9;
    }
    id v7 = v8;
  }
  id v8 = [v5 stringByAppendingPathComponent:@"partial.emlx"];

  if (([v6 fileExistsAtPath:v8] & 1) == 0)
  {
    id v7 = v8;
LABEL_8:
    id v8 = [v5 stringByAppendingPathComponent:@"full.emlx"];

    if ([v6 fileExistsAtPath:v8]) {
      goto LABEL_9;
    }
    id v7 = v8;
LABEL_11:
    BOOL v9 = 0;
    id v8 = v7;
    goto LABEL_12;
  }
LABEL_9:
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)_removeEmlxFilesOfTypeLessThanType:(int64_t)a3 inDirectory:(id)a4
{
  id v7 = a4;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (a3 == 1)
  {
    id v6 = [v7 stringByAppendingPathComponent:@"headers.emlx"];
    [v5 removeItemAtPath:v6 error:0];
  }
}

- (BOOL)_writeEmlxFileOfType:(int64_t)a3 forAccount:(id)a4 toDirectory:(id)a5 withData:(id)a6 protectionClass:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(MFMailMessageLibrary *)self _fileType:a3 orHigherExistsAtDirectory:v13])
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    uint64_t v16 = @"full.emlx";
    if (a3 == 1) {
      uint64_t v16 = @"partial.emlx";
    }
    if (a3 == 2) {
      id v17 = @"headers.emlx";
    }
    else {
      id v17 = v16;
    }
    id v18 = [v13 stringByAppendingPathComponent:v17];
    BOOL v15 = -[MFMailMessageLibrary _writeEmlxFile:withData:protectionClass:purgeable:](self, "_writeEmlxFile:withData:protectionClass:purgeable:", v18, v14, a7, [v12 supportsPurge]);
    if (v15) {
      [(MFMailMessageLibrary *)self _removeEmlxFilesOfTypeLessThanType:a3 inDirectory:v13];
    }
  }
  return v15;
}

- (BOOL)_writeEmlxFile:(id)a3 withData:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  __int16 v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  id v12 = [v10 data];
  LOBYTE(v6) = [(MFMailMessageLibrary *)self _writeEmlxData:v12 toFile:v11 protectionClass:a5 purgeable:v6];

  return v6;
}

- (BOOL)_writeEmlxData:(id)a3 toFile:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6
{
  BOOL v6 = a6;
  int v7 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v11 temporaryDirectory];
  id v13 = [v12 URLByAppendingPathComponent:@"emlx.XXXXXXXXXXXXXXXX" isDirectory:0];

  memset(__b, 170, 0x401uLL);
  id v14 = v13;
  [v14 fileSystemRepresentation];
  if ((unint64_t)__strlcpy_chk() > 0x400) {
    goto LABEL_22;
  }
  uint64_t v15 = mkstemp_dprotected_np(__b, v7, 0);
  uint64_t v16 = __error();
  if ((v15 & 0x80000000) != 0)
  {
    int v41 = *v16;
    uint64_t v42 = EDLibraryLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:](v41, v42);
    }
    goto LABEL_21;
  }
  id v17 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__b isDirectory:0 relativeToURL:0];
  if (!v17)
  {
    close(v15);
    uint64_t v42 = EDLibraryLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:]();
    }
LABEL_21:

LABEL_22:
    id v17 = 0;
LABEL_23:
    BOOL v40 = 0;
    goto LABEL_24;
  }

  id v14 = (id)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v15 closeOnDealloc:0];
  id v48 = 0;
  char v18 = [v14 writeData:v9 error:&v48];
  id v19 = v48;
  uint64_t v20 = v19;
  if ((v18 & 1) == 0)
  {
    v44 = EDLibraryLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.6();
    }

    close(v15);
    goto LABEL_23;
  }

  if (v6 && EFMarkFileAsPurgeableFD())
  {
    int v21 = *__error();
    id v22 = EDLibraryLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unsigned int v23 = [v17 path];
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.5(v23, buf, v21, v22);
    }
  }
  close(v15);
  id v17 = v17;
  BOOL v24 = (const std::__fs::filesystem::path *)[v17 fileSystemRepresentation];
  id v25 = v10;
  uint64_t v26 = (const std::__fs::filesystem::path *)[v25 fileSystemRepresentation];
  rename(v24, v26, v27);
  if (!v28)
  {
    BOOL v40 = 1;
    goto LABEL_25;
  }
  if (*__error() == 2)
  {
    char v29 = [v25 URLByDeletingLastPathComponent];
    CFAbsoluteTime v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v30 createDirectoryAtURL:v29 withIntermediateDirectories:1 attributes:0 error:0];

    id v31 = v17;
    uint64_t v32 = (const std::__fs::filesystem::path *)[v31 fileSystemRepresentation];
    dispatch_queue_t v33 = (const std::__fs::filesystem::path *)[v25 fileSystemRepresentation];
    rename(v32, v33, v34);
    LODWORD(v32) = v35;

    if (!v32)
    {
      BOOL v40 = 1;
      id v17 = v31;
      goto LABEL_25;
    }
  }
  int v36 = *__error();
  dispatch_queue_t v37 = EDLibraryLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.4(v36, v37);
  }

  BOOL v38 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v47 = 0;
  char v39 = [v38 moveItemAtURL:v17 toURL:v25 error:&v47];
  id v14 = v47;

  if ((v39 & 1) == 0)
  {
    id v45 = EDLibraryLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = [v25 path];
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:](v46, (uint64_t)v14, (uint64_t)__b);
    }

    goto LABEL_23;
  }
  BOOL v40 = 1;
LABEL_24:

LABEL_25:
  return v40;
}

- (id)referencesFromHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F60DB8] indexSet];
  id v5 = [v3 references];
  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = MFStringHashForMessageIDHeader();
          if (v10) {
            objc_msgSend(v4, "addIndex:", v10, v14);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  __int16 v11 = objc_msgSend(v3, "firstHeaderForKey:", *MEMORY[0x1E4F606C8], v14);
  if (v11)
  {
    uint64_t v12 = MFStringHashForMessageIDHeader();
    if (v12) {
      [v4 addIndex:v12];
    }
  }

  return v4;
}

- (id)_addThreadingInfoWithContext:(id)a3 usingDatabaseConnection:(id)a4
{
  void v52[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v37 = a4;
  uint64_t v6 = [v5 mailboxID];
  uint64_t v7 = [v5 subject];
  int v36 = [v7 subjectWithoutPrefix];

  int v35 = [v5 messageIDsBySubject];
  uint64_t v8 = [v5 libraryID];
  id v32 = [MEMORY[0x1E4F60DB8] indexSet];
  dispatch_queue_t v33 = [v37 preparedStatementForQueryString:@"SELECT messages.ROWID, messages.message_id, messages.conversation_id, messages.subject_prefix, subjects.subject, addresses.comment, addresses.address, messages.date_sent FROM messages JOIN subjects ON messages.subject = subjects.ROWID JOIN addresses ON messages.sender = addresses.ROWID WHERE subjects.subject = ? AND messages.mailbox = ?"];
  id v38 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v52[0] = v36;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", v6, v9);
  v52[1] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v30 = v8;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke;
  v42[3] = &unk_1E5D3C5E8;
  id v12 = v9;
  id v43 = v12;
  id v41 = 0;
  LOBYTE(v9) = [v33 executeWithIndexedBindings:v11 usingBlock:v42 error:&v41];
  id v31 = v41;

  if ((v9 & 1) == 0) {
    [v37 handleError:v31 message:@"querying subject references for threads"];
  }
  id v13 = [v12 allKeys];
  long long v14 = [(MFMailMessageLibrary *)self _recipientsForMessagesWithDatabaseIDs:v13 includeTo:1 includeCC:1 includeBCC:1];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke_2;
  v39[3] = &unk_1E5D3C610;
  id v29 = v14;
  id v40 = v29;
  [v12 enumerateKeysAndObjectsUsingBlock:v39];
  long long v15 = objc_alloc_init(MFThreadFuzzyMatcher);
  long long v16 = [v12 allValues];
  long long v17 = [(MFThreadFuzzyMatcher *)v15 matchMessageReferenceContext:v5 withCandidateMessageReferenceContexts:v16];

  if (v17)
  {
    char v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v5 messageIDHash];
      uint64_t v20 = [v17 messageIDHash];
      uint64_t v21 = [v17 conversationIDHash];
      id v22 = [v17 subject];
      unsigned int v23 = objc_msgSend(v22, "ef_publicDescription");
      *(_DWORD *)buf = 134218754;
      uint64_t v45 = v19;
      __int16 v46 = 2048;
      uint64_t v47 = v20;
      __int16 v48 = 2048;
      uint64_t v49 = v21;
      __int16 v50 = 2114;
      uint64_t v51 = v23;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Threading %lld: found conversation from fuzzy matching: messageID: %lld, conversationID: %lld, subject: %{public}@", buf, 0x2Au);
    }
    objc_msgSend(v38, "addIndex:", objc_msgSend(v17, "messageIDHash"));
    objc_msgSend(v32, "addIndex:", objc_msgSend(v17, "conversationIDHash"));
  }
  BOOL v24 = MFLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v5 messageIDHash];
    uint64_t v26 = [v35 objectForKeyedSubscript:v36];
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = v25;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v26;
    _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Threading %lld: adding in previously tracked messages IDs with the same subject: %@", buf, 0x16u);
  }
  int v27 = [v35 objectForKeyedSubscript:v36];
  [v38 addIndexes:v27];

  [(MFMailMessageLibrary *)self _insertThreadReferences:v38 toMessageWithLibraryID:v30 usingDatabaseConnection:v37];
  return v32;
}

void __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v3 = [v26 objectAtIndexedSubscript:0];
  uint64_t v25 = [v3 numberValue];

  id v4 = [v26 objectAtIndexedSubscript:1];
  uint64_t v5 = [v4 int64Value];

  uint64_t v6 = [v26 objectAtIndexedSubscript:2];
  uint64_t v7 = [v6 int64Value];

  uint64_t v8 = [v26 objectAtIndexedSubscript:3];
  id v9 = [v8 stringValue];

  uint64_t v10 = [v26 objectAtIndexedSubscript:4];
  __int16 v11 = [v10 stringValue];

  id v12 = [v26 objectAtIndexedSubscript:5];
  id v13 = [v12 stringValue];

  long long v14 = [v26 objectAtIndexedSubscript:6];
  long long v15 = [v14 stringValue];

  long long v16 = [v26 objectAtIndexedSubscript:7];
  long long v17 = [v16 numberValue];
  int v18 = [v17 intValue];

  if (v5 && v7 && v11)
  {
    uint64_t v19 = objc_alloc_init(MFMessageReferenceContext);
    [(MFMessageReferenceContext *)v19 setMessageIDHash:v5];
    [(MFMessageReferenceContext *)v19 setConversationIDHash:v7];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F608E0]) initWithPrefix:v9 subjectWithoutPrefix:v11];
    [(MFMessageReferenceContext *)v19 setSubject:v20];
    uint64_t v21 = (void *)MEMORY[0x1E4F60800];
    id v22 = [v15 emailAddressValue];
    unsigned int v23 = [v21 componentsWithEmailAddress:v22];

    [v23 setDisplayName:v13];
    BOOL v24 = [v23 stringValue];
    [(MFMessageReferenceContext *)v19 setSender:v24];

    [(MFMessageReferenceContext *)v19 setDateSentInterval:(double)v18];
    [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:v25];
  }
}

void __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v6 = [v5 toRecipientStrings];
  uint64_t v7 = MFDatabaseEncodedStringForAddressList(v6);
  [v12 setTo:v7];

  uint64_t v8 = [v5 ccRecipientStrings];
  id v9 = MFDatabaseEncodedStringForAddressList(v8);
  [v12 setCc:v9];

  uint64_t v10 = [v5 bccRecipientStrings];
  __int16 v11 = MFDatabaseEncodedStringForAddressList(v10);
  [v12 setBcc:v11];
}

- (BOOL)_insertThreadReferences:(id)a3 toMessageWithLibraryID:(int64_t)a4 usingDatabaseConnection:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"message_references"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__MFMailMessageLibrary__insertThreadReferences_toMessageWithLibraryID_usingDatabaseConnection___block_invoke;
    v16[3] = &unk_1E5D3C638;
    id v10 = v9;
    id v17 = v10;
    int64_t v18 = a4;
    [v7 enumerateIndexesUsingBlock:v16];
    id v15 = 0;
    char v11 = [v8 executeInsertStatement:v10 error:&v15];
    id v12 = v15;
    if (v11)
    {
      id v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v20 = a4;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Threading: inserted message references for message with databaseID %lld: %@", buf, 0x16u);
      }
    }
    else
    {
      [v8 handleError:v12 message:@"inserting message_references"];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

void __95__MFMailMessageLibrary__insertThreadReferences_toMessageWithLibraryID_usingDatabaseConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) addValue];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 40)];
  [v6 setObject:v4 forKeyedSubscript:@"message"];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
  [v6 setObject:v5 forKeyedSubscript:@"reference"];

  [v6 setObject:&unk_1EFF50D18 forKeyedSubscript:@"is_originator"];
}

- (int64_t)addReferenceForContext:(id)a3 usingDatabaseConnection:(id)a4 generationWindow:(id)a5 mergeHandler:(id)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v111 = a4;
  id v96 = a5;
  v105 = (void (**)(id, sqlite3_int64, sqlite3_int64))a6;
  v102 = v10;
  uint64_t v99 = [v10 message];
  uint64_t v100 = [v10 libraryID];
  uint64_t v101 = [v10 messageIDHash];
  v103 = [v10 references];
  v97 = [v10 messageIDsBySubject];
  uint64_t v11 = [v10 conversationFlagsRef];
  BOOL v12 = [(MFMailMessageLibrary *)self isProtectedDataAvailable:v111];
  double Current = CFAbsoluteTimeGetCurrent();
  long long v14 = MFLogGeneral();
  v106 = (unint64_t *)v11;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v10 messageIDHash];
    uint64_t v16 = [v10 mailboxID];
    id v17 = [v10 subject];
    int64_t v18 = objc_msgSend(v17, "ef_publicDescription");
    *(_DWORD *)buf = 134219010;
    uint64_t v124 = v15;
    __int16 v125 = 2048;
    uint64_t v126 = v100;
    __int16 v127 = 2048;
    uint64_t v128 = v16;
    __int16 v129 = 2114;
    uint64_t v130 = v18;
    __int16 v131 = 2112;
    v132 = v103;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Threading %lld: resolving for message (database ID: %lld), mailbox: %lld, subject: %{public}@, explicitReferences: %@", buf, 0x34u);
  }
  [(MFMailMessageLibrary *)self _insertThreadReferences:v103 toMessageWithLibraryID:v100 usingDatabaseConnection:v111];
  uint64_t v19 = [v102 subject];
  uint64_t v20 = [v19 prefixLength];

  __int16 v21 = [v102 subject];
  v98 = [v21 subjectWithoutPrefix];

  id v108 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  if (![v103 count] && v20)
  {
    if (v12)
    {
      id v22 = [(MFMailMessageLibrary *)self _addThreadingInfoWithContext:v102 usingDatabaseConnection:v111];
      [v108 addIndexes:v22];
    }
    else
    {
      [(MFMailMessageLibrary *)self _addMessageToThreadAtUnlock:v100];
    }
  }
  if (v101 && [v98 length])
  {
    uint64_t v23 = [v97 objectForKeyedSubscript:v98];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F60DB8] indexSet];
      [v97 setObject:v25 forKeyedSubscript:v98];
    }
    id v26 = [v97 objectForKeyedSubscript:v98];
    [v26 addIndex:v101];
  }
  int v27 = [(MFMailMessageLibrary *)self conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:v100 messageIDHash:v101];
  [v108 addIndexes:v27];

  int v28 = [v99 externalConversationID];
  uint64_t v29 = MFStringHashForMessageID();

  if (v29)
  {
    uint64_t v30 = MFLogGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v124 = v101;
      __int16 v125 = 2048;
      uint64_t v126 = v29;
      _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "Threading %lld: adding external conversation ID to explicit references: %lld", buf, 0x16u);
    }

    [v103 addIndex:v29];
  }
  if (![v108 count])
  {
    if ([v103 count])
    {
      int64_t v37 = [(MFMailMessageLibrary *)self _conversationIdForMessageIds:v103];
      if (v37)
      {
        id v38 = MFLogGeneral();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v124 = v101;
          __int16 v125 = 2048;
          uint64_t v126 = v37;
          _os_log_impl(&dword_1A7EFF000, v38, OS_LOG_TYPE_DEFAULT, "Threading %lld: found conversation ID from explicit references: %lld", buf, 0x16u);
        }

        [v108 addIndex:v37];
      }
    }
  }
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sqlite3_int64 v31 = [v99 conversationID];
  [v108 removeIndex:v31];
  uint64_t v32 = [v108 count];
  if (v31)
  {
    if (!v32)
    {
      id v43 = MFLogGeneral();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v124 = v101;
        __int16 v125 = 2048;
        uint64_t v126 = v31;
        _os_log_impl(&dword_1A7EFF000, v43, OS_LOG_TYPE_DEFAULT, "Threading %lld: Using current conversation %lld", buf, 0x16u);
      }
      goto LABEL_44;
    }
    uint64_t v29 = [v108 firstIndex];
    [v108 addIndex:v31];
    dispatch_queue_t v33 = MFLogGeneral();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 134218496;
    uint64_t v124 = v101;
    __int16 v125 = 2048;
    uint64_t v126 = v31;
    __int16 v127 = 2048;
    uint64_t v128 = v29;
    uint64_t v34 = "Threading %lld: Merging current conversation %lld with another conversation %lld";
    int v35 = v33;
    uint32_t v36 = 32;
    goto LABEL_39;
  }
  if (v29 && !v32)
  {
    char v39 = MFLogGeneral();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
LABEL_32:

      goto LABEL_41;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v124 = v101;
    __int16 v125 = 2048;
    uint64_t v126 = v29;
    id v40 = "Threading %lld: Using external conversation ID %lld";
    id v41 = v39;
    uint32_t v42 = 22;
LABEL_31:
    _os_log_impl(&dword_1A7EFF000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
    goto LABEL_32;
  }
  if (v32)
  {
    uint64_t v29 = [v108 firstIndex];
    dispatch_queue_t v33 = MFLogGeneral();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v124 = v101;
    __int16 v125 = 2048;
    uint64_t v126 = v29;
    uint64_t v34 = "Threading %lld: Merging with existing conversation %lld";
    goto LABEL_38;
  }
  if (v101)
  {
    char v39 = MFLogGeneral();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v101;
      goto LABEL_32;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v101;
    uint64_t v124 = v101;
    id v40 = "Threading %lld: Setting conversation ID to message ID";
    id v41 = v39;
    uint32_t v42 = 12;
    goto LABEL_31;
  }
  uint64_t v29 = MFUniqueMessageIDHash();
  dispatch_queue_t v33 = MFLogGeneral();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v124 = 0;
    __int16 v125 = 2048;
    uint64_t v126 = v29;
    uint64_t v34 = "Threading %lld: Using newly created conversation ID %lld";
LABEL_38:
    int v35 = v33;
    uint32_t v36 = 22;
LABEL_39:
    _os_log_impl(&dword_1A7EFF000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
  }
LABEL_40:

  if (!v29)
  {
    sqlite3_int64 v31 = 0;
LABEL_62:
    char v61 = 0;
    __int16 v48 = v106;
    goto LABEL_64;
  }
LABEL_41:
  if (v29 == v31) {
    goto LABEL_47;
  }
  if ([v99 isLibraryMessage])
  {
    id v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v99, 0);
    v44 = [(MFMailMessageLibrary *)self hookRegistry];
    [v44 persistenceWillChangeConversationID:v31 messages:v43];

    uint64_t v45 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v31];
    [v107 setObject:v43 forKeyedSubscript:v45];

    sqlite3_int64 v31 = v29;
LABEL_44:

    goto LABEL_47;
  }
  sqlite3_int64 v31 = v29;
LABEL_47:
  [v111 preparedStatementForQueryString:@"UPDATE messages SET conversation_id = ?, content_index_transaction_id = NULL WHERE rowid = ?"];
  id v46 = objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (sqlite3_stmt *)[v46 compiled];

  __int16 v48 = v106;
  if (v47)
  {
    sqlite3_bind_int64(v47, 1, v31);
    sqlite3_bind_int64(v47, 2, v100);
    int v49 = sqlite3_step(v47);
    sqlite3_reset(v47);
    [v111 checkForConnectionErrorWithMessage:@"inserting conversation id into message row"];
    if (v49 != 101) {
      goto LABEL_63;
    }
  }
  id v50 = [v111 preparedStatementForQueryString:@"INSERT OR IGNORE INTO conversations (conversation_id) VALUES (?)"];
  uint64_t v51 = (sqlite3_stmt *)[v50 compiled];

  __int16 v48 = v106;
  if (v51)
  {
    sqlite3_bind_int64(v51, 1, v31);
    int v52 = sqlite3_step(v51);
    sqlite3_reset(v51);
    [v111 checkForConnectionErrorWithMessage:@"inserting row into conversations table"];
    if (v52 != 101) {
      goto LABEL_63;
    }
  }
  [v111 preparedStatementForQueryString:@"INSERT OR IGNORE INTO conversation_id_message_id (conversation_id, message_id) SELECT ?, reference FROM message_references WHERE message = ?"];
  id v53 = objc_claimAutoreleasedReturnValue();
  v54 = (sqlite3_stmt *)[v53 compiled];

  if (v54)
  {
    sqlite3_bind_int64(v54, 1, v31);
    __int16 v48 = v106;
    sqlite3_bind_int64(v54, 2, v100);
    int v55 = sqlite3_step(v54);
    sqlite3_reset(v54);
    [v111 checkForConnectionErrorWithMessage:@"inserting row into conversation_id_message_id table (1)"];
  }
  else
  {
    int v55 = 101;
    __int16 v48 = v106;
  }
  if (!v101 || v55 != 101)
  {
LABEL_58:
    if (v55 == 101) {
      goto LABEL_59;
    }
LABEL_63:
    char v61 = 1;
    goto LABEL_64;
  }
  [v99 dateSentAsTimeIntervalSince1970];
  double v57 = v56;
  id v58 = [v111 preparedStatementForQueryString:@"INSERT OR REPLACE INTO conversation_id_message_id (conversation_id, message_id, date_sent) VALUES (?, ?, ?)"];
  id v59 = (sqlite3_stmt *)[v58 compiled];

  __int16 v48 = v106;
  if (v59)
  {
    sqlite3_bind_int64(v59, 1, v31);
    sqlite3_bind_int64(v59, 2, v101);
    sqlite3_bind_int64(v59, 3, (uint64_t)v57);
    int v55 = sqlite3_step(v59);
    sqlite3_reset(v59);
    [v111 checkForConnectionErrorWithMessage:@"inserting row into conversation_id_message_id table (2)"];
    goto LABEL_58;
  }
LABEL_59:
  v60 = MFLogGeneral();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v124 = v101;
    __int16 v125 = 2048;
    uint64_t v126 = v31;
    _os_log_impl(&dword_1A7EFF000, v60, OS_LOG_TYPE_DEFAULT, "Threading %lld: Resolved message's conversation ID to %lld", buf, 0x16u);
  }

  if (v105) {
    goto LABEL_62;
  }
  [v99 setConversationID:v31];
  __int16 v48 = v106;
  char v61 = 0;
LABEL_64:
  id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v61)
  {
    unint64_t v62 = 0;
    int v63 = 1;
  }
  else
  {
    [v108 removeIndex:v31];
    unint64_t v62 = [(MFMailMessageLibrary *)self flagsForConversationId:v31];
    sqlite3_int64 v64 = [v108 firstIndex];
    if (v64 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v63 = 0;
    }
    else
    {
      do
      {
        v110 = +[MFMessageCriterion criterionForNotDeletedConversationID:v64];
        v65 = [(MFMailMessageLibrary *)self messagesMatchingCriterion:v110 options:0];
        int v66 = [(MFMailMessageLibrary *)self hookRegistry];
        unint64_t v109 = v62;
        [v66 persistenceWillChangeConversationID:v64 messages:v65];

        uint64_t v67 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v64];
        v68 = [v107 objectForKeyedSubscript:v67];

        if (v68)
        {
          [v68 addObjectsFromArray:v65];
        }
        else
        {
          v69 = (void *)[v65 mutableCopy];
          v70 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v64];
          [v107 setObject:v69 forKeyedSubscript:v70];
        }
        unint64_t v71 = [(MFMailMessageLibrary *)self flagsForConversationId:v64];
        [v111 preparedStatementForQueryString:@"UPDATE messages SET conversation_id = ?, content_index_transaction_id = NULL WHERE conversation_id = ?"];
        id v72 = objc_claimAutoreleasedReturnValue();
        id v73 = (sqlite3_stmt *)[v72 compiled];

        if (v73)
        {
          sqlite3_bind_int64(v73, 1, v31);
          sqlite3_bind_int64(v73, 2, v64);
          int v74 = sqlite3_step(v73);
          sqlite3_reset(v73);
          [v111 checkForConnectionErrorWithMessage:@"udpating other conversations to point to this one"];
          if (v74 != 101) {
            goto LABEL_85;
          }
        }
        [v111 preparedStatementForQueryString:@"UPDATE OR IGNORE conversation_id_message_id SET conversation_id = ? WHERE conversation_id = ?"];
        id v75 = objc_claimAutoreleasedReturnValue();
        id v76 = (sqlite3_stmt *)[v75 compiled];

        if (!v76) {
          goto LABEL_75;
        }
        sqlite3_bind_int64(v76, 1, v31);
        sqlite3_bind_int64(v76, 2, v64);
        int v77 = sqlite3_step(v76);
        sqlite3_reset(v76);
        [v111 checkForConnectionErrorWithMessage:@"udpating other conversations to point to this one"];
        if (v77 != 101)
        {
LABEL_85:
          int v63 = 1;
        }
        else
        {
LABEL_75:
          v78 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v64];
          [v104 addObject:v78];

          if (v105) {
            v105[2](v105, v64, v31);
          }
          uint64_t v79 = self;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          id v80 = v65;
          uint64_t v81 = [v80 countByEnumeratingWithState:&v118 objects:v122 count:16];
          if (v81)
          {
            uint64_t v82 = *(void *)v119;
            do
            {
              for (uint64_t i = 0; i != v81; ++i)
              {
                if (*(void *)v119 != v82) {
                  objc_enumerationMutation(v80);
                }
                [*(id *)(*((void *)&v118 + 1) + 8 * i) setConversationID:v31];
              }
              uint64_t v81 = [v80 countByEnumeratingWithState:&v118 objects:v122 count:16];
            }
            while (v81);
          }

          self = v79;
          int v63 = 0;
        }
        sqlite3_int64 v64 = [v108 indexGreaterThanIndex:v64];

        unint64_t v62 = v71 | v109;
        if (v64 == 0x7FFFFFFFFFFFFFFFLL) {
          char v84 = 1;
        }
        else {
          char v84 = v63;
        }
        __int16 v48 = v106;
      }
      while ((v84 & 1) == 0);
    }
    if ((v63 & 1) == 0 && v62) {
      [(MFMailMessageLibrary *)self setFlags:v62 forConversationId:v31];
    }
    if (v48) {
      unint64_t *v48 = v62;
    }
  }
  if (CFAbsoluteTimeGetCurrent() - Current > 0.05)
  {
    v85 = MFLogGeneral();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
      -[MFMailMessageLibrary addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:]();
    }
  }
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __101__MFMailMessageLibrary_addReferenceForContext_usingDatabaseConnection_generationWindow_mergeHandler___block_invoke;
  v113[3] = &unk_1E5D3C660;
  id v86 = v99;
  unint64_t v117 = v62;
  id v114 = v86;
  v115 = self;
  id v87 = v96;
  id v116 = v87;
  [v107 enumerateKeysAndObjectsUsingBlock:v113];
  if ([v104 count])
  {
    v88 = [MEMORY[0x1E4F60E78] column:@"conversation_id"];
    v89 = [v88 in:v104];

    v90 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"conversations" where:v89];
    id v112 = 0;
    int v91 = [v111 executeDeleteStatement:v90 error:&v112];
    id v92 = v112;
    if (v91)
    {
      v93 = MFLogGeneral();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v124 = v101;
        __int16 v125 = 2112;
        uint64_t v126 = (uint64_t)v104;
        _os_log_impl(&dword_1A7EFF000, v93, OS_LOG_TYPE_DEFAULT, "Threading %lld: deleting merged conversations from table: %@", buf, 0x16u);
      }
    }
    else
    {
      [v111 handleError:v92 message:@"deleting row from conversations table"];
    }

    int v63 = v91 ^ 1;
  }
  if (v63) {
    int64_t v94 = 0;
  }
  else {
    int64_t v94 = v31;
  }

  return v94;
}

void __101__MFMailMessageLibrary_addReferenceForContext_usingDatabaseConnection_generationWindow_mergeHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setConversationFlags:*(void *)(a1 + 56)];
  id v6 = [*(id *)(a1 + 40) hookRegistry];
  objc_msgSend(v6, "persistenceIsChangingConversationID:messages:generationWindow:", objc_msgSend(v7, "longLongValue"), v5, *(void *)(a1 + 48));
}

- (MFMailboxFrecencyController)mailboxFrecencyController
{
  v2 = EFAtomicSetOnceObjectLoad();
  return (MFMailboxFrecencyController *)v2;
}

MFMailboxFrecencyController *__49__MFMailMessageLibrary_mailboxFrecencyController__block_invoke(uint64_t a1)
{
  v2 = [MFMailboxFrecencyController alloc];
  id v3 = [*(id *)(a1 + 32) database];
  id v4 = [(MFMailboxFrecencyController *)v2 initWithDatabase:v3];

  return v4;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  v2 = [(MFMailMessageLibrary *)self persistence];
  id v3 = [v2 hookRegistry];

  return (EDPersistenceHookRegistry *)v3;
}

- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 createNewCacheFiles:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v14 = [MEMORY[0x1E4F1CA60] dictionary];
  id v15 = [(MFMailMessageLibrary *)self addMessages:v11 withMailbox:v13 newMessagesByOldMessage:v14 remoteIDs:v12 setFlags:a6 addPOPUIDs:0 dataSectionsByMessage:0 generationWindow:0];

  return v14;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 newMessagesByOldMessage:(id)a5 remoteIDs:(id)a6 setFlags:(unint64_t)a7 addPOPUIDs:(BOOL)a8 dataSectionsByMessage:(id)a9 generationWindow:(id)a10
{
  id v38 = a3;
  id v14 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a9;
  id v34 = a10;
  id v40 = +[MFActivityMonitor currentMonitor];
  id v15 = v14;
  if (v14)
  {
    uint64_t v71 = 0;
    id v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 0;
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    char v39 = v16;
    dispatch_queue_t v33 = [v14 account];
    char v27 = [v33 supportsRemoteAppend];
    uint64_t v32 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v33];
    char v26 = [v33 supportsPurge];
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    int v69 = 0;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0;
    for (i = [v38 count]; v65[3] < i; uint64_t v16 = v39)
    {
      if (*((unsigned char *)v72 + 24) || ([v40 shouldCancel] & 1) != 0) {
        break;
      }
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = [(MFMailMessageLibrary *)self database];
      uint64_t v20 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary addMessages:withMailbox:newMessagesByOldMessage:remoteIDs:setFlags:addPOPUIDs:dataSectionsByMessage:generationWindow:]"];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke;
      v41[3] = &unk_1E5D3C728;
      void v41[4] = self;
      id v42 = v34;
      int v55 = &v64;
      unint64_t v59 = i;
      double v56 = &v71;
      id v21 = v40;
      id v43 = v21;
      id v44 = v38;
      id v22 = v15;
      id v45 = v15;
      id v46 = v31;
      char v61 = v27;
      id v47 = v36;
      unint64_t v60 = a7;
      id v48 = v33;
      double v57 = v70;
      BOOL v62 = a8;
      id v58 = v68;
      id v49 = v30;
      id v23 = v18;
      id v50 = v23;
      id v24 = v39;
      id v51 = v24;
      id v52 = v32;
      char v63 = v26;
      id v53 = v35;
      id v54 = v37;
      objc_msgSend(v19, "__performWriteWithCaller:usingBlock:", v20, v41);

      if (!*((unsigned char *)v72 + 24)) {
        [v24 addObjectsFromArray:v23];
      }
      if (v65[3] < i && !*((unsigned char *)v72 + 24) && ([v21 shouldCancel] & 1) == 0) {
        usleep(0x1388u);
      }

      id v15 = v22;
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);

    _Block_object_dispose(&v71, 8);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

BOOL __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v486 = *MEMORY[0x1E4F143B8];
  id v350 = a2;
  id v295 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v316 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v315 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v333 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v296 = [*(id *)(a1 + 32) isProtectedDataAvailable:v350];
  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v350, "transactionGeneration"));
  uint64_t v3 = mach_absolute_time();
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
  unint64_t v314 = *MEMORY[0x1E4F60958] + v4;
  if (v4 < *(void *)(a1 + 176) && v4 < *MEMORY[0x1E4F60958] + v4)
  {
    uint64_t v260 = v3;
    v317 = 0;
    uint64_t v262 = *MEMORY[0x1E4F60738];
    uint64_t v261 = *MEMORY[0x1E4F60698];
    id v7 = @"1";
    if (v296) {
      id v7 = @"0";
    }
    v274 = v7;
    uint64_t v276 = *MEMORY[0x1E4F606D0];
    uint64_t v275 = *MEMORY[0x1E4F60780];
    uint64_t v300 = *MEMORY[0x1E4F5FD10];
    uint64_t v301 = *MEMORY[0x1E4F606B0];
    uint64_t v302 = *MEMORY[0x1E4F606F0];
    uint64_t v299 = *MEMORY[0x1E4F60750];
    uint64_t v259 = *MEMORY[0x1E4F5FC38];
    sqlite3_int64 v344 = *MEMORY[0x1E4F5FCC8];
    while (1)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)
        || ([*(id *)(a1 + 48) shouldCancel] & 1) != 0)
      {
        goto LABEL_7;
      }
      context = (void *)MEMORY[0x1AD0E3E00]();
      v352 = [*(id *)(a1 + 56) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)];
      id v8 = unlockedMailboxUidForMessage(*(void **)(a1 + 32), v352);
      v341 = v8;
      if (!v8)
      {
        id v9 = EDLibraryLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_4(&v443, v444);
        }

        id v8 = 0;
      }
      id v10 = [v8 account];
      int v11 = [v10 supportsRemoteAppend];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      unint64_t v12 = 0x1E4F28000uLL;
      if ([v352 conformsToProtocol:&unk_1EFF705B8]) {
        id v342 = v352;
      }
      else {
        id v342 = 0;
      }
      unsigned __int8 v442 = 0;
      if (isKindOfClass)
      {
        v331 = 0;
        if (v296)
        {
          char v13 = 0;
          unsigned int v304 = 0;
          log = 0;
          goto LABEL_29;
        }
        int v14 = 1;
      }
      else
      {
        v331 = [v352 messageDataHolderIsComplete:&v442 downloadIfNecessary:0];
        int v14 = v296 ^ 1;
      }
      [v352 headersIfAvailable];
      log = unsigned int v304 = v14;
      if (!log)
      {
        uint64_t v25 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 208);
        os_unfair_lock_lock(v25);
        char v26 = [*(id *)(*(void *)(a1 + 32) + 280) objectForKeyedSubscript:v352];
        os_unfair_lock_unlock(v25);
        if (!v26
          || ([v26 headersIfAvailable],
              log = objc_claimAutoreleasedReturnValue(),
              v26,
              unint64_t v12 = 0x1E4F28000,
              !log))
        {
          log = EDLibraryLog();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            char v27 = objc_msgSend(v352, "ef_publicDescription");
            int v28 = [v352 messageStore];
            uint64_t v29 = [v352 messageStore];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v29;
            _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Not copying message (couldn't get headers from source message) %{public}@ with store %@ (%p)", buf, 0x20u);
          }
          goto LABEL_231;
        }
      }
      char v13 = 1;
LABEL_29:
      uint64_t v436 = 0;
      v437 = &v436;
      uint64_t v438 = 0x3032000000;
      v439 = __Block_byref_object_copy__6;
      v440 = __Block_byref_object_dispose__6;
      id v441 = 0;
      uint64_t v430 = 0;
      v431 = &v430;
      uint64_t v432 = 0x3032000000;
      v433 = __Block_byref_object_copy__6;
      v434 = __Block_byref_object_dispose__6;
      id v435 = 0;
      uint64_t v346 = [*(id *)(a1 + 64) URLString];
      uint64_t v424 = 0;
      v425 = (id *)&v424;
      uint64_t v426 = 0x3032000000;
      v427 = __Block_byref_object_copy__6;
      v428 = __Block_byref_object_dispose__6;
      id v429 = 0;
      uint64_t v418 = 0;
      v419 = &v418;
      uint64_t v420 = 0x3032000000;
      v421 = __Block_byref_object_copy__6;
      v422 = __Block_byref_object_dispose__6;
      id v423 = 0;
      uint64_t v412 = 0;
      v413 = &v412;
      uint64_t v414 = 0x3032000000;
      v415 = __Block_byref_object_copy__6;
      v416 = __Block_byref_object_dispose__6;
      id v417 = 0;
      uint64_t v406 = 0;
      v407 = &v406;
      uint64_t v408 = 0x3032000000;
      v409 = __Block_byref_object_copy__6;
      v410 = __Block_byref_object_dispose__6;
      id v411 = 0;
      uint64_t v400 = 0;
      v401 = &v400;
      uint64_t v402 = 0x3032000000;
      v403 = __Block_byref_object_copy__6;
      v404 = __Block_byref_object_dispose__6;
      id v405 = 0;
      uint64_t v396 = 0;
      v397 = &v396;
      uint64_t v398 = 0x2020000000;
      uint64_t v399 = 0;
      uint64_t v392 = 0;
      v393 = &v392;
      uint64_t v394 = 0x2020000000;
      uint64_t v395 = 0;
      uint64_t v388 = 0;
      v389 = &v388;
      uint64_t v390 = 0x2020000000;
      uint64_t v391 = 0;
      uint64_t v384 = 0;
      v385 = &v384;
      uint64_t v386 = 0x2020000000;
      uint64_t v387 = 0;
      uint64_t v378 = 0;
      v379 = &v378;
      uint64_t v380 = 0x3032000000;
      v381 = __Block_byref_object_copy__6;
      v382 = __Block_byref_object_dispose__6;
      id v383 = 0;
      uint64_t v372 = 0;
      v373 = &v372;
      uint64_t v374 = 0x3032000000;
      v375 = __Block_byref_object_copy__6;
      v376 = __Block_byref_object_dispose__6;
      id v377 = 0;
      if (v13) {
        goto LABEL_35;
      }
      if (!v317)
      {
        v317 = [v350 preparedStatementForQueryString:@"SELECT addresses.comment AS sender_comment, addresses.address AS sender_address, subjects.subject, messages.remote_mailbox, messages.original_mailbox, content_type, messages.message_id, messages.external_id, messages.unique_id, messages.list_id_hash, messages.document_id, messages.unsubscribe_type FROM messages LEFT OUTER JOIN addresses ON messages.sender = addresses.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID WHERE messages.ROWID = ?"];
      }
      uint64_t v15 = [v352 libraryID];
      uint64_t v16 = [*(id *)(v12 + 3792) numberWithLongLong:v15];
      v481 = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v481 count:1];
      v371[0] = MEMORY[0x1E4F143A8];
      v371[1] = 3221225472;
      v371[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_709;
      v371[3] = &unk_1E5D3C6B0;
      v371[4] = &v418;
      v371[5] = &v424;
      v371[6] = &v436;
      v371[7] = &v430;
      v371[8] = &v384;
      v371[9] = &v378;
      v371[10] = &v396;
      v371[11] = &v406;
      v371[12] = &v388;
      v371[13] = &v392;
      v371[14] = &v400;
      v371[15] = &v372;
      id v370 = 0;
      char v18 = [v317 executeWithIndexedBindings:v17 usingBlock:v371 error:&v370];
      id v19 = v370;

      if ((v18 & 1) == 0) {
        [v350 handleError:v19 message:@"Fetching fields for message"];
      }
      uint64_t v20 = [*(id *)(a1 + 32) _recipientsForMessageWithDatabaseID:v15 connection:v350 recipientsCache:0];
      id v21 = (void *)v413[5];
      v413[5] = v20;

      if (!v397[3]) {
LABEL_35:
      }
        v397[3] = MFMessageIDHashFromHeaders();
      if (isKindOfClass)
      {
        id v22 = [_MFAddableMessage alloc];
        id v23 = [(_MFAddableMessage *)v22 initWithLibraryMessage:v352 messageIDHash:v397[3] mailboxURL:v346];
        id v24 = [*(id *)(a1 + 32) hookRegistry];
        [v24 persistenceWillAddMessage:v23 fromExistingMessage:1];
      }
      else
      {
        if ([v352 messageIDHash])
        {
          id v23 = [*(id *)(a1 + 32) hookRegistry];
          [(_MFAddableMessage *)v23 persistenceWillAddMessage:v352 fromExistingMessage:0];
          goto LABEL_46;
        }
        id v30 = [_MFAddableMessage alloc];
        id v23 = [(_MFAddableMessage *)v30 initWithLibraryMessage:v352 messageIDHash:v397[3] mailboxURL:0];
        id v24 = [*(id *)(a1 + 32) hookRegistry];
        [v24 persistenceWillAddMessage:v23 fromExistingMessage:0];
      }

LABEL_46:
      if (!v425[5])
      {
        id v31 = [v352 subjectIfAvailable];
        uint64_t v32 = [v31 subjectString];
        dispatch_queue_t v33 = v32;
        if (!v32)
        {
          v273 = [log firstHeaderForKey:v262];
          v272 = objc_msgSend(v273, "ef_UTF8ConvertibleString");
          dispatch_queue_t v33 = v272;
        }
        objc_storeStrong(v425 + 5, v33);
        if (!v32)
        {
        }
      }
      unint64_t v34 = 0x1E4F28000;
      if (!v419[5])
      {
        id v35 = (void *)[log copyAddressListForSender];
        id v36 = [_MFEmailAddress alloc];
        id v37 = [v35 firstObject];
        uint64_t v38 = [(_MFEmailAddress *)v36 initWithAddress:v37];
        char v39 = (void *)v419[5];
        v419[5] = v38;

        unint64_t v34 = 0x1E4F28000;
      }
      if (!v413[5])
      {
        id v40 = objc_alloc_init(_MFRecipientCollection);
        id v41 = (void *)v413[5];
        v413[5] = (uint64_t)v40;

        id v42 = (void *)[log copyAddressListForTo];
        v369[0] = MEMORY[0x1E4F143A8];
        v369[1] = 3221225472;
        v369[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_2;
        v369[3] = &unk_1E5D3C6D8;
        v369[4] = &v412;
        [v42 enumerateObjectsUsingBlock:v369];

        id v43 = (void *)[log copyAddressListForCc];
        v368[0] = MEMORY[0x1E4F143A8];
        v368[1] = 3221225472;
        v368[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_3;
        v368[3] = &unk_1E5D3C6D8;
        v368[4] = &v412;
        [v43 enumerateObjectsUsingBlock:v368];

        id v44 = (void *)[log copyAddressListForBcc];
        v367[0] = MEMORY[0x1E4F143A8];
        v367[1] = 3221225472;
        v367[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_4;
        v367[3] = &unk_1E5D3C6D8;
        v367[4] = &v412;
        [v44 enumerateObjectsUsingBlock:v367];

        unint64_t v34 = 0x1E4F28000;
      }
      if (!v379[5] && !v385[3])
      {
        id v45 = (void *)[log copyFirstStringValueForKey:v261];
        if (v45)
        {
          id v46 = (id *)(v379 + 5);
          obuint64_t j = (id)v379[5];
          +[MFMimePart parseContentTypeHeader:v45 type:&obj subtype:0];
          objc_storeStrong(v46, obj);
        }
        id v47 = (void *)v379[5];
        if (v47)
        {
          id v48 = v47;
          if ([v48 isEqualToString:@"text"])
          {
            uint64_t v49 = 1;
          }
          else if ([v48 isEqualToString:@"audio"])
          {
            uint64_t v49 = 2;
          }
          else if ([v48 isEqualToString:@"video"])
          {
            uint64_t v49 = 3;
          }
          else if ([v48 isEqualToString:@"application"])
          {
            uint64_t v49 = 4;
          }
          else if ([v48 isEqualToString:@"message"])
          {
            uint64_t v49 = 5;
          }
          else if ([v48 isEqualToString:@"multipart"])
          {
            uint64_t v49 = 6;
          }
          else
          {
            uint64_t v49 = 7;
          }

          v385[3] = v49;
        }

        unint64_t v34 = 0x1E4F28000;
      }
      id v50 = (void *)v346;
      if (v346 || ([v341 URLString], (id v50 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v347 = v50;
        sqlite3_int64 RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 32), v350, v50, *(void **)(a1 + 72), *(void **)(a1 + 40));
        if (RowidForMailbox != v344) {
          goto LABEL_84;
        }
      }
      else
      {
        v347 = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;
      id v51 = EDLibraryLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v173 = objc_msgSend(v352, "ef_publicDescription");
        v174 = objc_msgSend(v341, "ef_publicDescription");
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v173;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v347;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v174;
        _os_log_error_impl(&dword_1A7EFF000, v51, OS_LOG_TYPE_ERROR, "failed to find mailbox row for message %{public}@: mailboxURL = %@ for %{public}@", buf, 0x20u);
      }
      sqlite3_int64 RowidForMailbox = v344;
      unint64_t v34 = 0x1E4F28000;
LABEL_84:
      if (!v437[5])
      {
        id v52 = [v352 remoteMailboxURL];
        if (v52)
        {
          uint64_t v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", createRowidForMailbox(*(void **)(a1 + 32), v350, v52, *(void **)(a1 + 72), *(void **)(a1 + 40)));
          id v54 = (void *)v437[5];
          v437[5] = v53;
        }
        unint64_t v34 = 0x1E4F28000uLL;
      }
      if (*(unsigned char *)(a1 + 192))
      {
        uint64_t v55 = [*(id *)(v34 + 3792) numberWithLongLong:RowidForMailbox];
        double v56 = (void *)v437[5];
        v437[5] = v55;
      }
      double v57 = *(void **)(a1 + 80);
      if (v57) {
        [v57 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)];
      }
      else {
      id v348 = [v352 remoteID];
      }

      id v58 = [MEMORY[0x1E4F1CA98] null];
      BOOL v59 = v348 == v58;

      if (v59)
      {

        id v348 = 0;
      }
      unint64_t v60 = 0x1E4F28000;
      if (v11 && !*(unsigned char *)(a1 + 192))
      {

        char v61 = (void *)v437[5];
        v437[5] = 0;

        id v348 = 0;
      }
      if (!v431[5])
      {
        BOOL v62 = [v352 originalMailboxURL];
        if (v62)
        {
          uint64_t v63 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", createRowidForMailbox(*(void **)(a1 + 32), v350, v62, *(void **)(a1 + 72), *(void **)(a1 + 40)));
          uint64_t v64 = (void *)v431[5];
          v431[5] = v63;
        }
        unint64_t v60 = 0x1E4F28000uLL;
      }
      [v352 dateReceivedAsTimeIntervalSince1970];
      double v66 = v65;
      [v352 dateSentAsTimeIntervalSince1970];
      double v68 = v67;
      unint64_t v312 = [v352 messageSize];
      if (!v407[5])
      {
        uint64_t v69 = objc_msgSend(NSString, "ef_UUID");
        v70 = (void *)v407[5];
        v407[5] = v69;
      }
      if (!v389[3] && ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
      {
        uint64_t v71 = [v352 uniqueRemoteId];
        v389[3] = v71;
      }
      if (!v393[3])
      {
        id v72 = [log firstHeaderForKey:v276];
        v393[3] = MFStringHashForMessageIDHeader();
      }
      if (!v401[5])
      {
        uint64_t v73 = [log firstHeaderForKey:v275];
        char v74 = (void *)v401[5];
        v401[5] = v73;
      }
      uint64_t v75 = [v352 messageFlags];
      uint64_t v76 = [*(id *)(a1 + 64) mailboxType];
      unint64_t v77 = 0xFFFFFFFAFFFFFFFFLL;
      if (v76 == 3) {
        unint64_t v77 = 0xFFFFFFFAFFFFFFFDLL;
      }
      unint64_t v78 = *(void *)(a1 + 184) | v77 & v75;
      if (v78) {
        uint64_t v79 = "1";
      }
      else {
        uint64_t v79 = "0";
      }
      if ((v78 & 0x10) != 0) {
        id v80 = "1";
      }
      else {
        id v80 = "0";
      }
      v305 = v80;
      v309 = v79;
      if ((v78 & 0x10) != 0) {
        [*(id *)(v60 + 3792) numberWithUnsignedInteger:(v78 >> 41) & 7];
      }
      else {
      v329 = [MEMORY[0x1E4F1CA98] null];
      }
      if ((v78 & 0x1000000) != 0) {
        uint64_t v81 = "1";
      }
      else {
        uint64_t v81 = "0";
      }
      if ((v78 & 2) != 0) {
        uint64_t v82 = "1";
      }
      else {
        uint64_t v82 = "0";
      }
      unint64_t v313 = v78;
      if ((v78 & 0x82) != 0) {
        v83 = "0";
      }
      else {
        v83 = "1";
      }
      v323 = [*(id *)(a1 + 32) referencesFromHeaders:log];
      id v349 = v348;
      char v84 = (const char *)[v349 UTF8String];
      v298 = v84;
      if (v84) {
        int v297 = strlen(v84);
      }
      else {
        int v297 = 0;
      }
      char v365 = 0;
      sqlite3_int64 v364 = v344;
      v85 = (void *)MEMORY[0x1E4F608F8];
      id v86 = [log firstHeaderForKey:v301];
      v340 = [v85 tagValueListFromString:v86 error:0];

      v334 = [v340 objectForKeyedSubscript:v300];
      if (v334)
      {
        id v87 = [(id)v419[5] displayName];
        id v88 = v334;
        id v89 = v87;
        v90 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v88];
        [v90 setDisplayName:v89];
        int v91 = [v90 emailAddressValue];
        id v92 = v91;
        if (v91)
        {
          id v93 = v91;
        }
        else
        {
          uint64_t v94 = [v90 stringValue];
          v95 = (void *)v94;
          if (v94) {
            id v96 = (void *)v94;
          }
          else {
            id v96 = v88;
          }
          id v93 = v96;
        }
      }
      else
      {
        id v93 = 0;
      }
      v321 = v93;
      uint64_t v97 = [*(id *)(a1 + 32) _findOrCreateDatabaseIDForAddress:v419[5] hmeSenderAddress:v93 cache:v333 outBusinessID:&v364 connection:v350 isNewAddress:&v365];
      id v322 = objc_alloc_init(MEMORY[0x1E4F609A0]);
      v339 = [v322 transformAccount:*(void *)(a1 + 88)];
      v479[0] = v302;
      uint64_t v98 = -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:");
      uint64_t v99 = (void *)v98;
      if (v98) {
        uint64_t v100 = (__CFString *)v98;
      }
      else {
        uint64_t v100 = &stru_1EFF11268;
      }
      v480[0] = v100;
      v479[1] = v299;
      uint64_t v101 = -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:");
      v102 = (void *)v101;
      uint64_t v336 = v97;
      if (v101) {
        v103 = (__CFString *)v101;
      }
      else {
        v103 = &stru_1EFF11268;
      }
      v480[1] = v103;
      v338 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v480 forKeys:v479 count:2];

      id v104 = [*(id *)(a1 + 32) persistence];
      v105 = [v104 businessCloudStorage];
      v106 = [(id)v419[5] fullAddress];
      uint64_t v107 = [*(id *)(a1 + 88) primaryiCloudAccount];
      id v108 = [*(id *)(a1 + 64) URLString];
      LOBYTE(v258) = v365;
      [v105 updateIcloudOverridesForAddress:v106 cache:v333 connection:v350 account:v339 isIcloudAccount:v107 messageHeaders:v338 mailboxURL:v108 isNewAddress:v258];

      id v109 = objc_alloc(MEMORY[0x1E4F608E0]);
      v325 = (void *)[v109 initWithString:v425[5]];
      v335 = [v325 prefix];
      v337 = [v325 subjectWithoutPrefix];
      if (isKindOfClass)
      {
        uint64_t v324 = [v352 globalMessageID];
      }
      else
      {
        uint64_t v324 = [*(id *)(a1 + 32) _findOrCreateDatabaseIDForGlobalData:v397[3] cache:v295 connection:v350];
        v110 = [v342 categorizationResult];

        if (v110)
        {
          id v111 = [*(id *)(a1 + 32) persistence];
          id v112 = [v111 categoryPersistence];
          uint64_t v113 = [v112 currentCategorizationVersion];

          id v114 = [*(id *)(a1 + 32) persistence];
          v115 = [v114 categoryPersistence];
          id v116 = [v342 categorizationResult];
          [v115 persistCategorizationResult:v116 forGlobalID:v324 categorizationVersion:v113 connection:v350];
        }
        int v117 = [v352 conformsToProtocol:&unk_1EFF60D58];
        long long v118 = *(void **)(a1 + 32);
        if (v117)
        {
          long long v119 = [v118 persistence];
          long long v120 = [v119 messagePersistence];
          objc_msgSend(v120, "persistMessageAuthenticationState:forMessage:", objc_msgSend(v342, "authenticationState"), v352);
        }
        else
        {
          long long v119 = [v118 persistence];
          long long v120 = [v119 messagePersistence];
          objc_msgSend(v120, "persistMessageAuthenticationState:forMessageWithGlobalMessageID:", objc_msgSend(v342, "authenticationState"), v324);
        }
      }
      uint64_t v326 = [*(id *)(a1 + 32) _findOrCreateDatabaseIDForSubject:v337 cache:v316 connection:v350];
      long long v121 = [v352 summary];
      v343 = objc_msgSend(v121, "ef_UTF8ConvertibleString");

      uint64_t v122 = [*(id *)(a1 + 32) _findOrCreateDatabaseIDForSummary:v343 cache:v315 connection:v350];
      uint64_t v123 = [(id)v419[5] address];
      BOOL v124 = v336 != v344 || v123 == 0;
      char v125 = 1;
      if (v124 && v326 != v344)
      {
        if (v343) {
          BOOL v126 = v122 == v344;
        }
        else {
          BOOL v126 = 0;
        }
        char v125 = v126;
      }
      uint64_t v318 = v122;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = v125;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24))
      {
LABEL_227:
        unint64_t v362 = 0xAAAAAAAAAAAAAAAALL;
        goto LABEL_228;
      }
      v303 = [v350 preparedStatementForQueryString:@"INSERT INTO messages (remote_id, sender, subject_prefix, global_message_id, subject, summary, date_sent, date_received, display_date, mailbox, remote_mailbox, original_mailbox, flags, read, flagged, flag_color, deleted, sender_vip, visible, size, encoding, content_type, message_id, sequence_identifier, external_id, unique_id, list_id_hash, journaled, document_id, unsubscribe_type) values (:remote_id, :sender, :subject_prefix, :global_message_id, :subject, :summary, :date_sent, :date_received, :display_date, :mailbox, :remote_mailbox, :original_mailbox, :flags, :read, :flagged, :flag_color, :deleted, :sender_vip, :visible, :size, :encoding, :content_type, :message_id, :sequence_identifier, :external_id, :unique_id, :list_id_hash, :journaled, :document_id, :unsubscribe_type)"];
      if (v385[3] != 7)
      {
        objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
        id v128 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_175;
      }
      __int16 v127 = (void *)v379[5];
      if (v127)
      {
        id v128 = v127;
LABEL_175:
        id v129 = v128;
        goto LABEL_176;
      }
      id v129 = 0;
LABEL_176:
      v450[0] = @":remote_id";
      id v130 = v349;
      v294 = v129;
      if (!v349)
      {
        v269 = [MEMORY[0x1E4F1CA98] null];
        id v130 = v269;
      }
      v451[0] = v130;
      v450[1] = @":sender";
      if (v336 == v344)
      {
        uint64_t v131 = [MEMORY[0x1E4F1CA98] null];
        v278 = (void *)v131;
      }
      else
      {
        uint64_t v131 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
        v277 = (void *)v131;
      }
      v451[1] = v131;
      v450[2] = @":subject_prefix";
      v132 = v335;
      if (!v335)
      {
        v271 = [MEMORY[0x1E4F1CA98] null];
        v132 = v271;
      }
      v451[2] = v132;
      v450[3] = @":global_message_id";
      uint64_t v452 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v324];
      v450[4] = @":subject";
      v289 = (void *)v452;
      v284 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v326];
      v453 = v284;
      v450[5] = @":summary";
      if (v122 == v344)
      {
        uint64_t v133 = [MEMORY[0x1E4F1CA98] null];
        v280 = (void *)v133;
      }
      else
      {
        uint64_t v133 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
        v279 = (void *)v133;
      }
      uint64_t v454 = v133;
      v450[6] = @":date_sent";
      uint64_t v455 = [MEMORY[0x1E4F28ED0] numberWithDouble:v68];
      v450[7] = @":date_received";
      v288 = (void *)v455;
      v283 = [MEMORY[0x1E4F28ED0] numberWithDouble:v66];
      v456 = v283;
      v450[8] = @":display_date";
      v282 = [MEMORY[0x1E4F28ED0] numberWithDouble:v66];
      v457 = v282;
      v450[9] = @":mailbox";
      v281 = [MEMORY[0x1E4F28ED0] numberWithLongLong:RowidForMailbox];
      v458 = v281;
      v450[10] = @":remote_mailbox";
      v134 = (void *)v437[5];
      v291 = v134;
      if (!v134)
      {
        v268 = [MEMORY[0x1E4F1CA98] null];
        v134 = v268;
      }
      v459 = v134;
      v450[11] = @":original_mailbox";
      v135 = (void *)v431[5];
      v292 = v135;
      if (!v135)
      {
        v270 = [MEMORY[0x1E4F1CA98] null];
        v135 = v270;
      }
      v460 = v135;
      v450[12] = @":flags";
      v287 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v313];
      v461 = v287;
      v450[13] = @":read";
      v286 = [NSString stringWithUTF8String:v309];
      v462 = v286;
      v450[14] = @":flagged";
      v285 = [NSString stringWithUTF8String:v305];
      v463 = v285;
      v464 = v329;
      v450[15] = @":flag_color";
      v450[16] = @":deleted";
      v290 = [NSString stringWithUTF8String:v82];
      v465 = v290;
      v450[17] = @":sender_vip";
      id v306 = [NSString stringWithUTF8String:v81];
      id v466 = v306;
      v450[18] = @":visible";
      v136 = [NSString stringWithUTF8String:v83];
      v467 = v136;
      v450[19] = @":size";
      v137 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v312];
      v468 = v137;
      v450[20] = @":encoding";
      v138 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v352, "preferredEncoding"));
      v469 = v138;
      v450[21] = @":content_type";
      v139 = v129;
      if (!v129)
      {
        v267 = [MEMORY[0x1E4F1CA98] null];
        v139 = v267;
      }
      v470 = v139;
      v450[22] = @":message_id";
      id v140 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v397[3]];
      v471 = v140;
      v450[23] = @":sequence_identifier";
      v141 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v352, "modSequenceNumber"));
      v472 = v141;
      v450[24] = @":external_id";
      uint64_t v473 = v407[5];
      v450[25] = @":unique_id";
      v142 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v389[3]];
      v474 = v142;
      v450[26] = @":list_id_hash";
      v143 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v393[3]];
      v475 = v143;
      v476 = v274;
      v450[27] = @":journaled";
      v450[28] = @":document_id";
      id v144 = (void *)v401[5];
      uint64_t v145 = v144;
      if (!v144)
      {
        v266 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v145 = v266;
      }
      v477 = v145;
      v450[29] = @":unsubscribe_type";
      v146 = (void *)v373[5];
      v147 = v146;
      if (!v146)
      {
        v265 = [MEMORY[0x1E4F1CA98] null];
        v147 = v265;
      }
      v478 = v147;
      v310 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v451 forKeys:v450 count:30];
      if (!v146) {

      }
      v148 = v294;
      if (!v144) {

      }
      if (!v294) {
      if (!v292)
      }

      if (!v291) {
      v149 = v280;
      }
      if (v318 != v344) {
        v149 = v279;
      }

      if (!v335) {
      BOOL v150 = v278;
      }
      if (v336 != v344) {
        BOOL v150 = v277;
      }

      if (!v349) {
      id v363 = 0;
      }
      int v151 = [v303 executeWithNamedBindings:v310 usingBlock:0 error:&v363];
      id v152 = v363;
      if (v151)
      {
        *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = [v350 lastInsertedDatabaseID];
      }
      else
      {
        [v350 handleError:v152 message:@"Inserting message"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;
      }
      v153 = EDLibraryLog();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v154 = v397[3];
        objc_msgSend(v325, "ef_publicDescription");
        id v307 = (id)objc_claimAutoreleasedReturnValue();
        v293 = [(id)v419[5] address];
        v155 = [v293 emailAddressValue];
        v156 = [v352 dateReceived];
        v157 = [MEMORY[0x1E4F60D58] currentDevice];
        int v158 = [v157 isInternal];
        if (v158)
        {
          uint64_t v159 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v343);
          v160 = (void *)v159;
          v161 = v263;
        }
        else
        {
          uint64_t v159 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v343];
          v161 = (void *)v159;
          v160 = v264;
        }
        uint64_t v162 = v373[5];
        *(_DWORD *)buf = 134220546;
        *(void *)&uint8_t buf[4] = v154;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v324;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v349;
        *(_WORD *)&uint8_t buf[32] = 2114;
        *(void *)&buf[34] = v307;
        *(_WORD *)&buf[42] = 2048;
        *(void *)&buf[44] = v326;
        *(_WORD *)&buf[52] = 2114;
        *(void *)&buf[54] = v155;
        *(_WORD *)&buf[62] = 2048;
        *(void *)&buf[64] = v336;
        *(_WORD *)&buf[72] = 2114;
        *(void *)&buf[74] = v156;
        *(_WORD *)&buf[82] = 2114;
        *(void *)&buf[84] = v159;
        *(_WORD *)&buf[92] = 2048;
        *(void *)&buf[94] = v318;
        *(_WORD *)&buf[102] = 2114;
        *(void *)&buf[104] = v162;
        _os_log_impl(&dword_1A7EFF000, v153, OS_LOG_TYPE_DEFAULT, "Adding message with message_id: %lld, globalMessageID: %lld, remote_id: %{public}@, subject: %{public}@ (subjectID = %lld), sender: %{public}@ (%lld), date: %{public}@, summary: %{public}@ (%lld), unsubscribeType: %{public}@", buf, 0x70u);
        v263 = v161;
        v264 = v160;
        if (v158) {
          v163 = v160;
        }
        else {
          v163 = v161;
        }

        v148 = v294;
      }

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)) {
        goto LABEL_227;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = [*(id *)(a1 + 32) _addRecipients:v413[5] toMessageWithDatabaseID:*(void *)(*(void *)(*(void *)(a1 + 160) + 8)+ 24) cache:v333 connection:v350] ^ 1;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)) {
        goto LABEL_227;
      }
      if (*(unsigned char *)(a1 + 193) && v431[5])
      {
        id v167 = [v350 preparedStatementForQueryString:@"INSERT OR REPLACE INTO pop_uids (mailbox, uid, date_added) VALUES (?, ?, ?);"];
        __int16 v168 = (sqlite3_stmt *)[v167 compiled];

        if (v168)
        {
          sqlite3_bind_int64(v168, 1, [(id)v431[5] longLongValue]);
          sqlite3_bind_text(v168, 2, v298, v297, 0);
          uint64_t v169 = [MEMORY[0x1E4F1C9C8] date];
          [v169 timeIntervalSinceReferenceDate];
          sqlite3_bind_int(v168, 3, (int)v170);

          *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = sqlite3_step(v168);
          sqlite3_reset(v168);
          [v350 checkForConnectionErrorWithMessage:@"inserting POP UID"];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8)
                                                                                + 24) != 101;
        int v171 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 152) + 8) + 24);
        uint64_t v172 = *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
        unint64_t v362 = 0xAAAAAAAAAAAAAAAALL;
        if (v171) {
          goto LABEL_228;
        }
        uint64_t v327 = v172;
      }
      else
      {
        uint64_t v327 = *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
        unint64_t v362 = 0xAAAAAAAAAAAAAAAALL;
      }
      v175 = objc_alloc_init(MFMessageReferenceContext);
      [(MFMessageReferenceContext *)v175 setMessage:v352];
      [(MFMessageReferenceContext *)v175 setLibraryID:v327];
      [(MFMessageReferenceContext *)v175 setMessageIDHash:v397[3]];
      v176 = [MEMORY[0x1E4F608E0] subjectWithString:v425[5]];
      [(MFMessageReferenceContext *)v175 setSubject:v176];

      [(MFMessageReferenceContext *)v175 setReferences:v323];
      [(MFMessageReferenceContext *)v175 setMessageIDsBySubject:*(void *)(a1 + 96)];
      [(MFMessageReferenceContext *)v175 setMailboxID:RowidForMailbox];
      [(MFMessageReferenceContext *)v175 setConversationFlagsRef:&v362];
      [(MFMessageReferenceContext *)v175 setDateSentInterval:v68];
      v177 = [(id)v419[5] fullAddress];
      [(MFMessageReferenceContext *)v175 setSender:v177];

      v178 = [(id)v413[5] toRecipientStrings];
      v179 = MFDatabaseEncodedStringForAddressList(v178);
      [(MFMessageReferenceContext *)v175 setTo:v179];

      v180 = [(id)v413[5] ccRecipientStrings];
      v181 = MFDatabaseEncodedStringForAddressList(v180);
      [(MFMessageReferenceContext *)v175 setCc:v181];

      v182 = [(id)v413[5] bccRecipientStrings];
      v183 = MFDatabaseEncodedStringForAddressList(v182);
      [(MFMessageReferenceContext *)v175 setBcc:v183];

      v184 = *(void **)(a1 + 32);
      uint64_t v185 = *(void *)(a1 + 40);
      v359[0] = MEMORY[0x1E4F143A8];
      v359[1] = 3221225472;
      v359[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_836;
      v359[3] = &unk_1E5D3C700;
      id v360 = *(id *)(a1 + 104);
      id v361 = *(id *)(a1 + 112);
      uint64_t v186 = [v184 addReferenceForContext:v175 usingDatabaseConnection:v350 generationWindow:v185 mergeHandler:v359];
      if (!v186)
      {
        v187 = MFLogGeneral();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v327;
          _os_log_error_impl(&dword_1A7EFF000, v187, OS_LOG_TYPE_ERROR, "[addMessages] setting conversation id for message with library id %lld failed", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24))
      {
        v188 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:v324 basePath:*(void *)(a1 + 120) purgeable:*(unsigned __int8 *)(a1 + 194)];
        v319 = [v188 path];

        long long v357 = 0u;
        long long v358 = 0u;
        long long v355 = 0u;
        long long v356 = 0u;
        v189 = [*(id *)(a1 + 128) objectForKeyedSubscript:v352];
        id v308 = v189;
        uint64_t v190 = [v189 countByEnumeratingWithState:&v355 objects:v449 count:16];
        if (v190)
        {
          uint64_t v311 = *(void *)v356;
          while (2)
          {
            for (uint64_t i = 0; i != v190; ++i)
            {
              if (*(void *)v356 != v311) {
                objc_enumerationMutation(v308);
              }
              v192 = *(void **)(*((void *)&v355 + 1) + 8 * i);
              v193 = [v192 partName];
              uint64_t v194 = v186;
              v195 = [v192 dataHolder];
              v196 = *(void **)(a1 + 32);
              uint64_t v197 = [v192 isPartial];
              int v198 = [v192 isComplete];
              v199 = [v352 account];
              LOBYTE(v198) = _writeDataHolderForMessageAndPart(v196, v350, v327, v319, v193, v195, v197, v198 ^ 1u, v199);

              uint64_t v186 = v194;
              if ((v198 & 1) == 0)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;

                v189 = v308;
                goto LABEL_262;
              }
              if (!v343)
              {
                if ([v195 length]
                  && [v193 isEqualToString:@"summary"])
                {
                  id v200 = [NSString alloc];
                  v201 = [v195 data];
                  v343 = (void *)[v200 initWithData:v201 encoding:4];
                  uint64_t v186 = v194;
                }
                else
                {
                  v343 = 0;
                  uint64_t v186 = v194;
                }
              }
            }
            v189 = v308;
            uint64_t v190 = [v308 countByEnumeratingWithState:&v355 objects:v449 count:16];
            if (v190) {
              continue;
            }
            break;
          }
        }
LABEL_262:

        if ([v331 length])
        {
          int v202 = [*(id *)(a1 + 64) alwaysWriteFullMessageFile];
          v203 = *(void **)(a1 + 32);
          if (v202)
          {
            v204 = [v352 account];
            char v205 = [v203 _writeEmlxFileOfType:0 forAccount:v204 toDirectory:v319 withData:v331 protectionClass:_protectionClassForMailbox(*(void **)(a1 + 64))];
          }
          else
          {
            int v226 = v442;
            v204 = [v352 account];
            char v205 = _writeDataHolderForMessageAndPart(v203, v350, v327, v319, 0, v331, 0, v226 == 0, v204);
          }

          if ((v205 & 1) == 0) {
            goto LABEL_280;
          }
        }
        else if (log)
        {
          v206 = [*(id *)(a1 + 88) URL];
          v207 = [v206 scheme];
          int v208 = [v207 isEqual:v259];

          if (v208)
          {
            if (([*(id *)(a1 + 32) _fileType:2 orHigherExistsAtDirectory:v319] & 1) == 0)
            {
              v209 = [v319 stringByAppendingPathComponent:@"headers.emlx"];
              v210 = [log data];
              v211 = (void *)[v210 mutableCopy];

              v212 = [log data];
              uint64_t v213 = [v212 length];

              if (v213 && v312)
              {
                v214 = [log data];
                v215 = objc_msgSend(v214, "mf_locationsOfUnixNewlinesNeedingConversion");
                uint64_t v216 = [v215 count];

                unint64_t v217 = v312 - (v216 + v213);
                if (v312 < v216 + v213) {
                  unint64_t v217 = 0;
                }
                v218 = objc_msgSend(NSString, "stringWithFormat:", @"X-Apple-Content-Length: %lu\n\n", v217);
                v219 = [v218 dataUsingEncoding:1];

                if ((unint64_t)[v211 length] >= 2)
                {
                  v220 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\n\n" length:2];
                  int v221 = objc_msgSend(v211, "ef_hasSuffix:", v220);

                  if (v221) {
                    objc_msgSend(v211, "setLength:", objc_msgSend(v211, "length") - 1);
                  }
                }
                [v211 appendData:v219];
              }
              v222 = *(void **)(a1 + 32);
              v223 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v209 isDirectory:0];
              uint64_t v224 = _protectionClassForMailbox(*(void **)(a1 + 64));
              v225 = [v352 account];
              LOBYTE(v222) = objc_msgSend(v222, "_writeEmlxData:toFile:protectionClass:purgeable:", v211, v223, v224, objc_msgSend(v225, "supportsPurge"));

              if ((v222 & 1) == 0) {
LABEL_280:
              }
                *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;
            }
          }
        }

        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24))
        {
          size_t v164 = [*(id *)(a1 + 32) _libraryMessageWithLibraryID:v327 wasCached:0];
          [v164 setGenerationNumber:v260];
          uint64_t v227 = [(id)v419[5] fullAddress];
          v228 = (void *)v227;
          if (v227)
          {
            uint64_t v446 = v227;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v446 count:1];
          }
          else
          {
            [v352 sendersIfCached];
          }
          id v229 = (id)objc_claimAutoreleasedReturnValue();

          v230 = [(id)v413[5] toRecipientStrings];
          v231 = v230;
          if (v230)
          {
            id v320 = v230;
          }
          else
          {
            id v320 = [v352 toIfCached];
          }
          v232 = [(id)v413[5] ccRecipientStrings];
          v233 = v232;
          if (v232)
          {
            id v328 = v232;
          }
          else
          {
            id v328 = [v352 ccIfCached];
          }
          v234 = [(id)v413[5] bccRecipientStrings];
          v235 = v234;
          if (v234)
          {
            id v236 = v234;
          }
          else
          {
            id v236 = [v352 bccIfCached];
          }
          id v237 = v425[5];
          [v352 dateReceivedAsTimeIntervalSince1970];
          double v239 = v238;
          [v352 dateSentAsTimeIntervalSince1970];
          [v164 setSubject:v237 to:v320 cc:v328 bcc:v236 sender:v229 dateReceived:v343 dateSent:v239 summary:v240];
          [v164 setConversationID:v186];
          [v164 setMessageIDHash:v397[3]];
          [v164 setGlobalMessageID:v324];
          -[NSObject setMessageSize:](v164, "setMessageSize:", [v352 messageSize]);
          [v164 setFlags:v313];
          [v164 setMailboxID:RowidForMailbox];
          -[NSObject setOriginalMailboxID:](v164, "setOriginalMailboxID:", [(id)v431[5] longLongValue]);
          v241 = [v352 dateReceived];
          [v164 setDisplayDate:v241];

          if (isKindOfClass)
          {
            v242 = [v352 readLater];
            [v164 setReadLater:v242];

            v243 = [v352 followUp];
            [v164 setFollowUp:v243];

            v244 = [v352 sendLaterDate];
            [v164 setSendLaterDate:v244];
          }
          if (v349) {
            [v164 setRemoteID:v349];
          }
          if (v379[5]) {
            v245 = (__CFString *)v379[5];
          }
          else {
            v245 = &stru_1EFF11268;
          }
          [v164 setContentType:v245];
          [v164 setExternalID:v407[5]];
          [v164 setUniqueRemoteId:v389[3]];
          [v164 setConversationFlags:v362];
          id v246 = objc_alloc(MEMORY[0x1E4F607C0]);
          v247 = (void *)[v246 initWithHash:v393[3]];
          [v164 setListIDHash:v247];

          v248 = [v352 references];
          [v164 setReferences:v248];

          [v164 setIsJournaled:v304];
          v249 = [log firstHeaderForKey:v302];
          [v164 setMessageIDHeader:v249];
          if ([v352 conformsToProtocol:&unk_1EFF705B8])
          {
            v250 = [*(id *)(a1 + 32) persistence];
            v251 = [v250 businessPersistence];
            v252 = [v352 categorizationResult];
            v253 = [v251 updatedCategoryForAddressID:v336 fromCategorizationResult:v252];
            [v164 setCategory:v253];

            goto LABEL_305;
          }
          if ([v352 conformsToProtocol:&unk_1EFF60D58])
          {
            v250 = [v352 category];
            [v164 setCategory:v250];
LABEL_305:
          }
          [v164 setBusinessID:v364];
          if (!v364)
          {
            v254 = +[MFMailMessageLibrary log];
            if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR)) {
              __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_2(&v353, v354);
            }

            memset(buf, 170, sizeof(buf));
            *(_DWORD *)&uint8_t buf[32] = 0;
            *(void *)v483 = 0xE00000001;
            int v484 = 1;
            pid_t v485 = getpid();
            size_t v445 = 648;
            if (!sysctl(v483, 4u, buf, &v445, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0) {
              __debugbreak();
            }
          }
          [*(id *)(a1 + 104) addObject:v164];
          v255 = *(void **)(a1 + 136);
          if (v255) {
            [v255 setObject:v164 forKeyedSubscript:v352];
          }

          goto LABEL_230;
        }
      }
LABEL_228:
      size_t v164 = EDLibraryLog();
      if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
      {
        id v165 = objc_msgSend(v352, "ef_publicDescription");
        __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_3(v165, v447, &v448, v164);
      }
LABEL_230:

      _Block_object_dispose(&v372, 8);
      _Block_object_dispose(&v378, 8);

      _Block_object_dispose(&v384, 8);
      _Block_object_dispose(&v388, 8);
      _Block_object_dispose(&v392, 8);
      _Block_object_dispose(&v396, 8);
      _Block_object_dispose(&v400, 8);

      _Block_object_dispose(&v406, 8);
      _Block_object_dispose(&v412, 8);

      _Block_object_dispose(&v418, 8);
      _Block_object_dispose(&v424, 8);

      _Block_object_dispose(&v430, 8);
      _Block_object_dispose(&v436, 8);

LABEL_231:
      unint64_t v166 = ++*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
      if (v166 >= *(void *)(a1 + 176) || v166 >= v314) {
        goto LABEL_7;
      }
    }
  }
  v317 = 0;
LABEL_7:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24))
  {
    id v6 = EDLibraryLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_1();
    }
    goto LABEL_317;
  }
  if ([*(id *)(a1 + 104) count])
  {
    id v6 = [*(id *)(a1 + 32) hookRegistry];
    [v6 persistenceIsAddingMessages:*(void *)(a1 + 104) journaled:v296 ^ 1u generationWindow:*(void *)(a1 + 40)];
LABEL_317:
  }
  BOOL v256 = *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) == 0;

  return v256;
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_709(void *a1, void *a2)
{
  id v42 = a2;
  uint64_t v3 = [v42 objectForKeyedSubscript:@"sender_address"];
  unint64_t v4 = [v3 stringValue];

  id v5 = [v42 objectForKeyedSubscript:@"sender_comment"];
  id v6 = [v5 stringValue];

  id v7 = [[_MFEmailAddress alloc] initWithAddress:v4 displayName:v6];
  uint64_t v8 = *(void *)(a1[4] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [v42 objectForKeyedSubscript:@"subject"];
  uint64_t v11 = [v10 stringValue];
  uint64_t v12 = *(void *)(a1[5] + 8);
  char v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  int v14 = [v42 objectForKeyedSubscript:@"remote_mailbox"];
  uint64_t v15 = [v14 numberValue];
  uint64_t v16 = *(void *)(a1[6] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  char v18 = [v42 objectForKeyedSubscript:@"original_mailbox"];
  uint64_t v19 = [v18 numberValue];
  uint64_t v20 = *(void *)(a1[7] + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  id v22 = [v42 objectForKeyedSubscript:@"content_type"];
  id v23 = [v22 objectValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(void *)(*(void *)(a1[8] + 8) + 24) = (int)[v23 intValue];
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), v23);
  }
  id v24 = [v42 objectForKeyedSubscript:@"message_id"];
  uint64_t v25 = [v24 numberValue];
  *(void *)(*(void *)(a1[10] + 8) + 24) = [v25 longLongValue];

  char v26 = [v42 objectForKeyedSubscript:@"external_id"];
  uint64_t v27 = [v26 stringValue];
  uint64_t v28 = *(void *)(a1[11] + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  id v30 = [v42 objectForKeyedSubscript:@"unique_id"];
  id v31 = [v30 numberValue];
  *(void *)(*(void *)(a1[12] + 8) + 24) = [v31 longLongValue];

  uint64_t v32 = [v42 objectForKeyedSubscript:@"list_id_hash"];
  dispatch_queue_t v33 = [v32 numberValue];
  *(void *)(*(void *)(a1[13] + 8) + 24) = [v33 longLongValue];

  unint64_t v34 = [v42 objectForKeyedSubscript:@"document_id"];
  uint64_t v35 = [v34 stringValue];
  uint64_t v36 = *(void *)(a1[14] + 8);
  id v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v35;

  uint64_t v38 = [v42 objectForKeyedSubscript:@"unsubscribe_type"];
  uint64_t v39 = [v38 numberValue];
  uint64_t v40 = *(void *)(a1[15] + 8);
  id v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v39;
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  unint64_t v4 = [[_MFEmailAddress alloc] initWithAddress:v5];
  [v3 addToRecipient:v4];
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  unint64_t v4 = [[_MFEmailAddress alloc] initWithAddress:v5];
  [v3 addCCRecipient:v4];
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  unint64_t v4 = [[_MFEmailAddress alloc] initWithAddress:v5];
  [v3 addBCCRecipient:v4];
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_836(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 conversationID] == a2) {
          [v10 setConversationID:a3];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v15, "conversationID", (void)v16) == a2) {
          [v15 setConversationID:a3];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)willStartPersistenceDidAddMessages:(id)a3
{
  p_addedMessagesMapLock = &self->_addedMessagesMapLock;
  id v5 = a3;
  os_unfair_lock_lock(p_addedMessagesMapLock);
  [(NSMutableDictionary *)self->_currentAddedMessagesMap addEntriesFromDictionary:v5];

  os_unfair_lock_unlock(p_addedMessagesMapLock);
}

- (void)didFinishPersistenceDidAddMessages:(id)a3
{
  id v7 = a3;
  p_addedMessagesMapLock = &self->_addedMessagesMapLock;
  os_unfair_lock_lock(&self->_addedMessagesMapLock);
  currentAddedMessagesMap = self->_currentAddedMessagesMap;
  id v6 = [v7 allKeys];
  [(NSMutableDictionary *)currentAddedMessagesMap removeObjectsForKeys:v6];

  os_unfair_lock_unlock(p_addedMessagesMapLock);
}

- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  if ([v7 count] && v5) {
    -[MFMailMessageLibrary _didAddUnreconciledMessages:](self, "_didAddUnreconciledMessages:", [v7 count]);
  }
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = objc_msgSend(v5, "ef_groupBy:", &__block_literal_global_847);
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke_2;
    v9[3] = &unk_1E5D3C770;
    id v10 = v7;
    id v11 = self;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

id __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mailbox];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  id v5 = v4;

  return v5;
}

void __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v11[0] = v6;
  v10[0] = @"messages";
  v10[1] = @"mailboxes";
  id v9 = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [*(id *)(a1 + 32) postNotificationName:@"MailMessageStoreMessagesAdded" object:*(void *)(a1 + 40) userInfo:v8];
}

- (BOOL)_addRecipients:(id)a3 toMessageWithDatabaseID:(int64_t)a4 cache:(id)a5 connection:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke;
  uint64_t v25 = &unk_1E5D3C7C0;
  uint64_t v26 = self;
  id v13 = v11;
  id v27 = v13;
  id v14 = v12;
  id v28 = v14;
  int64_t v29 = a4;
  uint64_t v15 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v22);
  long long v16 = objc_msgSend(v10, "toRecipients", v22, v23, v24, v25, v26);
  LOBYTE(v12) = v15[2](v15, v16, 1);

  if ((v12 & 1) != 0
    && ([v10 ccRecipients],
        long long v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = v15[2](v15, v17, 2),
        v17,
        (v18 & 1) != 0))
  {
    long long v19 = [v10 bccRecipients];
    char v20 = v15[2](v15, v19, 3);
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

uint64_t __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke_2;
  v9[3] = &unk_1E5D3C798;
  id v6 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v12 = &v15;
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = a3;
  [a2 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = *((unsigned __int8 *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) _findOrCreateDatabaseIDForAddress:v7 cache:*(void *)(a1 + 40) connection:*(void *)(a1 + 48) isNewAddress:0];
  if (v8 == *MEMORY[0x1E4F5FCC8])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    long long v16 = a4;
    uint64_t v17 = [*(id *)(a1 + 48) preparedStatementForQueryString:@"INSERT INTO recipients (message, address, type, position) VALUES (?, ?, ?, ?)"];
    id v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 64)];
    v19[0] = v9;
    id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v8];
    v19[1] = v10;
    id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
    v19[2] = v11;
    id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    v19[3] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    id v18 = 0;
    char v14 = [v17 executeWithIndexedBindings:v13 usingBlock:0 error:&v18];
    id v15 = v18;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      [*(id *)(a1 + 48) handleError:v15 message:@"Inserting address"];
    }

    a4 = v16;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (int64_t)_findOrCreateDatabaseIDForAddress:(id)a3 cache:(id)a4 connection:(id)a5 isNewAddress:(BOOL *)a6
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    id v12 = [v9 address];

    if (v12)
    {
      if (a6) {
        *a6 = 0;
      }
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v13 = *MEMORY[0x1E4F5FCC8];
      uint64_t v39 = *MEMORY[0x1E4F5FCC8];
      char v14 = [v9 fullAddress];
      id v15 = [v10 objectForKeyedSubscript:v14];
      long long v16 = v15;
      if (v15)
      {
        int64_t v17 = [v15 longLongValue];
        v37[3] = v17;
LABEL_23:

        _Block_object_dispose(&v36, 8);
        goto LABEL_24;
      }
      id v18 = [v11 preparedStatementForQueryString:@"SELECT ROWID FROM addresses WHERE address = ? AND comment = ?"];
      long long v19 = [v9 address];
      v40[0] = v19;
      uint64_t v20 = [v9 displayName];
      long long v21 = (void *)v20;
      uint64_t v22 = &stru_1EFF11268;
      if (v20) {
        uint64_t v22 = (__CFString *)v20;
      }
      v40[1] = v22;
      uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];

      id v34 = 0;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __88__MFMailMessageLibrary__findOrCreateDatabaseIDForAddress_cache_connection_isNewAddress___block_invoke;
      v35[3] = &unk_1E5D3C7E8;
      v35[4] = &v36;
      char v23 = [v18 executeWithIndexedBindings:v32 usingBlock:v35 error:&v34];
      id v24 = v34;
      if (v23)
      {
        uint64_t v25 = v37[3];
        if (v25 != v13)
        {
LABEL_20:
          if (v25 != v13)
          {
            int64_t v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
            [v10 setObject:v29 forKeyedSubscript:v14];
          }
          int64_t v17 = v37[3];
          goto LABEL_23;
        }
      }
      else
      {
        [v11 handleError:v24 message:@"Looking up address ROWID"];
        v37[3] = v13;
      }
      uint64_t v26 = [v11 preparedStatementForQueryString:@"INSERT INTO addresses (address, comment) VALUES (?, ?)", v18];

      id v33 = 0;
      int v27 = [v26 executeWithIndexedBindings:v32 usingBlock:0 error:&v33];
      id v24 = v33;
      if (v27)
      {
        uint64_t v28 = [v11 lastInsertedDatabaseID];
        v37[3] = v28;
      }
      else
      {
        [v11 handleError:v24 message:@"Inserting address"];
      }
      if (a6) {
        *a6 = 1;
      }

      id v18 = v31;
      uint64_t v25 = v37[3];
      goto LABEL_20;
    }
  }
  int64_t v17 = *MEMORY[0x1E4F5FCC8];
LABEL_24:

  return v17;
}

void __88__MFMailMessageLibrary__findOrCreateDatabaseIDForAddress_cache_connection_isNewAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 longLongValue];

  *a4 = 1;
}

- (int64_t)_findOrCreateDatabaseIDForAddress:(id)a3 hmeSenderAddress:(id)a4 cache:(id)a5 outBusinessID:(int64_t *)a6 connection:(id)a7 isNewAddress:(BOOL *)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int64_t v18 = [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForAddress:v14 cache:v16 connection:v17 isNewAddress:a8];
  int64_t v19 = v18;
  int64_t v20 = *MEMORY[0x1E4F5FCC8];
  if (!a6 || v18 == v20)
  {
    if (!a6) {
      goto LABEL_15;
    }
LABEL_9:
    *a6 = v20;
    goto LABEL_15;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_9;
  }
  long long v21 = [(MFMailMessageLibrary *)self persistence];
  uint64_t v22 = [v21 businessPersistence];

  if (v15)
  {
    char v23 = EDLibraryLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v15;
      id v24 = [v32 emailAddressValue];
      uint64_t v25 = v24;
      if (v24)
      {
        uint64_t v26 = objc_msgSend(v24, "ef_publicDescription");
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x1E4F60E00];
        id v31 = [v32 stringValue];
        uint64_t v26 = [v28 fullyOrPartiallyRedactedStringForString:v31];
      }
      *(_DWORD *)buf = 138543362;
      id v34 = v26;
      _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_DEFAULT, "HideMyEmail sender address detected. Using original sender address for grouping: %{public}@", buf, 0xCu);
    }
    id v27 = v15;
  }
  else
  {
    id v27 = [v14 fullAddress];
  }
  int64_t v29 = v27;
  *a6 = [v22 findOrCreateBusinessIDForAddress:v27 addressID:v19 connection:v17];

LABEL_15:
  return v19;
}

- (int64_t)_findOrCreateDatabaseIDForGlobalData:(int64_t)a3 cache:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v15 = 0;
  id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v11 = [v10 stringValue];
  id v12 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
  int64_t v13 = [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForValue:v11 inTable:v12 column:@"message_id" cache:v8 connection:v9 created:&v15];

  if (v15) {
    [(MFMailMessageLibrary *)self _removeDataFilesForGlobalID:v13];
  }

  return v13;
}

- (int64_t)_findOrCreateDatabaseIDForSubject:(id)a3 cache:(id)a4 connection:(id)a5
{
  return [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForValue:a3 inTable:@"subjects" column:@"subject" cache:a4 connection:a5 created:0];
}

- (int64_t)_findOrCreateDatabaseIDForSummary:(id)a3 cache:(id)a4 connection:(id)a5
{
  return [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForValue:a3 inTable:@"summaries" column:@"summary" cache:a4 connection:a5 created:0];
}

- (int64_t)_findOrCreateDatabaseIDForValue:(id)a3 inTable:(id)a4 column:(id)a5 cache:(id)a6 connection:(id)a7 created:(BOOL *)a8
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    int64_t v18 = [v16 objectForKeyedSubscript:v13];
    if (v18)
    {
      int64_t v19 = EDLibraryLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v51 = 134218498;
        *(void *)&v51[4] = [v18 longLongValue];
        *(_WORD *)&v51[12] = 2114;
        *(void *)&v51[14] = v14;
        *(_WORD *)&v51[22] = 2114;
        id v52 = v15;
        _os_log_debug_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEBUG, "Found database ID %lld in cache for table: %{public}@, column: %{public}@", v51, 0x20u);
      }

      int64_t v20 = [v18 longLongValue];
    }
    else
    {
      *(void *)id v51 = 0;
      *(void *)&v51[8] = v51;
      *(void *)&v51[16] = 0x2020000000;
      uint64_t v39 = *MEMORY[0x1E4F5FCC8];
      id v52 = (id)*MEMORY[0x1E4F5FCC8];
      uint64_t v35 = (void *)[[NSString alloc] initWithFormat:@"SELECT ROWID FROM %@ WHERE %@ = ?", v14, v15];
      uint64_t v38 = objc_msgSend(v17, "preparedStatementForQueryString:");
      id v50 = v13;
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      id v41 = 0;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __96__MFMailMessageLibrary__findOrCreateDatabaseIDForValue_inTable_column_cache_connection_created___block_invoke;
      v42[3] = &unk_1E5D3C7E8;
      void v42[4] = v51;
      char v22 = [v38 executeWithIndexedBindings:v21 usingBlock:v42 error:&v41];
      id v23 = v41;

      if ((v22 & 1) == 0)
      {
        id v24 = (void *)[[NSString alloc] initWithFormat:@"Looking up %@ ROWID", v15];
        [v17 handleError:v23 message:v24];
        *(void *)(*(void *)&v51[8] + 24) = v39;
      }
      if (*(void *)(*(void *)&v51[8] + 24) == v39)
      {
        log = [[NSString alloc] initWithFormat:@"INSERT INTO %@ (%@) VALUES (?)", v14, v15];
        id v34 = objc_msgSend(v17, "preparedStatementForQueryString:");
        id v49 = v13;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        id v40 = v23;
        int v37 = [v34 executeWithIndexedBindings:v25 usingBlock:0 error:&v40];
        id v26 = v40;

        if (v37)
        {
          uint64_t v27 = [v17 lastInsertedDatabaseID];
          *(void *)(*(void *)&v51[8] + 24) = v27;
        }
        else
        {
          uint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"Inserting %@", v15];
          [v17 handleError:v26 message:v28];
          *(void *)(*(void *)&v51[8] + 24) = v39;
        }
        int64_t v29 = EDLibraryLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(*(void *)&v51[8] + 24);
          *(_DWORD *)buf = 134218498;
          uint64_t v44 = v30;
          __int16 v45 = 2114;
          id v46 = v14;
          __int16 v47 = 2114;
          id v48 = v15;
          _os_log_impl(&dword_1A7EFF000, v29, OS_LOG_TYPE_DEFAULT, "Inserted new database ID %lld in database for table: %{public}@, column: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        log = EDLibraryLog();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = *(void *)(*(void *)&v51[8] + 24);
          *(_DWORD *)buf = 134218498;
          uint64_t v44 = v33;
          __int16 v45 = 2114;
          id v46 = v14;
          __int16 v47 = 2114;
          id v48 = v15;
          _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "Found database ID %lld in database for table: %{public}@, column: %{public}@", buf, 0x20u);
        }
        LOBYTE(v37) = 0;
        id v26 = v23;
      }

      if (*(void *)(*(void *)&v51[8] + 24) != v39)
      {
        id v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
        [v16 setObject:v31 forKeyedSubscript:v13];
      }
      if (a8) {
        *a8 = v37;
      }
      int64_t v20 = *(void *)(*(void *)&v51[8] + 24);

      _Block_object_dispose(v51, 8);
    }
  }
  else
  {
    int64_t v20 = *MEMORY[0x1E4F5FCC8];
  }

  return v20;
}

void __96__MFMailMessageLibrary__findOrCreateDatabaseIDForValue_inTable_column_cache_connection_created___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 objectAtIndexedSubscript:0];
  id v7 = [v6 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 longLongValue];

  *a4 = 1;
}

- (void)_removeDataFilesForGlobalID:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:a3 basePath:self->_path purgeable:1];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v6 removeItemAtURL:v5 error:0];

  id v7 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:a3 basePath:self->_path purgeable:0];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  +[MailAccount mailAccounts];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "personaIdentifier", (void)v18);

        if (v14)
        {
          id v15 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v13];
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F60B30], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", a3, v15, objc_msgSend(v13, "supportsPurge"));

          id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v17 removeItemAtURL:v16 error:0];

          id v7 = (void *)v16;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)updateAdditionalThreadingInfoForSentMessageWithHeaders:(id)a3 externalConversationID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MFMailMessageLibrary *)self database];
  id v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary updateAdditionalThreadingInfoForSentMessageWithHeaders:externalConversationID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __102__MFMailMessageLibrary_updateAdditionalThreadingInfoForSentMessageWithHeaders_externalConversationID___block_invoke;
  v10[3] = &unk_1E5D3C810;
  id v9 = v6;
  id v11 = v9;
  int64_t v12 = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);
}

uint64_t __102__MFMailMessageLibrary_updateAdditionalThreadingInfoForSentMessageWithHeaders_externalConversationID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  sqlite3_int64 v4 = MFMessageIDHashFromHeaders();
  id v5 = [v3 preparedStatementForQueryString:@"INSERT OR IGNORE INTO conversation_id_message_id (conversation_id, message_id) VALUES (?, ?)"];
  id v6 = (sqlite3_stmt *)[v5 compiled];

  if (v6)
  {
    sqlite3_bind_int64(v6, 1, v4);
    sqlite3_bind_int64(v6, 2, *(void *)(a1 + 40));
    sqlite3_step(v6);
    sqlite3_reset(v6);
    [v3 checkForConnectionErrorWithMessage:@"inserting row into conversation_id_message_id table (3)"];
  }

  return 1;
}

- (void)updateThreadingInfoForMessage:(id)a3 fromHeaders:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    long long v18 = [(MFMailMessageLibrary *)self referencesFromHeaders:v8];
    id v17 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    uint64_t v9 = [v7 conversationID];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = *MEMORY[0x1E4F5FCC8];
    uint64_t v10 = v30;
    id v11 = [(MFMailMessageLibrary *)self database];
    int64_t v12 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary updateThreadingInfoForMessage:fromHeaders:]"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke;
    v19[3] = &unk_1E5D3C860;
    id v20 = v8;
    id v13 = v17;
    id v21 = v13;
    id v14 = v7;
    id v22 = v14;
    uint64_t v23 = self;
    uint64_t v25 = &v27;
    SEL v26 = a2;
    id v15 = v18;
    id v24 = v15;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v19);

    if (v28[3] != v10 || v9 != [v14 conversationID])
    {
      uint64_t v16 = [(MFMailMessageLibrary *)self hookRegistry];
      [v16 persistenceDidChangeGlobalMessageID:v28[3] orConversationID:v9 message:v14 generationWindow:v13];
    }
    _Block_object_dispose(&v27, 8);
  }
}

uint64_t __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MFMessageIDHashFromHeaders();
  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"ROWID"];
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "libraryID"));
    id v8 = [v6 equalTo:v7];
    [v5 setWhereClause:v8];

    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v4];
    [v5 setObject:v9 forKeyedSubscript:@"message_id"];

    [v3 executeUpdateStatement:v5 error:0];
    id v10 = objc_alloc(MEMORY[0x1E4F60F10]);
    id v11 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
    int64_t v12 = (void *)[v10 initWithTable:v11];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"ROWID"];
    id v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "globalMessageID"));
    id v15 = [v13 equalTo:v14];
    [v12 setWhereClause:v15];

    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v4];
    [v12 setObject:v16 forKeyedSubscript:@"message_id"];

    id v61 = 0;
    LOBYTE(v16) = [v3 executeUpdateStatement:v12 error:&v61];
    id v17 = v61;
    long long v18 = v17;
    if ((v16 & 1) == 0)
    {
      long long v19 = [v17 domain];
      if ([v19 isEqualToString:*MEMORY[0x1E4F60D10]])
      {
        BOOL v20 = [v18 code] == 19;

        if (v20)
        {
          id v21 = [v18 userInfo];
          id v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F60D18]];
          uint64_t v23 = [v22 integerValue];

          if (v23 == 2067)
          {
            uint64_t v64 = 0;
            double v65 = &v64;
            uint64_t v66 = 0x2020000000;
            uint64_t v67 = 0;
            id v54 = [v3 preparedStatementForQueryString:@"SELECT ROWID FROM message_global_data WHERE message_id = ?"];
            id v24 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v4];
            uint64_t v63 = v24;
            uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_2;
            v60[3] = &unk_1E5D3C7E8;
            v60[4] = &v64;
            [v54 executeWithIndexedBindings:v25 usingBlock:v60 error:0];

            if (!v65[3])
            {
              id v52 = [MEMORY[0x1E4F28B00] currentHandler];
              [v52 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 56), @"MailMessageLibrary.m", 2732, @"Got a confict trying to set global message ID %llu, but couldn't find conflicting row", v4 object file lineNumber description];
            }
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) globalMessageID];
            [*(id *)(a1 + 48) setGlobalMessageID:v65[3]];
            SEL v26 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];

            uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"ROWID"];
            uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "libraryID"));
            uint64_t v29 = [v27 equalTo:v28];
            [v26 setWhereClause:v29];

            uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v65[3]];
            [v26 setObject:v30 forKeyedSubscript:@"global_message_id"];

            [v3 executeUpdateStatement:v26 error:0];
            id v31 = objc_alloc(MEMORY[0x1E4F60E98]);
            uint64_t v53 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
            id v32 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"ROWID"];
            uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
            id v34 = [v32 equalTo:v33];
            uint64_t v35 = (void *)[v31 initWithTable:v53 where:v34];

            [v3 executeDeleteStatement:v35 error:0];
            _Block_object_dispose(&v64, 8);
            int64_t v12 = v26;
          }
        }
      }
      else
      {
      }
    }
    [*(id *)(a1 + 48) setMessageIDHash:v4];
  }
  else
  {
    [v3 preparedStatementForQueryString:@"SELECT message_id FROM messages WHERE rowid = ?"];
    id v36 = objc_claimAutoreleasedReturnValue();
    int v37 = (sqlite3_stmt *)[v36 compiled];

    if (v37)
    {
      sqlite3_bind_int64(v37, 1, [*(id *)(a1 + 48) libraryID]);
      if (sqlite3_step(v37) == 100) {
        uint64_t v4 = sqlite3_column_int64(v37, 0);
      }
      else {
        uint64_t v4 = 0;
      }
      sqlite3_reset(v37);
      [v3 checkForConnectionErrorWithMessage:@"pulling out the faked message-id"];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v59 = 0;
  uint64_t v39 = objc_alloc_init(MFMessageReferenceContext);
  [(MFMessageReferenceContext *)v39 setMessage:*(void *)(a1 + 48)];
  -[MFMessageReferenceContext setLibraryID:](v39, "setLibraryID:", [*(id *)(a1 + 48) libraryID]);
  [(MFMessageReferenceContext *)v39 setMessageIDHash:v4];
  id v40 = [*(id *)(a1 + 48) subject];
  [(MFMessageReferenceContext *)v39 setSubject:v40];

  [(MFMessageReferenceContext *)v39 setReferences:*(void *)(a1 + 64)];
  [(MFMessageReferenceContext *)v39 setMessageIDsBySubject:v38];
  -[MFMessageReferenceContext setMailboxID:](v39, "setMailboxID:", [*(id *)(a1 + 48) mailboxID]);
  [(MFMessageReferenceContext *)v39 setConversationFlagsRef:&v59];
  id v41 = [*(id *)(a1 + 48) senders];
  [(MFMessageReferenceContext *)v39 setSenderList:v41];

  id v42 = [*(id *)(a1 + 48) to];
  [(MFMessageReferenceContext *)v39 setToList:v42];

  id v43 = [*(id *)(a1 + 48) cc];
  [(MFMessageReferenceContext *)v39 setCcList:v43];

  uint64_t v44 = [*(id *)(a1 + 48) bcc];
  [(MFMessageReferenceContext *)v39 setBccList:v44];

  [*(id *)(a1 + 48) dateSentAsTimeIntervalSince1970];
  -[MFMessageReferenceContext setDateSentInterval:](v39, "setDateSentInterval:");
  uint64_t v45 = *(void *)(a1 + 40);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_3;
  v55[3] = &unk_1E5D3C838;
  id v46 = *(void **)(a1 + 56);
  id v56 = *(id *)(a1 + 48);
  uint64_t v57 = v4;
  uint64_t v58 = v59;
  uint64_t v47 = [v46 addReferenceForContext:v39 usingDatabaseConnection:v3 generationWindow:v45 mergeHandler:v55];
  if ([*(id *)(a1 + 48) conversationID] != v47)
  {
    id v48 = MFLogGeneral();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_2((uint64_t)&v64, [*(id *)(a1 + 48) conversationID], v47, v48);
    }

    id v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 56) file:@"MailMessageLibrary.m" lineNumber:2790 description:@"The message didn't get updated"];
  }
  if (!v47)
  {
    id v50 = MFLogGeneral();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_1((uint64_t)v62, [*(id *)(a1 + 48) libraryID], v50);
    }
  }
  return 1;
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

uint64_t __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) conversationID];
  if (result == a2)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 134218496;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      __int16 v13 = 2048;
      uint64_t v14 = a3;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Threading %lld: updating message's conversationID from %lld to %lld", (uint8_t *)&v9, 0x20u);
    }

    [*(id *)(a1 + 32) setConversationID:a3];
    return [*(id *)(a1 + 32) setConversationFlags:*(void *)(a1 + 48)];
  }
  return result;
}

- (void)iterateStatement:(sqlite3_stmt *)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(void *)a7
{
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (sqlite3 *)[v11 sqlDB];
  long long v18 = v13;
  id v14 = v12;
  id v19 = v14;
  sqlite3_progress_handler(v13, 200, (int (__cdecl *)(void *))progressHandler, &v18);
  uint64_t v15 = +[MFActivityMonitor currentMonitor];
  do
  {
    if (sqlite3_step(a3) != 100) {
      break;
    }
    uint64_t v16 = (void *)MEMORY[0x1AD0E3E00]();
    int v17 = [v15 shouldCancel];
    if ((v17 & 1) == 0) {
      ((void (*)(sqlite3_stmt *, void *))a6)(a3, a7);
    }
  }
  while (!v17);
  sqlite3_progress_handler(v13, 0, 0, 0);
  sqlite3_reset(a3);
  if (([v14 shouldCancel] & 1) == 0) {
    [v11 checkForConnectionErrorWithMessage:@"loading messages"];
  }
}

- (id)messagesForMailbox:(id)a3 limit:(unint64_t)a4
{
  id v4 = [(MFMailMessageLibrary *)self _messagesForMailbox:a3 olderThanNumberOfDays:0 limit:a4];
  return v4;
}

- (id)rangesOfIndexedUIDsInRange:(_NSRange)a3 requiresBody:(BOOL)a4 forMailbox:(id)a5 limit:(int64_t)a6
{
  BOOL v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a5;
  id v12 = &stru_1EFF11268;
  __int16 v13 = @" OR NOT searchable_messages.message_body_indexed";
  if (v7) {
    id v12 = @"LEFT OUTER JOIN searchable_messages ON messages.searchable_message = searchable_messages.ROWID";
  }
  else {
    __int16 v13 = &stru_1EFF11268;
  }
  objc_msgSend(NSString, "stringWithFormat:", @" WITH index_status AS(  SELECT server_messages.remote_id,     (NOT(      messages.searchable_message IS NULL%@    )) as done_indexing   FROM messages        INNER JOIN server_messages ON messages.ROWID = server_messages.message        %@   WHERE messages.mailbox == :mailbox     AND server_messages.remote_id >= :min_uid     AND server_messages.remote_id <= :max_uid), marked AS(  SELECT *,          (done_indexing AND           (done_indexing != LAG(done_indexing) OVER (ORDER BY remote_id DESC) OR            LAG(done_indexing) OVER (ORDER BY remote_id DESC) IS NULL)) as is_start,          (done_indexing AND           (done_indexing != LEAD(done_indexing) OVER (ORDER BY remote_id DESC) OR            LEAD(done_indexing) OVER (ORDER BY remote_id DESC) IS NULL)) as is_end   FROM index_status), ranges AS(  SELECT *,          SUM(is_start) OVER (ORDER BY remote_id DESC) as group_id   FROM marked) SELECT MIN(remote_id), MAX(remote_id), count(), done_indexing   FROM ranges   GROUP BY group_id   ORDER BY MIN(remote_id) DESC   LIMIT :limit;",
    v13,
  id v14 = v12);
  int64_t v15 = [(MFMailMessageLibrary *)self mailboxIDForURLString:v11];
  if (v15 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v16 = 0;
  }
  else
  {
    int v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a6];
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    long long v18 = [(MFMailMessageLibrary *)self database];
    id v19 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary rangesOfIndexedUIDsInRange:requiresBody:forMailbox:limit:]"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke;
    v22[3] = &unk_1E5D3C8B0;
    v22[4] = v14;
    int64_t v25 = v15;
    int64_t v26 = a6;
    NSUInteger v27 = location;
    NSUInteger v28 = length;
    id v20 = v17;
    id v23 = v20;
    id v24 = &v29;
    objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v22);

    uint64_t v16 = -[MFMailMessageLibraryIndexedUIDRangesAndMessageCount initWithRanges:messageCount:]([MFMailMessageLibraryIndexedUIDRangesAndMessageCount alloc], v20, v30[3]);
    _Block_object_dispose(&v29, 8);
  }
  return v16;
}

uint64_t __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke(uint64_t a1, void *a2)
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v19 = [v16 preparedStatementForQueryString:*(void *)(a1 + 32)];
  int v17 = [v16 preparedStatementForQueryString:@"SELECT COUNT(*)  FROM server_messages WHERE server_messages.mailbox == :mailbox   AND remote_id IS NOT NULL   AND remote_id >= :min_uid   AND remote_id <= :max_uid"];;
  v27[0] = @":mailbox";
  id v3 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 56)];
  v28[0] = v3;
  v27[1] = @":limit";
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 64)];
  v28[1] = v4;
  v27[2] = @":min_uid";
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v28[2] = v5;
  v27[3] = @":max_uid";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 80) + *(void *)(a1 + 72)];
  void v28[3] = v6;
  long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  v25[0] = @":mailbox";
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 56)];
  v26[0] = v7;
  v25[1] = @":min_uid";
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v26[1] = v8;
  v25[2] = @":max_uid";
  int v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 80) + *(void *)(a1 + 72)];
  v26[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke_2;
  v23[3] = &unk_1E5D3C5E8;
  id v24 = *(id *)(a1 + 40);
  id v22 = 0;
  LODWORD(v8) = [v19 executeWithNamedBindings:v18 usingBlock:v23 error:&v22];
  id v11 = v22;
  id v12 = v11;
  if (v8)
  {
    id v20 = v11;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke_3;
    v21[3] = &unk_1E5D3C7E8;
    void v21[4] = *(void *)(a1 + 48);
    uint64_t v13 = [v17 executeWithNamedBindings:v10 usingBlock:v21 error:&v20];
    id v14 = v20;

    id v12 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 int64Value];

  id v6 = [v3 objectAtIndexedSubscript:1];
  uint64_t v7 = [v6 int64Value];

  uint64_t v8 = [v3 objectAtIndexedSubscript:2];
  uint64_t v9 = [v8 int64Value];

  uint64_t v10 = [v3 objectAtIndexedSubscript:3];
  char v11 = [v10 BOOLValue];

  v12.i64[0] = v5;
  v12.i64[1] = v7;
  v13.i64[0] = 0xFFFFFFFFLL;
  v13.i64[1] = 0xFFFFFFFFLL;
  int64x2_t v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  uint64_t v15 = 0xFFFFFFFFLL;
  if (v9 < 0xFFFFFFFFLL) {
    uint64_t v15 = v9;
  }
  id v16 = *(void **)(a1 + 32);
  int32x2_t v18 = vmovn_s64((int64x2_t)vandq_s8((int8x16_t)v14, (int8x16_t)vcgtzq_s64(v14)));
  int v19 = v15 & ~(v15 >> 63);
  char v20 = v11;
  __int16 v21 = -21846;
  char v22 = -86;
  int v17 = [MEMORY[0x1E4F29238] valueWithBytes:&v18 objCType:"{?=IIIB}"];
  [v16 addObject:v17];
}

void __81__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_requiresBody_forMailbox_limit___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64Value];
}

- (id)newestUIDsForMailbox:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F28D60] indexSet];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51__MFMailMessageLibrary_newestUIDsForMailbox_limit___block_invoke;
  v10[3] = &unk_1E5D3C8D8;
  void v10[4] = v7;
  [(MFMailMessageLibrary *)self _enumerateMessageRemoteIDAndGlobalForMailbox:v6 excluding:v8 inLatest:a4 block:v10];

  return v7;
}

uint64_t __51__MFMailMessageLibrary_newestUIDsForMailbox_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[2];
  v6[0] = a2[1];
  v6[1] = *a2;
  v6[2] = v2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{?=qIIq}"];
  [v3 addObject:v4];

  return 1;
}

- (id)newestUIDsMissingBodyDataForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7
{
  id v12 = a3;
  id v23 = a4;
  int64_t v25 = [MEMORY[0x1E4F1CA48] array];
  id v24 = [MEMORY[0x1E4F28E60] indexSet];
  int64x2_t v13 = [MEMORY[0x1E4F28E60] indexSet];
  int64x2_t v14 = +[MailAccount accountWithURLString:v12];
  char v22 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v14];
  uint64_t v15 = [v14 supportsPurge];
  id v16 = [MEMORY[0x1E4F60B30] rootMessageDataDirectoryForBasePath:v22 purgeable:v15];
  int v17 = [v16 URLByResolvingSymlinksInPath];

  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  v34[0] = 0;
  v34[1] = v34;
  void v34[2] = 0x2020000000;
  v34[3] = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __107__MFMailMessageLibrary_newestUIDsMissingBodyDataForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke;
  void v26[3] = &unk_1E5D3C900;
  id v18 = v17;
  id v27 = v18;
  NSUInteger v28 = v24;
  uint64_t v29 = v13;
  uint64_t v30 = v25;
  uint64_t v31 = &v35;
  uint64_t v32 = v34;
  int64_t v33 = a6;
  [(MFMailMessageLibrary *)self _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:v12 excluding:v23 inLatest:a5 kind:1 block:v26];
  int v19 = [MFMessagesMissingBodyData alloc];
  char v20 = -[MFMessagesMissingBodyData initWithMessagesMissingBodyData:messagesNotMissingBodyData:fragmentedMessages:messagesScannedInFilesystemCount:](v19, v25, v24, v13, v36[3]);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

BOOL __107__MFMailMessageLibrary_newestUIDsMissingBodyDataForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke(uint64_t a1, unsigned int *a2)
{
  id v4 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:*((void *)a2 + 1) rootMessageDataDirectory:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"full.emlx" isDirectory:0 relativeToURL:v4];
  int v6 = access((const char *)[v5 fileSystemRepresentation], 0);

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"partial.emlx" isDirectory:0 relativeToURL:v4];
    int v8 = access((const char *)[v7 fileSystemRepresentation], 0);

    if (v8)
    {
      uint64_t v9 = *((void *)a2 + 2);
      v14[0] = *((void *)a2 + 1);
      v14[1] = *(void *)a2;
      void v14[2] = v9;
      uint64_t v10 = *(void **)(a1 + 56);
      char v11 = [MEMORY[0x1E4F29238] valueWithBytes:v14 objCType:"{?=qIIq}"];
      [v10 addObject:v11];
    }
    else
    {
      [*(id *)(a1 + 48) addIndex:*a2];
    }
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:*a2];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  BOOL v12 = (uint64_t)--*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= 1
     && (unint64_t)[*(id *)(a1 + 56) count] < *(void *)(a1 + 80);

  return v12;
}

- (id)newestUIDsMissingPartsForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7
{
  id v12 = a3;
  id v23 = a4;
  id v24 = v12;
  int64_t v25 = [MEMORY[0x1E4F1CA48] array];
  int64x2_t v13 = [MEMORY[0x1E4F28E60] indexSet];
  int64x2_t v14 = +[MailAccount accountWithURLString:v12];
  char v22 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v14];
  uint64_t v15 = [v14 supportsPurge];
  id v16 = [MEMORY[0x1E4F60B30] rootMessageDataDirectoryForBasePath:v22 purgeable:v15];
  int v17 = [v16 URLByResolvingSymlinksInPath];

  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  id v33[3] = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke;
  void v26[3] = &unk_1E5D3C950;
  id v18 = v17;
  id v27 = v18;
  NSUInteger v28 = v13;
  uint64_t v29 = v25;
  uint64_t v30 = &v34;
  uint64_t v31 = v33;
  int64_t v32 = a6;
  [(MFMailMessageLibrary *)self _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:v24 excluding:v23 inLatest:a5 kind:2 block:v26];
  int v19 = [MFMessagesMissingParts alloc];
  char v20 = -[MFMessagesMissingParts initWithFragmentedMessages:nonFragmentedMessages:messagesScannedInFilesystemCount:]((id *)&v19->super.isa, v25, v13, (void *)v35[3]);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

BOOL __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  NSUInteger v28 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:*((void *)a2 + 1) rootMessageDataDirectory:*(void *)(a1 + 32)];
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"full.emlx" isDirectory:0 relativeToURL:v28];
  int v3 = access((const char *)[v2 fileSystemRepresentation], 0);

  if (v3)
  {
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x3032000000;
    uint64_t v45 = __Block_byref_object_copy__6;
    id v46 = __Block_byref_object_dispose__6;
    id v47 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__6;
    id v40 = __Block_byref_object_dispose__6;
    id v41 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    uint64_t v31 = __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_2;
    int64_t v32 = &unk_1E5D3C928;
    uint64_t v34 = &v36;
    id v33 = v28;
    uint64_t v35 = &v42;
    id v4 = v33;
    uint64_t v29 = v30;
    id v26 = v4;
    int v5 = open((const char *)[v26 fileSystemRepresentation], 0, 0);
    if ((v5 & 0x80000000) == 0)
    {
      while (1)
      {
        uint64_t v49 = 0;
        long long v48 = xmmword_1A8AC6438;
        *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v64 = v6;
        long long v65 = v6;
        long long v62 = v6;
        long long v63 = v6;
        long long v60 = v6;
        long long v61 = v6;
        long long v58 = v6;
        long long v59 = v6;
        long long v56 = v6;
        long long v57 = v6;
        long long v54 = v6;
        long long v55 = v6;
        long long v52 = v6;
        long long v53 = v6;
        long long v50 = v6;
        long long v51 = v6;
        int v7 = getattrlistbulk(v5, &v48, &v50, 0x100uLL, 0);
        int v8 = v7;
        if (v7 == -1) {
          break;
        }
        if (!v7) {
          goto LABEL_18;
        }
        if (v7 >= 1)
        {
          uint64_t v9 = &v50;
          do
          {
            uint64_t v10 = *(unsigned int *)v9;
            if (*((unsigned char *)v9 + 4))
            {
              uint64_t v11 = *((unsigned int *)v9 + 7);
              if (v11 >= 2)
              {
                id v12 = (void *)[[NSString alloc] initWithBytes:(char *)v9 + *((int *)v9 + 6) + 24 length:v11 - 1 encoding:4];
                if (v12) {
                  v31(v29, v12);
                }
              }
            }
            uint64_t v9 = (long long *)((char *)v9 + v10);
            --v8;
          }
          while (v8);
        }
      }
      int v14 = *__error();
      uint64_t v15 = EDLibraryLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_cold_1(v14, v15);
      }

LABEL_18:
      close(v5);
    }

    if (v37[5])
    {
      uint64_t v16 = *(void *)a2;
      uint64_t v18 = *((void *)a2 + 1);
      uint64_t v17 = *((void *)a2 + 2);
      int v19 = [MFFragmentedMessage alloc];
      char v20 = (void *)v37[5];
      __int16 v21 = (void *)v43[5];
      *(void *)&long long v50 = v18;
      *((void *)&v50 + 1) = v16;
      *(void *)&long long v51 = v17;
      char v22 = -[MFFragmentedMessage initWithUIDAndSize:mainFile:existingParts:]((id *)&v19->super.isa, &v50, v20, v21);
      if (v22) {
        [*(id *)(a1 + 48) addObject:v22];
      }
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    uint64_t v13 = a1;
  }
  else
  {
    uint64_t v13 = a1;
    [*(id *)(a1 + 40) addIndex:*a2];
  }
  ++*(void *)(*(void *)(*(void *)(v13 + 56) + 8) + 24);
  BOOL v23 = (uint64_t)--*(void *)(*(void *)(*(void *)(v13 + 64) + 8) + 24) >= 1
     && (unint64_t)[*(id *)(v13 + 48) count] < *(void *)(v13 + 72);

  return v23;
}

void __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_2(void *a1, void *a2)
{
  id v10 = a2;
  if ([v10 isEqualToString:@"partial.emlx"])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0 relativeToURL:a1[4]];
    uint64_t v4 = *(void *)(a1[5] + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    int v5 = mimePartFromFilename(v10);
    if (v5)
    {
      long long v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (v6)
      {
        [v6 addObject:v5];
      }
      else
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
        uint64_t v8 = *(void *)(a1[6] + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
    }
  }
}

- (void)_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 kind:(unint64_t)a6 block:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v40 = a4;
  id v10 = a7;
  uint64_t v35 = [MEMORY[0x1E4F1C9C8] date];
  if (a5 > 1023)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA58] dataWithLength:24576];
    uint64_t v42 = [v34 mutableBytes];
    int64_t v36 = a5;
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v41 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v13 = (void *)MEMORY[0x1AD0E3E00]();
      v45[3] = 0;
      int v14 = (void *)[v40 mutableCopy];
      [v14 addIndexes:v11];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __111__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox_excluding_inLatest_kind_block___block_invoke;
      void v43[3] = &unk_1E5D3C978;
      v43[4] = &v44;
      v43[5] = v42;
      uint64_t v15 = [(MFMailMessageLibrary *)self _enumerateMessageRemoteIDAndGlobalForMailbox:v39 excluding:v14 inLatest:v36 dateReceivedMax:v12 limit:1024 kind:a6 block:v43];
      if (v45[3])
      {
        unint64_t v16 = 0;
        uint64_t v17 = v42;
        while (1)
        {
          uint64_t v18 = v45;
          unint64_t v19 = v45[3];
          if (v16 >= v19) {
            break;
          }
          char v20 = (void *)MEMORY[0x1AD0E3E00](v15);
          __int16 v21 = (uint64_t (*)(void *, unsigned char *))v10[2];
          long long v22 = *(_OWORD *)v17;
          *(void *)&uint8_t buf[16] = *(void *)(v17 + 16);
          *(_OWORD *)buf = v22;
          char v23 = v21(v10, buf);
          ++v16;
          v17 += 24;
          if ((v23 & 1) == 0)
          {
            char v24 = 0;
            v41 += v16;
            goto LABEL_18;
          }
        }
        uint64_t v25 = *(void *)(v42 + 24 * v19 - 8);
        if (v25 != v12)
        {
          [v11 removeAllIndexes];
          uint64_t v18 = v45;
          unint64_t v19 = v45[3];
        }
        v41 += v16;
        if (v19)
        {
          unint64_t v26 = 0;
          id v27 = (void *)(v42 + 16);
          do
          {
            if (*v27 == v25)
            {
              [v11 addIndex:*((unsigned int *)v27 - 4)];
              uint64_t v18 = v45;
            }
            ++v26;
            v27 += 3;
          }
          while (v26 < v18[3]);
        }
        char v24 = 1;
        uint64_t v12 = v25;
      }
      else
      {
        char v24 = 0;
      }
LABEL_18:
    }
    while ((v24 & 1) != 0);
    NSUInteger v28 = [MEMORY[0x1E4F1C9C8] date];
    [v28 timeIntervalSinceDate:v35];
    double v30 = v29;

    if (v30 > 20.0)
    {
      uint64_t v31 = EDLibraryLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:]();
      }
      goto LABEL_28;
    }
    if (v30 <= 2.0)
    {
      uint64_t v31 = EDLibraryLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v41;
        int64_t v32 = v31;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v31 = EDLibraryLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v41;
        int64_t v32 = v31;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
LABEL_27:
        _os_log_impl(&dword_1A7EFF000, v32, v33, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox took %.3g s (%zi iterations)", buf, 0x16u);
      }
    }
LABEL_28:

    _Block_object_dispose(&v44, 8);
    goto LABEL_29;
  }
  [(MFMailMessageLibrary *)self _enumerateMessageRemoteIDAndGlobalForMailbox:v39 excluding:v40 inLatest:a5 dateReceivedMax:0x7FFFFFFFFFFFFFFFLL limit:-1 kind:a6 block:v10];
LABEL_29:
}

BOOL __111__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox_excluding_inLatest_kind_block___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v2 = *(void *)(a1 + 40) + 24 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  long long v3 = *a2;
  *(void *)(v2 + 16) = *((void *)a2 + 2);
  *(_OWORD *)uint64_t v2 = v3;
  return ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 0x400uLL;
}

- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 block:(id)a6
{
}

- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 dateReceivedMax:(int64_t)a6 limit:(unint64_t)a7 kind:(unint64_t)a8 block:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  int64_t v18 = [(MFMailMessageLibrary *)self mailboxIDForURLString:v15];
  if (v18 != *MEMORY[0x1E4F5FCC8])
  {
    unint64_t v19 = [(MFMailMessageLibrary *)self database];
    char v20 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:]"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke;
    v21[3] = &unk_1E5D3CA18;
    id v22 = v16;
    int64_t v24 = a6;
    unint64_t v25 = a8;
    int64_t v26 = a5;
    int64_t v27 = v18;
    unint64_t v28 = a7;
    id v23 = v17;
    objc_msgSend(v19, "__performReadWithCaller:usingBlock:", v20, v21);
  }
}

uint64_t __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD0E3E00]();
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:*(void *)(a1 + 32)];
  long long v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_2;
  void v28[3] = &unk_1E5D3C9A0;
  id v8 = v5;
  id v29 = v8;
  id v9 = v6;
  id v30 = v9;
  [v7 enumerateRangesUsingBlock:v28];
  id v10 = (void *)[@"0" mutableCopy];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_3;
  void v26[3] = &unk_1E5D3C9C8;
  id v11 = v10;
  id v27 = v11;
  [v8 enumerateIndexesUsingBlock:v26];
  uint64_t v12 = [NSString stringWithFormat:@"server_messages.remote_id NOT IN (%@)", v11];
  [v9 addObject:v12];

  if (*(void *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @" messages.date_received <= %llu", *(void *)(a1 + 48));
    [v9 addObject:v13];
  }
  [v9 addObject:@"messages.deleted = '0'"];
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14 == 2)
  {
    [v9 addObject:@"(  messages.searchable_message IS NULL OR   messages.global_message_id IN   (SELECT global_message_id    FROM message_attachments LEFT OUTER    JOIN searchable_attachments       ON(message_attachments.rowid = searchable_attachments.attachment_id)    WHERE searchable_attachments.attachment_id IS NULL           AND message_attachments.attachment IS NOT NULL  ))"];
  }
  else if (v14 == 1)
  {
    [v9 addObject:@"messages.searchable_message IS NULL"];
  }
  id v15 = [v9 componentsJoinedByString:@" AND "];
  if (*(void *)(a1 + 64) == 0x7FFFFFFFFFFFFFFFLL) {
    [NSString stringWithFormat:@"SELECT messages.global_message_id, server_messages.remote_id, messages.size, messages.date_received FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE messages.mailbox == %llu AND %@ ORDER BY messages.date_received DESC", *(void *)(a1 + 72), v15];
  }
  else {
  id v16 = [NSString stringWithFormat:@"SELECT messages.global_message_id, server_messages.remote_id, messages.size, messages.date_received FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE messages.rowid IN (SELECT rowid FROM messages WHERE mailbox == %llu ORDER BY date_received DESC LIMIT %llu) AND %@ ORDER BY messages.date_received DESC", *(void *)(a1 + 72), *(void *)(a1 + 64), v15];
  }
  id v17 = v16;
  if (*(void *)(a1 + 80) != -1)
  {
    uint64_t v18 = objc_msgSend(v16, "stringByAppendingFormat:", @" LIMIT %llu", *(void *)(a1 + 80));

    id v17 = (void *)v18;
  }
  unint64_t v19 = [v3 preparedStatementForQueryString:v17];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_4;
  v24[3] = &unk_1E5D3C9F0;
  id v25 = *(id *)(a1 + 40);
  id v23 = 0;
  [v19 executeUsingBlock:v24 error:&v23];
  id v20 = v23;
  if (v20)
  {
    __int16 v21 = EDLibraryLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1();
    }
  }
  return 1;
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >= 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
    long long v6 = *(void **)(a1 + 40);
    objc_msgSend(NSString, "stringWithFormat:", @"(server_messages.remote_id < %llu OR %llu <= server_messages.remote_id)", a2, a2 + a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:");
  }
}

uint64_t __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @",%llu", a2);
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 int64Value];

  id v9 = [v6 objectAtIndexedSubscript:1];
  uint64_t v10 = [v9 int64Value];

  id v11 = [v6 objectAtIndexedSubscript:2];
  uint64_t v12 = [v11 int64Value];

  uint64_t v13 = [v6 objectAtIndexedSubscript:3];
  uint64_t v14 = [v13 int64Value];

  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFE)
  {
    uint64_t v15 = 0xFFFFFFFFLL;
    if (v12 < 0xFFFFFFFFLL) {
      uint64_t v15 = v12;
    }
    id v16 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    int v17 = v10;
    int v18 = v15 & ~(v15 >> 63);
    uint64_t v19 = v8;
    uint64_t v20 = v14;
    if ((v16() & 1) == 0) {
      *a4 = 1;
    }
  }
}

- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4
{
  uint64_t v4 = [(MFMailMessageLibrary *)self _messagesForMailbox:a3 olderThanNumberOfDays:*(void *)&a4 limit:0x7FFFFFFFFFFFFFFFLL];
  return v4;
}

- (id)_messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4 limit:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = +[MFMessageCriterion criterionForMailboxURL:v8];
  uint64_t v10 = v9;
  if ((int)v6 >= 1)
  {
    id v11 = [MFMessageCriterion alloc];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v6);
    uint64_t v13 = [(MFMessageCriterion *)v11 initWithType:11 qualifier:6 expression:v12];

    [(MFMessageCriterion *)v13 setDateUnits:1];
    [(MFMessageCriterion *)v13 setDateIsRelative:1];
    v18[0] = v9;
    v18[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v10 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v14];
  }
  uint64_t v15 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:", v10, v15, 0, 16, 0, a5);
  id v16 = [(_MFMessageCollector *)v15 messages];

  return v16;
}

- (id)serverSearchResultMessagesForMailbox:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[MFMessageCriterion criterionForMailboxURL:v4];
  uint64_t v6 = [[MFMessageCriterion alloc] initWithType:27 qualifier:3 expression:@"MessageIsServerSearchResult"];
  v12[0] = v5;
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v7];

  id v9 = objc_alloc_init(_MFMessageCollector);
  [(MFMailMessageLibrary *)self sendMessagesMatchingCriterion:v8 to:v9 options:0 baseTable:16];
  uint64_t v10 = [(_MFMessageCollector *)v9 messages];

  return v10;
}

- (id)_firstDateForQuery:(id)a3 inMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  id v8 = [(MFMailMessageLibrary *)self database];
  id v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _firstDateForQuery:inMailbox:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__MFMailMessageLibrary__firstDateForQuery_inMailbox___block_invoke;
  v16[3] = &unk_1E5D3CA40;
  id v10 = v6;
  id v17 = v10;
  uint64_t v19 = &v20;
  id v11 = v7;
  id v18 = v11;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v16);

  unsigned int v12 = *((_DWORD *)v21 + 6);
  if (v12 == -1)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  else
  {
    if (!v12)
    {
      uint64_t v13 = 0;
      goto LABEL_7;
    }
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v12];
  }
  uint64_t v13 = (void *)v14;
LABEL_7:

  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __53__MFMailMessageLibrary__firstDateForQuery_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  int v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -1;
    sqlite3_bind_text(v5, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    if (sqlite3_step(v5) == 100) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int(v5, 0);
    }
    sqlite3_reset(v5);
  }
  id v6 = [NSString stringWithFormat:@"error performing query: %@", *(void *)(a1 + 32)];
  [v3 checkForConnectionErrorWithMessage:v6];

  return 1;
}

- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3
{
  -[MFMailMessageLibrary _firstDateForQuery:inMailbox:](self, "_firstDateForQuery:inMailbox:", @"SELECT date_received FROM messages WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND flags & 128 = 0 ORDER BY date_received ASC LIMIT 1;",
  id v3 = a3);
  return v3;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3
{
  id v3 = [(MFMailMessageLibrary *)self _firstDateForQuery:@"SELECT date_received FROM messages JOIN searchable_messages ON messages.ROWID = searchable_messages.message_id WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND flags & 128 = 0 AND searchable_messages.transaction_id != 0 ORDER BY date_received ASC LIMIT 1" inMailbox:a3];
  return v3;
}

- (unint64_t)countMessagesMatchingCriterion:(id)a3
{
  id v3 = [(MFMailMessageLibrary *)self groupedMessagesCountForCriterion:a3 groupBy:0];
  if ([v3 count] == 1)
  {
    id v4 = [v3 objectForKeyedSubscript:&stru_1EFF11268];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)groupedMessagesCountForCriterion:(id)a3 groupBy:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  id v7 = [(MFMailMessageLibrary *)self database];
  id v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary groupedMessagesCountForCriterion:groupBy:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke;
  void v12[3] = &unk_1E5D3CA90;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = self;
  uint64_t v15 = &v17;
  unint64_t v16 = a4;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v12);

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = addOptionsForCriterion(0x10000u, *(void **)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = @"SELECT mailboxes.url, COUNT(DISTINCT(messages.message_id)) %@ GROUP BY 1;";
  if (v5 == 1) {
    unsigned int v7 = 16;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v5 != 1) {
    id v6 = 0;
  }
  if (v5) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v5) {
    id v9 = v6;
  }
  else {
    id v9 = @"SELECT COUNT() %@;";
  }
  id v10 = [*(id *)(a1 + 40) queryForCriterion:*(void *)(a1 + 32) connection:v3 options:v4 baseTable:v8 isSubquery:1];
  if (v10)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", v9, v10);
    unsigned int v12 = [v3 preparedStatementForQueryString:v11];
    [v12 setAllowedExecutionTime:0.05];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v24 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke_2;
    void v25[3] = &unk_1E5D3CA68;
    uint64_t v16 = *(void *)(a1 + 56);
    v25[4] = *(void *)(a1 + 48);
    v25[5] = v16;
    [v12 executeUsingBlock:v25 error:&v24];
    id v17 = v24;
    if (v17)
    {
      id v18 = EDLibraryLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1();
      }
    }
  }
  else
  {
    int v19 = [*(id *)(a1 + 40) isProtectedDataAvailable:v3];
    id v11 = EDLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [*(id *)(a1 + 32) criterionType];
      uint64_t v22 = [v3 sqlDB];
      int v23 = @"not attached";
      *(_DWORD *)buf = 134218498;
      uint64_t v27 = v21;
      if (v19) {
        int v23 = @"attached";
      }
      __int16 v28 = 2048;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v23;
      _os_log_error_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_ERROR, "criterion %ld couldn't be turned into a query, <db:%p, protected %@>", buf, 0x20u);
    }
  }

  return 1;
}

void __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 stringValue];

    id v6 = [v8 objectAtIndexedSubscript:1];
    unsigned int v7 = [v6 numberValue];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [v5 numberValue];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v6 forKeyedSubscript:&stru_1EFF11268];
  }
}

- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = objc_alloc_init(_MFMessageCollector);
  id v9 = [(MFMailMessageLibrary *)self database];
  id v10 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary messagesWithSummariesForMailbox:range:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MFMailMessageLibrary_messagesWithSummariesForMailbox_range___block_invoke;
  v15[3] = &unk_1E5D3CAB8;
  id v11 = v7;
  NSUInteger v19 = location;
  NSUInteger v20 = length;
  id v16 = v11;
  id v17 = self;
  unsigned int v12 = v8;
  id v18 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  id v13 = [(_MFMessageCollector *)v12 messages];

  return v13;
}

uint64_t __62__MFMailMessageLibrary_messagesWithSummariesForMailbox_range___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  [v3 preparedStatementForQueryString:@"INSERT INTO temp_selected_messages SELECT rowid FROM messages WHERE mailbox = ifnull((SELECT rowid FROM mailboxes WHERE url = :url), -1) AND deleted = '0' ORDER BY date_received DESC, ROWID DESC LIMIT :limit OFFSET :offset;"];
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (sqlite3_stmt *)[v5 compiled];

  LODWORD(v5) = sqlite3_bind_parameter_index(v6, ":url");
  sqlite3_bind_text(v6, (int)v5, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v7 = sqlite3_bind_parameter_index(v6, ":limit");
  sqlite3_bind_int(v6, v7, *(_DWORD *)(a1 + 64));
  int v8 = sqlite3_bind_parameter_index(v6, ":offset");
  sqlite3_bind_int(v6, v8, *(_DWORD *)(a1 + 56));
  LODWORD(v5) = sqlite3_step(v6);
  sqlite3_reset(v6);
  if (v5 == 101)
  {
    id v9 = [v3 preparedStatementForQueryString:@"SELECT messages.ROWID, remote_id, date_received, date_sent, display_date, flags, size, messages.subject_prefix, subjects.subject, sender.comment AS sender_comment, sender.address AS sender_address, mailbox, original_mailbox, content_type, summaries.summary, encoding FROM temp_selected_messages AS selection LEFT OUTER JOIN messages ON selection.message_id = messages.rowid LEFT OUTER JOIN addresses AS sender ON messages.sender = sender.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID LEFT OUTER JOIN summaries ON messages.summary = summaries.ROWID"];;
    [*(id *)(a1 + 40) _sendMessagesForStatement:v9 connection:v3 to:*(void *)(a1 + 48) options:6297663 timestamp:v4];
  }
  id v10 = [v3 preparedStatementForQueryString:@"DELETE FROM temp_selected_messages;"];
  id v11 = (sqlite3_stmt *)[v10 compiled];

  sqlite3_step(v11);
  sqlite3_reset(v11);
  uint64_t v12 = [v3 checkForConnectionErrorWithMessage:@"messagesWithSummariesForMailbox"];

  return v12;
}

- (id)orderedBatchOfMessagesEndingAtRowId:(int64_t)a3 limit:(unsigned int)a4 success:(BOOL *)a5
{
  id v9 = objc_alloc_init(_MFMessageCollector);
  id v10 = [(MFMailMessageLibrary *)self database];
  id v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary orderedBatchOfMessagesEndingAtRowId:limit:success:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__MFMailMessageLibrary_orderedBatchOfMessagesEndingAtRowId_limit_success___block_invoke;
  v15[3] = &unk_1E5D3CAE0;
  unsigned int v19 = a4;
  int64_t v17 = a3;
  void v15[4] = self;
  uint64_t v12 = v9;
  id v16 = v12;
  id v18 = a5;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v15);

  id v13 = [(_MFMessageCollector *)v12 messages];

  return v13;
}

uint64_t __74__MFMailMessageLibrary_orderedBatchOfMessagesEndingAtRowId_limit_success___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  [v3 preparedStatementForQueryString:@"INSERT INTO temp_selected_messages SELECT rowid FROM messages WHERE rowid >= 0 AND rowid <= :maxRowId ORDER BY rowid DESC LIMIT :limit;"];
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (sqlite3_stmt *)[v5 compiled];

  int v7 = sqlite3_bind_parameter_index(v6, ":maxRowId");
  sqlite3_bind_int64(v6, v7, *(void *)(a1 + 48));
  int v8 = sqlite3_bind_parameter_index(v6, ":limit");
  sqlite3_bind_int(v6, v8, *(_DWORD *)(a1 + 64));
  LODWORD(v5) = sqlite3_step(v6);
  sqlite3_reset(v6);
  if (v5 == 101)
  {
    id v9 = [*(id *)(a1 + 32) _selectExpressionForMessageWithAvailableTables:544];
    id v10 = [v9 stringByAppendingString:@" FROM temp_selected_messages AS selection LEFT OUTER JOIN messages ON selection.message_id = messages.rowid LEFT OUTER JOIN addresses AS sender ON messages.sender = sender.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID"];;
    id v11 = [v3 preparedStatementForQueryString:v10];
    [*(id *)(a1 + 32) _sendMessagesForStatement:v11 connection:v3 to:*(void *)(a1 + 40) options:6297663 timestamp:v4];
  }
  if (*(void *)(a1 + 56)) {
    **(unsigned char **)(a1 + 56) = sqlite3_errcode((sqlite3 *)[v3 sqlDB]) == 0;
  }
  id v12 = [v3 preparedStatementForQueryString:@"DELETE FROM temp_selected_messages;"];
  id v13 = (sqlite3_stmt *)[v12 compiled];

  sqlite3_step(v13);
  sqlite3_reset(v13);
  uint64_t v14 = [v3 checkForConnectionErrorWithMessage:@"orderedBatchOfMessagesEndingAtRowId"];

  return v14;
}

- (int64_t)_int64ForQuery:(id)a3 connection:(id)a4 textArgument:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = 0;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v10 = [v8 preparedStatementForQueryString:v7];
  if (v9)
  {
    v22[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  }
  else
  {
    id v11 = 0;
  }
  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__MFMailMessageLibraryuint64_tForQuery_connection_textArgument___block_invoke;
  v17[3] = &unk_1E5D3C7E8;
  v17[4] = &v18;
  [v10 executeWithIndexedBindings:v11 usingBlock:v17 error:&v16];
  id v12 = v16;
  id v13 = [NSString stringWithFormat:@"error performing query: %@: %@", v7, v12];
  [v8 checkForConnectionErrorWithMessage:v13];

  int64_t v14 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v14;
}

- (int)_integerForQuery:(id)a3 withTextArgument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  id v8 = [(MFMailMessageLibrary *)self database];
  id v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _integerForQuery:withTextArgument:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MFMailMessageLibrary__integerForQuery_withTextArgument___block_invoke;
  v13[3] = &unk_1E5D3CB08;
  id v16 = &v17;
  void v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v13);

  LODWORD(v6) = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return (int)v6;
}

uint64_t __58__MFMailMessageLibrary__integerForQuery_withTextArgument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _int64ForQuery:*(void *)(a1 + 40) connection:v3 textArgument:*(void *)(a1 + 48)];

  return 1;
}

- (id)_queryForMailboxesIDsFromMailboxes:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_1041);
  uint64_t v4 = [v3 allObjects];
  id v5 = [v4 componentsJoinedByString:@" OR "];

  id v6 = [NSString stringWithFormat:@"SELECT ROWID FROM mailboxes WHERE %@", v5];

  return v6;
}

id __59__MFMailMessageLibrary__queryForMailboxesIDsFromMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sqlite3_mprintf("url = %Q", [v2 UTF8String]);
  uint64_t v4 = [NSString stringWithUTF8String:v3];
  sqlite3_free(v3);

  return v4;
}

- (unsigned)unreadCountForMailbox:(id)a3
{
  int v3 = [(MFMailMessageLibrary *)self _integerForQuery:@"SELECT unread_count FROM mailboxes WHERE url = ?" withTextArgument:a3];
  return v3 & ~(v3 >> 31);
}

- (unsigned)attachmentCountForMailboxes:(id)a3
{
  uint64_t v4 = [(MFMailMessageLibrary *)self _queryForMailboxesIDsFromMailboxes:a3];
  id v5 = [NSString stringWithFormat:@"SELECT COUNT(DISTINCT(message_id)) FROM messages WHERE (((flags&(63<<10))>>10) BETWEEN 1 AND 62) AND mailbox IN (%@)", v4];

  LODWORD(v4) = [(MFMailMessageLibrary *)self _integerForQuery:v5 withTextArgument:0];
  return v4;
}

- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!v6 || v5)
  {
    uint64_t v9 = 128;
    if (!v5 || v6) {
      uint64_t v9 = 0;
    }
    uint64_t v10 = 1048704;
    if (v5) {
      uint64_t v10 = 0;
    }
    if (!v6 && !v5) {
      uint64_t v9 = v10;
    }
  }
  else
  {
    uint64_t v9 = 0x100000;
  }
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT count(messages.rowid) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND (flags & %llu = 0) AND deleted = '0'", v9);
  unsigned int v12 = [(MFMailMessageLibrary *)self _integerForQuery:v11 withTextArgument:v8];

  return v12;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = +[MFMessageCriterion messageIsDeletedCriterion:0];
  v22[0] = v9;
  uint64_t v10 = +[MFMessageCriterion criterionForMailboxURL:v8];
  v22[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  unsigned int v12 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v11];
  unint64_t v13 = [(MFMailMessageLibrary *)self countMessagesMatchingCriterion:v12];

  int v14 = !v6;
  if (!v6 || !v5)
  {
    if ((v14 | v5) == 1)
    {
      BOOL v15 = (v5 & v14) == 0;
      uint64_t v16 = 128;
      if (v15) {
        uint64_t v16 = 0;
      }
      uint64_t v17 = 1048704;
      if (v5) {
        uint64_t v17 = 0;
      }
      if (!v6 && !v5) {
        uint64_t v16 = v17;
      }
    }
    else
    {
      uint64_t v16 = 0x100000;
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT COUNT(messages.rowid) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND flags & %llu AND deleted = '0'", v16);
    unsigned int v19 = [(MFMailMessageLibrary *)self _integerForQuery:v18 withTextArgument:v8];
    if (v13 <= v19) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v19;
    }

    LODWORD(v13) = v13 - v20;
  }

  return v13;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3
{
  return [(MFMailMessageLibrary *)self nonDeletedCountForMailbox:a3 includeServerSearchResults:1 includeThreadSearchResults:1];
}

- (unsigned)totalCountForMailbox:(id)a3
{
  uint64_t v4 = +[MFMessageCriterion criterionForMailboxURL:a3];
  LODWORD(self) = [(MFMailMessageLibrary *)self countMessagesMatchingCriterion:v4];

  return self;
}

- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3
{
  return [(MFMailMessageLibrary *)self _integerForQuery:@"SELECT server_unread_count FROM mailboxes WHERE url = ?" withTextArgument:a3];
}

- (void)setServerUnreadOnlyOnServerCount:(unint64_t)a3 forMailbox:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v8 = [(MFMailMessageLibrary *)self database];
  uint64_t v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setServerUnreadOnlyOnServerCount:forMailbox:]"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __68__MFMailMessageLibrary_setServerUnreadOnlyOnServerCount_forMailbox___block_invoke;
  unsigned int v19 = &unk_1E5D3CA90;
  id v10 = v7;
  id v20 = v10;
  unint64_t v23 = a3;
  id v11 = v6;
  id v21 = v11;
  uint64_t v22 = &v24;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, &v16);

  if (*((unsigned char *)v25 + 24))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
    unint64_t v13 = objc_msgSend(v12, "initWithString:", v11, v16, v17, v18, v19, v20);
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v13];
    BOOL v15 = [(MFMailMessageLibrary *)self hookRegistry];
    [v15 persistenceDidUpdateServerCount:a3 forMailboxWithObjectID:v14 generationWindow:v10];
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __68__MFMailMessageLibrary_setServerUnreadOnlyOnServerCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  uint64_t v4 = [v3 preparedStatementForQueryString:@"UPDATE mailboxes SET server_unread_count = :count WHERE url = :url AND server_unread_count IS NOT :count"];
  v20[0] = @":count";
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v20[1] = @":url";
  v21[0] = v5;
  v21[1] = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  id v14 = 0;
  uint64_t v15 = 0;
  uint64_t v7 = [v4 executeWithNamedBindings:v6 rowsChanged:&v15 error:&v14];
  id v8 = v14;
  if (v15) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v10 = EDLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Did update unread-only-on-server count to %llu for mailbox %@", buf, 0x16u);
    }
  }
  return v7;
}

- (void)setLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailbox:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  id v8 = [(MFMailMessageLibrary *)self database];
  char v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setLastSyncAndMostRecentStatusCount:forMailbox:]"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __71__MFMailMessageLibrary_setLastSyncAndMostRecentStatusCount_forMailbox___block_invoke;
  uint64_t v19 = &unk_1E5D3CB30;
  id v10 = v7;
  id v20 = v10;
  id v21 = self;
  id v11 = v6;
  id v22 = v11;
  int64_t v23 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, &v16);

  id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
  unint64_t v13 = objc_msgSend(v12, "initWithString:", v11, v16, v17, v18, v19);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v13];
  uint64_t v15 = [(MFMailMessageLibrary *)self hookRegistry];
  [v15 persistenceDidUpdateLastSyncAndMostRecentStatusCount:a3 forMailboxWithObjectID:v14 generationWindow:v10];
}

uint64_t __71__MFMailMessageLibrary_setLastSyncAndMostRecentStatusCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  sqlite3_int64 RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"mailboxes"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  [v5 setObject:v6 forKeyedSubscript:@"last_sync_status_count"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  [v5 setObject:v7 forKeyedSubscript:@"most_recent_status_count"];

  id v8 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  char v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:RowidForMailbox];
  id v10 = [v8 equalTo:v9];
  [v5 setWhereClause:v10];

  uint64_t v11 = [v3 executeUpdateStatement:v5 error:0];
  return v11;
}

- (void)increaseProtectionOnFileForMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:0];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v7 = objc_msgSend(v6, "mf_protectFileAtPath:withClass:error:", v5, 2, &v10);
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    char v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "#Warning Error setting the protection class on \"%@\": %@", buf, 0x16u);
    }
  }
}

- (unint64_t)mostRecentStatusCountForMailbox:(id)a3
{
  return [(MFMailMessageLibrary *)self _integerForQuery:@"SELECT most_recent_status_count FROM mailboxes WHERE url = ?" withTextArgument:a3];
}

- (void)setMostRecentStatusCount:(unint64_t)a3 forMailbox:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  id v8 = [(MFMailMessageLibrary *)self database];
  char v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setMostRecentStatusCount:forMailbox:]"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  __int16 v18 = __60__MFMailMessageLibrary_setMostRecentStatusCount_forMailbox___block_invoke;
  uint64_t v19 = &unk_1E5D3CB30;
  id v10 = v7;
  id v20 = v10;
  id v21 = self;
  id v11 = v6;
  id v22 = v11;
  unint64_t v23 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, &v16);

  id v12 = objc_alloc(MEMORY[0x1E4F1CB10]);
  __int16 v13 = objc_msgSend(v12, "initWithString:", v11, v16, v17, v18, v19);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v13];
  uint64_t v15 = [(MFMailMessageLibrary *)self hookRegistry];
  [v15 persistenceDidUpdateMostRecentStatusCount:a3 forMailboxWithObjectID:v14 generationWindow:v10];
}

BOOL __60__MFMailMessageLibrary_setMostRecentStatusCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  sqlite3_int64 RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  [v3 preparedStatementForQueryString:@"UPDATE mailboxes SET most_recent_status_count = ? WHERE rowid = ?"];
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (sqlite3_stmt *)[v5 compiled];

  if (v6)
  {
    sqlite3_bind_int(v6, 1, *(_DWORD *)(a1 + 56));
    sqlite3_bind_int64(v6, 2, RowidForMailbox);
    int v7 = sqlite3_step(v6);
    sqlite3_reset(v6);
    [v3 checkForConnectionErrorWithMessage:@"setting unseen count"];
    BOOL v8 = v7 == 101;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  BOOL v8 = [(MFMailMessageLibrary *)self database];
  char v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary messageWithRemoteID:inRemoteMailbox:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke;
  void v14[3] = &unk_1E5D3CB80;
  void v14[4] = self;
  id v10 = v7;
  id v15 = v10;
  id v11 = v6;
  id v16 = v11;
  uint64_t v17 = &v18;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
  if (!sSharedInstance_block_invoke_sql)
  {
    id v5 = (void *)[*(id *)(a1 + 32) _selectClauseForOptions:0 protectedDataAvailable:v4];
    _MFLockGlobalLock();
    if (!sSharedInstance_block_invoke_sql)
    {
      uint64_t v6 = [[NSString alloc] initWithFormat:@"%@ FROM messages WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND messages.remote_id = ? LIMIT 1", v5];
      id v7 = (void *)sSharedInstance_block_invoke_sql;
      sSharedInstance_block_invoke_sql = v6;
    }
    _MFUnlockGlobalLock();
  }
  BOOL v8 = objc_msgSend(v3, "preparedStatementForQueryString:");
  char v9 = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2((uint64_t)v8, *(void **)(a1 + 40));
  v22[0] = v9;
  id v10 = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2((uint64_t)v9, *(void **)(a1 + 48));
  v22[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_3;
  void v18[3] = &unk_1E5D3CB58;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 56);
  void v18[4] = v12;
  id v13 = v3;
  id v19 = v13;
  char v21 = v4;
  id v17 = 0;
  uint64_t v14 = [v8 executeWithIndexedBindings:v11 usingBlock:v18 error:&v17];
  id v15 = v17;

  if ((v14 & 1) == 0) {
    [v13 handleError:v15 message:@"finding message for UID"];
  }

  return v14;
}

id __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  id v5 = v4;

  return v5;
}

void __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _messageForRow:v6 options:0 timestamp:mach_absolute_time() connection:*(void *)(a1 + 40) isProtectedDataAvailable:*(unsigned __int8 *)(a1 + 56) recipientsCache:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)searchResultsWithRemoteIDs:(id)a3 requiresBody:(BOOL)a4 inRemoteMailbox:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__6;
  uint64_t v26 = __Block_byref_object_dispose__6;
  id v27 = (id)MEMORY[0x1E4F1CBF0];
  id v10 = [(MFMailMessageLibrary *)self database];
  id v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary searchResultsWithRemoteIDs:requiresBody:inRemoteMailbox:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__MFMailMessageLibrary_searchResultsWithRemoteIDs_requiresBody_inRemoteMailbox___block_invoke;
  v16[3] = &unk_1E5D3CBA8;
  void v16[4] = self;
  int v20 = 6293567;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  BOOL v21 = a4;
  id v18 = v13;
  id v19 = &v22;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v16);

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __80__MFMailMessageLibrary_searchResultsWithRemoteIDs_requiresBody_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _canSelectMessagesWithOptions:*(unsigned int *)(a1 + 64) connection:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    int v5 = v4;
    id v6 = (void *)[*(id *)(a1 + 32) _selectClauseForOptions:*(unsigned int *)(a1 + 64) protectedDataAvailable:v4];
    int v7 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 64), 0, v5);
    id v8 = joinsForTables(v7);
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) allObjects];
    id v11 = [v9 _remoteIDsStringForRemoteIDs:v10 inMailbox:*(void *)(a1 + 48)];

    if (*(unsigned char *)(a1 + 68)) {
      id v12 = @"LEFT OUTER JOIN searchable_messages ON messages.searchable_message = searchable_messages.ROWID";
    }
    else {
      id v12 = &stru_1EFF11268;
    }
    if (*(unsigned char *)(a1 + 68)) {
      id v13 = @" OR NOT searchable_messages.message_body_indexed";
    }
    else {
      id v13 = &stru_1EFF11268;
    }
    id v14 = [NSString alloc];
    id v15 = objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
    id v16 = (void *)[v14 initWithFormat:@"%@ FROM messages %@ %s WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@) AND (messages.searchable_message IS NULL %@)", v6, v12, v8, v15, v11, v13];

    free(v8);
    id v17 = objc_alloc_init(_MFMessageCollector);
    id v18 = [v3 preparedStatementForQueryString:v16];
    [*(id *)(a1 + 32) _sendMessagesForStatement:v18 connection:v3 to:v17 options:*(unsigned int *)(a1 + 64) timestamp:mach_absolute_time()];
    uint64_t v19 = [(_MFMessageCollector *)v17 copyMessages];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  return 1;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__6;
  id v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  id v10 = [(MFMailMessageLibrary *)self database];
  id v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary copyMessagesWithRemoteIDs:options:inRemoteMailbox:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MFMailMessageLibrary_copyMessagesWithRemoteIDs_options_inRemoteMailbox___block_invoke;
  v16[3] = &unk_1E5D3CBD0;
  void v16[4] = self;
  unsigned int v20 = a4;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  uint64_t v19 = &v21;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v16);

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __74__MFMailMessageLibrary_copyMessagesWithRemoteIDs_options_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _canSelectMessagesWithOptions:*(unsigned int *)(a1 + 64) connection:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    int v5 = v4;
    id v6 = (void *)[*(id *)(a1 + 32) _selectClauseForOptions:*(unsigned int *)(a1 + 64) protectedDataAvailable:v4];
    int v7 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 64), 0, v5);
    id v8 = joinsForTables(v7);
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) allObjects];
    id v11 = [v9 _remoteIDsStringForRemoteIDs:v10 inMailbox:*(void *)(a1 + 48)];

    id v12 = [NSString alloc];
    id v13 = objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
    id v14 = (void *)[v12 initWithFormat:@"%@ FROM messages %s WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@)", v6, v8, v13, v11];

    free(v8);
    id v15 = objc_alloc_init(_MFMessageCollector);
    id v16 = [v3 preparedStatementForQueryString:v14];
    [*(id *)(a1 + 32) _sendMessagesForStatement:v16 connection:v3 to:v15 options:*(unsigned int *)(a1 + 64) timestamp:mach_absolute_time()];
    uint64_t v17 = [(_MFMessageCollector *)v15 copyMessages];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  return 1;
}

- (id)flagsForRemoteIDs:(id)a3 inRemoteMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = [(MFMailMessageLibrary *)self database];
  id v10 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary flagsForRemoteIDs:inRemoteMailbox:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke;
  v17[3] = &unk_1E5D3CBF8;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  id v12 = v7;
  id v19 = v12;
  id v13 = v8;
  id v20 = v13;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v17);

  id v14 = v20;
  id v15 = v13;

  return v15;
}

uint64_t __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _remoteIDsStringForRemoteIDs:*(void *)(a1 + 40) inMailbox:*(void *)(a1 + 48)];
  id v5 = [NSString alloc];
  id v6 = objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
  id v7 = (void *)[v5 initWithFormat:@"SELECT remote_id, flags FROM messages WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@)", v6, v4];

  id v8 = [v3 preparedStatementForQueryString:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke_2;
  void v12[3] = &unk_1E5D3C5E8;
  id v13 = *(id *)(a1 + 56);
  id v11 = 0;
  [v8 executeUsingBlock:v12 error:&v11];
  id v9 = v11;
  [v3 handleError:v9 message:@"Getting flags for remote IDs"];

  return 1;
}

void __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 objectForKeyedSubscript:@"remote_id"];
  uint64_t v4 = [v3 stringValue];

  id v5 = [v9 objectForKeyedSubscript:@"flags"];
  id v6 = [v5 numberValue];
  uint64_t v7 = [v6 longLongValue];

  id v8 = MFFlagsObjectForFlags(v7);
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v4];
}

- (id)_remoteIDsStringForRemoteIDs:(id)a3 inMailbox:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  id v8 = [v7 scheme];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F5FC38]];

  if (v9)
  {
    id v10 = [v5 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v11 = [v5 count];
    if (v11)
    {
      if (v11 == 1)
      {
        id v12 = [v5 firstObject];
        objc_msgSend(v12, "ef_quotedSQLEscapedString");
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28E78] string];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = v5;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v21;
          char v16 = 1;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v13);
              }
              objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "ef_quotedSQLEscapedString");
              if (v16) {
                id v18 = {;
              }
                [(__CFString *)v10 appendString:v18];
              }
              else {
                id v18 = {;
              }
                [(__CFString *)v10 appendFormat:@",%@", v18];
              }

              char v16 = 0;
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
            char v16 = 0;
          }
          while (v14);
        }
      }
    }
    else
    {
      id v10 = &stru_1EFF11268;
    }
  }

  return v10;
}

- (id)sequenceIdentifierForMailbox:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__6;
  uint64_t v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  if (v4)
  {
    id v5 = [(MFMailMessageLibrary *)self database];
    id v6 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary sequenceIdentifierForMailbox:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __53__MFMailMessageLibrary_sequenceIdentifierForMailbox___block_invoke;
    v10[3] = &unk_1E5D3CC20;
    id v11 = v4;
    id v12 = &v13;
    objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

    uint64_t v7 = (void *)v14[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __53__MFMailMessageLibrary_sequenceIdentifierForMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT sequence_identifier FROM mailboxes WHERE url = ?"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
    if (sqlite3_step(v5) == 100)
    {
      id v6 = sqlite3_column_text(v5, 0);
      if (v6)
      {
        uint64_t v7 = [[NSString alloc] initWithUTF8String:v6];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        int v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
    }
    sqlite3_reset(v5);
    [v3 checkForConnectionErrorWithMessage:@"loading mailbox sequence identifier"];
  }

  return 1;
}

- (void)setSequenceIdentifier:(id)a3 forMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    int v9 = [(MFMailMessageLibrary *)self database];
    id v10 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setSequenceIdentifier:forMailbox:]"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke;
    void v12[3] = &unk_1E5D3CBF8;
    id v11 = v8;
    id v13 = v11;
    uint64_t v14 = self;
    id v15 = v7;
    id v16 = v6;
    objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v12);
  }
}

uint64_t __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  sqlite3_int64 RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  if (RowidForMailbox == *MEMORY[0x1E4F5FCC8])
  {
    id v5 = EDLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke_cold_1(a1 + 48, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    [v3 preparedStatementForQueryString:@"UPDATE mailboxes SET sequence_identifier = ? WHERE ROWID = ?"];
    id v12 = objc_claimAutoreleasedReturnValue();
    id v13 = (sqlite3_stmt *)[v12 compiled];

    if (v13)
    {
      uint64_t v14 = *(void **)(a1 + 56);
      if (v14) {
        sqlite3_bind_text(v13, 1, (const char *)[v14 UTF8String], -1, 0);
      }
      else {
        sqlite3_bind_null(v13, 1);
      }
      sqlite3_bind_int64(v13, 2, RowidForMailbox);
      sqlite3_step(v13);
      sqlite3_reset(v13);
    }
  }
  uint64_t v15 = [v3 checkForConnectionErrorWithMessage:@"setting mailbox sequence identifier"];

  return v15;
}

- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  long long v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  if (v7 && [v6 count])
  {
    uint64_t v8 = [(MFMailMessageLibrary *)self database];
    uint64_t v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary sequenceIdentifierForMessagesWithRemoteIDs:inMailbox:]"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__MFMailMessageLibrary_sequenceIdentifierForMessagesWithRemoteIDs_inMailbox___block_invoke;
    void v12[3] = &unk_1E5D3C500;
    id v13 = v6;
    id v14 = v7;
    uint64_t v15 = &v16;
    objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __77__MFMailMessageLibrary_sequenceIdentifierForMessagesWithRemoteIDs_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(@"SELECT MIN(messages.sequence_identifier) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND remote_id IN (?"), "mutableCopy";
  unint64_t v5 = [*(id *)(a1 + 32) count];
  if (v5 >= 2)
  {
    unint64_t v6 = v5 - 1;
    do
    {
      [v4 appendString:@", ?"];
      --v6;
    }
    while (v6);
  }
  [v4 appendString:@""]);
  id v7 = [v3 preparedStatementForQueryString:v4];
  uint64_t v8 = (sqlite3_stmt *)[v7 compiled];

  if (v8)
  {
    sqlite3_bind_text(v8, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      int v12 = 2;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          sqlite3_bind_int(v8, v12 + i, [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntValue]);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        v12 += i;
      }
      while (v10);
    }

    if (sqlite3_step(v8) == 100)
    {
      uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", sqlite3_column_int64(v8, 0));
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    sqlite3_reset(v8);
    [v3 checkForConnectionErrorWithMessage:@"loading per-message minimum sequence identifier"];
  }

  return 1;
}

- (void)setSequenceIdentifier:(id)a3 forMessageWithLibraryID:(int64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(MFMailMessageLibrary *)self database];
    uint64_t v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setSequenceIdentifier:forMessageWithLibraryID:]"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __70__MFMailMessageLibrary_setSequenceIdentifier_forMessageWithLibraryID___block_invoke;
    v9[3] = &unk_1E5D3C810;
    id v10 = v6;
    int64_t v11 = a4;
    objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);
  }
}

uint64_t __70__MFMailMessageLibrary_setSequenceIdentifier_forMessageWithLibraryID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"UPDATE messages SET sequence_identifier = ? WHERE ROWID = ?"];
  id v4 = objc_claimAutoreleasedReturnValue();
  unint64_t v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
    sqlite3_bind_int64(v5, 2, *(void *)(a1 + 40));
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  uint64_t v6 = [v3 checkForConnectionErrorWithMessage:@"setting per-message sequence identifier"];

  return v6;
}

- (void)setSequenceIdentifier:(id)a3 forMessagesWithRemoteIDs:(id)a4 inMailbox:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v9, "count"))
  {
    int64_t v11 = [(MFMailMessageLibrary *)self database];
    int v12 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setSequenceIdentifier:forMessagesWithRemoteIDs:inMailbox:]"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__MFMailMessageLibrary_setSequenceIdentifier_forMessagesWithRemoteIDs_inMailbox___block_invoke;
    v13[3] = &unk_1E5D3CC48;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v13);
  }
}

uint64_t __81__MFMailMessageLibrary_setSequenceIdentifier_forMessagesWithRemoteIDs_inMailbox___block_invoke(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(@"UPDATE messages SET sequence_identifier = ? WHERE MAILBOX = (SELECT ROWID FROM mailboxes WHERE url = ?) AND remote_id IN(?"), "mutableCopy";
  unint64_t v5 = [a1[4] count];
  if (v5 >= 2)
  {
    unint64_t v6 = v5 - 1;
    do
    {
      [v4 appendString:@", ?"];
      --v6;
    }
    while (v6);
  }
  [v4 appendString:@""]);
  id v7 = [v3 preparedStatementForQueryString:v4];
  id v8 = (sqlite3_stmt *)[v7 compiled];

  if (v8)
  {
    sqlite3_bind_text(v8, 1, (const char *)[a1[5] UTF8String], -1, 0);
    sqlite3_bind_text(v8, 2, (const char *)[a1[6] UTF8String], -1, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = a1[4];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      int v12 = 3;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          sqlite3_bind_int(v8, v12 + i, objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedIntValue", (void)v16));
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v12 += i;
      }
      while (v10);
    }

    sqlite3_step(v8);
    sqlite3_reset(v8);
  }
  uint64_t v14 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", @"setting en masse per-message sequence identifier", (void)v16);

  return v14;
}

- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v11 = -1;
  if (!v7 || (sscanf((const char *)[v7 UTF8String], "%d", &v11), v11 < 0))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = -[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:](self, "messageWithLibraryID:options:inMailbox:");
  }

  return v9;
}

- (id)messagesWithMessageIDHeader:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [[MFMessageCriterion alloc] initWithType:1 qualifier:3 expression:v4];
  [(MFMessageCriterion *)v5 setCriterionIdentifier:*MEMORY[0x1E4F606F0]];
  [(MFMailMessageLibrary *)self messagesMatchingCriterion:v5 options:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "mailbox", (void)v14);
        int v12 = [v11 store];
        [v10 setMessageStore:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)_keyForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4 mailboxAvailable:(BOOL)a5 mailboxCached:(BOOL)a6
{
  unsigned int v6 = a3 | 0x20000;
  if (!a4) {
    unsigned int v6 = a3;
  }
  if (a5) {
    v6 |= 0x40000u;
  }
  if (a6) {
    uint64_t v7 = v6 | 0x20000000;
  }
  else {
    uint64_t v7 = v6;
  }
  return (id)[MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v7];
}

- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  unint64_t v5 = [(MFMailMessageLibrary *)self messageWithLibraryID:a3 options:*(void *)&a4 inMailbox:a5 temporarilyUnavailable:0];
  return v5;
}

- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5 temporarilyUnavailable:(BOOL *)a6
{
  id v11 = a5;
  if ((a4 & 0xFC8F6040) != 0)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:4498 description:@"Unsupported option for fetching message"];
  }
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__6;
  uint64_t v44 = __Block_byref_object_dispose__6;
  id v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  os_log_type_t v33 = __Block_byref_object_copy__6;
  uint64_t v34 = __Block_byref_object_dispose__6;
  id v35 = 0;
  int v12 = [(MFMailMessageLibrary *)self database];
  id v13 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:temporarilyUnavailable:]"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke;
  uint64_t v21 = &unk_1E5D3CC98;
  unsigned int v29 = a4;
  long long v22 = self;
  uint64_t v24 = &v46;
  int64_t v28 = a3;
  uint64_t v25 = &v40;
  id v14 = v11;
  id v23 = v14;
  id v26 = &v36;
  id v27 = &v30;
  objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, &v18);

  if (*((unsigned char *)v37 + 24) && v41[5])
  {
    os_unfair_lock_lock(&self->_mailboxLock);
    -[NSCache setObject:forKey:](self->_mailboxURLsToMailboxIDs, "setObject:forKey:", v41[5], v14, v18, v19, v20, v21, v22);
    os_unfair_lock_unlock(&self->_mailboxLock);
  }
  if (a6) {
    *a6 = *((unsigned char *)v47 + 24);
  }
  id v15 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v15;
}

uint64_t __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _canSelectMessagesWithOptions:*(unsigned int *)(a1 + 88) connection:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    unint64_t v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 204);
    os_unfair_lock_lock(v5);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 216) objectForKey:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 32) _keyForOptions:*(unsigned int *)(a1 + 88) protectedDataAvailable:v4 mailboxAvailable:*(void *)(a1 + 40) != 0 mailboxCached:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 224) objectForKey:v9];
    if (!v10)
    {
      id v11 = (void *)[*(id *)(a1 + 32) _selectClauseForOptions:*(unsigned int *)(a1 + 88) protectedDataAvailable:v4];
      int v12 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 88), 0, v4);
      id v13 = joinsForTables(v12);
      id v14 = [NSString alloc];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        id v15 = @", messages.mailbox ";
      }
      else {
        id v15 = &stru_1EFF11268;
      }
      long long v16 = (void *)[v14 initWithFormat:@"%@FROM messages%s", v15, v13];
      free(v13);
      if (*(void *)(a1 + 40))
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          id v17 = [NSString alloc];
          uint64_t v18 = @" AND mailbox = ?";
        }
        else
        {
          id v17 = [NSString alloc];
          uint64_t v18 = @" AND mailbox IN (SELECT ROWID FROM mailboxes WHERE url = ?)";
        }
        uint64_t v23 = [v17 initWithFormat:@"%@ %@ WHERE messages.ROWID = ?%@ LIMIT 1", v11, v16, v18];
      }
      else
      {
        uint64_t v23 = [[NSString alloc] initWithFormat:@"%@ %@ WHERE messages.ROWID = ? LIMIT 1", v11, v16];
      }
      uint64_t v10 = (void *)v23;
      [*(id *)(*(void *)(a1 + 32) + 224) setObject:v23 forKey:v9];
    }
    os_unfair_lock_unlock(v5);
    uint64_t v24 = *(void *)(a1 + 40);
    if (v24) {
      LOBYTE(v24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v24;
    if (*(void *)(a1 + 40))
    {
      uint64_t v25 = *(void *)(a1 + 80);
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v26 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v25];
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        v45[0] = v26;
        v45[1] = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
      }
      else
      {
        id v26 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v25];
        uint64_t v29 = *(void *)(a1 + 40);
        v44[0] = v26;
        v44[1] = v29;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      }
    }
    else
    {
      id v26 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 80)];
      id v43 = v26;
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    }
    uint64_t v30 = (void *)v28;

    uint64_t v31 = [v3 preparedStatementForQueryString:v10];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke_1181;
    v37[3] = &unk_1E5D3CC70;
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v39 = *(void *)(a1 + 72);
    v37[4] = v32;
    int v41 = *(_DWORD *)(a1 + 88);
    id v33 = v3;
    id v38 = v33;
    char v42 = v4;
    int8x16_t v40 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    id v36 = 0;
    uint64_t v22 = [v31 executeWithIndexedBindings:v30 usingBlock:v37 error:&v36];
    id v34 = v36;
    if ((v22 & 1) == 0) {
      [v33 handleError:v34 message:@"Fetching message for library ID"];
    }
  }
  else
  {
    uint64_t v19 = EDLibraryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134217984;
      uint64_t v47 = v20;
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_INFO, "couldn't load message with libraryID %lld because protected data is unavailable", buf, 0xCu);
    }

    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v22 = 1;
    *(unsigned char *)(v21 + 24) = 1;
  }

  return v22;
}

void __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke_1181(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _messageForRow:v10 options:*(unsigned int *)(a1 + 72) timestamp:mach_absolute_time() connection:*(void *)(a1 + 40) isProtectedDataAvailable:*(unsigned __int8 *)(a1 + 76) recipientsCache:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v6 = [v10 objectForKeyedSubscript:@"mailbox"];
    uint64_t v7 = [v6 numberValue];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:(int64_t)a3 messageIDHash:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F60DB8] indexSet];
  uint64_t v8 = [(MFMailMessageLibrary *)self database];
  id v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:messageIDHash:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__MFMailMessageLibrary_conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID_messageIDHash___block_invoke;
  v13[3] = &unk_1E5D3CCC0;
  int64_t v15 = a3;
  id v10 = v7;
  id v14 = v10;
  int64_t v16 = a4;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v13);

  id v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v18 = a4;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Threading %lld: conversation IDs of messages in the same thread: %@", buf, 0x16u);
  }

  return v10;
}

uint64_t __98__MFMailMessageLibrary_conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID_messageIDHash___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT conversation_id FROM messages WHERE rowid IN (SELECT message FROM message_references WHERE reference IN (SELECT reference FROM message_references WHERE message = ?));"];
  id v4 = objc_claimAutoreleasedReturnValue();
  unint64_t v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(void *)(a1 + 40));
    while (sqlite3_step(v5) == 100)
    {
      sqlite3_int64 v6 = sqlite3_column_int64(v5, 0);
      if (v6) {
        [*(id *)(a1 + 32) addIndex:v6];
      }
    }
    sqlite3_reset(v5);
    [v3 checkForConnectionErrorWithMessage:@"Ref Ref Error! Ref!"];
  }
  [v3 preparedStatementForQueryString:@"SELECT conversation_id FROM messages WHERE message_id IN (SELECT reference FROM message_references WHERE message = ?);"];
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (sqlite3_stmt *)[v7 compiled];

  if (v8)
  {
    sqlite3_bind_int64(v8, 1, *(void *)(a1 + 40));
    while (sqlite3_step(v8) == 100)
    {
      sqlite3_int64 v9 = sqlite3_column_int64(v8, 0);
      if (v9) {
        [*(id *)(a1 + 32) addIndex:v9];
      }
    }
    sqlite3_reset(v8);
    [v3 checkForConnectionErrorWithMessage:@"Ref Error!"];
  }
  [v3 preparedStatementForQueryString:@"SELECT messages.conversation_id FROM message_references, messages WHERE reference IN (SELECT message_id FROM messages WHERE rowid = ?) AND messages.rowid = message_references.message;"];
  id v10 = objc_claimAutoreleasedReturnValue();
  id v11 = (sqlite3_stmt *)[v10 compiled];

  if (v11)
  {
    sqlite3_bind_int64(v11, 1, *(void *)(a1 + 40));
    while (sqlite3_step(v11) == 100)
    {
      sqlite3_int64 v12 = sqlite3_column_int64(v11, 0);
      if (v12) {
        [*(id *)(a1 + 32) addIndex:v12];
      }
    }
    sqlite3_reset(v11);
    [v3 checkForConnectionErrorWithMessage:@"Deref error!"];
  }
  if (*(void *)(a1 + 48))
  {
    [v3 preparedStatementForQueryString:@"SELECT conversation_id FROM messages WHERE message_id = ? AND rowid != ?;"];
    id v13 = objc_claimAutoreleasedReturnValue();
    id v14 = (sqlite3_stmt *)[v13 compiled];

    if (v14)
    {
      sqlite3_bind_int64(v14, 1, *(void *)(a1 + 48));
      sqlite3_bind_int64(v14, 2, *(void *)(a1 + 40));
      while (sqlite3_step(v14) == 100)
      {
        sqlite3_int64 v15 = sqlite3_column_int64(v14, 0);
        if (v15) {
          [*(id *)(a1 + 32) addIndex:v15];
        }
      }
      sqlite3_reset(v14);
      [v3 checkForConnectionErrorWithMessage:@"Message error!"];
    }
  }

  return 1;
}

- (id)_copyReferenceHashesWithoutMessagesForMessageWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sqlite3_int64 v6 = [(MFMailMessageLibrary *)self database];
  id v7 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _copyReferenceHashesWithoutMessagesForMessageWithConversation:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__MFMailMessageLibrary__copyReferenceHashesWithoutMessagesForMessageWithConversation___block_invoke;
  v13[3] = &unk_1E5D3CCE8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  id v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __86__MFMailMessageLibrary__copyReferenceHashesWithoutMessagesForMessageWithConversation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT message_references.message, reference FROM message_references LEFT OUTER JOIN messages ON reference = messages.message_id WHERE message_references.message IN (SELECT rowid FROM messages WHERE conversation_id in (SELECT conversation_id FROM messages WHERE rowid = ?)) AND messages.rowid IS NULL"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, [*(id *)(a1 + 32) libraryID]);
    while (sqlite3_step(v5) == 100)
    {
      sqlite3_int64 v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", sqlite3_column_int64(v5, 0));
      sqlite3_int64 v7 = sqlite3_column_int64(v5, 1);
      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
        if (!v8)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
        }
        [v8 addIndex:v7];
      }
    }
    sqlite3_reset(v5);
    [v3 checkForConnectionErrorWithMessage:@"Getting references that do not exist in the DB in this conversation."];
  }

  return 1;
}

- (id)_getReferencesForHashesWithOwners:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __58__MFMailMessageLibrary__getReferencesForHashesWithOwners___block_invoke;
  v10[3] = &unk_1E5D3CD10;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  sqlite3_int64 v7 = v11;
  id v8 = v6;

  return v8;
}

void __58__MFMailMessageLibrary__getReferencesForHashesWithOwners___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v16 = objc_msgSend(*(id *)(a1 + 32), "messageWithLibraryID:options:inMailbox:", objc_msgSend(a2, "longLongValue"), 6297663, 0);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  sqlite3_int64 v7 = [v16 headers];
  id v15 = [v7 references];
  [v6 addObjectsFromArray:v15];
  id v8 = [v7 firstHeaderForKey:*MEMORY[0x1E4F606C8]];
  if ([v8 length]) {
    [v6 addObject:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        uint64_t v14 = MFStringHashForMessageIDHeader();
        if (v14 && [v5 containsIndex:v14]) {
          [*(id *)(a1 + 40) addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (int64_t)loadMoreMessagesForThreadContainingMessage:(id)a3 hasNoMoreMessages:(BOOL *)a4
{
  id v6 = a3;
  sqlite3_int64 v7 = [(MFMailMessageLibrary *)self remoteStoreForMessage:v6];
  if ([v7 canFetchMessageIDs])
  {
    uint64_t v8 = -1;
    int v9 = 6;
    while (1)
    {
      if (!--v9)
      {
        int64_t v12 = v8;
        goto LABEL_19;
      }
      id v10 = [(MFMailMessageLibrary *)self _copyReferenceHashesWithoutMessagesForMessageWithConversation:v6];
      uint64_t v11 = [v10 count];
      int64_t v12 = v8;
      if (v11)
      {
        uint64_t v13 = [(MFMailMessageLibrary *)self _getReferencesForHashesWithOwners:v10];
        uint64_t v14 = [v7 fetchMessagesWithMessageIDs:v13 andSetFlags:0x100000];
        if (v14 <= 0) {
          int64_t v12 = v8;
        }
        else {
          int64_t v12 = v14 + (v8 & ~(v8 >> 63));
        }
      }
      if (v8 == v12 && a4) {
        break;
      }

      if (v11)
      {
        if (v12 <= 49)
        {
          BOOL v15 = v8 == v12;
          uint64_t v8 = v12;
          if (!v15) {
            continue;
          }
        }
      }
      goto LABEL_19;
    }
    *a4 = 1;
  }
  else
  {
    int64_t v12 = -1;
  }
LABEL_19:

  return v12;
}

- (void)reloadMailboxCacheWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pazResult = (char **)0xAAAAAAAAAAAAAAAALL;
  int table = sqlite3_get_table((sqlite3 *)objc_msgSend(v4, "sqlDB", 0xAAAAAAAAAAAAAAAALL), "SELECT ROWID, url FROM mailboxes", &pazResult, (int *)&v12 + 1, (int *)&v12, 0);
  [v4 checkForConnectionErrorWithMessage:@"selecting mailbox URLs"];
  if (!table)
  {
    for (int i = HIDWORD(v12); HIDWORD(v12); --HIDWORD(v12))
    {
      uint64_t v8 = &pazResult[2 * i];
      uint64_t v9 = atoll(*v8);
      id v10 = [NSString stringWithUTF8String:v8[1]];
      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v9];
      [v5 setObject:v10 forKeyedSubscript:v11];

      int i = HIDWORD(v12) - 1;
    }
    _MFLockGlobalLock();
    objc_storeStrong((id *)&self->_mailboxCache, v5);
    _MFUnlockGlobalLock();
  }
  sqlite3_free_table(pazResult);
}

uint64_t __40__MFMailMessageLibrary_urlForMailboxID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT url FROM mailboxes WHERE ROWID = ?;"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, a1[6]);
    if (sqlite3_step(v5) == 100)
    {
      id v6 = sqlite3_column_text(v5, 0);
      if (v6)
      {
        uint64_t v7 = [[NSString alloc] initWithUTF8String:v6];
        uint64_t v8 = *(void *)(a1[5] + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        if (*(void *)(*(void *)(a1[5] + 8) + 40))
        {
          _MFLockGlobalLock();
          uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
          uint64_t v11 = *(void **)(a1[4] + 32);
          uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a1[6]];
          [v11 setObject:v10 forKeyedSubscript:v12];

          _MFUnlockGlobalLock();
        }
      }
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (id)mailboxURLsForIDs:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = self;
  id v44 = v42;
  id v45 = v4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v44 count])
  {
    if (v5->_mailboxCache)
    {
      _MFLockGlobalLock();
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v7 = v44;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v55 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            uint64_t v12 = [(NSMutableDictionary *)v5->_mailboxCache objectForKeyedSubscript:v11];
            if (v12)
            {
              uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
              [v6 setObject:v13 forKeyedSubscript:v11];
            }
            else
            {
              [v45 addObject:v11];
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
        }
        while (v8);
      }

      _MFUnlockGlobalLock();
    }
    else
    {
      [v45 addObjectsFromArray:v44];
    }
  }

  if ([v45 count])
  {
    uint64_t v14 = v5;
    id v43 = v45;
    BOOL v15 = objc_msgSend(v43, "ef_map:", &__block_literal_global_2640);
    int64_t v16 = NSString;
    long long v17 = [v15 componentsJoinedByString:@", "];
    long long v18 = [v16 stringWithFormat:@"SELECT ROWID, url FROM mailboxes WHERE ROWID IN (%@);", v17];

    long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v20 = [v14 database];
    uint64_t v21 = [NSString stringWithUTF8String:"readMailboxURLStringsFromDatabase"];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __readMailboxURLStringsFromDatabase_block_invoke_2;
    v60[3] = &unk_1E5D3CCE8;
    id v22 = v18;
    id v61 = v22;
    id v23 = v19;
    id v62 = v23;
    objc_msgSend(v20, "__performReadWithCaller:usingBlock:", v21, v60);

    uint64_t v24 = v62;
    id v25 = v23;

    if ([v25 count])
    {
      if (v14[4])
      {
        _MFLockGlobalLock();
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v51 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              uint64_t v31 = [v26 objectForKeyedSubscript:v30];
              [v14[4] setObject:v31 forKeyedSubscript:v30];
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v27);
        }

        _MFUnlockGlobalLock();
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v32 = v25;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v47;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v46 + 1) + 8 * k);
            uint64_t v37 = (void *)MEMORY[0x1E4F1CB10];
            id v38 = [v32 objectForKeyedSubscript:v36];
            uint64_t v39 = [v37 URLWithString:v38];
            [v6 setObject:v39 forKeyedSubscript:v36];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
        }
        while (v33);
      }
    }
  }
  else
  {
    uint64_t v40 = [v6 count];
    if (v40 != [v44 count]) {
      __assert_rtn("-[MFMailMessageLibrary mailboxURLsForIDs:]", "MailMessageLibrary.m", 4885, "urlsByID.count == mailboxIDs.count");
    }
  }

  return v6;
}

uint64_t __64__MFMailMessageLibrary_mailboxIDForURLString_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));

  return 1;
}

uint64_t __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT rowid FROM mailboxes WHERE url = ?;"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
    if (sqlite3_step(v5) == 100)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v5, 0);
      if (*(void *)(*(void *)(a1 + 40) + 32))
      {
        _MFLockGlobalLock();
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(void **)(*(void *)(a1 + 40) + 32);
        uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        [v7 setObject:v6 forKeyedSubscript:v8];

        _MFUnlockGlobalLock();
      }
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (id)remoteStoreForMessage:(id)a3
{
  id v3 = [(MFMailMessageLibrary *)self mailboxUidForMessage:a3];
  id v4 = [v3 account];
  id v5 = [v4 storeForMailboxUid:v3];

  return v5;
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)clearServerSearchFlagsForMessagesWithLibraryIDs:(id)a3
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(MFMailMessageLibrary *)self database];
  id v7 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary clearServerSearchFlagsForMessagesWithLibraryIDs:]"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke;
  BOOL v15 = &unk_1E5D3CC48;
  id v8 = v4;
  id v16 = v8;
  id v9 = v5;
  id v17 = v9;
  long long v18 = self;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v12);

  if (objc_msgSend(v9, "count", v12, v13, v14, v15))
  {
    v19[0] = @"MessageIsServerSearchResult";
    v19[1] = @"MessageIsThreadSearchResult";
    v20[0] = @"NO";
    v20[1] = @"NO";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v11 = [(MFMailMessageLibrary *)self setFlagsFromDictionary:v10 forMessages:v9];
  }
}

uint64_t __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
  id v5 = (void *)[[NSString alloc] initWithFormat:@"SELECT ROWID FROM messages WHERE (ROWID IN (%@)) AND (flags & %llu != 0)", v4, 1048704];
  uint64_t v6 = [v3 preparedStatementForQueryString:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke_2;
  v10[3] = &unk_1E5D3CDB0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  [v6 executeUsingBlock:v10 error:0];

  return 1;
}

void __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = [a2 objectAtIndexedSubscript:0];
  id v4 = objc_msgSend(v3, "messageWithLibraryID:options:inMailbox:", objc_msgSend(v5, "databaseIDValue"), 0, 0);
  [v2 addObject:v4];
}

- (void)scheduleRecurringActivity
{
  [(MFMailMessageLibrary *)self _schedulePeriodicStatisticsLogging];
  [(MFMailMessageLibrary *)self _scheduleIncrementalVacuum];
}

- (void)addPostMigrationStep:(Class)a3
{
  id v4 = [(MFMailMessageLibrary *)self database];
  [v4 addPostMigrationStep:a3];
}

- (unint64_t)flagsForConversationId:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v4 = [(MFMailMessageLibrary *)self database];
  id v5 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary flagsForConversationId:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MFMailMessageLibrary_flagsForConversationId___block_invoke;
  v8[3] = &unk_1E5D3CDD8;
  void v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__MFMailMessageLibrary_flagsForConversationId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT flags FROM conversations WHERE conversation_id = ?"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(void *)(a1 + 40));
    if (sqlite3_step(v5) == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(v5, 0);
    }
    sqlite3_reset(v5);
    [v3 checkForConnectionErrorWithMessage:@"fetching conversation flags"];
  }

  return 1;
}

- (void)setFlags:(unint64_t)a3 forConversationId:(int64_t)a4
{
  unint64_t v6 = [(MFMailMessageLibrary *)self database];
  id v7 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setFlags:forConversationId:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MFMailMessageLibrary_setFlags_forConversationId___block_invoke;
  v8[3] = &__block_descriptor_48_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  void v8[4] = a3;
  v8[5] = a4;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v8);
}

uint64_t __51__MFMailMessageLibrary_setFlags_forConversationId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"UPDATE conversations SET flags = ? WHERE conversation_id = ?"];
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(void *)(a1 + 32));
    sqlite3_bind_int64(v5, 2, *(void *)(a1 + 40));
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  uint64_t v6 = [v3 checkForConnectionErrorWithMessage:@"setting conversation flags"];

  return v6;
}

- (int64_t)_conversationIdForMessageIds:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v5 = &stru_1EFF11268;
  uint64_t v6 = [v4 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = &stru_1EFF11268; ; uint64_t i = (__CFString *)v13)
    {
      id v5 = [(__CFString *)i stringByAppendingFormat:@"%lld", v6];

      uint64_t v6 = [v4 indexGreaterThanIndex:v6];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = [(__CFString *)v5 stringByAppendingString:@","];
    }
  }
  id v7 = [(MFMailMessageLibrary *)self database];
  uint64_t v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _conversationIdForMessageIds:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __53__MFMailMessageLibrary__conversationIdForMessageIds___block_invoke;
  void v14[3] = &unk_1E5D3CC20;
  uint64_t v9 = v5;
  BOOL v15 = v9;
  id v16 = &v17;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v14);

  int64_t v10 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __53__MFMailMessageLibrary__conversationIdForMessageIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NSString stringWithFormat:@"SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE message_id IN (%@)", *(void *)(a1 + 32)];
  id v5 = [v3 preparedStatementForQueryString:v4];
  uint64_t v6 = (sqlite3_stmt *)[v5 compiled];

  if (v6)
  {
    if (sqlite3_step(v6) == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(v6, 0);
    }
    sqlite3_reset(v6);
    [v3 checkForConnectionErrorWithMessage:@"finding conversation id"];
  }

  return 1;
}

- (id)storedIntegerPropertyWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailMessageLibrary *)self _integerForQuery:@"SELECT value FROM properties WHERE key = ?" withTextArgument:v4];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5];

  return v6;
}

- (void)setStoredIntegerPropertyWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MFMailMessageLibrary *)self database];
  uint64_t v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setStoredIntegerPropertyWithName:value:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MFMailMessageLibrary_setStoredIntegerPropertyWithName_value___block_invoke;
  void v12[3] = &unk_1E5D3CCE8;
  id v10 = v7;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);
}

uint64_t __63__MFMailMessageLibrary_setStoredIntegerPropertyWithName_value___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    id v5 = [v3 preparedStatementForQueryString:@"INSERT OR REPLACE INTO properties (key, value) VALUES (?,?)"];
    id v6 = (sqlite3_stmt *)[v5 compiled];

    sqlite3_bind_text(v6, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    sqlite3_bind_int(v6, 2, [*(id *)(a1 + 32) unsignedIntValue]);
  }
  else
  {
    [v3 preparedStatementForQueryString:@"DELETE FROM properties WHERE key = ?"];
    id v7 = objc_claimAutoreleasedReturnValue();
    id v6 = (sqlite3_stmt *)[v7 compiled];

    sqlite3_bind_text(v6, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  }
  sqlite3_step(v6);
  sqlite3_reset(v6);
  uint64_t v8 = @"updating";
  if (!*(void *)(a1 + 32)) {
    uint64_t v8 = @"deleting";
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@ property %@", v8, *(void *)(a1 + 40)];
  uint64_t v10 = [v4 checkForConnectionErrorWithMessage:v9];

  return v10;
}

- (void)_notifyDidCompact:(BOOL)a3 messages:(id)a4 mailboxes:(id)a5
{
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = &MailMessageStoreMessagesCompacted;
  if (!v6) {
    uint64_t v9 = MailMessageStoreMessagesWillBeCompacted;
  }
  uint64_t v10 = *v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:@"messages"];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"mailboxes"];
  }
  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:v10 object:self userInfo:v11];
}

- (void)compactMessages:(id)a3
{
}

- (void)compactMessages:(id)a3 permanently:(BOOL)a4
{
}

- (void)compactMessages:(id)a3 permanently:(BOOL)a4 notifyPersistence:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = +[MFActivityMonitor currentMonitor];
  [v7 addReason:@"MonitoredActivityReasonCompacting"];

  double Current = CFAbsoluteTimeGetCurrent();
  id v28 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = v25;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
  BOOL v24 = v5;
  id v11 = 0;
  if (v10)
  {
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        BOOL v15 = (void *)MEMORY[0x1AD0E3E00]();
        id v16 = [(MFMailMessageLibrary *)self mailboxUidForMessage:v14];
        if (v16)
        {
          if (!v11)
          {
            id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
          }
          objc_msgSend(v11, "ef_addObjectIfAbsent:", v16);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v10);
  }

  [(MFMailMessageLibrary *)self _notifyDidCompact:0 messages:v9 mailboxes:v11];
  [(MFMailMessageLibrary *)self removeSearchableItemsForMessages:v9];
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  long long v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v49 = [v9 count];
  v45[0] = 0;
  v45[1] = v45;
  void v45[2] = 0x2020000000;
  v45[3] = 0xAAAAAAAAAAAAAAAALL;
  id v29 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 1;
  while (v51[3] < (unint64_t)v47[3])
  {
    uint64_t v17 = [(MFMailMessageLibrary *)self database];
    long long v18 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary compactMessages:permanently:notifyPersistence:]"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __70__MFMailMessageLibrary_compactMessages_permanently_notifyPersistence___block_invoke;
    v30[3] = &unk_1E5D3CE20;
    BOOL v40 = a4;
    id v31 = v28;
    uint64_t v36 = v45;
    uint64_t v37 = &v41;
    id v38 = &v50;
    uint64_t v39 = &v46;
    id v32 = v9;
    id v19 = v27;
    id v33 = v19;
    id v34 = v29;
    id v35 = self;
    objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v30);

    [v19 removeAllObjects];
    if (!*((unsigned char *)v42 + 24)) {
      goto LABEL_19;
    }
  }
  if (v24)
  {
    uint64_t v20 = [(MFMailMessageLibrary *)self hookRegistry];
    [v20 persistenceDidDeleteMessages:v9 generationWindow:v28];
  }
  [(MFMailMessageLibrary *)self _removeSearchableItemsWithLibraryIDs:v29];
  [(MFMailMessageLibrary *)self cleanupProtectedTables];
  [(MFMailMessageLibrary *)self _notifyDidCompact:1 messages:v9 mailboxes:v11];
LABEL_19:
  uint64_t v21 = EDLibraryLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v47[3];
    CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134218240;
    uint64_t v59 = v22;
    __int16 v60 = 2048;
    CFAbsoluteTime v61 = v23 - Current;
    _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "Compacted %lu messages (%f seconds)", buf, 0x16u);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

BOOL __70__MFMailMessageLibrary_compactMessages_permanently_notifyPersistence___block_invoke(uint64_t a1, void *a2)
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v30 = v3;
  if (*(unsigned char *)(a1 + 104))
  {
    id v31 = 0;
  }
  else
  {
    id v31 = [v3 preparedStatementForQueryString:@"UPDATE pop_uids SET flags = ? WHERE mailbox = ? AND uid = ?"];
  }
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v4, "transactionGeneration"));
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    BOOL v5 = 0;
    BOOL v6 = 0;
    unint64_t v32 = *MEMORY[0x1E4F60958];
    while (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) < *(void *)(*(void *)(*(void *)(a1 + 96)
                                                                                                + 8)
                                                                                    + 24))
    {
      id v7 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
      [v33 addObject:v7];
      uint64_t v8 = [v7 libraryID];
      id v9 = *(void **)(a1 + 48);
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v8];
      id v11 = [v10 stringValue];
      [v9 addObject:v11];

      [*(id *)(a1 + 56) addIndex:v8];
      if (!v5)
      {
        uint64_t v12 = [v7 account];
        id v13 = [v12 personaIdentifier];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          BOOL v5 = 0;
        }
        else
        {
          BOOL v15 = [v7 account];
          BOOL v5 = [v15 personaIdentifier];
        }
      }
      if (*(unsigned char *)(a1 + 104))
      {
        id v16 = v6;
      }
      else
      {
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "messageFlags"));
        v39[0] = v17;
        long long v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v7, "originalMailboxID"));
        v39[1] = v18;
        id v19 = [v7 remoteID];
        v39[2] = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
        id v34 = v6;
        char v21 = [v31 executeWithIndexedBindings:v20 usingBlock:0 error:&v34];
        id v16 = v34;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v21;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          [v30 handleError:v16 message:@"Clearing flags in pop_uids"];
        }
      }
      BOOL v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) < v32;

      if (v22)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        BOOL v6 = v16;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          continue;
        }
      }
      goto LABEL_20;
    }
    id v16 = v6;
  }
  else
  {
    id v16 = 0;
    BOOL v5 = 0;
  }
LABEL_20:
  CFAbsoluteTime v23 = [*(id *)(a1 + 64) hookRegistry];
  [v23 persistenceWillDeleteMessages:v33];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 64) _deleteMessages:v33 connection:v30];
  BOOL v24 = +[MFMailMessageLibrary log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v33 count];
    int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v36 = v25;
    __int16 v37 = 1024;
    int v38 = v26;
    _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Deleting %lu messages succeeded: %{BOOL}d", buf, 0x12u);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v27 = [*(id *)(a1 + 64) hookRegistry];
    [v27 persistenceIsDeletingMessages:v33 generationWindow:*(void *)(a1 + 32)];

    BOOL v28 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)_deleteMessages:(id)a3 connection:(id)a4
{
  id v7 = a3;
  uint64_t v30 = v7;
  id v31 = a4;
  unint64_t v8 = [v7 count];
  if (v8 > *MEMORY[0x1E4F60958])
  {
    BOOL v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"MailMessageLibrary.m", 5234, @"Invalid parameter not satisfying: %@", @"messages.count <= EDMessageBatchSize" object file lineNumber description];
  }
  id v29 = objc_msgSend(v7, "ef_map:", &__block_literal_global_1287);
  id v9 = [v29 componentsJoinedByString:@","];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT sender, subject, summary, brand_indicator FROM messages WHERE ROWID IN (%@)", v9];
  id v11 = self;
  uint64_t v12 = [v31 preparedStatementForQueryString:v10];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke_2;
  id v33[3] = &unk_1E5D3CE68;
  id v13 = v27;
  id v34 = v13;
  id v14 = v26;
  id v35 = v14;
  id v15 = v25;
  id v36 = v15;
  id v16 = v28;
  id v37 = v16;
  id v32 = 0;
  char v17 = [v12 executeUsingBlock:v33 error:&v32];
  id v18 = v32;
  if ((v17 & 1) == 0)
  {
    char v21 = v31;
    [v31 handleError:v18 message:@"Fetching messages to delete"];
LABEL_8:
    BOOL v22 = 0;
    goto LABEL_9;
  }
  id v19 = v11;
  uint64_t v20 = v11;
  char v21 = v31;
  if (![(MFMailMessageLibrary *)v20 _addAddressesFromRecipientsForMessages:v9 toSet:v13 connection:v31]|| ![(MFMailMessageLibrary *)v19 _deleteMessages:v9 andCleanUpAddresses:v13 subjects:v14 summaries:v15 brandIndicators:v16 connection:v31])
  {
    goto LABEL_8;
  }
  [(MFMailMessageLibrary *)v19 _removeGlobalDataForMessagesIfNecessary:v30 connection:v31];
  BOOL v22 = 1;
LABEL_9:

  return v22;
}

id __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v2, "libraryID"));
  id v4 = [v3 stringValue];

  return v4;
}

void __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke_2(id *a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if (v4) {
    [a1[4] addObject:v4];
  }
  BOOL v5 = [v11 objectAtIndexedSubscript:1];
  BOOL v6 = [v5 stringValue];

  if (v6) {
    [a1[5] addObject:v6];
  }
  id v7 = [v11 objectAtIndexedSubscript:2];
  unint64_t v8 = [v7 stringValue];

  if (v8) {
    [a1[6] addObject:v8];
  }
  id v9 = [v11 objectAtIndexedSubscript:3];
  uint64_t v10 = [v9 stringValue];

  if (v10) {
    [a1[7] addObject:v10];
  }
}

- (BOOL)_addAddressesFromRecipientsForMessages:(id)a3 toSet:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT DISTINCT address FROM recipients WHERE message IN (%@)", v7];
    id v11 = [v9 preparedStatementForQueryString:v10];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__MFMailMessageLibrary__addAddressesFromRecipientsForMessages_toSet_connection___block_invoke;
    v16[3] = &unk_1E5D3C5E8;
    id v17 = v8;
    id v15 = 0;
    char v12 = [v11 executeUsingBlock:v16 error:&v15];
    id v13 = v15;
    if ((v12 & 1) == 0) {
      [v9 handleError:v13 message:@"Fetching recipient addresses for messages"];
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

void __80__MFMailMessageLibrary__addAddressesFromRecipientsForMessages_toSet_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (BOOL)_deleteMessages:(id)a3 andCleanUpAddresses:(id)a4 subjects:(id)a5 summaries:(id)a6 brandIndicators:(id)a7 connection:(id)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v35 = a6;
  id v17 = a7;
  id v18 = a8;
  id v33 = v14;
  id v34 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM messages WHERE ROWID IN (%@)", v14];
  if (objc_msgSend(v18, "executeStatementString:errorMessage:"))
  {
    id v31 = [(MFMailMessageLibrary *)self _existingValuesForColumn:@"sender" table:@"messages" fromValues:v15 connection:v18];
    objc_msgSend(v15, "minusSet:");
    id v32 = [(MFMailMessageLibrary *)self _existingValuesForColumn:@"address" table:@"recipients" fromValues:v15 connection:v18];
    objc_msgSend(v15, "minusSet:");
    BOOL v30 = [(MFMailMessageLibrary *)self _deleteRows:v15 fromTable:@"addresses" connection:v18];
    id v19 = [(MFMailMessageLibrary *)self persistence];
    uint64_t v20 = [v19 businessPersistence];
    [v20 addressIDsWereDeleted:v15 connection:v18];

    char v21 = [(MFMailMessageLibrary *)self _existingValuesForColumn:@"subject" table:@"messages" fromValues:v16 connection:v18];
    [v16 minusSet:v21];
    BOOL v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v16;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Deleting subjectID set: %{public}@", buf, 0xCu);
    }

    BOOL v23 = [(MFMailMessageLibrary *)self _deleteRows:v16 fromTable:@"subjects" connection:v18];
    BOOL v24 = [(MFMailMessageLibrary *)self _existingValuesForColumn:@"summary" table:@"messages" fromValues:v35 connection:v18];
    [v35 minusSet:v24];
    BOOL v25 = [(MFMailMessageLibrary *)self _deleteRows:v35 fromTable:@"summaries" connection:v18];
    id v26 = [(MFMailMessageLibrary *)self _existingValuesForColumn:@"brand_indicator" table:@"messages" fromValues:v17 connection:v18];
    [v17 minusSet:v26];
    BOOL v27 = [(MFMailMessageLibrary *)self _deleteRows:v17 fromTable:@"brand_indicators" connection:v18];

    BOOL v28 = v27 && v25 && v23 && v30;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (void)_removeGlobalDataForMessagesIfNecessary:(id)a3 connection:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v39 = a4;
  BOOL v40 = objc_msgSend(MEMORY[0x1E4F60E10], "transactionWithDescription:", @"Transaction for removing files after compaction", v5);
  BOOL v6 = objc_opt_new();
  uint64_t v43 = objc_opt_new();
  char v44 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        char v12 = [v11 account];
        uint64_t v13 = [v11 globalMessageID];
        id v14 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
        [v6 addObject:v14];

        id v15 = [v12 personaIdentifier];

        if (v15)
        {
          id v16 = [v7 objectForKeyedSubscript:v12];
          if (!v16)
          {
            id v16 = objc_opt_new();
            [v7 setObject:v16 forKeyedSubscript:v12];
          }
          id v17 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
          [v16 addObject:v17];
        }
        else if ([v12 supportsPurge])
        {
          id v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
          [v43 addObject:v16];
        }
        else
        {
          id v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
          [v44 addObject:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v8);
  }

  id v18 = objc_opt_new();
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  void v54[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke;
  v54[3] = &unk_1E5D3CEE0;
  id v19 = v39;
  id v55 = v19;
  long long v56 = self;
  id v20 = v7;
  id v57 = v20;
  id v21 = v43;
  id v58 = v21;
  id v22 = v44;
  id v59 = v22;
  id v23 = v18;
  id v60 = v23;
  [v6 enumerateObjectsUsingBlock:v54];
  uint64_t v38 = v20;
  if ([v23 count])
  {
    id v37 = objc_opt_new();
    uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"generated_summary" table:@"message_global_data"];
    BOOL v24 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    BOOL v25 = [v23 allObjects];
    id v26 = [v24 in:v25];
    [v41 setWhere:v26];

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    void v52[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_5;
    v52[3] = &unk_1E5D3C5E8;
    id v27 = v37;
    id v53 = v27;
    [v19 executeSelectStatement:v41 withBlock:v52 error:0];
    BOOL v28 = [MEMORY[0x1E4F60B40] generatedSummariesTableName];
    [(MFMailMessageLibrary *)self _deleteRows:v27 fromTable:v28 connection:v19];

    id v29 = [MEMORY[0x1E4F60B40] messageGlobalDataTableName];
    [(MFMailMessageLibrary *)self _deleteRows:v23 fromTable:v29 connection:v19];
  }
  BOOL v30 = self->_path;
  fileRemovalAfterCompactionScheduler = self->_fileRemovalAfterCompactionScheduler;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  void v46[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_6;
  v46[3] = &unk_1E5D3CF78;
  id v32 = v21;
  id v47 = v32;
  uint64_t v48 = v30;
  id v33 = v22;
  id v49 = v33;
  id v34 = v38;
  id v50 = v34;
  id v35 = v40;
  id v51 = v35;
  id v36 = v30;
  [(EFScheduler *)fileRemovalAfterCompactionScheduler performBlock:v46];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"mailbox" table:@"messages"];
  id v5 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  BOOL v6 = [v5 equalTo:v3];
  [v4 setWhere:v6];

  id v7 = objc_opt_new();
  uint64_t v8 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_2;
  void v20[3] = &unk_1E5D3C5E8;
  id v9 = v7;
  id v21 = v9;
  [v8 executeSelectStatement:v4 withBlock:v20 error:0];
  if ([v9 count])
  {
    uint64_t v10 = objc_opt_new();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_3;
    void v18[3] = &unk_1E5D3CE90;
    void v18[4] = *(void *)(a1 + 40);
    id v11 = v10;
    id v19 = v11;
    [v9 enumerateObjectsUsingBlock:v18];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_4;
    v13[3] = &unk_1E5D3CEB8;
    id v14 = *(id *)(a1 + 48);
    id v15 = v3;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    [v11 enumerateObjectsUsingBlock:v13];
  }
  else
  {
    char v12 = *(void **)(a1 + 72);
    id v11 = [v3 stringValue];
    [v12 addObject:v11];
  }
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  [v2 addObject:v3];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "urlForMailboxID:", objc_msgSend(v6, "longLongValue"));
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];
  id v5 = [v4 account];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 personaIdentifier];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    int v5 = [v7 supportsPurge];
    uint64_t v6 = 56;
    if (v5) {
      uint64_t v6 = 48;
    }
    [*(id *)(a1 + v6) removeObject:*(void *)(a1 + 40)];
  }
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_6(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_7;
  v9[3] = &unk_1E5D3CF08;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v9];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_8;
  id v7 = &unk_1E5D3CF08;
  id v3 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:&v4];
  objc_msgSend(*(id *)(a1 + 56), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1323, v4, v5, v6, v7);
  [*(id *)(a1 + 64) invalidate];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_7(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F60B30], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v5, "longLongValue"), *(void *)(a1 + 32), 1);
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:v3 error:0];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F60B30], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v5, "longLongValue"), *(void *)(a1 + 32), 0);
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:v3 error:0];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = [v4 supportsPurge];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_10;
  v8[3] = &unk_1E5D3CF50;
  id v7 = v4;
  id v9 = v7;
  char v10 = v6;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F60B30];
  id v9 = v3;
  uint64_t v5 = [v3 longLongValue];
  char v6 = [*(id *)(a1 + 32) path];
  id v7 = [v4 messageDataDirectoryURLForGlobalMessageID:v5 basePath:v6 purgeable:*(unsigned __int8 *)(a1 + 40)];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:v7 error:0];
}

- (id)_existingValuesForColumn:(id)a3 table:(id)a4 fromValues:(id)a5 connection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  if ([v11 count])
  {
    id v14 = [NSString alloc];
    id v15 = [v11 allObjects];
    id v16 = [v15 componentsJoinedByString:@","];
    id v17 = (void *)[v14 initWithFormat:@"SELECT DISTINCT %@ FROM %@ WHERE %@ IN (%@)", v9, v10, v9, v16];

    id v18 = [v12 preparedStatementForQueryString:v17];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__MFMailMessageLibrary__existingValuesForColumn_table_fromValues_connection___block_invoke;
    void v26[3] = &unk_1E5D3C5E8;
    id v19 = v13;
    id v27 = v19;
    id v25 = 0;
    char v20 = [v18 executeUsingBlock:v26 error:&v25];
    id v21 = v25;
    if ((v20 & 1) == 0) {
      [v12 handleError:v21 message:@"Fetching value"];
    }
    id v22 = v27;
    id v23 = v19;
  }
  return v13;
}

void __77__MFMailMessageLibrary__existingValuesForColumn_table_fromValues_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (int64_t)_maxRowIDInSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    int64_t v6 = 0x8000000000000000;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "longLongValue", (void)v10);
        if (v8 > v6) {
          int64_t v6 = v8;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = 0x8000000000000000;
  }

  return v6;
}

- (BOOL)_deleteRows:(id)a3 fromTable:(id)a4 connection:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [NSString alloc];
    long long v12 = [v8 allObjects];
    long long v13 = [v12 componentsJoinedByString:@","];
    id v14 = (void *)[v11 initWithFormat:@"DELETE FROM %@ WHERE ROWID IN (%@)", v9, v13];

    [v10 executeStatementString:v14 errorMessage:@"Deleting rows"];
    int64_t v15 = [(MFMailMessageLibrary *)self _maxRowIDInSet:v8];
    id v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v9;
      __int16 v21 = 2048;
      int64_t v22 = v15;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "Update largest_deleted_rowid for %{public}@ to %lld", buf, 0x16u);
    }

    char v17 = [MEMORY[0x1E4F60C88] updateLargestDeletedRowID:v15 forTableName:v9 withConnection:v10];
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)compactMailbox:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MFActivityMonitor currentMonitor];
  [v5 addReason:@"MonitoredActivityReasonCompacting"];

  int64_t v6 = +[MFMessageCriterion messageIsDeletedCriterion:1];
  id v7 = +[MFMessageCriterion criterionForMailboxURL:v4];
  v25[0] = v7;
  v25[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v9 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v8];

  id v10 = [(MFMailMessageLibrary *)self messagesMatchingCriterion:v9 options:0];
  uint64_t v11 = +[MailAccount mailboxUidFromActiveAccountsForURL:v4];
  long long v12 = (void *)v11;
  if (v11)
  {
    uint64_t v24 = v11;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  }
  else
  {
    long long v13 = 0;
  }
  if ([v10 count])
  {
    [(MFMailMessageLibrary *)self _notifyDidCompact:0 messages:v10 mailboxes:v13];
    [(MFMailMessageLibrary *)self removeSearchableItemsForMessages:v10];
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v14 = objc_opt_new();
    uint64_t v15 = *MEMORY[0x1E4F60958];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__MFMailMessageLibrary_compactMailbox___block_invoke;
    v17[3] = &unk_1E5D3CFC8;
    v17[4] = self;
    id v19 = &v20;
    id v16 = v14;
    id v18 = v16;
    objc_msgSend(v10, "ef_enumerateObjectsInBatchesOfSize:block:", v15, v17);
    if (*((unsigned char *)v21 + 24))
    {
      [(MFMailMessageLibrary *)self cleanupProtectedTables];
      [(MFMailMessageLibrary *)self _notifyDidCompact:1 messages:v16 mailboxes:v13];
    }

    _Block_object_dispose(&v20, 8);
  }
}

void __39__MFMailMessageLibrary_compactMailbox___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  int64_t v6 = [*(id *)(a1 + 32) database];
  id v7 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary compactMailbox:]_block_invoke"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __39__MFMailMessageLibrary_compactMailbox___block_invoke_2;
  v10[3] = &unk_1E5D3CFA0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  void v10[4] = v8;
  id v9 = v5;
  id v11 = v9;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v10);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 40) addObjectsFromArray:v9];
  }
  else {
    *a3 = 1;
  }
}

uint64_t __39__MFMailMessageLibrary_compactMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _deleteMessages:*(void *)(a1 + 40) connection:v3];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v4;
}

- (BOOL)renameMailboxes:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 0;
  uint64_t v9 = [v6 count];
  if (v9 == [v7 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = [(MFMailMessageLibrary *)self database];
    uint64_t v12 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary renameMailboxes:to:]"];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __43__MFMailMessageLibrary_renameMailboxes_to___block_invoke;
    __int16 v21 = &unk_1E5D3CFF0;
    id v13 = v8;
    id v22 = v13;
    id v23 = v6;
    id v27 = &v28;
    id v24 = v7;
    id v25 = self;
    id v14 = v10;
    id v26 = v14;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, &v18);

    if (objc_msgSend(v14, "count", v18, v19, v20, v21))
    {
      uint64_t v15 = [(MFMailMessageLibrary *)self hookRegistry];
      [v15 persistenceDidDeleteAllMessagesInMailboxesWithURLs:v14 generationWindow:v13];
    }
    BOOL v16 = *((_DWORD *)v29 + 6) == 0;
  }
  else
  {
    BOOL v16 = 0;
    *((_DWORD *)v29 + 6) = 1;
  }
  _Block_object_dispose(&v28, 8);

  return v16;
}

BOOL __43__MFMailMessageLibrary_renameMailboxes_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  uint64_t v4 = (sqlite3 *)[v3 sqlDB];
  uint64_t v5 = [*(id *)(a1 + 40) count];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    do
    {
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        break;
      }
      id v7 = [*(id *)(a1 + 40) objectAtIndex:v6];
      id v8 = [*(id *)(a1 + 48) objectAtIndex:v6];
      uint64_t v9 = [v8 UTF8String];
      id v10 = v7;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "UPDATE mailboxes SET url = '%q' WHERE url = '%q';",
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      v9,
                                                                      [v10 UTF8String]);
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 19)
      {
        id v11 = v8;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "DELETE FROM mailboxes WHERE url = '%q'", 0, 0, 0, [v11 UTF8String]);
        [v3 checkForConnectionErrorWithMessage:@"deleting mailbox URL"];
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];
          id v13 = [*(id *)(a1 + 56) hookRegistry];
          [v13 persistenceIsDeletingAllMessagesInMailboxWithURL:v12 generationWindow:*(void *)(a1 + 32)];

          [*(id *)(a1 + 64) addObject:v12];
          *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "UPDATE mailboxes SET url = '%q' WHERE url = '%q';",
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          [v11 UTF8String], objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
          [v3 checkForConnectionErrorWithMessage:@"renaming mailbox"];
        }
      }
      else
      {
        [v3 checkForConnectionErrorWithMessage:@"renaming mailbox"];
      }

      --v6;
    }
    while (v6 != -1);
  }
  [*(id *)(a1 + 56) reloadMailboxCacheWithConnection:v3];
  BOOL v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;

  return v14;
}

- (void)deleteMailboxes:(id)a3 account:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:](self, "removeAllMessagesFromMailbox:removeMailbox:andNotify:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 1, 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllMessagesFromMailbox:(id)a3 removeMailbox:(BOOL)a4 andNotify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = +[MFActivityMonitor currentMonitor];
  [v9 addReason:@"MonitoredActivityReasonCompacting"];

  long long v10 = +[MFMessageCriterion criterionForMailboxURL:v8];
  long long v11 = [(MFMailMessageLibrary *)self messagesMatchingCriterion:v10 options:0];
  id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
  long long v12 = +[MailAccount mailboxUidFromActiveAccountsForURL:v8];
  if (v12) {
    [(MFMailMessageLibrary *)self removeSearchableItemsForMailbox:v12];
  }
  if ([v11 count])
  {
    if (v12)
    {
      v43[0] = v12;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      if (v5) {
        -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 0, v11);
      }
    }
    else
    {
      id v26 = 0;
    }
    BOOL v23 = v5;
    id v25 = [(MFMailMessageLibrary *)self hookRegistry];
    id v13 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    id v24 = v10;
    uint64_t v14 = [v11 count];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    uint64_t v16 = *MEMORY[0x1E4F60958];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke;
    v30[3] = &unk_1E5D3D040;
    void v30[4] = self;
    id v17 = v15;
    id v31 = v17;
    id v34 = &v38;
    id v35 = v37;
    uint64_t v36 = v14;
    id v18 = v25;
    id v32 = v18;
    id v19 = v27;
    id v33 = v19;
    objc_msgSend(v11, "ef_enumerateObjectsInBatchesOfSize:block:", v16, v30);
    long long v10 = v24;
    if (*((unsigned char *)v39 + 24))
    {
      id v42 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      [v18 persistenceDidDeleteAllMessagesInMailboxesWithURLs:v20 generationWindow:v17];

      [(MFMailMessageLibrary *)self _removeSearchableItemsWithLibraryIDs:v13];
      [(MFMailMessageLibrary *)self cleanupProtectedTables];
      if (v12)
      {
        if (*((unsigned char *)v39 + 24) && v23) {
          [(MFMailMessageLibrary *)self _notifyDidCompact:1 messages:v11 mailboxes:v26];
        }
      }
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v38, 8);
  }
  if (v6)
  {
    __int16 v21 = [(MFMailMessageLibrary *)self database];
    id v22 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:]"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_3;
    void v28[3] = &unk_1E5D3D068;
    id v29 = v8;
    objc_msgSend(v21, "__performWriteWithCaller:usingBlock:", v22, v28);
  }
}

void __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  BOOL v6 = [*(id *)(a1 + 32) database];
  uint64_t v7 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:]_block_invoke"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_2;
  v13[3] = &unk_1E5D3D018;
  id v8 = *(id *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  id v16 = v10;
  uint64_t v20 = v11;
  uint64_t v21 = v12;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v13);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a3 = 1;
  }
}

BOOL __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) _deleteMessages:*(void *)(a1 + 48) connection:v3];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [*(id *)(a1 + 48) count];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == *(void *)(a1 + 88))
    {
      [*(id *)(a1 + 56) persistenceIsDeletingAllMessagesInMailboxWithURL:*(void *)(a1 + 64) generationWindow:*(void *)(a1 + 32)];
      BOOL v4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  sqlite3_exec_printf((sqlite3 *)[v3 sqlDB], "DELETE FROM mailboxes WHERE url = '%q'", 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "UTF8String"));
  uint64_t v4 = [v3 checkForConnectionErrorWithMessage:@"deleting mailbox"];

  return v4;
}

- (id)dataPathForMessage:(id)a3
{
  id v3 = [(MFMailMessageLibrary *)self dataPathForMessage:a3 type:0];
  return v3;
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  uint64_t v4 = _dataPathForMessageAndPart(self, a3, a4);
  return v4;
}

- (int64_t)deleteAttachmentsForMessage:(id)a3 inMailboxFileURL:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v17 = +[MFAttachmentManager defaultManager];
  [v17 attachmentsForMessage:v4 withSchemes:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  int64_t v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [v4 storageLocationForAttachment:*(void *)(*((void *)&v19 + 1) + 8 * v8)];
        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v11 = [v10 attributesOfItemAtPath:v9 error:0];

        if (v11)
        {
          uint64_t v12 = [v11 fileSize];
          id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v13 removeItemAtPath:v9 error:0];

          v5 += v12;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }

  id v14 = EDLibraryLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    int64_t v24 = v5;
    __int16 v25 = 2114;
    id v26 = v15;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Deleted %lld bytes of attachments for message %{public}@", buf, 0x16u);
  }
  return v5;
}

- (id)fileAttributesForMessage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:0];
  uint64_t v7 = [v5 attributesOfItemAtPath:v6 error:0];
  if (v7)
  {
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v8 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:1];

    uint64_t v7 = [v5 attributesOfItemAtPath:v8 error:0];
  }
  id v9 = v7;

  return v9;
}

- (void)fileURLForAttachmentPersistentID:(id)a3 messageID:(id)a4 result:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = -[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:](self, "messageWithLibraryID:options:inMailbox:", (int)[v9 intValue], 0, 0);
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [v11 account];
  id v14 = [(MFMailMessageLibrary *)self messageBasePathForAccount:v13];
  uint64_t v15 = [v12 fileURLWithPath:v14 isDirectory:1];

  id v16 = +[MFAttachmentManager defaultManager];
  id v17 = [v16 persistenceManager];
  id v18 = [v17 attachmentURLForMessageAttachmentID:v8 basePath:v15];

  if (!v18 || !v11)
  {
LABEL_8:
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    goto LABEL_9;
  }
  long long v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v20 = [v18 path];
  int v21 = [v19 isReadableFileAtPath:v20];

  if (!v21)
  {
    long long v22 = EDLibraryLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      int64_t v24 = v18;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Unable to read attachment at URL %@", (uint8_t *)&v23, 0xCu);
    }

    goto LABEL_8;
  }
  (*((void (**)(id, void *, void *))v10 + 2))(v10, v18, v11);
LABEL_9:
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_MFDataCollector alloc] initWithLibrary:self message:v6 part:v7 partial:0 incomplete:0 relaxDataProtection:0 data:0];

  return v8;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [[_MFDataCollector alloc] initWithLibrary:self message:v8 part:v9 partial:0 incomplete:v5 relaxDataProtection:0 data:0];

  return v10;
}

- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[_MFDataCollector alloc] initWithLibrary:self message:v6 part:0 partial:v4 incomplete:0 relaxDataProtection:0 data:0];

  return v7;
}

- (id)dataConsumerForMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_MFDataCollector alloc] initWithLibrary:self message:v4 part:0 partial:0 incomplete:0 relaxDataProtection:0 data:0];

  return v5;
}

- (void)_writeData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
}

- (OS_dispatch_queue)mimePartParallelCompressionQueue
{
  return self->_parallelCompressionQueue;
}

- (id)existingMIMEPartsForMessage:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  long long v19 = [(MFMailMessageLibrary *)self dataDirectoryURLForMessage:a3];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v4 = *MEMORY[0x1E4F1C6E8];
  v26[0] = *MEMORY[0x1E4F1C6E8];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v6 = [v3 contentsOfDirectoryAtURL:v19 includingPropertiesForKeys:v5 options:4 error:0];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v20 = 0;
          char v13 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v20, v4, 0, v19);
          id v14 = v20;
          uint64_t v15 = v14;
          if (v14) {
            char v16 = v13;
          }
          else {
            char v16 = 0;
          }
          if (v16)
          {
            id v17 = mimePartFromFilename(v14);
            if (v17) {
              [v7 addObject:v17];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)downloadedMessageDataForMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMailMessageLibrary *)self dataFileURLForMessage:v4 type:0];
  int v6 = [v5 checkResourceIsReachableAndReturnError:0];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F60BB0]);
    id v8 = (void *)[v7 initWithHeadersOnlyData:0 partialMessageData:0 hasFullMessageData:1 hasPartialMessageData:0 mimeParts:MEMORY[0x1E4F1CBF0]];
    goto LABEL_9;
  }
  uint64_t v9 = [(MFMailMessageLibrary *)self existingMIMEPartsForMessage:v4];
  uint64_t v10 = [(MFMailMessageLibrary *)self dataFileURLForMessage:v4 type:1];
  uint64_t v11 = mappedDispatchDataFromFileURL(v10);
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F60BB0]) initWithHeadersOnlyData:0 partialMessageData:v11 hasFullMessageData:0 hasPartialMessageData:1 mimeParts:v9];
  }
  else
  {
    if (![v10 checkResourceIsReachableAndReturnError:0])
    {
      id v14 = [(MFMailMessageLibrary *)self dataFileURLForMessage:v4 type:2];
      uint64_t v15 = mappedDispatchDataFromFileURL(v14);

      if (v15) {
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F60BB0]) initWithHeadersOnlyData:v15 partialMessageData:0 hasFullMessageData:0 hasPartialMessageData:0 mimeParts:v9];
      }
      else {
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F60BB0]) initWithHeadersOnlyData:0 partialMessageData:0 hasFullMessageData:0 hasPartialMessageData:0 mimeParts:v9];
      }
      id v8 = (void *)v16;

      goto LABEL_8;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F60BB0]) initWithHeadersOnlyData:0 partialMessageData:0 hasFullMessageData:0 hasPartialMessageData:1 mimeParts:v9];
  }
  id v8 = (void *)v12;
LABEL_8:

LABEL_9:
  return v8;
}

- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  BOOL v5 = a5;
  void v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v5)
  {
    messagesParsedCache = self->_messagesParsedCache;
    uint64_t v12 = [v9 persistentID];
    char v13 = [(NSCache *)messagesParsedCache objectForKey:v12];

    if (v13)
    {
      id v14 = EDLibraryLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_msgSend(v10, "ef_publicDescription");
        -[MFMailMessageLibrary setData:forMessage:isPartial:](v15, (uint64_t)v20, v14);
      }
    }
    else
    {
      uint64_t v16 = self->_messagesParsedCache;
      id v17 = [v10 persistentID];
      [(NSCache *)v16 setObject:MEMORY[0x1E4F1CC38] forKey:v17];

      [(MFMailMessageLibrary *)self storeRemoteContentLinksFromFullData:v8 forMessage:v10];
    }
  }
  [(MFMailMessageLibrary *)self _writeData:v8 forMessage:v10 isPartial:v5];
  if (!v5)
  {
    id v18 = [(MFMailMessageLibrary *)self dataDirectoryURLForMessage:v10];
    long long v19 = [v18 path];
    [(MFMailMessageLibrary *)self _removeEmlxFilesOfTypeLessThanType:0 inDirectory:v19];
  }
}

- (void)setData:(id)a3 forMessageToAppend:(id)a4
{
}

- (BOOL)_setMessageData:(id)a3 libraryID:(int64_t)a4 part:(id)a5 partial:(BOOL)a6 complete:(BOOL)a7 connection:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  if ([v16 isEqualToString:@"summary"])
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:5882 description:@"Attempting to store summary in protected message data table"];
  }
  [v17 preparedStatementForQueryString:@"SELECT rowid FROM message_data WHERE message_id = ? AND part = ?"];
  id v18 = objc_claimAutoreleasedReturnValue();
  long long v19 = (sqlite3_stmt *)[v18 compiled];

  sqlite3_bind_int64(v19, 1, a4);
  id v20 = v16;
  sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, 0);
  if (sqlite3_step(v19) == 100) {
    sqlite3_int64 v21 = sqlite3_column_int64(v19, 0);
  }
  else {
    sqlite3_int64 v21 = 0;
  }
  sqlite3_reset(v19);
  int v22 = [v17 checkForConnectionErrorWithMessage:@"searching for existing message_data entry"] ^ 1;
  if (v22) {
    goto LABEL_33;
  }
  if (v21) {
    v23 = @"UPDATE message_data SET message_id = :message_id, part = :part, partial = :partial, complete = :complete, NSUInteger length = :length WHERE rowid = :rowid";
  }
  else {
    long long v23 = @"INSERT INTO message_data (message_id, part, partial, complete, length) VALUES (:message_id, :part, :partial, :complete, :length)";
  }
  [v17 preparedStatementForQueryString:v23];
  uint64_t v43 = v15;
  id v24 = objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (sqlite3_stmt *)[v24 compiled];

  if (v25)
  {
    id v15 = v43;
    int v26 = sqlite3_bind_parameter_index(v25, ":message_id");
    sqlite3_bind_int64(v25, v26, a4);
    id v27 = (const char *)[v20 UTF8String];
    int v28 = sqlite3_bind_parameter_index(v25, ":part");
    if (v27) {
      sqlite3_bind_text(v25, v28, v27, -1, 0);
    }
    else {
      sqlite3_bind_null(v25, v28);
    }
    int v29 = sqlite3_bind_parameter_index(v25, ":partial");
    if (v10) {
      sqlite3_bind_int(v25, v29, 1);
    }
    else {
      sqlite3_bind_null(v25, v29);
    }
    int v30 = sqlite3_bind_parameter_index(v25, ":complete");
    if (v9) {
      sqlite3_bind_int(v25, v30, 1);
    }
    else {
      sqlite3_bind_null(v25, v30);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v31 = sqlite3_bind_parameter_index(v25, ":length");
      sqlite3_bind_int(v25, v31, [v43 length]);
    }
    else
    {
      int v32 = sqlite3_bind_parameter_index(v25, ":length");
      sqlite3_bind_null(v25, v32);
    }
    if (v21)
    {
      int v33 = sqlite3_bind_parameter_index(v25, ":rowid");
      sqlite3_bind_int64(v25, v33, v21);
    }
    int v34 = sqlite3_step(v25);
    if (v34 == 101)
    {
      sqlite3_int64 insert_rowid = v21;
    }
    else
    {
      LOBYTE(v22) = 1;
      sqlite3_int64 insert_rowid = 0xAAAAAAAAAAAAAAAALL;
    }
    if (!v21 && v34 == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v17 sqlDB]);
      LOBYTE(v22) = 0;
    }
    sqlite3_reset(v25);
    [v17 checkForConnectionErrorWithMessage:@"inserting message data (unprotected)"];
    if (v22) {
      goto LABEL_33;
    }
    if (v43)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v43, "ef_hexString");
        id v38 = objc_claimAutoreleasedReturnValue();
        id v39 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, X'%s');",
                insert_rowid,
                (const char *)[v38 cStringUsingEncoding:1]);

        if (!v39) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_44:
        BOOL v36 = 1;
        goto LABEL_34;
      }
      uint64_t v40 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, %Q);",
              insert_rowid,
              [v43 UTF8String]);
    }
    else
    {
      uint64_t v40 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, NULL);",
              insert_rowid);
    }
    id v39 = v40;
    if (v40)
    {
LABEL_43:
      char v41 = [NSString stringWithUTF8String:v39];
      [v17 executeStatementString:v41 errorMessage:@"Inserting into protected_message_data"];

      sqlite3_free(v39);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  id v15 = v43;
  [v17 checkForConnectionErrorWithMessage:@"preparing insert statement"];
LABEL_33:
  BOOL v36 = 0;
LABEL_34:

  return v36;
}

- (void)setSummary:(id)a3 forMessage:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 mailbox];
  if (v8)
  {
    BOOL v9 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    BOOL v10 = [(MFMailMessageLibrary *)self database];
    uint64_t v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary setSummary:forMessage:]"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__MFMailMessageLibrary_setSummary_forMessage___block_invoke;
    void v21[3] = &unk_1E5D3CC48;
    void v21[4] = self;
    id v22 = v6;
    id v12 = v7;
    id v23 = v12;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v21);

    char v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v12 libraryID];
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Summary updated for %lld", buf, 0xCu);
    }

    id v15 = [(MFMailMessageLibrary *)self hookRegistry];
    v27[0] = *MEMORY[0x1E4F60798];
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v15 persistenceDidUpdateProperties:v16 message:v12 generationWindow:v9];
  }
  else
  {
    id v17 = EDLibraryLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      [v7 messageStore];
      objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary setSummary:forMessage:]();
    }

    id v18 = [MEMORY[0x1E4F60D58] currentDevice];
    if ([v18 isInternal])
    {
    }
    else
    {
      char v19 = EFIsSeedBuild();

      if ((v19 & 1) == 0) {
        goto LABEL_6;
      }
    }
    BOOL v9 = EDLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v20 = [v7 messageStore];
      [(MFMailMessageLibrary *)(uint64_t)v7 setSummary:v24 forMessage:v9];
    }
  }

LABEL_6:
}

uint64_t __46__MFMailMessageLibrary_setSummary_forMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_setSummary:forMessageWithRowID:connection:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "libraryID"), v3);

  return v4;
}

- (BOOL)_setSummary:(id)a3 forMessageWithRowID:(int64_t)a4 connection:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResult:&unk_1EFF50D30 table:@"messages"];
  uint64_t v11 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  char v13 = [v11 equalTo:v12];
  [v10 setWhere:v13];

  [v10 setLimit:1];
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v29 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __67__MFMailMessageLibrary__setSummary_forMessageWithRowID_connection___block_invoke;
  v30[3] = &unk_1E5D3C7E8;
  void v30[4] = &v31;
  LOBYTE(v12) = [v9 executeSelectStatement:v10 withBlock:v30 error:&v29];
  id v14 = v29;
  if (v12)
  {
    if (*((unsigned char *)v32 + 24))
    {
      id v15 = EDLibraryLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [MEMORY[0x1E4F60D58] currentDevice];
        if ([v16 isInternal]) {
          objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v8);
        }
        else {
        id v20 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v8];
        }
        *(_DWORD *)buf = 134218242;
        int64_t v37 = a4;
        __int16 v38 = 2112;
        id v39 = v20;
        _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Updating summary for message with row ID: %lld; summary: %@",
          buf,
          0x16u);
      }
      uint64_t v27 = objc_msgSend(v8, "ef_UTF8ConvertibleString");

      int64_t v21 = [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForSummary:v27 cache:0 connection:v9];
      id v18 = [v9 preparedStatementForQueryString:@"UPDATE messages SET summary = ? WHERE ROWID = ?"];

      if (v21 == *MEMORY[0x1E4F5FCC8]) {
        [MEMORY[0x1E4F1CA98] null];
      }
      else {
      id v22 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v21];
      }
      v35[0] = v22;
      id v23 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
      v35[1] = v23;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      id v28 = 0;
      char v17 = [v18 executeWithIndexedBindings:v24 usingBlock:0 error:&v28];
      id v14 = v28;

      if ((v17 & 1) == 0) {
        [v9 handleError:v14 message:@"Setting summary"];
      }
      id v8 = (id)v27;
    }
    else
    {
      id v18 = EDLibraryLog();
      char v17 = 1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        char v19 = [MEMORY[0x1E4F60D58] currentDevice];
        if ([v19 isInternal]) {
          objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v8);
        }
        else {
        uint64_t v25 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v8];
        }
        *(_DWORD *)buf = 134218242;
        int64_t v37 = a4;
        __int16 v38 = 2112;
        id v39 = v25;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "Skipping summary update for non-existent message with row ID: %lld; summary: %@",
          buf,
          0x16u);

        char v17 = 1;
      }
    }
  }
  else
  {
    [v9 handleError:v14 message:@"Checking for message existence when setting summary"];
    char v17 = 0;
  }
  _Block_object_dispose(&v31, 8);

  return v17;
}

uint64_t __67__MFMailMessageLibrary__setSummary_forMessageWithRowID_connection___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)loadData:(id)a3 forMessage:(id)a4 usingBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"summary"])
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:6016 description:@"Attempting to load summary from protected message data table"];
  }
  uint64_t v12 = EDLibraryLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "Fetching partName: %@ for message: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__6;
  id v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  char v13 = [(MFMailMessageLibrary *)self database];
  id v14 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary loadData:forMessage:usingBlock:]"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke;
  void v21[3] = &unk_1E5D3D0B8;
  void v21[4] = self;
  id v15 = v10;
  id v22 = v15;
  id v16 = v9;
  id v23 = v16;
  uint64_t v25 = buf;
  id v17 = v11;
  id v24 = v17;
  objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v21);

  id v18 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v18;
}

uint64_t __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isProtectedDataAvailable:v3])
  {
    uint64_t v4 = [v3 preparedStatementForQueryString:@"SELECT data FROM protected_message_data WHERE ROWID = (SELECT ROWID FROM message_data WHERE message_id = ? AND part = ?)"];
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "libraryID"));
    v22[0] = v5;
    id v6 = *(void **)(a1 + 48);
    id v7 = v6;
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F1CA98] null];
    }
    v22[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_2;
    void v18[3] = &unk_1E5D3D090;
    long long v16 = *(_OWORD *)(a1 + 56);
    id v9 = (id)v16;
    long long v21 = v16;
    id v19 = *(id *)(a1 + 48);
    id v10 = v4;
    id v20 = v10;
    id v17 = 0;
    char v11 = [v10 executeWithIndexedBindings:v8 usingBlock:v18 error:&v17];
    BOOL v12 = v6 == 0;
    id v13 = v17;

    if (v12) {
    if ((v11 & 1) == 0)
    }
      [v3 handleError:v13 message:@"Fetching message data"];
  }
  else
  {
    id v10 = EDLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_cold_1(a1, v10, v14);
    }
  }

  return 1;
}

void __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  BOOL v5 = [v4 dataValue];

  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = EDLibraryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = [*(id *)(a1 + 40) originalString];
    int v12 = 138412802;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v11;
  }
}

- (id)loadMeetingDataForMessage:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MFMailMessageLibrary_loadMeetingDataForMessage___block_invoke;
  v8[3] = &unk_1E5D3D0E0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(MFMailMessageLibrary *)self loadData:@"meeting data" forMessage:v5 usingBlock:v8];

  return v6;
}

id __50__MFMailMessageLibrary_loadMeetingDataForMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EDLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "Loaded Meeting data %@ for message : %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MFMailMessageLibrary_loadMeetingExternalIDForMessage___block_invoke;
  v8[3] = &unk_1E5D3D0E0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(MFMailMessageLibrary *)self loadData:@"meeting" forMessage:v5 usingBlock:v8];

  return v6;
}

id __56__MFMailMessageLibrary_loadMeetingExternalIDForMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  id v5 = EDLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "Loaded Exchange Calendar externalID: %@ for message: %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MFMailMessageLibrary_loadMeetingMetadataForMessage___block_invoke;
  v8[3] = &unk_1E5D3D0E0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(MFMailMessageLibrary *)self loadData:@"meeting metadata" forMessage:v5 usingBlock:v8];

  return v6;
}

id __54__MFMailMessageLibrary_loadMeetingMetadataForMessage___block_invoke(uint64_t a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    int v7 = [v5 setWithArray:v6];
    int v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:0];

    id v9 = EDLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "Loaded Exchange Calendar meeting data %@ for message : %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)updateUnprefixedSubjectTo:(id)a3 forMessage:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:6112 description:@"Updating the subject but FF is not enabled"];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F60B88]);
  uint64_t v10 = [(MFMailMessageLibrary *)self database];
  uint64_t v11 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary updateUnprefixedSubjectTo:forMessage:]"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __61__MFMailMessageLibrary_updateUnprefixedSubjectTo_forMessage___block_invoke;
  long long v21 = &unk_1E5D3CBF8;
  id v12 = v9;
  id v22 = v12;
  id v13 = v8;
  id v23 = v13;
  id v24 = self;
  id v14 = v7;
  id v25 = v14;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, &v18);

  uint64_t v15 = [(MFMailMessageLibrary *)self hookRegistry];
  v26[0] = *MEMORY[0x1E4F60790];
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v15 persistenceDidUpdateProperties:v16 message:v13 generationWindow:v12];
}

uint64_t __61__MFMailMessageLibrary_updateUnprefixedSubjectTo_forMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  uint64_t v4 = [*(id *)(a1 + 40) libraryID];
  uint64_t v5 = [*(id *)(a1 + 48) _subjectIDForMessageWithLibraryID:v4 connection:v3];
  if (!v5
    || ([*(id *)(a1 + 48) _isSubjectIDUsedByOtherMessages:v5 besidesMessageWithDatabaseID:v4 connection:v3] & 1) != 0|| ((v10 = 0, uint64_t v6 = objc_msgSend(*(id *)(a1 + 48), "_updateSubjectWithRowID:to:connection:outSubjectAlreadyExists:", v5, *(void *)(a1 + 56), v3, &v10), v7 = v6, !v10)? (v8 = 1): (v8 = v6), (v8 & 1) == 0))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _updateSubjectForMessageWithLibraryID:v4 to:*(void *)(a1 + 56) connection:v3];
  }

  return v7;
}

- (int64_t)_subjectIDForMessageWithLibraryID:(int64_t)a3 connection:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = *MEMORY[0x1E4F5FCC8];
  uint64_t v6 = [v5 preparedStatementForQueryString:@"SELECT messages.subject, subjects.subject FROM messages LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID WHERE messages.ROWID = ?"];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v19[0] = v7;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v13 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __69__MFMailMessageLibrary__subjectIDForMessageWithLibraryID_connection___block_invoke;
  void v14[3] = &unk_1E5D3C7E8;
  void v14[4] = &v15;
  char v9 = [v6 executeWithIndexedBindings:v8 usingBlock:v14 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0) {
    [v5 handleError:v10 message:@"finding subject for message"];
  }
  int64_t v11 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __69__MFMailMessageLibrary__subjectIDForMessageWithLibraryID_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 databaseIDValue];

  *a4 = 1;
}

- (BOOL)_isSubjectIDUsedByOtherMessages:(int64_t)a3 besidesMessageWithDatabaseID:(int64_t)a4 connection:(id)a5
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  char v8 = [v7 preparedStatementForQueryString:@"SELECT ROWID FROM messages WHERE messages.subject = ? AND ROWID != ? LIMIT 1"];
  char v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v22[0] = v9;
  id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  v22[1] = v10;
  int64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__MFMailMessageLibrary__isSubjectIDUsedByOtherMessages_besidesMessageWithDatabaseID_connection___block_invoke;
  v17[3] = &unk_1E5D3C7E8;
  v17[4] = &v18;
  char v12 = [v8 executeWithIndexedBindings:v11 usingBlock:v17 error:&v16];
  id v13 = v16;

  if ((v12 & 1) == 0) {
    [v7 handleError:v13 message:@"finding message using same subject"];
  }
  BOOL v14 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __96__MFMailMessageLibrary__isSubjectIDUsedByOtherMessages_besidesMessageWithDatabaseID_connection___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (BOOL)_updateSubjectWithRowID:(int64_t)a3 to:(id)a4 connection:(id)a5 outSubjectAlreadyExists:(BOOL *)a6
{
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"subjects"];
  [v11 setObject:v9 forKeyedSubscript:@"subject"];
  char v12 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  BOOL v14 = [v12 equalTo:v13];
  [v11 setWhereClause:v14];

  id v21 = 0;
  char v15 = [v10 executeUpdateStatement:v11 error:&v21];
  id v16 = v21;
  uint64_t v17 = v16;
  if (v15)
  {
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v19 = [v16 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F60D10]]) {
      BOOL v18 = [v17 code] == 19;
    }
    else {
      BOOL v18 = 0;
    }

    [v10 handleError:v17 message:@"Updating subject"];
  }
  if (a6) {
    *a6 = v18;
  }

  return v15;
}

- (BOOL)_updateSubjectForMessageWithLibraryID:(int64_t)a3 to:(id)a4 connection:(id)a5
{
  id v8 = a5;
  int64_t v9 = [(MFMailMessageLibrary *)self _findOrCreateDatabaseIDForSubject:a4 cache:0 connection:v8];
  if (v9 == *MEMORY[0x1E4F5FCC8])
  {
    char v10 = 0;
  }
  else
  {
    int64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
    char v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v9];
    [v11 setObject:v12 forKeyedSubscript:@"subject"];

    id v13 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    BOOL v14 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    char v15 = [v13 equalTo:v14];
    [v11 setWhereClause:v15];

    id v18 = 0;
    char v10 = [v8 executeUpdateStatement:v11 error:&v18];
    id v16 = v18;
    if ((v10 & 1) == 0) {
      [v8 handleError:v16 message:@"Setting subject ID"];
    }
  }
  return v10;
}

- (id)headerDataAtPath:(id)a3
{
  id v3 = a3;
  if (v3) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F734C0]) initWithContentsOfFile:v3 options:3 error:0];
  }
  else {
    uint64_t v4 = 0;
  }
  if ([v4 length] && (uint64_t v6 = objc_msgSend(v4, "mf_rangeOfRFC822HeaderData"), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v7 = objc_msgSend(v4, "mf_subdataWithRange:", v6, v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  uint64_t v4 = [(MFMailMessageLibrary *)self bodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:a4 isComplete:0];
  return v4;
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5
{
  uint64_t v5 = [(MFMailMessageLibrary *)self bodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:a4 isComplete:a5 isPartial:0];
  return v5;
}

- (id)headerDataForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _dataForMessageAndPart(self, v4, 0, 1, 0);
  uint64_t v6 = v5;
  if (!v5
    || (id v13 = 0,
        id v7 = _bodyDataFromData(v5, &v13),
        (id v8 = v13) == 0))
  {
    int64_t v9 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:0];
    if (!v9
      || ([(MFMailMessageLibrary *)self headerDataAtPath:v9],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          !v8))
    {
      char v10 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:1];
      if (!v10
        || ([(MFMailMessageLibrary *)self headerDataAtPath:v10],
            id v8 = (id)objc_claimAutoreleasedReturnValue(),
            v10,
            !v8))
      {
        int64_t v11 = [(MFMailMessageLibrary *)self dataPathForMessage:v4 type:2];
        if (v11)
        {
          id v8 = [(MFMailMessageLibrary *)self headerDataAtPath:v11];
        }
        else
        {
          id v8 = 0;
        }
      }
    }
  }

  return v8;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  id v6 = a3;
  id v7 = _dataForMessageAndPart(self, v6, 0, 0, 0);
  id v8 = v7;
  if (!v7
    || (_bodyDataFromData(v7, a4), uint64_t v9 = objc_claimAutoreleasedReturnValue(), v8, (v10 = (void *)v9) == 0))
  {
    int64_t v11 = [(MFMailMessageLibrary *)self dataPathForMessage:v6];
    if (v11)
    {
      char v10 = [(MFMailMessageLibrary *)self bodyDataAtPath:v11 headerData:a4];
    }
    else
    {
      char v10 = 0;
    }
  }
  char v12 = +[MFActivityMonitor currentMonitor];
  [v12 recordTransportType:1];

  return v10;
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v5 = [v4 mimeBody];
  id v6 = [v5 message];

  id v7 = [(MFMailMessageLibrary *)self database];
  id v8 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary hasCompleteDataForMimePart:]"];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __51__MFMailMessageLibrary_hasCompleteDataForMimePart___block_invoke;
  uint64_t v20 = &unk_1E5D3D108;
  id v9 = v6;
  id v21 = v9;
  id v10 = v4;
  id v22 = v10;
  id v23 = &v25;
  id v24 = &v29;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, &v17);

  if (!*((unsigned char *)v26 + 24))
  {
    int64_t v11 = objc_msgSend(v10, "partNumber", v17, v18, v19, v20, v21);
    char v12 = _dataPathForMessageAndPart(self, v9, v11);

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v14 = [v13 fileExistsAtPath:v12];
      *((unsigned char *)v30 + 24) = v14;
    }
  }
  char v15 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __51__MFMailMessageLibrary_hasCompleteDataForMimePart___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT complete FROM message_data WHERE message_id = ? and part = ?"];
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, [*(id *)(a1 + 32) libraryID]);
    id v6 = [*(id *)(a1 + 40) partNumber];
    sqlite3_bind_text(v5, 2, (const char *)[v6 UTF8String], -1, 0);

    if (sqlite3_step(v5) == 100)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_column_int(v5, 0) != 0;
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (BOOL)areMessageContentsLocallyAvailable:(id)a3 fullContentsAvailble:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [(MFMailMessageLibrary *)self dataPathForMessage:v6];
  int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = v27;
    *((unsigned char *)v27 + 24) = 1;
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    int64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v12 = [(MFMailMessageLibrary *)self dataPathForMessage:v6 type:1];
    int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      id v10 = v27;
      *((unsigned char *)v27 + 24) = 1;
      if (a4) {
        *a4 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      char v14 = [(MFMailMessageLibrary *)self database];
      char v15 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary areMessageContentsLocallyAvailable:fullContentsAvailble:]"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke;
      void v18[3] = &unk_1E5D3D158;
      id v19 = v6;
      uint64_t v20 = &v26;
      id v21 = &v22;
      objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v18);

      if (a4) {
        *a4 = *((unsigned char *)v23 + 24);
      }

      _Block_object_dispose(&v22, 8);
      id v10 = v27;
    }
  }
  char v16 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:@"SELECT length, complete, partial FROM message_data WHERE message_id = ? AND part IS NULL"];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "libraryID"));
  v13[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke_2;
  void v11[3] = &unk_1E5D3D130;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = [v4 executeWithIndexedBindings:v6 usingBlock:v11 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"checking message_data"];
  }

  return v7;
}

void __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 objectForKeyedSubscript:@"length"];
  uint64_t v7 = [v6 numberValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 integerValue] > 0;

  id v8 = [v12 objectForKeyedSubscript:@"complete"];
  int v9 = [v8 numberValue];
  if ([v9 BOOLValue])
  {
    id v10 = [v12 objectForKeyedSubscript:@"partial"];
    int64_t v11 = [v10 numberValue];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 BOOLValue] ^ 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }

  *a4 = 1;
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7
{
  uint64_t v7 = -[MFMailMessageLibrary queryForCriterion:connection:options:baseTable:isSubquery:range:](self, "queryForCriterion:connection:options:baseTable:isSubquery:range:", a3, a4, *(void *)&a5, *(void *)&a6, a7, 0, 0x7FFFFFFFFFFFFFFFLL);
  return v7;
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5
{
  uint64_t v5 = -[MFMailMessageLibrary queryForCriterion:connection:options:baseTable:isSubquery:range:](self, "queryForCriterion:connection:options:baseTable:isSubquery:range:", a3, a4, *(void *)&a5, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7
{
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6
{
}

- (void)_iterateMessagesWithResultHandler:(id)a3 options:(unsigned int)a4 monitor:(id)a5 sqlQueryGenerator:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  char v14 = [(MFMailMessageLibrary *)self database];
  char v15 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _iterateMessagesWithResultHandler:options:monitor:sqlQueryGenerator:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke;
  v19[3] = &unk_1E5D3D1D0;
  id v16 = v13;
  id v22 = v16;
  void v19[4] = self;
  unsigned int v24 = a4;
  id v17 = v11;
  id v20 = v17;
  id v18 = v12;
  id v21 = v18;
  SEL v23 = a2;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v19);
}

uint64_t __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([v4 length])
  {
    uint64_t v5 = [v3 preparedStatementForQueryString:v4];
    id v18 = 0;
    id v9 = 0;
    id v10 = 0;
    id v8 = 0;
    uint64_t v12 = mach_absolute_time();
    objc_storeStrong(&v8, *(id *)(a1 + 32));

    id v6 = v10;
    id v9 = 0;
    id v10 = 0;

    uint64_t v11 = 0x3F000000000003E8;
    int v14 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    int v15 = *(_DWORD *)(a1 + 72);
    uint64_t v16 = objc_msgSend(v3, "sqlDB", v8);
    objc_storeStrong(&v18, *(id *)(a1 + 40));
    char v17 = [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    char v19 = objc_opt_respondsToSelector() & 1;
    [*(id *)(a1 + 32) _iterateStatement:v5 connection:v3 withProgressMonitor:*(void *)(a1 + 48) andRowHandler:handleIterativeSearchRow context:&v8];
    __destructor_8_s0_s8_s16_s72((uint64_t)&v8);
  }
  else
  {
    [*(id *)(a1 + 32) isProtectedDataAvailable:v3];
    uint64_t v5 = EDLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      objc_claimAutoreleasedReturnValue();
      __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke_cold_1();
    }
  }

  return 1;
}

- (void)iterateMessagesMatchingCriterion:(id)a3 withResultHandler:(id)a4 options:(unsigned int)a5 withMonitor:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__MFMailMessageLibrary_iterateMessagesMatchingCriterion_withResultHandler_options_withMonitor___block_invoke;
  void v12[3] = &unk_1E5D3D1F8;
  void v12[4] = self;
  id v13 = v10;
  int v14 = v7;
  id v11 = v10;
  [(MFMailMessageLibrary *)self _iterateMessagesWithResultHandler:a4 options:v7 monitor:a6 sqlQueryGenerator:v12];
}

id __95__MFMailMessageLibrary_iterateMessagesMatchingCriterion_withResultHandler_options_withMonitor___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) queryForCriterion:*(void *)(a1 + 40) connection:a2 options:*(unsigned int *)(a1 + 48)];
  return v2;
}

- (void)iterateMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4 handler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = a5;
  id v9 = [[_MFBlockIterationHandler alloc] initWithBlock:v8];
  [(MFMailMessageLibrary *)self iterateMessagesMatchingCriterion:v10 withResultHandler:v9 options:v6 withMonitor:v9];
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  uint64_t v12 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", v11, v12, v9, 0, location, length, a6);
  id v13 = [(_MFMessageCollector *)v12 messages];

  return v13;
}

- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    uint64_t v10 = [v9 libraryID];

    id v11 = [v7 lastObject];
    uint64_t v12 = [v11 libraryID];

    id v13 = objc_alloc_init(MFMessageCriterion);
    [(MFMessageCriterion *)v13 setCriterionType:25];
    [(MFMessageCriterion *)v13 setAllCriteriaMustBeSatisfied:1];
    int v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
    int v15 = [MFMessageCriterion alloc];
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v10 - 1);
    char v17 = [(MFMessageCriterion *)v15 initWithType:24 qualifier:6 expression:v16];

    [v14 addObject:v17];
    id v18 = [MFMessageCriterion alloc];
    char v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v12 + 1);
    uint64_t v20 = [(MFMessageCriterion *)v18 initWithType:24 qualifier:5 expression:v19];

    [v14 addObject:v20];
    [(MFMessageCriterion *)v13 setCriteria:v14];
    id v21 = [(MFMailMessageLibrary *)self messagesMatchingCriterion:v13 options:a5];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)deleteAccount:(id)a3
{
  id v4 = a3;
  [(MFMailMessageLibrary *)self invalidateAccount:v4];
  uint64_t v5 = [(MFMailMessageLibrary *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary deleteAccount:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__MFMailMessageLibrary_deleteAccount___block_invoke;
  v8[3] = &unk_1E5D3CCE8;
  uint64_t v9 = @"DELETE FROM accounts WHERE text_id = ?";
  id v7 = v4;
  id v10 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);
}

uint64_t __38__MFMailMessageLibrary_deleteAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  uint64_t v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) uniqueID];
    id v7 = (const char *)[v6 UTF8String];

    int v8 = strlen(v7);
    sqlite3_bind_text(v5, 1, v7, v8, 0);
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  uint64_t v9 = [v3 checkForConnectionErrorWithMessage:@"deleting an account entry"];

  return v9;
}

- (id)_mailboxesClauseForAccounts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v3 arrayByApplyingSelector:sel_URLString];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"url"];
          id v11 = [v10 beginsWith:v9 caseSensitive:1];

          [v4 addObject:v11];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F60ED8]) initWithExpressions:v4];
    id v13 = objc_msgSend(v12, "ef_SQLExpression");

    int v14 = [NSString stringWithFormat:@" AND +messages.mailbox IN (SELECT ROWID FROM mailboxes WHERE %@) ", v13];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (void)prepareToRebuildActiveAccountsClausesAndExpressions
{
  [(NSConditionLock *)self->_activeAccountsCondition lock];
  activeAccountsCondition = self->_activeAccountsCondition;
  [(NSConditionLock *)activeAccountsCondition unlockWithCondition:1];
}

- (void)rebuildActiveAccountsClausesAndExpressionsWithAccounts:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive", (void)v13)) {
          uint64_t v12 = v5;
        }
        else {
          uint64_t v12 = v6;
        }
        [v12 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(MFMailMessageLibrary *)self rebuildActiveAccountMailboxesExpression:v5];
  [(MFMailMessageLibrary *)self rebuildActiveMailboxesClauseWithActiveAccounts:v5 inactiveAccounts:v6];
  [(NSConditionLock *)self->_activeAccountsCondition lock];
  [(NSConditionLock *)self->_activeAccountsCondition unlockWithCondition:0];
}

- (void)rebuildActiveAccountMailboxesExpression:(id)a3
{
  id v11 = a3;
  if ([v11 count])
  {
    id v4 = objc_msgSend(v11, "ef_compactMap:", &__block_literal_global_1491);
    id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
    uint64_t v6 = (void *)[v5 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"mailboxes"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60ED8]) initWithExpressions:v4];
    [v6 setWhere:v7];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"mailbox"];
    uint64_t v9 = [v8 disqualified];
    id v10 = [v9 in:v6];
  }
  else
  {
    id v10 = 0;
  }
  [(MFMailMessageLibrary *)self mf_lock];
  if (v10 != self->_enabledAccountMailboxesExpression) {
    objc_storeStrong((id *)&self->_enabledAccountMailboxesExpression, v10);
  }
  [(MFMailMessageLibrary *)self mf_unlock];
}

id __64__MFMailMessageLibrary_rebuildActiveAccountMailboxesExpression___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 URLString];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"url"];
    id v4 = [v3 beginsWith:v2 caseSensitive:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)rebuildActiveMailboxesClauseWithActiveAccounts:(id)a3 inactiveAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[LocalAccount localAccount];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke;
  v19[3] = &unk_1E5D3C0B8;
  id v9 = v8;
  id v20 = v9;
  id v10 = objc_msgSend(v6, "ef_filter:", v19);
  id v11 = [(MFMailMessageLibrary *)self _mailboxesClauseForAccounts:v6];
  uint64_t v12 = [(MFMailMessageLibrary *)self _mailboxesClauseForAccounts:v10];
  [(MFMailMessageLibrary *)self mf_lock];
  BOOL v13 = [v7 count] != 0;
  if (self->_activeMailboxesClause != v11 || ([(NSString *)v11 isEqual:v11] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeMailboxesClause, v11);
    BOOL v13 = 1;
  }
  if (self->_nonLocalAccountClause != v12) {
    objc_storeStrong((id *)&self->_nonLocalAccountClause, v12);
  }
  [(MFMailMessageLibrary *)self mf_unlock];
  if (v13)
  {
    long long v14 = [(MFMailMessageLibrary *)self searchableIndex];
    [v14 suspend];

    long long v15 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke_2;
    block[3] = &unk_1E5D3B6E0;
    id v17 = v7;
    uint64_t v18 = self;
    dispatch_async(v15, block);
  }
}

BOOL __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

void __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeSearchableItemsForAccount:", *(void *)(*((void *)&v8 + 1) + 8 * v5++), (void)v8);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  id v6 = [*(id *)(a1 + 40) searchableIndex];
  [v6 resume];

  id v7 = [*(id *)(a1 + 40) searchableIndex];
  [v7 refresh];
}

- (id)enabledAccountMailboxesExpression
{
  [(MFMailMessageLibrary *)self _waitForActiveAccountsRebuild];
  [(MFMailMessageLibrary *)self mf_lock];
  uint64_t v3 = self->_enabledAccountMailboxesExpression;
  [(MFMailMessageLibrary *)self mf_unlock];
  return v3;
}

- (void)deletePOPUID:(id)a3 inMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(MFMailMessageLibrary *)self database];
  long long v9 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary deletePOPUID:inMailbox:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__MFMailMessageLibrary_deletePOPUID_inMailbox___block_invoke;
  void v12[3] = &unk_1E5D3CCE8;
  id v10 = v7;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);
}

uint64_t __47__MFMailMessageLibrary_deletePOPUID_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"UPDATE pop_uids SET del = 1 WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND uid = ?;"];
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (sqlite3_stmt *)[v4 compiled];

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
    sqlite3_bind_text(v5, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    sqlite3_step(v5);
  }
  uint64_t v6 = [v3 checkForConnectionErrorWithMessage:@"setting pop_uid.del = 1"];

  return v6;
}

- (id)UIDsToDeleteInMailbox:(id)a3
{
  POPUIDsForQuery(self, @"SELECT uid FROM pop_uids WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND del NOT NULL;",
  id v3 = a3);
  return v3;
}

- (id)allUIDsInMailbox:(id)a3
{
  POPUIDsForQuery(self, @"SELECT uid FROM pop_uids WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?);",
  id v3 = a3);
  return v3;
}

- (id)hiddenPOPUIDsInMailbox:(id)a3
{
  POPUIDsForQuery(self, @"SELECT uid FROM pop_uids AS uid LEFT OUTER JOIN messages AS message ON uid.mailbox = message.remote_mailbox AND uid.uid = message.remote_id WHERE uid.mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND message.rowid IS NULL OR (message.flags & 2) > 0;",
  id v3 = a3);
  return v3;
}

- (void)_setProtectedDataAvailabilityState:(unint64_t)a3
{
  unint64_t protectedDataAvailability = self->_protectedDataAvailability;
  if (protectedDataAvailability != a3)
  {
    unint64_t v6 = self->_protectedDataAvailability;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&self->_protectedDataAvailability, (unsigned int *)&v6, a3, memory_order_relaxed, memory_order_relaxed);
    if (v6 == protectedDataAvailability)
    {
      if (a3 == 2)
      {
        id v7 = [(MFMailMessageLibrary *)self searchableIndex];
        [v7 setPersistenceAvailable:0];
        long long v9 = @"MailMessageLibraryWillBecomeUnavailable";
      }
      else
      {
        if (a3 == 1)
        {
          long long v9 = @"MailMessageLibraryDidBecomeAvailable";
          goto LABEL_10;
        }
        if (a3) {
          return;
        }
        id v7 = [(MFMailMessageLibrary *)self persistence];
        long long v8 = [v7 searchableIndexManager];
        [v8 enableIndexingAndBeginScheduling:1];

        long long v9 = @"MailMessageLibraryDidFinishReconciliation";
      }

LABEL_10:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__MFMailMessageLibrary__setProtectedDataAvailabilityState___block_invoke;
      block[3] = &unk_1E5D3D240;
      uint64_t v12 = self;
      unint64_t v13 = a3;
      id v11 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __59__MFMailMessageLibrary__setProtectedDataAvailabilityState___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = EDLibraryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_INFO, "Posting %@", buf, 0xCu);
  }

  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", a1[6], @"MailMessageLibraryProtectedDataAvailibilityKey");
  long long v8 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  unint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:a1[4] object:a1[5] userInfo:v5];
}

- (unint64_t)protectedDataAvailability
{
  return self->_protectedDataAvailability;
}

- (BOOL)cleanupProtectedTables
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  uint64_t v3 = [(MFMailMessageLibrary *)self database];
  id v4 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary cleanupProtectedTables]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke;
  void v6[3] = &unk_1E5D3CC20;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v6);

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

BOOL __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isProtectedDataAvailable:v3])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke_2;
    void v12[3] = &unk_1E5D3D268;
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)(a1 + 40);
    unint64_t v13 = v5;
    uint64_t v14 = v6;
    [&unk_1EFF50028 enumerateObjectsUsingBlock:v12];
    uint64_t v7 = EDLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      double v16 = v8 - Current;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "cleanupProtectedTables took %.4f seconds", buf, 0xCu);
    }

    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v9 = EDLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "skipping cleaning up protected tables because protected data is not available", buf, 2u);
    }
  }

  BOOL v10 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  return v10;
}

void __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (sqlite3_stmt *)[v6 compiled];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_step(v7) == 101;
  sqlite3_reset(v7);
  [*(id *)(a1 + 32) checkForConnectionErrorWithMessage:@"cleaning up protected tables"];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)_shouldLogDatabaseStats
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v3 = [v2 BOOLForKey:@"LogDatabaseStats"];

  return v3;
}

- (void)_logStatistics
{
  statsQueue = self->_statsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MFMailMessageLibrary__logStatistics__block_invoke;
  block[3] = &unk_1E5D3B5C0;
  void block[4] = self;
  dispatch_async(statsQueue, block);
}

void __38__MFMailMessageLibrary__logStatistics__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_log_t v1 = [*(id *)(a1 + 32) persistence];
  id v2 = [v1 messagePersistence];
  char v3 = [v2 collectStatistics];

  if ([v3 protectedDataAvailable])
  {
    id v4 = EDLibraryLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [v3 duration];
      int v10 = 134219776;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = [v3 messagesMarkedAsJournaled];
      __int16 v14 = 2048;
      uint64_t v15 = [v3 messages];
      __int16 v16 = 2048;
      uint64_t v17 = [v3 messageData];
      __int16 v18 = 2048;
      uint64_t v19 = [v3 protectedMessageData];
      __int16 v20 = 2048;
      uint64_t v21 = [v3 messagesDeleted];
      __int16 v22 = 2048;
      uint64_t v23 = [v3 messageDataDeleted];
      __int16 v24 = 2048;
      uint64_t v25 = [v3 mailboxesNeedingReconcilication];
      id v6 = "STATS %.2fs j:%lu m:%lu md:%lu pmd:%lu mdel:%lu mddel:%lu mbox:%lu";
      uint64_t v7 = v4;
      uint32_t v8 = 82;
LABEL_6:
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else
  {
    id v4 = EDLibraryLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [v3 duration];
      int v10 = 134219520;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = [v3 messagesMarkedAsJournaled];
      __int16 v14 = 2048;
      uint64_t v15 = [v3 messages];
      __int16 v16 = 2048;
      uint64_t v17 = [v3 messageData];
      __int16 v18 = 2048;
      uint64_t v19 = [v3 messagesDeleted];
      __int16 v20 = 2048;
      uint64_t v21 = [v3 messageDataDeleted];
      __int16 v22 = 2048;
      uint64_t v23 = [v3 mailboxesNeedingReconcilication];
      id v6 = "STATS %.2fs j:%lu m:%lu pm:* md:%lu pmd:* mdel:%lu mddel:%lu mbox:%lu";
      uint64_t v7 = v4;
      uint32_t v8 = 72;
      goto LABEL_6;
    }
  }
}

- (void)_schedulePeriodicStatisticsLogging
{
  if ([(MFMailMessageLibrary *)self _shouldLogDatabaseStats])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke_2;
    v4[3] = &unk_1E5D3D2B0;
    objc_copyWeak(&v5, &location);
    char v3 = _Block_copy(v4);
    ef_xpc_activity_register();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14220]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
}

void __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _logStatistics];
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keyBagQueue);
  if (a3 == 2)
  {
    uint64_t v7 = EDLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "Key bag locked", buf, 2u);
    }

    [(MFMailMessageLibrary *)self _setProtectedDataAvailabilityState:2];
    [(MFMailMessageLibrary *)self _cancelPendingJournalReconciliation];
  }
  else if (!a3 && a4 != 3)
  {
    uint32_t v8 = EDLibraryLog();
    int v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "Key bag unlocked", v11, 2u);
    }

    [(MFMailMessageLibrary *)self _setProtectedDataAvailabilityState:1];
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_suspendedUnderLock, (unsigned __int8 *)&v9, 0);
    if (v9 == 1)
    {
      int v10 = [(MFMailMessageLibrary *)self database];
      [v10 reconcileJournalWithCompletionBlock:0];
    }
    else
    {
      [(MFMailMessageLibrary *)self _scheduleJournalReconciliation];
    }
  }
}

- (void)_scheduleJournalReconciliation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = EDLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = @"com.apple.message.journal-reconciliation";
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "register %@ activity", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_2;
  aBlock[3] = &unk_1E5D3D2B0;
  objc_copyWeak(&v6, (id *)buf);
  id v4 = _Block_copy(aBlock);
  [@"com.apple.message.journal-reconciliation" UTF8String];
  ef_xpc_activity_register();

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  uint64_t v2 = *MEMORY[0x1E4F14200];
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14170], *MEMORY[0x1E4F14200]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141A8], 2 * v2);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14310], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14338], 0);
}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (xpc_activity_set_state((xpc_activity_t)v3, 4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained database];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_3;
    void v6[3] = &unk_1E5D3B5C0;
    id v7 = v3;
    [v5 reconcileJournalWithCompletionBlock:v6];
  }
  else
  {
    id WeakRetained = EDLibraryLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v9 = @"com.apple.message.journal-reconciliation";
      _os_log_impl(&dword_1A7EFF000, WeakRetained, OS_LOG_TYPE_DEFAULT, "#Warning Unable to transition %@ activity to state 'continue'", buf, 0xCu);
    }
  }
}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_3(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    os_log_t v1 = EDLibraryLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 138412290;
      id v3 = @"com.apple.message.journal-reconciliation";
      _os_log_impl(&dword_1A7EFF000, v1, OS_LOG_TYPE_DEFAULT, "#Warning Unable to transition %@ activity to state 'done'", (uint8_t *)&v2, 0xCu);
    }
  }
}

- (void)_cancelPendingJournalReconciliation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = EDLibraryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = @"com.apple.message.journal-reconciliation";
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_INFO, "cancelling %@ activity", (uint8_t *)&v3, 0xCu);
  }

  xpc_activity_unregister((const char *)[@"com.apple.message.journal-reconciliation" UTF8String]);
}

- (void)journalWasReconciled
{
  keyBagQueue = self->_keyBagQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MFMailMessageLibrary_journalWasReconciled__block_invoke;
  block[3] = &unk_1E5D3B5C0;
  void block[4] = self;
  dispatch_async(keyBagQueue, block);
}

void __44__MFMailMessageLibrary_journalWasReconciled__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setProtectedDataAvailabilityState:0];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(NSObject **)(v2 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MFMailMessageLibrary_journalWasReconciled__block_invoke_2;
  block[3] = &unk_1E5D3B5C0;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __44__MFMailMessageLibrary_journalWasReconciled__block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 112) count])
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "count"));
    double Current = CFAbsoluteTimeGetCurrent();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 112);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v24;
      *(void *)&long long v6 = 134217984;
      long long v22 = v6;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        if ((EFProtectedDataAvailable() & 1) == 0) {
          break;
        }
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "messageWithLibraryID:options:inMailbox:", (int)objc_msgSend(v9, "intValue"), 0, 0);
        uint64_t v11 = v10;
        if (v10)
        {
          __int16 v12 = [v10 headersIfAvailable];
          if (v12)
          {
            uint64_t v13 = MFLogGeneral();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = [v11 messageIDHash];
              *(_DWORD *)buf = v22;
              uint64_t v28 = v14;
              _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Threading %lld: resolving threads after journal reconciliation", buf, 0xCu);
            }

            [*(id *)(a1 + 32) updateThreadingInfoForMessage:v11 fromHeaders:v12];
          }
        }
        objc_msgSend(v2, "addObject:", v9, v22, (void)v23);

        if (v5 == ++v8)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v15 = EDLibraryLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v2 count];
      CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218240;
      uint64_t v28 = v16;
      __int16 v29 = 2048;
      double v30 = v17 - Current;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "Updated conversation hashes on %lu messages (%.4f seconds)", buf, 0x16u);
    }

    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 112) count];
    uint64_t v19 = [v2 count];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 112);
    if (v18 == v19)
    {
      *(void *)(v20 + 112) = 0;
    }
    else
    {
      [v21 minusSet:v2];
    }
  }
}

- (void)_addMessageToThreadAtUnlock:(int64_t)a3
{
  conversationCalculationQueue = self->_conversationCalculationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MFMailMessageLibrary__addMessageToThreadAtUnlock___block_invoke;
  v4[3] = &unk_1E5D3C388;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(conversationCalculationQueue, v4);
}

void __52__MFMailMessageLibrary__addMessageToThreadAtUnlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 112))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = v2;
  }
  uint64_t v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Threading: deferring thread resolution until unlock for message database ID %lld", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(a1 + 40)];
  [v7 addObject:v8];
}

- (BOOL)migrate
{
  uint64_t v3 = (void *)MEMORY[0x1AD0E3E00](self, a2);
  id v4 = [(MFMailMessageLibrary *)self database];
  uint64_t v5 = [v4 openConnectionIsWriter:0];

  if (v5) {
    [v5 close];
  }

  return v5 != 0;
}

- (void)_captureAnalyticsForMailDatabase:(int64_t)a3 schema:(id)a4
{
  id v21 = a4;
  if (a3 >= 1)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v8 = [v7 objectForKey:@"EMUserDefaultMailDatabaseSize"];
    int v9 = (void *)[v6 initWithDictionary:v8];

    if (![v9 count]
      || ([v9 objectForKey:v21],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10)
      || ([v9 objectForKey:v21],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = objc_msgSend(v11, "ef_isMoreThanTimeIntervalAgo:", 2592000.0),
          v11,
          v12))
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
      [v9 setObject:v13 forKeyedSubscript:v21];

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
      uint64_t v15 = (void *)[v9 copy];
      [v14 setValue:v15 forKey:@"EMUserDefaultMailDatabaseSize"];

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v21 isEqualToString:@"main"])
      {
        CFAbsoluteTime v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", a3));
        [v16 setObject:v17 forKeyedSubscript:@"MailDbEnvelopeSize"];
      }
      else
      {
        CFAbsoluteTime v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", a3));
        [v16 setObject:v17 forKeyedSubscript:@"MailDbFileSize"];
      }

      [v16 setObject:&unk_1EFF50D30 forKeyedSubscript:@"DataCollection"];
      id v18 = objc_alloc(MEMORY[0x1E4F60260]);
      uint64_t v19 = (void *)[v16 copy];
      uint64_t v20 = (void *)[v18 initWithEventName:@"com.apple.mobilemail.database" collectionData:v19];

      [(EMCoreAnalyticsCollector *)self->_analyticsCollector logOneTimeEvent:v20];
    }
  }
}

- (void)performIncrementalVacuumForSchema:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = [(MFMailMessageLibrary *)self database];
  id v6 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary performIncrementalVacuumForSchema:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke;
  v8[3] = &unk_1E5D3C500;
  id v7 = v4;
  id v9 = v7;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

  [(MFMailMessageLibrary *)self _captureAnalyticsForMailDatabase:v13[3] schema:v7];
  _Block_object_dispose(&v12, 8);
}

uint64_t __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EDLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = *(double *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    double v23 = v5;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "Starting incremental vacuum for %@ database", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) isEqualToString:@"protected"]
    && ([*(id *)(a1 + 40) isProtectedDataAvailable:v3] & 1) == 0)
  {
    id v9 = EDLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Skipping incremental vacuum because protected tables are not available";
      uint64_t v14 = v9;
      uint32_t v15 = 2;
      goto LABEL_14;
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [NSString stringWithFormat:@"PRAGMA %@.freelist_count;", *(void *)(a1 + 32)];
    *(double *)&uint64_t v8 = COERCE_DOUBLE([v6 _int64ForQuery:v7 connection:v3 textArgument:0]);

    if (v8 > 255)
    {
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = [NSString stringWithFormat:@"PRAGMA %@.page_count;", *(void *)(a1 + 32)];
      uint64_t v13 = [v11 _int64ForQuery:v12 connection:v3 textArgument:0];

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
      if (((double)v13 - (double)v8) / (double)v13 <= 0.85)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA %@.incremental_vacuum(%lld);",
          *(void *)(a1 + 32),
        id v16 = v8 - 256);
        CFAbsoluteTime v17 = (sqlite3 *)[v3 sqlDB];
        id v9 = v16;
        if (sqlite3_exec(v17, (const char *)[v9 UTF8String], 0, 0, 0))
        {
          id v18 = EDLibraryLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = sqlite3_errmsg((sqlite3 *)[v3 sqlDB]);
            __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke_cold_1((uint64_t)v19, (uint64_t)buf, v18);
          }
        }
        else
        {
          id v18 = EDLibraryLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            double v20 = *(double *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            double v23 = v20;
            _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "Successfully performed incremental vacuum on %@ database", buf, 0xCu);
          }
        }
      }
      else
      {
        id v9 = EDLibraryLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v23 = ((double)v13 - (double)v8) / (double)v13;
          uint64_t v10 = "Skipping incremental vacuum because load factor (%.2f) is above threshold (0.85)";
          goto LABEL_11;
        }
      }
    }
    else
    {
      id v9 = EDLibraryLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v23 = *(double *)&v8;
        uint64_t v10 = "Skipping incremental vacuum because free count (%lld) is below limit (256)";
LABEL_11:
        uint64_t v14 = v9;
        uint32_t v15 = 12;
LABEL_14:
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, v10, buf, v15);
      }
    }
  }

  return 1;
}

- (void)_scheduleIncrementalVacuum
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke_2;
  v3[3] = &unk_1E5D3D2B0;
  objc_copyWeak(&v4, &location);
  id v2 = _Block_copy(v3);
  ef_xpc_activity_register();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141D8]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
}

void __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performIncrementalVacuumForSchema:@"main"];
  [WeakRetained performIncrementalVacuumForSchema:@"protected"];
}

- (void)closeDatabaseConnections
{
  id v2 = [(MFMailMessageLibrary *)self database];
  [v2 closeAllConnections];
}

- (void)journalReconciliationFailed
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_FAULT, "Abort if mobilemail: journal reconciliation failed", v1, 2u);
}

uint64_t __51__MFMailMessageLibrary_journalReconciliationFailed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeDatabaseConnections];
}

- (void)handleFailedMigration
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Could not set protection class on %@", v2, v3, v4, v5, v6);
}

- (void)renameOrRemoveDatabaseIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(NSString *)self->_path stringByAppendingPathComponent:@".reset-database"];
  if ([v3 fileExistsAtPath:v4])
  {
    uint64_t v5 = MFLogGeneral();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v16 = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke;
    CFAbsoluteTime v17 = &unk_1E5D3D2D8;
    id v18 = self;
    id v19 = v3;
    id v20 = v4;
    uint8_t v6 = v5;
    id v7 = v15;
    uint64_t v8 = mach_absolute_time();
    v16(v7);
    uint64_t v9 = mach_absolute_time();
    if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1) {
      dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_2696);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v22 = @"#Performance Moving database files";
      __int16 v23 = 2048;
      double v24 = (double)((v9 - v8)
                   * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo
                   / *(unsigned int *)algn_1E976723C)
          / 1000000000.0;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:17];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_2;
  void v12[3] = &unk_1E5D3B6E0;
  id v11 = v3;
  id v13 = v11;
  uint64_t v14 = self;
  [v10 performBlock:v12];
}

uint64_t __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke(void *a1)
{
  [(id)objc_opt_class() _renameLibraryAtPath:*(void *)(a1[4] + 8)];
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  return [v2 removeItemAtPath:v3 error:0];
}

void __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) contentsOfDirectoryAtPath:*(void *)(*(void *)(a1 + 40) + 8) error:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v1)
  {
    uint64_t v3 = *(void *)v25;
    uint64_t v4 = @"SavedFolders";
    *(void *)&long long v2 = 138412546;
    long long v15 = v2;
    do
    {
      uint64_t v5 = 0;
      uint64_t v17 = v1;
      do
      {
        if (*(void *)v25 != v3) {
          objc_enumerationMutation(obj);
        }
        uint8_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * v5);
        if (objc_msgSend(v6, "hasPrefix:", v4, v15))
        {
          id v7 = MFLogGeneral();
          uint64_t v8 = [@"#Performance Removing " stringByAppendingString:v6];
          uint64_t v9 = v4;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          id v20 = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_3;
          id v21 = &unk_1E5D3B6E0;
          uint64_t v22 = *(void *)(a1 + 40);
          __int16 v23 = v6;
          uint64_t v10 = v7;
          id v11 = v8;
          uint64_t v12 = v19;
          uint64_t v13 = mach_absolute_time();
          v20((uint64_t)v12);
          uint64_t v14 = mach_absolute_time();
          if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1) {
            dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_2696);
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            id v30 = v11;
            __int16 v31 = 2048;
            double v32 = (double)((v14 - v13)
                         * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo
                         / *(unsigned int *)algn_1E976723C)
                / 1000000000.0;
            _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
          }

          uint64_t v4 = v9;
          uint64_t v1 = v17;
        }
        ++v5;
      }
      while (v1 != v5);
      uint64_t v1 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v1);
  }
}

void __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) stringByAppendingPathComponent:*(void *)(a1 + 40)];
  id v1 = (id)MFRemoveItemAtPath();
}

+ (void)removeLibraryOnNextLaunch
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = EDLibraryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "Mail db will be reset on next launch", (uint8_t *)&v8, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = MFMailDirectory();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@".reset-database"];
  char v6 = [v3 createFileAtPath:v5 contents:0 attributes:0];

  if ((v6 & 1) == 0)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = @".reset-database";
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Could not create %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (void)_renameLibraryAtPath:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  long long v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = [v23 stringByAppendingPathComponent:@"Envelope Index"];
  id v20 = [v23 stringByAppendingPathComponent:@"Protected Index"];
  id v18 = [v24 contentsOfDirectoryAtPath:v23 error:0];
  uint64_t v17 = objc_msgSend(@"SavedFolders", "mf_uniqueFilenameWithRespectToFilenames:");
  id v21 = objc_msgSend(v23, "stringByAppendingPathComponent:");
  objc_msgSend(v24, "mf_makeCompletePath:mode:", v21, 448);
  _MFMoveDatabase(v19, v21);
  _MFMoveDatabase(v20, v21);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v18;
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v27;
    uint64_t v22 = *MEMORY[0x1E4F283B8];
    uint64_t v5 = *MEMORY[0x1E4F283C0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v7 hasPrefix:@"SavedFolders"] & 1) == 0)
        {
          int v8 = [v23 stringByAppendingPathComponent:v7];
          uint64_t v9 = [v23 stringByAppendingPathComponent:v7];
          uint64_t v10 = [v24 attributesOfItemAtPath:v9 error:0];

          id v11 = [v10 objectForKey:v22];
          int v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            uint64_t v13 = (const std::__fs::filesystem::path *)[v8 fileSystemRepresentation];
            id v14 = [v21 stringByAppendingPathComponent:v7];
            long long v15 = (const std::__fs::filesystem::path *)[v14 fileSystemRepresentation];
            rename(v13, v15, v16);
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v3);
  }
}

- (id)_stringsForIndexSet:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MFMailMessageLibrary__stringsForIndexSet___block_invoke;
  v7[3] = &unk_1E5D3D300;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateIndexesUsingBlock:v7];

  return v5;
}

void __44__MFMailMessageLibrary__stringsForIndexSet___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  EFStringWithInt64();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

- (void)removeSearchableItemsForAccount:(id)a3
{
}

- (void)removeSearchableItemsForMailbox:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 account];
  -[MFMailMessageLibrary removeSearchableItemsForAccount:databaseID:](self, "removeSearchableItemsForAccount:databaseID:", v4, [v5 databaseID]);
}

- (void)removeSearchableItemsForMessages:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60DB8] indexSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MFMailMessageLibrary_removeSearchableItemsForMessages___block_invoke;
  v7[3] = &unk_1E5D3D350;
  id v6 = v5;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v7];
  [(MFMailMessageLibrary *)self _removeSearchableItemsWithLibraryIDs:v6];
}

void __57__MFMailMessageLibrary_removeSearchableItemsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "libraryID"));
}

- (void)removeSearchableItemsForAccount:(id)a3 databaseID:(int64_t)a4
{
  id v12 = a3;
  if (v12)
  {
    id v6 = MFUserAgent();
    int v7 = [v6 isMobileMail];

    if (v7)
    {
      if (*MEMORY[0x1E4F5FCC8] == a4)
      {
        id v8 = [v12 uniqueID];
      }
      else
      {
        uint64_t v9 = NSString;
        uint64_t v10 = [v12 uniqueID];
        id v8 = [v9 stringWithFormat:@"%@.%lld", v10, a4];
      }
      id v11 = [(MFMailMessageLibrary *)self searchableIndex];
      [v11 removeItemsForDomainIdentifier:v8];
    }
  }
}

- (void)_removeSearchableItemsWithLibraryIDs:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    id v4 = MFUserAgent();
    int v5 = [v4 isMobileMail];

    if (v5)
    {
      id v6 = [(MFMailMessageLibrary *)self _stringsForIndexSet:v8];
      int v7 = [(MFMailMessageLibrary *)self searchableIndex];
      [v7 removeItemsWithIdentifiers:v6];
    }
  }
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(MFMailMessageLibrary *)self searchableIndex];
  [v7 reindexSearchableItemsWithIdentifiers:v8 acknowledgementHandler:v6];
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailMessageLibrary *)self searchableIndex];
  [v4 reindexAllSearchableItemsWithAcknowledgementHandler:v5];
}

- (void)removeMessagesFromCacheWithLibraryIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MFWeakObjectCache removeObjectForKey:](self->_libraryMessageCache, "removeObjectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_libraryMessageCache
{
  return self->_libraryMessageCache;
}

void __109__MFMailMessageLibrary__messageForRow_options_timestamp_connection_isProtectedDataAvailable_recipientsCache___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKeyedSubscript:@"subject"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (id)senderForMessageWithLibraryID:(int64_t)a3
{
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__6;
  id v30 = __Block_byref_object_dispose__6;
  id v31 = 0;
  id v25 = 0;
  uint64_t v5 = [MEMORY[0x1E4F60B40] selectAddressesStatementWithResultColumns:&v25];
  id v6 = v25;
  uint64_t v7 = [MEMORY[0x1E4F60B40] messagesTableName];
  uint64_t v8 = *MEMORY[0x1E4F60D08];
  id v9 = (id)[v5 join:v7 sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"sender"];

  long long v10 = (void *)MEMORY[0x1E4F60E78];
  long long v11 = [MEMORY[0x1E4F60B40] messagesTableName];
  id v12 = [v10 table:v11 column:v8];

  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v14 = [v12 equalTo:v13];
  [v5 setWhere:v14];

  long long v15 = [(MFMailMessageLibrary *)self database];
  id v16 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary senderForMessageWithLibraryID:]"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke;
  void v21[3] = &unk_1E5D3C500;
  id v17 = v5;
  id v22 = v17;
  id v18 = v6;
  id v23 = v18;
  long long v24 = &v26;
  objc_msgSend(v15, "__performReadWithCaller:usingBlock:", v16, v21);

  id v19 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v19;
}

uint64_t __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke_2;
  v9[3] = &unk_1E5D3D378;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v7 = [a2 executeSelectStatement:v4 withBlock:v9 error:0];

  return v7;
}

void __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) first];
  uint64_t v4 = [v13 objectForKeyedSubscript:v3];
  id v5 = [v4 stringValue];

  uint64_t v6 = [*(id *)(a1 + 32) second];
  uint64_t v7 = [v13 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 stringValue];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v8];
  [v9 setDisplayName:v5];
  uint64_t v10 = [v9 emailAddressValue];
  uint64_t v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
}

- (id)_recipientsForMessagesWithDatabaseIDs:(id)a3 includeTo:(BOOL)a4 includeCC:(BOOL)a5 includeBCC:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  if (!v7 && !v6 && !v8)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MailMessageLibrary.m" lineNumber:7908 description:@"Must include at least one recipient type"];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%lu", 1);
    [v12 addObject:v13];
  }
  if (v7)
  {
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%lu", 2);
    [v12 addObject:v14];
  }
  if (v6)
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%lu", 3);
    [v12 addObject:v15];
  }
  id v16 = [NSString alloc];
  id v17 = [v11 valueForKey:@"stringValue"];
  id v18 = [v17 componentsJoinedByString:@","];
  id v19 = [v12 componentsJoinedByString:@","];
  id v20 = (void *)[v16 initWithFormat:@"SELECT addresses.address, addresses.comment, recipients.type, recipients.message FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message IN (%@) AND type IN (%@) ORDER BY recipients.position", v18, v19];

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v22 = [(MFMailMessageLibrary *)self database];
  id v23 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary _recipientsForMessagesWithDatabaseIDs:includeTo:includeCC:includeBCC:]"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke;
  v29[3] = &unk_1E5D3CB30;
  id v24 = v20;
  id v30 = v24;
  id v25 = v21;
  double v32 = self;
  SEL v33 = a2;
  id v31 = v25;
  objc_msgSend(v22, "__performReadWithCaller:usingBlock:", v23, v29);

  id v26 = v25;
  return v26;
}

uint64_t __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke_2;
  v9[3] = &unk_1E5D3D3A0;
  id v10 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 48);
  id v8 = 0;
  uint64_t v5 = [v4 executeUsingBlock:v9 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0) {
    [v3 handleError:v6 message:@"Fetching recipients"];
  }

  return v5;
}

void __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 objectForKeyedSubscript:@"address"];
  uint64_t v4 = [v3 stringValue];

  uint64_t v5 = [v13 objectForKeyedSubscript:@"comment"];
  id v6 = [v5 stringValue];

  BOOL v7 = [v13 objectForKeyedSubscript:@"type"];
  uint64_t v8 = [v7 integerValue];

  id v9 = [v13 objectForKeyedSubscript:@"message"];
  id v10 = [v9 numberValue];

  long long v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  if (!v11)
  {
    long long v11 = objc_alloc_init(_MFRecipientCollection);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  switch(v8)
  {
    case 3:
      [(_MFRecipientCollection *)v11 addBCCRecipientWithAddress:v4 displayName:v6];
      break;
    case 2:
      [(_MFRecipientCollection *)v11 addCCRecipientWithAddress:v4 displayName:v6];
      break;
    case 1:
      [(_MFRecipientCollection *)v11 addToRecipientWithAddress:v4 displayName:v6];
      break;
    default:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"MailMessageLibrary.m" lineNumber:7958 description:@"Unknown recipient type"];

      break;
  }
}

- (id)stringFromAllMailboxUnreadCount
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(MFMailMessageLibrary *)self database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary stringFromAllMailboxUnreadCount]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke;
  v8[3] = &unk_1E5D3D068;
  id v6 = v3;
  id v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

uint64_t __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 preparedStatementForQueryString:@"SELECT * FROM mailboxes;"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke_2;
  v9[3] = &unk_1E5D3C5E8;
  id v10 = *(id *)(a1 + 32);
  id v8 = 0;
  uint64_t v5 = [v4 executeUsingBlock:v9 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0) {
    [v3 handleError:v6 message:@"Selecting mailboxes"];
  }

  return v5;
}

void __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v28 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"url"];
  id v6 = [v5 stringValue];
  [v4 appendFormat:@"url: %@\n", v6];

  BOOL v7 = *(void **)(a1 + 32);
  id v8 = [v28 objectForKeyedSubscript:@"total_count"];
  id v9 = [v8 stringValue];
  [v7 appendFormat:@"  total Count: %@\n", v9];

  id v10 = *(void **)(a1 + 32);
  long long v11 = [v28 objectForKeyedSubscript:@"unread_count"];
  id v12 = [v11 stringValue];
  [v10 appendFormat:@"  unread Count: %@\n", v12];

  id v13 = *(void **)(a1 + 32);
  id v14 = [v28 objectForKeyedSubscript:@"deleted_count"];
  long long v15 = [v14 stringValue];
  [v13 appendFormat:@"  deleted Count: %@\n", v15];

  id v16 = *(void **)(a1 + 32);
  id v17 = [v28 objectForKeyedSubscript:@"flagged_count"];
  id v18 = [v17 stringValue];
  [v16 appendFormat:@"  flagged Count: %@\n", v18];

  id v19 = *(void **)(a1 + 32);
  id v20 = [v28 objectForKeyedSubscript:@"server_unread_count"];
  id v21 = [v20 stringValue];
  [v19 appendFormat:@"  server Unread Count: %@\n", v21];

  id v22 = *(void **)(a1 + 32);
  id v23 = [v28 objectForKeyedSubscript:@"last_sync_status_count"];
  id v24 = [v23 stringValue];
  [v22 appendFormat:@"  last Sync Status Count: %@\n", v24];

  id v25 = *(void **)(a1 + 32);
  id v26 = [v28 objectForKeyedSubscript:@"most_recent_status_count"];
  long long v27 = [v26 stringValue];
  [v25 appendFormat:@"  most Recent Status Count: %@\n", v27];
}

- (BOOL)messageDataExistsInDatabaseForMessageLibraryID:(int64_t)a3 part:(id)a4 length:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = @"SELECT length FROM message_data WHERE message_id = ? AND part = ?";
  if (!v8) {
    id v9 = @"SELECT length FROM message_data WHERE message_id = ? AND part IS NULL";
  }
  id v10 = v9;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  long long v11 = [(MFMailMessageLibrary *)self database];
  id v12 = [NSString stringWithUTF8String:"-[MFMailMessageLibrary messageDataExistsInDatabaseForMessageLibraryID:part:length:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke;
  v17[3] = &unk_1E5D3D3C8;
  id v13 = v10;
  id v18 = v13;
  int64_t v22 = a3;
  id v14 = v8;
  id v19 = v14;
  id v20 = &v27;
  id v21 = &v23;
  objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v17);

  if (a5) {
    *a5 = v28[3];
  }
  char v15 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

uint64_t __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preparedStatementForQueryString:*(void *)(a1 + 32)];
  uint64_t v5 = (sqlite3_stmt *)[v4 compiled];
  sqlite3_bind_int64(v5, 1, *(void *)(a1 + 64));
  id v6 = *(void **)(a1 + 40);
  if (v6) {
    sqlite3_bind_text(v5, 2, (const char *)[v6 UTF8String], -1, 0);
  }
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke_2;
  void v11[3] = &unk_1E5D3D130;
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = [v4 executeUsingBlock:v11 error:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0) {
    [v3 handleError:v8 message:@"Fetching message data"];
  }

  return v7;
}

void __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v6 = [v7 objectForKeyedSubscript:@"length"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;
}

- (EDWebContentParser)remoteContentParser
{
  p_remoteContentParserLocuint64_t k = &self->_remoteContentParserLock;
  os_unfair_lock_lock(&self->_remoteContentParserLock);
  remoteContentParser = self->_remoteContentParser;
  if (!remoteContentParser)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    int v6 = _os_feature_enabled_impl();
    id v7 = objc_alloc(MEMORY[0x1E4F60CA8]);
    if (v6) {
      uint64_t v8 = 7;
    }
    else {
      uint64_t v8 = 5;
    }
    id v9 = (EDWebContentParser *)[v7 initWithOptions:v8 cancelationToken:v5];
    id v10 = self->_remoteContentParser;
    self->_remoteContentParser = v9;

    remoteContentParser = self->_remoteContentParser;
  }
  long long v11 = remoteContentParser;
  os_unfair_lock_unlock(p_remoteContentParserLock);
  return v11;
}

- (BOOL)_shouldStoreRemoteContentForMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v6 = [v5 integerForKey:*MEMORY[0x1E4F60138]];

  if ((v6 & 1) == 0)
  {
    id v7 = EDLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = (uint64_t)v4;
      uint64_t v8 = "Skipping remote content parsing (not yet enabled by user): %{public}@";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_10:
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((v6 & 8) != 0)
  {
    id v7 = EDLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v6;
      __int16 v25 = 2114;
      id v26 = v4;
      uint64_t v8 = "Skipping remote content parsing (%lx): %{public}@";
      id v9 = v7;
      uint32_t v10 = 22;
      goto LABEL_10;
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  long long v11 = [(MFMailMessageLibrary *)self persistence];
  long long v12 = [v11 remoteContentManager];
  id v22 = 0;
  char v13 = [v12 shouldAddRemoteContentLinksForMessage:v4 logMessage:&v22];
  id v7 = v22;

  if ((v13 & 1) == 0)
  {
    id v17 = EDLibraryLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = (uint64_t)v7;
      __int16 v25 = 2114;
      id v26 = v4;
      id v18 = "Skipping remote content parsing (%{public}@): %{public}@";
      id v19 = v17;
      uint32_t v20 = 22;
LABEL_15:
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
LABEL_16:

    goto LABEL_17;
  }
  id v14 = [MEMORY[0x1E4F74230] sharedConnection];
  char v15 = [v14 isMailPrivacyProtectionAllowed];

  if ((v15 & 1) == 0)
  {
    id v17 = EDLibraryLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = (uint64_t)v4;
      id v18 = "Skipping remote content parsing (prohibited by MDM): %{public}@";
      id v19 = v17;
      uint32_t v20 = 12;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)_storeRemoteContentLinksCachedOnMessage:(id)a3 linksToVerify:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 remoteContentLinks];
  if (v7)
  {
    uint64_t v8 = [(MFMailMessageLibrary *)self persistence];
    id v9 = [v8 remoteContentManager];

    uint32_t v10 = +[MFPowerController sharedInstance];
    if ([v10 isPluggedIn])
    {
      int v11 = [v9 shouldVerifyRemoteLinks];

      if (v11)
      {
        id v12 = v7;
        BOOL v13 = 0;
LABEL_8:
        *a4 = v12;

        goto LABEL_9;
      }
    }
    else
    {
    }
    [v9 addRemoteContentLinks:v7];
    id v12 = 0;
    BOOL v13 = 1;
    goto LABEL_8;
  }
  BOOL v13 = 0;
  *a4 = 0;
LABEL_9:

  return v13;
}

- (void)storeRemoteContentLinksFromFullData:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MFMailMessageLibrary *)self _shouldStoreRemoteContentForMessage:v7])
  {
    id v11 = 0;
    BOOL v8 = [(MFMailMessageLibrary *)self _storeRemoteContentLinksCachedOnMessage:v7 linksToVerify:&v11];
    id v9 = v11;
    BOOL v10 = !v8;
  }
  else
  {
    id v9 = 0;
    BOOL v10 = 0;
  }
  [(MFMailMessageLibrary *)self _processMessageData:v6 forMessage:v7 linksToVerify:v9 parsingOptions:[(MFMailMessageLibrary *)self _parserRemoteContentOptionsForMessage:v7 shouldStoreRemoteContent:v10]];
}

- (void)_processMessageData:(id)a3 forMessage:(id)a4 linksToVerify:(id)a5 parsingOptions:(unint64_t)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v19 length];
  uint64_t v13 = objc_msgSend(v19, "mf_rangeOfRFC822HeaderData");
  uint64_t v15 = v14;
  if (v14 == v12)
  {
    if (a6) {
      -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v11);
    }
    BOOL v16 = 0;
    id v17 = 0;
  }
  else
  {
    uint64_t v18 = v13;
    id v17 = objc_msgSend(v19, "mf_subdataWithRange:", v13, v14);
    BOOL v16 = objc_msgSend(v19, "mf_subdataWithRange:", v18 + v15, v12 - (v18 + v15));
    [(MFMailMessageLibrary *)self _findHTMLPartsFromHeaderData:v17 bodyData:v16 forMessage:v10 linksToVerify:v11 parsingOptions:a6];
  }
}

- (void)_storeLinksToVerifyIfExistent:(void *)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v6 = v3;
    id v4 = [a1 persistence];
    id v5 = [v4 remoteContentManager];
    [v5 addRemoteContentLinks:v6];

    id v3 = v6;
  }
}

- (void)storeRemoteContentLinksFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MFMailMessageLibrary *)self _shouldStoreRemoteContentForMessage:v10])
  {
    id v14 = 0;
    BOOL v11 = [(MFMailMessageLibrary *)self _storeRemoteContentLinksCachedOnMessage:v10 linksToVerify:&v14];
    id v12 = v14;
    BOOL v13 = !v11;
  }
  else
  {
    id v12 = 0;
    BOOL v13 = 0;
  }
  [(MFMailMessageLibrary *)self _findHTMLPartsFromHeaderData:v8 bodyData:v9 forMessage:v10 linksToVerify:v12 parsingOptions:[(MFMailMessageLibrary *)self _parserRemoteContentOptionsForMessage:v10 shouldStoreRemoteContent:v13]];
}

- (void)_findHTMLPartsFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5 linksToVerify:(id)a6 parsingOptions:(unint64_t)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v39 = a4;
  id v38 = a5;
  id v13 = a6;
  int64_t v37 = v12;
  if ([v12 length] && objc_msgSend(v39, "length"))
  {
    id v32 = v13;
    id v14 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v15 = [v14 threadDictionary];

    uint64_t v16 = *MEMORY[0x1E4F73450];
    SEL v33 = v15;
    char v34 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F73450]];
    [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v16];
    id v35 = objc_alloc_init(MEMORY[0x1E4F73520]);
    id v36 = objc_alloc_init(MEMORY[0x1E4F73530]);
    uint64_t v31 = v16;
    [v35 setMessage:v38];
    [v35 setTopLevelPart:v36];
    [v36 setMimeBody:v35];
    [v36 parseMimeBodyFromHeaderData:v37 bodyData:v39 isPartial:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__MFMailMessageLibrary__findHTMLPartsFromHeaderData_bodyData_forMessage_linksToVerify_parsingOptions___block_invoke;
    aBlock[3] = &unk_1E5D3D3F0;
    id v30 = v39;
    id v41 = v30;
    id v42 = self;
    id v43 = v13;
    id v29 = v38;
    id v44 = v29;
    unint64_t v45 = a7;
    id v17 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v18 = [v35 textHtmlPart];
    if (v18)
    {
      v17[2](v17, v18);
      char v19 = 1;
      goto LABEL_20;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = [v35 topLevelPart];
    char v19 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      if (objc_msgSend(v22, "isHTML", v29))
      {
        uint64_t v23 = [v22 type];
        if ([v23 isEqualToString:@"multipart"])
        {
          uint64_t v24 = [v22 subtype];
          char v25 = [v24 isEqualToString:@"alternative"];

          if ((v25 & 1) == 0)
          {
            id v26 = [v22 subparts];
            [v21 addObjectsFromArray:v26];

LABEL_17:
            char v19 = 1;
            goto LABEL_18;
          }
        }
        else
        {
        }
        uint64_t v27 = [v22 textHtmlPart];

        if (!v27)
        {
          uint64_t v18 = 0;
          goto LABEL_17;
        }
        v17[2](v17, (void *)v27);
        char v19 = 1;
        uint64_t v18 = (void *)v27;
      }
LABEL_18:
      uint64_t v28 = [v21 lastObject];

      [v21 removeLastObject];
      id v22 = (void *)v28;
      if (!v28)
      {

LABEL_20:
        if (_os_feature_enabled_impl())
        {
          if (v19)
          {
LABEL_25:
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, v31, v29);

            id v13 = v32;
            goto LABEL_26;
          }
        }
        else if (v19 & 1 | ((_os_feature_enabled_impl() & 1) == 0))
        {
          goto LABEL_25;
        }
        -[MFMailMessageLibrary detectDataFromPlainTextMessage:forMessage:mimePart:](self, "detectDataFromPlainTextMessage:forMessage:mimePart:", v30, v29, v36, v29);
        goto LABEL_25;
      }
    }
  }
  uint32_t v20 = EDLibraryLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v47 = v38;
    _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing and data detection (no header or body data): %{public}@", buf, 0xCu);
  }

  -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v13);
LABEL_26:
}

void __102__MFMailMessageLibrary__findHTMLPartsFromHeaderData_bodyData_forMessage_linksToVerify_parsingOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  uint64_t v5 = [v3 range];
  id v7 = objc_msgSend(v4, "subdataWithRange:", v5, v6);
  [*(id *)(a1 + 40) _processRemoteContentFromData:v7 forMimePart:v8 linksToVerify:*(void *)(a1 + 48) forMessage:*(void *)(a1 + 56) parsingOptions:*(void *)(a1 + 64)];
}

- (void)storeRemoteContentLinksFromData:(id)a3 forMessage:(id)a4 mimePart:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MFMailMessageLibrary *)self _shouldStoreRemoteContentForMessage:v9])
  {
    id v14 = 0;
    BOOL v11 = [(MFMailMessageLibrary *)self _storeRemoteContentLinksCachedOnMessage:v9 linksToVerify:&v14];
    id v12 = v14;
    BOOL v13 = !v11;
  }
  else
  {
    id v12 = 0;
    BOOL v13 = 0;
  }
  [(MFMailMessageLibrary *)self _processRemoteContentFromData:v8 forMimePart:v10 linksToVerify:v12 forMessage:v9 parsingOptions:[(MFMailMessageLibrary *)self _parserRemoteContentOptionsForMessage:v9 shouldStoreRemoteContent:v13]];
}

- (void)_processRemoteContentFromData:(id)a3 forMimePart:(id)a4 linksToVerify:(id)a5 forMessage:(id)a6 parsingOptions:(unint64_t)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v13 isHTML])
  {
    uint64_t v16 = [v13 mimeBody];
    int v17 = [v16 hasEncryptedDescendantPart];

    if (v17)
    {
      uint64_t v18 = EDLibraryLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v15;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing (non-top-level encrypted part): %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v18 = [v13 decodedDataForData:v12];
      uint32_t v20 = [MEMORY[0x1E4F73528] preferredMimeCharset];
      char v25 = [v20 charsetName];

      id v26 = [(MFMailMessageLibrary *)self remoteContentParser];
      id v21 = [v15 persistentID];
      id v22 = [v15 subject];
      uint64_t v23 = [v22 subjectString];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke;
      v27[3] = &unk_1E5D3D440;
      id v28 = v14;
      id v29 = self;
      id v24 = v25;
      id v30 = v24;
      unint64_t v32 = a7;
      id v31 = v15;
      [v26 parseHTMLData:v18 characterEncodingName:v24 withOptions:a7 forMessage:v21 withSubject:v23 completionHandler:v27];
    }
  }
  else
  {
    char v19 = EDLibraryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v15;
      _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing (non-HTML part): %{public}@", buf, 0xCu);
    }

    -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v14);
  }
}

void __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke(uint64_t a1, void *a2)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = [v4 persistence];
    uint64_t v6 = [v5 remoteContentManager];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v3 remoteContentLinks];
    [v6 addRemoteContentLinks:v7 andVerifyWithParsedLinks:v8 defaultCharsetName:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = [v4 persistence];
    uint64_t v6 = [v5 remoteContentManager];
    id v8 = [v3 remoteContentLinks];
    [v6 addRemoteContentLinks:v8 requiredParsing:1];
  }

  uint64_t v9 = *(void *)(a1 + 64);
  if ((v9 & 2) != 0)
  {
    id v10 = [*(id *)(a1 + 40) persistence];
    BOOL v11 = [v10 dataDetectionPersistence];
    id v12 = [v3 dataDetectionResults];
    objc_msgSend(v11, "addDataDetectionResults:globalMessageID:", v12, objc_msgSend(*(id *)(a1 + 56), "globalMessageID"));

    uint64_t v9 = *(void *)(a1 + 64);
  }
  if ((v9 & 4) != 0)
  {
    id v13 = [*(id *)(a1 + 56) mailbox];
    char v14 = [v13 isOutgoingMailboxUid];

    if ((v14 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v16 = *(void **)(a1 + 40);
      int v17 = [*(id *)(a1 + 56) account];
      uint64_t v18 = [v16 messageBasePathForAccount:v17];
      char v19 = [v15 fileURLWithPath:v18 isDirectory:1];

      uint32_t v20 = [v3 richLinkResults];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke_2;
      v34[3] = &unk_1E5D3D418;
      void v34[4] = *(void *)(a1 + 40);
      id v35 = *(id *)(a1 + 56);
      id v21 = v19;
      id v36 = v21;
      [v20 enumerateObjectsUsingBlock:v34];
    }
  }
  if ((*(unsigned char *)(a1 + 64) & 8) != 0)
  {
    id v22 = [v3 oneTimeCode];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
      id v24 = [*(id *)(a1 + 40) hookRegistry];
      char v25 = [v3 oneTimeCode];
      id v26 = [*(id *)(a1 + 56) displayDate];
      uint64_t v27 = [*(id *)(a1 + 56) globalMessageID];
      id v28 = [*(id *)(a1 + 56) subject];
      id v29 = [v28 subjectString];
      id v30 = [*(id *)(a1 + 56) senders];
      [v24 didReceiveOneTimeCode:v25 timestamp:v26 messageID:v27 subject:v29 senders:v30];

      id v31 = objc_alloc(MEMORY[0x1E4F60260]);
      int64_t v37 = @"oneTimeCodeEvent";
      v38[0] = @"detected";
      unint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      SEL v33 = (void *)[v31 initWithEventName:@"com.apple.mail.oneTimeCodes" collectionData:v32];

      [*(id *)(*(void *)(a1 + 40) + 184) logOneTimeEvent:v33];
    }
  }
}

void __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) persistence];
  id v4 = [v3 richLinkPersistence];
  id v5 = (id)objc_msgSend(v4, "saveRichLinkData:globalMessageID:basePath:", v7, objc_msgSend(*(id *)(a1 + 40), "globalMessageID"), *(void *)(a1 + 48));

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x1E4F60998] object:*(void *)(a1 + 40)];
}

- (unint64_t)_parserRemoteContentOptionsForMessage:(id)a3 shouldStoreRemoteContent:(BOOL)a4
{
  BOOL v4 = a4;
  void v14[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(MFMailMessageLibrary *)self _shouldPerformDataDetectionForMessage:v6];
  uint64_t v8 = 4;
  if (v4) {
    uint64_t v8 = 5;
  }
  if (v7) {
    unint64_t v9 = v8 | 2;
  }
  else {
    unint64_t v9 = v8;
  }
  if (_os_feature_enabled_impl())
  {
    id v10 = [v6 dateReceived];
    char v11 = objc_msgSend(v10, "ef_isMoreThanTimeIntervalAgo:", 180.0);

    if (v11)
    {
      id v12 = EDLibraryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:]((uint64_t)v14, [v6 globalMessageID]);
      }
    }
    else
    {
      v9 |= 8uLL;
    }
  }

  return v9;
}

- (id)dataProvider
{
  attachmentDataProvider = self->_attachmentDataProvider;
  if (!attachmentDataProvider)
  {
    BOOL v4 = [[MFAttachmentLibraryDataProvider alloc] initWithLibrary:self];
    id v5 = self->_attachmentDataProvider;
    self->_attachmentDataProvider = v4;

    attachmentDataProvider = self->_attachmentDataProvider;
  }
  return attachmentDataProvider;
}

- (BOOL)_shouldPerformDataDetectionForMessage:(id)a3
{
  id v4 = a3;
  id v5 = @"feature not enabled";
  if (_os_feature_enabled_impl())
  {
    id v6 = [(MFMailMessageLibrary *)self persistence];
    BOOL v7 = [v6 remoteContentManager];
    id v10 = @"feature not enabled";
    char v8 = [v7 shouldAddRemoteContentLinksForMessage:v4 logMessage:&v10];
    id v5 = v10;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)detectDataFromPlainTextMessage:(id)a3 forMessage:(id)a4 mimePart:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    char v11 = [v9 dateReceived];
    char v12 = objc_msgSend(v11, "ef_isMoreThanTimeIntervalAgo:", 180.0);

    if (v12)
    {
      id v13 = EDLibraryLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:]((uint64_t)buf, [v9 globalMessageID]);
      }
    }
    else
    {
      uint64_t v14 = [v9 globalMessageID];
      id v15 = [v10 decodedDataForData:v8];
      id v13 = [(MFMailMessageLibrary *)self _getStringFromPlainTextData:v15 mimePart:v10];

      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v14);
      int v17 = EDLibraryLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v25 = v16;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Downloading plain text message %@, will perform one time code check", buf, 0xCu);
      }

      uint64_t v18 = [(MFMailMessageLibrary *)self remoteContentParser];
      char v19 = [v9 subject];
      uint32_t v20 = [v19 subjectString];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__MFMailMessageLibrary_detectDataFromPlainTextMessage_forMessage_mimePart___block_invoke;
      void v21[3] = &unk_1E5D3D468;
      void v21[4] = self;
      id v22 = v9;
      uint64_t v23 = v14;
      [v18 parseHTMLString:v13 withOptions:8 forMessage:v16 withSubject:v20 completionHandler:v21];
    }
  }
}

void __75__MFMailMessageLibrary_detectDataFromPlainTextMessage_forMessage_mimePart___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 oneTimeCode];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) hookRegistry];
    id v6 = [v3 oneTimeCode];
    BOOL v7 = [*(id *)(a1 + 40) displayDate];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) subject];
    id v10 = [v9 subjectString];
    char v11 = [*(id *)(a1 + 40) senders];
    [v5 didReceiveOneTimeCode:v6 timestamp:v7 messageID:v8 subject:v10 senders:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F60260]);
    id v15 = @"oneTimeCodeEvent";
    v16[0] = @"detected";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v14 = (void *)[v12 initWithEventName:@"com.apple.mail.oneTimeCodes" collectionData:v13];

    [*(id *)(*(void *)(a1 + 32) + 184) logOneTimeEvent:v14];
  }
}

- (id)_getStringFromPlainTextData:(id)a3 mimePart:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 textEncoding];
  BOOL v7 = (void *)MFCreateStringWithData();

  return v7;
}

- (EDSearchableIndexScheduler)searchableIndexScheduler
{
  return self->_searchableIndexScheduler;
}

- (void)setSearchableIndexScheduler:(id)a3
{
}

- (EDMessageQueryParser)queryParser
{
  return self->_queryParser;
}

- (void)setQueryParser:(id)a3
{
}

- (EFScheduler)fileRemovalAfterCompactionScheduler
{
  return self->_fileRemovalAfterCompactionScheduler;
}

- (void)setFileRemovalAfterCompactionScheduler:(id)a3
{
}

- (NSMutableDictionary)currentAddedMessagesMap
{
  return self->_currentAddedMessagesMap;
}

- (void)setCurrentAddedMessagesMap:(id)a3
{
}

- (void)setBodyMigrator:(id)a3
{
}

- (EFCancelable)stateCaptureCancelable
{
  return self->_stateCaptureCancelable;
}

- (NSCache)messagesParsedCache
{
  return self->_messagesParsedCache;
}

- (MFMessageAttachmentMigrator)attachmentMigrator
{
  return (MFMessageAttachmentMigrator *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAttachmentMigrator:(id)a3
{
}

- (OS_dispatch_queue)indexingQueue
{
  return self->_indexingQueue;
}

- (MFMailMessageLibrarySwiftPropertiesProtocol)swiftProperties
{
  return self->_swiftProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftProperties, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);
  objc_storeStrong((id *)&self->_attachmentMigrator, 0);
  objc_storeStrong((id *)&self->_stateCaptureCancelable, 0);
  objc_storeStrong((id *)&self->_bodyMigrator, 0);
  objc_storeStrong((id *)&self->_currentAddedMessagesMap, 0);
  objc_storeStrong((id *)&self->_fileRemovalAfterCompactionScheduler, 0);
  objc_storeStrong((id *)&self->_queryParser, 0);
  objc_storeStrong((id *)&self->_searchableIndexScheduler, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_optionsToQueries, 0);
  objc_storeStrong((id *)&self->_mailboxURLsToMailboxIDs, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_unreconciledMessageCountObservable, 0);
  objc_storeStrong((id *)&self->_messagesParsedCache, 0);
  objc_storeStrong((id *)&self->_remoteContentParser, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_parallelCompressionQueue, 0);
  objc_storeStrong((id *)&self->_messagesToThreadAtUnlock, 0);
  objc_storeStrong((id *)&self->_conversationCalculationQueue, 0);
  objc_storeStrong((id *)&self->_keyBagQueue, 0);
  objc_storeStrong((id *)&self->_enabledAccountMailboxesExpression, 0);
  objc_storeStrong((id *)&self->_nonLocalAccountClause, 0);
  objc_storeStrong((id *)&self->_activeMailboxesClause, 0);
  objc_storeStrong((id *)&self->_activeAccountsCondition, 0);
  objc_storeStrong((id *)&self->_statsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mailboxCache, 0);
  objc_storeStrong((id *)&self->_libraryMessageCache, 0);
  objc_storeStrong((id *)&self->_attachmentDataProvider, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)notifyNewData:(id)a3 availableForMessage:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = self;
  uint64_t v9 = sub_1A8A74A68();
  unint64_t v10 = v8;
  sub_1A82F5C48(v9, v8, a4);
  sub_1A80F42A8(v9, v10);
}

void __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  _os_log_debug_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEBUG, "found message flags discrepancy", v3, 2u);
}

- (void)_writeEmlxData:(int)a1 toFile:(NSObject *)a2 protectionClass:purgeable:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Failed to open temporary EMLX file: %{errno}d", (uint8_t *)v2, 8u);
}

- (void)_writeEmlxData:toFile:protectionClass:purgeable:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Unable to create URL for temporary EMLX file '%{public}s'", v2, v3, v4, v5, v6);
}

- (void)_writeEmlxData:(uint64_t)a3 toFile:protectionClass:purgeable:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_11_0((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "Failed to move temporary file into place '%{public}@': %@", v4, v5);
}

- (void)_writeEmlxData:(int)a1 toFile:(NSObject *)a2 protectionClass:purgeable:.cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "rename(2) failed (%{errno}d). Using NSFileManager fallback.", (uint8_t *)v2, 8u);
}

- (void)_writeEmlxData:(void *)a1 toFile:(uint8_t *)buf protectionClass:(int)a3 purgeable:(os_log_t)log .cold.5(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to mark file '%@' as purgeable: %{errno}d", buf, 0x12u);
}

- (void)_writeEmlxData:toFile:protectionClass:purgeable:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Failed to write data to temporary EMLX file: %@", v2, v3, v4, v5, v6);
}

- (void)addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12_1(&dword_1A7EFF000, v0, v1, "adding message references took %.2f (messageID: %lld)", v2);
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_10(&dword_1A7EFF000, v0, v1, "inserting message failed, rolling back transaction", v2);
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_10(&dword_1A7EFF000, v2, (uint64_t)v2, "Adding message with businessID of 0", v3);
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_3(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a4, (uint64_t)a3, "error importing message %{public}@, aborting", a2);
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_10(&dword_1A7EFF000, v2, (uint64_t)v2, "source mailbox is nil", v3);
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "[updateThreadingInfoForMessage] updating conversation id for message with library id %lld failed", (uint8_t *)a1);
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "The message didn't get updated: message.conversationID: %lld, resolved conversationID: %lld", (uint8_t *)a1, a4);
}

void __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "_enumerateNamesInDir failed (%{errno}d)", (uint8_t *)v2, 8u);
}

- (void)_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v0, v1, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox took %.3g s (%zi iterations)", v2);
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Could not execute sqlite statement: %@", v2, v3, v4, v5, v6);
}

void __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)urlForMailboxID:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Could not get url for mailboxID %lld", v2, v3, v4, v5, v6);
}

- (void)mailboxURLForMessage:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Trying to find mailbox for message with -1 mailbox ID: %lld", (uint8_t *)a1);
}

- (void)_canSelectMessagesWithOptions:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_10(&dword_1A7EFF000, v0, v1, "Trying to fetch messages after message persistence has been torn down", v2);
}

- (void)setData:(void *)a1 forMessage:(uint64_t)a2 isPartial:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Data for message %{public}@ is being processed multiple times", (uint8_t *)a2);
}

- (void)setSummary:(uint8_t *)buf forMessage:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Could not get mailbox for message %p (store: %p)", buf, 0x16u);
}

- (void)setSummary:forMessage:.cold.2()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_11_0(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "Could not get mailbox for message %{public}@ (store: %@)", v5, v6);
}

void __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, a2, a3, "Protected Data Not Available while fetching partName %@ for message %@", (uint8_t *)&v5);
}

- (void)bodyDataAtPath:headerData:.cold.1()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "Reading message from %{public}@ encountered error %{public}@", v5, v6);
}

- (void)dataForMimePart:(uint64_t)a3 isComplete:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_12_1(&dword_1A7EFF000, v6, v4, "#CacheLoads data from file at path %@ had error: %{public}@", v5);
}

void __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "%{public}@: Unable to form sql query, protected data available: %{public}@", v5, v6);
}

void __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "Error performing incremental vacuum: %s", (uint8_t *)a2);
}

void __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "SearchableIndex: Failed to prepare statement: %@", v2, v3, v4, v5, v6);
}

- (void)_messageForRow:(NSObject *)a3 options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.1(unsigned char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"YES";
  if (!*a1) {
    uint64_t v3 = @"NO";
  }
  int v4 = 134218242;
  uint64_t v5 = a2;
  __int16 v6 = 2114;
  __int16 v7 = v3;
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, a3, (uint64_t)a3, "Returning message with -1 mailbox ID: %lld (from cache = %{public}@)", (uint8_t *)&v4);
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Message has no sender: %lld", v2, v3, v4, v5, v6);
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_10(&dword_1A7EFF000, v0, v1, "Creating message with businessID 0", v2);
}

- (void)_messageForRow:(uint64_t)a3 options:(uint64_t)a4 timestamp:(uint64_t)a5 connection:(uint64_t)a6 isProtectedDataAvailable:(uint64_t)a7 recipientsCache:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "ConversationID 0 for message (LibraryID = %lld)", v2, v3, v4, v5, v6);
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Message has no mailbox: %lld", v2, v3, v4, v5, v6);
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.7()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "Message has -1 mailbox ID: %lld", v2, v3, v4, v5, v6);
}

- (void)_parserRemoteContentOptionsForMessage:(uint64_t)a1 shouldStoreRemoteContent:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_7_2(a1, a2, 3.8521e-34);
  OUTLINED_FUNCTION_12_1(&dword_1A7EFF000, v2, (uint64_t)v2, "Skipping one-time code detection in message: %lld, timestamp is older than %f seconds", v3);
}

@end