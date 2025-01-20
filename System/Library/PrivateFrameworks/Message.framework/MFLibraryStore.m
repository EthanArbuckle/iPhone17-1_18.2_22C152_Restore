@interface MFLibraryStore
+ (Class)classForMimePart;
+ (Class)headersClass;
+ (id)attachmentInfoCalculationScheduler;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (id)storeWithMailbox:(id)a3;
+ (unsigned)defaultLoadOptions;
- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (BOOL)allowsAppend;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)canCompact;
- (BOOL)canFetchMessageIDs;
- (BOOL)canFetchSearchResults;
- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8;
- (BOOL)hasCompleteDataForMimePart:(id)a3;
- (BOOL)hasMessageForAccount:(id)a3;
- (BOOL)hasMoreFetchableMessages;
- (BOOL)isOpened;
- (BOOL)shouldArchive;
- (BOOL)shouldCancel;
- (BOOL)shouldDeleteInPlace;
- (BOOL)shouldDownloadBodyDataForMessage:(id)a3;
- (BOOL)shouldGrowFetchWindow;
- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5;
- (MFLibraryStore)initWithMailbox:(id)a3;
- (MFLibraryStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4;
- (MFMailMessageLibrary)library;
- (MFMailboxUid)mailbox;
- (MFMailboxUid)mailboxUid;
- (MailAccount)account;
- (NSDate)earliestReceivedDate;
- (NSString)URLString;
- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5;
- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6;
- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6;
- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_memberMessagesWithCompactionNotification:(id)a3;
- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5;
- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)copyOfAllMessages;
- (id)copyOfAllMessagesWithOptions:(unsigned int)a3;
- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4;
- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5;
- (id)criterion;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)dataPathForMessage:(id)a3 part:(id)a4;
- (id)dateOfOldestNonIndexedNonSearchResultMessage;
- (id)description;
- (id)filterMessagesByMembership:(id)a3;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8;
- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)loadMeetingDataForMessage:(id)a3;
- (id)loadMeetingExternalIDForMessage:(id)a3;
- (id)loadMeetingMetadataForMessage:(id)a3;
- (id)messageForRemoteID:(id)a3;
- (id)messageIdRollCall:(id)a3;
- (id)newObjectCache;
- (id)searchResultsWithRemoteIDs:(id)a3 requiresBody:(BOOL)a4 inMailbox:(id)a5;
- (id)serverSearchResults;
- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4;
- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7;
- (int64_t)archiveDestination;
- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchMobileSynchronously:(unint64_t)a3;
- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5;
- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (unint64_t)_calculateFetchWindowWithAdditionalMultiple:(BOOL)a3;
- (unint64_t)_fetchWindowMinimum;
- (unint64_t)_fetchWindowMultiple;
- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4;
- (unint64_t)fetchWindow;
- (unint64_t)fetchWindowCap;
- (unint64_t)growFetchWindow;
- (unint64_t)serverMessageCount;
- (unint64_t)serverUnreadOnlyOnServerCount;
- (unint64_t)totalCount;
- (unint64_t)unreadCount;
- (void)_addInvocationToQueue:(id)a3;
- (void)_calcAttachmentInfoForMessage:(id)a3 body:(id)a4;
- (void)_flushAllMessageData;
- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)_queueMessageFlagsChanged:(id)a3;
- (void)_queueMessagesAdded:(id)a3;
- (void)_queueMessagesWereCompacted:(id)a3;
- (void)_queueMessagesWillBeCompacted:(id)a3;
- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4;
- (void)addMessageDataToCaches:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5;
- (void)allMessageFlagsDidChange:(id)a3;
- (void)compactMessages:(id)a3;
- (void)dealloc;
- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)doCompact;
- (void)handleMessageFlagsChanged:(id)a3;
- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4;
- (void)handleMessagesCompacted:(id)a3;
- (void)handleMessagesWillBeCompacted:(id)a3;
- (void)invalidateFetchWindow;
- (void)messageFlagsDidChange:(id)a3 flags:(id)a4;
- (void)messagesWereAdded:(id)a3;
- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4;
- (void)messagesWereCompacted:(id)a3;
- (void)messagesWillBeCompacted:(id)a3;
- (void)openSynchronously;
- (void)purgeMessages:(id)a3;
- (void)purgeMessagesBeyondLimit:(unint64_t)a3;
- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5;
- (void)setData:(id)a3 summary:(id)a4 forMessage:(id)a5 isPartial:(BOOL)a6;
- (void)setEarliestReceivedDate:(id)a3;
- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5;
- (void)setLibrary:(id)a3;
- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6;
- (void)willFetchMessages;
@end

@implementation MFLibraryStore

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = objc_alloc(MEMORY[0x1E4F60F40]);
  v6 = [v4 externalID];
  v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = a3 | (4 * [v7 hash]);
  return v8;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v4 = a4;
  return v4;
}

+ (Class)headersClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstanceIfExists
{
  return (id)sSharedInstance;
}

+ (id)sharedInstance
{
  pthread_once(&sSharedInstanceInitializer, initializeSharedInstance);
  return (id)[a1 sharedInstanceIfExists];
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (MFLibraryStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 criterion];
  uint64_t v8 = [(MFLibraryStore *)self initWithCriterion:v7 mailbox:v6 readOnly:v4];

  return v8;
}

- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFLibraryStore;
  v10 = [(MFLibraryStore *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_criterion, a3);
    objc_storeStrong((id *)&v11->_mailbox, a4);
    uint64_t v12 = [v9 account];
    account = v11->_account;
    v11->_account = (MailAccount *)v12;

    *(_DWORD *)&v11->_flags |= 0x100u;
  }

  return v11;
}

- (void)dealloc
{
  [(MFLibraryStore *)self setLibrary:0];
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryStore;
  [(MFLibraryStore *)&v3 dealloc];
}

- (void)setLibrary:(id)a3
{
  id v5 = (MFMailMessageLibrary *)a3;
  p_library = &self->_library;
  if (self->_library != v5)
  {
    id v9 = v5;
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = v7;
    if (*p_library) {
      objc_msgSend(v7, "removeObserver:name:object:", self, 0);
    }
    objc_storeStrong((id *)&self->_library, a3);
    if (v9)
    {
      [v8 addObserver:self selector:sel__queueMessagesAdded_ name:@"MailMessageStoreMessagesAdded" object:*p_library];
      [v8 addObserver:self selector:sel__queueMessageFlagsChanged_ name:@"MailMessageStoreMessageFlagsChanged" object:*p_library];
      [v8 addObserver:self selector:sel__queueMessagesWillBeCompacted_ name:@"MailMessageStoreMessagesWillBeCompacted" object:*p_library];
      [v8 addObserver:self selector:sel__queueMessagesWereCompacted_ name:@"MailMessageStoreMessagesRemoved" object:*p_library];
    }
    [(MFLibraryStore *)self invalidateFetchWindow];

    id v5 = v9;
  }
}

- (void)invalidateFetchWindow
{
  [(MFLibraryStore *)self mf_lock];
  self->_fetchWindow = 0;
  [(MFLibraryStore *)self mf_unlock];
}

- (id)copyOfAllMessagesWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(MFLibraryStore *)self mf_lock];
  id v5 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", 0, 0x7FFFFFFFFFFFFFFFLL, v3);
  if ([v5 count] && self->_state <= 1)
  {
    [(MFLibraryStore *)self mf_unlock];
    [(MFLibraryStore *)self messagesWereAdded:v5];
    [(MFLibraryStore *)self addCountsForMessages:v5 shouldUpdateUnreadCount:0];
  }
  else
  {
    [(MFLibraryStore *)self mf_unlock];
  }
  return v5;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5
{
  uint64_t v6 = *(void *)&a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(MFLibraryStore *)self mf_lock];
  if (a5) {
    *a5 = self->_generationNumber;
  }
  if (v6 == 6297663)
  {
    library = self->_library;
    uint64_t v12 = [(MFLibraryStore *)self URLString];
    uint64_t v13 = -[MFMailMessageLibrary messagesWithSummariesForMailbox:range:](library, "messagesWithSummariesForMailbox:range:", v12, location, length);
  }
  else
  {
    if ((v6 & 0x1800) != 0)
    {
      v14 = (void *)MEMORY[0x1E4F1CA48];
      objc_super v15 = [(MFLibraryStore *)self criterion];
      v16 = [v14 arrayWithObject:v15];

      if ((v6 & 0x800) != 0)
      {
        v17 = +[MFMessageCriterion messageIsDeletedCriterion:0];
        [v16 addObject:v17];
      }
      if ((v6 & 0x1000) != 0)
      {
        v18 = +[MFMessageCriterion messageIsServerSearchResultCriterion:0];
        [v16 addObject:v18];
      }
      uint64_t v12 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v16];
    }
    else
    {
      uint64_t v12 = [(MFLibraryStore *)self criterion];
    }
    uint64_t v13 = -[MFMailMessageLibrary messagesMatchingCriterion:options:range:](self->_library, "messagesMatchingCriterion:options:range:", v12, v6, location, length);
  }
  v19 = (void *)v13;

  [(MFLibraryStore *)self mf_unlock];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v24, "setMessageStore:", self, (void)v27);
        if (![v24 generationNumber])
        {
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2 object:self file:@"LibraryStore.m" lineNumber:300 description:@"messages shouldn't have a zero generation number."];
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v21);
  }

  return v20;
}

- (id)criterion
{
  v2 = [(MFLibraryStore *)self mailbox];
  uint64_t v3 = [v2 criterion];

  return v3;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4
{
  return -[MFLibraryStore copyOfMessagesInRange:options:generation:](self, "copyOfMessagesInRange:options:generation:", a3.location, a3.length, *(void *)&a4, 0);
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  BOOL v56 = a7;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v58 = a6;
  uint64_t v13 = [v12 mimeBody];
  v14 = [v13 message];

  objc_super v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v14 messageID];
    v17 = [v12 partNumber];
    *(_DWORD *)buf = 138543618;
    v60 = v16;
    __int16 v61 = 2114;
    v62 = v17;
    _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "#CacheLoads requesting data for MIME part %{public}@:%{public}@", buf, 0x16u);
  }
  if (!v14)
  {
    v23 = MFLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](v23);
    }

    goto LABEL_17;
  }
  v18 = [v12 parentPart];
  if (v18) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = length == 0x7FFFFFFFFFFFFFFFLL;
  }
  int v20 = v19;

  if (!v20)
  {
    v24 = +[MFActivityMonitor currentMonitor];
    [v24 recordTransportType:1];

    v55 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v14 valueIfNotPresent:0];
    if (v55)
    {
      v25 = (int *)MEMORY[0x1E4F735C8];
      if (*(void *)&v55[*MEMORY[0x1E4F735C8]])
      {
        v26 = MFLogGeneral();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          long long v27 = [v14 messageID];
          long long v28 = [v12 partNumber];
          *(_DWORD *)buf = 138543618;
          v60 = v27;
          __int16 v61 = 2114;
          v62 = v28;
          _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_INFO, "#CacheLoads found full cached data for %{public}@:%{public}@", buf, 0x16u);
        }
        long long v29 = partDataFromFullBodyDataWithUnixLineEndings(*(void **)&v55[*v25], v14, v12, a5);
        if (v29)
        {
          long long v30 = v55;
          [v58 appendData:v29];
LABEL_33:

          goto LABEL_34;
        }
      }
    }
    if (!location)
    {
      v34 = [(MFLibraryStore *)self library];
      uint64_t v35 = [v34 dataForMimePart:v12 isComplete:a5];

      if (v35)
      {
        v36 = MFLogGeneral();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = [v14 messageID];
          v38 = [v12 partNumber];
          *(_DWORD *)buf = 138543618;
          v60 = v37;
          __int16 v61 = 2114;
          v62 = v38;
          _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_INFO, "#CacheLoads found part data in database %{public}@:%{public}@", buf, 0x16u);
        }
        long long v30 = v55;
        [v58 appendData:v35];
        long long v29 = (void *)v35;
        goto LABEL_33;
      }
    }
    long long v29 = partDataFromFullBodyData(self, v14, v12, a5, 0, (uint64_t)a8);
    if (v29)
    {
      v31 = MFLogGeneral();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = [v14 messageID];
        v33 = [v12 partNumber];
        *(_DWORD *)buf = 138543618;
        v60 = v32;
        __int16 v61 = 2114;
        v62 = v33;
        _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data in database %{public}@:%{public}@", buf, 0x16u);
      }
      long long v30 = v55;
      [v58 appendData:v29];
      goto LABEL_33;
    }
    v40 = [v12 type];
    int v41 = [v40 isEqualToString:@"multipart"];

    if ((v56 & ~v41) != 0)
    {
      v42 = MFLogGeneral();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = [v14 messageID];
        v44 = [v12 partNumber];
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        __int16 v61 = 2114;
        v62 = v44;
        _os_log_impl(&dword_1A7EFF000, v42, OS_LOG_TYPE_INFO, "#CacheLoads downloading part data from server %{public}@:%{public}@", buf, 0x16u);
      }
      BOOL v45 = -[MFLibraryStore _fetchDataForMimePart:range:isComplete:consumer:](self, "_fetchDataForMimePart:range:isComplete:consumer:", v12, location, length, a5, v58);
      BOOL v46 = v45;
      if (a8) {
        *a8 = v45;
      }
      v47 = MFLogGeneral();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        if (v46) {
          v48 = @"SUCCESS";
        }
        else {
          v48 = @"FAILED";
        }
        v49 = objc_msgSend(v14, "messageID", v55);
        v50 = [v12 partNumber];
        *(_DWORD *)buf = 138412802;
        v60 = v48;
        __int16 v61 = 2114;
        v62 = v49;
        __int16 v63 = 2114;
        v64 = v50;
        _os_log_impl(&dword_1A7EFF000, v47, OS_LOG_TYPE_INFO, "#CacheLoads %@ downloading part data from server %{public}@:%{public}@", buf, 0x20u);
      }
    }
    else
    {
      BOOL v46 = 0;
    }
    if (!v46 && v56)
    {
      v51 = partDataFromFullBodyData(self, v14, v12, a5, 1, (uint64_t)a8);
      if (v51)
      {
        v52 = MFLogGeneral();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = [v14 messageID];
          v54 = [v12 partNumber];
          *(_DWORD *)buf = 138543618;
          v60 = v53;
          __int16 v61 = 2114;
          v62 = v54;
          _os_log_impl(&dword_1A7EFF000, v52, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data via download %{public}@:%{public}@", buf, 0x16u);
        }
        [v58 appendData:v51];

        goto LABEL_34;
      }
    }

    if (v46)
    {
LABEL_34:
      BOOL v22 = 1;
      goto LABEL_35;
    }
LABEL_17:
    BOOL v22 = 0;
    goto LABEL_35;
  }
  uint64_t v21 = [(MFLibraryStore *)self fullBodyDataForMessage:v14 andHeaderDataIfReadilyAvailable:0 isComplete:0 downloadIfNecessary:v56 usePartDatas:0 didDownload:a8];
  if (v21) {
    [v58 appendData:v21];
  }
  BOOL v22 = v21 != 0;

LABEL_35:
  return v22;
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  BOOL v37 = a6;
  *(void *)&v42[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v9 valueIfNotPresent:0];
  v11 = (unsigned char *)v10;
  if (!v10) {
    goto LABEL_11;
  }
  id v12 = (int *)MEMORY[0x1E4F735D0];
  if (!a4)
  {
    if (*(unsigned char *)(v10 + (int)*MEMORY[0x1E4F735D0])) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = +[MFActivityMonitor currentMonitor];
  [v13 recordTransportType:1];

  id v14 = *(id *)&v11[*MEMORY[0x1E4F735C8]];
  if (a4) {
    *a4 = v11[*v12] ^ 1;
  }
  if (a5) {
    *a5 = v11[*MEMORY[0x1E4F735D8]];
  }
  objc_super v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v9, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    *(void *)v42 = v16;
    _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "#CacheLoads returning cached body data for %{public}@", buf, 0xCu);
  }
  if (!v14)
  {
LABEL_11:
    unsigned __int8 v40 = 0;
    library = self->_library;
    id v39 = 0;
    id v14 = [(MFMailMessageLibrary *)library bodyDataForMessage:v9 andHeaderDataIfReadilyAvailable:&v39 isComplete:a4 isPartial:&v40];
    id v18 = v39;
    if (v14)
    {
      BOOL v19 = +[MFActivityMonitor currentMonitor];
      [v19 recordTransportType:1];

      if (a5) {
        *a5 = v40;
      }
      if (a4) {
        BOOL v20 = !*a4;
      }
      else {
        BOOL v20 = 0;
      }
      id v21 = objc_alloc(MEMORY[0x1E4F734F8]);
      BOOL v22 = (void *)[v21 initWithData:v14 partial:v40 incomplete:v20];
      id v23 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v9 valueIfNotPresent:v22];
      v24 = MFLogGeneral();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(v9, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        *(void *)v42 = v25;
        _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_INFO, "#CacheLoads returning body data from Library for %{public}@", buf, 0xCu);
      }
    }
    if (v18) {
      id v26 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v9 valueIfNotPresent:v18];
    }

    if (!v14)
    {
      unsigned __int8 v40 = -86;
      long long v27 = MFLogGeneral();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        long long v28 = objc_msgSend(v9, "ef_publicDescription");
        *(_DWORD *)buf = 67109378;
        v42[0] = v37;
        LOWORD(v42[1]) = 2114;
        *(void *)((char *)&v42[1] + 2) = v28;
        _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_INFO, "#CacheLoads fetching body data from network (download=%d) for %{public}@", buf, 0x12u);
      }
      id v38 = 0;
      id v14 = [(MFLibraryStore *)self _fetchBodyDataForMessage:v9 andHeaderDataIfReadilyAvailable:&v38 downloadIfNecessary:v37 partial:&v40];
      id v29 = v38;
      if (v14)
      {
        if (a4) {
          *a4 = 1;
        }
        if (a5) {
          *a5 = v40;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F734F8]);
        v31 = (void *)[v30 initWithData:v14 partial:v40 incomplete:0];
        uint64_t v32 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v9 valueIfNotPresent:v31];
        v33 = (void *)v32;
        if (v32)
        {
          id v34 = *(id *)(v32 + (int)*MEMORY[0x1E4F735C8]);

          id v14 = v34;
        }
        if (v29) {
          id v35 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v9 valueIfNotPresent:v29];
        }
      }
    }
  }

  return v14;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[MFActivityMonitor currentMonitor];
  [v7 recordTransportType:1];

  id v8 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v6 valueIfNotPresent:0];
  if (!v8)
  {
    id v9 = [(MFLibraryStore *)self _fetchHeaderDataForMessage:v6 downloadIfNecessary:v4];
    if (v9)
    {
      id v8 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v6 valueIfNotPresent:v9];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLibraryMessage])
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    id v8 = [(MFLibraryStore *)&v11 _cachedBodyDataContainerForMessage:v6 valueIfNotPresent:v7];
  }
  else
  {
    id v8 = v7;
  }
  id v9 = v8;

  return v9;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLibraryMessage])
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    id v8 = [(MFLibraryStore *)&v11 _cachedHeaderDataForMessage:v6 valueIfNotPresent:v7];
  }
  else
  {
    id v8 = v7;
  }
  id v9 = v8;

  return v9;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLibraryMessage])
  {
    v11.receiver = self;
    v11.super_class = (Class)MFLibraryStore;
    id v8 = [(MFLibraryStore *)&v11 _cachedHeadersForMessage:v6 valueIfNotPresent:v7];
  }
  else
  {
    id v8 = v7;
  }
  id v9 = v8;

  return v9;
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFLibraryStore;
  id v10 = [(MFLibraryStore *)&v13 _setOrGetBody:v8 forMessage:v9 updateFlags:v5];
  if (v10 == v8 && v5) {
    [(MFLibraryStore *)self _calcAttachmentInfoForMessage:v9 body:v8];
  }

  return v10;
}

- (id)newObjectCache
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F73510]) initWithCapacity:32];
  uint64_t v3 = objc_opt_class();
  [v2 setKeyGenerator:&__block_literal_global_120];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MFLibraryStore_newObjectCache__block_invoke_2;
  v5[3] = &__block_descriptor_40_e11_q24__0_8_16lu32l8;
  v5[4] = v3;
  [v2 setComparator:v5];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_earliestReceivedDate, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

+ (unsigned)defaultLoadOptions
{
  return 3;
}

+ (id)attachmentInfoCalculationScheduler
{
  if (attachmentInfoCalculationScheduler_onceToken != -1) {
    dispatch_once(&attachmentInfoCalculationScheduler_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)attachmentInfoCalculationScheduler_sInstance;
  return v2;
}

void __52__MFLibraryStore_attachmentInfoCalculationScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.library.MFLibraryStore.attachmentInfoCalculationScheduler"];
  v1 = (void *)attachmentInfoCalculationScheduler_sInstance;
  attachmentInfoCalculationScheduler_sInstance = v0;
}

- (MFLibraryStore)initWithMailbox:(id)a3
{
  return [(MFLibraryStore *)self initWithMailbox:a3 readOnly:0];
}

+ (id)storeWithMailbox:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[MFLibraryStore alloc] initWithMailbox:v3];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MFLibraryStore *)self mailbox];
  id v6 = [v3 stringWithFormat:@"<%@: %p (uid=%@)>", v4, self, v5];

  return v6;
}

- (void)_flushAllMessageData
{
  [(MFLibraryStore *)self mf_lock];
  self->_deletedMessageCount = 0;
  self->_deletedMessagesSize = 0;
  _MFLockGlobalLock();
  uint64_t v3 = (int)*MEMORY[0x1E4F73618];
  uint64_t v4 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

  _MFUnlockGlobalLock();
  [(MFLibraryStore *)self mf_unlock];
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  [(MFLibraryStore *)&v5 _flushAllMessageData];
}

- (MailAccount)account
{
  return self->_account;
}

- (MFMailboxUid)mailboxUid
{
  return self->_mailbox;
}

- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4
{
  id v10 = a3;
  uint64_t v5 = [v10 count];
  [(MFLibraryStore *)self mf_lock];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    do
    {
      id v7 = [v10 objectAtIndex:v6];
      char v8 = [v7 messageFlags];
      uint64_t v9 = [v7 messageSize];
      if ((v8 & 2) != 0)
      {
        ++self->_deletedMessageCount;
        self->_deletedMessagesSize += v9;
      }

      --v6;
    }
    while (v6 != -1);
  }
  [(MFLibraryStore *)self mf_unlock];
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)_addInvocationToQueue:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (_addInvocationToQueue__onceToken == -1)
  {
    id v4 = v3;
  }
  else
  {
    dispatch_once(&_addInvocationToQueue__onceToken, &__block_literal_global_50);
    id v4 = v5;
  }
  [(id)_addInvocationToQueue__sInvocationQueue addInvocation:v4];
}

uint64_t __40__MFLibraryStore__addInvocationToQueue___block_invoke()
{
  uint64_t v0 = objc_alloc_init(MFInvocationQueue);
  v1 = (void *)_addInvocationToQueue__sInvocationQueue;
  _addInvocationToQueue__sInvocationQueue = (uint64_t)v0;

  v2 = (void *)_addInvocationToQueue__sInvocationQueue;
  return [v2 setThreadRecycleTimeout:60.0];
}

- (void)openSynchronously
{
  [(MFLibraryStore *)self mf_lock];
  if (self->_state > 2)
  {
    [(MFLibraryStore *)self mf_unlock];
  }
  else
  {
    self->_state = 2;
    [(MFLibraryStore *)self mf_unlock];
    self->_state = 3;
  }
}

- (BOOL)isOpened
{
  return self->_state == 3;
}

- (unint64_t)totalCount
{
  library = self->_library;
  id v3 = [(MFLibraryStore *)self criterion];
  id v4 = [(MFMailMessageLibrary *)library groupedMessagesCountForCriterion:v3 groupBy:0];

  id v5 = [v4 objectForKeyedSubscript:&stru_1EFF11268];
  unint64_t v6 = [v5 integerValue];

  return v6;
}

- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  library = self->_library;
  id v7 = [(MFLibraryStore *)self URLString];
  unint64_t v8 = [(MFMailMessageLibrary *)library allNonDeleteCountForMailbox:v7 includeServerSearchResults:v5 includeThreadSearchResults:v4];

  return v8;
}

- (unint64_t)serverMessageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)copyOfAllMessages
{
  return [(MFLibraryStore *)self copyOfAllMessagesWithOptions:3];
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v8 = [(MFLibraryStore *)self criterion];
  uint64_t v9 = objc_msgSend(v7, "initWithObjects:", v8, v6, 0);

  if ((a4 & 0x800) != 0)
  {
    id v10 = +[MFMessageCriterion messageIsDeletedCriterion:0];
    [v9 addObject:v10];
  }
  objc_super v11 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v9];
  id v12 = [(MFLibraryStore *)self library];
  objc_super v13 = [v12 messagesMatchingCriterion:v11 options:a4 | 3];

  [v13 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v13;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MFLibraryStore *)self library];
  objc_super v11 = [v9 URLString];
  id v12 = (void *)[v10 copyMessagesWithRemoteIDs:v8 options:a4 | 3 inRemoteMailbox:v11];

  [v12 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v12;
}

- (id)searchResultsWithRemoteIDs:(id)a3 requiresBody:(BOOL)a4 inMailbox:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MFLibraryStore *)self library];
  objc_super v11 = [v9 URLString];
  id v12 = [v10 searchResultsWithRemoteIDs:v8 requiresBody:v6 inRemoteMailbox:v11];

  [v12 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v12;
}

- (id)serverSearchResults
{
  id v3 = [(MFLibraryStore *)self library];
  BOOL v4 = [(MFLibraryStore *)self URLString];
  BOOL v5 = [v3 serverSearchResultMessagesForMailbox:v4];

  [v5 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v5;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessage
{
  [(MFLibraryStore *)self mf_lock];
  id v3 = [(MFLibraryStore *)self library];
  BOOL v4 = [(MFLibraryStore *)self URLString];
  BOOL v5 = [v3 dateOfOldestNonIndexedNonSearchResultMessageInMailbox:v4];

  [(MFLibraryStore *)self mf_unlock];
  return v5;
}

- (void)willFetchMessages
{
  id v5 = [(MFLibraryStore *)self library];
  id v3 = [(MFLibraryStore *)self URLString];
  BOOL v4 = [v5 dateOfOldestNonSearchResultMessageInMailbox:v3];
  [(MFLibraryStore *)self setEarliestReceivedDate:v4];
}

- (unint64_t)_fetchWindowMultiple
{
  v2 = +[MFNetworkController sharedInstance];
  if ([v2 isFatPipe])
  {
    unint64_t v3 = 250;
  }
  else if ([v2 is4GConnection])
  {
    unint64_t v3 = 250;
  }
  else
  {
    unint64_t v3 = 100;
  }

  return v3;
}

- (unint64_t)_fetchWindowMinimum
{
  v2 = +[MFNetworkController sharedInstance];
  if ([v2 isFatPipe] & 1) != 0 || (objc_msgSend(v2, "is4GConnection"))
  {
    unint64_t v3 = 3000;
  }
  else if ([v2 is3GConnection])
  {
    unint64_t v3 = 100;
  }
  else
  {
    unint64_t v3 = 50;
  }

  return v3;
}

- (unint64_t)_calculateFetchWindowWithAdditionalMultiple:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MFLibraryStore *)self _fetchWindowMultiple];
  unint64_t v6 = [(MFLibraryStore *)self _fetchWindowMinimum];
  float v7 = (double)[(MFLibraryStore *)self allNonDeletedCountIncludingServerSearch:0 andThreadSearch:0]/ (double)v5;
  float v8 = ceilf(v7) * (float)v5;
  if (v3) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = 0;
  }
  if (v6 <= v9 + (unint64_t)v8) {
    unint64_t v10 = v9 + (unint64_t)v8;
  }
  else {
    unint64_t v10 = v6;
  }
  unint64_t result = [(MFLibraryStore *)self fetchWindowCap];
  if (result >= v10) {
    return v10;
  }
  return result;
}

- (BOOL)hasMoreFetchableMessages
{
  unint64_t v3 = [(MFLibraryStore *)self serverMessageCount];
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 > [(MFLibraryStore *)self allNonDeletedCountIncludingServerSearch:0 andThreadSearch:0];
}

- (BOOL)shouldGrowFetchWindow
{
  unint64_t v3 = [(MFLibraryStore *)self fetchWindow];
  if (v3 >= [(MFLibraryStore *)self fetchWindowCap])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = [(MFLibraryStore *)self hasMoreFetchableMessages];
    if (v4)
    {
      unint64_t v5 = [(MFLibraryStore *)self serverMessageCount];
      LOBYTE(v4) = v5 > [(MFLibraryStore *)self fetchWindow];
    }
  }
  return v4;
}

- (unint64_t)growFetchWindow
{
  [(MFLibraryStore *)self mf_lock];
  unint64_t v3 = [(MFLibraryStore *)self _calculateFetchWindowWithAdditionalMultiple:1];
  self->_fetchWindow = v3;
  [(MFLibraryStore *)self mf_unlock];
  return v3;
}

- (unint64_t)fetchWindow
{
  [(MFLibraryStore *)self mf_lock];
  unint64_t fetchWindow = self->_fetchWindow;
  if (!fetchWindow)
  {
    unint64_t fetchWindow = [(MFLibraryStore *)self _calculateFetchWindowWithAdditionalMultiple:0];
    self->_unint64_t fetchWindow = fetchWindow;
  }
  [(MFLibraryStore *)self mf_unlock];
  return fetchWindow;
}

- (unint64_t)fetchWindowCap
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v3 = [v2 BOOLForKey:@"FetchWithoutLimits"];

  if (v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 10000;
  }
}

- (int64_t)fetchMobileSynchronously:(unint64_t)a3
{
  return [(MFLibraryStore *)self fetchMobileSynchronously:a3 preservingUID:0 options:35];
}

- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v41 = a4;
  kdebug_trace();
  float v7 = +[MFActivityMonitor currentMonitor];
  float v8 = [(MFLibraryStore *)self mailbox];
  [v7 setMailbox:v8];

  unint64_t v9 = +[MFActivityMonitor currentMonitor];
  [v9 addReason:@"MonitoredActivityReasonFetching"];

  unint64_t v10 = [(MFLibraryStore *)self mailbox];
  uint64_t v11 = [v10 URLString];

  id v39 = (void *)v11;
  v42 = [NSString stringWithFormat:@"%@", v11];
  v43 = [NSString stringWithFormat:@"%@|%lu|%@|%d", v42, lastFetchCount, v41, (a5 >> 1) & 1];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:0xFFFFFFFFLL];
  objc_super v13 = [(MFLibraryStore *)self account];
  id v45 = v12;
  int v14 = [v13 willPerformActionForChokePoint:v42 coalescePoint:v43 result:&v45];
  id v15 = v45;

  if (v15) {
    int v16 = 0;
  }
  else {
    int v16 = v14;
  }
  if (v16 == 1)
  {
    do
    {
      v17 = [(MFLibraryStore *)self account];
      id v44 = 0;
      LOBYTE(v14) = [v17 willPerformActionForChokePoint:v42 coalescePoint:v43 result:&v44];
      id v15 = v44;

      if (v15) {
        char v18 = 0;
      }
      else {
        char v18 = v14;
      }
    }
    while ((v18 & 1) != 0);
  }
  if (v14)
  {
    BOOL v19 = v15;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v39];
    v36 = (void *)v20;
    id v21 = MFAutoFetchLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v20;
      _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "Issuing fetch for mailbox: %@", buf, 0xCu);
    }

    BOOL v22 = +[MFActivityMonitor currentMonitor];
    BOOL v37 = [v22 startedFetch];

    if (v37) {
      v37[2]();
    }
    id v23 = [(MFLibraryStore *)self account];
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "powerAssertionIdentifierWithPrefix:");
      id v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v38 = @"com.apple.message.fetchMobileSynchronously";
    }
    v25 = +[MFPowerController sharedInstance];
    [v25 retainAssertionWithIdentifier:v38 withAccount:v24];

    [(MFLibraryStore *)self mf_lock];
    if (lastFetchCount) {
      self->_lastFetchCount = lastFetchCount;
    }
    else {
      lastFetchCount = self->_lastFetchCount;
    }
    [(MFLibraryStore *)self mf_unlock];
    int v26 = -2;
    do
    {
      int64_t v27 = [(MFLibraryStore *)self fetchNumMessages:lastFetchCount preservingUID:v41 options:a5];
      if ((v27 & 0x8000000000000000) == 0) {
        break;
      }
      long long v28 = +[MFActivityMonitor currentMonitor];
      id v29 = [v28 error];
      char v30 = [v24 shouldFetchAgainWithError:v29 foregroundRequest:(a5 >> 4) & 1];

      char v31 = v26++ ? v30 : 0;
    }
    while ((v31 & 1) != 0);
    BOOL v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v27];

    uint64_t v32 = [(MFLibraryStore *)self account];
    [v32 didFinishActionForChokePoint:v42 coalescePoint:v43 withResult:v19];

    v33 = +[MFPowerController sharedInstance];
    [v33 releaseAssertionWithIdentifier:v38];
  }
  kdebug_trace();
  int64_t v34 = [v19 integerValue];

  return v34;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  unint64_t v5 = +[MFActivityMonitor currentMonitor];
  [v5 reset];

  return 0;
}

- (BOOL)canFetchSearchResults
{
  return 0;
}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
{
  return 0;
}

- (BOOL)canFetchMessageIDs
{
  return 0;
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  return -1;
}

- (id)messageIdRollCall:(id)a3
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  id v4 = a3;
  library = self->_library;
  unint64_t v6 = [(MFLibraryStore *)self URLString];
  float v7 = [(MFMailMessageLibrary *)library messageWithMessageID:v4 options:0 inMailbox:v6];

  [v7 setMessageStore:self];
  return v7;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  return 0;
}

- (id)filterMessagesByMembership:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  unint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        mailbox = self->_mailbox;
        if (mailbox)
        {
          unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "mailbox", (void)v14);
          uint64_t v11 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue();
          BOOL v12 = mailbox == v11;

          if (v12)
          {
            if (!v5)
            {
              unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
            }
            [v5 addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4
{
  id v14 = a4;
  uint64_t v6 = [a3 userInfo];
  uint64_t v7 = [v6 objectForKey:@"messages"];
  float v8 = [v6 objectForKey:@"mailboxes"];
  unint64_t v9 = [(MFLibraryStore *)self mailbox];
  if (v9 && [v8 indexOfObject:v9] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v7;
    objc_super v13 = 0;
  }
  else
  {
    uint64_t v10 = [(MFLibraryStore *)self criterion];
    uint64_t v11 = (void *)v10;
    id v12 = 0;
    if (v9 || !v10)
    {
      objc_super v13 = (void *)v10;
    }
    else
    {
      [(MFMailMessageLibrary *)self->_library filterContiguousMessages:v7 forCriterion:v10 options:3];
      objc_super v13 = v11;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if ([v12 count])
  {
    [(MFLibraryStore *)self addCountsForMessages:v12 shouldUpdateUnreadCount:0];
    [(MFLibraryStore *)self messagesWereAdded:v12 earliestReceivedDate:v14];
  }
}

- (void)messagesWereAdded:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(MFLibraryStore *)self messagesWereAdded:v5 earliestReceivedDate:v4];
}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  id v9 = a3;
  [v9 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  unint64_t generationNumber = self->_generationNumber;
  if (generationNumber == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = generationNumber + 1;
  }
  self->_unint64_t generationNumber = v6;
  if ([v9 count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, @"messages", 0);
    float v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"MailMessageStoreMessagesAdded" object:self userInfo:v7];
  }
}

- (void)messagesWillBeCompacted:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = @"messages";
    v8[0] = v4;
    unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 postNotificationName:@"MailMessageStoreMessagesWillBeCompacted" object:self userInfo:v6];
  }
}

- (void)messagesWereCompacted:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = @"messages";
    v8[0] = v4;
    unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 postNotificationName:@"MailMessageStoreMessagesRemoved" object:self userInfo:v6];
  }
}

- (void)messageFlagsDidChange:(id)a3 flags:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v10)
  {
    float v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"messages", v6, @"flags", 0);
  }
  else
  {
    float v8 = 0;
  }
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"MailMessageStoreMessageFlagsChanged" object:self userInfo:v8];
}

- (void)allMessageFlagsDidChange:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = @"flags";
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MailMessageStoreMessageFlagsChanged" object:self userInfo:v5];
}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MFLibraryStore *)self mf_lock];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = [v10 objectForKey:v14];
        int v16 = [v15 intValue];

        if (v9) {
          unint64_t v17 = MFMessageFlagsByApplyingDictionary(v16, v9);
        }
        else {
          unint64_t v17 = [v14 messageFlags];
        }
        if ((((unint64_t)v16 >> 1) & 1) != ((v17 >> 1) & 1))
        {
          uint64_t v18 = [v14 messageSize];
          unint64_t deletedMessageCount = self->_deletedMessageCount;
          if ((v16 & 2) != 0)
          {
            self->_unint64_t deletedMessageCount = deletedMessageCount - 1;
            unint64_t v20 = self->_deletedMessagesSize - v18;
          }
          else
          {
            self->_unint64_t deletedMessageCount = deletedMessageCount + 1;
            unint64_t v20 = self->_deletedMessagesSize + v18;
          }
          self->_deletedMessagesSize = v20;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  [(MFLibraryStore *)self mf_unlock];
}

- (void)handleMessageFlagsChanged:(id)a3
{
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKey:@"mailboxes"];
  id v5 = [v9 objectForKey:@"messages"];
  id v6 = [(MFLibraryStore *)self filterMessagesByMembership:v5];

  if ([v6 count])
  {
    uint64_t v7 = [v9 objectForKey:@"flags"];
    id v8 = [v9 objectForKey:@"oldFlagsByMessage"];
    if (v8) {
      [(MFLibraryStore *)self _handleFlagsChangedForMessages:v6 flags:v7 oldFlagsByMessage:v8];
    }
    [(MFLibraryStore *)self messageFlagsDidChange:v6 flags:v7];

    goto LABEL_5;
  }
  if (self->_mailbox && objc_msgSend(v4, "containsObject:"))
  {
    uint64_t v7 = [v9 objectForKeyedSubscript:@"flags"];
    [(MFLibraryStore *)self allMessageFlagsDidChange:v7];
LABEL_5:
  }
}

- (id)_memberMessagesWithCompactionNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  unint64_t v17 = [v16 userInfo];
  id v4 = [v17 objectForKey:@"messages"];
  uint64_t v18 = v4;
  id v5 = [v17 objectForKey:@"mailboxes"];
  if ([v4 count] && self->_mailbox && objc_msgSend(v5, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v4;
    id v6 = 0;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_super v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          mailbox = self->_mailbox;
          long long v15 = [v13 mailbox];
          LODWORD(mailbox) = mailbox == v15;

          if (mailbox)
          {
            if (!v6)
            {
              id v6 = [MEMORY[0x1E4F1CA48] array];
            }
            [v6 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)handleMessagesCompacted:(id)a3
{
  id v5 = a3;
  [(MFLibraryStore *)self mf_lock];
  id v4 = [(MFLibraryStore *)self _memberMessagesWithCompactionNotification:v5];
  if ([v4 count])
  {
    self->_deletedMessagesSize = 0;
    self->_unint64_t deletedMessageCount = 0;
  }
  [(MFLibraryStore *)self mf_unlock];
  [(MFLibraryStore *)self messagesWereCompacted:v4];
}

- (void)handleMessagesWillBeCompacted:(id)a3
{
  id v4 = [(MFLibraryStore *)self _memberMessagesWithCompactionNotification:a3];
  -[MFLibraryStore messagesWillBeCompacted:](self, "messagesWillBeCompacted:");
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 summary];
  if (v4) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [v3 isMessageContentsLocallyAvailable] ^ 1;
  }

  return v5;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  id v4 = -[MFMailMessageLibrary headerDataForMessage:](self->_library, "headerDataForMessage:", a3, a4);
  return v4;
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id v9 = a3;
  uint64_t v10 = +[MFActivityMonitor currentMonitor];
  [v10 recordTransportType:1];

  uint64_t v11 = [(MFMailMessageLibrary *)self->_library bodyDataForMessage:v9 andHeaderDataIfReadilyAvailable:a4];
  if (a6) {
    *a6 = 1;
  }

  return v11;
}

- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6
{
  return 0;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  return 0;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  BOOL v8 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F73560]) initWithConsumer:v14];
  LODWORD(v8) = -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", v13, location, length, a5, v15, v8, a7);
  [v15 done];
  if (v8)
  {
    id v16 = [v14 data];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v44 = a4;
  id v7 = [v44 mimeBody];
  BOOL v8 = [v7 message];

  id v45 = v8;
  if (![v8 isLibraryMessage])
  {
    id v41 = 0;
    goto LABEL_32;
  }
  if ([v44 isHTML])
  {
    id v9 = [(MFLibraryStore *)self library];
    [v9 storeRemoteContentLinksFromData:v43 forMessage:v8 mimePart:v44];
  }
  else
  {
    if ((_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl()) {
      goto LABEL_9;
    }
    id v9 = [(MFLibraryStore *)self library];
    [v9 detectDataFromPlainTextMessage:v43 forMessage:v8 mimePart:v44];
  }

LABEL_9:
  uint64_t v10 = MFPersistenceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(v8, "ef_publicDescription");
    *(_DWORD *)buf = 138543874;
    v55 = v11;
    __int16 v56 = 2114;
    id v57 = v44;
    __int16 v58 = 1026;
    BOOL v59 = v5;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Storing data for MIME part: %{public}@ of message: %{public}@ complete: %{public}d", buf, 0x1Cu);
  }
  uint64_t v12 = [(MFLibraryStore *)self library];
  id v13 = [v44 partNumber];
  v42 = [v12 dataConsumerForMessage:v45 part:v13 incomplete:!v5];

  [v42 appendData:v43];
  [v42 done];
  id v41 = [v42 data];
  if ([v45 updateSubjectFromEncryptedContent])
  {
    id v14 = [(MFLibraryStore *)self library];
    long long v15 = [v45 subject];
    id v16 = [v15 subjectWithoutPrefix];
    [v14 updateUnprefixedSubjectTo:v16 forMessage:v45];
  }
  unsigned __int8 v40 = [v45 signatureInfoIfDecodingIsComplete:1];
  if (v40)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F601F0]);
    uint64_t v18 = [v40 smimeCapabilities];
    long long v19 = [v40 signingDate];
    if (v18) {
      long long v20 = v18;
    }
    else {
      long long v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v47 = (void *)[v17 initWithCapabilities:v20 date:v19];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v21 = [v40 addresses];
    id obj = v21;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          int v26 = [(MFLibraryStore *)self library];
          uint64_t v27 = [v26 persistence];
          long long v28 = [v27 messagePersistence];
          id v29 = v25;
          char v30 = [v29 emailAddressValue];
          char v31 = [v30 simpleAddress];
          uint64_t v32 = v31;
          if (v31)
          {
            id v33 = v31;
          }
          else
          {
            id v33 = [v29 stringValue];
          }
          int64_t v34 = v33;

          [v28 setMetadata:v47 forAddress:v34];
        }
        long long v21 = obj;
        uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v22);
    }
  }
  if (_os_feature_enabled_impl()
    && [MEMORY[0x1E4F602E0] preferenceEnabled:39])
  {
    id v35 = [(MFLibraryStore *)self library];
    v36 = [v35 persistence];
    BOOL v37 = [v36 messageChangeManager];
    id v38 = [v37 messageAuthenticator];
    [v38 authenticateMessage:v45];
  }
LABEL_32:

  return v41;
}

- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5
{
  BOOL v35 = a5;
  id v36 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = v6;
  if (a4 != -1)
  {
    [v6 addObject:v36];
    LOBYTE(v8) = 0;
    while (!(([v7 count] == 0) | v8 & 1))
    {
      id v9 = [v7 objectAtIndex:0];
      uint64_t v8 = [v9 firstChildPart];
      if (v8)
      {
        do
        {
          [v7 addObject:v8];
          uint64_t v10 = [(id)v8 nextSiblingPart];

          uint64_t v8 = v10;
        }
        while (v10);
      }
      else if ([v9 isAttachment])
      {
        [v9 range];
        LOBYTE(v8) = v11 >= a4;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
      [v7 removeObjectAtIndex:0];
    }
    if ((v8 & 1) == 0)
    {
      id v32 = 0;
      goto LABEL_43;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  id v13 = [v36 mimeBody];
  id v14 = [v13 message];

  [v7 removeAllObjects];
  [v7 addObject:v36];
  if (!Mutable)
  {
LABEL_39:
    char v31 = 0;
    id v32 = 0;
    goto LABEL_42;
  }
  unint64_t v34 = a4;
  while ([v7 count])
  {
    long long v15 = [v7 objectAtIndex:0];
    id v16 = [v15 firstChildPart];
    if (v16)
    {
      do
      {
        [v7 addObject:v16];
        uint64_t v17 = [v16 nextSiblingPart];

        id v16 = (void *)v17;
      }
      while (v17);
      uint64_t v18 = [v15 type];
      uint64_t v19 = [v18 isEqualToString:@"multipart"];

      if ((v19 & 1) == 0)
      {
LABEL_21:
        [v15 range];
        if (v21)
        {
          uint64_t v22 = objc_msgSend(v14, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v15, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v35, 0);
          uint64_t v23 = [v15 decodedDataForData:v22];

          uint64_t v24 = (void *)v23;
        }
        else
        {
          uint64_t v24 = [MEMORY[0x1E4F1C9B8] data];
        }
        int v26 = [v15 firstChildPart];
        long long v25 = v26;
        if (v26)
        {
          uint64_t v27 = [v26 firstChildPart];
          if (v27 || ![v25 isAttachment])
          {
            id v29 = v24;
          }
          else
          {
            if (![v24 length]) {
              goto LABEL_30;
            }
            [v25 range];
            if (v28 < v34) {
              goto LABEL_30;
            }
            char v30 = objc_msgSend(NSString, "stringWithFormat:", @"X-Apple-Content-Length: %lu\n", v28);
            uint64_t v27 = [v30 dataUsingEncoding:1];

            id v29 = (void *)[v27 mutableCopy];
            [v29 appendData:v24];
          }
          if (v29)
          {
LABEL_34:
            CFDictionarySetValue(Mutable, v15, v29);
            goto LABEL_35;
          }
        }
        else
        {
LABEL_30:
          id v29 = v24;
          if (v24) {
            goto LABEL_34;
          }
        }
        CFRelease(Mutable);
        Mutable = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      if (![v15 isAttachment]) {
        goto LABEL_21;
      }
      [v15 range];
      if (v20 < v34) {
        goto LABEL_21;
      }
    }
    long long v25 = 0;
LABEL_36:
    [v7 removeObjectAtIndex:0];

    if (!Mutable) {
      goto LABEL_39;
    }
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v31 = objc_alloc_init(MFMessageWriter);
  [(MFMessageWriter *)v31 appendDataForMimePart:v36 toData:v32 withPartData:Mutable];
  CFRelease(Mutable);
LABEL_42:

LABEL_43:
  return v32;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v13 valueIfNotPresent:0];
  long long v15 = (unsigned char *)v14;
  if (v14 && !*(unsigned char *)(v14 + (int)*MEMORY[0x1E4F735D8]) && (a5 || !*(unsigned char *)(v14 + (int)*MEMORY[0x1E4F735D0])))
  {
    id v16 = +[MFActivityMonitor currentMonitor];
    [v16 recordTransportType:1];

    id v17 = *(id *)&v15[*MEMORY[0x1E4F735C8]];
    if (a5) {
      *a5 = v15[*MEMORY[0x1E4F735D0]] ^ 1;
    }
    uint64_t v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v13;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "#CacheLoads returning cached full body data for %@", buf, 0xCu);
    }

    if (v17)
    {
      id v19 = 0;
      unint64_t v20 = v17;
      goto LABEL_36;
    }
  }
  if ([v13 isLibraryMessage])
  {
    library = self->_library;
    id v35 = 0;
    uint64_t v22 = [(MFMailMessageLibrary *)library fullBodyDataForMessage:v13 andHeaderDataIfReadilyAvailable:&v35];
    id v19 = v35;
    if (v22)
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v22 partial:1 incomplete:0];
      id v24 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v13 valueIfNotPresent:v23];
      goto LABEL_32;
    }
  }
  else
  {
    id v19 = 0;
  }
  if (v8)
  {
    if (v9) {
      [v13 messageBodyUpdatingFlags:0];
    }
    else {
    int v26 = [v13 messageBodyIfAvailableUpdatingFlags:0];
    }
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v31 = v26;
      id v32 = [v31 topLevelPart];
      id v25 = -[MFLibraryStore _copyDataFromMimePart:threshold:downloadIfNecessary:](self, "_copyDataFromMimePart:threshold:downloadIfNecessary:");
      if (v25)
      {
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v25 partial:0 incomplete:0];
        id v28 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v13 valueIfNotPresent:v27];
        if (a8) {
          *a8 = 1;
        }
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }
  if (v25 || !v9)
  {
    unint64_t v20 = v25;
    if (!v19) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  id v34 = v19;
  uint64_t v22 = [(MFLibraryStore *)self _fetchFullBodyDataForMessage:v13 andHeaderDataIfReadilyAvailable:&v34 downloadIfNecessary:1 didDownload:a8];
  uint64_t v23 = v19;
  id v19 = v34;
LABEL_32:
  unint64_t v20 = (void *)v22;

  if (v19) {
LABEL_35:
  }
    id v29 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v13 valueIfNotPresent:v19];
LABEL_36:
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v20 != 0;
  }

  return v20;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  id v7 = [(MFLibraryStore *)self fullBodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:a4 isComplete:a5 downloadIfNecessary:a6 usePartDatas:1 didDownload:a7];
  return v7;
}

- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
}

- (void)setData:(id)a3 summary:(id)a4 forMessage:(id)a5 isPartial:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(MFLibraryStore *)self library];
  [v12 setData:v13 forMessage:v11 isPartial:v6];

  if (v10)
  {
    [v11 setSummary:v10];
    [(MFLibraryStore *)self _calcAttachmentInfoForMessage:v11 body:0];
  }
}

- (void)_calcAttachmentInfoForMessage:(id)a3 body:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 messageFlags] & 2) == 0)
  {
    id v7 = [(id)objc_opt_class() attachmentInfoCalculationScheduler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __53__MFLibraryStore__calcAttachmentInfoForMessage_body___block_invoke;
    v8[3] = &unk_1E5D3B6E0;
    id v9 = v5;
    id v10 = v6;
    [v7 performBlock:v8];
  }
}

uint64_t __53__MFLibraryStore__calcAttachmentInfoForMessage_body___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) calculateAttachmentInfoFromBody:*(void *)(a1 + 40)];
}

- (void)addMessageDataToCaches:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = MFPersistenceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(MFLibraryStore *)self description];
    uint64_t v12 = objc_msgSend(v9, "ef_publicDescription");
    int v21 = 138412802;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 2114;
    int v26 = v12;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "%@ (%p) caching headers for %{public}@", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v13 = objc_msgSend(v8, "mf_rangeOfRFC822HeaderData");
  unint64_t v15 = v14;
  if (v14 <= [v8 length])
  {
    id v16 = objc_msgSend(v8, "mf_subdataWithRange:", v13 + v15, objc_msgSend(v8, "length") - (v13 + v15));
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v16 partial:v5 incomplete:0];
    id v18 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v9 valueIfNotPresent:v17];
  }
  id v19 = objc_msgSend(v8, "mf_subdataWithRange:", v13, v15);
  id v20 = [(MFLibraryStore *)self _cachedHeaderDataForMessage:v9 valueIfNotPresent:v19];
}

- (BOOL)shouldDeleteInPlace
{
  id v3 = [(MFLibraryStore *)self account];
  id v4 = [(MFLibraryStore *)self mailbox];
  char v5 = [v3 deleteInPlaceForMailbox:v4];

  return v5;
}

- (BOOL)shouldArchive
{
  id v3 = [(MFLibraryStore *)self account];
  if ([v3 shouldArchiveByDefault])
  {
    id v4 = [(MFLibraryStore *)self mailbox];
    char v5 = [v3 canArchiveForMailbox:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)archiveDestination
{
  id v3 = [(MFLibraryStore *)self account];
  id v4 = [(MFLibraryStore *)self mailbox];
  int64_t v5 = [v3 archiveDestinationForMailbox:v4];

  return v5;
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4)
  {
    id v28 = self;
    char v30 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = v29;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v12 = [v11 account];
          uint64_t v13 = [v11 mailbox];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v14 = [v12 mailboxUidOfType:3 createIfNeeded:0];
            BOOL v15 = v13 == v14;

            if (!v15)
            {
              id v16 = [v12 identifier];
              id v17 = [v30 objectForKeyedSubscript:v16];
              id v18 = v17;
              if (v17)
              {
                [v17 addObject:v11];
              }
              else
              {
                id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
                [v30 setObject:v18 forKeyedSubscript:v16];
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v8);
    }

    if ([v30 count])
    {
      id v19 = [(MFMailMessageLibrary *)v28->_library persistence];
      id v20 = [v19 messageChangeManager];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __45__MFLibraryStore_deleteMessages_moveToTrash___block_invoke;
      v31[3] = &unk_1E5D3BE30;
      id v32 = v20;
      id v33 = v7;
      id v21 = v20;
      [v30 enumerateKeysAndObjectsUsingBlock:v31];
    }
  }
  else
  {
    uint64_t v22 = [(MFMailMessageLibrary *)self->_library persistence];
    __int16 v23 = [v22 messageChangeManager];
    [v23 deleteMessages:v29];
  }
  double v24 = CFAbsoluteTimeGetCurrent();
  __int16 v25 = MFLogGeneral();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = [v29 count];
    unint64_t v27 = [v29 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v39 = v26;
    __int16 v40 = 2048;
    double v41 = v24 - Current;
    __int16 v42 = 2048;
    double v43 = (v24 - Current) / (double)v27;
    _os_log_debug_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Deleting %lu messages took %4.5f seconds (%4.5f s/msg)", buf, 0x20u);
  }
}

void __45__MFLibraryStore_deleteMessages_moveToTrash___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  int64_t v5 = +[MailAccount accountWithUniqueId:a2];
  id v6 = [v5 mailboxUidOfType:3 createIfNeeded:1];
  id v7 = v6;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v9 = [v6 URL];
    id v10 = (id)[v8 moveMessages:v11 destinationMailboxURL:v9 userInitiated:1];
  }
  else
  {
    [*(id *)(a1 + 32) deleteMessages:*(void *)(a1 + 40)];
  }
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = [(MFLibraryStore *)self mailbox];
  id v7 = [v6 URLString];

  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = [(MFMailMessageLibrary *)self->_library messagesForMailbox:v7 olderThanNumberOfDays:v4];
  uint64_t v10 = [v9 count];
  if (v10) {
    [(MFMailMessageLibrary *)self->_library compactMessages:v9];
  }
  id v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218498;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    BOOL v15 = v7;
    __int16 v16 = 2048;
    double v17 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_debug_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Searching for and deleting %lu messages in %@ took: %fs", (uint8_t *)&v12, 0x20u);
  }
}

- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5
{
  BOOL v6 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v13 = v8;
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  v14[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v12 = [(MFLibraryStore *)self setFlagsFromDictionary:v11 forMessages:v9];
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MFFlagChangeObjectForFlagChangeDictionary(v6);
  id v9 = MFFlagChangeDictionaryStrippingServerFlags(v6);
  if ([v8 hasChanges])
  {
    uint64_t v10 = [(MFLibraryStore *)self library];
    id v11 = [v10 persistence];
    id v12 = [v11 messageChangeManager];
    id v13 = (id)[v12 applyFlagChange:v8 toMessages:v7];
  }
  if ([v9 count])
  {
    __int16 v14 = [(MFLibraryStore *)self setFlagsLocallyFromDictionary:v9 forMessages:v7];
  }
  else
  {
    __int16 v14 = 0;
  }

  return v14;
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  uint64_t v4 = [(MFMailMessageLibrary *)self->_library setFlagsFromDictionary:a3 forMessages:a4];
  return v4;
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
}

- (BOOL)allowsAppend
{
  v2 = [(MFLibraryStore *)self URLString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canCompact
{
  $835FD4CD3CFECF79DE90309A635A882F flags = self->_flags;
  return (*(unsigned char *)&flags & 1) == 0
      && (*(unsigned char *)&flags & 8) == 0
      && self->_deletedMessageCount
      && [(MFLibraryStore *)self isOpened];
}

- (void)doCompact
{
  if ([(MFLibraryStore *)self canCompact])
  {
    BOOL v3 = [(MFLibraryStore *)self URLString];
    if (v3 && self->_deletedMessageCount)
    {
      uint64_t v4 = v3;
      [(MFMailMessageLibrary *)self->_library compactMailbox:v3];
      BOOL v3 = v4;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
}

- (void)compactMessages:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(MFMailMessageLibrary *)self->_library compactMessages:v4];
  }
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  id v4 = [(MFMailMessageLibrary *)self->_library dataPathForMessage:a3 part:a4];
  return v4;
}

- (NSString)URLString
{
  v2 = [(MFLibraryStore *)self mailbox];
  BOOL v3 = [v2 URLString];

  return (NSString *)v3;
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  v2 = [(MFLibraryStore *)self mailbox];
  unint64_t v3 = [v2 serverUnreadOnlyOnServerCount];

  return v3;
}

- (unint64_t)unreadCount
{
  v2 = [(MFLibraryStore *)self mailbox];
  unint64_t v3 = [v2 unreadCount];

  return v3;
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = (int)*MEMORY[0x1E4F735D0];
    int v9 = v6[v8];
    if (v6[v8] && !v7[v8] || (uint64_t v10 = (int)*MEMORY[0x1E4F735D8], v6[v10]) && !v7[v10])
    {
      uint64_t v14 = -1;
    }
    else
    {
      int v11 = v7[v8];
      if (v9) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v11 == 0;
      }
      if (v12)
      {
        if (v6[v10]) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v7[v10] == 0;
        }
        uint64_t v14 = !v13;
      }
      else
      {
        uint64_t v14 = 1;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)purgeMessages:(id)a3
{
}

- (void)purgeMessagesBeyondLimit:(unint64_t)a3
{
  library = self->_library;
  id v8 = [(MFLibraryStore *)self mailbox];
  id v6 = [v8 URLString];
  unsigned int v7 = [(MFMailMessageLibrary *)library nonDeletedCountForMailbox:v6];

  if (v7 > a3)
  {
    id v9 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", a3, v7 - a3, 2048);
    if ([v9 count]) {
      [(MFLibraryStore *)self purgeMessages:v9];
    }
  }
}

- (BOOL)hasMessageForAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  library = self->_library;
  id v5 = [(MFLibraryStore *)self mailbox];
  id v6 = [v5 URLString];
  LODWORD(library) = [(MFMailMessageLibrary *)library nonDeletedCountForMailbox:v6];

  if (library)
  {
    id v8 = [(MFLibraryStore *)self account];

    if (v8 == v4)
    {
      LOBYTE(library) = 1;
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = [(MFLibraryStore *)self copyOfAllMessagesWithOptions:2048];
      library = (MFMailMessageLibrary *)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (library)
      {
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != library; uint64_t i = (MFMailMessageLibrary *)((char *)i + 1))
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v9);
            }
            +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v13 = v12 == v4;

            if (v13)
            {
              LOBYTE(library) = 1;
              goto LABEL_13;
            }
          }
          library = (MFMailMessageLibrary *)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (library) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }

  return (char)library;
}

- (void)_queueMessagesAdded:(id)a3
{
  id v4 = a3;
  id v6 = 0;
  id v5 = [(MFLibraryStore *)self pep_getInvocation:&v6];
  [v5 handleMessagesAdded:v4 earliestReceivedDate:self->_earliestReceivedDate];

  [v6 retainArguments];
  [(MFLibraryStore *)self _addInvocationToQueue:v6];
}

- (void)_queueMessageFlagsChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessageFlagsChanged_, self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");
}

- (void)_queueMessagesWillBeCompacted:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessagesWillBeCompacted_, self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");
}

- (void)_queueMessagesWereCompacted:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessagesCompacted_, self, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore _addInvocationToQueue:](self, "_addInvocationToQueue:");
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryStore;
  BOOL v5 = [(MFLibraryStore *)&v7 hasCompleteDataForMimePart:v4]
    || [(MFMailMessageLibrary *)self->_library hasCompleteDataForMimePart:v4];

  return v5;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (NSDate)earliestReceivedDate
{
  return self->_earliestReceivedDate;
}

- (void)setEarliestReceivedDate:(id)a3
{
}

- (void)dataForMimePart:(os_log_t)log inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "#CacheLoads requesting data for MIME part without a message", v1, 2u);
}

@end