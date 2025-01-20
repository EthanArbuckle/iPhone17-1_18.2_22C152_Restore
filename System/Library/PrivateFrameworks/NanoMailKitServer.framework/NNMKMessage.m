@interface NNMKMessage
+ (BOOL)checkStatus:(unint64_t)a3 stateToCheck:(unint64_t)a4;
+ (BOOL)isMessageURL:(id)a3;
+ (BOOL)messageHasMultipleRecipients:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)URLForMessageId:(id)a3;
+ (id)URLForMessageId:(id)a3 attachmentID:(id)a4;
+ (id)attachmentIdForURL:(id)a3;
+ (id)generateConversationIdWithAccountId:(id)a3 conversationId:(id)a4;
+ (id)generateMessageHashForMessage:(id)a3;
+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4;
+ (id)messageIdForURL:(id)a3;
+ (id)messageIdsFromMessages:(id)a3;
+ (id)serverIdsFromMessages:(id)a3;
+ (id)stringFromMailboxItemState:(unint64_t)a3;
+ (unint64_t)addState:(unint64_t)a3 toStatus:(unint64_t)a4;
+ (unint64_t)removeState:(unint64_t)a3 fromStatus:(unint64_t)a4;
- (BOOL)checkState:(unint64_t)a3;
- (BOOL)isThreadSpecific;
- (BOOL)replaceStandaloneNotification;
- (NNMKMessage)initWithCoder:(id)a3;
- (NSArray)bcc;
- (NSArray)cc;
- (NSArray)to;
- (NSDate)dateReceived;
- (NSDate)dateSent;
- (NSString)accountId;
- (NSString)conversationId;
- (NSString)description;
- (NSString)from;
- (NSString)mailboxId;
- (NSString)messageId;
- (NSString)messageIdHeader;
- (NSString)notificationMessageId;
- (NSString)preview;
- (NSString)publisherBulletinId;
- (NSString)serverId;
- (NSString)subject;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)isSpecialMailboxSpecific;
- (unint64_t)source;
- (unint64_t)status;
- (unint64_t)statusVersion;
- (unint64_t)visibleStatus;
- (void)addState:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeState:(unint64_t)a3;
- (void)setAccountId:(id)a3;
- (void)setBcc:(id)a3;
- (void)setCc:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setFrom:(id)a3;
- (void)setIsSpecialMailboxSpecific:(unint64_t)a3;
- (void)setIsThreadSpecific:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setMessageIdHeader:(id)a3;
- (void)setNotificationMessageId:(id)a3;
- (void)setPreview:(id)a3;
- (void)setPublisherBulletinId:(id)a3;
- (void)setReplaceStandaloneNotification:(BOOL)a3;
- (void)setServerId:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusVersion:(unint64_t)a3;
- (void)setSubject:(id)a3;
- (void)setTo:(id)a3;
- (void)setVisibleStatus:(unint64_t)a3;
@end

@implementation NNMKMessage

- (NSString)mailboxId
{
  mailboxId = (__CFString *)self->_mailboxId;
  if (!mailboxId) {
    mailboxId = @"-1";
  }
  v3 = mailboxId;
  return (NSString *)v3;
}

- (BOOL)checkState:(unint64_t)a3
{
  v5 = objc_opt_class();
  unint64_t v6 = [(NNMKMessage *)self status];
  return [v5 checkStatus:v6 stateToCheck:a3];
}

+ (BOOL)checkStatus:(unint64_t)a3 stateToCheck:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (id)stringFromMailboxItemState:(unint64_t)a3
{
  v4 = objc_opt_new();
  for (uint64_t i = 0; i != 2048; ++i)
  {
    if (!+[NNMKMessage checkStatus:a3 stateToCheck:i]) {
      continue;
    }
    if ((int)i > 31)
    {
      if ((int)i > 255)
      {
        switch(i)
        {
          case 0x400:
            unint64_t v6 = @"archived";
            break;
          case 0x200:
            unint64_t v6 = @"deleted";
            break;
          case 0x100:
            unint64_t v6 = @"junk";
            break;
          default:
            continue;
        }
      }
      else
      {
        switch(i)
        {
          case 0x20:
            unint64_t v6 = @"includesMe";
            break;
          case 0x40:
            unint64_t v6 = @"vipSender";
            break;
          case 0x80:
            unint64_t v6 = @"notify";
            break;
          default:
            continue;
        }
      }
    }
    else
    {
      unint64_t v6 = @"none";
      switch((int)i)
      {
        case 0:
          break;
        case 1:
          unint64_t v6 = @"unread";
          break;
        case 2:
          unint64_t v6 = @"replied";
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          continue;
        case 4:
          unint64_t v6 = @"forwarded";
          break;
        case 8:
          unint64_t v6 = @"flagged";
          break;
        default:
          if (i != 16) {
            continue;
          }
          unint64_t v6 = @"hasAttachments";
          break;
      }
    }
    if ([v4 length]) {
      [v4 appendFormat:@", %@", v6];
    }
    else {
      [v4 appendString:v6];
    }
  }
  return v4;
}

- (void)addState:(unint64_t)a3
{
  unint64_t v4 = [(NNMKMessage *)self status] | a3;
  [(NNMKMessage *)self setStatus:v4];
}

- (void)removeState:(unint64_t)a3
{
  if (-[NNMKMessage checkState:](self, "checkState:"))
  {
    unint64_t v5 = [(NNMKMessage *)self status] ^ a3;
    [(NNMKMessage *)self setStatus:v5];
  }
}

+ (unint64_t)removeState:(unint64_t)a3 fromStatus:(unint64_t)a4
{
  if ([a1 checkStatus:a4 stateToCheck:a3]) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = 0;
  }
  return v6 ^ a4;
}

+ (unint64_t)addState:(unint64_t)a3 toStatus:(unint64_t)a4
{
  return a4 | a3;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
  self->_visibleStatus = a3;
}

+ (BOOL)messageHasMultipleRecipients:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 to];
  uint64_t v5 = [v4 count];
  unint64_t v6 = [v3 cc];

  LOBYTE(v3) = (unint64_t)([v6 count] + v5) > 1;
  return (char)v3;
}

+ (BOOL)isMessageURL:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 scheme];
  if ([v4 isEqualToString:@"x-apple-mail"])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [v3 scheme];
    char v5 = [v6 isEqualToString:@"x-apple-mail-message-attachment"];
  }
  return v5;
}

+ (id)URLForMessageId:(id)a3
{
  id v3 = NSURL;
  unint64_t v4 = [NSString stringWithFormat:@"%@:%@", @"x-apple-mail", a3];
  char v5 = [v3 URLWithString:v4];

  return v5;
}

+ (id)URLForMessageId:(id)a3 attachmentID:(id)a4
{
  char v5 = (objc_class *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setScheme:@"x-apple-mail-message-attachment"];
  [v8 setHost:v7];

  v9 = (void *)[[NSString alloc] initWithFormat:@"/%@", v6];
  [v8 setPath:v9];

  v10 = [v8 URL];

  return v10;
}

+ (id)messageIdForURL:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"x-apple-mail"];

  if (v5)
  {
    uint64_t v6 = [v3 resourceSpecifier];
LABEL_5:
    v9 = (void *)v6;
    goto LABEL_7;
  }
  id v7 = [v3 scheme];
  int v8 = [v7 isEqualToString:@"x-apple-mail-message-attachment"];

  if (v8)
  {
    uint64_t v6 = [v3 host];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)attachmentIdForURL:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"x-apple-mail-message-attachment"];

  if (v5)
  {
    uint64_t v6 = [v3 lastPathComponent];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)generateMessageHashForMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 to];
  if (v4)
  {
    int v5 = [v3 to];
    if ([v5 count])
    {
      uint64_t v6 = [v3 to];
      id v7 = [v6 componentsJoinedByString:@"#"];
    }
    else
    {
      id v7 = &stru_26F11E918;
    }
  }
  else
  {
    id v7 = &stru_26F11E918;
  }

  int v8 = [v3 cc];
  if (v8)
  {
    v9 = [v3 cc];
    if ([v9 count])
    {
      v10 = [v3 cc];
      v11 = [v10 componentsJoinedByString:@"#"];
    }
    else
    {
      v11 = &stru_26F11E918;
    }
  }
  else
  {
    v11 = &stru_26F11E918;
  }

  v12 = [v3 bcc];
  if (v12)
  {
    v13 = [v3 bcc];
    if ([v13 count])
    {
      v14 = [v3 bcc];
      v15 = [v14 componentsJoinedByString:@"#"];
    }
    else
    {
      v15 = &stru_26F11E918;
    }
  }
  else
  {
    v15 = &stru_26F11E918;
  }

  v16 = NSString;
  v17 = [v3 mailboxId];
  v18 = [v3 from];
  v19 = [v3 dateSent];
  [v19 timeIntervalSinceReferenceDate];
  unint64_t v21 = (unint64_t)v20;
  v22 = [v3 dateReceived];
  [v22 timeIntervalSinceReferenceDate];
  v24 = [v16 stringWithFormat:@"%@#%@#%@#%@#%@#%lu#%lu", v17, v18, v7, v11, v15, v21, (unint64_t)v23];

  id v25 = v24;
  v26 = (const char *)[v25 UTF8String];
  CC_LONG v27 = strlen(v26);
  CC_SHA256(v26, v27, md);
  id v28 = objc_alloc_init(MEMORY[0x263F089D8]);
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v28, "appendFormat:", @"%02x", md[i]);

  return v28;
}

+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@;%@", a3, a4];
}

+ (id)generateConversationIdWithAccountId:(id)a3 conversationId:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@", a3, a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)NNMKMessage;
  int v5 = [(NNMKMessage *)&v52 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySubject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyDateReceived"];
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyPreview"];
    preview = v5->_preview;
    v5->_preview = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyStatus"];
    v5->_status = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyStatusVersion"];
    v5->_statusVersion = [v13 unsignedIntegerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySource"];
    v5->_source = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMailboxId"];
    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMessageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyServerId"];
    serverId = v5->_serverId;
    v5->_serverId = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountId"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyConversationId"];
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFrom"];
    from = v5->_from;
    v5->_from = (NSString *)v25;

    CC_LONG v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"kNSCodingKeyTo"];
    to = v5->_to;
    v5->_to = (NSArray *)v30;

    uint64_t v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"kNSCodingKeyCC"];
    cc = v5->_cc;
    v5->_cc = (NSArray *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"kNSCodingKeyBCC"];
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyDateSent"];
    dateSent = v5->_dateSent;
    v5->_dateSent = (NSDate *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMessageIdHeader"];
    messageIdHeader = v5->_messageIdHeader;
    v5->_messageIdHeader = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyNotificationMessageId"];
    notificationMessageId = v5->_notificationMessageId;
    v5->_notificationMessageId = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyPublishedBulletinId"];
    publisherBulletinId = v5->_publisherBulletinId;
    v5->_publisherBulletinId = (NSString *)v48;

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyReplaceStandaloneNotification"];
    v5->_replaceStandaloneNotification = [v50 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  subject = self->_subject;
  id v5 = a3;
  [v5 encodeObject:subject forKey:@"kNSCodingKeySubject"];
  [v5 encodeObject:self->_dateReceived forKey:@"kNSCodingKeyDateReceived"];
  [v5 encodeObject:self->_preview forKey:@"kNSCodingKeyPreview"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_status];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeyStatus"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_statusVersion];
  [v5 encodeObject:v7 forKey:@"kNSCodingKeyStatusVersion"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v5 encodeObject:v8 forKey:@"kNSCodingKeySource"];

  [v5 encodeObject:self->_messageId forKey:@"kNSCodingKeyMessageId"];
  [v5 encodeObject:self->_serverId forKey:@"kNSCodingKeyServerId"];
  [v5 encodeObject:self->_mailboxId forKey:@"kNSCodingKeyMailboxId"];
  [v5 encodeObject:self->_accountId forKey:@"kNSCodingKeyAccountId"];
  [v5 encodeObject:self->_conversationId forKey:@"kNSCodingKeyConversationId"];
  [v5 encodeObject:self->_from forKey:@"kNSCodingKeyFrom"];
  [v5 encodeObject:self->_to forKey:@"kNSCodingKeyTo"];
  [v5 encodeObject:self->_cc forKey:@"kNSCodingKeyCC"];
  [v5 encodeObject:self->_bcc forKey:@"kNSCodingKeyBCC"];
  [v5 encodeObject:self->_dateSent forKey:@"kNSCodingKeyDateSent"];
  [v5 encodeObject:self->_messageIdHeader forKey:@"kNSCodingKeyMessageIdHeader"];
  [v5 encodeObject:self->_notificationMessageId forKey:@"kNSCodingKeyNotificationMessageId"];
  [v5 encodeObject:self->_publisherBulletinId forKey:@"kNSCodingKeyPublishedBulletinId"];
  id v9 = [NSNumber numberWithBool:self->_replaceStandaloneNotification];
  [v5 encodeObject:v9 forKey:@"kNSCodingKeyReplaceStandaloneNotification"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NNMKMessage);
  id v5 = [(NNMKMessage *)self subject];
  uint64_t v6 = (void *)[v5 copy];
  [(NNMKMessage *)v4 setSubject:v6];

  id v7 = [(NNMKMessage *)self dateReceived];
  uint64_t v8 = (void *)[v7 copy];
  [(NNMKMessage *)v4 setDateReceived:v8];

  id v9 = [(NNMKMessage *)self preview];
  uint64_t v10 = (void *)[v9 copy];
  [(NNMKMessage *)v4 setPreview:v10];

  [(NNMKMessage *)v4 setStatus:[(NNMKMessage *)self status]];
  [(NNMKMessage *)v4 setStatusVersion:[(NNMKMessage *)self statusVersion]];
  v11 = [(NNMKMessage *)self messageId];
  v12 = (void *)[v11 copy];
  [(NNMKMessage *)v4 setMessageId:v12];

  v13 = [(NNMKMessage *)self serverId];
  v14 = (void *)[v13 copy];
  [(NNMKMessage *)v4 setServerId:v14];

  uint64_t v15 = [(NNMKMessage *)self mailboxId];
  v16 = (void *)[v15 copy];
  [(NNMKMessage *)v4 setMailboxId:v16];

  uint64_t v17 = [(NNMKMessage *)self accountId];
  v18 = (void *)[v17 copy];
  [(NNMKMessage *)v4 setAccountId:v18];

  uint64_t v19 = [(NNMKMessage *)self conversationId];
  double v20 = (void *)[v19 copy];
  [(NNMKMessage *)v4 setConversationId:v20];

  uint64_t v21 = [(NNMKMessage *)self from];
  v22 = (void *)[v21 copy];
  [(NNMKMessage *)v4 setFrom:v22];

  uint64_t v23 = [(NNMKMessage *)self to];
  v24 = (void *)[v23 copy];
  [(NNMKMessage *)v4 setTo:v24];

  uint64_t v25 = [(NNMKMessage *)self cc];
  v26 = (void *)[v25 copy];
  [(NNMKMessage *)v4 setCc:v26];

  CC_LONG v27 = [(NNMKMessage *)self bcc];
  uint64_t v28 = (void *)[v27 copy];
  [(NNMKMessage *)v4 setBcc:v28];

  v29 = [(NNMKMessage *)self dateSent];
  uint64_t v30 = (void *)[v29 copy];
  [(NNMKMessage *)v4 setDateSent:v30];

  v31 = [(NNMKMessage *)self messageIdHeader];
  uint64_t v32 = (void *)[v31 copy];
  [(NNMKMessage *)v4 setMessageIdHeader:v32];

  uint64_t v33 = [(NNMKMessage *)self notificationMessageId];
  v34 = (void *)[v33 copy];
  [(NNMKMessage *)v4 setNotificationMessageId:v34];

  [(NNMKMessage *)v4 setIsSpecialMailboxSpecific:[(NNMKMessage *)self isSpecialMailboxSpecific]];
  [(NNMKMessage *)v4 setIsThreadSpecific:[(NNMKMessage *)self isThreadSpecific]];
  [(NNMKMessage *)v4 setSource:[(NNMKMessage *)self source]];
  uint64_t v35 = [(NNMKMessage *)self publisherBulletinId];
  [(NNMKMessage *)v4 setPublisherBulletinId:v35];

  [(NNMKMessage *)v4 setReplaceStandaloneNotification:[(NNMKMessage *)self replaceStandaloneNotification]];
  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  conversationId = self->_conversationId;
  from = self->_from;
  subject = self->_subject;
  dateReceived = self->_dateReceived;
  messageId = self->_messageId;
  id v9 = +[NNMKMessage stringFromMailboxItemState:self->_status];
  uint64_t v10 = [v3 stringWithFormat:@"Message Id: %@\nConversation Id: %@\nFrom: %@\nSubject: %@\nDate Received: %@\nStatus: %@\n, status version: %lu\n, mailbox id: %@", messageId, conversationId, from, subject, dateReceived, v9, self->_statusVersion, self->_mailboxId];

  return (NSString *)v10;
}

+ (id)messageIdsFromMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "messageId", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)serverIdsFromMessages:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "serverId", (void)v14);

        if (v11)
        {
          long long v12 = [v10 serverId];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
}

- (NSString)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)serverId
{
  return self->_serverId;
}

- (void)setServerId:(id)a3
{
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (void)setMailboxId:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
}

- (NSString)messageIdHeader
{
  return self->_messageIdHeader;
}

- (void)setMessageIdHeader:(id)a3
{
}

- (NSString)notificationMessageId
{
  return self->_notificationMessageId;
}

- (void)setNotificationMessageId:(id)a3
{
}

- (NSString)publisherBulletinId
{
  return self->_publisherBulletinId;
}

- (void)setPublisherBulletinId:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(unint64_t)a3
{
  self->_statusVersion = a3;
}

- (BOOL)isThreadSpecific
{
  return self->_isThreadSpecific;
}

- (void)setIsThreadSpecific:(BOOL)a3
{
  self->_isThreadSpecific = a3;
}

- (unint64_t)isSpecialMailboxSpecific
{
  return self->_isSpecialMailboxSpecific;
}

- (void)setIsSpecialMailboxSpecific:(unint64_t)a3
{
  self->_isSpecialMailboxSpecific = a3;
}

- (unint64_t)visibleStatus
{
  return self->_visibleStatus;
}

- (void)setVisibleStatus:(unint64_t)a3
{
  self->_visibleStatus = a3;
}

- (BOOL)replaceStandaloneNotification
{
  return self->_replaceStandaloneNotification;
}

- (void)setReplaceStandaloneNotification:(BOOL)a3
{
  self->_replaceStandaloneNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherBulletinId, 0);
  objc_storeStrong((id *)&self->_notificationMessageId, 0);
  objc_storeStrong((id *)&self->_messageIdHeader, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_serverId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end