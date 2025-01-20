@interface MFMailMessageStore
+ (BOOL)createEmptyStoreForPath:(id)a3;
+ (BOOL)createEmptyStoreIfNeededForPath:(id)a3;
+ (BOOL)storeAtPathIsWritable:(id)a3;
+ (Class)classForMimePart;
+ (Class)headersClass;
+ (id)copyMessages:(id)a3 toMailbox:(id)a4 markAsRead:(BOOL)a5 deleteOriginals:(BOOL)a6 isDeletion:(BOOL)a7;
- (BOOL)_shouldChangeComponentMessageFlags;
- (BOOL)_updateFlagForMessage:(id)a3 key:(id)a4 value:(BOOL)a5;
- (BOOL)allowsAppend;
- (BOOL)canCompact;
- (BOOL)canFetchMessageIDs;
- (BOOL)canFetchSearchResults;
- (BOOL)hasCachedDataForMimePart:(id)a3;
- (BOOL)hasMessageForAccount:(id)a3;
- (BOOL)hasMoreFetchableMessages;
- (BOOL)isDrafts;
- (BOOL)isOpened;
- (BOOL)isReadOnly;
- (BOOL)setPreferredEncoding:(unsigned int)a3 forMessage:(id)a4;
- (BOOL)shouldArchive;
- (BOOL)shouldDeleteInPlace;
- (BOOL)shouldDownloadBodyDataForMessage:(id)a3;
- (BOOL)shouldGrowFetchWindow;
- (BOOL)shouldSetSummaryForMessage:(id)a3;
- (BOOL)supportsArchiving;
- (MFMailMessageStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4;
- (id)_defaultRouterDestination;
- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5;
- (id)account;
- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesMatchingText:(id)a3;
- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)copyOfAllMessages;
- (id)copyOfMessagesInRange:(_NSRange)a3;
- (id)description;
- (id)displayName;
- (id)finishRoutingMessages:(id)a3 routed:(id)a4;
- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)lastViewedMessageDate;
- (id)lastViewedMessageWithOptions:(unsigned int)a3;
- (id)loadMeetingDataForMessage:(id)a3;
- (id)loadMeetingExternalIDForMessage:(id)a3;
- (id)loadMeetingMetadataForMessage:(id)a3;
- (id)mailboxUid;
- (id)messageForMessageID:(id)a3 options:(unsigned int)a4;
- (id)messageForRemoteID:(id)a3;
- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4;
- (id)messageIdRollCall:(id)a3;
- (id)mutableCopyOfAllMessages;
- (id)remoteIDsFromUniqueRemoteIDs:(id)a3;
- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4;
- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4;
- (id)status;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (id)storePathRelativeToAccount;
- (id)storeSearchResultMatchingCriterion:(id)a3 limit:(unsigned int)a4 offset:(id)a5 error:(id *)a6;
- (id)storeSearchResultMatchingSearchText:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 error:(id *)a7;
- (id)uniqueRemoteIDsForMessages:(id)a3;
- (int)archiveDestination;
- (int64_t)fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4;
- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchMessagesWithRemoteIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchMobileSynchronously:(unint64_t)a3;
- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5;
- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4;
- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5;
- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6;
- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7;
- (unint64_t)fetchWindow;
- (unint64_t)fetchWindowCap;
- (unint64_t)growFetchWindow;
- (unint64_t)indexOfMessage:(id)a3;
- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4;
- (unint64_t)serverMessageCount;
- (unint64_t)serverNonDeletedCount;
- (unint64_t)serverUnreadCount;
- (unint64_t)serverUnreadOnlyOnServerCount;
- (unint64_t)totalCount;
- (unint64_t)unreadCount;
- (unint64_t)unreadCountMatchingCriterion:(id)a3;
- (void)_flushAllMessageData;
- (void)_rebuildTableOfContentsSynchronously;
- (void)_setFlagsForMessages:(id)a3;
- (void)allMessageFlagsDidChange:(id)a3;
- (void)cancelOpen;
- (void)dealloc;
- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4;
- (void)deletedCount:(unint64_t *)a3 andSize:(unint64_t *)a4;
- (void)didOpen;
- (void)messageFlagsDidChange:(id)a3 flags:(id)a4;
- (void)messagesWereAdded:(id)a3;
- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4;
- (void)messagesWereCompacted:(id)a3;
- (void)messagesWillBeCompacted:(id)a3;
- (void)openAsynchronously;
- (void)openSynchronously;
- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5;
- (void)setFlagForAllMessages:(id)a3 state:(BOOL)a4;
- (void)setFlagsForAllMessagesFromDictionary:(id)a3;
- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6;
- (void)structureDidChange;
- (void)undeleteMessages:(id)a3;
- (void)updateMessages:(id)a3 updateNumberOfAttachments:(BOOL)a4;
- (void)writeUpdatedMessageDataToDisk;
@end

@implementation MFMailMessageStore

+ (BOOL)createEmptyStoreIfNeededForPath:(id)a3
{
  char v6 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v6)) {
    return v6 != 0;
  }
  else {
    return [a1 createEmptyStoreForPath:a3];
  }
}

+ (BOOL)createEmptyStoreForPath:(id)a3
{
}

+ (BOOL)storeAtPathIsWritable:(id)a3
{
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (MFMailMessageStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageStore;
  char v6 = [(MFMailMessageStore *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [a3 fullPath];
    v8 = (void *)[a3 account];
    if ([(id)objc_opt_class() createEmptyStoreIfNeededForPath:v7])
    {
      if (a4) {
        int v9 = 1;
      }
      else {
        int v9 = [(id)objc_opt_class() storeAtPathIsWritable:v7] ^ 1;
      }
      v6->_flags = ($835FD4CD3CFECF79DE90309A635A882F)(*(_DWORD *)&v6->_flags & 0xFFFFFFFE | v9);
      v6->_account = (MailAccount *)v8;
      v6->_mailboxUid = (MFMailboxUid *)a3;
      *(_DWORD *)&v6->_flags |= 0x100u;
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:100];
      *(Class *)((char *)&v6->super.super.isa + (int)*MEMORY[0x1E4F73618]) = (Class)v10;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3 = self->_openMonitor;
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStore;
  [(MFMailMessageStore *)&v4 dealloc];
}

- (void)openAsynchronously
{
  _MFLockGlobalLock();
  if ((self->_state | 4) == 4)
  {
    self->_state = 1;
    if (!openAsynchronously__openMailboxesQueue)
    {
      openAsynchronously__openMailboxesQueue = objc_alloc_init(MFInvocationQueue);
      [(id)openAsynchronously__openMailboxesQueue setMaxThreadCount:3];
    }
    _MFUnlockGlobalLock();
    v3 = +[MFMonitoredInvocation invocationWithSelector:sel_openSynchronously target:self taskName:0 priority:10 canBeCancelled:1];
    [(id)openAsynchronously__openMailboxesQueue addInvocation:v3];
    [(MFMailMessageStore *)self mf_lock];

    self->_openMonitor = [(MFMonitoredInvocation *)v3 monitor];
    [(MFMailMessageStore *)self mf_unlock];
  }
  else
  {
    _MFUnlockGlobalLock();
  }
}

- (void)openSynchronously
{
}

- (void)didOpen
{
  [(MFMailMessageStore *)self mf_lock];

  self->_openMonitor = 0;
  [(MFMailMessageStore *)self mf_unlock];
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MailMessageStoreDidOpen" object:self userInfo:0];
}

- (void)cancelOpen
{
  [(MFMailMessageStore *)self mf_lock];
  [(MFActivityMonitor *)self->_openMonitor cancel];
  [(MFMailMessageStore *)self mf_unlock];
}

- (void)writeUpdatedMessageDataToDisk
{
}

- (id)account
{
  return self->_account;
}

- (id)mailboxUid
{
  return self->_mailboxUid;
}

- (BOOL)isOpened
{
  return self->_state == 3;
}

- (id)storePathRelativeToAccount
{
  return [(MFMailboxUid *)self->_mailboxUid accountRelativePath];
}

- (id)displayName
{
  id v3 = [(MFMailMessageStore *)self account];
  objc_super v4 = (void *)[v3 displayName];
  id v5 = [(MFMailboxUid *)self->_mailboxUid accountRelativePath];
  if ((v4 && ![v4 isEqualToString:&stru_1F265CF90]
     || (objc_super v4 = (void *)[v3 hostname]) != 0)
    && ([v4 isEqualToString:&stru_1F265CF90] & 1) == 0)
  {
    return (id)[NSString stringWithFormat:MFLookupLocalizedString(@"MAILBOX_DISPLAY_FORMAT", @"%@ --- %@", 0), v5, v4];
  }
  else
  {
    return v5;
  }
}

- (BOOL)isReadOnly
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p (uid=%@)>", objc_opt_class(), self, self->_mailboxUid];
}

- (BOOL)isDrafts
{
  return [(MFMailboxUid *)self->_mailboxUid type] == 5;
}

- (void)messageFlagsDidChange:(id)a3 flags:(id)a4
{
  if (a3) {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"messages", a4, @"flags", 0);
  }
  else {
    uint64_t v5 = 0;
  }
  char v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MailMessageStoreMessageFlagsChanged" object:self userInfo:v5];
}

- (void)allMessageFlagsDidChange:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"flags";
  v6[0] = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MailMessageStoreMessageFlagsChanged", self, v4);
}

- (void)structureDidChange
{
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MailMessageStoreStructureChanged" object:self];
}

- (void)messagesWereAdded:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(MFMailMessageStore *)self messagesWereAdded:a3 earliestReceivedDate:v5];
}

- (void)messagesWereCompacted:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    char v6 = @"messages";
    v7[0] = a3;
    objc_msgSend(v5, "postNotificationName:object:userInfo:", @"MailMessageStoreMessagesRemoved", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  }
}

- (void)messagesWillBeCompacted:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    char v6 = @"messages";
    v7[0] = a3;
    objc_msgSend(v5, "postNotificationName:object:userInfo:", @"MailMessageStoreMessagesWillBeCompacted", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  }
}

- (void)deletedCount:(unint64_t *)a3 andSize:(unint64_t *)a4
{
  *a3 = self->_deletedMessageCount;
  *a4 = self->_deletedMessagesSize;
}

- (unint64_t)totalCount
{
  return 0;
}

- (unint64_t)nonDeletedCountIncludingServerSearch:(BOOL)a3 andThreadSearch:(BOOL)a4
{
  return [(MFMailMessageStore *)self totalCount] - self->_deletedMessageCount;
}

- (unint64_t)serverMessageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  return 0;
}

- (unint64_t)serverUnreadCount
{
  unint64_t v3 = [(MFMailMessageStore *)self serverUnreadOnlyOnServerCount];
  return [(MFMailMessageStore *)self unreadCount] + v3;
}

- (unint64_t)serverNonDeletedCount
{
  unint64_t v3 = [(MFMailMessageStore *)self serverUnreadOnlyOnServerCount];
  return [(MFMailMessageStore *)self nonDeletedCountIncludingServerSearch:0 andThreadSearch:0]+ v3;
}

- (BOOL)hasMoreFetchableMessages
{
  unint64_t v3 = [(MFMailMessageStore *)self serverMessageCount];
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 > [(MFMailMessageStore *)self allNonDeletedCountIncludingServerSearch:0 andThreadSearch:0];
}

- (BOOL)shouldGrowFetchWindow
{
  BOOL v3 = [(MFMailMessageStore *)self hasMoreFetchableMessages];
  if (v3)
  {
    unint64_t v4 = [(MFMailMessageStore *)self serverMessageCount];
    LOBYTE(v3) = v4 > [(MFMailMessageStore *)self fetchWindow];
  }
  return v3;
}

- (unint64_t)growFetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)fetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)fetchWindowCap
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)unreadCount
{
  return self->_unreadMessageCount;
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  return 0;
}

- (BOOL)hasMessageForAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(MFMailMessageStore *)self account] == a3) {
    return 1;
  }
  id v5 = [(MFMailMessageStore *)self copyOfAllMessagesWithOptions:128];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (+[MailAccount accountThatMessageIsFrom:*(void *)(*((void *)&v12 + 1) + 8 * i)] == a3)
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)indexOfMessage:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)copyOfAllMessages
{
  return 0;
}

- (id)copyOfMessagesInRange:(_NSRange)a3
{
  return 0;
}

- (id)mutableCopyOfAllMessages
{
  return 0;
}

- (id)copyMessagesMatchingText:(id)a3
{
  return [(MFMailMessageStore *)self copyMessagesMatchingText:a3 options:0];
}

- (id)copyMessagesMatchingText:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (BOOL)canFetchSearchResults
{
  return 0;
}

- (int64_t)fetchMessagesMatchingCriterion:(id)a3 limit:(unsigned int)a4
{
  return -1;
}

- (id)storeSearchResultMatchingCriterion:(id)a3 limit:(unsigned int)a4 offset:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  return 0;
}

- (id)storeSearchResultMatchingSearchText:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 error:(id *)a7
{
  if (a4) {
    return [(MFMailMessageStore *)self storeSearchResultMatchingCriterion:a4 limit:*(void *)&a5 offset:a6 error:a7];
  }
  else {
    return 0;
  }
}

- (id)remoteIDsFromUniqueRemoteIDs:(id)a3
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

- (int64_t)fetchMessagesWithRemoteIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  return -1;
}

- (id)_defaultRouterDestination
{
  return self->_mailboxUid;
}

- (id)finishRoutingMessages:(id)a3 routed:(id)a4
{
  uint64_t v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7 - 1;
    do
    {
      if ((objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v8), "messageFlags") & 2) != 0) {
        [v6 removeObjectAtIndex:v8];
      }
      --v8;
    }
    while (v8 != -1);
  }
  if ([v6 count])
  {
    id v9 = [(MFMailMessageStore *)self _defaultRouterDestination];
    if (v9)
    {
      BOOL v10 = v9;
      if ((objc_msgSend(v9, "isEqual:", -[MFMailMessageStore mailboxUid](self, "mailboxUid")) & 1) == 0)
      {
        v11 = objc_msgSend((id)objc_msgSend(v10, "account"), "storeForMailboxUid:", v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v11)
        {
          [v11 appendMessages:v6 unsuccessfulOnes:v12];
          uint64_t v13 = [v6 count];
          if (a4) {
            id v14 = (id)[a4 mutableCopy];
          }
          else {
            id v14 = (id)[MEMORY[0x1E4F1CA48] array];
          }
          a4 = v14;
          if (v13)
          {
            uint64_t v15 = v13 - 1;
            do
            {
              uint64_t v16 = [v6 objectAtIndex:v15];
              if ([v12 indexOfObjectIdenticalTo:v16] == 0x7FFFFFFFFFFFFFFFLL) {
                [a4 addObject:v16];
              }
              --v15;
            }
            while (v15 != -1);
          }
          [(MFMailMessageStore *)self deleteMessages:v6 moveToTrash:0];
        }
      }
    }
  }

  return a4;
}

- (BOOL)canCompact
{
  return (*(_DWORD *)&self->_flags & 1) == 0 && self->_deletedMessageCount && (*(_DWORD *)&self->_flags & 8) == 0;
}

- (void)deleteMessages:(id)a3 moveToTrash:(BOOL)a4
{
  BOOL v4 = a4;
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  v25[0] = @"MessageIsDeleted";
  v25[1] = @"MessageIsRead";
  v26[0] = MEMORY[0x1E4F1CC38];
  v26[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  if (v4)
  {
    id v9 = [(MailAccount *)self->_account storeForMailboxUid:[(MailAccount *)self->_account mailboxUidOfType:3 createIfNeeded:1]];
    if (v9)
    {
      BOOL v10 = v9;
      v23 = @"MessageIsRead";
      uint64_t v24 = v7;
      -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1], a3);
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v10, "mf_lock");
      [v10 appendMessages:a3 unsuccessfulOnes:v11];
      objc_msgSend(v10, "mf_unlock");
      if ([v11 count])
      {
        id v12 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v13 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(a3);
              }
              uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              if ([v11 indexOfObjectIdenticalTo:v17] == 0x7FFFFFFFFFFFFFFFLL) {
                [v12 addObject:v17];
              }
            }
            uint64_t v14 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v14);
        }
        [(MFMailMessageStore *)self setFlag:@"MessageIsDeleted" state:0 forMessages:v11];
        a3 = v12;
      }
    }
  }
  [(MFMailMessageStore *)self setFlagsFromDictionary:v8 forMessages:a3];
}

- (void)undeleteMessages:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    BOOL v3 = @"MessageIsDeleted";
    v4[0] = MEMORY[0x1E4F1CC28];
    -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1], a3);
  }
}

- (BOOL)allowsAppend
{
  return 0;
}

+ (id)copyMessages:(id)a3 toMailbox:(id)a4 markAsRead:(BOOL)a5 deleteOriginals:(BOOL)a6 isDeletion:(BOOL)a7
{
  v38[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MailMessageStore.m", 705, @"Invalid parameter not satisfying: %@", @"messages");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MailMessageStore.m", 706, @"Invalid parameter not satisfying: %@", @"destinationMailbox");
LABEL_3:
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double Current = CFAbsoluteTimeGetCurrent();
  v37[0] = @"MessageIsDeleted";
  v37[1] = @"MessageIsRead";
  v38[0] = MEMORY[0x1E4F1CC38];
  v38[1] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  uint64_t v18 = [a4 store];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = v19;
  if (v18)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83__MFMailMessageStore_copyMessages_toMailbox_markAsRead_deleteOriginals_isDeletion___block_invoke;
    v27[3] = &unk_1E68669E0;
    BOOL v28 = a6;
    BOOL v29 = a5;
    v27[4] = a4;
    v27[5] = v15;
    v27[6] = v18;
    v27[7] = v17;
    BOOL v30 = a7;
    v27[8] = v19;
    objc_msgSend(a3, "mf_enumerateByStoreUsingBlock:", v27);
  }
  else
  {
    [v19 addObjectsFromArray:a3];
  }
  uint64_t v21 = [v20 count];
  [v14 addObjectsFromArray:v20];

  double v22 = CFAbsoluteTimeGetCurrent();
  unint64_t v23 = [a3 count];
  uint64_t v24 = MFLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v32 = v23;
    __int16 v33 = 2048;
    double v34 = v22 - Current;
    __int16 v35 = 2048;
    double v36 = (v22 - Current) / (double)v23;
    _os_log_debug_impl(&dword_1CFCFE000, v24, OS_LOG_TYPE_DEBUG, "[LogMessageTransferTimes] Transferring %lu messages took %4.5f seconds (%4.5f s/msg).", buf, 0x20u);
  }
  v25 = [[MFMessageTransferResult alloc] initWithResultCode:v21 == 0 failedMessages:v14 transferedMessage:v15];

  return v25;
}

void __83__MFMailMessageStore_copyMessages_toMailbox_markAsRead_deleteOriginals_isDeletion___block_invoke(uint64_t a1, void *a2, id a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "mailboxUid"), "representedAccount");
  if (!v7) {
    uint64_t v7 = (void *)[a2 account];
  }
  if (+[MailAccount canMoveMessagesFromAccount:toAccount:](MailAccount, "canMoveMessagesFromAccount:toAccount:", v7, [*(id *)(a1 + 32) representedAccount]))
  {
    if (!*(unsigned char *)(a1 + 72)
      || (v8 = objc_msgSend(v7, "moveMessages:fromMailbox:toMailbox:markAsRead:", a3, objc_msgSend(a2, "mailboxUid"), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 73)), uint64_t v9 = objc_msgSend(v8, "resultCode"), objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", objc_msgSend(v8, "transferedMessages")), objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v8, "failedMessages")), v9 != 1))
    {
      if (![v6 count])
      {
        if (*(unsigned char *)(a1 + 73) && [a3 count])
        {
          v25 = @"MessageIsRead";
          v26[0] = MEMORY[0x1E4F1CC38];
          objc_msgSend(a2, "setFlagsFromDictionary:forMessages:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1), a3);
        }
        BOOL v10 = (void *)[MEMORY[0x1E4F1CA48] array];
        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(a3);
              }
              uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) messageFlags];
              objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v16 & 0xFFFFFFFFFFFFFFFDLL));
            }
            uint64_t v13 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
          }
          while (v13);
        }
        if ([*(id *)(a1 + 48) appendMessages:a3 unsuccessfulOnes:v6 newMessageIDs:v11 newMessages:*(void *)(a1 + 40) flagsToSet:v10] != 1)
        {
          a3 = (id)[a3 mutableCopy];
          [a3 removeObjectsInArray:v6];
        }
        if ([a3 count] && *(unsigned char *)(a1 + 72)) {
          [a2 setFlagsFromDictionary:*(void *)(a1 + 56) forMessages:a3];
        }
        if ([v6 count])
        {
          if (*(unsigned char *)(a1 + 74)
            && (objc_msgSend((id)objc_msgSend(a2, "mailboxUid"), "shouldRestoreMessagesAfterFailedDelete") & 1) == 0)
          {
            uint64_t v17 = *(void *)(a1 + 56);
          }
          else
          {
            double v22 = @"MessageIsDeleted";
            uint64_t v23 = MEMORY[0x1E4F1CC28];
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          }
          [a2 setFlagsFromDictionary:v17 forMessages:v6];
        }
      }
    }
  }
  else
  {
    [v6 addObjectsFromArray:a3];
  }
  [*(id *)(a1 + 64) addObjectsFromArray:v6];
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6 flagsToSet:(id)a7
{
  return 0;
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5 newMessages:(id)a6
{
  return [(MFMailMessageStore *)self appendMessages:a3 unsuccessfulOnes:a4 newMessageIDs:a5 newMessages:a6 flagsToSet:0];
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4 newMessageIDs:(id)a5
{
  return [(MFMailMessageStore *)self appendMessages:a3 unsuccessfulOnes:a4 newMessageIDs:a5 newMessages:0];
}

- (unint64_t)appendMessages:(id)a3 unsuccessfulOnes:(id)a4
{
  return [(MFMailMessageStore *)self appendMessages:a3 unsuccessfulOnes:a4 newMessageIDs:0];
}

- (id)messageForMessageID:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  return [(MFMailMessageStore *)self messageForMessageID:a3 options:0];
}

- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4
{
  return [(MFMailMessageStore *)self messageForMessageID:a3 options:0];
}

- (id)lastViewedMessageWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "lastViewedMessageID");
  return [(MFMailMessageStore *)self messageForMessageID:v5 options:v3];
}

- (id)lastViewedMessageDate
{
  id v2 = [(MFMailMessageStore *)self mailboxUid];
  return (id)[v2 lastViewedMessageDate];
}

- (id)uniqueRemoteIDsForMessages:(id)a3
{
  return 0;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id result = (id)[(MFMailMessageStore *)self _cachedHeaderDataForMessage:a3 valueIfNotPresent:0];
  if (!result)
  {
    id result = [(MFMailMessageStore *)self _fetchHeaderDataForMessage:a3 downloadIfNecessary:v4];
    if (result)
    {
      return (id)[(MFMailMessageStore *)self _cachedHeaderDataForMessage:a3 valueIfNotPresent:result];
    }
  }
  return result;
}

- (BOOL)hasCachedDataForMimePart:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "mimeBody"), "message");
  return [v3 isMessageContentsLocallyAvailable];
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = a4;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  uint64_t v10 = [a3 allKeys];
  if (*(unsigned char *)&self->_flags) {
    return 0;
  }
  uint64_t v11 = (void *)v10;
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = objc_msgSend(a3, "mf_BOOLForKey:", objc_msgSend(v11, "objectAtIndex:", i));
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v21 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v21);
        }
        if (v7)
        {
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          do
          {
            if (-[MFMailMessageStore _updateFlagForMessage:key:value:](self, "_updateFlagForMessage:key:value:", v18, [v11 objectAtIndex:v17], v8[v17]))
            {
              objc_msgSend(v9, "ef_addObjectIfAbsent:", v18);
            }
            ++v17;
          }
          while (v7 != v17);
        }
      }
      uint64_t v14 = [v21 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
  return v9;
}

- (id)setFlagsLocallyFromDictionary:(id)a3 forMessages:(id)a4
{
  return 0;
}

- (void)setFlag:(id)a3 state:(BOOL)a4 forMessages:(id)a5
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = [NSNumber numberWithBool:a4];
  -[MFMailMessageStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1], a5);
}

- (void)setFlagForAllMessages:(id)a3 state:(BOOL)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6[0] = NSStringFromBOOL();
  -[MFMailMessageStore setFlagsForAllMessagesFromDictionary:](self, "setFlagsForAllMessagesFromDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1]);
}

- (void)setFlagsForAllMessagesFromDictionary:(id)a3
{
  id v5 = [(MFMailMessageStore *)self copyOfAllMessagesWithOptions:128];
  [(MFMailMessageStore *)self setFlagsFromDictionary:a3 forMessages:v5];
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageStore;
  -[MFMailMessageStore setNumberOfAttachments:isSigned:isEncrypted:forMessage:](&v12, sel_setNumberOfAttachments_isSigned_isEncrypted_forMessage_);
  uint64_t v10 = [a6 messageFlags];
  unint64_t v11 = _MFFlagsBySettingNumberOfAttachments(v10, a3, v8, v7);
  if (v11 != v10) {
    [a6 setMessageFlags:v11];
  }
}

- (id)status
{
  return 0;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  return 0;
}

- (int64_t)fetchMobileSynchronously:(unint64_t)lastFetchCount preservingUID:(id)a4 options:(unint64_t)a5
{
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid"));
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "addReason:", @"MonitoredActivityReasonFetching");
  uint64_t v9 = [NSString stringWithFormat:@"%@", objc_msgSend(-[MFMailMessageStore mailboxUid](self, "mailboxUid"), "URLString")];
  uint64_t v10 = [NSString stringWithFormat:@"%@|%lu|%@|%d", v9, lastFetchCount, a4, (a5 >> 1) & 1];
  uint64_t v21 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  int v11 = objc_msgSend(-[MFMailMessageStore account](self, "account"), "willPerformActionForChokePoint:coalescePoint:result:", v9, v10, &v21);
  for (uint64_t i = (void *)v21; v11 && !v21; uint64_t i = (void *)v21)
    int v11 = objc_msgSend(-[MFMailMessageStore account](self, "account"), "willPerformActionForChokePoint:coalescePoint:result:", v9, v10, &v21);
  if ((v11 & 1) == 0)
  {
    id v13 = [(MFMailMessageStore *)self account];
    uint64_t v14 = v13;
    if (v13) {
      uint64_t v15 = (__CFString *)[v13 powerAssertionIdentifierWithPrefix:@"com.apple.message.fetchMobileSynchronously"];
    }
    else {
      uint64_t v15 = @"com.apple.message.fetchMobileSynchronously";
    }
    uint64_t v20 = v15;
    [+[MFPowerController sharedInstance] retainAssertionWithIdentifier:v15 withAccount:v14];
    [(MFMailMessageStore *)self mf_lock];
    if (lastFetchCount) {
      self->_lastFetchCount = lastFetchCount;
    }
    else {
      lastFetchCount = self->_lastFetchCount;
    }
    [(MFMailMessageStore *)self mf_unlock];
    int v16 = -2;
    do
    {
      int64_t v17 = [(MFMailMessageStore *)self fetchNumMessages:lastFetchCount preservingUID:a4 options:a5];
      if (v17 < 0
        && !objc_msgSend(v14, "shouldFetchAgainWithError:foregroundRequest:", objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error"), (a5 >> 4) & 1))
      {
        break;
      }
      uint64_t v21 = [NSNumber numberWithInteger:v17];
      if (!v16) {
        break;
      }
      ++v16;
    }
    while (v17 < 0);
    id v18 = [(MFMailMessageStore *)self account];
    [v18 didFinishActionForChokePoint:v9 coalescePoint:v10 withResult:v21];
    [+[MFPowerController sharedInstance] releaseAssertionWithIdentifier:v20];
    uint64_t i = (void *)v21;
  }
  return [i integerValue];
}

- (int64_t)fetchMobileSynchronously:(unint64_t)a3
{
  return [(MFMailMessageStore *)self fetchMobileSynchronously:a3 preservingUID:0 options:35];
}

- (BOOL)setPreferredEncoding:(unsigned int)a3 forMessage:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  int v7 = [a4 preferredEncoding];
  if (v7 != v5)
  {
    [a4 setPreferredEncoding:v5];
    BOOL v8 = (void *)[a4 headers];
    if (v8)
    {
      uint64_t v9 = v8;
      [v8 setPreferredEncoding:v5];
      uint64_t v10 = [v9 firstHeaderForKey:*MEMORY[0x1E4F60738]];
      objc_msgSend(a4, "setSubject:", objc_msgSend(MEMORY[0x1E4F608E0], "subjectWithString:", v10));
    }
    v12[0] = a4;
    -[MFMailMessageStore messageFlagsDidChange:flags:](self, "messageFlagsDidChange:flags:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1], 0);
  }
  return v7 != v5;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  return 0;
}

- (void)_flushAllMessageData
{
  [(MFMailMessageStore *)self mf_lock];
  self->_deletedMessageCount = 0;
  self->_deletedMessagesSize = 0;
  self->_unreadMessageCount = 0;
  _MFLockGlobalLock();
  uint64_t v3 = (int)*MEMORY[0x1E4F73618];

  *(Class *)((char *)&self->super.super.isa + v3) = 0;
  _MFUnlockGlobalLock();
  [(MFMailMessageStore *)self mf_unlock];
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageStore;
  [(MFMailMessageStore *)&v4 _flushAllMessageData];
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  if ([a3 summary]) {
    return 0;
  }
  else {
    return [a3 isMessageContentsLocallyAvailable] ^ 1;
  }
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

- (BOOL)shouldSetSummaryForMessage:(id)a3
{
  return [a3 summary] == 0;
}

- (BOOL)shouldDeleteInPlace
{
  id v3 = [(MFMailMessageStore *)self account];
  id v4 = [(MFMailMessageStore *)self mailboxUid];
  return [v3 deleteInPlaceForMailbox:v4];
}

- (BOOL)supportsArchiving
{
  id v3 = [(MFMailMessageStore *)self account];
  int v4 = [v3 supportsArchiving];
  if (v4) {
    LOBYTE(v4) = objc_msgSend(v3, "preventArchiveForMailbox:", -[MFMailMessageStore mailboxUid](self, "mailboxUid")) ^ 1;
  }
  return v4;
}

- (BOOL)shouldArchive
{
  id v3 = [(MFMailMessageStore *)self account];
  int v4 = [v3 shouldArchiveByDefault];
  if (v4)
  {
    id v5 = [(MFMailMessageStore *)self mailboxUid];
    LOBYTE(v4) = [v3 canArchiveForMailbox:v5];
  }
  return v4;
}

- (int)archiveDestination
{
  id v3 = [(MFMailMessageStore *)self account];
  id v4 = [(MFMailMessageStore *)self mailboxUid];
  return [v3 archiveDestinationForMailbox:v4];
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
}

- (void)_rebuildTableOfContentsSynchronously
{
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MFMailMessageStore;
  id v8 = -[MFMailMessageStore _setOrGetBody:forMessage:updateFlags:](&v11, sel__setOrGetBody_forMessage_updateFlags_);
  BOOL v9 = v8 != a3 || !v5;
  if (!v9 && ([a4 messageFlags] & 2) == 0) {
    [a4 calculateAttachmentInfoFromBody:a3];
  }
  return v8;
}

- (void)_setFlagsForMessages:(id)a3
{
  id v4 = (void *)[a3 keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      int v7 = (void *)[a3 objectForKey:v6];
      uint64_t v8 = [v7 objectForKey:@"messageFlags"];
      if (v8)
      {
        BOOL v9 = (void *)v8;
        uint64_t v10 = (void *)[v7 objectForKey:@"messageFlagsMask"];
        if (!v10)
        {
          unsigned int v12 = [v9 unsignedIntValue];
          uint64_t v13 = 0x1BFDDF7FFFFLL;
          goto LABEL_8;
        }
        unsigned int v11 = [v10 unsignedIntValue];
        unsigned int v12 = [v9 unsignedIntValue];
        if (v11)
        {
          uint64_t v13 = v11;
LABEL_8:
          uint64_t v14 = v12;
          uint64_t v15 = [v6 messageFlags];
          if (v13 == 0x1BFDDF7FFFFLL) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = v15 & ~v13 | v13 & v14;
          }
          if (v16 != v15) {
            objc_msgSend(v6, "setMessageFlags:");
          }
        }
      }
      id v6 = (void *)[v4 nextObject];
    }
    while (v6);
  }
}

- (void)updateMessages:(id)a3 updateNumberOfAttachments:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    if (!v5) {
      id v5 = [(MFMailMessageStore *)self copyOfAllMessages];
    }
    id v11 = v5;
    uint64_t v6 = [v5 count];
    if (v6)
    {
      uint64_t v7 = v6 - 1;
      do
      {
        uint64_t v8 = v7;
        id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v8), "calculateAttachmentInfoFromBody:", 0);
        char v10 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "shouldCancel");
        [v9 drain];
        if (v10) {
          break;
        }
        uint64_t v7 = v8 - 1;
      }
      while (v8);
    }
  }
}

- (void)messagesWereAdded:(id)a3 earliestReceivedDate:(id)a4
{
  unint64_t generationNumber = self->_generationNumber;
  if (generationNumber == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = generationNumber + 1;
  }
  self->_unint64_t generationNumber = v8;
  if ([a3 count])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"messages", a4, @"previous earliest received date", 0);
    char v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"MailMessageStoreMessagesAdded" object:self userInfo:v9];
  }
}

- (BOOL)_updateFlagForMessage:(id)a3 key:(id)a4 value:(BOOL)a5
{
  unsigned int v5 = a5;
  unint64_t v9 = [a3 messageFlags];
  if ([a4 isEqual:@"MessageIsRead"])
  {
    if ((v9 & 1) != v5)
    {
      unint64_t unreadMessageCount = self->_unreadMessageCount;
      unint64_t v11 = v5 ? unreadMessageCount - 1 : unreadMessageCount + 1;
      self->_unint64_t unreadMessageCount = v11;
      if (v11 >> 31)
      {
        self->_unint64_t unreadMessageCount = 0;
        unsigned int v12 = MFLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v18 = 0;
          _os_log_impl(&dword_1CFCFE000, v12, OS_LOG_TYPE_INFO, "#UnreadCount _unreadMessageCount went negative", v18, 2u);
        }
      }
    }
  }
  else
  {
    if ([a4 isEqual:@"MessageIsDeleted"]) {
      BOOL v13 = ((v9 >> 1) & 1) == v5;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      unint64_t deletedMessageCount = self->_deletedMessageCount;
      if (v5)
      {
        self->_unint64_t deletedMessageCount = deletedMessageCount + 1;
        unint64_t v15 = self->_deletedMessagesSize + [a3 messageSize];
      }
      else
      {
        self->_unint64_t deletedMessageCount = deletedMessageCount - 1;
        unint64_t v15 = self->_deletedMessagesSize - [a3 messageSize];
      }
      self->_deletedMessagesSize = v15;
    }
  }
  unint64_t v16 = _MFFlagsBySettingValueForKey(v9, a4, v5);
  if (v16 != v9
    && [(MFMailMessageStore *)self _shouldChangeComponentMessageFlagsForMessage:a3])
  {
    [a3 setMessageFlags:v16];
  }
  return v16 != v9;
}

- (BOOL)_shouldChangeComponentMessageFlags
{
  return 1;
}

+ (Class)headersClass
{
  return (Class)objc_opt_class();
}

- (id)messageIdRollCall:(id)a3
{
  return 0;
}

@end