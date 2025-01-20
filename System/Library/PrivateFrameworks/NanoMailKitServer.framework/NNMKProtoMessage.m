@interface NNMKProtoMessage
+ (Class)bccType;
+ (Class)ccType;
+ (Class)toType;
+ (id)protoMessageFromMessage:(id)a3 organizedByThread:(BOOL)a4 sanitizeMessageId:(BOOL)a5 supportsStandaloneMode:(BOOL)a6;
- (BOOL)hasAccountId;
- (BOOL)hasConversationId;
- (BOOL)hasDateReceived;
- (BOOL)hasDateSent;
- (BOOL)hasFrom;
- (BOOL)hasIsSpecialMailboxSpecific;
- (BOOL)hasIsThreadSpecific;
- (BOOL)hasMailboxId;
- (BOOL)hasMessageId;
- (BOOL)hasMessageIdHeader;
- (BOOL)hasNotificationMessageId;
- (BOOL)hasPublisherBulletinId;
- (BOOL)hasRemoteId;
- (BOOL)hasStatus;
- (BOOL)hasStatusVersion;
- (BOOL)hasSubject;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThreadSpecific;
- (BOOL)readFrom:(id)a3;
- (NSData)dateReceived;
- (NSData)dateSent;
- (NSMutableArray)bccs;
- (NSMutableArray)ccs;
- (NSMutableArray)tos;
- (NSString)accountId;
- (NSString)conversationId;
- (NSString)from;
- (NSString)mailboxId;
- (NSString)messageId;
- (NSString)messageIdHeader;
- (NSString)notificationMessageId;
- (NSString)publisherBulletinId;
- (NSString)remoteId;
- (NSString)subject;
- (id)bccAtIndex:(unint64_t)a3;
- (id)ccAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)toAtIndex:(unint64_t)a3;
- (unint64_t)bccsCount;
- (unint64_t)ccsCount;
- (unint64_t)hash;
- (unint64_t)tosCount;
- (unsigned)isSpecialMailboxSpecific;
- (unsigned)status;
- (unsigned)statusVersion;
- (void)addBcc:(id)a3;
- (void)addCc:(id)a3;
- (void)addTo:(id)a3;
- (void)clearBccs;
- (void)clearCcs;
- (void)clearTos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setBccs:(id)a3;
- (void)setCcs:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setFrom:(id)a3;
- (void)setHasIsSpecialMailboxSpecific:(BOOL)a3;
- (void)setHasIsThreadSpecific:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasStatusVersion:(BOOL)a3;
- (void)setIsSpecialMailboxSpecific:(unsigned int)a3;
- (void)setIsThreadSpecific:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setMessageIdHeader:(id)a3;
- (void)setNotificationMessageId:(id)a3;
- (void)setPublisherBulletinId:(id)a3;
- (void)setRemoteId:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setStatusVersion:(unsigned int)a3;
- (void)setSubject:(id)a3;
- (void)setTos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessage

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (void)setStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (void)clearTos
{
}

- (void)addTo:(id)a3
{
  id v4 = a3;
  tos = self->_tos;
  id v8 = v4;
  if (!tos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tos;
    self->_tos = v6;

    id v4 = v8;
    tos = self->_tos;
  }
  [(NSMutableArray *)tos addObject:v4];
}

- (unint64_t)tosCount
{
  return [(NSMutableArray *)self->_tos count];
}

- (id)toAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tos objectAtIndex:a3];
}

+ (Class)toType
{
  return (Class)objc_opt_class();
}

- (void)clearCcs
{
}

- (void)addCc:(id)a3
{
  id v4 = a3;
  ccs = self->_ccs;
  id v8 = v4;
  if (!ccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_ccs;
    self->_ccs = v6;

    id v4 = v8;
    ccs = self->_ccs;
  }
  [(NSMutableArray *)ccs addObject:v4];
}

- (unint64_t)ccsCount
{
  return [(NSMutableArray *)self->_ccs count];
}

- (id)ccAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ccs objectAtIndex:a3];
}

+ (Class)ccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateSent
{
  return self->_dateSent != 0;
}

- (BOOL)hasDateReceived
{
  return self->_dateReceived != 0;
}

- (BOOL)hasMessageIdHeader
{
  return self->_messageIdHeader != 0;
}

- (void)clearBccs
{
}

- (void)addBcc:(id)a3
{
  id v4 = a3;
  bccs = self->_bccs;
  id v8 = v4;
  if (!bccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_bccs;
    self->_bccs = v6;

    id v4 = v8;
    bccs = self->_bccs;
  }
  [(NSMutableArray *)bccs addObject:v4];
}

- (unint64_t)bccsCount
{
  return [(NSMutableArray *)self->_bccs count];
}

- (id)bccAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bccs objectAtIndex:a3];
}

+ (Class)bccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRemoteId
{
  return self->_remoteId != 0;
}

- (BOOL)hasNotificationMessageId
{
  return self->_notificationMessageId != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (void)setIsThreadSpecific:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isThreadSpecific = a3;
}

- (void)setHasIsThreadSpecific:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsThreadSpecific
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsSpecialMailboxSpecific:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSpecialMailboxSpecific = a3;
}

- (void)setHasIsSpecialMailboxSpecific:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSpecialMailboxSpecific
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPublisherBulletinId
{
  return self->_publisherBulletinId != 0;
}

- (void)setStatusVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_statusVersion = a3;
}

- (void)setHasStatusVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatusVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMessage;
  id v4 = [(NNMKProtoMessage *)&v8 description];
  v5 = [(NNMKProtoMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKey:@"messageId"];
  }
  accountId = self->_accountId;
  if (accountId) {
    [v4 setObject:accountId forKey:@"accountId"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v4 setObject:conversationId forKey:@"conversationId"];
  }
  subject = self->_subject;
  if (subject) {
    [v4 setObject:subject forKey:@"subject"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_status];
    [v4 setObject:v9 forKey:@"status"];
  }
  from = self->_from;
  if (from) {
    [v4 setObject:from forKey:@"from"];
  }
  tos = self->_tos;
  if (tos) {
    [v4 setObject:tos forKey:@"to"];
  }
  ccs = self->_ccs;
  if (ccs) {
    [v4 setObject:ccs forKey:@"cc"];
  }
  dateSent = self->_dateSent;
  if (dateSent) {
    [v4 setObject:dateSent forKey:@"dateSent"];
  }
  dateReceived = self->_dateReceived;
  if (dateReceived) {
    [v4 setObject:dateReceived forKey:@"dateReceived"];
  }
  messageIdHeader = self->_messageIdHeader;
  if (messageIdHeader) {
    [v4 setObject:messageIdHeader forKey:@"messageIdHeader"];
  }
  bccs = self->_bccs;
  if (bccs) {
    [v4 setObject:bccs forKey:@"bcc"];
  }
  remoteId = self->_remoteId;
  if (remoteId) {
    [v4 setObject:remoteId forKey:@"remoteId"];
  }
  notificationMessageId = self->_notificationMessageId;
  if (notificationMessageId) {
    [v4 setObject:notificationMessageId forKey:@"notificationMessageId"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v4 setObject:mailboxId forKey:@"mailboxId"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_isThreadSpecific];
    [v4 setObject:v21 forKey:@"isThreadSpecific"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v22 = [NSNumber numberWithUnsignedInt:self->_isSpecialMailboxSpecific];
    [v4 setObject:v22 forKey:@"isSpecialMailboxSpecific"];
  }
  publisherBulletinId = self->_publisherBulletinId;
  if (publisherBulletinId) {
    [v4 setObject:publisherBulletinId forKey:@"publisherBulletinId"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v24 = [NSNumber numberWithUnsignedInt:self->_statusVersion];
    [v4 setObject:v24 forKey:@"statusVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_messageId) {
    PBDataWriterWriteStringField();
  }
  if (self->_accountId) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_subject) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_from) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = self->_tos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = self->_ccs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  if (self->_dateSent) {
    PBDataWriterWriteDataField();
  }
  if (self->_dateReceived) {
    PBDataWriterWriteDataField();
  }
  if (self->_messageIdHeader) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = self->_bccs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  if (self->_remoteId) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationMessageId) {
    PBDataWriterWriteStringField();
  }
  if (self->_mailboxId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_publisherBulletinId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (self->_messageId)
  {
    objc_msgSend(v4, "setMessageId:");
    id v4 = v19;
  }
  if (self->_accountId)
  {
    objc_msgSend(v19, "setAccountId:");
    id v4 = v19;
  }
  if (self->_conversationId)
  {
    objc_msgSend(v19, "setConversationId:");
    id v4 = v19;
  }
  if (self->_subject)
  {
    objc_msgSend(v19, "setSubject:");
    id v4 = v19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_status;
    *((unsigned char *)v4 + 148) |= 2u;
  }
  if (self->_from) {
    objc_msgSend(v19, "setFrom:");
  }
  if ([(NNMKProtoMessage *)self tosCount])
  {
    [v19 clearTos];
    unint64_t v5 = [(NNMKProtoMessage *)self tosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMessage *)self toAtIndex:i];
        [v19 addTo:v8];
      }
    }
  }
  if ([(NNMKProtoMessage *)self ccsCount])
  {
    [v19 clearCcs];
    unint64_t v9 = [(NNMKProtoMessage *)self ccsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NNMKProtoMessage *)self ccAtIndex:j];
        [v19 addCc:v12];
      }
    }
  }
  if (self->_dateSent) {
    objc_msgSend(v19, "setDateSent:");
  }
  if (self->_dateReceived) {
    objc_msgSend(v19, "setDateReceived:");
  }
  if (self->_messageIdHeader) {
    objc_msgSend(v19, "setMessageIdHeader:");
  }
  if ([(NNMKProtoMessage *)self bccsCount])
  {
    [v19 clearBccs];
    unint64_t v13 = [(NNMKProtoMessage *)self bccsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(NNMKProtoMessage *)self bccAtIndex:k];
        [v19 addBcc:v16];
      }
    }
  }
  if (self->_remoteId) {
    objc_msgSend(v19, "setRemoteId:");
  }
  uint64_t v17 = v19;
  if (self->_notificationMessageId)
  {
    objc_msgSend(v19, "setNotificationMessageId:");
    uint64_t v17 = v19;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v19, "setMailboxId:");
    uint64_t v17 = v19;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v17[144] = self->_isThreadSpecific;
    v17[148] |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v17 + 16) = self->_isSpecialMailboxSpecific;
    v17[148] |= 1u;
  }
  if (self->_publisherBulletinId)
  {
    objc_msgSend(v19, "setPublisherBulletinId:");
    uint64_t v17 = v19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v17 + 31) = self->_statusVersion;
    v17[148] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_messageId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_accountId copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_conversationId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_subject copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_status;
    *(unsigned char *)(v5 + 148) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_from copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v16 = self->_tos;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTo:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v18);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v22 = self->_ccs;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCc:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v24);
  }

  uint64_t v28 = [(NSData *)self->_dateSent copyWithZone:a3];
  long long v29 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v28;

  uint64_t v30 = [(NSData *)self->_dateReceived copyWithZone:a3];
  long long v31 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v30;

  uint64_t v32 = [(NSString *)self->_messageIdHeader copyWithZone:a3];
  v33 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v32;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v34 = self->_bccs;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * k), "copyWithZone:", a3, (void)v50);
        [(id)v5 addBcc:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v36);
  }

  uint64_t v40 = [(NSString *)self->_remoteId copyWithZone:a3];
  v41 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v40;

  uint64_t v42 = [(NSString *)self->_notificationMessageId copyWithZone:a3];
  v43 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v42;

  uint64_t v44 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v45 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v44;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_isThreadSpecific;
    *(unsigned char *)(v5 + 148) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 64) = self->_isSpecialMailboxSpecific;
    *(unsigned char *)(v5 + 148) |= 1u;
  }
  uint64_t v47 = -[NSString copyWithZone:](self->_publisherBulletinId, "copyWithZone:", a3, (void)v50);
  v48 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v47;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_statusVersion;
    *(unsigned char *)(v5 + 148) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](subject, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_status != *((_DWORD *)v4 + 30)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    goto LABEL_55;
  }
  from = self->_from;
  if ((unint64_t)from | *((void *)v4 + 7) && !-[NSString isEqual:](from, "isEqual:")) {
    goto LABEL_55;
  }
  tos = self->_tos;
  if ((unint64_t)tos | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](tos, "isEqual:")) {
      goto LABEL_55;
    }
  }
  ccs = self->_ccs;
  if ((unint64_t)ccs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ccs, "isEqual:")) {
      goto LABEL_55;
    }
  }
  dateSent = self->_dateSent;
  if ((unint64_t)dateSent | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](dateSent, "isEqual:")) {
      goto LABEL_55;
    }
  }
  dateReceived = self->_dateReceived;
  if ((unint64_t)dateReceived | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](dateReceived, "isEqual:")) {
      goto LABEL_55;
    }
  }
  messageIdHeader = self->_messageIdHeader;
  if ((unint64_t)messageIdHeader | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](messageIdHeader, "isEqual:")) {
      goto LABEL_55;
    }
  }
  bccs = self->_bccs;
  if ((unint64_t)bccs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bccs, "isEqual:")) {
      goto LABEL_55;
    }
  }
  remoteId = self->_remoteId;
  if ((unint64_t)remoteId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](remoteId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  notificationMessageId = self->_notificationMessageId;
  if ((unint64_t)notificationMessageId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](notificationMessageId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](mailboxId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 8) == 0) {
      goto LABEL_55;
    }
    if (self->_isThreadSpecific)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_55;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 8) != 0)
  {
    goto LABEL_55;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_isSpecialMailboxSpecific != *((_DWORD *)v4 + 16)) {
      goto LABEL_55;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_55;
  }
  publisherBulletinId = self->_publisherBulletinId;
  if ((unint64_t)publisherBulletinId | *((void *)v4 + 13))
  {
    if (-[NSString isEqual:](publisherBulletinId, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_51;
    }
LABEL_55:
    BOOL v21 = 0;
    goto LABEL_56;
  }
LABEL_51:
  BOOL v21 = (*((unsigned char *)v4 + 148) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_statusVersion != *((_DWORD *)v4 + 31)) {
      goto LABEL_55;
    }
    BOOL v21 = 1;
  }
LABEL_56:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v22 = [(NSString *)self->_messageId hash];
  NSUInteger v21 = [(NSString *)self->_accountId hash];
  NSUInteger v20 = [(NSString *)self->_conversationId hash];
  NSUInteger v19 = [(NSString *)self->_subject hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v18 = 2654435761 * self->_status;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_from hash];
  uint64_t v16 = [(NSMutableArray *)self->_tos hash];
  uint64_t v15 = [(NSMutableArray *)self->_ccs hash];
  uint64_t v14 = [(NSData *)self->_dateSent hash];
  uint64_t v13 = [(NSData *)self->_dateReceived hash];
  NSUInteger v3 = [(NSString *)self->_messageIdHeader hash];
  uint64_t v4 = [(NSMutableArray *)self->_bccs hash];
  NSUInteger v5 = [(NSString *)self->_remoteId hash];
  NSUInteger v6 = [(NSString *)self->_notificationMessageId hash];
  NSUInteger v7 = [(NSString *)self->_mailboxId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isThreadSpecific;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v9 = 2654435761 * self->_isSpecialMailboxSpecific;
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:
  NSUInteger v10 = [(NSString *)self->_publisherBulletinId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_statusVersion;
  }
  else {
    uint64_t v11 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[NNMKProtoMessage setMessageId:](self, "setMessageId:");
  }
  if (*((void *)v4 + 1)) {
    -[NNMKProtoMessage setAccountId:](self, "setAccountId:");
  }
  if (*((void *)v4 + 4)) {
    -[NNMKProtoMessage setConversationId:](self, "setConversationId:");
  }
  if (*((void *)v4 + 16)) {
    -[NNMKProtoMessage setSubject:](self, "setSubject:");
  }
  if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[NNMKProtoMessage setFrom:](self, "setFrom:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *((id *)v4 + 17);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NNMKProtoMessage *)self addTo:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NNMKProtoMessage *)self addCc:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 6)) {
    -[NNMKProtoMessage setDateSent:](self, "setDateSent:");
  }
  if (*((void *)v4 + 5)) {
    -[NNMKProtoMessage setDateReceived:](self, "setDateReceived:");
  }
  if (*((void *)v4 + 11)) {
    -[NNMKProtoMessage setMessageIdHeader:](self, "setMessageIdHeader:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NNMKProtoMessage addBcc:](self, "addBcc:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 14)) {
    -[NNMKProtoMessage setRemoteId:](self, "setRemoteId:");
  }
  if (*((void *)v4 + 12)) {
    -[NNMKProtoMessage setNotificationMessageId:](self, "setNotificationMessageId:");
  }
  if (*((void *)v4 + 9)) {
    -[NNMKProtoMessage setMailboxId:](self, "setMailboxId:");
  }
  char v20 = *((unsigned char *)v4 + 148);
  if ((v20 & 8) != 0)
  {
    self->_isThreadSpecific = *((unsigned char *)v4 + 144);
    *(unsigned char *)&self->_has |= 8u;
    char v20 = *((unsigned char *)v4 + 148);
  }
  if (v20)
  {
    self->_isSpecialMailboxSpecific = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 13)) {
    -[NNMKProtoMessage setPublisherBulletinId:](self, "setPublisherBulletinId:");
  }
  if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    self->_statusVersion = *((_DWORD *)v4 + 31);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSMutableArray)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
}

- (NSMutableArray)ccs
{
  return self->_ccs;
}

- (void)setCcs:(id)a3
{
}

- (NSData)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
}

- (NSData)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
}

- (NSString)messageIdHeader
{
  return self->_messageIdHeader;
}

- (void)setMessageIdHeader:(id)a3
{
}

- (NSMutableArray)bccs
{
  return self->_bccs;
}

- (void)setBccs:(id)a3
{
}

- (NSString)remoteId
{
  return self->_remoteId;
}

- (void)setRemoteId:(id)a3
{
}

- (NSString)notificationMessageId
{
  return self->_notificationMessageId;
}

- (void)setNotificationMessageId:(id)a3
{
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (BOOL)isThreadSpecific
{
  return self->_isThreadSpecific;
}

- (unsigned)isSpecialMailboxSpecific
{
  return self->_isSpecialMailboxSpecific;
}

- (NSString)publisherBulletinId
{
  return self->_publisherBulletinId;
}

- (void)setPublisherBulletinId:(id)a3
{
}

- (unsigned)statusVersion
{
  return self->_statusVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_remoteId, 0);
  objc_storeStrong((id *)&self->_publisherBulletinId, 0);
  objc_storeStrong((id *)&self->_notificationMessageId, 0);
  objc_storeStrong((id *)&self->_messageIdHeader, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_ccs, 0);
  objc_storeStrong((id *)&self->_bccs, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

+ (id)protoMessageFromMessage:(id)a3 organizedByThread:(BOOL)a4 sanitizeMessageId:(BOOL)a5 supportsStandaloneMode:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = objc_alloc_init(NNMKProtoMessage);
  uint64_t v11 = [v9 messageId];
  uint64_t v12 = v11;
  if (v7)
  {
    uint64_t v13 = objc_msgSend(v11, "nnmk_sanitizedFileNameString");
    [(NNMKProtoMessage *)v10 setMessageId:v13];
  }
  else
  {
    [(NNMKProtoMessage *)v10 setMessageId:v11];
  }

  uint64_t v14 = [v9 accountId];
  [(NNMKProtoMessage *)v10 setAccountId:v14];

  if (a4)
  {
    id v15 = [v9 conversationId];
    [(NNMKProtoMessage *)v10 setConversationId:v15];
  }
  else
  {
    uint64_t v16 = NSString;
    id v15 = [v9 conversationId];
    uint64_t v17 = [v9 messageId];
    uint64_t v18 = [v16 stringWithFormat:@"%@|%@", v15, v17];
    [(NNMKProtoMessage *)v10 setConversationId:v18];
  }
  NSUInteger v19 = [v9 subject];
  [(NNMKProtoMessage *)v10 setSubject:v19];

  -[NNMKProtoMessage setStatus:](v10, "setStatus:", [v9 status]);
  -[NNMKProtoMessage setStatusVersion:](v10, "setStatusVersion:", [v9 statusVersion]);
  char v20 = [v9 from];
  [(NNMKProtoMessage *)v10 setFrom:v20];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v21 = [v9 to];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        [(NNMKProtoMessage *)v10 addTo:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v23);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v26 = [v9 cc];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v26);
        }
        [(NNMKProtoMessage *)v10 addCc:*(void *)(*((void *)&v51 + 1) + 8 * j)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v28);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v31 = [v9 bcc];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v31);
        }
        [(NNMKProtoMessage *)v10 addBcc:*(void *)(*((void *)&v47 + 1) + 8 * k)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v33);
  }

  uint64_t v36 = (void *)MEMORY[0x263F08910];
  uint64_t v37 = [v9 dateSent];
  v38 = [v36 archivedDataWithRootObject:v37 requiringSecureCoding:1 error:0];
  [(NNMKProtoMessage *)v10 setDateSent:v38];

  v39 = (void *)MEMORY[0x263F08910];
  uint64_t v40 = [v9 dateReceived];
  v41 = [v39 archivedDataWithRootObject:v40 requiringSecureCoding:1 error:0];
  [(NNMKProtoMessage *)v10 setDateReceived:v41];

  uint64_t v42 = [v9 messageIdHeader];
  [(NNMKProtoMessage *)v10 setMessageIdHeader:v42];

  v43 = [v9 mailboxId];
  [(NNMKProtoMessage *)v10 setMailboxId:v43];

  -[NNMKProtoMessage setIsThreadSpecific:](v10, "setIsThreadSpecific:", [v9 isThreadSpecific]);
  -[NNMKProtoMessage setIsSpecialMailboxSpecific:](v10, "setIsSpecialMailboxSpecific:", [v9 isSpecialMailboxSpecific]);
  if (a6)
  {
    uint64_t v44 = [v9 notificationMessageId];
    [(NNMKProtoMessage *)v10 setNotificationMessageId:v44];

    v45 = [v9 publisherBulletinId];
    [(NNMKProtoMessage *)v10 setPublisherBulletinId:v45];
  }
  else
  {
    v45 = [v9 publisherBulletinId];
    [(NNMKProtoMessage *)v10 setNotificationMessageId:v45];
  }

  return v10;
}

@end