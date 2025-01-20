@interface MFLibraryMessage
+ (id)log;
+ (id)messageWithLibraryID:(int64_t)a3;
- (BOOL)hasTemporaryUid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJournaled;
- (BOOL)isLibraryMessage;
- (BOOL)isMessageContentsLocallyAvailable;
- (BOOL)isPartial;
- (ECSignatureInfo)signatureInfo;
- (EDAccount)accountForSender;
- (EDPersistedMessageID)persistedMessageID;
- (EMCategory)category;
- (EMFollowUp)followUp;
- (EMGeneratedSummary)generatedSummary;
- (EMMessageObjectID)objectID;
- (EMReadLater)readLater;
- (EMSearchableMessageID)searchableMessageID;
- (MFLibraryMessage)initWithLibraryID:(int64_t)a3;
- (MFLibraryStore)messageStore;
- (MFMailboxUid)mailbox;
- (MailAccount)account;
- (NSArray)references;
- (NSArray)remoteContentLinks;
- (NSArray)senders;
- (NSData)brandIndicator;
- (NSDate)displayDate;
- (NSDate)sendLaterDate;
- (NSDictionary)dataDetectionAttributes;
- (NSString)businessLogoID;
- (NSString)description;
- (NSString)notificationID;
- (NSString)persistentID;
- (NSString)remoteID;
- (NSURL)basePath;
- (NSURL)brandIndicatorLocation;
- (id)_privacySafeDescription;
- (id)dataConsumerForMimePart:(id)a3;
- (id)dataPathForMimePart:(id)a3;
- (id)downloadedMessageData;
- (id)library;
- (id)mailboxName;
- (id)messageID;
- (id)originalMailboxURL;
- (id)path;
- (id)preferredAccountToUseForReplying;
- (id)signatureInfoIfDecodingIsComplete:(BOOL)a3;
- (id)storageLocationForAttachment:(id)a3;
- (int64_t)authenticationState;
- (int64_t)businessID;
- (int64_t)compareByUidWithMessage:(id)a3;
- (int64_t)globalMessageID;
- (int64_t)libraryID;
- (int64_t)mailboxID;
- (int64_t)originalMailboxID;
- (int64_t)senderBucket;
- (int64_t)unsubscribeType;
- (unint64_t)conversationFlags;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (unint64_t)messageSize;
- (unint64_t)uniqueRemoteId;
- (unsigned)uid;
- (void)_forceLoadOfMessageSummaryFromProtectedStore;
- (void)_updateUID;
- (void)commit;
- (void)loadCachedHeaderValuesFromHeaders:(id)a3;
- (void)markAsFlagged;
- (void)markAsForwarded;
- (void)markAsNotFlagged;
- (void)markAsNotViewed;
- (void)markAsReplied;
- (void)markAsViewed;
- (void)setAuthenticationState:(int64_t)a3;
- (void)setBrandIndicatorLocation:(id)a3;
- (void)setBrandIndicatorLocation:(id)a3 andData:(id)a4;
- (void)setBusinessID:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setDataDetectionAttributes;
- (void)setDisplayDate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFollowUp:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGlobalMessageID:(int64_t)a3;
- (void)setHasTemporaryUid:(BOOL)a3;
- (void)setIsJournaled:(BOOL)a3;
- (void)setIsPartial:(BOOL)a3;
- (void)setMailboxID:(int64_t)a3;
- (void)setMessageData:(id)a3 isPartial:(BOOL)a4;
- (void)setMessageData:(id)a3 isPartial:(BOOL)a4 summary:(id)a5;
- (void)setMessageFlags:(unint64_t)a3;
- (void)setMessageFlagsWithoutCommitting:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setMutableInfoFromMessage:(id)a3;
- (void)setOriginalMailboxID:(int64_t)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setReadLater:(id)a3;
- (void)setReadLaterDate:(id)a3;
- (void)setReferences:(id)a3;
- (void)setRemoteContentLinks:(id)a3;
- (void)setRemoteID:(id)a3;
- (void)setRemoteID:(id)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(int64_t)a6 originalMailboxID:(int64_t)a7;
- (void)setSendLaterDate:(id)a3;
- (void)setSenderBucket:(int64_t)a3;
- (void)setSummary:(id)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUniqueRemoteId:(unint64_t)a3;
- (void)setUnsubscribeType:(int64_t)a3;
@end

@implementation MFLibraryMessage

- (EMCategory)category
{
  return self->_category;
}

- (NSString)persistentID
{
  v2 = [(MFLibraryMessage *)self persistedMessageID];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (MFMailboxUid)mailbox
{
  v3 = [(MFLibraryMessage *)self library];
  v4 = [v3 mailboxUidForMessage:self];

  return (MFMailboxUid *)v4;
}

- (int64_t)mailboxID
{
  [(MFLibraryMessage *)self mf_lock];
  int64_t mailboxID = self->_mailboxID;
  [(MFLibraryMessage *)self mf_unlock];
  return mailboxID;
}

- (MailAccount)account
{
  v3 = [(MFLibraryMessage *)self messageStore];
  v4 = +[MFLibraryStore sharedInstanceIfExists];

  if (v4 == v3)
  {
    v6 = [(MFLibraryMessage *)self library];
    v5 = [v6 accountForMessage:self];
  }
  else
  {
    v5 = [v3 account];
  }

  return (MailAccount *)v5;
}

- (id)library
{
  v2 = [(MFLibraryMessage *)self messageStore];
  v3 = [v2 library];

  return v3;
}

- (MFLibraryStore)messageStore
{
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  v2 = [(MFMailMessage *)&v7 messageStore];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[MFLibraryStore sharedInstance];
  }
  v5 = v4;

  return (MFLibraryStore *)v5;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  _MFLockGlobalLock();
  if (self->_uniqueRemoteId != a3) {
    self->_uniqueRemoteId = a3;
  }
  _MFUnlockGlobalLock();
}

- (void)setRemoteID:(id)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(int64_t)a6 originalMailboxID:(int64_t)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (v12) {
    [(MFLibraryMessage *)self setRemoteID:v12];
  }
  [(MFLibraryMessage *)self mf_lock];
  self->super._messageFlags = a4;
  self->_size = a5;
  self->_int64_t mailboxID = a6;
  self->_originalMailboxID = a7;
  [(MFLibraryMessage *)self mf_unlock];
  if (a6 == -1)
  {
    v13 = +[MFLibraryMessage log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [(MFLibraryMessage *)self ef_publicDescription];
      [(MFLibraryMessage *)v14 setMailboxID:v13];
    }
  }
}

- (void)setRemoteID:(id)a3
{
  v5 = (NSString *)a3;
  _MFLockGlobalLock();
  if (self->_remoteID != v5)
  {
    objc_storeStrong((id *)&self->_remoteID, a3);
    [(MFLibraryMessage *)self _updateUID];
  }
  _MFUnlockGlobalLock();
}

- (void)setIsJournaled:(BOOL)a3
{
}

- (void)setGlobalMessageID:(int64_t)a3
{
  self->_globalMessageID = a3;
}

- (void)setGeneratedSummary:(id)a3
{
}

- (void)setDisplayDate:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (void)setBrandIndicatorLocation:(id)a3 andData:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  [(MFLibraryMessage *)self mf_lock];
  objc_storeStrong((id *)&self->_brandIndicatorLocation, a3);
  v8 = (NSData *)[v7 copy];
  brandIndicator = self->_brandIndicator;
  self->_brandIndicator = v8;

  [(MFLibraryMessage *)self mf_unlock];
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (void)_updateUID
{
  unsigned int v3 = [(NSString *)self->_remoteID intValue];
  self->_uid = v3;
  if (!v3)
  {
    uint64_t v4 = [(NSString *)self->_remoteID rangeOfString:@"temp-" options:8];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSString substringWithRange:](self->_remoteID, "substringWithRange:", v4 + v5, [(NSString *)self->_remoteID length] - (v4 + v5));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      self->_uid = [v6 intValue];
    }
  }
}

+ (id)messageWithLibraryID:(int64_t)a3
{
  unsigned int v3 = [[MFLibraryMessage alloc] initWithLibraryID:a3];
  return v3;
}

- (MFLibraryMessage)initWithLibraryID:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFLibraryMessage;
  uint64_t v4 = [(MFLibraryMessage *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F60B78]) initWithDatabaseID:a3];
    persistedMessageID = v4->_persistedMessageID;
    v4->_persistedMessageID = (EDPersistedMessageID *)v5;

    v4->_originalMailboxID = -1;
    v4->_int64_t mailboxID = -1;
    atomic_store(0, &v4->_conversationFlags);
    atomic_store(0, (unint64_t *)&v4->_senderBucket);
    atomic_store(0, (unsigned __int8 *)&v4->_isJournaled);
    atomic_store(0, (unint64_t *)&v4->_unsubscribeType);
  }
  return v4;
}

- (NSString)notificationID
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[MFLibraryMessage globalMessageID](self, "globalMessageID"));
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (NSString)description
{
  unsigned int v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  uint64_t v4 = [(MFLibraryMessage *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ globalMessageID:%lld", v4, -[MFLibraryMessage globalMessageID](self, "globalMessageID")];

  return (NSString *)v5;
}

- (id)_privacySafeDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MFLibraryMessage;
  unsigned int v3 = [(MFLibraryMessage *)&v8 _privacySafeDescription];
  int64_t v4 = [(MFLibraryMessage *)self libraryID];
  uint64_t v5 = [(MFLibraryMessage *)self remoteID];
  id v6 = [v3 stringByAppendingFormat:@" libraryID:%lld remoteID:%@", v4, v5];

  return v6;
}

- (NSString)remoteID
{
  return self->_remoteID;
}

- (id)messageID
{
  v2 = [(MFLibraryMessage *)self persistedMessageID];
  unsigned int v3 = [v2 stringValue];

  return v3;
}

- (int64_t)libraryID
{
  v2 = [(MFLibraryMessage *)self persistedMessageID];
  int64_t v3 = [v2 databaseID];

  return v3;
}

- (EDPersistedMessageID)persistedMessageID
{
  return self->_persistedMessageID;
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (NSArray)senders
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MFLibraryMessage *)self sendersIfCached];
  if (!v3)
  {
    int64_t v4 = [(MFLibraryMessage *)self library];
    uint64_t v5 = objc_msgSend(v4, "senderForMessageWithLibraryID:", -[MFLibraryMessage libraryID](self, "libraryID"));

    uint64_t v6 = [v5 stringValue];
    objc_super v7 = (void *)v6;
    if (v6)
    {
      v9[0] = v6;
      int64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [(MFLibraryMessage *)self setSender:v3];
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_brandIndicator, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_dataDetectionAttributes, 0);
  objc_storeStrong((id *)&self->_remoteContentLinks, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_persistedMessageID, 0);
  objc_storeStrong((id *)&self->_remoteID, 0);
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MFLibraryMessage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return v2;
}

void __23__MFLibraryMessage_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (EMSearchableMessageID)searchableMessageID
{
  v2 = (void *)MEMORY[0x1E4F60C30];
  id v3 = [(MFLibraryMessage *)self persistedMessageID];
  int64_t v4 = [v2 searchableMessageIDForPersistedMessageID:v3];

  return (EMSearchableMessageID *)v4;
}

- (EMMessageObjectID)objectID
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F60318];
  int64_t v4 = [(MFLibraryMessage *)self mailbox];
  uint64_t v5 = [v4 objectID];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  objc_super v7 = [v3 mailboxScopeForMailboxObjectIDs:v6 forExclusion:0];

  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F603A0]), "initWithGlobalMessageID:mailboxScope:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"), v7);
  return (EMMessageObjectID *)v8;
}

- (void)setMailboxID:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(MFLibraryMessage *)self mf_lock];
  self->_int64_t mailboxID = a3;
  [(MFLibraryMessage *)self mf_unlock];
  if (a3 == -1)
  {
    uint64_t v5 = +[MFLibraryMessage log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(MFLibraryMessage *)self ef_publicDescription];
      [(MFLibraryMessage *)v6 setMailboxID:v5];
    }
  }
}

- (int64_t)originalMailboxID
{
  [(MFLibraryMessage *)self mf_lock];
  int64_t originalMailboxID = self->_originalMailboxID;
  [(MFLibraryMessage *)self mf_unlock];
  return originalMailboxID;
}

- (void)setOriginalMailboxID:(int64_t)a3
{
  [(MFLibraryMessage *)self mf_lock];
  self->_int64_t originalMailboxID = a3;
  [(MFLibraryMessage *)self mf_unlock];
}

- (id)originalMailboxURL
{
  id v3 = [(MFLibraryMessage *)self library];
  int64_t v4 = objc_msgSend(v3, "urlForMailboxID:", -[MFLibraryMessage originalMailboxID](self, "originalMailboxID"));

  return v4;
}

- (NSURL)basePath
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  int64_t v4 = [(MFLibraryMessage *)self library];
  uint64_t v5 = [(MFLibraryMessage *)self account];
  uint64_t v6 = [v4 messageBasePathForAccount:v5];
  objc_super v7 = [v3 fileURLWithPath:v6];

  return (NSURL *)v7;
}

- (unint64_t)messageSize
{
  [(MFLibraryMessage *)self mf_lock];
  unint64_t size = self->_size;
  [(MFLibraryMessage *)self mf_unlock];
  return size;
}

- (void)setMessageSize:(unint64_t)a3
{
  [(MFLibraryMessage *)self mf_lock];
  self->_unint64_t size = a3;
  [(MFLibraryMessage *)self mf_unlock];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (MFLibraryMessage *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [(MFLibraryMessage *)self libraryID];
    unsigned __int8 v6 = v5 == [(MFLibraryMessage *)v4 libraryID];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryMessage;
    unsigned __int8 v6 = [(MFLibraryMessage *)&v8 isEqual:v4];
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(MFLibraryMessage *)self persistedMessageID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  if (self->_uid != a3)
  {
    int64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
    int64_t v5 = [v4 stringValue];
    [(MFLibraryMessage *)self setRemoteID:v5];

    [(MFLibraryMessage *)self commit];
  }
}

- (unint64_t)uniqueRemoteId
{
  return self->_uniqueRemoteId;
}

- (BOOL)isPartial
{
  [(MFLibraryMessage *)self mf_lock];
  unint64_t v3 = (self->super._messageFlags >> 34) & 1;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setIsPartial:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFLibraryMessage *)self library];
  [v5 setMessage:self isPartial:v3];
}

- (BOOL)isMessageContentsLocallyAvailable
{
  v2 = self;
  BOOL v3 = [(MFLibraryMessage *)self library];
  LOBYTE(v2) = [v3 areMessageContentsLocallyAvailable:v2 fullContentsAvailble:0];

  return (char)v2;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = a3 != -1;
  [(MFLibraryMessage *)self mf_lock];
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)v5 << 35);
  [(MFLibraryMessage *)self mf_unlock];
  v6.receiver = self;
  v6.super_class = (Class)MFLibraryMessage;
  [(MFLibraryMessage *)&v6 setPreferredEncoding:v3];
}

- (BOOL)hasTemporaryUid
{
  [(MFLibraryMessage *)self mf_lock];
  unint64_t v3 = HIDWORD(self->super._messageFlags) & 1;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setHasTemporaryUid:(BOOL)a3
{
  BOOL v3 = a3;
  [(MFLibraryMessage *)self mf_lock];
  uint64_t v5 = 0x100000000;
  if (!v3) {
    uint64_t v5 = 0;
  }
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFEFFFFFFFFLL | v5;
  [(MFLibraryMessage *)self mf_unlock];
}

- (id)mailboxName
{
  BOOL v3 = [(MFLibraryMessage *)self library];
  int64_t v4 = [v3 mailboxUidForMessage:self];

  uint64_t v5 = [v4 account];
  objc_super v6 = [v5 nameForMailboxUid:v4];

  return v6;
}

- (int64_t)compareByUidWithMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(MFLibraryMessage *)self hasTemporaryUid];
  int v6 = [v4 hasTemporaryUid];
  int v7 = v5 - v6;
  if (v5 == v6)
  {
    unsigned int uid = self->_uid;
    int v7 = uid - [v4 uid];
  }
  BOOL v9 = v7 < 0;
  BOOL v10 = v7 != 0;
  if (v9) {
    int64_t v11 = -1;
  }
  else {
    int64_t v11 = v10;
  }

  return v11;
}

- (void)setMessageFlagsWithoutCommitting:(unint64_t)a3
{
  [(MFLibraryMessage *)self mf_lock];
  self->super._messageFlags = a3;
  [(MFLibraryMessage *)self mf_unlock];
}

- (void)setMessageFlags:(unint64_t)a3
{
  if ([(MFMailMessage *)self messageFlags] != a3)
  {
    id v5 = [(MFLibraryMessage *)self library];
    [v5 setFlags:a3 forMessage:self];
  }
}

- (void)setFlags:(unint64_t)a3
{
  [(MFLibraryMessage *)self mf_lock];
  self->super._messageFlags = a3;
  [(MFLibraryMessage *)self mf_unlock];
}

- (void)setSummary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFLibraryMessage;
  id v5 = [(MFLibraryMessage *)&v9 summary];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFLibraryMessage;
    [(MFMailMessage *)&v8 setSummary:v4];
    int v7 = [(MFLibraryMessage *)self library];
    [v7 setSummary:v4 forMessage:self];
  }
}

- (void)commit
{
  id v3 = [(MFLibraryMessage *)self library];
  objc_msgSend(v3, "setFlags:forMessage:", -[MFMailMessage messageFlags](self, "messageFlags"), self);
}

- (void)setMutableInfoFromMessage:(id)a3
{
  id v4 = a3;
  -[MFLibraryMessage setMessageFlagsWithoutCommitting:](self, "setMessageFlagsWithoutCommitting:", [v4 messageFlags]);
}

- (id)path
{
  id v3 = [(MFLibraryMessage *)self library];
  id v4 = [v3 dataPathForMessage:self];

  return v4;
}

- (id)dataPathForMimePart:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLibraryMessage *)self messageStore];
  char v6 = [v5 dataPathForMessage:self part:v4];

  return v6;
}

- (void)markAsViewed
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 1) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    objc_super v8 = @"MessageIsRead";
    v9[0] = MEMORY[0x1E4F1CC38];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (void)markAsNotViewed
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(MFMailMessage *)self messageFlags])
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    objc_super v8 = @"MessageIsRead";
    v9[0] = MEMORY[0x1E4F1CC28];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (void)markAsFlagged
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x10) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    objc_super v8 = @"MessageIsFlagged";
    v9[0] = MEMORY[0x1E4F1CC38];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (void)markAsNotFlagged
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x10) != 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    objc_super v8 = @"MessageIsFlagged";
    v9[0] = MEMORY[0x1E4F1CC28];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (void)markAsReplied
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 4) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    v8[0] = @"MessageWasRepliedTo";
    v8[1] = @"MessageChangeReason";
    v9[0] = MEMORY[0x1E4F1CC38];
    v9[1] = &unk_1EFF50B80;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (void)markAsForwarded
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x100) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    v8[0] = @"MessageWasForwarded";
    v8[1] = @"MessageChangeReason";
    v9[0] = MEMORY[0x1E4F1CC38];
    v9[1] = &unk_1EFF50B80;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    int v7 = self;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    id v6 = (id)[v3 setFlagsFromDictionary:v4 forMessages:v5];
  }
}

- (id)preferredAccountToUseForReplying
{
  v2 = [(MFLibraryMessage *)self originalMailboxURL];
  id v3 = +[MailAccount mailboxUidFromActiveAccountsForURL:v2];
  id v4 = [v3 account];

  return v4;
}

- (void)setConversationFlags:(unint64_t)a3
{
}

- (unint64_t)conversationFlags
{
  return atomic_load(&self->_conversationFlags);
}

- (void)setSenderBucket:(int64_t)a3
{
}

- (int64_t)senderBucket
{
  return atomic_load((unint64_t *)&self->_senderBucket);
}

- (BOOL)isJournaled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isJournaled);
  return v2 & 1;
}

- (NSURL)brandIndicatorLocation
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_brandIndicatorLocation;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (NSData)brandIndicator
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_brandIndicator;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4 summary:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  objc_super v9 = [(MFLibraryMessage *)self messageStore];
  [v9 setData:v10 summary:v8 forMessage:self isPartial:v6];
}

- (id)downloadedMessageData
{
  id v3 = [(MFLibraryMessage *)self library];
  id v4 = [v3 downloadedMessageDataForMessage:self];

  return v4;
}

- (id)dataConsumerForMimePart:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLibraryMessage *)self library];
  BOOL v6 = [v5 dataConsumerForMessage:self part:v4];

  return v6;
}

- (id)storageLocationForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLibraryMessage *)self library];
  BOOL v6 = [v5 persistence];
  int v7 = [v6 attachmentPersistenceManager];

  id v8 = [v5 attachmentMigrator];
  [v8 migrateAttachmentsForMessageIfNecessary:self];

  objc_super v9 = [(MFLibraryMessage *)self account];
  id v10 = [v5 messageBasePathForAccount:v9];

  int64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:1];
  id v12 = [v4 mimePartNumber];
  if (v12
    || ([v4 part],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 partNumber],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12))
  {
    v14 = objc_msgSend(v7, "attachmentURLForGlobalMessageID:mimePartNumber:basePath:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"), v12, v11);
    v15 = [v14 path];

    goto LABEL_4;
  }
  v17 = [v4 mailDropMetadata];

  if (v17)
  {
    int64_t v18 = [(MFLibraryMessage *)self globalMessageID];
    v19 = [v4 mailDropMetadata];
    v20 = [v19 directUrl];
    v21 = [v7 attachmentURLForGlobalMessageID:v18 remoteURL:v20 basePath:v11];
    v15 = [v21 path];

    if (v15)
    {
LABEL_11:
      id v12 = 0;
      goto LABEL_4;
    }
    v22 = [v4 mailDropMetadata];
    BOOL v23 = +[MFMessageAttachmentMigrator migrateMaildropFileForMessage:self mailDropMetadata:v22];

    if (v23)
    {
      int64_t v24 = [(MFLibraryMessage *)self globalMessageID];
      v25 = [v4 mailDropMetadata];
      v26 = [v25 directUrl];
      v27 = [v7 attachmentURLForGlobalMessageID:v24 remoteURL:v26 basePath:v11];
      v15 = [v27 path];

      goto LABEL_11;
    }
  }
  else
  {
    v28 = EDAttachmentsLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MFLibraryMessage storageLocationForAttachment:]((uint64_t)v4, v28);
    }
  }
  id v12 = 0;
  v15 = 0;
LABEL_4:

  return v15;
}

- (void)_forceLoadOfMessageSummaryFromProtectedStore
{
  id v8 = [(MFLibraryMessage *)self library];
  id v4 = objc_msgSend(v8, "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID"));
  objc_msgSend(v8, "messageWithLibraryID:options:inMailbox:", -[MFLibraryMessage libraryID](self, "libraryID"), 32783, v4);
  id v5 = (MFLibraryMessage *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v5 && v5 != self)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"LibraryMessage.m", 562, @"Expected message %@ to be self %@", v6, self object file lineNumber description];
  }
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4 = a3;
  [(MFLibraryMessage *)self _forceLoadOfMessageSummaryFromProtectedStore];
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  [(MFMailMessage *)&v5 loadCachedHeaderValuesFromHeaders:v4];
}

- (unint64_t)fileSize
{
  id v3 = [(MFLibraryMessage *)self library];
  id v4 = [v3 fileAttributesForMessage:self];
  unint64_t v5 = [v4 fileSize];

  return v5;
}

- (void)setUnsubscribeType:(int64_t)a3
{
}

- (int64_t)unsubscribeType
{
  return atomic_load((unint64_t *)&self->_unsubscribeType);
}

- (NSArray)references
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_references;
  [(MFLibraryMessage *)self mf_unlock];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MFLibraryMessage;
    id v3 = [(MFMailMessage *)&v5 references];
  }
  return v3;
}

- (void)setReferences:(id)a3
{
  id v5 = a3;
  [(MFLibraryMessage *)self mf_lock];
  objc_storeStrong((id *)&self->_references, a3);
  [(MFLibraryMessage *)self mf_unlock];
}

- (EMReadLater)readLater
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_readLater;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setReadLaterDate:(id)a3
{
  id v5 = a3;
  [(MFLibraryMessage *)self mf_lock];
  objc_storeStrong((id *)&self->_readLater, a3);
  [(MFLibraryMessage *)self mf_unlock];
}

- (EDAccount)accountForSender
{
  unsigned __int8 v2 = [(MFLibraryMessage *)self firstSender];
  id v3 = +[MailAccount accountContainingEmailAddress:v2];

  return (EDAccount *)v3;
}

- (NSDate)sendLaterDate
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_sendLaterDate;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setSendLaterDate:(id)a3
{
  id v5 = a3;
  [(MFLibraryMessage *)self mf_lock];
  objc_storeStrong((id *)&self->_sendLaterDate, a3);
  [(MFLibraryMessage *)self mf_unlock];
}

- (EMFollowUp)followUp
{
  [(MFLibraryMessage *)self mf_lock];
  id v3 = self->_followUp;
  [(MFLibraryMessage *)self mf_unlock];
  return v3;
}

- (void)setFollowUp:(id)a3
{
  id v5 = a3;
  [(MFLibraryMessage *)self mf_lock];
  objc_storeStrong((id *)&self->_followUp, a3);
  [(MFLibraryMessage *)self mf_unlock];
}

- (NSDictionary)dataDetectionAttributes
{
  if (_os_feature_enabled_impl())
  {
    if (!self->_dataDetectionAttributes) {
      [(MFLibraryMessage *)self setDataDetectionAttributes];
    }
    [(MFLibraryMessage *)self mf_lock];
    id v3 = self->_dataDetectionAttributes;
    [(MFLibraryMessage *)self mf_unlock];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setDataDetectionAttributes
{
  if (_os_feature_enabled_impl())
  {
    id v6 = [(MFLibraryMessage *)self library];
    id v3 = [v6 persistence];
    id v4 = [v3 dataDetectionPersistence];

    id v5 = objc_msgSend(v4, "getDataDetectionResultsForGlobalMessageID:", -[MFLibraryMessage globalMessageID](self, "globalMessageID"));
    [(MFLibraryMessage *)self mf_lock];
    if (!self->_dataDetectionAttributes) {
      objc_storeStrong((id *)&self->_dataDetectionAttributes, v5);
    }
    [(MFLibraryMessage *)self mf_unlock];
  }
}

- (ECSignatureInfo)signatureInfo
{
  return (ECSignatureInfo *)[(MFLibraryMessage *)self signatureInfoIfDecodingIsComplete:0];
}

- (id)signatureInfoIfDecodingIsComplete:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(MFLibraryMessage *)self messageBodyIfAvailableUpdatingFlags:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 topLevelPart];
      if (([v6 isSecurePart] & 1) != 0
        && (!v3 || [v6 isDecodingComplete])
        && ([v6 decodeIfNecessary], objc_msgSend(v6, "isSigned")))
      {
        int v7 = [v6 signatureInfo];
      }
      else
      {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (NSArray)remoteContentLinks
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRemoteContentLinks:(id)a3
{
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setReadLater:(id)a3
{
}

- (void)setBrandIndicatorLocation:(id)a3
{
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (NSString)businessLogoID
{
  return self->_businessLogoID;
}

- (void)setBusinessLogoID:(id)a3
{
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setMailboxID:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No mailboxID found for %{public}@", buf, 0xCu);
}

- (void)storageLocationForAttachment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Missing either a MIME part number or Mail Drop remote URL for attachment %@", (uint8_t *)&v2, 0xCu);
}

@end