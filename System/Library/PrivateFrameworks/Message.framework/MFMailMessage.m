@interface MFMailMessage
+ (Class)dataMessageStoreToUse;
+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3;
+ (id)globalMessageURLWithMessageIDHeader:(id)a3;
+ (unsigned)displayablePriorityForPriority:(int)a3;
+ (unsigned)validatePriority:(int)a3;
- (BOOL)answered;
- (BOOL)conversationMuted;
- (BOOL)conversationVIP;
- (BOOL)deleted;
- (BOOL)flagged;
- (BOOL)isPartOfExistingThread;
- (BOOL)isSearchResultWithBogusRemoteId;
- (BOOL)isServerSearchResult;
- (BOOL)junk;
- (BOOL)read;
- (BOOL)shouldSetSummary;
- (BOOL)shouldUseMailDrop;
- (BOOL)sourceIsManaged;
- (ECMessageFlags)flags;
- (ECMimeBody)mimeBody;
- (MFMailMessageStore)messageStore;
- (MFMailboxUid)mailbox;
- (MailAccount)account;
- (NSArray)listUnsubscribe;
- (NSArray)references;
- (NSDictionary)headersDictionary;
- (NSSet)labels;
- (id)URL;
- (id)_bestAlternativePartContent:(BOOL *)a3;
- (id)bestAlternativePart;
- (id)bestAlternativePart:(BOOL *)a3;
- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4;
- (id)externalConversationID;
- (id)followUp;
- (id)globalMessageURL;
- (id)loadMeetingData;
- (id)loadMeetingExternalID;
- (id)loadMeetingMetadata;
- (id)mailMessageStore;
- (id)originalMailboxURL;
- (id)preferredAccountToUseForReplying;
- (id)preferredEmailAddressToReplyWith;
- (id)readLater;
- (id)remoteMailboxURL;
- (id)sendLaterDate;
- (id)storageLocationForAttachment:(id)a3;
- (int64_t)libraryID;
- (int64_t)priority;
- (unint64_t)conversationFlags;
- (unint64_t)messageFlags;
- (unint64_t)modSequenceNumber;
- (unint64_t)numberOfAttachments;
- (void)loadCachedHeaderValuesFromHeaders:(id)a3;
- (void)markAsFlagged;
- (void)markAsForwarded;
- (void)markAsNotFlagged;
- (void)markAsNotViewed;
- (void)markAsReplied;
- (void)markAsViewed;
- (void)setIsServerSearchResult:(BOOL)a3;
- (void)setMessageFlags:(unint64_t)a3;
- (void)setModSequenceNumber:(unint64_t)a3;
- (void)setMutableInfoFromMessage:(id)a3;
- (void)setPriorityFromHeaders:(id)a3;
- (void)setShouldUseMailDrop:(BOOL)a3;
- (void)setSourceIsManaged:(BOOL)a3;
- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11;
- (void)setSummary:(id)a3;
@end

@implementation MFMailMessage

- (MFMailMessageStore)messageStore
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessage;
  v2 = [(MFMailMessage *)&v4 messageStore];
  return (MFMailMessageStore *)v2;
}

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11
{
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessage;
  [(MFMailMessage *)&v12 setSubject:a3 to:a4 cc:a5 bcc:a6 sender:a7 dateReceived:a10 dateSent:a8 summary:a9 withOptions:a11];
}

- (void).cxx_destruct
{
}

- (BOOL)isPartOfExistingThread
{
  v3 = [(MFMailMessage *)self headersIfAvailable];
  char v4 = [v3 hasHeaderForKey:*MEMORY[0x1E4F606C8]];

  if (v4) {
    return 1;
  }
  v6 = [(MFMailMessage *)self subject];
  char v5 = [v6 hasReplyPrefix];

  return v5;
}

- (NSDictionary)headersDictionary
{
  v2 = [(MFMailMessage *)self headersIfAvailable];
  v3 = [v2 headersDictionary];

  return (NSDictionary *)v3;
}

- (ECMessageFlags)flags
{
  uint64_t v2 = [(MFMailMessage *)self messageFlags];
  return (ECMessageFlags *)MFFlagsObjectForFlags(v2);
}

- (unint64_t)messageFlags
{
  [(MFMailMessage *)self mf_lock];
  unint64_t messageFlags = self->_messageFlags;
  [(MFMailMessage *)self mf_unlock];
  return messageFlags;
}

- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v5 = [(MFMailMessage *)self _bestAlternativePartContent:a3];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke;
  aBlock[3] = &unk_1E5D3C400;
  aBlock[4] = &v24;
  aBlock[5] = a4;
  v6 = _Block_copy(aBlock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v11 isVisuallyEmpty] & 1) == 0)
        {
          objc_super v12 = [v11 htmlData];
          if (v12)
          {
            int v13 = [v11 preferredEncoding];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke_2;
            v16[3] = &unk_1E5D3C428;
            id v17 = v6;
            int v18 = v13;
            objc_msgSend(v12, "ef_enumerateSubdataOfSize:usingBlock:", 0x80000, v16);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v8);
  }

  id v14 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (id)_bestAlternativePartContent:(BOOL *)a3
{
  uint64_t v16 = 0;
  char v5 = [(MFMailMessage *)self messageBodyIfAvailableUpdatingFlags:0];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 topLevelPart];
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    v10 = 0;
    BOOL v11 = 1;
    while (1)
    {
      if (!v11)
      {
        uint64_t v12 = [v9 contentToOffset:1 resultOffset:&v16 downloadIfNecessary:0 asHTML:1 isComplete:a3];

        id v13 = v9;
        v10 = (void *)v12;
        uint64_t v8 = v13;
      }
      uint64_t v14 = [(MFMailMessage *)self bestAlternativeInPart:v7];

      BOOL v11 = v14 == 0;
      uint64_t v9 = (void *)v14;
      if (v14)
      {
        uint64_t v9 = (void *)v14;
        if ((void *)v14 == v8) {
          break;
        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 16))(v4, [v5 bytes], objc_msgSend(v5, "length"), *(unsigned int *)(a1 + 40));
}

void __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v6 = (void *)MEMORY[0x1AD0E3E00]();
  uint64_t v7 = MFCreateStringWithBytes();
  uint64_t v8 = (void *)v7;
  if (a4 != -1 && !v7) {
    uint64_t v8 = (void *)MFCreateStringWithBytes();
  }
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "mf_dataUsingEncoding:", *(void *)(a1 + 40));
    v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v10)
    {
      [v10 appendData:v9];
    }
    else
    {
      uint64_t v11 = [v9 mutableCopy];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

- (id)URL
{
  id v3 = [(MFMailMessage *)self account];
  uint64_t v4 = [v3 URLForMessage:self];

  return v4;
}

+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3
{
  if (a3)
  {
    id v3 = NSString;
    uint64_t v4 = MFLookupLocalizedString(@"FORWARDED_MESSAGE_PREFIX", @"Begin forwarded message:\n\n", @"Delayed");
    id v5 = [v3 stringWithFormat:@"\n\n%@", v4];
  }
  else
  {
    id v5 = MFLookupLocalizedString(@"FORWARDED_MESSAGE_PREFIX", @"Begin forwarded message:\n\n", @"Delayed");
  }
  return v5;
}

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

- (id)mailMessageStore
{
  uint64_t v2 = [(MFMailMessage *)self messageStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
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

- (BOOL)isServerSearchResult
{
  return ([(MFMailMessage *)self messageFlags] >> 7) & 1;
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
  id v5 = [a3 firstHeaderForKey:*MEMORY[0x1E4F60770]];
  if (v5) {
    char v4 = objc_msgSend((id)objc_opt_class(), "validatePriority:", objc_msgSend(v5, "intValue"));
  }
  else {
    char v4 = 3;
  }
  [(MFMailMessage *)self setMessageFlags:self->_messageFlags & 0xFFFFFFFFFFF8FFFFLL | ((v4 & 7) << 16)];
}

- (int64_t)priority
{
  __int16 v3 = WORD1(self->_messageFlags);
  uint64_t v4 = v3 & 7;
  if ((v3 & 7) == 0)
  {
    id v5 = [(MFMailMessage *)self messageStore];
    v6 = [v5 headersForMessage:self fetchIfNotAvailable:0];
    [(MFMailMessage *)self loadCachedHeaderValuesFromHeaders:v6];
  }
  return [(id)objc_opt_class() validatePriority:v4];
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMailMessage;
  [(MFMailMessage *)&v8 loadCachedHeaderValuesFromHeaders:v4];
  _MFLockGlobalLock();
  unint64_t messageFlags = self->_messageFlags;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F735B8]);
  _MFUnlockGlobalLock();
  if ((messageFlags & 0x70000) == 0) {
    [(MFMailMessage *)self setPriorityFromHeaders:v4];
  }
  if (!v6)
  {
    uint64_t v7 = [v4 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
    [(MFMailMessage *)self setMessageIDHash:MFStringHashForMessageIDHeader()];
  }
}

- (void)setIsServerSearchResult:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFMailMessage *)self isServerSearchResult] != a3)
  {
    unint64_t v5 = [(MFMailMessage *)self messageFlags] & 0xFFFFFFFFFFFFFF7FLL;
    uint64_t v6 = 128;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MFMailMessage *)self setMessageFlags:v5 | v6];
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
  uint64_t v2 = [(MFMailMessage *)self messageStore];
  unint64_t v3 = [v2 mailbox];

  return (MFMailboxUid *)v3;
}

- (id)preferredAccountToUseForReplying
{
  uint64_t v2 = [(MFMailMessage *)self mailbox];
  unint64_t v3 = [v2 account];

  return v3;
}

- (id)preferredEmailAddressToReplyWith
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MFMailMessage *)self preferredAccountToUseForReplying];
  id v4 = off_1E5D3A000;
  unint64_t v5 = +[MailAccount addressesThatReceivedMessage:self];
  uint64_t v6 = [v3 firstEmailAddress];
  if (!v6) {
    goto LABEL_20;
  }
  if (![v5 count] || (objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
  {
    uint64_t v7 = v6;
    goto LABEL_29;
  }
  objc_super v8 = [v3 emailAddressesAndAliasesList];
  uint64_t v9 = objc_msgSend(v8, "ef_map:", &__block_literal_global_14);
  v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:v6];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v12)
  {
    id v17 = v11;
    uint64_t v7 = v6;
    goto LABEL_27;
  }
  uint64_t v13 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v11);
      }
      v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      if (objc_msgSend(v5, "containsObject:", v15, (void)v32))
      {
        id v4 = off_1E5D3A000;
        if ([v11 containsObject:v15])
        {
          id v16 = v15;
        }
        else
        {
          id v16 = [v3 defaultEmailAddress];
        }
        uint64_t v7 = v16;

        goto LABEL_19;
      }
    }
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  uint64_t v7 = v6;
  id v4 = off_1E5D3A000;
LABEL_19:

  if (!v7)
  {
LABEL_20:
    id v17 = [(MFMailMessage *)self mailbox];
    if (![v17 isOutgoingMailboxUid])
    {
      if ([v5 count])
      {
        uint64_t v7 = [v5 objectAtIndex:0];
      }
      else
      {
        uint64_t v7 = 0;
      }
      goto LABEL_28;
    }
    id v11 = [(MFMailMessage *)self senders];
    if ([v11 count])
    {
      uint64_t v7 = [v11 objectAtIndex:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_27:

LABEL_28:
  }
LABEL_29:
  id v18 = v7;
  long long v19 = [v18 emailAddressValue];
  long long v20 = [v19 displayName];
  long long v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [v18 stringValue];
  }
  v23 = v22;

  int v24 = [v18 isEqualToString:v23];
  if (v24)
  {
    v25 = [(__objc2_class *)v4[187] accountContainingEmailAddress:v18];
    uint64_t v26 = [v25 fullUserName];

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E4F60800];
      v28 = [v18 emailAddressValue];
      id v29 = [v27 componentsWithEmailAddress:v28];

      [v29 setDisplayName:v26];
      uint64_t v30 = [v29 stringValue];

      id v18 = (id)v30;
    }
  }
  return v18;
}

id __49__MFMailMessage_preferredEmailAddressToReplyWith__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)loadMeetingExternalID
{
  unint64_t v3 = [(MFMailMessage *)self mailMessageStore];
  id v4 = [v3 loadMeetingExternalIDForMessage:self];

  return v4;
}

- (id)loadMeetingData
{
  unint64_t v3 = [(MFMailMessage *)self mailMessageStore];
  id v4 = [v3 loadMeetingDataForMessage:self];

  return v4;
}

- (id)loadMeetingMetadata
{
  unint64_t v3 = [(MFMailMessage *)self mailMessageStore];
  id v4 = [v3 loadMeetingMetadataForMessage:self];

  return v4;
}

- (MailAccount)account
{
  id v2 = [(MFMailMessage *)self messageStore];
  unint64_t v3 = [v2 account];

  return (MailAccount *)v3;
}

- (BOOL)sourceIsManaged
{
  if (self->_useInternalSourceIsManaged) {
    return self->_sourceIsManaged;
  }
  id v4 = [(MFMailMessage *)self account];
  int v5 = [v4 isLocalAccount];

  if (v5)
  {
    id v6 = [(MFMailMessage *)self mailbox];
    uint64_t v7 = [v6 representedAccount];
    char v3 = [v7 sourceIsManaged];
  }
  else
  {
    id v6 = [(MFMailMessage *)self account];
    char v3 = [v6 sourceIsManaged];
  }

  return v3;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
  self->_useInternalSourceIsManaged = 1;
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
  char v3 = [v2 URLString];

  return v3;
}

- (id)globalMessageURL
{
  _MFLockGlobalLock();
  p_globalMessageURL = &self->_globalMessageURL;
  id v4 = self->_globalMessageURL;
  _MFUnlockGlobalLock();
  if (!v4)
  {
    int v5 = objc_opt_class();
    id v6 = [(MFMailMessage *)self messageIDHeader];
    id v4 = [v5 globalMessageURLWithMessageIDHeader:v6];

    if (v4)
    {
      _MFLockGlobalLock();
      objc_storeStrong((id *)p_globalMessageURL, v4);
      _MFUnlockGlobalLock();
    }
  }
  return v4;
}

+ (id)globalMessageURLWithMessageIDHeader:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v4 setScheme:*MEMORY[0x1E4F5FD90]];
    int v5 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v6 = (void *)[v5 mutableCopy];

    [v6 removeCharactersInString:@"/"];
    uint64_t v7 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v6];
    [v4 setPercentEncodedPath:v7];

    objc_super v8 = [v4 URL];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
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
  id v4 = a3;
  -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", [v4 messageFlags]);
}

- (void)setSummary:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F735C0]), a3);
  _MFUnlockGlobalLock();
}

- (BOOL)shouldSetSummary
{
  unsigned int v2 = [(MFMailMessage *)self summary];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)externalConversationID
{
  return 0;
}

- (id)bestAlternativePart
{
  return [(MFMailMessage *)self bestAlternativePart:0];
}

- (id)bestAlternativePart:(BOOL *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MFMailMessage *)self _bestAlternativePartContent:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "isVisuallyEmpty", (void)v13) & 1) == 0)
        {
          uint64_t v9 = [v8 htmlData];
          if (v9)
          {
            int v10 = [v8 preferredEncoding];
            id v11 = (void *)MFCreateStringWithData();
            if (!v11 && v10 != -1) {
              id v11 = (void *)MFCreateStringWithData();
            }
            if (v11)
            {
              if (v4)
              {
                [v4 appendString:v11];
              }
              else
              {
                id v4 = [MEMORY[0x1E4F28E78] stringWithString:v11];
              }
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v4;
}

- (BOOL)isSearchResultWithBogusRemoteId
{
  return (~[(MFMailMessage *)self messageFlags] & 0x100000080) == 0;
}

- (id)storageLocationForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailMessage *)self messageStore];
  uint64_t v6 = [v5 storageLocationForAttachment:v4 withMessage:self];

  return v6;
}

- (NSArray)listUnsubscribe
{
  unsigned int v2 = [(MFMailMessage *)self headers];
  id v3 = [v2 listUnsubscribeCommands];

  return (NSArray *)v3;
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

- (BOOL)conversationVIP
{
  return [(MFMailMessage *)self conversationFlags] & 1;
}

- (BOOL)conversationMuted
{
  return ([(MFMailMessage *)self conversationFlags] >> 2) & 1;
}

- (ECMimeBody)mimeBody
{
  return 0;
}

- (NSArray)references
{
  unsigned int v2 = [(MFMailMessage *)self headersIfAvailable];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v4 = [v2 references];
    [v3 addObjectsFromArray:v4];

    uint64_t v5 = [v2 headersForKey:*MEMORY[0x1E4F606C8]];
    if (v5) {
      [v3 addObjectsFromArray:v5];
    }
    uint64_t v6 = [v3 array];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSSet)labels
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)deleted
{
  return ([(MFMailMessage *)self messageFlags] >> 1) & 1;
}

- (int64_t)libraryID
{
  return *MEMORY[0x1E4F5FCC8];
}

- (id)readLater
{
  return 0;
}

- (id)sendLaterDate
{
  return 0;
}

- (id)followUp
{
  return 0;
}

- (BOOL)shouldUseMailDrop
{
  return self->_shouldUseMailDrop;
}

- (void)setShouldUseMailDrop:(BOOL)a3
{
  self->_shouldUseMailDrop = a3;
}

@end