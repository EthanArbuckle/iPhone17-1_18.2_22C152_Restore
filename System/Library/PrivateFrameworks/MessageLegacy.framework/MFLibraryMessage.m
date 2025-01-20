@interface MFLibraryMessage
+ (id)messageWithLibraryID:(unsigned int)a3;
- (BOOL)hasTemporaryUid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLibraryMessage;
- (BOOL)isMessageContentsLocallyAvailable;
- (BOOL)isPartial;
- (MFLibraryMessage)initWithLibraryID:(unsigned int)a3;
- (id)_attachmentStorageLocation;
- (id)_privacySafeDescription;
- (id)account;
- (id)copyMessageInfo;
- (id)dataConsumerForMimePart:(id)a3;
- (id)dataPathForMimePart:(id)a3;
- (id)library;
- (id)mailbox;
- (id)mailboxName;
- (id)messageID;
- (id)messageStore;
- (id)metadataValueOfClass:(Class)a3 forKey:(id)a4;
- (id)originalMailboxURL;
- (id)path;
- (id)preferredEmailAddressToReplyWith;
- (id)remoteID;
- (int64_t)compareByUidWithMessage:(id)a3;
- (unint64_t)conversationFlags;
- (unint64_t)hash;
- (unint64_t)messageSize;
- (unint64_t)uniqueRemoteId;
- (unsigned)libraryID;
- (unsigned)mailboxID;
- (unsigned)originalMailboxID;
- (unsigned)uid;
- (void)_forceLoadOfMessageSummaryFromProtectedStore;
- (void)_initializeMetadata;
- (void)_updateUID;
- (void)commit;
- (void)dealloc;
- (void)loadCachedHeaderValuesFromHeaders:(id)a3;
- (void)markAsFlagged;
- (void)markAsForwarded;
- (void)markAsNotFlagged;
- (void)markAsNotViewed;
- (void)markAsReplied;
- (void)markAsViewed;
- (void)setConversationFlags:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHasTemporaryUid:(BOOL)a3;
- (void)setIsPartial:(BOOL)a3;
- (void)setMailboxID:(unsigned int)a3;
- (void)setMessageData:(id)a3 isPartial:(BOOL)a4;
- (void)setMessageFlags:(unint64_t)a3;
- (void)setMessageFlagsWithoutCommitting:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setMutableInfoFromMessage:(id)a3;
- (void)setOriginalMailboxID:(unsigned int)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setRemoteID:(const char *)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(unsigned int)a6 originalMailboxID:(unsigned int)a7;
- (void)setRemoteID:(id)a3;
- (void)setSummary:(id)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUniqueRemoteId:(unint64_t)a3;
@end

@implementation MFLibraryMessage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  [(MFMailMessage *)&v3 dealloc];
}

- (MFLibraryMessage)initWithLibraryID:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFLibraryMessage;
  v4 = [(MFLibraryMessage *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_libraryID = a3;
    v4->_originalMailboxID = -1;
    v4->_mailboxID = -1;
    v4->_metadataLock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"Metadata Lock" andDelegate:0];
  }
  return v5;
}

+ (id)messageWithLibraryID:(unsigned int)a3
{
  objc_super v3 = [[MFLibraryMessage alloc] initWithLibraryID:*(void *)&a3];
  return v3;
}

- (id)library
{
  id v2 = [(MFLibraryMessage *)self messageStore];
  return (id)[v2 library];
}

- (id)messageID
{
  p_messageID = &self->_messageID;
  if (!atomic_load((unint64_t *)&self->_messageID))
  {
    id v5 = (id)EFStringWithInt();
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)p_messageID, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
  }
    }
  objc_super v7 = self->_messageID;
  return v7;
}

- (unsigned)libraryID
{
  return self->_libraryID;
}

- (unsigned)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(unsigned int)a3
{
  self->_mailboxID = a3;
}

- (unsigned)originalMailboxID
{
  return self->_originalMailboxID;
}

- (void)setOriginalMailboxID:(unsigned int)a3
{
  self->_originalMailboxID = a3;
}

- (id)originalMailboxURL
{
  id v3 = [(MFLibraryMessage *)self library];
  uint64_t originalMailboxID = self->_originalMailboxID;
  return (id)[v3 urlForMailboxID:originalMailboxID];
}

- (unint64_t)messageSize
{
  return self->_size;
}

- (void)setMessageSize:(unint64_t)a3
{
  self->_size = a3;
}

- (id)messageStore
{
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  id result = [(MFMailMessage *)&v3 messageStore];
  if (!result) {
    return +[MFLibraryStore sharedInstance];
  }
  return result;
}

- (id)mailbox
{
  id v3 = [(MFLibraryMessage *)self library];
  return (id)[v3 mailboxUidForMessage:self];
}

- (void)_updateUID
{
  unsigned int v3 = [(NSString *)self->_remoteID intValue];
  self->_uid = v3;
  if (!v3)
  {
    uint64_t v4 = [(NSString *)self->_remoteID rangeOfString:@"temp-" options:8];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      self->_uid = -[NSString intValue](-[NSString substringWithRange:](self->_remoteID, "substringWithRange:", v4 + v5, [(NSString *)self->_remoteID length] - (v4 + v5)), "intValue");
    }
  }
}

- (void)setRemoteID:(id)a3
{
  _MFLockGlobalLock();
  remoteID = self->_remoteID;
  if (remoteID != a3)
  {

    self->_remoteID = (NSString *)a3;
    [(MFLibraryMessage *)self _updateUID];
  }
  _MFUnlockGlobalLock();
}

- (id)remoteID
{
  id v2 = self->_remoteID;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  if (objc_opt_respondsToSelector())
  {
    unsigned int libraryID = self->_libraryID;
    return libraryID == [a3 libraryID];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFLibraryMessage;
    return [(MFLibraryMessage *)&v9 isEqual:a3];
  }
}

- (unint64_t)hash
{
  return (0x4F1BBCD880000000 * (unint64_t)self->_libraryID) >> 32;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  if (self->_uid != a3)
  {
    -[MFLibraryMessage setRemoteID:](self, "setRemoteID:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:"), "stringValue"));
    [(MFLibraryMessage *)self commit];
  }
}

- (unint64_t)uniqueRemoteId
{
  return self->_uniqueRemoteId;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  _MFLockGlobalLock();
  if (self->_uniqueRemoteId != a3) {
    self->_uniqueRemoteId = a3;
  }
  _MFUnlockGlobalLock();
}

- (BOOL)isPartial
{
  return (BYTE4(self->super._messageFlags) >> 2) & 1;
}

- (void)setIsPartial:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFLibraryMessage *)self library];
  [v5 setMessage:self isPartial:v3];
}

- (BOOL)isMessageContentsLocallyAvailable
{
  id v3 = [(MFLibraryMessage *)self library];
  return [v3 isMessageContentsLocallyAvailable:self];
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 != -1) << 35);
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  -[MFLibraryMessage setPreferredEncoding:](&v3, sel_setPreferredEncoding_);
}

- (BOOL)hasTemporaryUid
{
  return BYTE4(self->super._messageFlags) & 1;
}

- (void)setHasTemporaryUid:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (id)mailboxName
{
  id v2 = objc_msgSend(-[MFLibraryMessage library](self, "library"), "mailboxUidForMessage:", self);
  uint64_t v3 = (void *)[v2 account];
  return (id)[v3 nameForMailboxUid:v2];
}

- (int64_t)compareByUidWithMessage:(id)a3
{
  int v5 = HIDWORD(self->super._messageFlags) & 1;
  int v6 = [a3 hasTemporaryUid];
  int v7 = v5 - v6;
  if (v5 == v6)
  {
    unsigned int uid = self->_uid;
    int v7 = uid - [a3 uid];
  }
  BOOL v9 = v7 < 0;
  int64_t v10 = v7 != 0;
  if (v9) {
    return -1;
  }
  else {
    return v10;
  }
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
  self->super._messageFlags = a3;
}

- (void)setSummary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  -[MFMailMessage setSummary:](&v5, sel_setSummary_);
  objc_msgSend(-[MFLibraryMessage library](self, "library"), "setSummary:forMessage:", a3, self);
}

- (void)commit
{
  id v3 = [(MFLibraryMessage *)self library];
  unint64_t v4 = [(MFMailMessage *)self messageFlags];
  [v3 setFlags:v4 forMessage:self];
}

- (void)setMutableInfoFromMessage:(id)a3
{
  uint64_t v4 = [a3 messageFlags];
  [(MFLibraryMessage *)self setMessageFlagsWithoutCommitting:v4];
}

- (id)_privacySafeDescription
{
  v3.receiver = self;
  v3.super_class = (Class)MFLibraryMessage;
  return (id)objc_msgSend(-[MFMailMessage _privacySafeDescription](&v3, sel__privacySafeDescription), "stringByAppendingFormat:", @" libraryID=%u remoteID=%@", -[MFLibraryMessage libraryID](self, "libraryID"), -[MFLibraryMessage remoteID](self, "remoteID"));
}

- (id)path
{
  id v3 = [(MFLibraryMessage *)self library];
  return (id)[v3 dataPathForMessage:self];
}

- (id)dataPathForMimePart:(id)a3
{
  id v5 = [(MFLibraryMessage *)self messageStore];
  return (id)[v5 dataPathForMessage:self part:a3];
}

- (id)account
{
  id v3 = [(MFLibraryMessage *)self messageStore];
  if (+[MFLibraryStore sharedInstanceIfExists] == v3)
  {
    id v5 = [(MFLibraryMessage *)self library];
    return (id)[v5 accountForMessage:self];
  }
  else
  {
    return (id)[v3 account];
  }
}

- (void)markAsViewed
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 1) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageIsRead";
    v7[0] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsNotViewed
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(MFMailMessage *)self messageFlags])
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageIsRead";
    v7[0] = MEMORY[0x1E4F1CC28];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsFlagged
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x10) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageIsFlagged";
    v7[0] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsNotFlagged
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x10) != 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageIsFlagged";
    v7[0] = MEMORY[0x1E4F1CC28];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsReplied
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 4) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageWasRepliedTo";
    v7[0] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (void)markAsForwarded
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([(MFMailMessage *)self messageFlags] & 0x100) == 0)
  {
    id v3 = [(MFLibraryMessage *)self messageStore];
    int v6 = @"MessageWasForwarded";
    v7[0] = MEMORY[0x1E4F1CC38];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = self;
    objc_msgSend(v3, "setFlagsFromDictionary:forMessages:", v4, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v5, 1));
  }
}

- (id)preferredEmailAddressToReplyWith
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(+[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", objc_msgSend(-[MFLibraryMessage library](self, "library"), "urlForMailboxID:", -[MFLibraryMessage originalMailboxID](self, "originalMailboxID"))), "account");
  id v4 = +[MailAccount addressesThatReceivedMessage:self];
  uint64_t v5 = [v3 firstEmailAddress];
  if (!v5) {
    goto LABEL_30;
  }
  int v6 = (void *)v5;
  if ([v4 count] && (objc_msgSend(v4, "containsObject:", v6) & 1) == 0)
  {
    int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "emailAddressesAndAliasesList"), "mf_uncommentedAddressList"), "mutableCopy");
    [v7 removeObject:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v8)
    {

      goto LABEL_24;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v4 containsObject:v12])
        {
          int v6 = v12;
          if (([v7 containsObject:v12] & 1) == 0) {
            int v6 = (void *)[v3 defaultEmailAddress];
          }
          goto LABEL_15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
LABEL_15:

    if (!v6)
    {
LABEL_30:
      if (objc_msgSend(-[MFLibraryMessage mailbox](self, "mailbox"), "isOutgoingMailboxUid"))
      {
        v13 = (void *)[(MFLibraryMessage *)self senders];
        if ([v13 count])
        {
          v14 = v13;
LABEL_21:
          int v6 = (void *)[v14 objectAtIndex:0];
          goto LABEL_24;
        }
      }
      else if ([v4 count])
      {
        v14 = v4;
        goto LABEL_21;
      }
      int v6 = 0;
    }
  }
LABEL_24:
  if (objc_msgSend(v6, "isEqualToString:", objc_msgSend(v6, "mf_addressComment")))
  {
    uint64_t v15 = objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", v6), "fullUserName");
    if (v15) {
      return (id)objc_msgSend(NSString, "mf_formattedAddressWithName:email:useQuotes:", v15, v6, 1);
    }
  }
  return v6;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setRemoteID:(const char *)a3 flags:(unint64_t)a4 size:(unsigned int)a5 mailboxID:(unsigned int)a6 originalMailboxID:(unsigned int)a7
{
  if (a3)
  {

    self->_remoteID = (NSString *)[[NSString alloc] initWithUTF8String:a3];
    [(MFLibraryMessage *)self _updateUID];
  }
  self->super._messageFlags = a4;
  self->_size = a5;
  self->_mailboxID = a6;
  self->_uint64_t originalMailboxID = a7;
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MFLibraryMessage *)self library];
  [v7 setData:a3 forMessage:self isPartial:v4];
}

- (id)dataConsumerForMimePart:(id)a3
{
  id v5 = [(MFLibraryMessage *)self library];
  return (id)[v5 dataConsumerForMessage:self part:a3];
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (id)copyMessageInfo
{
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  id v3 = [(MFMailMessage *)&v5 copyMessageInfo];
  objc_msgSend(v3, "setUid:", -[MFLibraryMessage libraryID](self, "libraryID"));
  [v3 setMailboxID:self->_mailboxID];
  [v3 setUidIsLibraryID:1];
  return v3;
}

- (void)_initializeMetadata
{
  if (!self->_metadata)
  {
    self->_metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_metadataChangedKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  [(MFLock *)self->_metadataLock lock];
  metadata = self->_metadata;
  if (!metadata)
  {
    [(MFLibraryMessage *)self _initializeMetadata];
    metadata = self->_metadata;
  }
  [(NSMutableDictionary *)metadata setObject:a3 forKeyedSubscript:a4];
  uint64_t v8 = [(NSMutableSet *)self->_metadataChangedKeys count];
  [(NSMutableSet *)self->_metadataChangedKeys addObject:a4];
  [(MFLock *)self->_metadataLock unlock];
  if (!v8)
  {
    id v9 = [(MFLibraryMessage *)self library];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__MFLibraryMessage_setMetadataValue_forKey___block_invoke;
    v10[3] = &unk_1E6866660;
    v10[4] = self;
    [v9 updateMessage:self withMetadata:v10];
  }
}

void *__44__MFLibraryMessage_setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 304) lock];
  id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 296);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * i)), *(void *)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 296) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 304) unlock];
  return v2;
}

- (id)metadataValueOfClass:(Class)a3 forKey:(id)a4
{
  [(MFLock *)self->_metadataLock lock];
  metadata = self->_metadata;
  if (!metadata)
  {
    [(MFLibraryMessage *)self _initializeMetadata];
    metadata = self->_metadata;
  }
  uint64_t v8 = (void *)[(NSMutableDictionary *)metadata objectForKeyedSubscript:a4];
  if (!v8)
  {
    [(MFLock *)self->_metadataLock unlock];
    uint64_t v9 = objc_msgSend(-[MFLibraryMessage library](self, "library"), "metadataForMessage:ofClass:key:", self, a3, a4);
    [(MFLock *)self->_metadataLock lock];
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:a4];
    if (v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    if (!v10)
    {
      [(NSMutableDictionary *)self->_metadata setObject:v9 forKeyedSubscript:a4];
      uint64_t v8 = (void *)v9;
    }
  }
  [(MFLock *)self->_metadataLock unlock];
  return v8;
}

- (id)_attachmentStorageLocation
{
  if (![(id)MFUserAgent() isMobileMail]) {
    return 0;
  }
  id v3 = objc_msgSend((id)objc_msgSend(+[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", objc_msgSend(-[MFLibraryMessage library](self, "library"), "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID"))), "fullPath"), "stringByAppendingPathComponent:", @"Attachments");
  [(MFLibraryMessage *)self libraryID];
  uint64_t v4 = EFStringWithInt();
  return (id)[v3 stringByAppendingPathComponent:v4];
}

- (void)_forceLoadOfMessageSummaryFromProtectedStore
{
  id v4 = [(MFLibraryMessage *)self library];
  uint64_t v5 = (MFLibraryMessage *)objc_msgSend(v4, "messageWithLibraryID:options:inMailbox:", -[MFLibraryMessage libraryID](self, "libraryID"), 4111, objc_msgSend(v4, "urlForMailboxID:", -[MFLibraryMessage mailboxID](self, "mailboxID")));
  if (v5)
  {
    if (v5 != self) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"LibraryMessage.m", 532, @"Expected message %@ to be self %@", v5, self);
    }
  }
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  [(MFLibraryMessage *)self _forceLoadOfMessageSummaryFromProtectedStore];
  v5.receiver = self;
  v5.super_class = (Class)MFLibraryMessage;
  [(MFMailMessage *)&v5 loadCachedHeaderValuesFromHeaders:a3];
}

@end