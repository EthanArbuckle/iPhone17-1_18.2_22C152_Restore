@interface MFLibraryStore
+ (BOOL)createEmptyStoreForPath:(id)a3;
+ (BOOL)storeAtPathIsWritable:(id)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (id)storeWithCriterion:(id)a3;
+ (id)storeWithMailbox:(id)a3;
+ (unsigned)defaultLoadOptions;
- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (BOOL)allowsAppend;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)canCompact;
- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8;
- (BOOL)hasCompleteDataForMimePart:(id)a3;
- (BOOL)hasMessageForAccount:(id)a3;
- (BOOL)shouldCancel;
- (BOOL)shouldGrowFetchWindow;
- (MFLibraryStore)initWithCriterion:(id)a3;
- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5;
- (MFLibraryStore)initWithMailbox:(id)a3;
- (MFLibraryStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4;
- (NSDate)earliestReceivedDate;
- (id)URLString;
- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5;
- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6;
- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6;
- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_memberMessagesWithCompactionNotification:(id)a3;
- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)copyOfAllMessages;
- (id)copyOfAllMessagesForBodyLoadingFromRowID:(unsigned int)a3 limit:(unsigned int)a4;
- (id)copyOfAllMessagesWithOptions:(unsigned int)a3;
- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4;
- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5;
- (id)criterion;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)dataPathForMessage:(id)a3 part:(id)a4;
- (id)dateOfNewestNonSearchResultMessage;
- (id)dateOfOldestNonIndexedNonSearchResultMessage;
- (id)filterMessagesByMembership:(id)a3;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8;
- (id)library;
- (id)mailbox;
- (id)messageForMessageID:(id)a3 options:(unsigned int)a4;
- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4;
- (id)mutableCopyOfAllMessages;
- (id)newObjectCache;
- (id)serverSearchResults;
- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (unint64_t)_calculateFetchWindowWithAdditionalMultiple:(BOOL)a3;
- (unint64_t)_fetchWindowMinimum;
- (unint64_t)_fetchWindowMultiple;
- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4;
- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7;
- (unint64_t)fetchWindow;
- (unint64_t)fetchWindowCap;
- (unint64_t)growFetchWindow;
- (unint64_t)indexOfMessage:(id)a3;
- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4;
- (unint64_t)serverUnreadOnlyOnServerCount;
- (unint64_t)totalCount;
- (unint64_t)unreadCount;
- (unint64_t)unreadCountMatchingCriterion:(id)a3;
- (void)_addInvocationToQueue:(id)a3;
- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)_queueMessageFlagsChanged:(id)a3;
- (void)_queueMessagesAdded:(id)a3;
- (void)_queueMessagesWereCompacted:(id)a3;
- (void)_queueMessagesWillBeCompacted:(id)a3;
- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4;
- (void)compactMessages:(id)a3;
- (void)dealloc;
- (void)deleteBodyDataForMessage:(id)a3;
- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)doCompact;
- (void)handleMessageFlagsChanged:(id)a3;
- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4;
- (void)handleMessagesCompacted:(id)a3;
- (void)handleMessagesWillBeCompacted:(id)a3;
- (void)invalidateFetchWindow;
- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4;
- (void)openSynchronously;
- (void)purgeMessages:(id)a3;
- (void)purgeMessagesBeyondLimit:(unint64_t)a3 keepingMessage:(id)a4;
- (void)setEarliestReceivedDate:(id)a3;
- (void)setFlagsForAllMessagesFromDictionary:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6;
- (void)willFetchMessages;
@end

@implementation MFLibraryStore

+ (unsigned)defaultLoadOptions
{
  return 3;
}

- (MFLibraryStore)initWithCriterion:(id)a3 mailbox:(id)a4 readOnly:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MFLibraryStore;
  v7 = [(MFLibraryStore *)&v9 init];
  if (v7)
  {
    v7->_criterion = (MFMessageCriterion *)a3;
    v7->super._mailboxUid = (MFMailboxUid *)a4;
    v7->super._account = (MailAccount *)(id)[a4 account];
    *(_DWORD *)&v7->super._flags |= 0x100u;
  }
  return v7;
}

- (MFLibraryStore)initWithCriterion:(id)a3
{
  return [(MFLibraryStore *)self initWithCriterion:a3 mailbox:0 readOnly:1];
}

- (MFLibraryStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 criterion];
  return [(MFLibraryStore *)self initWithCriterion:v7 mailbox:a3 readOnly:v4];
}

- (MFLibraryStore)initWithMailbox:(id)a3
{
  return [(MFLibraryStore *)self initWithMailboxUid:a3 readOnly:0];
}

+ (id)storeWithCriterion:(id)a3
{
  v3 = [[MFLibraryStore alloc] initWithCriterion:a3];
  return v3;
}

+ (id)storeWithMailbox:(id)a3
{
  v3 = [[MFLibraryStore alloc] initWithMailbox:a3];
  return v3;
}

- (void)setLibrary:(id)a3
{
  if (self->_library != a3)
  {
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = v5;
    if (self->_library)
    {
      objc_msgSend(v5, "removeObserver:name:object:", self, 0);
      library = self->_library;
    }
    else
    {
      library = 0;
    }

    v8 = (MFMessageLibrary *)a3;
    self->_library = v8;
    if (a3)
    {
      [v6 addObserver:self selector:sel__queueMessagesAdded_ name:@"MailMessageStoreMessagesAdded" object:v8];
      [v6 addObserver:self selector:sel__queueMessageFlagsChanged_ name:@"MailMessageStoreMessageFlagsChanged" object:self->_library];
      [v6 addObserver:self selector:sel__queueMessagesWillBeCompacted_ name:@"MailMessageStoreMessagesWillBeCompacted" object:self->_library];
      [v6 addObserver:self selector:sel__queueMessagesWereCompacted_ name:@"MailMessageStoreMessagesRemoved" object:self->_library];
    }
    [(MFLibraryStore *)self invalidateFetchWindow];
  }
}

- (id)library
{
  return self->_library;
}

+ (id)sharedInstance
{
  pthread_once(&sharedInstanceInitializer, (void (*)(void))initializeSharedInstance);
  return (id)[a1 sharedInstanceIfExists];
}

+ (id)sharedInstanceIfExists
{
  return (id)_sharedInstance;
}

- (id)mailbox
{
  return self->super._mailboxUid;
}

- (void)addCountsForMessages:(id)a3 shouldUpdateUnreadCount:(BOOL)a4
{
  int v6 = objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid", a3, a4), "type");
  uint64_t v7 = [a3 count];
  [(MFLibraryStore *)self mf_lock];
  if (v7)
  {
    unsigned int v8 = v6 - 5;
    for (uint64_t i = v7 - 1; i != -1; --i)
    {
      v10 = (void *)[a3 objectAtIndex:i];
      char v11 = [v10 messageFlags];
      uint64_t v12 = [v10 messageSize];
      if ((v11 & 2) != 0)
      {
        ++self->super._deletedMessageCount;
        v13 = &OBJC_IVAR___MFMailMessageStore__deletedMessagesSize;
      }
      else
      {
        v13 = &OBJC_IVAR___MFMailMessageStore__unreadMessageCount;
        uint64_t v12 = 1;
        if (v8 >= 2 && (v11 & 1) != 0) {
          continue;
        }
      }
      *(Class *)((char *)&self->super.super.super.isa + *v13) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                 + *v13)
                                                                      + v12);
    }
  }
  [(MFLibraryStore *)self mf_unlock];
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)_addInvocationToQueue:(id)a3
{
  if (_addInvocationToQueue__onceToken != -1) {
    dispatch_once(&_addInvocationToQueue__onceToken, &__block_literal_global_4);
  }
  BOOL v4 = (void *)_addInvocationToQueue__sInvocationQueue;
  [v4 addInvocation:a3];
}

uint64_t __40__MFLibraryStore__addInvocationToQueue___block_invoke()
{
  v0 = objc_alloc_init(MFInvocationQueue);
  _addInvocationToQueue__sInvocationQueue = (uint64_t)v0;
  return [(MFInvocationQueue *)v0 setThreadRecycleTimeout:60.0];
}

- (void)openSynchronously
{
  [(MFLibraryStore *)self mf_lock];
  if (self->super._state > 2)
  {
    [(MFLibraryStore *)self mf_unlock];
  }
  else
  {
    self->super._state = 2;
    self->super._unreadMessageCount = 0;
    [(MFLibraryStore *)self mf_unlock];
    self->super._state = 3;
    [(MFMailMessageStore *)self didOpen];
  }
}

- (unint64_t)totalCount
{
  return [(MFMessageLibrary *)self->_library totalCountForMailbox:[(MFLibraryStore *)self URLString]];
}

- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return [(MFMessageLibrary *)self->_library nonDeletedCountForMailbox:[(MFLibraryStore *)self URLString] includeServerSearchResults:a3 includeThreadSearchResults:a4];
}

- (unint64_t)allNonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return [(MFMessageLibrary *)self->_library allNonDeleteCountForMailbox:[(MFLibraryStore *)self URLString] includeServerSearchResults:a3 includeThreadSearchResults:a4];
}

- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4
{
  id v5 = [(MFMessageLibrary *)self->_library messageWithLibraryID:*(void *)&a3 options:*(void *)&a4 inMailbox:[(MFLibraryStore *)self URLString]];
  [v5 setMessageStore:self];
  return v5;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4 generation:(unint64_t *)a5
{
  uint64_t v6 = *(void *)&a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(MFLibraryStore *)self mf_lock];
  if (a5) {
    *a5 = self->super._generationNumber;
  }
  if (v6 == 399)
  {
    id v11 = -[MFMessageLibrary messagesWithSummariesForMailbox:range:](self->_library, "messagesWithSummariesForMailbox:range:", [(MFLibraryStore *)self URLString], location, length);
  }
  else
  {
    if ((v6 & 0x180) != 0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", -[MFLibraryStore criterion](self, "criterion"));
      if ((v6 & 0x80) != 0) {
        objc_msgSend(v12, "addObject:", +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0));
      }
      if ((v6 & 0x100) != 0) {
        objc_msgSend(v12, "addObject:", +[MFMessageCriterion messageIsServerSearchResultCriterion:](MFMessageCriterion, "messageIsServerSearchResultCriterion:", 0));
      }
      id v13 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v12];
    }
    else
    {
      id v13 = [(MFLibraryStore *)self criterion];
    }
    id v11 = -[MFMessageLibrary messagesMatchingCriterion:options:range:](self->_library, "messagesMatchingCriterion:options:range:", v13, v6, location, length);
  }
  v14 = v11;
  [(MFLibraryStore *)self mf_unlock];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v19 setMessageStore:self];
        if (![v19 generationNumber]) {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"LibraryStore.m", 251, @"messages shouldn't have a zero generation number.");
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
  return v14;
}

- (id)copyOfMessagesInRange:(_NSRange)a3 options:(unsigned int)a4
{
  return -[MFLibraryStore copyOfMessagesInRange:options:generation:](self, "copyOfMessagesInRange:options:generation:", a3.location, a3.length, *(void *)&a4, 0);
}

- (id)copyOfAllMessagesWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(MFLibraryStore *)self mf_lock];
  id v5 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", 0, 0x7FFFFFFFFFFFFFFFLL, v3);
  if ([v5 count] && self->super._state <= 1)
  {
    [(MFLibraryStore *)self mf_unlock];
    [(MFMailMessageStore *)self messagesWereAdded:v5];
    [(MFLibraryStore *)self addCountsForMessages:v5 shouldUpdateUnreadCount:0];
  }
  else
  {
    [(MFLibraryStore *)self mf_unlock];
  }
  return v5;
}

- (id)copyOfAllMessages
{
  return [(MFLibraryStore *)self copyOfAllMessagesWithOptions:3];
}

- (id)copyOfAllMessagesForBodyLoadingFromRowID:(unsigned int)a3 limit:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = [(MFMessageLibrary *)self->_library messagesWithoutSummariesForMailbox:[(MFLibraryStore *)self URLString] fromRowID:*(void *)&a3 limit:*(void *)&a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 setMessageStore:self];
        if (![v11 generationNumber]) {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"LibraryStore.m", 285, @"messages shouldn't have a zero generation number.");
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)mutableCopyOfAllMessages
{
  id v2 = [(MFLibraryStore *)self copyOfAllMessages];
  return (id)[v2 mutableCopy];
}

- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [[MFMessageCriterion alloc] initWithType:34 qualifier:0 expression:a3];
  uint64_t v8 = [[MFMessageCriterion alloc] initWithType:9 qualifier:0 expression:a3];
  uint64_t v9 = [[MFMessageCriterion alloc] initWithType:1 qualifier:0 expression:a3];
  [(MFMessageCriterion *)v9 setCriterionIdentifier:*MEMORY[0x1E4F60738]];
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  id v10 = +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3]);

  v12[0] = [(MFLibraryStore *)self criterion];
  v12[1] = v10;
  return (id)objc_msgSend(-[MFLibraryStore library](self, "library"), "messagesMatchingCriterion:options:", +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2)), a4 | 3);
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", -[MFLibraryStore criterion](self, "criterion"), a3, 0);
  if ((a4 & 0x80) != 0) {
    objc_msgSend(v6, "addObject:", +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0));
  }
  id v7 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v6];

  id v9 = (id)objc_msgSend(-[MFLibraryStore library](self, "library"), "messagesMatchingCriterion:options:", v7, a4 | 3);
  [v9 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v9;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [(MFMailMessageStore *)self mailboxUid];
  return [(MFLibraryStore *)self copyMessagesWithRemoteIDs:a3 options:v4 inMailbox:v7];
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  id v6 = objc_msgSend(-[MFLibraryStore library](self, "library"), "copyMessagesWithRemoteIDs:options:inRemoteMailbox:", a3, a4 | 3, objc_msgSend(a5, "URLString"));
  [v6 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v6;
}

- (id)serverSearchResults
{
  uint64_t v3 = objc_msgSend(-[MFLibraryStore library](self, "library"), "serverSearchResultMessagesForMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  [v3 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  return v3;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessage
{
  [(MFLibraryStore *)self mf_lock];
  uint64_t v3 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfOldestNonIndexedNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  [(MFLibraryStore *)self mf_unlock];
  return v3;
}

- (id)dateOfNewestNonSearchResultMessage
{
  [(MFLibraryStore *)self mf_lock];
  uint64_t v3 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfNewestNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  [(MFLibraryStore *)self mf_unlock];
  return v3;
}

- (void)willFetchMessages
{
  uint64_t v3 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dateOfOldestNonSearchResultMessageInMailbox:", -[MFLibraryStore URLString](self, "URLString"));
  [(MFLibraryStore *)self setEarliestReceivedDate:v3];
}

- (unint64_t)_fetchWindowMultiple
{
  id v2 = +[MFNetworkController sharedInstance];
  if ([(MFNetworkController *)v2 isFatPipe]) {
    return 250;
  }
  if ([(MFNetworkController *)v2 is4GConnection]) {
    return 250;
  }
  return 100;
}

- (unint64_t)_fetchWindowMinimum
{
  id v2 = +[MFNetworkController sharedInstance];
  if ([(MFNetworkController *)v2 isFatPipe] || [(MFNetworkController *)v2 is4GConnection]) {
    return 150;
  }
  if ([(MFNetworkController *)v2 is3GConnection]) {
    return 100;
  }
  return 50;
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

- (void)invalidateFetchWindow
{
  [(MFLibraryStore *)self mf_lock];
  self->_fetchWindow = 0;
  [(MFLibraryStore *)self mf_unlock];
}

- (BOOL)shouldGrowFetchWindow
{
  unint64_t v3 = [(MFLibraryStore *)self fetchWindow];
  if (v3 >= [(MFLibraryStore *)self fetchWindowCap]) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  return [(MFMailMessageStore *)&v5 shouldGrowFetchWindow];
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
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"FetchWithoutLimits"))return 0x7FFFFFFFFFFFFFFFLL; {
  else
  }
    return 10000;
}

- (id)filterMessagesByMembership:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  float v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(a3);
      }
      mailboxUid = self->super._mailboxUid;
      if (mailboxUid)
      {
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (mailboxUid == (MFMailboxUid *)[v11 mailbox])
        {
          if (!v7) {
            float v7 = (void *)[MEMORY[0x1E4F1CA48] array];
          }
          [v7 addObject:v11];
        }
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
  return v7;
}

- (void)handleMessagesAdded:(id)a3 earliestReceivedDate:(id)a4
{
  uint64_t v6 = (void *)[a3 userInfo];
  id v7 = (id)[v6 objectForKey:@"messages"];
  uint64_t v8 = (void *)[v6 objectForKey:@"mailboxes"];
  id v9 = [(MFMailMessageStore *)self mailboxUid];
  if (v9)
  {
    if ([v8 indexOfObject:v9] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    [(MFLibraryStore *)self criterion];
  }
  else
  {
    id v10 = [(MFLibraryStore *)self criterion];
    if (v10)
    {
      id v7 = [(MFMessageLibrary *)self->_library filterContiguousMessages:v7 forCriterion:v10 options:3];
      goto LABEL_7;
    }
  }
  id v7 = 0;
LABEL_7:
  if ([v7 count])
  {
    [(MFLibraryStore *)self addCountsForMessages:v7 shouldUpdateUnreadCount:0];
    [(MFLibraryStore *)self messagesWereAdded:v7 earliestReceivedDate:a4];
  }
}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  [a3 makeObjectsPerformSelector:sel_setMessageStore_ withObject:self];
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryStore;
  [(MFMailMessageStore *)&v7 messagesWereAdded:a3 earliestReceivedDate:a4];
}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v9 = [(MFMailboxUid *)self->super._mailboxUid type];
  [(MFLibraryStore *)self mf_lock];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    unsigned int v24 = v9 - 5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(a3);
        }
        long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", v14), "intValue");
        unint64_t v16 = v15;
        if (a4) {
          unint64_t v17 = MFMessageFlagsByApplyingDictionary(v15, a4);
        }
        else {
          unint64_t v17 = [v14 messageFlags];
        }
        unsigned __int8 v18 = v17;
        if (((v16 >> 1) & 1) != ((v17 >> 1) & 1))
        {
          uint64_t v19 = [v14 messageSize];
          unint64_t deletedMessageCount = self->super._deletedMessageCount;
          if ((v16 & 2) != 0)
          {
            self->super._unint64_t deletedMessageCount = deletedMessageCount - 1;
            uint64_t v21 = 56;
            long long v22 = (objc_class *)(self->super._deletedMessagesSize - v19);
          }
          else
          {
            self->super._unint64_t deletedMessageCount = deletedMessageCount + 1;
            self->super._deletedMessagesSize += v19;
            if (v24 > 1) {
              goto LABEL_15;
            }
            uint64_t v21 = 72;
            long long v22 = (objc_class *)(self->super._unreadMessageCount - 1);
          }
          *(Class *)((char *)&self->super.super.super.isa + v21) = v22;
        }
LABEL_15:
        if ((v16 & 1) != (v18 & 1))
        {
          uint64_t v23 = -1;
          if ((v18 & 1) == 0) {
            uint64_t v23 = 1;
          }
          goto LABEL_22;
        }
        if ((v18 & 2) != 0 && !((v18 | v16) & 1 | v16 & 2))
        {
          uint64_t v23 = -1;
LABEL_22:
          self->super._unreadMessageCount += v23;
          continue;
        }
      }
      uint64_t v11 = [a3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
  [(MFLibraryStore *)self mf_unlock];
}

- (void)handleMessageFlagsChanged:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  uint64_t v5 = (void *)[v4 objectForKey:@"mailboxes"];
  id v6 = -[MFLibraryStore filterMessagesByMembership:](self, "filterMessagesByMembership:", [v4 objectForKey:@"messages"]);
  if ([v6 count])
  {
    uint64_t v7 = [v4 objectForKey:@"flags"];
    uint64_t v8 = [v4 objectForKey:@"oldFlagsByMessage"];
    if (v8) {
      [(MFLibraryStore *)self _handleFlagsChangedForMessages:v6 flags:v7 oldFlagsByMessage:v8];
    }
    [(MFMailMessageStore *)self messageFlagsDidChange:v6 flags:v7];
  }
  else if (self->super._mailboxUid && objc_msgSend(v5, "containsObject:"))
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"flags"];
    [(MFMailMessageStore *)self allMessageFlagsDidChange:v9];
  }
}

- (id)_memberMessagesWithCompactionNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 userInfo];
  uint64_t v5 = (void *)[v4 objectForKey:@"messages"];
  id v6 = (void *)[v4 objectForKey:@"mailboxes"];
  if (![v5 count]) {
    return 0;
  }
  if (!self->super._mailboxUid) {
    return 0;
  }
  if (objc_msgSend(v6, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      mailboxUid = self->super._mailboxUid;
      if (mailboxUid == (MFMailboxUid *)[v12 mailbox])
      {
        if (!v9) {
          uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        [v9 addObject:v12];
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v8);
  return v9;
}

- (void)handleMessagesCompacted:(id)a3
{
  [(MFLibraryStore *)self mf_lock];
  id v5 = [(MFLibraryStore *)self _memberMessagesWithCompactionNotification:a3];
  if ([v5 count])
  {
    self->super._deletedMessagesSize = 0;
    self->super._unint64_t deletedMessageCount = 0;
  }
  [(MFLibraryStore *)self mf_unlock];
  [(MFMailMessageStore *)self messagesWereCompacted:v5];
}

- (void)handleMessagesWillBeCompacted:(id)a3
{
  id v4 = [(MFLibraryStore *)self _memberMessagesWithCompactionNotification:a3];
  [(MFMailMessageStore *)self messagesWillBeCompacted:v4];
}

- (void)dealloc
{
  [(MFLibraryStore *)self setLibrary:0];

  v3.receiver = self;
  v3.super_class = (Class)MFLibraryStore;
  [(MFMailMessageStore *)&v3 dealloc];
}

- (id)messageForMessageID:(id)a3 options:(unsigned int)a4
{
  id v5 = [(MFMessageLibrary *)self->_library messageWithMessageID:a3 options:*(void *)&a4 inMailbox:[(MFLibraryStore *)self URLString]];
  [v5 setMessageStore:self];
  return v5;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  return -[MFMessageLibrary headerDataForMessage:](self->_library, "headerDataForMessage:", a3, a4);
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id result = -[MFMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:](self->_library, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:", a3, a4, a5);
  if (a6) {
    *a6 = 1;
  }
  return result;
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
  id v14 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F73560]) initWithConsumer:v14];
  LODWORD(a7) = -[MFLibraryStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", a3, location, length, a5, v15, v8, a7);
  [v15 done];
  if (a7) {
    long long v16 = (void *)[v14 data];
  }
  else {
    long long v16 = 0;
  }

  return v16;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  BOOL v8 = a7;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message");
  long long v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v53 = [v14 messageID];
    __int16 v54 = 2114;
    uint64_t v55 = [a3 partNumber];
    _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_INFO, "#CacheLoads requesting data for MIME part %{public}@:%{public}@", buf, 0x16u);
  }
  if (![a3 parentPart] && length == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [(MFLibraryStore *)self fullBodyDataForMessage:v14 andHeaderDataIfReadilyAvailable:0 isComplete:0 downloadIfNecessary:v8 usePartDatas:0 didDownload:a8];
    if (v16) {
      [a6 appendData:v16];
    }
    LOBYTE(v17) = v16 != 0;
    return v17;
  }
  long long v18 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:v14 valueIfNotPresent:0];
  if (v18 && (uint64_t v19 = v18, *(void *)&v18[*MEMORY[0x1E4F735C8]]) && !v18[*MEMORY[0x1E4F735D8]])
  {
    v31 = MFLogGeneral();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = [v14 messageID];
      uint64_t v32 = [a3 partNumber];
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v49;
      __int16 v54 = 2114;
      uint64_t v55 = v32;
      _os_log_impl(&dword_1CFCFE000, v31, OS_LOG_TYPE_INFO, "#CacheLoads found full cached data for %{public}@:%{public}@", buf, 0x16u);
    }
    unint64_t v50 = [*(id *)&v19[*MEMORY[0x1E4F735C8]] length];
    uint64_t v33 = [a3 range];
    uint64_t v20 = 0;
    if (v33 != 0x7FFFFFFFFFFFFFFFLL && v33 + v34 <= v50)
    {
      uint64_t v20 = *(void **)&v19[*MEMORY[0x1E4F735C8]];
      objc_msgSend(a6, "appendData:", objc_msgSend(v20, "mf_subdataWithRange:", v33, v34));
      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (v20 || location)
  {
    if (v20)
    {
LABEL_24:
      LOBYTE(v17) = 1;
      return v17;
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dataForMimePart:isComplete:", a3, a5);
    if (v21)
    {
      uint64_t v17 = v21;
      long long v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v14 messageID];
        uint64_t v24 = [a3 partNumber];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v23;
        __int16 v54 = 2114;
        uint64_t v55 = v24;
        long long v25 = "#CacheLoads found part data in database %{public}@:%{public}@";
LABEL_21:
        _os_log_impl(&dword_1CFCFE000, v22, OS_LOG_TYPE_INFO, v25, buf, 0x16u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  uint64_t v17 = partDataFromFullBodyData(self, (uint64_t)v14, a3, a5, 0, (uint64_t)a8);
  if (v17)
  {
    long long v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v14 messageID];
      uint64_t v27 = [a3 partNumber];
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v26;
      __int16 v54 = 2114;
      uint64_t v55 = v27;
      long long v25 = "#CacheLoads extracted part data from full body data in database %{public}@:%{public}@";
      goto LABEL_21;
    }
LABEL_22:
    id v28 = a6;
    uint64_t v29 = v17;
LABEL_23:
    [v28 appendData:v29];
    goto LABEL_24;
  }
  BOOL v35 = !v8;
  if ((objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"multipart") & 1) == 0 && !v35)
  {
    v36 = MFLogGeneral();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = [v14 messageID];
      uint64_t v38 = [a3 partNumber];
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v37;
      __int16 v54 = 2114;
      uint64_t v55 = v38;
      _os_log_impl(&dword_1CFCFE000, v36, OS_LOG_TYPE_INFO, "#CacheLoads downloading part data from server %{public}@:%{public}@", buf, 0x16u);
    }
    BOOL v39 = -[MFLibraryStore _fetchDataForMimePart:range:isComplete:consumer:](self, "_fetchDataForMimePart:range:isComplete:consumer:", a3, location, length, a5, a6);
    LODWORD(v17) = v39;
    if (a8) {
      *a8 = v39;
    }
    v40 = MFLogGeneral();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      if (v17) {
        v41 = @"SUCCESS";
      }
      else {
        v41 = @"FAILED";
      }
      uint64_t v42 = [v14 messageID];
      uint64_t v43 = [a3 partNumber];
      *(_DWORD *)buf = 138412802;
      uint64_t v53 = (uint64_t)v41;
      __int16 v54 = 2114;
      uint64_t v55 = v42;
      __int16 v56 = 2114;
      uint64_t v57 = v43;
      _os_log_impl(&dword_1CFCFE000, v40, OS_LOG_TYPE_INFO, "#CacheLoads %@ downloading part data from server %{public}@:%{public}@", buf, 0x20u);
    }
  }
  if (((v17 | v35) & 1) == 0)
  {
    uint64_t v44 = partDataFromFullBodyData(self, (uint64_t)v14, a3, a5, 1, (uint64_t)a8);
    if (v44)
    {
      uint64_t v45 = v44;
      v46 = MFLogGeneral();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        uint64_t v47 = [v14 messageID];
        uint64_t v48 = [a3 partNumber];
        *(_DWORD *)buf = 138543618;
        uint64_t v53 = v47;
        __int16 v54 = 2114;
        uint64_t v55 = v48;
        _os_log_impl(&dword_1CFCFE000, v46, OS_LOG_TYPE_INFO, "#CacheLoads extracted part data from full body data via download %{public}@:%{public}@", buf, 0x16u);
      }
      id v28 = a6;
      uint64_t v29 = v45;
      goto LABEL_23;
    }
  }
  return v17;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "mimeBody"), "message");
  if (![v9 isLibraryMessage]) {
    return 0;
  }
  uint64_t v10 = objc_msgSend(-[MFLibraryStore library](self, "library"), "dataConsumerForMessage:part:incomplete:", v9, objc_msgSend(a4, "partNumber"), !v5);
  [v10 appendData:a3];
  [v10 done];
  return (id)[v10 data];
}

- (id)_copyDataFromMimePart:(id)a3 threshold:(unsigned int)a4 downloadIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = v8;
  if (a4 != -1)
  {
    [v8 addObject:a3];
    if (![v9 count]) {
      goto LABEL_36;
    }
    while (1)
    {
      uint64_t v10 = (void *)[v9 objectAtIndex:0];
      uint64_t v11 = [v10 firstChildPart];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        do
        {
          [v9 addObject:v12];
          uint64_t v12 = (void *)[v12 nextSiblingPart];
        }
        while (v12);
      }
      else if ([v10 isAttachment])
      {
        [v10 range];
        BOOL v14 = v13 >= a4;
        goto LABEL_10;
      }
      BOOL v14 = 0;
LABEL_10:
      [v9 removeObjectAtIndex:0];
      if (![v9 count] || v14)
      {
        if (!v14) {
          goto LABEL_36;
        }
        break;
      }
    }
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  id v16 = objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message");
  [v9 removeAllObjects];
  [v9 addObject:a3];
  if (!Mutable) {
    goto LABEL_36;
  }
  if (![v9 count])
  {
LABEL_34:
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    uint64_t v29 = objc_alloc_init(MFMessageWriter);
    [(MFMessageWriter *)v29 appendDataForMimePart:a3 toData:v28 withPartData:Mutable];

    goto LABEL_37;
  }
  while (1)
  {
    uint64_t v17 = (void *)[v9 objectAtIndex:0];
    uint64_t v18 = [v17 firstChildPart];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      do
      {
        [v9 addObject:v19];
        uint64_t v19 = (void *)[v19 nextSiblingPart];
      }
      while (v19);
      if (objc_msgSend((id)objc_msgSend(v17, "type"), "isEqualToString:", @"multipart")) {
        goto LABEL_33;
      }
    }
    else if ([v17 isAttachment])
    {
      [v17 range];
      if (v20 >= a4) {
        goto LABEL_33;
      }
    }
    [v17 range];
    uint64_t v22 = v21
        ? objc_msgSend(v17, "decodedDataForData:", objc_msgSend(v16, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v17, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v5, 0)): objc_msgSend(MEMORY[0x1E4F1C9B8], "data");
    uint64_t v23 = (void *)v22;
    uint64_t v24 = (void *)[v17 firstChildPart];
    if (v24)
    {
      long long v25 = v24;
      if (![v24 firstChildPart])
      {
        if ([v25 isAttachment])
        {
          if ([v23 length])
          {
            [v25 range];
            if (v26 >= a4)
            {
              id v27 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"X-Apple-Content-Length: %lu\n", v26), "dataUsingEncoding:", 1), "mutableCopy");
              [v27 appendData:v23];
              uint64_t v23 = v27;
            }
          }
        }
      }
    }
    if (!v23) {
      break;
    }
    CFDictionarySetValue(Mutable, v17, v23);
LABEL_33:
    [v9 removeObjectAtIndex:0];
    if (![v9 count]) {
      goto LABEL_34;
    }
  }

  [v9 removeObjectAtIndex:0];
LABEL_36:
  id v28 = 0;
LABEL_37:

  return v28;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 usePartDatas:(BOOL)a7 didDownload:(BOOL *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  if (a4)
  {
    BOOL v14 = a4;
    *a4 = 0;
  }
  else
  {
    BOOL v14 = (id *)&v25;
  }
  long long v15 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:0];
  if (!v15 || v15[*MEMORY[0x1E4F735D8]] || !a5 && v15[*MEMORY[0x1E4F735D0]]) {
    goto LABEL_35;
  }
  id v16 = *(id *)&v15[*MEMORY[0x1E4F735C8]];
  if (a5) {
    *a5 = v15[*MEMORY[0x1E4F735D0]] ^ 1;
  }
  uint64_t v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = a3;
    _os_log_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_INFO, "#CacheLoads returning cached full body data for %@", buf, 0xCu);
  }
  if (!v16)
  {
LABEL_35:
    if ([a3 isLibraryMessage]
      && (id v18 = [(MFMessageLibrary *)self->_library fullBodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:v14]) != 0)
    {
      id v16 = v18;
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v18 partial:1 incomplete:0];
      [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:v19];
    }
    else if (v9 {
           && (!v10
    }
             ? (uint64_t v20 = [a3 messageBodyIfAvailableUpdatingFlags:0])
             : (uint64_t v20 = [a3 messageBodyUpdatingFlags:0]),
               (uint64_t v21 = (void *)v20) != 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (id v22 = -[MFLibraryStore _copyDataFromMimePart:threshold:downloadIfNecessary:](self, "_copyDataFromMimePart:threshold:downloadIfNecessary:", [v21 topLevelPart], 0xFFFFFFFFLL, v10)) != 0))
    {
      id v16 = v22;
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v22 partial:0 incomplete:0];
      [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:v23];

      if (a8) {
        *a8 = 1;
      }
    }
    else if (v10)
    {
      id v16 = [(MFLibraryStore *)self _fetchFullBodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:v14 downloadIfNecessary:1 didDownload:a8];
    }
    else
    {
      id v16 = 0;
    }
  }
  if (*v14) {
    -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
  }
  if (a5) {
    *a5 = v16 != 0;
  }
  return v16;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  return [(MFLibraryStore *)self fullBodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:a4 isComplete:a5 downloadIfNecessary:a6 usePartDatas:1 didDownload:a7];
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:0];
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v12 = v11;
  unint64_t v13 = (int *)MEMORY[0x1E4F735D0];
  if (!a4)
  {
    if (v11[*MEMORY[0x1E4F735D0]]) {
      goto LABEL_11;
    }
  }
  id v14 = *(id *)&v11[*MEMORY[0x1E4F735C8]];
  if (a4) {
    *a4 = v12[*v13] ^ 1;
  }
  if (a5) {
    *a5 = v12[*MEMORY[0x1E4F735D8]];
  }
  long long v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = a3;
    _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_INFO, "#CacheLoads returning cached body data for %@", buf, 0xCu);
  }
  if (!v14)
  {
LABEL_11:
    uint64_t v25 = 0;
    id v14 = [(MFMessageLibrary *)self->_library bodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:&v25 isComplete:a4];
    if (!v14)
    {
LABEL_17:
      if (v25) {
        -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
      }
      if (!v14)
      {
        uint64_t v25 = 0;
        BOOL v24 = 0;
        uint64_t v20 = MFLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = a3;
          _os_log_impl(&dword_1CFCFE000, v20, OS_LOG_TYPE_INFO, "#CacheLoads fetching body data from network for %@", buf, 0xCu);
        }
        id v14 = [(MFLibraryStore *)self _fetchBodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:&v25 downloadIfNecessary:v6 partial:&v24];
        if (v14)
        {
          if (a4) {
            *a4 = 1;
          }
          if (a5) {
            *a5 = v24;
          }
          id v21 = objc_alloc(MEMORY[0x1E4F734F8]);
          id v22 = (void *)[v21 initWithData:v14 partial:v24 incomplete:0];
          uint64_t v23 = [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:v22];
          if (v23) {
            id v14 = *(id *)&v23[*MEMORY[0x1E4F735C8]];
          }

          if (v25) {
            -[MFLibraryStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", a3);
          }
        }
      }
      return v14;
    }
    if (a4)
    {
      BOOL v16 = !*a4;
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v16 = 0;
      if (!a5)
      {
LABEL_15:
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F734F8]) initWithData:v14 partial:1 incomplete:v16];
        [(MFLibraryStore *)self _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:v17];

        id v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = a3;
          _os_log_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_INFO, "#CacheLoads returning body data from Library for %@", buf, 0xCu);
        }
        goto LABEL_17;
      }
    }
    *a5 = 1;
    goto LABEL_15;
  }
  return v14;
}

- (void)deleteBodyDataForMessage:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    library = self->_library;
    [(MFMessageLibrary *)library deleteDataForMessage:a3];
  }
}

- (unint64_t)indexOfMessage:(id)a3
{
  return [a3 libraryID];
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
  double Current = CFAbsoluteTimeGetCurrent();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        unint64_t v13 = (void *)[v12 account];
        uint64_t v14 = [v12 mailbox];
        if (v4)
        {
          uint64_t v15 = v14;
          uint64_t v16 = [v13 path];
          if (v15 != [v13 mailboxUidOfType:3 createIfNeeded:0])
          {
            if (![v6 objectForKey:v16]) {
              objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), v16);
            }
            objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v16), "addObject:", v12);
          }
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v9);
  }
  uint64_t v17 = [v6 count];
  uint64_t v18 = MEMORY[0x1E4F1CC38];
  unint64_t v19 = 0x1E4F1C000uLL;
  if (v17)
  {
    v59 = @"MessageIsRead";
    uint64_t v60 = MEMORY[0x1E4F1CC38];
    uint64_t v20 = self;
    -[MFLibraryStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1], a3);
    id v21 = (void *)[v6 keyEnumerator];
    uint64_t v22 = [v21 nextObject];
    uint64_t v23 = (void *)v41;
    if (v22)
    {
      uint64_t v24 = v22;
      do
      {
        uint64_t v25 = +[MailAccount accountWithPath:v24];
        uint64_t v26 = [(MailAccount *)v25 storeForMailboxUid:[(MailAccount *)v25 mailboxUidOfType:3 createIfNeeded:1]];
        if (v26)
        {
          id v27 = (void *)v26;
          uint64_t v28 = [v6 objectForKey:v24];
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend(v27, "mf_lock");
          [v27 appendMessages:v28 unsuccessfulOnes:v29];
          objc_msgSend(v27, "mf_unlock");

          uint64_t v23 = (void *)v41;
        }
        uint64_t v24 = [v21 nextObject];
      }
      while (v24);
    }
    if ([v23 count])
    {
      id v30 = (id)[MEMORY[0x1E4F1CA48] array];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v31 = [a3 countByEnumeratingWithState:&v42 objects:v58 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v43 != v33) {
              objc_enumerationMutation(a3);
            }
            uint64_t v35 = *(void *)(*((void *)&v42 + 1) + 8 * j);
            if ([v23 indexOfObject:v35] == 0x7FFFFFFFFFFFFFFFLL) {
              [v30 addObject:v35];
            }
          }
          uint64_t v32 = [a3 countByEnumeratingWithState:&v42 objects:v58 count:16];
        }
        while (v32);
      }
      uint64_t v20 = self;
      [(MFMailMessageStore *)self setFlag:@"MessageIsDeleted" state:0 forMessages:v23];
      unint64_t v19 = 0x1E4F1C000;
    }
    else
    {
      id v30 = a3;
      unint64_t v19 = 0x1E4F1C000uLL;
    }
  }
  else
  {
    id v30 = a3;
    uint64_t v20 = self;
  }
  v56[0] = @"MessageIsRead";
  v56[1] = @"MessageIsDeleted";
  v57[0] = v18;
  v57[1] = v18;
  -[MFLibraryStore setFlagsFromDictionary:forMessages:](v20, "setFlagsFromDictionary:forMessages:", [*(id *)(v19 + 2536) dictionaryWithObjects:v57 forKeys:v56 count:2], v30);
  double v36 = CFAbsoluteTimeGetCurrent();
  uint64_t v37 = MFLogGeneral();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = [v30 count];
    unint64_t v39 = [v30 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v51 = v38;
    __int16 v52 = 2048;
    double v53 = v36 - Current;
    __int16 v54 = 2048;
    double v55 = (v36 - Current) / (double)v39;
    _os_log_debug_impl(&dword_1CFCFE000, v37, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Deleting %lu messages took %4.5f seconds (%4.5f s/msg)", buf, 0x20u);
  }
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid", *(void *)&a3, a4), "URLString");
  double Current = CFAbsoluteTimeGetCurrent();
  id v8 = [(MFMessageLibrary *)self->_library messagesForMailbox:v6 olderThanNumberOfDays:v4];
  uint64_t v9 = [v8 count];
  if (v9) {
    [(MFMessageLibrary *)self->_library compactMessages:v8];
  }
  uint64_t v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2048;
    double v16 = CFAbsoluteTimeGetCurrent() - Current;
    _os_log_debug_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_DEBUG, "[LogMessageDeletionTimes] Searching for and deleting %lu messages in %@ took: %fs", (uint8_t *)&v11, 0x20u);
  }
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  return [(MFMessageLibrary *)self->_library setFlagsFromDictionary:a3 forMessages:a4];
}

- (void)setFlagsForAllMessagesFromDictionary:(id)a3
{
  library = self->_library;
  id v5 = [(MFLibraryStore *)self URLString];
  [(MFMessageLibrary *)library setFlagsFromDictionary:a3 forMessagesInMailboxURLString:v5];
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
}

- (BOOL)allowsAppend
{
  return [(MFLibraryStore *)self URLString] != 0;
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7
{
  if ([(MFLibraryStore *)self allowsAppend])
  {
    LOWORD(v16) = 1;
    id v13 = -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self->_library, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, [(MFMailMessageStore *)self mailboxUid], 1, 0, 0, 0, 0, a7, v16, 0);
    uint64_t v14 = [v13 count];
    if (v14)
    {
      objc_msgSend(a5, "addObjectsFromArray:", objc_msgSend(v13, "arrayByApplyingSelector:", sel_messageID));
      [a6 addObjectsFromArray:v13];
      [(MFMailMessageStore *)self updateMessages:v13 updateNumberOfAttachments:0];
    }
    if (v14 == [a3 count]) {
      return 1;
    }
  }
  [a4 addObjectsFromArray:a3];
  return 0;
}

- (BOOL)canCompact
{
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryStore;
  BOOL v3 = [(MFMailMessageStore *)&v5 canCompact];
  if (v3) {
    LOBYTE(v3) = [(MFMailMessageStore *)self isOpened];
  }
  return v3;
}

- (void)doCompact
{
  if ([(MFLibraryStore *)self canCompact])
  {
    id v3 = [(MFLibraryStore *)self URLString];
    if (v3)
    {
      if (self->super._deletedMessageCount)
      {
        id v4 = v3;
        library = self->_library;
        [(MFMessageLibrary *)library compactMailbox:v4];
      }
    }
  }
}

- (void)compactMessages:(id)a3
{
  if ([a3 count])
  {
    library = self->_library;
    [(MFMessageLibrary *)library compactMessages:a3];
  }
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  return [(MFMessageLibrary *)self->_library dataPathForMessage:a3 part:a4];
}

- (id)criterion
{
  id v2 = [(MFMailMessageStore *)self mailboxUid];
  return (id)[v2 criterion];
}

- (id)URLString
{
  id v2 = [(MFMailMessageStore *)self mailboxUid];
  return (id)[v2 URLString];
}

+ (BOOL)createEmptyStoreForPath:(id)a3
{
  int v4 = [a3 hasPrefix:@"/"];
  if (v4)
  {
    objc_super v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v4) = objc_msgSend(v5, "mf_makeCompletePath:mode:", a3, 448);
  }
  return v4;
}

+ (BOOL)storeAtPathIsWritable:(id)a3
{
  int v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return objc_msgSend(v4, "mf_canWriteToDirectoryAtPath:", a3);
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  id v2 = [(MFMailMessageStore *)self mailboxUid];
  return [v2 serverUnreadOnlyOnServerCount];
}

- (unint64_t)unreadCount
{
  id v2 = [(MFMailMessageStore *)self mailboxUid];
  return [v2 unreadCount];
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  id v4 = [(MFMailMessageStore *)self mailboxUid];
  return [v4 unreadCountMatchingCriterion:a3];
}

- (id)newObjectCache
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F73510]) initWithCapacity:32];
  uint64_t v3 = objc_opt_class();
  [v2 setKeyGenerator:&__block_literal_global_73];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MFLibraryStore_newObjectCache__block_invoke_2;
  v5[3] = &unk_1E68666B0;
  v5[4] = v3;
  [v2 setComparator:v5];
  return v2;
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return a3 | (4 * [a2 libraryID]);
}

uint64_t __32__MFLibraryStore_newObjectCache__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (int)*MEMORY[0x1E4F735D0];
  int v6 = *(unsigned __int8 *)(a2 + v5);
  if (!*(unsigned char *)(a2 + v5) || *(unsigned char *)(a3 + v5))
  {
    uint64_t v7 = (int)*MEMORY[0x1E4F735D8];
    if (!*(unsigned char *)(a2 + v7) || *(unsigned char *)(a3 + v7))
    {
      int v8 = *(unsigned __int8 *)(a3 + v5);
      if (v6) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      if (!v9) {
        return 1;
      }
      return !*(unsigned char *)(a2 + v7) && *(unsigned char *)(a3 + v7) != 0;
    }
  }
  return -1;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  return a4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  if ([a3 isLibraryMessage])
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return [(MFLibraryStore *)&v8 _cachedHeadersForMessage:a3 valueIfNotPresent:a4];
  }
  return a4;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  if ([a3 isLibraryMessage])
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return [(MFLibraryStore *)&v8 _cachedHeaderDataForMessage:a3 valueIfNotPresent:a4];
  }
  return a4;
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  if ([a3 isLibraryMessage])
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryStore;
    return [(MFLibraryStore *)&v8 _cachedBodyDataContainerForMessage:a3 valueIfNotPresent:a4];
  }
  return a4;
}

- (void)purgeMessages:(id)a3
{
}

- (void)purgeMessagesBeyondLimit:(unint64_t)a3 keepingMessage:(id)a4
{
  unsigned int v7 = -[MFMessageLibrary nonDeletedCountForMailbox:](self->_library, "nonDeletedCountForMailbox:", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString"));
  if (v7 > a3)
  {
    if (a4) {
      uint64_t v8 = 144;
    }
    else {
      uint64_t v8 = 128;
    }
    id v9 = -[MFLibraryStore copyOfMessagesInRange:options:](self, "copyOfMessagesInRange:options:", a3, v7 - a3, v8);
    if (a4)
    {
      id v12 = v9;
      uint64_t v10 = [v9 indexOfObject:a4];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = v12;
      }
      else
      {
        id v11 = (id)objc_msgSend(v12, "subarrayWithRange:", v10 + 1, objc_msgSend(v12, "count") - (v10 + 1));

        id v9 = v11;
      }
    }
    id v13 = v9;
    if ([v9 count]) {
      [(MFLibraryStore *)self purgeMessages:v13];
    }
  }
}

- (BOOL)hasMessageForAccount:(id)a3
{
  unsigned int v5 = -[MFMessageLibrary nonDeletedCountForMailbox:](self->_library, "nonDeletedCountForMailbox:", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString"));
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFLibraryStore;
    LOBYTE(v5) = [(MFMailMessageStore *)&v7 hasMessageForAccount:a3];
  }
  return v5;
}

- (void)_queueMessagesAdded:(id)a3
{
  id v4 = 0;
  objc_msgSend((id)-[MFLibraryStore pep_getInvocation:](self, "pep_getInvocation:", &v4), "handleMessagesAdded:earliestReceivedDate:", a3, self->_earliestReceivedDate);
  [v4 retainArguments];
  [(MFLibraryStore *)self _addInvocationToQueue:v4];
}

- (void)_queueMessageFlagsChanged:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessageFlagsChanged_, self, a3);
  [(MFLibraryStore *)self _addInvocationToQueue:v4];
}

- (void)_queueMessagesWillBeCompacted:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessagesWillBeCompacted_, self, a3);
  [(MFLibraryStore *)self _addInvocationToQueue:v4];
}

- (void)_queueMessagesWereCompacted:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", sel_handleMessagesCompacted_, self, a3);
  [(MFLibraryStore *)self _addInvocationToQueue:v4];
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFLibraryStore;
  return -[MFLibraryStore hasCompleteDataForMimePart:](&v6, sel_hasCompleteDataForMimePart_)
      || [(MFMessageLibrary *)self->_library hasCompleteDataForMimePart:a3];
}

- (NSDate)earliestReceivedDate
{
  return self->_earliestReceivedDate;
}

- (void)setEarliestReceivedDate:(id)a3
{
}

@end