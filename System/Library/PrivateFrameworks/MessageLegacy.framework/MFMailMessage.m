@interface MFMailMessage
+ (Class)dataMessageStoreToUse;
+ (id)externalDataTypeIdentifiers;
+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3;
+ (unsigned)displayablePriorityForPriority:(int)a3;
+ (unsigned)validatePriority:(int)a3;
- (BOOL)answered;
- (BOOL)conversationMuted;
- (BOOL)conversationVIP;
- (BOOL)deleted;
- (BOOL)flagged;
- (BOOL)isKnownToHaveAttachments;
- (BOOL)isSearchResultWithBogusRemoteId;
- (BOOL)junk;
- (BOOL)read;
- (BOOL)senderVIP;
- (BOOL)shouldSetSummary;
- (BOOL)shouldUseMailDrop;
- (MFMailboxUid)mailbox;
- (NSString)ef_publicDescription;
- (id)URL;
- (id)_privacySafeDescription;
- (id)account;
- (id)bestAlternativePart;
- (id)bestAlternativePart:(BOOL *)a3;
- (id)copyMessageInfo;
- (id)externalConversationID;
- (id)globalMessageURL;
- (id)listUnsubscribe;
- (id)loadMeetingData;
- (id)loadMeetingExternalID;
- (id)loadMeetingMetadata;
- (id)mailMessageStore;
- (id)messageStore;
- (id)originalMailboxURL;
- (id)remoteMailboxURL;
- (int)priority;
- (unint64_t)conversationFlags;
- (unint64_t)messageFlags;
- (unint64_t)modSequenceNumber;
- (unint64_t)numberOfAttachments;
- (unsigned)libraryID;
- (void)dealloc;
- (void)loadCachedHeaderValuesFromHeaders:(id)a3;
- (void)markAsFlagged;
- (void)markAsForwarded;
- (void)markAsNotFlagged;
- (void)markAsNotViewed;
- (void)markAsReplied;
- (void)markAsViewed;
- (void)setMessageFlags:(unint64_t)a3;
- (void)setModSequenceNumber:(unint64_t)a3;
- (void)setMutableInfoFromMessage:(id)a3;
- (void)setPriorityFromHeaders:(id)a3;
- (void)setShouldUseMailDrop:(BOOL)a3;
- (void)setSummary:(id)a3;
@end

@implementation MFMailMessage

+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3
{
  if (a3) {
    return (id)[NSString stringWithFormat:@"\n\n%@", MFLookupLocalizedString(@"FORWARDED_MESSAGE_PREFIX", @"Begin forwarded message:\n\n", @"Delayed"];
  }
  return (id)MFLookupLocalizedString(@"FORWARDED_MESSAGE_PREFIX", @"Begin forwarded message:\n\n", @"Delayed");
}

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

- (id)messageStore
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailMessage;
  return [(MFMailMessage *)&v3 messageStore];
}

- (id)mailMessageStore
{
  id v2 = [(MFMailMessage *)self messageStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unint64_t)modSequenceNumber
{
  [(MFMailMessage *)self mf_lock];
  unint64_t modSequenceNumber = self->_modSequenceNumber;
  [(MFMailMessage *)self mf_unlock];
  return modSequenceNumber;
}

- (void)setModSequenceNumber:(unint64_t)a3
{
  [(MFMailMessage *)self mf_lock];
  self->_unint64_t modSequenceNumber = a3;
  [(MFMailMessage *)self mf_unlock];
}

- (unint64_t)messageFlags
{
  [(MFMailMessage *)self mf_lock];
  unint64_t messageFlags = self->_messageFlags;
  [(MFMailMessage *)self mf_unlock];
  return messageFlags;
}

- (void)setMessageFlags:(unint64_t)a3
{
  self->_unint64_t messageFlags = a3;
}

+ (unsigned)validatePriority:(int)a3
{
  if ((a3 - 6) >= 0xFFFFFFFB) {
    return a3;
  }
  else {
    return 3;
  }
}

+ (unsigned)displayablePriorityForPriority:(int)a3
{
  unsigned int v3 = [a1 validatePriority:*(void *)&a3];
  if (v3 == 4) {
    unsigned int v4 = 5;
  }
  else {
    unsigned int v4 = v3;
  }
  if (v3 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)setPriorityFromHeaders:(id)a3
{
  unsigned int v4 = (void *)[a3 firstHeaderForKey:*MEMORY[0x1E4F60770]];
  if (v4) {
    uint64_t v5 = (objc_msgSend((id)objc_opt_class(), "validatePriority:", objc_msgSend(v4, "intValue")) & 7) << 16;
  }
  else {
    uint64_t v5 = 196608;
  }
  unint64_t v6 = self->_messageFlags & 0xFFFFFFFFFFF8FFFFLL | v5;
  [(MFMailMessage *)self setMessageFlags:v6];
}

- (int)priority
{
  __int16 v2 = WORD1(self->_messageFlags);
  uint64_t v3 = v2 & 7;
  if ((v2 & 7) == 0) {
    -[MFMailMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "headersForMessage:fetchIfNotAvailable:", self, 0));
  }
  unsigned int v4 = objc_opt_class();
  return [v4 validatePriority:v3];
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailMessage;
  -[MFMailMessage loadCachedHeaderValuesFromHeaders:](&v7, sel_loadCachedHeaderValuesFromHeaders_);
  _MFLockGlobalLock();
  unint64_t v5 = self->_messageFlags & 0x70000;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F735B8]);
  _MFUnlockGlobalLock();
  if (v5)
  {
    if (v6) {
      return;
    }
LABEL_5:
    [a3 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
    [(MFMailMessage *)self setMessageIDHash:MFStringHashForMessageIDHeader()];
    return;
  }
  [(MFMailMessage *)self setPriorityFromHeaders:a3];
  if (!v6) {
    goto LABEL_5;
  }
}

- (void)markAsViewed
{
  if (([(MFMailMessage *)self messageFlags] & 1) == 0)
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] | 1;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (void)markAsNotViewed
{
  if ([(MFMailMessage *)self messageFlags])
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] & 0xFFFFFFFFFFFFFFFELL;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (void)markAsReplied
{
  if (([(MFMailMessage *)self messageFlags] & 4) == 0)
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] | 4;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (void)markAsForwarded
{
  if (([(MFMailMessage *)self messageFlags] & 0x100) == 0)
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] | 0x100;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (void)markAsFlagged
{
  if (([(MFMailMessage *)self messageFlags] & 0x10) == 0)
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] | 0x10;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (void)markAsNotFlagged
{
  if (([(MFMailMessage *)self messageFlags] & 0x10) != 0)
  {
    unint64_t v3 = [(MFMailMessage *)self messageFlags] & 0xFFFFFFFFFFFFFFEFLL;
    [(MFMailMessage *)self setMessageFlags:v3];
  }
}

- (MFMailboxUid)mailbox
{
  id v2 = [(MFMailMessage *)self messageStore];
  return (MFMailboxUid *)[v2 mailboxUid];
}

- (id)loadMeetingExternalID
{
  id v3 = [(MFMailMessage *)self messageStore];
  return (id)[v3 loadMeetingExternalIDForMessage:self];
}

- (id)loadMeetingData
{
  id v3 = [(MFMailMessage *)self messageStore];
  return (id)[v3 loadMeetingDataForMessage:self];
}

- (id)loadMeetingMetadata
{
  id v3 = [(MFMailMessage *)self mailMessageStore];
  return (id)[v3 loadMeetingMetadataForMessage:self];
}

- (id)_privacySafeDescription
{
  _MFLockGlobalLock();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F735B8]);
  _MFUnlockGlobalLock();
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F60F40]), "initWithHash:", -[MFMailMessage conversationID](self, "conversationID"));
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F60F40]) initWithHash:v3];
  uint64_t v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "ef_publicDescription");
  uint64_t v9 = objc_msgSend(v5, "ef_publicDescription");
  LODWORD(v10) = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F735B0]);
  return (id)[v6 stringWithFormat:@"<%@ %p> conversationID=%@ messageID=%@ received=%@", v7, self, v8, v9, objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)v10)];
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"))
  {
    return [(MFMailMessage *)self description];
  }
  else
  {
    return (NSString *)[(MFMailMessage *)self _privacySafeDescription];
  }
}

- (id)account
{
  id v2 = [(MFMailMessage *)self messageStore];
  return (id)[v2 account];
}

- (id)remoteMailboxURL
{
  return 0;
}

- (unint64_t)conversationFlags
{
  return 0;
}

- (id)originalMailboxURL
{
  id v2 = [(MFMailMessage *)self mailbox];
  return [(MFMailboxUid *)v2 URLString];
}

- (id)URL
{
  id v3 = [(MFMailMessage *)self account];
  return (id)[v3 URLForMessage:self];
}

- (id)globalMessageURL
{
  if (!self->_globalMessageURL)
  {
    id v3 = (void *)[(MFMailMessage *)self messageIDHeader];
    if ([v3 length])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v4 setScheme:@"message"];
      [v4 setPath:v3];
      self->_globalMessageURL = (NSURL *)objc_msgSend((id)objc_msgSend(v4, "URL"), "copy");
    }
  }
  return self->_globalMessageURL;
}

- (unint64_t)numberOfAttachments
{
  unsigned int v2 = (unsigned __int16)[(MFMailMessage *)self messageFlags] >> 10;
  if (v2 == 63) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)setMutableInfoFromMessage:(id)a3
{
  uint64_t v4 = [a3 messageFlags];
  [(MFMailMessage *)self setMessageFlags:v4];
}

- (void)setSummary:(id)a3
{
  _MFLockGlobalLock();
  uint64_t v5 = (int)*MEMORY[0x1E4F735C0];
  id v6 = *(Class *)((char *)&self->super.super.isa + v5);
  if (v6 != a3)
  {

    *(Class *)((char *)&self->super.super.isa + v5) = (Class)a3;
  }
  _MFUnlockGlobalLock();
}

- (BOOL)shouldSetSummary
{
  int v3 = objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "shouldSetSummaryForMessage:", self);
  if (v3) {
    LOBYTE(v3) = [(MFMailMessage *)self summary] == 0;
  }
  return v3;
}

- (id)copyMessageInfo
{
  info = self->_info;
  if (!info)
  {
    info = objc_alloc_init(MFMessageInfo);
    self->_info = info;
  }
  [(MFMessageInfo *)info setUid:self];
  [(MFMailMessage *)self dateReceivedAsTimeIntervalSince1970];
  [(MFMessageInfo *)self->_info setDateReceivedInterval:v4];
  [(MFMailMessage *)self dateSentAsTimeIntervalSince1970];
  [(MFMessageInfo *)self->_info setDateSentInterval:v5];
  [(MFMessageInfo *)self->_info setUidIsLibraryID:0];
  [(MFMessageInfo *)self->_info setConversationHash:[(MFMailMessage *)self conversationID]];
  [(MFMessageInfo *)self->_info setMessageIDHash:[(MFMailMessage *)self messageIDHash]];
  [(MFMessageInfo *)self->_info setIsVIP:(self->_messageFlags >> 24) & 1];
  [(MFMessageInfo *)self->_info setRead:self->_messageFlags & 1];
  [(MFMessageInfo *)self->_info setFlagged:(self->_messageFlags >> 4) & 1];
  int messageFlags = self->_messageFlags;
  if ((unsigned __int16)messageFlags >> 10) {
    BOOL v7 = (unsigned __int16)messageFlags >> 10 != 63;
  }
  else {
    BOOL v7 = 0;
  }
  [(MFMessageInfo *)self->_info setKnownToHaveAttachments:v7];
  uint64_t v8 = self->_info;
  return v8;
}

- (id)externalConversationID
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailMessage;
  [(MFMailMessage *)&v3 dealloc];
}

- (id)bestAlternativePart
{
  return [(MFMailMessage *)self bestAlternativePart:0];
}

- (id)bestAlternativePart:(BOOL *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  double v5 = (void *)[(MFMailMessage *)self messageBodyIfAvailableUpdatingFlags:0];
  if (v5)
  {
    uint64_t v6 = [v5 topLevelPart];
    BOOL v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    BOOL v10 = 1;
    do
    {
      if (!v10)
      {
        BOOL v7 = (void *)[v9 contentToOffset:1 resultOffset:&v28 downloadIfNecessary:0 asHTML:1 isComplete:a3];
        uint64_t v8 = v9;
      }
      uint64_t v11 = [(MFMailMessage *)self bestAlternativeInPart:v6];
      uint64_t v9 = (void *)v11;
      BOOL v10 = v11 == 0;
    }
    while (!v11 || (void *)v11 != v8);
  }
  else
  {
    BOOL v7 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  v14 = 0;
  uint64_t v15 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v25 != v15) {
        objc_enumerationMutation(v7);
      }
      v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 htmlData])
      {
        int v18 = [v17 preferredEncoding];
        uint64_t v19 = MFCreateStringWithData();
        v20 = (void *)v19;
        if (v18 != -1 && v19 == 0) {
          v20 = (void *)MFCreateStringWithData();
        }
        if (v20)
        {
          if (v14) {
            id v22 = (id)[v14 stringByAppendingString:v20];
          }
          else {
            id v22 = v20;
          }
          v14 = v22;
        }
      }
    }
    uint64_t v13 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  }
  while (v13);
  return v14;
}

- (BOOL)isSearchResultWithBogusRemoteId
{
  return (~[(MFMailMessage *)self messageFlags] & 0x100000080) == 0;
}

+ (id)externalDataTypeIdentifiers
{
  unsigned int v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"com.apple.mail.email"];
  [v2 addObject:*MEMORY[0x1E4F225B0]];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F29230], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  }
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1CB10], "writableTypeIdentifiersForItemProvider"));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F28B18], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  }
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(NSString, "writableTypeIdentifiersForItemProvider"));
  return v2;
}

- (BOOL)shouldUseMailDrop
{
  return self->_shouldUseMailDrop;
}

- (void)setShouldUseMailDrop:(BOOL)a3
{
  self->_shouldUseMailDrop = a3;
}

- (id)listUnsubscribe
{
  unsigned int v2 = (void *)[(MFMailMessage *)self headers];
  return (id)[v2 listUnsubscribeCommands];
}

- (BOOL)flagged
{
  return ([(MFMailMessage *)self messageFlags] >> 4) & 1;
}

- (BOOL)read
{
  return [(MFMailMessage *)self messageFlags] & 1;
}

- (BOOL)answered
{
  return ([(MFMailMessage *)self messageFlags] >> 2) & 1;
}

- (BOOL)junk
{
  return ([(MFMailMessage *)self messageFlags] >> 21) & 1;
}

- (BOOL)senderVIP
{
  return ([(MFMailMessage *)self messageFlags] >> 24) & 1;
}

- (BOOL)conversationVIP
{
  return [(MFMailMessage *)self conversationFlags] & 1;
}

- (BOOL)conversationMuted
{
  return ([(MFMailMessage *)self conversationFlags] >> 1) & 1;
}

- (BOOL)deleted
{
  return ([(MFMailMessage *)self messageFlags] >> 1) & 1;
}

- (BOOL)isKnownToHaveAttachments
{
  unsigned __int16 v2 = [(MFMailMessage *)self messageFlags];
  return v2 >> 10 && v2 >> 10 != 63;
}

- (unsigned)libraryID
{
  return -1;
}

@end