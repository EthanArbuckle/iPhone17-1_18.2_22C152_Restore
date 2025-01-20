@interface MFLegacyIMAPMailboxTaskManager
+ (OS_os_log)log;
- (BOOL)_selectMailbox:(id)a3 withConnection:(id)a4;
- (BOOL)_shouldContinueToPreservedUID:(unint64_t)a3;
- (BOOL)_waitForDataFromDownload:(id)a3 uid:(unsigned int)a4 downloadCache:(id)a5 connection:(id)a6;
- (BOOL)canFetchMessageIDs;
- (BOOL)checkUIDValidity:(unsigned int)a3 mailboxURL:(id)a4;
- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5;
- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5;
- (BOOL)errorIsIMAPError:(id)a3;
- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4;
- (BOOL)performOperationRequiringConnection:(BOOL)a3 withOptions:(unint64_t)a4 failedToSelectMailbox:(BOOL *)a5 operation:(id)a6;
- (BOOL)shouldUseIDLE;
- (EFCancelationToken)cancelationToken;
- (IMAPAccount)account;
- (MFLegacyIMAPMailboxTaskManager)initWithMailbox:(id)a3;
- (MFMailMessageLibrary)library;
- (MFMailboxUid)mailbox;
- (NSString)mailboxName;
- (id)_downloadForMessageBodyData:(id)a3 usingDownloadCache:(id)a4;
- (id)_fetchFullMessageDataForMessage:(id)a3 download:(id *)a4;
- (id)_idleConditionsObservable;
- (id)_newSearchResponseQueueForConnection:(id)a3 limit:(unsigned int)a4;
- (id)_observeChangesInIdleConditions;
- (id)_performBodyDataDownload:(id)a3 usingConnection:(id)a4 downloadCache:(id)a5 isPartial:(BOOL *)a6;
- (id)_searchFlagsForUIDs:(id)a3 usingConnection:(id)a4;
- (id)deletedMessages;
- (id)downloadSearchResults:(id)a3;
- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4;
- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4;
- (id)fetchHeadersForMessage:(id)a3;
- (id)flagsForIMAPUIDs:(id)a3 mailboxURL:(id)a4;
- (id)imapMailboxNameForMailboxURL:(id)a3;
- (id)messageDataForMessage:(id)a3;
- (id)messageDataForRemoteID:(id)a3 mailboxURL:(id)a4;
- (id)messageIdRollCall:(id)a3;
- (id)replayAction:(id)a3;
- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4;
- (id)sequenceIdentifierForUIDs:(id)a3;
- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (unint64_t)_fetchMessagesWithArguments:(id)a3 idRange:(id)a4 onConnection:(id)a5 synchronize:(BOOL)a6 limit:(unint64_t)a7 topUIDToCompact:(unint64_t)a8 topKnownUID:(unint64_t)a9 success:(BOOL *)a10 examinedRange:(_NSRange *)a11 fetchableUIDsFound:(unint64_t *)a12 preserveUID:(unint64_t *)a13 numFetchedUIDs:(unint64_t *)a14;
- (unint64_t)_fetchMessagesWithUIDs:(id)a3 connection:(id)a4 newCount:(unint64_t)a5 flagsToSet:(unint64_t)a6 queueClass:(Class)a7;
- (unint64_t)serverMessageCount;
- (unint64_t)syncMessagesWithUIDs:(id)a3 connection:(id)a4 serverMessages:(id)a5 flagSearchResults:(id)a6;
- (void)_fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4 withOptions:(unint64_t)a5 handler:(id)a6;
- (void)_fetchServerUnreadCountWithConnection:(id)a3;
- (void)_performActionsOnConnection:(id)a3 uidsToFetch:(id *)a4 uidsToSync:(id *)a5 messagesToCompact:(id *)a6 serverMessages:(id)a7 flagSearchResults:(id)a8 shouldForce:(BOOL)a9 newUIDsToFetch:(unsigned int *)a10;
- (void)_scheduleIdleTransition:(BOOL)a3;
- (void)_updateServerUnreadCount:(unint64_t)a3;
- (void)close;
- (void)compact;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5;
- (void)dealloc;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)growFetchWindow;
- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)reselectMailbox;
- (void)setCancelationToken:(id)a3;
- (void)setHighestModSequence:(unint64_t)a3;
- (void)setLibrary:(id)a3;
- (void)setSequenceIdentifier:(id)a3 forUIDs:(id)a4;
- (void)setServerMessageCount:(unint64_t)a3;
- (void)setShouldUseIDLE:(BOOL)a3;
- (void)updateDeletedCount;
- (void)updateDeletedCountWithNotDeletedCount:(unint64_t)a3;
- (void)updateServerUnreadCountClosingConnection:(BOOL)a3;
- (void)willRemoveDelegation:(id)a3;
@end

@implementation MFLegacyIMAPMailboxTaskManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFLegacyIMAPMailboxTaskManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1) {
    dispatch_once(&log_onceToken_12, block);
  }
  v2 = (void *)log_log_12;
  return (OS_os_log *)v2;
}

void __37__MFLegacyIMAPMailboxTaskManager_log__block_invoke(uint64_t a1)
{
  v2 = (const char *)[(id)*MEMORY[0x1E4F77E48] UTF8String];
  NSStringFromClass(*(Class *)(a1 + 32));
  id v5 = objc_claimAutoreleasedReturnValue();
  os_log_t v3 = os_log_create(v2, (const char *)[v5 UTF8String]);
  v4 = (void *)log_log_12;
  log_log_12 = (uint64_t)v3;
}

- (MFLegacyIMAPMailboxTaskManager)initWithMailbox:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MFLegacyIMAPMailboxTaskManager;
  v6 = [(MFLegacyIMAPMailboxTaskManager *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailbox, a3);
    uint64_t v8 = [v5 account];
    account = v7->_account;
    v7->_account = (IMAPAccount *)v8;

    v10 = [(MFLegacyIMAPMailboxTaskManager *)v7 account];
    uint64_t v11 = [v10 _nameForMailboxUid:v5];
    mailboxName = v7->_mailboxName;
    v7->_mailboxName = (NSString *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"CachedConnectionLock" andDelegate:0];
    cachedConnectionLock = v7->_cachedConnectionLock;
    v7->_cachedConnectionLock = (NSLock *)v13;

    v7->_activeFetchVsReplayLock._os_unfair_lock_opaque = 0;
    v15 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelationToken = v7->_cancelationToken;
    v7->_cancelationToken = v15;

    v17 = v7->_cancelationToken;
    v18 = [(MFLegacyIMAPMailboxTaskManager *)v7 _observeChangesInIdleConditions];
    [(EFCancelationToken *)v17 addCancelable:v18];

    v19 = NSString;
    v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "mailboxRowID"));
    v21 = [v19 stringWithFormat:@"com.apple.mail.imap.search.%@", v20];

    id v22 = v21;
    v23 = (const char *)[v22 UTF8String];
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = (OS_dispatch_queue *)v25;

    v27 = [(MFLegacyIMAPMailboxTaskManager *)v7 mailboxName];
    v28 = [v5 redactedName:v27];

    v29 = [MEMORY[0x1E4F60D58] currentDevice];
    int v30 = [v29 isInternal];

    v31 = NSString;
    if (v30)
    {
      v32 = (void *)MEMORY[0x1E4F60E00];
      v33 = [v5 account];
      v34 = [v33 displayName];
      v35 = [v32 partiallyRedactedStringForString:v34];
      uint64_t v36 = [v31 stringWithFormat:@"%@ - '%@'", v35, v28];
      loggingPrefix = v7->_loggingPrefix;
      v7->_loggingPrefix = (NSString *)v36;
    }
    else
    {
      v33 = [v5 account];
      v34 = [v33 uniqueID];
      uint64_t v38 = [v31 stringWithFormat:@"%@ - '%@'", v34, v28];
      v35 = v7->_loggingPrefix;
      v7->_loggingPrefix = (NSString *)v38;
    }

    v7->_serverCountLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancelationToken cancel];
  cachedConnection = self->_cachedConnection;
  if (cachedConnection)
  {
    v4 = +[MFMonitoredInvocation invocationWithSelector:sel_checkInConnection_ target:self->_account object:cachedConnection taskName:0 priority:13 canBeCancelled:0];
    id v5 = +[MFInvocationQueue sharedInvocationQueue];
    [v5 addInvocation:v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)MFLegacyIMAPMailboxTaskManager;
  [(MFLegacyIMAPMailboxTaskManager *)&v6 dealloc];
}

- (unint64_t)_fetchMessagesWithUIDs:(id)a3 connection:(id)a4 newCount:(unint64_t)a5 flagsToSet:(unint64_t)a6 queueClass:(Class)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543874;
    v29 = loggingPrefix;
    __int16 v30 = 2048;
    uint64_t v31 = [v12 count];
    __int16 v32 = 2048;
    unint64_t v33 = a5;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching skeletons for %lu uids (%lu new)", buf, 0x20u);
  }

  id v16 = objc_alloc_init(a7);
  v17 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  v18 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v19 = [v17 storeForMailboxUid:v18];
  v20 = (void *)*((void *)v16 + 6);
  *((void *)v16 + 6) = v19;

  objc_storeStrong((id *)v16 + 7, a4);
  *((void *)v16 + 8) = a5;
  *((void *)v16 + 10) = self->_highestModSequence;
  *((void *)v16 + 11) = a6;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __99__MFLegacyIMAPMailboxTaskManager__fetchMessagesWithUIDs_connection_newCount_flagsToSet_queueClass___block_invoke;
  v25[3] = &unk_1E5D3EE10;
  id v21 = v13;
  id v26 = v21;
  id v22 = v16;
  id v27 = v22;
  objc_msgSend(v12, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v25);
  unint64_t v23 = v22[9];

  return v23;
}

void __99__MFLegacyIMAPMailboxTaskManager__fetchMessagesWithUIDs_connection_newCount_flagsToSet_queueClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sendSkeletonResponsesForUIDs:includeTo:toQueue:");
  [*(id *)(a1 + 40) flush];
}

- (unint64_t)syncMessagesWithUIDs:(id)a3 connection:(id)a4 serverMessages:(id)a5 flagSearchResults:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v22 = a5;
  id v12 = a6;
  id v13 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543618;
    v24 = loggingPrefix;
    __int16 v25 = 2048;
    uint64_t v26 = [v10 count];
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching flags for %lu uids", buf, 0x16u);
  }

  v15 = objc_alloc_init(MFSyncResponseQueue);
  id v16 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  v17 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  v18 = [v16 storeForMailboxUid:v17];

  uint64_t v19 = [v18 URLString];
  url = v15->super._url;
  v15->super._url = (NSString *)v19;

  objc_storeStrong((id *)&v15->super._store, v18);
  objc_storeStrong((id *)&v15->super._connection, a4);
  objc_storeStrong((id *)&v15->super._serverMessages, a5);
  v15->super._shouldCompact = 0;
  v15->super._shouldFetch = 0;
  *(&v15->super._isSearching + 1) = 1;
  [v11 sendUidAndFlagResponsesForUIDs:v10 sequenceIdentifierProvider:self flagSearchResults:v12 toQueue:v15];
  [(MFBufferedQueue *)v15 flush];

  return 0;
}

- (void)_performActionsOnConnection:(id)a3 uidsToFetch:(id *)a4 uidsToSync:(id *)a5 messagesToCompact:(id *)a6 serverMessages:(id)a7 flagSearchResults:(id)a8 shouldForce:(BOOL)a9 newUIDsToFetch:(unsigned int *)a10
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v31 = a7;
  id v17 = a8;
  uint64_t v18 = [*a4 count];
  if (a9)
  {
    if (v18)
    {
      if (*a10)
      {
        uint64_t v19 = +[MFActivityMonitor currentMonitor];
        v20 = MFLookupLocalizedString(@"DOWNLOADING_STATUS_FORMAT", @"Downloading %@ of %@", @"Delayed");
        [v19 setDisplayName:v20 maxCount:*a10];

        unsigned int v21 = *a10;
      }
      else
      {
        unsigned int v21 = 0;
      }
      [(MFLegacyIMAPMailboxTaskManager *)self _fetchMessagesWithUIDs:*a4 connection:v16 newCount:v21 flagsToSet:0 queueClass:objc_opt_class()];
    }
    *a4 = 0;
    *a10 = 0;
  }
  if ([*a5 count])
  {
    if (a9)
    {
      id v22 = +[MFActivityMonitor currentMonitor];
      [v22 reset];
    }
    [(MFLegacyIMAPMailboxTaskManager *)self syncMessagesWithUIDs:*a5 connection:v16 serverMessages:v31 flagSearchResults:v17];
  }
  *a5 = 0;
  if (*a6 || a9)
  {
    uint64_t v23 = [*a6 count];
    if (v23)
    {
      v24 = +[MFLegacyIMAPMailboxTaskManager log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        loggingPrefix = self->_loggingPrefix;
        *(_DWORD *)buf = 138543618;
        unint64_t v33 = loggingPrefix;
        __int16 v34 = 2048;
        uint64_t v35 = v23;
        _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %lu messages during IMAP sync", buf, 0x16u);
      }

      uint64_t v26 = [(MFLegacyIMAPMailboxTaskManager *)self library];
      uint64_t v27 = [v26 messageChangeManager];
      id v28 = *a6;
      v29 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
      __int16 v30 = [v29 URL];
      [v27 reflectDeletedMessagesWithRemoteIDs:v28 mailboxURL:v30];
    }
    *a6 = 0;
  }
}

- (id)_searchFlagsForUIDs:(id)a3 usingConnection:(id)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v10 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v11 = [v9 storeForMailboxUid:v10];

  uint64_t v12 = [v11 unreadCount];
  if ([v6 count] >= (unint64_t)(2 * v12)) {
    +[MFIMAPConnectionFlagSearchRequest requestWithMask:1 searchTerms:&unk_1EFF50070 positiveMatch:0];
  }
  else {
  id v13 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:1 searchTerms:&unk_1EFF50088 positiveMatch:1];
  }
  [v8 addObject:v13];

  v14 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:2 searchTerms:&unk_1EFF500A0 positiveMatch:1];
  [v8 addObject:v14];

  v15 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:16 searchTerms:&unk_1EFF500B8 positiveMatch:1];
  [v8 addObject:v15];

  id v16 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:4 searchTerms:&unk_1EFF500D0 positiveMatch:1];
  [v8 addObject:v16];

  if (self->_supportsDollarForwardedFlag)
  {
    id v17 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:256 searchTerms:&unk_1EFF500E8 positiveMatch:1];
    [v8 addObject:v17];
  }
  if (self->_supportsForwardedFlag)
  {
    uint64_t v18 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:256 searchTerms:&unk_1EFF50100 positiveMatch:1];
    [v8 addObject:v18];
  }
  if (self->_supportsFlagColorBitFlags)
  {
    v32[0] = @"KEYWORD";
    v32[1] = @"$MailFlagBit0";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v20 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:0x20000000000 searchTerms:v19 positiveMatch:1];
    [v8 addObject:v20];

    v31[0] = @"KEYWORD";
    v31[1] = @"$MailFlagBit1";
    unsigned int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v22 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:0x40000000000 searchTerms:v21 positiveMatch:1];
    [v8 addObject:v22];

    v30[0] = @"KEYWORD";
    v30[1] = @"$MailFlagBit2";
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v24 = +[MFIMAPConnectionFlagSearchRequest requestWithMask:0x80000000000 searchTerms:v23 positiveMatch:1];
    [v8 addObject:v24];
  }
  if ([v7 supportsCapability:16])
  {
    uint64_t v25 = [v8 count];
    if (v25 << 8) {
      unint64_t v26 = v25 << 8;
    }
    else {
      unint64_t v26 = 2;
    }
  }
  else
  {
    uint64_t v27 = [v8 count];
    if ((unint64_t)(75 * v27) <= 2) {
      unint64_t v26 = 2;
    }
    else {
      unint64_t v26 = 75 * v27;
    }
  }
  if (v26 >= [v6 count])
  {
    id v28 = 0;
  }
  else
  {
    id v28 = [v7 searchUIDs:v6 withFlagRequests:v8];
  }

  return v28;
}

- (unint64_t)_fetchMessagesWithArguments:(id)a3 idRange:(id)a4 onConnection:(id)a5 synchronize:(BOOL)a6 limit:(unint64_t)a7 topUIDToCompact:(unint64_t)a8 topKnownUID:(unint64_t)a9 success:(BOOL *)a10 examinedRange:(_NSRange *)a11 fetchableUIDsFound:(unint64_t *)a12 preserveUID:(unint64_t *)a13 numFetchedUIDs:(unint64_t *)a14
{
  BOOL v106 = a6;
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  BOOL v130 = 0;
  id v111 = a5;
  v104 = v17;
  v105 = v18;
  v115 = [v111 searchIDSet:v18 forTerms:v17 success:&v130];
  uint64_t v19 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    uint64_t v21 = [v115 count];
    *(_DWORD *)buf = 138543874;
    if (v130) {
      id v22 = @"YES";
    }
    else {
      id v22 = @"NO";
    }
    unint64_t v134 = (unint64_t)loggingPrefix;
    __int16 v135 = 2048;
    unint64_t v136 = v21;
    __int16 v137 = 2112;
    unint64_t v138 = (unint64_t)v22;
    _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Search for recent UIDs returned %lu items (success=%@)", buf, 0x20u);
  }

  *a13 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v23 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  v24 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  v112 = [v23 storeForMailboxUid:v24];

  if (v130)
  {
    uint64_t v25 = [v115 count];
    if (v25)
    {
      if (v106)
      {
        v110 = [(MFLegacyIMAPMailboxTaskManager *)self _searchFlagsForUIDs:v115 usingConnection:v111];
      }
      else
      {
        v110 = 0;
      }
      if (a12) {
        *a12 += v25;
      }
      unint64_t v26 = [v115 objectAtIndex:0];
      NSUInteger v114 = [v26 unsignedIntegerValue];

      uint64_t v27 = [v115 lastObject];
      unint64_t v28 = [v27 unsignedIntegerValue];

      if (v28 <= a8) {
        unint64_t v29 = a8;
      }
      else {
        unint64_t v29 = v28;
      }
      NSUInteger v30 = v29 - v114;
      if (a11)
      {
        a11->location = v114;
        a11->length = v30;
      }
      NSUInteger v31 = v30 + 1;
      if (v30 + 1 > a7) {
        unint64_t v32 = v30 + 1;
      }
      else {
        unint64_t v32 = a7;
      }
      if (v32 >= 0x100) {
        unint64_t v32 = 256;
      }
      unint64_t v109 = v32;
      unint64_t v33 = [v112 serverMessagePersistence];
      __int16 v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v114, v31);
      v122 = [v33 serverMessagesForIMAPUIDs:v34 limit:v109 returnLastEntries:1];

      uint64_t v35 = [v122 firstObject];
      unsigned int v118 = [v35 imapUID];

      uint64_t v36 = [v115 count];
      uint64_t v37 = [v122 count];
      int v129 = 0;
      uint64_t v38 = +[MFLegacyIMAPMailboxTaskManager log];
      uint64_t v39 = v37 - 1;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v40 = self->_loggingPrefix;
        v41 = [v122 lastObject];
        int v42 = [v41 imapUID];
        *(_DWORD *)buf = 138545922;
        unint64_t v134 = (unint64_t)v40;
        __int16 v135 = 2112;
        unint64_t v136 = (unint64_t)v105;
        __int16 v137 = 2048;
        unint64_t v138 = a7;
        __int16 v139 = 2048;
        unint64_t v140 = a8;
        __int16 v141 = 2048;
        unint64_t v142 = a9;
        __int16 v143 = 2048;
        uint64_t v144 = v25;
        __int16 v145 = 2048;
        NSUInteger v146 = v114;
        __int16 v147 = 2048;
        unint64_t v148 = v29;
        __int16 v149 = 2048;
        uint64_t v150 = v39;
        __int16 v151 = 1024;
        unsigned int v152 = v118;
        __int16 v153 = 1024;
        int v154 = v42;
        _os_log_impl(&dword_1A7EFF000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: starting UID sync idRange=%@ limit=%lu topUIDToCompact=%lu topKnownUID=%lu UIDCount=%lu lowUID=%lu highUID=%lu serverMessagesIndex=%lu serverMessagesUIDs found=%u to %u", buf, 0x68u);
      }
      v43 = 0;
      id v44 = 0;
      v45 = 0;
      v107 = 0;
      unsigned int v108 = 0;
      BOOL v46 = 0;
      unint64_t v113 = 0;
      uint64_t v119 = v36 - 1;
      while (1)
      {
        if (v46 || v29 < v114)
        {
          if (v107)
          {
            v131[0] = @"MessageIsServerSearchResult";
            v131[1] = @"MessageIsThreadSearchResult";
            v132[0] = MEMORY[0x1E4F1CC28];
            v132[1] = MEMORY[0x1E4F1CC28];
            v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
            id v96 = (id)[v112 setFlagsLocallyFromDictionary:v95 forMessages:v107];
          }
          if (a14) {
            *a14 = v108;
          }
          id v124 = v45;
          id v125 = v44;
          id v123 = v43;
          LOBYTE(v103) = 1;
          [(MFLegacyIMAPMailboxTaskManager *)self _performActionsOnConnection:v111 uidsToFetch:&v125 uidsToSync:&v124 messagesToCompact:&v123 serverMessages:v122 flagSearchResults:v110 shouldForce:v103 newUIDsToFetch:&v129];
          id v97 = v125;

          id v98 = v124;
          id v99 = v123;

          goto LABEL_108;
        }
        context = (void *)MEMORY[0x1AD0E3E00]();
        if (v29 >= v118)
        {
          id v48 = v43;
          id v121 = v45;
        }
        else
        {
          id v128 = v44;
          id v126 = v43;
          id v127 = v45;
          LOBYTE(v103) = 0;
          [(MFLegacyIMAPMailboxTaskManager *)self _performActionsOnConnection:v111 uidsToFetch:&v128 uidsToSync:&v127 messagesToCompact:&v126 serverMessages:v122 flagSearchResults:v110 shouldForce:v103 newUIDsToFetch:&v129];
          id v47 = v128;

          id v121 = v127;
          id v48 = v126;

          id v49 = v47;
          v50 = [v112 serverMessagePersistence];
          v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v114, v118 - v114);
          v52 = [v50 serverMessagesForIMAPUIDs:v51 limit:v109 returnLastEntries:1];

          uint64_t v53 = [v52 count];
          v54 = [v52 firstObject];
          unsigned int v118 = [v54 imapUID];

          id v44 = v49;
          uint64_t v39 = v53 - 1;
          v122 = v52;
        }
        v55 = [v115 objectAtIndexedSubscript:v119];
        int v56 = [v55 intValue];

        BOOL v59 = *a13 != 0x7FFFFFFFFFFFFFFFLL && v29 >= *a13 || a7 != 0;
        if (!a7 && v59)
        {
          v60 = +[MFLegacyIMAPMailboxTaskManager log];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = self->_loggingPrefix;
            unint64_t v62 = *a13;
            *(_DWORD *)buf = 138543618;
            unint64_t v134 = (unint64_t)v61;
            __int16 v135 = 2048;
            unint64_t v136 = v62;
            _os_log_impl(&dword_1A7EFF000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: preserving UID %lu!", buf, 0x16u);
          }
        }
        char v63 = !v59;
        if (v29 != v56) {
          char v63 = 1;
        }
        if ((v63 & 1) == 0) {
          break;
        }
        if (v39 < 0)
        {
          uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v74 = [v122 objectAtIndexedSubscript:v39];
          unsigned int v75 = [v74 imapUID];

          uint64_t v76 = v75;
        }
        if (v76 == v29)
        {
          if (!v48) {
            id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v83 = +[MFLegacyIMAPMailboxTaskManager log];
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            v84 = self->_loggingPrefix;
            *(_DWORD *)buf = 138543618;
            unint64_t v134 = (unint64_t)v84;
            __int16 v135 = 2048;
            unint64_t v136 = v29;
            _os_log_impl(&dword_1A7EFF000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %lu (2)", buf, 0x16u);
          }

          v85 = [v122 objectAtIndexedSubscript:v39];
          v86 = [v85 remoteID];
          [v48 addObject:v86];

          --v39;
        }
LABEL_99:
        BOOL v46 = v29 == 0;
        if (v29) {
          --v29;
        }
        else {
          unint64_t v29 = 0;
        }
        v43 = v48;
        v45 = v121;
      }
      if (v39 < 0)
      {
LABEL_61:
        uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        while (1)
        {
          v64 = [v122 objectAtIndexedSubscript:v39];
          unsigned int v65 = [v64 imapUID];

          uint64_t v66 = v65;
          if (v29 >= v65) {
            break;
          }
          if (!v48) {
            id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v67 = +[MFLegacyIMAPMailboxTaskManager log];
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = self->_loggingPrefix;
            v69 = [v122 objectAtIndexedSubscript:v39];
            int v70 = [v69 imapUID];
            *(_DWORD *)buf = 138543618;
            unint64_t v134 = (unint64_t)v68;
            __int16 v135 = 1024;
            LODWORD(v136) = v70;
            _os_log_impl(&dword_1A7EFF000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: Compacting %u (1)", buf, 0x12u);
          }
          v71 = [v122 objectAtIndexedSubscript:v39];
          v72 = [v71 remoteID];
          [v48 addObject:v72];

          if (v39-- < 1) {
            goto LABEL_61;
          }
        }
      }
      if (v66 != v29)
      {
        if (!v44) {
          id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        v81 = +[MFLegacyIMAPMailboxTaskManager log];
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          v94 = self->_loggingPrefix;
          *(_DWORD *)buf = 138543618;
          unint64_t v134 = (unint64_t)v94;
          __int16 v135 = 2048;
          unint64_t v136 = v29;
          _os_log_debug_impl(&dword_1A7EFF000, v81, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching %lu", buf, 0x16u);
        }

        v77 = [v115 objectAtIndexedSubscript:v119];
        [v44 addObject:v77];
        if ([v77 intValue] > a9)
        {
          ++v129;
          ++v108;
        }
        unint64_t v82 = a7 - 1;
        if (!a7) {
          unint64_t v82 = 0;
        }
        a7 = v82;
        ++v113;
        goto LABEL_98;
      }
      v77 = [v122 objectAtIndexedSubscript:v39];
      v78 = [v77 serverFlags];
      unint64_t v79 = MFMessageFlagsForECMessageFlags(v78);

      if ((v79 & 0x80) != 0)
      {
        LODWORD(v80) = 1;
      }
      else
      {
        uint64_t v80 = (v79 >> 20) & 1;
        if (!v106 && (v79 & 0x100000) == 0)
        {
LABEL_97:
          --v39;
LABEL_98:

          --v119;
          goto LABEL_99;
        }
      }
      if (!v121) {
        id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      v87 = +[MFLegacyIMAPMailboxTaskManager log];
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v134 = v29;
        _os_log_debug_impl(&dword_1A7EFF000, v87, OS_LOG_TYPE_DEBUG, "Syncing %lu", buf, 0xCu);
      }

      v88 = [v115 objectAtIndexedSubscript:v119];
      objc_msgSend(v121, "ef_insertObject:usingComparator:allowDuplicates:", v88, &__block_literal_global_37, 0);
      if (v80)
      {
        v89 = [(MFLegacyIMAPMailboxTaskManager *)self library];
        v90 = [v77 messagePersistentID];
        v91 = objc_msgSend(v89, "messageWithLibraryID:options:inMailbox:", objc_msgSend(v90, "longLongValue"), 0, 0);

        if (v91)
        {
          id v92 = v107;
          if (!v107) {
            id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v107 = v92;
          [v92 addObject:v91];
        }
      }
      unint64_t v93 = a7 - 1;
      if (!a7) {
        unint64_t v93 = 0;
      }
      a7 = v93;

      ++v113;
      goto LABEL_97;
    }
  }
  unint64_t v113 = 0;
  if (a11) {
    *a11 = (_NSRange)xmmword_1A8AC6500;
  }
LABEL_108:
  if (a10) {
    *a10 = v130;
  }
  v100 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    v101 = self->_loggingPrefix;
    *(_DWORD *)buf = 138543618;
    unint64_t v134 = (unint64_t)v101;
    __int16 v135 = 2048;
    unint64_t v136 = v113;
    _os_log_impl(&dword_1A7EFF000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: _fetchMessagesWithArguments returns %lu", buf, 0x16u);
  }

  return v113;
}

- (void)updateDeletedCountWithNotDeletedCount:(unint64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__MFLegacyIMAPMailboxTaskManager_updateDeletedCountWithNotDeletedCount___block_invoke;
  v4[3] = &unk_1E5D3EE58;
  v4[4] = self;
  v4[5] = a3;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:65 failedToSelectMailbox:0 operation:v4];
  os_unfair_lock_lock(&self->_serverCountLock);
  self->_settingServerCount = 0;
  os_unfair_lock_unlock(&self->_serverCountLock);
}

void __72__MFLegacyIMAPMailboxTaskManager_updateDeletedCountWithNotDeletedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v10 = 0;
  v4 = NSString;
  id v5 = [*(id *)(a1 + 32) account];
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"%lu:*", objc_msgSend(v5, "minID"));
  uint64_t v7 = [v3 countForSearchOfIDSet:v6 forTerms:&unk_1EFF50118 success:&v10];

  uint64_t v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_lock(v8);
  *(void *)(*(void *)(a1 + 32) + 40) = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(*(void *)(a1 + 32) + 40) + v9;
  }
  os_unfair_lock_unlock(v8);
}

- (void)updateDeletedCount
{
}

- (BOOL)_shouldContinueToPreservedUID:(unint64_t)a3
{
  v4 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v5 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v6 = [v4 storeForMailboxUid:v5];

  uint64_t v7 = EFStringWithUnsignedInteger();
  uint64_t v8 = [v6 messageForRemoteID:v7];

  if (v8) {
    BOOL v9 = ([v8 messageFlags] & 0x80) == 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)growFetchWindow
{
  self->_lastHighestModSequence = 0;
  self->_highestModSequence = 0;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  uint64_t v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  BOOL v9 = +[MFActivityMonitor currentMonitor];
  [v9 setMailbox:v8];

  char v10 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    loggingPrefix = self->_loggingPrefix;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = loggingPrefix;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v51 = a3;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: fetchNumMessages started with options 0x%lX, numMessages = %lu", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  unint64_t v51 = -1;
  uint64_t v39 = 0;
  objc_super v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v12 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v13 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  v14 = [v12 storeForMailboxUid:v13];

  os_unfair_lock_lock(&self->_activeFetchVsReplayLock);
  v15 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    id v17 = [v16 hostname];
    -[MFLegacyIMAPMailboxTaskManager fetchNumMessages:preservingUID:options:](v17, v49, v15, v16);
  }

  [v14 willFetchMessages];
  uint64_t v47 = *MEMORY[0x1E4F60970];
  id v18 = [v8 objectID];
  id v48 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 postNotificationName:*MEMORY[0x1E4F60978] object:self userInfo:v19];

  if ((a5 & 0x40) != 0) {
    uint64_t v21 = 49;
  }
  else {
    uint64_t v21 = 17;
  }
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F608C8]) initWithDomain:21 type:8];
  [v22 startActivity];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke;
  void v32[3] = &unk_1E5D3EE80;
  v32[4] = self;
  unint64_t v37 = a3;
  id v23 = v31;
  id v33 = v23;
  unint64_t v38 = a5;
  id v24 = v14;
  id v34 = v24;
  uint64_t v35 = buf;
  uint64_t v36 = &v39;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:v21 failedToSelectMailbox:0 operation:v32];
  [v22 stopActivityWithSuccess:*(void *)(*(void *)&buf[8] + 24) >= 0];
  uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 postNotificationName:*MEMORY[0x1E4F60968] object:self userInfo:v19];

  unint64_t v26 = +[MFActivityMonitor currentMonitor];
  [v26 reset];

  os_unfair_lock_unlock(&self->_activeFetchVsReplayLock);
  int64_t v27 = *(void *)(*(void *)&buf[8] + 24);
  if ((v27 & 0x8000000000000000) == 0) {
    int64_t v27 = v40[3];
  }
  unint64_t v28 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v29 = self->_loggingPrefix;
    *(_DWORD *)v43 = 138543618;
    id v44 = v29;
    __int16 v45 = 2048;
    int64_t v46 = v27;
    _os_log_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: fetchNumMessages finished with result %ld", v43, 0x16u);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v71 = a2;
  v68 = [*(id *)(a1 + 32) mailboxName];
  unsigned int v65 = [*(id *)(a1 + 32) mailbox];
  v67 = [v71 selectedMailbox];
  if (!v68 || !v67 || ([v68 isEqualToString:v67] & 1) != 0) {
    goto LABEL_18;
  }
  int v3 = [v71 isValid];
  v4 = [v65 redactedName:v68];
  id v5 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v62 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v67];
    char v63 = (void *)v62;
    v64 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&uint8_t buf[4] = v4;
    if (v3) {
      v64 = @"YES";
    }
    *(void *)&buf[14] = v62;
    __int16 v80 = 2048;
    id v81 = v71;
    __int16 v82 = 2114;
    v83 = v64;
    _os_log_error_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_ERROR, "store and connection mailboxes differ: store=%@ connection=%@ (%p, valid: '%{public}@')", buf, 0x2Au);
  }
  if (v3)
  {
    if ([*(id *)(a1 + 32) _selectMailbox:v68 withConnection:v71])
    {
      char v6 = 0;
      goto LABEL_13;
    }
    uint64_t v7 = +[MFLegacyIMAPMailboxTaskManager log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_3();
    }
  }
  else
  {
    uint64_t v7 = +[MFLegacyIMAPMailboxTaskManager log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_4();
    }
  }

  char v6 = 1;
LABEL_13:
  uint64_t v8 = [MEMORY[0x1E4F60D58] currentDevice];
  int v9 = [v8 isInternal];

  if (v9)
  {
    char v10 = +[MFLegacyIMAPMailboxTaskManager log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_2();
    }
  }
  if ((v6 & 1) == 0)
  {
LABEL_18:
    unint64_t v72 = *(void *)(a1 + 72);
    [v71 setIsFetching:1];
    id v11 = +[MFLegacyIMAPMailboxTaskManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [*(id *)(a1 + 32) account];
      id v13 = [v12 hostname];
      __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_1(v13, v78, v11, v12);
    }

    unint64_t v76 = 0xAAAAAAAAAAAAAAAALL;
    v14 = *(void **)(a1 + 40);
    if (v14) {
      uint64_t v15 = (int)[v14 intValue];
    }
    else {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v76 = v15;
    id v16 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
    os_unfair_lock_lock(v16);
    unint64_t v66 = *(void *)(*(void *)(a1 + 32) + 32);
    os_unfair_lock_unlock(v16);
    id v17 = *(void **)(a1 + 48);
    unint64_t v70 = *(void *)(a1 + 80);
    if ((v70 & 4) != 0)
    {
      id v18 = [v17 serverMessagePersistence];
      uint64_t v19 = [v18 minimumIMAPUID];

      if (v19)
      {
        unsigned int v20 = [v71 getMailboxIDForUID:v19];
        if (v20)
        {
          uint64_t v21 = v72;
          unint64_t v66 = v20 - 1;
          if (v66 < v72) {
            uint64_t v21 = v20 - 1;
          }
          unint64_t v72 = v21;
        }
        else
        {
          uint64_t v25 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
          os_unfair_lock_lock(v25);
          unint64_t v66 = *(void *)(*(void *)(a1 + 32) + 32);
          os_unfair_lock_unlock(v25);
        }
        uint64_t v24 = (v19 - 1);
        uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      id v22 = [v17 serverMessagePersistence];
      unsigned int v23 = [v22 maximumIMAPUID];

      uint64_t v24 = v23;
      uint64_t v69 = v23;
    }
    unint64_t v26 = [*(id *)(a1 + 32) account];
    uint64_t v27 = [v26 minID];
    unint64_t v28 = v72 - 1;
    if (v72 <= 1) {
      unint64_t v28 = 1;
    }
    uint64_t v29 = v66 - 1;
    if (v66 <= 1) {
      uint64_t v29 = 1;
    }
    if (v66 <= v28) {
      unint64_t v30 = v29;
    }
    else {
      unint64_t v30 = v28;
    }
    if (v66 <= v28) {
      uint64_t v31 = v27;
    }
    else {
      uint64_t v31 = v66 - v28;
    }

    char v75 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *(_OWORD *)buf = xmmword_1A8AC6500;
    uint64_t v74 = 0;
    if ([v71 supportsCapability:18])
    {
      unint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = v32[7];
      if (!v33) {
        goto LABEL_50;
      }
      if (v33 != v32[6]) {
        goto LABEL_47;
      }
      id v34 = [v32 mailboxName];
      v77 = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
      [v71 fetchStatusForMailboxes:v35 args:&unk_1EFF50130];

      unint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = v32[7];
      if (v33)
      {
LABEL_47:
        uint64_t v36 = v32[6];
        v32[6] = v33;
        if ((v70 & 4) == 0 && v33 == v36)
        {
          [v71 setIsFetching:0];
          goto LABEL_105;
        }
      }
      else
      {
LABEL_50:
        v32[6] = 0;
      }
    }
    uint64_t v37 = 0;
    BOOL v38 = 0;
    unint64_t v39 = v72;
    while (v37 != 0x7FFFFFFFFFFFFFFFLL
         && (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < v72
          || v76 != 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(*(id *)(a1 + 32), "_shouldContinueToPreservedUID:")
          && *(void *)buf > v76)
         && v30
         && v75 != 0
         && !v38)
    {
      objc_super v40 = (void *)MEMORY[0x1AD0E3E00]();
      uint64_t v73 = 0;
      uint64_t v41 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
      os_unfair_lock_lock(v41);
      unint64_t v42 = *(void *)(*(void *)(a1 + 32) + 32);
      os_unfair_lock_unlock(v41);
      if (v31 + v30 >= v42) {
        objc_msgSend(NSString, "stringWithFormat:", @"%lu:*", v31);
      }
      else {
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%lu", v31, v31 + v30);
      }
      uint64_t v44 = [*(id *)(a1 + 32) _fetchMessagesWithArguments:&unk_1EFF50148 idRange:v43 onConnection:v71 synchronize:(v70 & 8) == 0 limit:v72 - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) topUIDToCompact:v24 topKnownUID:v69 success:&v75 examinedRange:buf fetchableUIDsFound:&v74 preserveUID:&v76 numFetchedUIDs:&v73];
      uint64_t v37 = v44;
      if (v44 != 0x7FFFFFFFFFFFFFFFLL) {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v44;
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v73;
      __int16 v45 = [*(id *)(a1 + 32) account];
      BOOL v38 = [v45 minID] == v31;

      v39 *= 2;
      if (!v38)
      {
        uint64_t v46 = *(void *)buf - 1;
        if (!*(void *)buf) {
          uint64_t v46 = 0;
        }
        if (*(void *)buf != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v24 = v46;
        }
        uint64_t v47 = [*(id *)(a1 + 32) account];
        uint64_t v48 = [v47 minID];
        unint64_t v49 = v31 - 1;
        unint64_t v50 = v39 - 1;
        if (!v39) {
          unint64_t v50 = 1;
        }
        uint64_t v51 = v31 - 2;
        if (v49 <= 1) {
          uint64_t v51 = 1;
        }
        BOOL v52 = v49 > v50;
        unint64_t v53 = v49 - v50;
        if (v52) {
          unint64_t v30 = v50;
        }
        else {
          unint64_t v30 = v51;
        }
        if (v52) {
          uint64_t v31 = v53;
        }
        else {
          uint64_t v31 = v48;
        }
      }
      unint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [v71 setIsFetching:0];
    v54 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
    os_unfair_lock_lock(v54);
    if (v38 && (uint64_t v55 = *(void *)(a1 + 32), v66 == *(void *)(v55 + 32)) && !*(unsigned char *)(v55 + 11))
    {
      *(unsigned char *)(v55 + 11) = 1;
      os_unfair_lock_unlock(v54);
      [*(id *)(a1 + 32) updateDeletedCountWithNotDeletedCount:v74];
    }
    else
    {
      os_unfair_lock_unlock(v54);
    }
    uint64_t v56 = *(void *)(a1 + 56);
    if (v75)
    {
      unint64_t v57 = *(void *)(*(void *)(v56 + 8) + 24);
      if (v57 | v70 & 4)
      {
        if (*(void *)buf && *(void *)buf != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v58 = v76 - 1;
          if (*(void *)buf - 1 < v76 - 1) {
            uint64_t v58 = *(void *)buf - 1;
          }
          if (v76 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v59 = *(void *)buf - 1;
          }
          else {
            uint64_t v59 = v58;
          }
          if (v57 < v72) {
            int v60 = 1;
          }
          else {
            int v60 = (v70 >> 1) & 1;
          }
          if (v60) {
            unint64_t v61 = 0;
          }
          else {
            unint64_t v61 = 500;
          }
          compactMessagesToUID(*(void **)(a1 + 32), v59, v61);
        }
      }
      else
      {
        compactMessagesToUID(*(void **)(a1 + 32), 0xFFFFFFFFLL, 0);
      }
      if (v75) {
        goto LABEL_105;
      }
      uint64_t v56 = *(void *)(a1 + 56);
    }
    *(void *)(*(void *)(v56 + 8) + 24) = -1;
LABEL_105:
    if ((v70 & 0x20) != 0) {
      [*(id *)(a1 + 32) _fetchServerUnreadCountWithConnection:v71];
    }
  }
}

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 33;
  }
  else {
    uint64_t v3 = 1;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__MFLegacyIMAPMailboxTaskManager_updateServerUnreadCountClosingConnection___block_invoke;
  v4[3] = &unk_1E5D3EEA8;
  v4[4] = self;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:v3 failedToSelectMailbox:0 operation:v4];
}

uint64_t __75__MFLegacyIMAPMailboxTaskManager_updateServerUnreadCountClosingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchServerUnreadCountWithConnection:a2];
}

- (void)_fetchServerUnreadCountWithConnection:(id)a3
{
  id v4 = a3;
  char v28 = 0;
  id v5 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  char v6 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v7 = [v5 storeForMailboxUid:v6];

  os_unfair_lock_lock(&self->_serverCountLock);
  unint64_t v8 = [v7 totalCount];
  unint64_t serverMessageCount = self->_serverMessageCount;
  os_unfair_lock_unlock(&self->_serverCountLock);
  if (v8 >= serverMessageCount
    || ([v7 serverMessagePersistence],
        char v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 minimumIMAPUID],
        v10,
        v11 < 2))
  {
    [(MFLegacyIMAPMailboxTaskManager *)self _updateServerUnreadCount:0];
  }
  else
  {
    uint64_t v12 = [v4 messageSetForRange:((unint64_t)(v11 - 1) << 32) | 1];
    id v13 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
    if ([v13 shouldUseNonDeletedForUnreadCount]) {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"UNDELETED", 0);
    }
    else {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"UNSEEN", @"UNDELETED", 0);
    }
    uint64_t v15 = (void *)v14;

    uint64_t v16 = [v4 countForSearchOfUidSet:v12 forTerms:v15 success:&v28];
    if (v28) {
      [(MFLegacyIMAPMailboxTaskManager *)self _updateServerUnreadCount:v16];
    }
  }
  id v17 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  char v18 = [v17 shouldUseNonDeletedForUnreadCount];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    unsigned int v20 = [v19 baseAccount];
    int v21 = [v20 isGmailAccount];

    if (v21)
    {
      id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", 0x1EFF1ED28, 0);
      id v23 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v24 = [(MFLegacyIMAPMailboxTaskManager *)self mailboxName];
      uint64_t v25 = objc_msgSend(v23, "initWithObjects:", v24, 0);

      [v4 fetchStatusForMailboxes:v25 args:v22];
      goto LABEL_16;
    }
    uint64_t v26 = [v4 countForSearchOfIDSet:0x1EFF14E88 forTerms:&unk_1EFF50160 success:&v28];
    if (v28)
    {
      uint64_t v27 = v26;
      id v22 = [v7 URLString];
      if (!v22)
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v25 = [(MFLegacyIMAPMailboxTaskManager *)self library];
      [v25 setLastSyncAndMostRecentStatusCount:v27 forMailbox:v22];
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)_updateServerUnreadCount:(unint64_t)a3
{
  id v5 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  char v6 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v9 = [v5 storeForMailboxUid:v6];

  uint64_t v7 = [(MFLegacyIMAPMailboxTaskManager *)self library];
  unint64_t v8 = [v9 URLString];
  [v7 setServerUnreadOnlyOnServerCount:a3 forMailbox:v8];
}

- (id)_newSearchResponseQueueForConnection:(id)a3 limit:(unsigned int)a4
{
  char v6 = (MFIMAPConnection *)a3;
  uint64_t v7 = objc_alloc_init(MFSearchResponseQueue);
  unint64_t v8 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v9 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  char v10 = [v8 storeForMailboxUid:v9];

  v7->limit = a4;
  uint64_t v11 = [(MFLibraryStore *)v10 URLString];
  url = v7->super._url;
  v7->super._url = (NSString *)v11;

  store = v7->super._store;
  v7->super._store = v10;
  uint64_t v14 = v10;

  connection = v7->super._connection;
  v7->super._connection = v6;

  v7->super._shouldCompact = 0;
  v7->super._shouldFetch = 1;
  v7->super._isSearching = 1;
  return v7;
}

- (void)_fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4 withOptions:(unint64_t)a5 handler:(id)a6
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v33[0] = v10;
  uint64_t v12 = +[MFMessageCriterion messageIsDeletedCriterion:0];
  v33[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v14 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v13];

  uint64_t v15 = [v14 criterionForSQL];
  uint64_t v29 = 0;
  unint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  unint64_t v16 = a5 | 0x41;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __92__MFLegacyIMAPMailboxTaskManager__fetchMessagesMatchingCriterion_limit_withOptions_handler___block_invoke;
  id v23 = &unk_1E5D3EED0;
  id v17 = v15;
  id v24 = v17;
  id v18 = v11;
  id v26 = v18;
  uint64_t v27 = &v29;
  uint64_t v25 = self;
  unsigned int v28 = a4;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:v16 failedToSelectMailbox:0 operation:&v20];
  if (!*((unsigned char *)v30 + 24))
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"LibraryIMAPStoreErrorDomain", 2, 0, v20, v21, v22, v23, v24);
    (*((void (**)(id, uint64_t, void, void *))v18 + 2))(v18, 0x7FFFFFFFFFFFFFFFLL, 0, v19);
  }
  _Block_object_dispose(&v29, 8);
}

void __92__MFLegacyIMAPMailboxTaskManager__fetchMessagesMatchingCriterion_limit_withOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v4 = fetchArgumentsForCriterion(*(void **)(a1 + 32), 1);
  if (v4)
  {
    id v5 = (void *)[*(id *)(a1 + 40) _newSearchResponseQueueForConnection:v8 limit:*(unsigned int *)(a1 + 64)];
    [v8 sendUidResponsesForSearchArguments:v4 toQueue:v5];
    [v5 flush];
    uint64_t v6 = v5[10];
    if (v6) {
      [*(id *)(a1 + 40) _fetchMessagesWithUIDs:v6 connection:v8 newCount:0x7FFFFFFFFFFFFFFFLL flagsToSet:128 queueClass:objc_opt_class()];
    }
    uint64_t v7 = [v5 indexSet];
    [v3 addIndexes:v7];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) _fetchServerUnreadCountWithConnection:v8];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LibraryIMAPStoreErrorDomain" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (id)messageIdRollCall:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__12;
  uint64_t v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__MFLegacyIMAPMailboxTaskManager_messageIdRollCall___block_invoke;
  v8[3] = &unk_1E5D3EEF8;
  id v9 = v4;
  id v10 = &v11;
  id v5 = v4;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:17 failedToSelectMailbox:0 operation:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MFLegacyIMAPMailboxTaskManager_messageIdRollCall___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 _uidsForMessageIDs:*(void *)(a1 + 32) excludeDeleted:1];
  if (![v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    goto LABEL_5;
  }
  uint64_t v4 = [v3 count];
  if (v4 == [*(id *)(a1 + 32) count])
  {
    id v5 = (id)[*(id *)(a1 + 32) copy];
LABEL_5:
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    goto LABEL_7;
  }
  uint64_t v7 = [v13 fetchMessageIdsForUids:v3];
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v9 = [v7 allValues];
  uint64_t v10 = [v8 initWithArray:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_7:
}

- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__12;
    v17[4] = __Block_byref_object_dispose__12;
    id v18 = 0;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __60__MFLegacyIMAPMailboxTaskManager_searchWithCriterion_limit___block_invoke;
    uint64_t v14 = &unk_1E5D3EF20;
    id v8 = v7;
    id v15 = v8;
    id v16 = v17;
    [(MFLegacyIMAPMailboxTaskManager *)self _fetchMessagesMatchingCriterion:v6 limit:v4 withOptions:0 handler:&v11];
    id v9 = objc_msgSend(v8, "future", v11, v12, v13, v14);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __60__MFLegacyIMAPMailboxTaskManager_searchWithCriterion_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    uint64_t v7 = objc_opt_new();
    for (uint64_t i = [v16 firstIndex]; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend(v16, "indexGreaterThanIndex:", i))
    {
      id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
      [v7 addObject:v9];
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [[MFUIDSet alloc] initWithUIDs:v7];
    [v10 finishWithResult:v11];
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)[v6 copy];
    [v12 finishWithError:v7];
  }

  uint64_t v13 = [v6 copy];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)downloadSearchResults:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uids];
  id v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_140);
  uint64_t v7 = [(MFLegacyIMAPMailboxTaskManager *)self library];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  id v9 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v10 = [v9 URLString];
  uint64_t v11 = (void *)[v7 copyMessagesWithRemoteIDs:v8 options:7346239 inRemoteMailbox:v10];
  uint64_t v12 = objc_msgSend(v11, "ef_map:", &__block_literal_global_143_0);

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_3;
  v24[3] = &unk_1E5D3EF68;
  id v13 = v12;
  id v25 = v13;
  uint64_t v14 = objc_msgSend(v5, "ef_filter:", v24);
  id v15 = [[MFUIDSet alloc] initWithUIDs:v5];
  if ([v14 count])
  {
    id v16 = objc_opt_new();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_4;
    v20[3] = &unk_1E5D3EF90;
    v20[4] = self;
    id v21 = v14;
    id v17 = v16;
    id v22 = v17;
    id v23 = v15;
    [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:0 failedToSelectMailbox:0 operation:v20];
    id v18 = [v17 future];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F60D70] futureWithResult:v15];
  }

  return v18;
}

id __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 stringValue];
  return v2;
}

id __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v2, "uid"));

  return v3;
}

uint64_t __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __56__MFLegacyIMAPMailboxTaskManager_downloadSearchResults___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _fetchMessagesWithUIDs:*(void *)(a1 + 40) connection:v3 newCount:0x7FFFFFFFFFFFFFFFLL flagsToSet:128 queueClass:objc_opt_class()];
  [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 56)];
}

- (BOOL)canFetchMessageIDs
{
  id v3 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v4 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v5 = [v3 storeForMailboxUid:v4];

  unint64_t v6 = [v5 serverMessageCount];
  LOBYTE(v6) = v6 > [v5 allNonDeletedCountIncludingServerSearch:1 andThreadSearch:1];

  return v6;
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = -1;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__MFLegacyIMAPMailboxTaskManager_fetchMessagesWithMessageIDs_andSetFlags___block_invoke;
    v9[3] = &unk_1E5D3EFB8;
    id v10 = v6;
    uint64_t v11 = self;
    uint64_t v12 = &v14;
    unint64_t v13 = a4;
    [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:1 failedToSelectMailbox:0 operation:v9];
  }
  int64_t v7 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __74__MFLegacyIMAPMailboxTaskManager_fetchMessagesWithMessageIDs_andSetFlags___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 _uidsForMessageIDs:a1[4] excludeDeleted:0];
  id v4 = (void *)a1[5];
  id v5 = [v3 allObjects];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 _fetchMessagesWithUIDs:v5 connection:v6 newCount:0x7FFFFFFFFFFFFFFFLL flagsToSet:a1[7] queueClass:objc_opt_class()];
}

- (NSString)mailboxName
{
  _MFLockGlobalLock();
  id v3 = self->_mailboxName;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)compact
{
  id v3 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  char v4 = [v3 isOffline];

  if ((v4 & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__MFLegacyIMAPMailboxTaskManager_compact__block_invoke;
    v5[3] = &unk_1E5D3EEA8;
    v5[4] = self;
    [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:1 failedToSelectMailbox:0 operation:v5];
  }
}

void __41__MFLegacyIMAPMailboxTaskManager_compact__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (([v10 expunge] & 1) == 0)
  {
    id v3 = +[MFActivityMonitor currentMonitor];
    char v4 = [v3 error];

    if (v4)
    {
      id v5 = NSString;
      id v6 = MFLookupLocalizedString(@"IMAP_COMPACT_FAILED", @"Mail was unable to remove the deleted messages in the mailbox “%@” on server “%@”.", @"Delayed");
      int64_t v7 = [*(id *)(*(void *)(a1 + 32) + 120) displayName];
      id v8 = [*(id *)(*(void *)(a1 + 32) + 112) hostname];
      id v9 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
      [v4 useGenericDescription:v9];
    }
  }
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int64_t v7 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v9 = [v7 storeForMailboxUid:v8];

  id v10 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v11 = [v10 URLString];

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __78__MFLegacyIMAPMailboxTaskManager_deleteMessagesOlderThanNumberOfDays_compact___block_invoke;
  uint64_t v19 = &unk_1E5D3EFE0;
  uint64_t v20 = self;
  int v23 = v5;
  BOOL v24 = v4;
  id v12 = v11;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  if (![(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:1 failedToSelectMailbox:0 operation:&v16])
  {
    uint64_t v14 = [(MFLegacyIMAPMailboxTaskManager *)self library];
    id v15 = [v14 messagesForMailbox:v12 olderThanNumberOfDays:v5];

    if ([v15 count])
    {
      [v13 deleteMessages:v15 moveToTrash:0];
      if (v4) {
        [v13 compactMessages:v15];
      }
    }
  }
}

void __78__MFLegacyIMAPMailboxTaskManager_deleteMessagesOlderThanNumberOfDays_compact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) account];
  int v5 = [v4 _shouldLogDeleteActivity];

  if (v5)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int64_t v7 = [*(id *)(a1 + 32) account];
      id v8 = objc_msgSend(v7, "ef_publicDescription");
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(_DWORD *)(a1 + 56);
      int v15 = 138544130;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 1024;
      int v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "IMAP Account %{public}@ deleting messages from store: %@ older than %d days using connection: %@", (uint8_t *)&v15, 0x26u);
    }
  }
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [v11 mailboxName];
  LODWORD(v11) = [v11 _selectMailbox:v12 withConnection:v3];

  if (v11) {
    [v3 deleteMessagesOlderThanNumberOfDays:*(unsigned int *)(a1 + 56)];
  }
  if (*(unsigned char *)(a1 + 60)) {
    [v3 close];
  }
  id v13 = [*(id *)(a1 + 32) library];
  uint64_t v14 = [v13 messagesForMailbox:*(void *)(a1 + 40) olderThanNumberOfDays:*(unsigned int *)(a1 + 56)];

  [*(id *)(a1 + 48) compactMessages:v14];
}

- (id)replayAction:(id)a3
{
  id v5 = a3;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__12;
  BOOL v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  os_unfair_lock_lock(&self->_activeFetchVsReplayLock);
  char v19 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (Class *)0x1E4F60900;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (Class *)0x1E4F60868;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = (Class *)0x1E4F60870;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_16:
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, self, @"MFLegacyIMAPMailboxTaskManager.m", 1354, @"Couldn't make replayer for action %@", v5 object file lineNumber description];

          int64_t v7 = 0;
          goto LABEL_10;
        }
        id v6 = (Class *)0x1E4F60920;
      }
    }
  }
  int64_t v7 = (void *)[objc_alloc(*v6) initWithAction:v5];
  if (!v7) {
    goto LABEL_16;
  }
LABEL_10:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__MFLegacyIMAPMailboxTaskManager_replayAction___block_invoke;
  v15[3] = &unk_1E5D3F008;
  id v8 = v7;
  id v16 = v8;
  __int16 v17 = self;
  uint64_t v18 = &v20;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:17 failedToSelectMailbox:&v19 operation:v15];
  if (!v21[5] && v19)
  {
    uint64_t v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
    uint64_t v10 = [v8 failActionWithError:v9];
    uint64_t v11 = (void *)v21[5];
    v21[5] = v10;
  }
  os_unfair_lock_unlock(&self->_activeFetchVsReplayLock);
  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __47__MFLegacyIMAPMailboxTaskManager_replayAction___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setServerInterface:");
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) replayAction];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)messageDataForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MFLegacyIMAPMailboxTaskManager.m", 1371, @"Invalid parameter not satisfying: %@", @"[message isKindOfClass:[MFMailMessage class]]" object file lineNumber description];
  }
  id v6 = [v5 messageDataIsComplete:0 downloadIfNecessary:0];

  return v6;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  id v6 = +[MailAccount accountWithURL:a3];
  int64_t v7 = +[MailAccount accountWithURL:v5];
  if (v6 == v7) {
    char v8 = [v6 moveSupported];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)checkUIDValidity:(unsigned int)a3 mailboxURL:(id)a4
{
  return 1;
}

- (BOOL)errorIsIMAPError:(id)a3
{
  return 0;
}

- (id)flagsForIMAPUIDs:(id)a3 mailboxURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v6 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  int64_t v7 = [v5 storeForMailboxUid:v6];

  char v8 = [v7 serverMessagePersistence];
  uint64_t v9 = [v8 serverMessagesForIMAPUIDs:v19 limit:*MEMORY[0x1E4F60960] returnLastEntries:0];

  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        int v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v15 serverFlags];
        __int16 v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v15, "imapUID"));
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v10;
}

- (id)imapMailboxNameForMailboxURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v6 = [v5 URL];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    char v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailboxName];
  }
  else
  {
    uint64_t v9 = [v4 absoluteString];
    uint64_t v10 = +[MailAccount mailboxUidFromActiveAccountsForURL:v9];

    id v11 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    char v8 = [v11 _nameForMailboxUid:v10];
  }
  return v8;
}

- (id)messageDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5 = a3;
  id v6 = -[MFIMAPMessage initWithFlags:size:uid:]([MFIMAPMessage alloc], "initWithFlags:size:uid:", 0, 0xFFFFFFFFLL, [v5 intValue]);
  int v7 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  char v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v9 = [v7 storeForMailboxUid:v8];
  [(MFIMAPMessage *)v6 setMessageStore:v9];

  uint64_t v10 = [(MFLegacyIMAPMailboxTaskManager *)self _fetchFullMessageDataForMessage:v6 download:0];

  return v10;
}

- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v13 = [v11 type];
  if (([@"multipart" isEqualToString:v13] & 1) == 0)
  {
    [v11 range];
    uint64_t v15 = v14;
    id v16 = [v11 mimeBody];
    __int16 v17 = [v16 message];

    uint64_t v18 = [v11 partNumber];
    if (v15
      && v17
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v17 uid]
      && ([&stru_1EFF11268 isEqualToString:v18] & 1) == 0)
    {
      unint64_t v30 = [(IMAPAccount *)self->_account fetchLimits];
      [v11 range];
      NSUInteger v28 = v19;
      uint64_t v20 = [v30 fetchMinBytes];
      unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (location || length != v28)
        {
          if (length != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (location >= v28) {
              NSUInteger location = v28;
            }
            unint64_t v27 = [v30 fetchMinBytes];
            unint64_t v22 = [v30 minBytesLeft];
            unint64_t v23 = v27;
            unint64_t v21 = v28 - location;
            if (length > v27) {
              unint64_t v23 = length;
            }
            if (v21 < v23) {
              unint64_t v23 = v28 - location;
            }
            if (v28 - location - v23 >= v22) {
              unint64_t v21 = v23;
            }
          }
        }
        else
        {
          NSUInteger location = 0;
        }
      }
      unint64_t v24 = v21;
      uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F608C8]) initWithDomain:21 type:13];
      [v29 startActivity];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      void v31[2] = __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke;
      v31[3] = &unk_1E5D3F030;
      id v32 = v17;
      NSUInteger v38 = location;
      unint64_t v39 = v24;
      id v33 = v18;
      uint64_t v40 = v15;
      uint64_t v37 = &v42;
      id v34 = v12;
      uint64_t v35 = self;
      id v36 = v11;
      uint64_t v41 = a5;
      [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:5 failedToSelectMailbox:0 operation:v31];
      [v29 stopActivityWithSuccess:*((unsigned __int8 *)v43 + 24)];
    }
  }
  char v25 = *((unsigned char *)v43 + 24);

  _Block_object_dispose(&v42, 8);
  return v25;
}

void __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) uid];
  id v5 = [v3 downloadCache];
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 88);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 96)) {
      [v5 downloadForUid:v4 section:v8 expectedLength:4096 consumer:v9];
    }
    else {
    uint64_t v10 = [v5 downloadForUid:v4 section:v8 length:0 consumer:v9];
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend(v5, "downloadForUid:section:range:consumer:", v4, *(void *)(a1 + 40), *(void *)(a1 + 80), v7, *(void *)(a1 + 48));
  }
  id v11 = (void *)v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 56) _waitForDataFromDownload:v10 uid:v4 downloadCache:v6 connection:v3];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(a1 + 64) range];
    uint64_t v13 = v12;
    uint64_t v14 = [v11 bytesFetched];
    uint64_t v15 = +[MFActivityMonitor currentMonitor];
    id v16 = +[MFNetworkController sharedInstance];
    objc_msgSend(v15, "recordTransportType:", objc_msgSend(v16, "transportType"));

    BOOL v17 = *(void *)(a1 + 80) + v14 == v13;
    char v18 = v17;
    if (!v14 && !v17)
    {
      NSUInteger v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke_cold_1(v4, v19);
      }

      char v18 = 1;
    }
    uint64_t v20 = *(unsigned char **)(a1 + 104);
    if (v20) {
      *v20 |= v18;
    }
  }
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  return 0;
}

- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4
{
  id v5 = a3;
  id v9 = 0;
  id v6 = [(MFLegacyIMAPMailboxTaskManager *)self _fetchFullMessageDataForMessage:v5 download:&v9];
  id v7 = v9;
  if (!v6) {
    _compactMessageIfNoData(self, v7, v5);
  }

  return v6;
}

- (id)_fetchFullMessageDataForMessage:(id)a3 download:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  NSUInteger v28 = __Block_byref_object_copy__12;
  uint64_t v29 = __Block_byref_object_dispose__12;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = __Block_byref_object_copy__12;
  unint64_t v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F608C8]) initWithDomain:21 type:13];
  [v7 startActivity];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __75__MFLegacyIMAPMailboxTaskManager__fetchFullMessageDataForMessage_download___block_invoke;
  uint64_t v14 = &unk_1E5D3F058;
  id v8 = v6;
  id v15 = v8;
  id v16 = self;
  BOOL v17 = &v19;
  char v18 = &v25;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:5 failedToSelectMailbox:0 operation:&v11];
  objc_msgSend(v7, "stopActivityWithSuccess:", v26[5] != 0, v11, v12, v13, v14);
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __75__MFLegacyIMAPMailboxTaskManager__fetchFullMessageDataForMessage_download___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) uid];
  id v4 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  id v5 = [MEMORY[0x1E4F734E0] filterWithConsumer:v4];
  id v6 = [v23 downloadCache];
  uint64_t v7 = objc_msgSend(v6, "downloadForUid:section:length:consumer:", v3, &stru_1EFF11268, objc_msgSend(*(id *)(a1 + 32), "messageSize"), v5);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  int v10 = [*(id *)(a1 + 40) _waitForDataFromDownload:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uid:v3 downloadCache:v6 connection:v23];
  unint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bytesFetched];
  unint64_t v12 = [*(id *)(a1 + 32) messageSize];
  if (v11 >= v12) {
    int v13 = v10;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1) {
    goto LABEL_5;
  }
  uint64_t v17 = objc_msgSend(v6, "downloadForUid:section:range:consumer:", v3, &stru_1EFF11268, v11, v12, v5);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  int v20 = [*(id *)(a1 + 40) _waitForDataFromDownload:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uid:v3 downloadCache:v6 connection:v23];
  uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bytesFetched];
  if (v20)
  {
    uint64_t v22 = v21;
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bytesFetched] || v22 + v11 >= v12)
    {
LABEL_5:
      uint64_t v14 = [v4 data];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

- (BOOL)_waitForDataFromDownload:(id)a3 uid:(unsigned int)a4 downloadCache:(id)a5 connection:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    int v13 = +[MFActivityMonitor currentMonitor];
    uint64_t v14 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
    [v13 setMailbox:v14];

    uint64_t v15 = [v12 fetchPipeline];
    unint64_t v16 = [v13 expectedLength];
    [v13 percentDone];
    double v18 = v17;
    [v12 enableThroughputMonitoring:1];
    char v19 = 0;
    uint64_t v26 = (fmax(v18, 0.0) * (double)v16);
    while (1)
    {
      if (([v10 isComplete] & 1) != 0
        || ([v13 shouldCancel] & 1) != 0
        || ![v12 isValid]
        || ([v13 error], int v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
      {
        [v12 enableThroughputMonitoring:0];
        if ([v10 isComplete])
        {
          char v23 = [v10 isSuccessful];
          [v11 cleanUpDownloadsForUid:v8];
        }
        else
        {
          char v23 = 0;
        }

        goto LABEL_28;
      }
      uint64_t v21 = (void *)MEMORY[0x1AD0E3E00]();
      objc_msgSend(v15, "mf_lock");
      objc_msgSend(v15, "setChunkSize:", objc_msgSend(v12, "readBufferSize"));
      if (([v15 isFull] & 1) == 0)
      {
        [v11 addCommandsForDownload:v10 toPipeline:v15];
        uint64_t v22 = [v15 failureResponsesFromSendingCommandsWithConnection:v12];
        [v11 handleFetchResponses:v22];
      }
      objc_msgSend(v15, "mf_unlock");
      [v11 processResultsForUid:v8];
      if (v16) {
        break;
      }
LABEL_18:
    }
    if ((v19 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 allowsPartialDownloads])
      {
        char v19 = 0;
        goto LABEL_17;
      }
      if ([v10 partial]) {
        v16 += [v10 expectedLength];
      }
      else {
        unint64_t v16 = [v10 bytesFetched];
      }
      [v13 setExpectedLength:v16];
    }
    char v19 = 1;
LABEL_17:
    objc_msgSend(v13, "setPercentDone:", (float)((float)(unint64_t)(objc_msgSend(v10, "bytesFetched") + v26) / (float)v16));
    goto LABEL_18;
  }
  id v24 = MFLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
    -[MFLegacyIMAPMailboxTaskManager _waitForDataFromDownload:uid:downloadCache:connection:]();
  }

  char v23 = 0;
LABEL_28:

  return v23;
}

- (id)_downloadForMessageBodyData:(id)a3 usingDownloadCache:(id)a4
{
  id v5 = [a4 downloadForMessage:a3];
  id v6 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  objc_msgSend(v5, "setAllowsPartialDownloads:", objc_msgSend(v6, "allowsPartialDownloads"));

  [v5 setFetchBodyData:1];
  return v5;
}

- (id)_performBodyDataDownload:(id)a3 usingConnection:(id)a4 downloadCache:(id)a5 isPartial:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v10 partial];
  if (!-[MFLegacyIMAPMailboxTaskManager _waitForDataFromDownload:uid:downloadCache:connection:](self, "_waitForDataFromDownload:uid:downloadCache:connection:", v10, [v10 uid], v12, v11))
  {
    uint64_t v14 = 0;
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v14 = [v10 data];
  char v13 = [v10 partial];
  if (a6) {
LABEL_5:
  }
    *a6 = v13;
LABEL_6:

  return v14;
}

- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__12;
  uint64_t v27 = __Block_byref_object_dispose__12;
  id v28 = 0;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__12;
  uint64_t v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F608C8]) initWithDomain:21 type:13];
  [v7 startActivity];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MFLegacyIMAPMailboxTaskManager_fetchDataForMessage_partial___block_invoke;
  v12[3] = &unk_1E5D3F080;
  uint64_t v14 = &v17;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v23;
  unint64_t v16 = a4;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:21 failedToSelectMailbox:0 operation:v12];
  [v7 stopActivityWithSuccess:v24[5] != 0];
  id v9 = (void *)v24[5];
  if (!v9)
  {
    _compactMessageIfNoData(self, (void *)v18[5], v8);
    id v9 = (void *)v24[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __62__MFLegacyIMAPMailboxTaskManager_fetchDataForMessage_partial___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 downloadCache];
  uint64_t v4 = [*(id *)(a1 + 32) _downloadForMessageBodyData:*(void *)(a1 + 40) usingDownloadCache:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) _performBodyDataDownload:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) usingConnection:v12 downloadCache:v3 isPartial:*(void *)(a1 + 64)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = +[MFActivityMonitor currentMonitor];
  id v11 = +[MFNetworkController sharedInstance];
  objc_msgSend(v10, "recordTransportType:", objc_msgSend(v11, "transportType"));
}

- (id)fetchHeadersForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__12;
  id v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__12;
  double v18 = __Block_byref_object_dispose__12;
  id v19 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MFLegacyIMAPMailboxTaskManager_fetchHeadersForMessage___block_invoke;
  v9[3] = &unk_1E5D3F0A8;
  id v12 = &v14;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v13 = &v20;
  [(MFLegacyIMAPMailboxTaskManager *)self performOperationRequiringConnection:1 withOptions:5 failedToSelectMailbox:0 operation:v9];
  id v6 = (void *)v21[5];
  if (!v6)
  {
    _compactMessageIfNoData(self, (void *)v15[5], v5);
    id v6 = (void *)v21[5];
  }
  id v7 = v6;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __57__MFLegacyIMAPMailboxTaskManager_fetchHeadersForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 downloadCache];
  uint64_t v4 = [v3 downloadForMessage:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v7
    && objc_msgSend(*(id *)(a1 + 40), "_waitForDataFromDownload:uid:downloadCache:connection:", v7, objc_msgSend(*(id *)(a1 + 32), "uid"), v3, v16))
  {
    uint64_t v8 = +[MFActivityMonitor currentMonitor];
    id v9 = +[MFNetworkController sharedInstance];
    objc_msgSend(v8, "recordTransportType:", objc_msgSend(v9, "transportType"));

    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) data];
    uint64_t v11 = objc_msgSend(v10, "mf_rangeOfRFC822HeaderData");
    uint64_t v13 = objc_msgSend(v10, "mf_subdataWithRange:", v11, v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (BOOL)performOperationRequiringConnection:(BOOL)a3 withOptions:(unint64_t)a4 failedToSelectMailbox:(BOOL *)a5 operation:(id)a6
{
  BOOL v8 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v32 = (void (**)(id, id))a6;
  id v10 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  uint64_t v11 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  uint64_t v12 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v13 = [v11 storeForMailboxUid:v12];

  if ([v13 allowsAppend]) {
    unint64_t v14 = a4;
  }
  else {
    unint64_t v14 = a4 | 2;
  }
  [(NSLock *)self->_cachedConnectionLock lock];
  p_cachedConnection = &self->_cachedConnection;
  cachedConnection = self->_cachedConnection;
  if ((v14 & 4) != 0)
  {
    if (![(MFIMAPConnection *)cachedConnection mf_tryLock])
    {
      uint64_t v17 = 0;
      goto LABEL_9;
    }
    cachedConnection = *p_cachedConnection;
  }
  uint64_t v17 = cachedConnection;
LABEL_9:
  [(NSLock *)self->_cachedConnectionLock unlock];
  if (v17 && (v14 & 0x10) != 0)
  {
    [(MFIMAPConnection *)v17 noop];
  }
  else if (!v17)
  {
    goto LABEL_20;
  }
  if ([(MFConnection *)v17 isValid])
  {
    int v18 = 1;
    goto LABEL_24;
  }
  if ((v14 & 4) != 0) {
    [(MFIMAPConnection *)v17 mf_unlock];
  }
  [(NSLock *)self->_cachedConnectionLock lock];
  if (v17 == *p_cachedConnection)
  {
    *p_cachedConnection = 0;
  }
  [(NSLock *)self->_cachedConnectionLock unlock];

LABEL_20:
  id v19 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v17 = [v10 connectionForMailbox:v19 delegate:self options:v14 failedToSelectMailbox:a5];

  [(NSLock *)self->_cachedConnectionLock lock];
  if (!*p_cachedConnection && (v14 & 0x40) == 0) {
    objc_storeStrong((id *)&self->_cachedConnection, v17);
  }
  [(NSLock *)self->_cachedConnectionLock unlock];
  int v18 = 0;
LABEL_24:
  p_mailboxName = &self->_mailboxName;
  if (self->_mailboxName)
  {
    if (v17) {
      goto LABEL_31;
    }
LABEL_30:
    if (v8) {
      goto LABEL_53;
    }
    goto LABEL_31;
  }
  uint64_t v21 = [v10 _nameForMailboxUid:self->_mailbox];
  _MFLockGlobalLock();
  if (!*p_mailboxName) {
    objc_storeStrong((id *)&self->_mailboxName, v21);
  }
  _MFUnlockGlobalLock();

  if (!v17) {
    goto LABEL_30;
  }
LABEL_31:
  char v22 = v18 ^ 1;
  if (!v17) {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    if (*p_mailboxName)
    {
      uint64_t v23 = [(MFIMAPConnection *)v17 selectedMailbox];

      if (!v23) {
        [(MFLegacyIMAPMailboxTaskManager *)self _selectMailbox:self->_mailboxName withConnection:v17];
      }
    }
  }
  id v24 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v25 = [(MFLegacyIMAPMailboxTaskManager *)self mailboxName];
  uint64_t v26 = [v24 redactedName:v25];

  uint64_t v27 = +[MFLegacyIMAPMailboxTaskManager log];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = @"NO";
    *(_DWORD *)buf = 138544130;
    id v34 = v26;
    __int16 v35 = 2048;
    if (v18) {
      id v28 = @"YES";
    }
    id v36 = v17;
    __int16 v37 = 2112;
    NSUInteger v38 = v28;
    __int16 v39 = 1024;
    int v40 = v14;
    _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_INFO, "performOperationRequiringConnection: mailbox='%{public}@' connection=%p cached=%@ options=%d", buf, 0x26u);
  }

  [(MFConnection *)v17 startActivity];
  v32[2](v32, v17);
  [(MFConnection *)v17 stopActivity];

  if (v17)
  {
    if ((v14 & 4) != 0) {
      [(MFIMAPConnection *)v17 mf_unlock];
    }
    if ((v14 & 0x20) != 0)
    {
      if ([(MFMailboxUid *)self->_mailbox mailboxType] != 7)
      {
        uint64_t v29 = 1;
LABEL_52:
        [v10 checkInConnection:v17 destroy:v29];
        goto LABEL_53;
      }
      id v30 = [MEMORY[0x1E4F60D58] currentDevice];
      uint64_t v29 = [v30 isPlatform:2];
    }
    else
    {
      uint64_t v29 = 0;
    }
    if (v17 != *p_cachedConnection || v29) {
      goto LABEL_52;
    }
  }
LABEL_53:

  return v17 != 0;
}

- (BOOL)_selectMailbox:(id)a3 withConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  char v9 = [v7 selectMailbox:v6 withAccount:v8];

  return v9;
}

- (void)reselectMailbox
{
  if (self->_cachedConnection)
  {
    uint64_t v3 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    id v6 = [v3 _nameForMailboxUid:self->_mailbox];

    _MFLockGlobalLock();
    uint64_t v4 = (NSString *)[v6 copy];
    mailboxName = self->_mailboxName;
    self->_mailboxName = v4;

    _MFUnlockGlobalLock();
    [(MFLegacyIMAPMailboxTaskManager *)self _selectMailbox:self->_mailboxName withConnection:self->_cachedConnection];
  }
}

- (void)willRemoveDelegation:(id)a3
{
  id v7 = (MFIMAPConnection *)a3;
  [(NSLock *)self->_cachedConnectionLock lock];
  cachedConnection = self->_cachedConnection;
  if (cachedConnection) {
    BOOL v5 = cachedConnection == v7;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = v5;
  if (v5)
  {
    self->_cachedConnection = 0;
  }
  [(NSLock *)self->_cachedConnectionLock unlock];
  if (v6) {
    [(MFIMAPConnection *)v7 finishIdle];
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v45 = a4;
  id v44 = a5;
  id v7 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  BOOL v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  uint64_t v46 = [v7 storeForMailboxUid:v8];

  if (v44
    && [v45 responseType] == 2
    && ([v44 command] == 13 || objc_msgSend(v44, "command") == 9))
  {
    v43 = [v44 untaggedResponses];
    if (v43)
    {
      *(_WORD *)&self->_supportsForwardedFlag = 0;
      self->_supportsFlagColorBitFlags = 0;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = v43;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v10)
      {
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v48 != v12) {
              objc_enumerationMutation(v9);
            }
            unint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (objc_msgSend(v14, "responseType", v43) == 2)
            {
              uint64_t v15 = [v14 responseInfo];
              switch([v14 responseCode])
              {
                case 5:
                  if (v15)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v16 = v15;
                      self->_supportsForwardedFlag = [v16 indexOfObject:@"Forwarded"] != 0x7FFFFFFFFFFFFFFFLL;
                      self->_supportsDollarForwardedFlag = [v16 indexOfObject:@"$Forwarded"] != 0x7FFFFFFFFFFFFFFFLL;
                      BOOL v17 = [v16 indexOfObject:@"$MailFlagBit0"] != 0x7FFFFFFFFFFFFFFFLL
                         || [v16 indexOfObject:@"$MailFlagBit1"] != 0x7FFFFFFFFFFFFFFFLL
                         || [v16 indexOfObject:@"$MailFlagBit2"] != 0x7FFFFFFFFFFFFFFFLL;
                      self->_supportsFlagColorBitFlags = v17;
                      goto LABEL_24;
                    }
                  }
                  break;
                case 6:
                  [v46 setAllowsAppend:0];
                  break;
                case 9:
                  uint64_t v18 = [v15 unsignedIntValue];
                  [v46 setUidNext:v18];
                  id v16 = +[MFLegacyIMAPMailboxTaskManager log];
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    loggingPrefix = self->_loggingPrefix;
                    *(_DWORD *)buf = 138543618;
                    uint64_t v55 = loggingPrefix;
                    __int16 v56 = 1024;
                    LODWORD(v57) = v18;
                    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Received UIDNEXT = %u", buf, 0x12u);
                  }
LABEL_24:

                  break;
                case 10:
                  uint64_t v11 = [v15 unsignedIntValue];
                  break;
                default:
                  break;
              }
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v62 count:16];
        }
        while (v10);

        if (!v11) {
          goto LABEL_40;
        }
        uint64_t v20 = [(MFMailboxUid *)self->_mailbox userInfoObjectForKey:@"UIDVALIDITY"];
        unsigned int v21 = [v20 intValue];

        if (v21 == v11) {
          goto LABEL_40;
        }
        [v46 setUidValidity:v11];
        if (!v21) {
          goto LABEL_40;
        }
        [v46 _flushAllMessageData];
        char v22 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
        uint64_t v23 = [(MFLegacyIMAPMailboxTaskManager *)self mailboxName];
        id v24 = [v22 redactedName:v23];

        id v25 = +[MFLegacyIMAPMailboxTaskManager log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = self->_loggingPrefix;
          *(_DWORD *)buf = 138544130;
          uint64_t v55 = v26;
          __int16 v56 = 2114;
          uint64_t v57 = (uint64_t)v24;
          __int16 v58 = 2048;
          uint64_t v59 = v21;
          __int16 v60 = 2048;
          uint64_t v61 = v11;
          _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Forcing reload of '%{public}@' because of UIDVALIDITY change (old:%lu new:%lu)", buf, 0x2Au);
        }

        uint64_t v27 = [(MFLegacyIMAPMailboxTaskManager *)self library];
        id v28 = [v46 URLString];
        uint64_t v29 = 0;
        do
        {
          id v30 = (void *)MEMORY[0x1AD0E3E00]();
          uint64_t v31 = [v27 messagesForMailbox:v28 limit:1000];

          uint64_t v29 = v31;
          if ([v31 count]) {
            [v27 compactMessages:v31];
          }
        }
        while ((unint64_t)[v31 count] > 0x3E7);
        id v32 = [v46 serverMessagePersistence];
        [v32 deleteAllServerMessagesInMailbox];
      }
      else
      {
        id v24 = v9;
      }
    }
LABEL_40:
  }
  if (objc_msgSend(v45, "isAlertResponse", v43))
  {
    id v33 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    id v34 = [v45 userString];
    [v33 handleAlertResponse:v34];
  }
  if ([v45 isResponseWithCode:31])
  {
    __int16 v35 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    id v36 = [v45 userString];
    [v35 handleOverQuotaResponse:v36];
  }
  if ((!v44 || [v44 command] == 28)
    && [(MFLegacyIMAPMailboxTaskManager *)self shouldUseIDLE]
    && [v45 responseType] == 9)
  {
    __int16 v37 = +[MFLegacyIMAPMailboxTaskManager log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v38 = self->_loggingPrefix;
      uint64_t v39 = [v45 number];
      *(_DWORD *)buf = 138543618;
      uint64_t v55 = v38;
      __int16 v56 = 2048;
      uint64_t v57 = v39;
      _os_log_impl(&dword_1A7EFF000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Got EXISTS = %llu", buf, 0x16u);
    }

    -[MFLegacyIMAPMailboxTaskManager setServerMessageCount:](self, "setServerMessageCount:", [v45 number]);
    if (self->_mailbox)
    {
      mailbox = self->_mailbox;
      BOOL v52 = @"MailAccountContentsDidChangeUids";
      int v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&mailbox count:1];
      unint64_t v53 = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];

      uint64_t v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v42 postNotificationName:@"MailAccountContentsDidChange" object:self->_account userInfo:v41];
    }
  }
}

- (id)_idleConditionsObservable
{
  v24[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MFPowerController sharedInstance];
  id v19 = [v3 lowPowerModeObservable];
  uint64_t v20 = [v3 pluggedInObservable];
  uint64_t v4 = +[MFNetworkController sharedInstance];
  BOOL v5 = [v4 wifiObservable];

  int v6 = +[MFLockStateMonitor sharedInstance];
  id v7 = [v6 lockStateObservable];

  BOOL v8 = +[MFAppStateMonitor sharedInstance];
  id v9 = [v8 appIsVisibleObservable];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v10 = (void *)MEMORY[0x1E4F60DD8];
  v24[0] = v19;
  v24[1] = v9;
  v24[2] = v7;
  v24[3] = v5;
  void v24[4] = v20;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  uint64_t v12 = [v10 combineLatest:v11];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke;
  v21[3] = &unk_1E5D3DB10;
  objc_copyWeak(&v22, &location);
  uint64_t v13 = [v12 map:v21];

  unint64_t v14 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.imap (IDLE)" qualityOfService:17];
  uint64_t v15 = [v13 distinctUntilChanged];
  id v16 = [v15 doOnError:&__block_literal_global_201];
  BOOL v17 = [v16 observeOn:v14];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v17;
}

id __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [v3 objectAtIndexedSubscript:0];
  int v6 = [v5 BOOLValue];

  id v7 = [v3 objectAtIndexedSubscript:1];
  int v8 = [v7 BOOLValue];

  id v9 = [v3 objectAtIndexedSubscript:2];
  int v10 = [v9 BOOLValue];

  uint64_t v11 = [v3 objectAtIndexedSubscript:3];
  int v12 = [v11 BOOLValue];

  uint64_t v13 = [v3 objectAtIndexedSubscript:4];
  int v14 = [v13 BOOLValue];

  uint64_t v15 = [WeakRetained account];
  [v15 uniqueIdForPersistentConnection];

  if (PCSettingsGetStyle() == 2)
  {
    uint64_t v16 = v8 & (v6 ^ 1u);
  }
  else
  {
    int v19 = [v15 canReceiveNewMailNotifications];
    BOOL v20 = PCSettingsGetPollInterval() == -1;
    uint64_t v16 = v8 & (v6 ^ 1u);
    if ((v8 & (v6 ^ 1) & 1) == 0 && (v20 & ~v19 & 1) == 0)
    {
      if (v12 & v14) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = (v10 | v6) ^ 1u;
      }
    }
  }
  BOOL v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v16];

  return v17;
}

void __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_msgSend(v2, "ef_publicDescription");
    __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2_cold_1(v4, v5, v3);
  }
}

- (id)_observeChangesInIdleConditions
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [(MFLegacyIMAPMailboxTaskManager *)self _idleConditionsObservable];
  uint64_t v4 = (void *)MEMORY[0x1E4F60DE0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __65__MFLegacyIMAPMailboxTaskManager__observeChangesInIdleConditions__block_invoke;
  uint64_t v11 = &unk_1E5D3DAC0;
  objc_copyWeak(&v12, &location);
  BOOL v5 = [v4 observerWithResultBlock:&v8];
  uint64_t v6 = objc_msgSend(v3, "subscribe:", v5, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __65__MFLegacyIMAPMailboxTaskManager__observeChangesInIdleConditions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleIdleTransition:", objc_msgSend(v4, "BOOLValue"));
}

- (void)_scheduleIdleTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = NSStringFromBOOL();
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "#imap-idle scheduling IDLE transition (should-use-idle %@): %@", (uint8_t *)&v8, 0x16u);
  }
  [(MFLegacyIMAPMailboxTaskManager *)self setShouldUseIDLE:v3];
  [(NSLock *)self->_cachedConnectionLock lock];
  id v7 = self->_cachedConnection;
  [(NSLock *)self->_cachedConnectionLock unlock];
  if (v7) {
    [(MFIMAPConnection *)v7 scheduleIdleReset];
  }
}

- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5
{
  *(void *)&v44[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v10 command] == 13 || objc_msgSend(v10, "command") == 9;
  uint64_t v12 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  uint64_t v13 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  int v14 = [v12 storeForMailboxUid:v13];

  uint64_t v15 = [v9 responseType];
  BOOL v16 = 1;
  switch(v15)
  {
    case 9:
      BOOL v17 = +[MFLegacyIMAPMailboxTaskManager log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        loggingPrefix = self->_loggingPrefix;
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = loggingPrefix;
        __int16 v43 = 2048;
        *(void *)id v44 = [v9 number];
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Got EXISTS = %llu", buf, 0x16u);
      }

      -[MFLegacyIMAPMailboxTaskManager setServerMessageCount:](self, "setServerMessageCount:", [v9 number]);
      BOOL v16 = v11;
      break;
    case 10:
      goto LABEL_9;
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
      break;
    case 13:
      int v40 = [(MFLegacyIMAPMailboxTaskManager *)self account];
      uint64_t v39 = [v9 mailboxName];
      NSUInteger v38 = objc_msgSend(v40, "mailboxUidForName:");
      int v19 = [v9 statusEntries];
      BOOL v20 = [v19 objectForKey:0x1EFF1ECE8];
      if (v20)
      {
        unsigned int v21 = [v38 URLString];

        if (v21)
        {
          int v22 = [v14 uidNext];
          uint64_t v23 = [v20 unsignedIntValue];
          if (v22 != v23)
          {
            id v24 = +[MFLegacyIMAPMailboxTaskManager log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = self->_loggingPrefix;
              *(_DWORD *)buf = 138543874;
              uint64_t v42 = v25;
              __int16 v43 = 1024;
              *(_DWORD *)id v44 = v22;
              v44[2] = 1024;
              *(_DWORD *)&v44[3] = v23;
              _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Got new UIDNEXT (old = %u, new = %u)", buf, 0x18u);
            }

            [v14 setUidNext:v23];
          }
        }
      }
      uint64_t v26 = [(MFLegacyIMAPMailboxTaskManager *)self mailboxName];
      int v27 = [v39 isEqualToString:v26];

      if (v27)
      {
        id v28 = [v19 objectForKey:0x1EFF1ED48];

        if (v28) {
          -[MFLegacyIMAPMailboxTaskManager setHighestModSequence:](self, "setHighestModSequence:", [v28 unsignedLongLongValue]);
        }
        uint64_t v29 = [v19 objectForKey:0x1EFF1ED28];

        if (v29)
        {
          id v30 = [v14 URLString];
          if (v30)
          {
            uint64_t v31 = [(MFLegacyIMAPMailboxTaskManager *)self library];
            objc_msgSend(v31, "setLastSyncAndMostRecentStatusCount:forMailbox:", objc_msgSend(v29, "unsignedIntegerValue"), v30);
          }
        }
      }
      else
      {
        uint64_t v29 = v20;
      }

      goto LABEL_31;
    case 17:
      id v32 = [v9 fetchResultWithType:8];
      id v33 = [v8 fetchPipeline];
      id v34 = [v8 downloadCache];
      if (v32 && [v10 command] == 21 && v33 && objc_msgSend(v33, "isSending")) {
        objc_msgSend(v34, "handleFetchResponse:forUid:", v9, objc_msgSend(v32, "uid"));
      }

LABEL_31:
      BOOL v16 = 1;
      break;
    default:
      if (v15 == 24) {
LABEL_9:
      }
        BOOL v16 = 0;
      break;
  }
  if ([v9 isAlertResponse])
  {
    __int16 v35 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    id v36 = [v9 userString];
    [v35 handleAlertResponse:v36];

    BOOL v16 = 0;
  }

  return v16;
}

- (id)deletedMessages
{
  v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  id v4 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  BOOL v5 = [v3 storeForMailboxUid:v4];

  uint64_t v6 = [v5 URLString];
  id v7 = +[MFMessageCriterion criterionForMailboxURL:v6];

  id v8 = +[MFMessageCriterion messageIsDeletedCriterion:1];
  v14[0] = v7;
  v14[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v10 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v9];

  BOOL v11 = [(MFLegacyIMAPMailboxTaskManager *)self library];
  uint64_t v12 = [v11 messagesMatchingCriterion:v10 options:0];

  return v12;
}

- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MFLegacyIMAPMailboxTaskManager *)self mf_lock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v10 objectForKey:v14];
        int v16 = [v15 intValue];

        if (v9) {
          char v17 = MFMessageFlagsByApplyingDictionary(v16, v9);
        }
        else {
          char v17 = [v14 messageFlags];
        }
        if ((v16 & 2) != 0)
        {
          if ((v17 & 2) != 0) {
            continue;
          }
          uint64_t v18 = -1;
        }
        else
        {
          if ((v17 & 2) == 0) {
            continue;
          }
          uint64_t v18 = 1;
        }
        self->_serverDeletedCount += v18;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [(MFLegacyIMAPMailboxTaskManager *)self mf_unlock];
}

- (void)close
{
  [(NSLock *)self->_cachedConnectionLock lock];
  uint64_t v6 = self->_cachedConnection;
  cachedConnection = self->_cachedConnection;
  self->_cachedConnection = 0;

  [(NSLock *)self->_cachedConnectionLock unlock];
  id v4 = v6;
  if (v6)
  {
    [(MFIMAPConnection *)v6 finishIdle];
    BOOL v5 = [(MFLegacyIMAPMailboxTaskManager *)self account];
    [v5 checkInConnection:v6];

    id v4 = v6;
  }
}

- (void)setServerMessageCount:(unint64_t)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v13 = [v5 objectForKey:@"DeletedSearchLimit"];

  if (v13)
  {
    unsigned int v6 = [v13 unsignedIntValue];
    if (v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v7 = 300;
  }
  os_unfair_lock_lock(&self->_serverCountLock);
  if (v7 <= a3)
  {
    self->_unint64_t serverMessageCount = a3;
    os_unfair_lock_unlock(&self->_serverCountLock);
    self->_serverDeletedCount = 0;
  }
  else
  {
    BOOL settingServerCount = self->_settingServerCount;
    self->_BOOL settingServerCount = 1;
    if (settingServerCount)
    {
      os_unfair_lock_unlock(&self->_serverCountLock);
    }
    else
    {
      self->_unint64_t serverMessageCount = a3;
      self->_serverDeletedCount = 0;
      os_unfair_lock_unlock(&self->_serverCountLock);
      id v9 = +[MFActivityMonitor currentMonitor];
      char v10 = [v9 isRemoteSearch];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = +[MFInvocationQueue sharedInvocationQueue];
        uint64_t v12 = +[NSInvocation mf_invocationWithSelector:sel_updateDeletedCount target:self];
        [v11 addInvocation:v12];
      }
    }
  }
}

- (unint64_t)serverMessageCount
{
  p_serverCountLock = &self->_serverCountLock;
  os_unfair_lock_lock(&self->_serverCountLock);
  unint64_t serverMessageCount = self->_serverMessageCount;
  unint64_t serverDeletedCount = self->_serverDeletedCount;
  BOOL v6 = serverMessageCount >= serverDeletedCount;
  unint64_t v7 = serverMessageCount - serverDeletedCount;
  if (v6) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  os_unfair_lock_unlock(p_serverCountLock);
  return v8;
}

- (void)setHighestModSequence:(unint64_t)a3
{
  self->_highestModSequence = a3;
}

- (id)sequenceIdentifierForUIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  BOOL v6 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  unint64_t v7 = [v5 storeForMailboxUid:v6];

  unint64_t v8 = [(MFLegacyIMAPMailboxTaskManager *)self library];
  id v9 = [v7 URLString];
  char v10 = [v8 sequenceIdentifierForMessagesWithRemoteIDs:v4 inMailbox:v9];

  return v10;
}

- (void)setSequenceIdentifier:(id)a3 forUIDs:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unint64_t v7 = [(MFLegacyIMAPMailboxTaskManager *)self account];
  unint64_t v8 = [(MFLegacyIMAPMailboxTaskManager *)self mailbox];
  id v9 = [v7 storeForMailboxUid:v8];

  char v10 = [(MFLegacyIMAPMailboxTaskManager *)self library];
  uint64_t v11 = [v9 URLString];
  [v10 setSequenceIdentifier:v12 forMessagesWithRemoteIDs:v6 inMailbox:v11];
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (IMAPAccount)account
{
  return self->_account;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (BOOL)shouldUseIDLE
{
  return self->_shouldUseIDLE;
}

- (void)setShouldUseIDLE:(BOOL)a3
{
  self->_shouldUseIDLE = a3;
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_cachedConnectionLock, 0);
  objc_storeStrong((id *)&self->_cachedConnection, 0);
  objc_storeStrong((id *)&self->_mailboxName, 0);
}

- (void)fetchNumMessages:(os_log_t)log preservingUID:(void *)a4 options:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "%@: \"Connecting...\" starting", buf, 0xCu);
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "%@: \"Connecting...\" completed", buf, 0xCu);
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_FAULT, "store and connection mailboxes differ", v1, 2u);
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_ERROR, "canceling fetch because mailbox could not be selected", v1, 2u);
}

void __73__MFLegacyIMAPMailboxTaskManager_fetchNumMessages_preservingUID_options___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_ERROR, "canceling fetch because connection is invalid", v1, 2u);
}

void __81__MFLegacyIMAPMailboxTaskManager_fetchDataForMimePart_range_isComplete_consumer___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_FAULT, "Download fetched 0 bytes for UID %u", (uint8_t *)v2, 8u);
}

- (void)_waitForDataFromDownload:uid:downloadCache:connection:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_FAULT, "failed to download data, message.remoteID may be null", v1, 2u);
}

void __59__MFLegacyIMAPMailboxTaskManager__idleConditionsObservable__block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#imap-idle error occurred while observing conditions for IDLE: %{public}@", buf, 0xCu);
}

@end